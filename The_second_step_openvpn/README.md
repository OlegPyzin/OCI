# OpenVPN service

### Подготовка исходных данных
В первом шаге были созданы COMPARTMENTS, в том числе и compartments OpenVPN, в котором и будет создан и после создания работать OpenVPN сервис.
Первым необходимо подготовить файл terraform.tfvars, для этого откройте его на редактирование и довавьте в него переменную compartment_id, значение для этой переменной можно взять из файла ../The_first_step_compartment/output/compartments.lst. Как вариант можно взять terraform.tfvars.example файл из текущего каталога и заменить все примеры переменных их реальными значениями.

### Launching virtual machine

#### Network environment for the VM

#### 

### Ansible для установки и конфигурирования необходимых пакетов

```commandlines
$ terraform init
$ terraform plan
$ terraform apply
```
### How to delete OpneVPN service
```commandline
$ terraform destroy
```
### Дополнительная информация
