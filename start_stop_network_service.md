# Start, stop, and check the status of network services.
* `systemctl list-units --type service --all ` -  list all loaded service units.
* `systemctl list-unit-files --type service` -  see which service units are enabled.
* `systemctl is-active sshd` - check whether a service is running (active) or not running (inactive).
* `systemctl is-enabled sshd` -  check whether a service is enabled.

## Starting and stopping services
<table>
<tbody><tr>
<th>service Utility </th>
<th>systemctl Utility </th>
<th>Description </th>
</tr>
<tr>
<td>service name start </td>
<td>systemctl start name </td>
<td>Starts a service </td>
</tr>
<tr>
<td>service name stop </td>
<td>systemctl stop name </td>
<td>Stops a service </td>
</tr>
<tr>
<td>service name restart </td>
<td>systemctl restart name</td>
<td>Restarts a service </td>
</tr>
<tr>
<td>service name condrestart </td>
<td>systemctl try- restart name </td>
<td>Restarts a service only if it is running </td>
</tr>
<tr>
<td>service name reload </td>
<td>systemctl reload name</td>
<td>Reloads a configuration </td>
</tr>
<tr>
<td>service name status </td>
<td>systemctl status name</td>
<td>Checks whether a service is running </td>
</tr>
<tr>
<td>service –status- all</td>
<td>systemctl list-units –type service –all</td>
<td>Displays the status of all services</td>
</table>