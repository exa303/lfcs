# Type 1 vs. Type 2 hypervisors

Virtualization works by abstracting physical hardware and devices from the applications running on that hardware. The process of virtualization manages and provisions the system's resources, including processor, memory, storage and network resources. This enables the system to host more than one workload simultaneously, making more cost- and energy-efficient use of the available servers and systems across the organization.
What are hypervisors?

Virtualization requires the use of a hypervisor, which was originally called a virtual machine monitor or VMM. A hypervisor abstracts operating systems and applications from their underlying hardware. The physical hardware that a hypervisor runs on is typically referred to as a host machine, whereas the VMs the hypervisor creates and supports are collectively called guest machines.

A hypervisor enables the host hardware to operate multiple VMs independent of each other and share abstracted resources among those VMs. Virtualization with a hypervisor increases a data center's efficiency compared to physical workload hosting.

There are two types of hypervisors: Type 1 and Type 2 hypervisors. Both hypervisor varieties can virtualize common elements such as CPU, memory and networking, but based on its location in the stack, the hypervisor virtualizes these elements differently.
Type 1 hypervisors

A Type 1 hypervisor runs directly on the host machine's physical hardware, and it's referred to as a bare-metal hypervisor. The Type 1 hypervisor doesn't have to load an underlying OS. With direct access to the underlying hardware and no other software -- such as OSes and device drivers -- to contend with for virtualization, Type 1 hypervisors are regarded as the most efficient and best-performing hypervisors available for enterprise computing.

Hypervisors that run directly on physical hardware are also highly secure. Virtualization mitigates the risk of attacks that target security flaws and vulnerabilities in OSes because each guest has its own OS. This ensures an attack on a guest VM is logically isolated to that VM and can't spread to others running on the same hardware.

IT organizations use Type 1 hypervisors for production-level workloads that require increased uptimes, advanced failover and other production-ready features. The typical Type 1 hypervisor can scale to virtualize workloads across several terabytes of RAM and hundreds of CPU cores.

In addition, Type 1 hypervisors often provide support for software-defined storage and networking, which creates additional security and portability for virtualized workloads. However, such features come with a much higher initial cost and greater support contract requirements.

The typical Type 1 hypervisor requires some level of external management -- with interfaces such as Microsoft System Center Virtual Machine Manager or VMware vCenter -- to access the full scope of the hypervisor's abilities.
Type 2 hypervisors

A Type 2 hypervisor is typically installed on top of an existing OS. It is sometimes called a hosted hypervisor because it relies on the host machine's preexisting OS to manage calls to CPU, memory, storage and network resources.

Type 2 hypervisors trace their roots back to the early days of x86 virtualization when the hypervisor was added above the existing systems' OSes. Although the purpose and goals of Type 1 and Type 2 hypervisors are identical, the presence of an underlying OS with Type 2 hypervisors introduces unavoidable latency; all of the hypervisor's activities and the work of every VM has to pass through the host OS. Also, any security flaws or vulnerabilities in the host OS could potentially compromise all of the VMs running above it.

Consequently, Type 2 hypervisors are generally not used for data center computing and are reserved for client or end-user systems -- sometimes called client hypervisors -- where performance and security are lesser concerns. They also come at a lower cost than Type 1 hypervisors and make an ideal test platform compared to production virtualized environments or the cloud. For example, software developers might use a Type 2 hypervisor to create VMs to test a software product prior to release. IT organizations typically use Type 2 hypervisors to create virtual desktops. Type 2 hypervisors can support large and complex nested environments.


![alt text](/topics2/virtualization/server_virt-hypervisor.jpg?raw=true)


Hardware support for Type 1 and Type 2 hypervisors

Hardware acceleration technologies are widely available for virtualization's tasks. Such technologies include Intel Virtualization Technology extensions for Intel processors and AMD Virtualization extensions for AMD processors. There are numerous other virtualization-based extensions and features, including second-level address translation and support for nested virtualization.

Hardware support for Type 1 and Type 2 hypervisors

Hardware acceleration technologies are widely available for virtualization's tasks. Such technologies include Intel Virtualization Technology extensions for Intel processors and AMD Virtualization extensions for AMD processors. There are numerous other virtualization-based extensions and features, including second-level address translation and support for nested virtualization.

