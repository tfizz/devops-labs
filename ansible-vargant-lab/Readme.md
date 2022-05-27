# Vagrant Ansible Lab
In this lab, three virtual machines are created using vagrant. One server is designated as the ansible control while the others are the controlled servers. We use use ansible playbook to install docker and docker-compose on the controlled servers.

## Requirements
> Please ensure the following softwares are installed:
- Vagrant
- VirtualBox

## How to Run
- Clone repository
- Open terminal and change working directory into repo folder
- Run command `vagrant up` to provision servers
- SSH into the ansible server by running the command `vagrant ssh ansible`
- Run command to copy content of the generated <i>host_file</i> into <i>/etc/hosts</i> file.
`sudo cp /vagrant/host_file /etc/hosts`

> Test connection to any of the test servers by pinging the server. If you're unable reach server, please verify ip address and hostname of server is configured properly in /etc/hosts file before proceeding.

- Generate ssh keys. Run command `ssh-keygen` accept defaults and generate public and private keys.
- Copy the public key to the controlled servers. `ssh-copy-id testserver1 && ssh-copy-id testserver2`.

> Use password <b>vagrant</b> when prompted for server password

- Test ansible can authenticate to test servers using ssh keys. Run command `ansible nodes -i /vagrant/ansible/hosts -m ping`. 

> If connection is successful, you should receieve a "pong" back from the servers. If you don't, please retry the key gen step and copy to server again.

- Run command `ansible-playbook -i /vagrant/ansible/hosts -k /vagrant/ansible/playbook.yml --extra-vars hosts=nodes` to run playbook and install docker and docker-compose on the controlled servers. 

> Use password <b>vagrant</b> when prompted for ansible server ssh password

- Verify docker and docker compose is installed on contolled servers by running commands: <br/>
<u>verify docker</u><br/>
`ansible nodes -i /vagrant/ansible/hosts -m shell -a 'docker --version'` <br/> 
<u>verify docker compose</u> <br/>
`ansible nodes -i /vagrant/ansible/hosts -m shell -a 'docker compose version'` <br/>

## Delete Virtual Machines
Open a terminal and change working directory into repo folder. Run command `vagrant destroy --force` to stop virutal machine and remove vm files.