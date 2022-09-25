# Compartment
Как я понимаю предназначение compartment в OCI - это способ объединить ресурсы OCI, предназначенные для реализации сервиса, проекта или объединеные по какому-нибудь еще признаку или критерию вычислительные и иные ресурсы. В целях Hobby и для самообучения я планирую создать в Oracle Cloud Infrastructure OpenVPN сервис для своих нужд и узлы для кластера Kubernetes.
### Compartment OpenVPN
В данном comparment будут создаваться ресурсы OCI для обеспечения функционирования сервиса OpenVPN. Задача которая будет выполняться здесь - это только создание необходимого compartment. Все ресурсы OCI будут описаны в других каталогах.
### Compartment k8s
В данном comparment будут создаваться ресурсы OCI для обеспечения функционирования узлов кластера Kubernets. Задача которая будет выполняться здесь - это только создание необходимого compartment. Все ресурсы OCI будут описаны в других каталогах.
### What to do
Произведите необходимые изменения в наименованиях compartment, и выполните:
```commandlines
$ terraform init
$ terraform plan
$ terraform apply
```
### Execution results
После выполнения terraform apply будут созданы два compartments: OpenVPN и k8s. Вся необходимая информация для дальнейших действий будет размещена в каталоге ./output в файле compartment.lst, как например compartment_id.
### How to delete compartment
Прежде чем выполнить команду terraform destroy в данном каталоге необходимо предварительно удалить все созданные в compartment ресурсы, которые были созданы при помощи кода terraform в других каталогах. Только после удаления всех ресурсов во всех созданных compartment можно вернуться в этот каталог и удалить compartment.
### Дополнительная информация
Можно создавать вложенные compartment. Самый верхний уровень compartment это tenancy. Используя код terraform в данном каталоге будет создаваться следующая схема вложенности compartment:
```
tenancy_name
       |
       +------- OpenVPN
       +------- k8s
```
Где почитать о [compartment:](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment)
https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment