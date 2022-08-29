 ### OVF? OVA? VMDK? – File Formats and Tools for Virtualization

I recently worked on a project to create a “virtual appliance” for one of our customers. They have an server application that they would like to distribute to their customers along with some new devices, and a virtual appliance is a good way to do that in a reliable fashion.

Virtual Appliances may or may not have full-blown operating systems supporting the applications, but the key thing is that they are able to run directly on a hypervisor (VMWare ESX, XenServer, Hyper-V, etc.). You may have heard that GitHub has a product called “GitHub Enterprise” that allows a business to deploy their own copy of the GitHub platform within their network; GitHub Enterprise is distributed as virtual appliance.

One of the problems we needed to solve for our customer was how to package and distribute the appliance. We quickly determined that an OVF or “Open Virtualization Format”-based approach had the potential to give us the greatest portability, and I set to work figuring out how to implement it. Our build process made use of VeeWee, Vagrant, and Chef. We knew we could export some kind of appliance.box package compatible with VirtualBox from Vagrant, but how this related to OVF wasn’t clear.

I’d like to share a few of the things I learned. This is not by any means a comprehensive guide or list to the vast world of virtualization technology, but hopefully it can save someone else some time in making sense of this portion of the virtualization ecosystem.
File Formats for Virtual Machines
Open Virtualization Format (OVF)

The OVF Specification provides a means of describing the properties of a virtual system. It is XML based and has generous allowances for extensibility (with corresponding tradeoffs in actual portability). Most commonly, an OVF file is used to describe a single virtual machine or virtual appliance. It can contain information about the format of a virtual disk image file as well as a description of the virtual hardware that should be emulated to run the OS or application contained on such a disk image.
Open Virtual Appliance (OVA)

An OVA is an OVF file packaged together with all of its supporting files (disk images, etc.). You can read about the requirements for a valid OVA package in the OVF specification. Oftentimes people will say “an OVF” and really mean “an OVA.”
Vagrant .box (for Vagrant >=1.1.0)

For recent versions of Vagrant, a vagrant “box” is a tarball containing a metadata.json that specifies a provider and any other files that the specific provider requires.

Vagrant virtualbox .box For example, Vagrant boxes for the default VirtualBox provider will contain (in addition to metadata.json), the contents of an export from VirtualBox and a Vagrantfile with some default settings for the box. For example:

    .
    ├── Vagrantfile
    ├── box-disk1.vmdk
    ├── box.ovf
    └── metadata.json
 
    0 directories, 4 files

(Note that all of these files are in the top level of the archive. There is no containing directory.) This makes Vagrant *.box packages for the VirtualBox provider quite similar to an OVA, though certain things like file-order inside the tarball are not strictly adhered to.

Vagrant VMWare Fusion .box Vagrant boxes for the new VMWare Fusion provider are quite similar to those for the VirtualBox provider, except that instead of containing the output of a VirtualBox export, they include the contents of a VMWare Fusion Virtual Machine directory.

Vagrant AWS .box Vagrant boxes for the AWS provider contain no disk images (the base disk images for the AWS provider are AMIs hosted in Amazon’s cloud). Optionally, the AWS provider allows for additional provider-specific settings in the metadata.json file (e.g. what AMI to use).

Older Vagrant boxes Vagrant boxes for older versions of Vagrant only support one provider, VirtualBox. They also lack the metadata.json file included in new versions.
Formats for Disk Images

Another piece of the packaging puzzle is disk image formats. There are many. Each has its own benefits and detriments, but I’m not going to get into those here. Again, this is nowhere near a comprehensive list — just something to help with getting your bearings. I’d like to comment on a couple of the formats that I’ve recently encountered.

    VDI – VirtualBox’s internal default disk image format is VDI. Nevertheless, this is not what is used by Vagrant boxes.
    VMDK – One of the most common formats. VMWare’s products use various versions and variations of VMDK disk images. Several versions and variations exist, so it’s very important to understand which one you’re working with and where it can be used.
    VHD – Commonly used by Microsoft (e.g. for Microsoft Virtual PC).
    raw (.img, .raw, etc.) – Without compression or thin provisioning, disk images can be very large, but sometimes converting to raw disk images might make sense as an intermediate step or in certain scenarios for better performance at the cost of space.

The important thing to find out is which disk image formats your target hypervisor supports. We’ve found a version of VMDK to be fairly well supported. A copy of the VMDK specification can be requested from VMWare.
Conversion Tools

    qemu-img – Part of the QEMU project, qemu-img is the holy grail, Swiss Army knife of disk image conversion. If you need to convert a disk image, check here first.
    ovftool – Distributed with some VMWare products (in VMWare Fusion, it’s buried inside the .app bundle), ovftool can convert between some VMWare VM formats and OVF.
    VBoxManage – VirtualBox’s command line interface, VBoxManage has some options for exporting and converting VMs and virtual hard disks that may also be useful.

Other Considerations
Host / Guest Support for Virtual Hardware

One important consideration that is not often discussed is the issue of virtual hardware support. It’s obviously important that both the hypervisor and the guest OS are able to provide and make use of virtual hardware devices like disk controllers and network cards. Because we had control over the guest OS and the OVF VM description, we tried to use a very small set of generic devices. Other projects might have more constraints. Libosinfo.org is a project working to build a machine-readable database of some of this information.
Kernel Hypervisor Support

Not every compiled Linux kernel will work with every hypervisor. This is an issue particularly if you’re trying to set up something like AMIs for use with Amazon Web Services. I haven’t made use of it yet myself, but there is a project working to build a kernel with broad hypervisor support. If this is something you need, check out VMI Linux.
Guest Additions

Guest Additions are typically kernel extensions that provide extra services like convenient shared folders between host and guest. We opted not to install any on our appliance by default. If we had decided to include guest additions, I would have considered using the open source Open Virtual Machine Tools provided by VMWare.
VM Building Tools
VMWare Studio

VMWare’s solution for building Virtual Appliances is VMWare Studio. It wasn’t a good fit for our project, but it’s worth considering, particularly if you are targetting the VMWare platform and looking for an all-in-one solution.
VeeWee

We used the open source VeeWee Ruby gem from Patrick Debois to automate the initial installation of our appliance’s operating system and create a base VM.
Vagrant

Vagrant does not currently have any support for the initial creation of VMs (e.g. from an installer ISO and configuration file) like VeeWee does, but wouldn’t be surprised if something like VeeWee ends up being incorporated as a feature of Vagrant itself in the future. Vagrant does, however, make it very easy to spin up and destroy VMs created from a base. This made it a good tool for the intermediate stages of our build process.
Oz

Oz is a python-based utility for creating virtual machine images from ISOs by automating the installation process. I found out about Oz too late to consider it for this project, but it seems to have similar goals to something like VeeWee, though with closer ties to the Enterprise Linux ecosystem than the Ruby ecosystem. One interesting aspect of Oz is the TDL templating language it uses to build images. It fills a similar role to VeeWee definitions, but has a detailed spec of its own.
Online VM Builders

ImageFactory / The Aeolus Project The ImageFactory is an online image builder for a variety of virtualzation and cloud platforms (including Amazon AMIs, which I did not even touch on here). ImageFactory uses Oz to build the images.

The Aeoluous Project very recently announced that they would be disbanding to contribute their efforts to other projects, but their ImageFactory will continue to operate.

Project Raindrops Project Raindrops is very new project from Karanbir Singh and Jaime Melis, looking to provide a service similar to ImageFactory. It currently has good support for building CentOS images. Eventually the build tools for this will also be open-sourced.


**Source(Author):** Mike English