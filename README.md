# labs_pdris

How to run docker correctly
docker build -t ssh-server-ubuntu .
docker run -v /var/run/docker.sock:/var/run/docker.sock -t ssh-server-ubuntu


ansible-playbook nginx.yml -i my.hosts --extra-vars 'ansible_sudo_pass=root'

ansible-playbook docker.yml -i my.hosts --extra-vars 'ansible_sudo_pass=root'
if check docker is active failed
repeat command xd