A docker swarm project using vagrant. Includes a vagrant file and a docker provisioningfile that when deployed will create 3 VMs using virtual box, with docker installed on all. Docker Swarm can then be deployed subsequently using the manager1 machine as the manager.

vagrant ssh manager1 ==> docker swarm init --advertise-addr 192.168.56.11 (this will generate a token, with instructions )
vagrant ssh worker1 ==> docker swarm join <token> <managerIPaddr>:2377
vagrant ssh worker2 ==> docker swarm join <token> <managerIPaddr>:2377