Type 1 and Type 2 hypervisor vendors

The hypervisor market contains several vendors, including VMware, Microsoft, Oracle and Citrix. Below are some popular products for both Type 1 and Type 2 hypervisors.

Type 1 hypervisors:

    VMware vSphere. VMware vSphere includes the ESXi hypervisor and vCenter management software to provide a suite of virtualization products, such as the vSphere Client, vSphere software development kits, Storage vMotion, the Distributed Resource Scheduler and Fault Tolerance. VMware vSphere is geared toward enterprise data centers; smaller businesses might find it difficult to justify the price.
    Microsoft Hyper-V. Microsoft Hyper-V runs on Windows OSes and enables admins to run multiple OSes inside a VM. Admins and developers often use Hyper-V to build test environments to run software on several OSes by creating VMs for each test.
    KVM. The KVM hypervisor is an open source virtualization architecture made for Linux distributions. The KVM hypervisor enables admins to convert a Linux kernel into a hypervisor and has direct access to hardware along with any VMs hosted by the hypervisor. Features include live migration, scheduling and resource control.
    Xen hypervisor. The open source Xen Project originally began as a research project at the University of Cambridge in 2003. It later moved under the purview of the Linux Foundation. Xen is used as the upstream version for other hypervisors, including Oracle VM and Citrix Hypervisor. Amazon Web Services uses a customized version of the Xen hypervisor as the foundation for its Elastic Compute Cloud.
    Oracle VM. Oracle VM is an open source virtualization architecture that uses Xen at its core and enables admins to deploy OSes and application software in VMs. Oracle VM features include creation and configuration of server pools, creation and management of storage repositories, VM cloning, VM migration and load balancing.
    Citrix Hypervisor. The Citrix Hypervisor -- previously known as Citrix XenServer -- is an open source server virtualization platform based on the Xen hypervisor. Admins use the Citrix Hypervisor to deploy, host and manage VMs as well as distribute hardware resources to those VMs. Some key features include VM templates, XenMotion and host live patches. The Citrix Hypervisor comes in two versions: Standard and Enterprise.

Type 2 hypervisor products:

    Oracle VM VirtualBox. Oracle VM VirtualBox is an open source hosted hypervisor that runs on a host OS to support guest VMs. VirtualBox supports a variety of host OSes, such as Windows, Apple macOS, Linux and Oracle Solaris. VirtualBox offers multigeneration branched snapshots, Guest Additions, guest multiprocessing, ACPI support and Preboot Execution Environment network boot.
    VMware Workstation Pro and VMware Fusion. VMware Workstation Pro is a 64-bit hosted hypervisor capable of implementing virtualization on Windows and Linux systems. Some of Workstation's features include host/guest file sharing, the creation and deployment of encrypted VMs, and VM snapshots.

VMware developed Fusion as an alternative to Workstation. VMware Fusion offers many of the same capabilities as Workstation but is macOS compatible and comes with fewer features at a reduced price.

    QEMU. QEMU is an open source virtualization tool that emulates CPU architectures and enables developers and admins to run applications compiled for one architecture on another. QEMU offers features such as support for non-volatile dual in-line memory module hardware, share file system, secure guests and memory encryption.
    Parallels Desktop. Primarily geared toward macOS admins, Parallels Desktop enables Windows, Linux and Google Chrome OSes and applications to run on Apple Mac. Common features include network conditioning, support for 128GB per VM and Chef/Ohai, Docker and HashiCorp Vagrant integrations. Parallels Desktop comes in three modes: Coherence, Full Screen and Modality mode.

Type 1 vs. Type 2 hypervisor

When choosing between a Type 1 and Type 2 hypervisor, admins must consider the type and size of their workloads. If admins primarily work in an enterprise or large organization and must deploy hundreds of VMs, a Type 1 hypervisor will suit their needs.

But if admins have a smaller deployment or require a testing environment, Type 2 hypervisors are less complex and have a smaller price tag. And enterprises and organizations can use Type 2 hypervisors as needed for workloads that suit the technology.
Next Steps

**Source:** https://www.techtarget.com/searchitoperations/tip/Whats-the-difference-between-Type-1-vs-Type-2-hypervisor
