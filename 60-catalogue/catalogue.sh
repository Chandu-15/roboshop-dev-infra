component=$1
environment=$2

dnf install ansible -y


repo_url=https://github.com/Chandu-15/roboshop-ansible-roles-tf.git
ansible_dir=roboshop-ansible-roles-tf
repo_dir=/opt/roboshop/ansible
mkdir -p $repo_dir
mkdir -p /var/log/roboshop
touch /var/log/roboshop/ansible.log
cd 

if [ -d $ansible_dir ]; then 
    cd $ansible_dir
    git pull
else
    git clone $repo_url
    cd $ansible_dir
fi

ansible-playbook main.yaml -e "component=$component" -e "environment=$environment"