# Preparing to launch virtual machine

### Подготовка исходных данных
#### Характеристики виртуальной машины
В первом и втором шагах были созданы необходимые ресурсы для запуска виртуальной машины в OCI, такие как COMPARTMENTS, VCN и SUBNETS.

Как реальный компьютер так и виртуальная машина имеет вполне определенные технические характеристирики, такие как: тип процессора и количество ядер процессора, объем ОЗУ, тип используемой сетевой платы, которая обеспечивает скорость передачи данных по сети и так далее.
Так и для виртуальной машины нужно выбрать необходимые характеристики. В OCI предоставляются возможности выбора таких технических характеристик из так называемых SHAPES.
Начнем с получения списка всех доступных SHAPES в COMPARTMENTS.

После выполнения
```commandline
$ terraform apply
```
в каталоге ./output появятся несколько файлов:
```text
contents - список всей доступной информации для всех SHAPES
и
файлы описания ВМ по наименованиям доступных для использования shapes
в моем случае были созданы:
BM.Standard.A1.160
VM.Standard.A1.Flex
VM.Standard.E2.1.Micro
```
Для каждого файла описания SHAPE были отобраны 8 параметров, по которым будут выбираться SHAPEs для запуска виртуальной машины.
Описание SHAPEs включает 29 параметров и если будет необходимость можно всегда добавить необходимый параметр в список выводимых значений по аналогии с уже описанными.
Мной было отдано предпочтение к SHAPE, где параметр billing_type установлен в ALWAYS_FREE.

Ознакомиться с описанием ресурса для получения списка доступных SHAPES можно [здесь:](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_shapes)
https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_shapes
#### Описание операционных систем
Итак нами были получены данные о характеристиках доступных виртуальных машин и далее нам необходимо получить данные об операционных системах, которые могут инсталлированы на виртуальную машишу.
Ознакомиться с описанием ресурса для получения списка доступных IMAGES можно [здесь:](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_images)
https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_images
### Network environment for the VM
#### VCNs and SUBNETs

Ознакомиться с оригинальным описанием VCNs и SUBNETs можно [здесь:](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs_topic-Overview_of_VCNs_and_Subnets.htm#Overview)
https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs_topic-Overview_of_VCNs_and_Subnets.htm#Overview
#### GateWay, Route table, DNS and DHCP services for the virtual machine
При создании VCN по умолчанию создаются: таблица маршрутизации - ресурс oci_core_default_route_table и список безопасности - ресурс oci_core_default_security_list. В связи с этим можно не создавать свои ресурсы route table и security list и использовать уже созданные ресурсы для внесения своих собственных данных.
#### Security list
#### How to create resources
```commandlines
$ terraform init
$ terraform plan
$ terraform apply
```
#### How to delete resources
```commandline
$ terraform destroy
```
### Дополнительная информация
#### Ссылки:
[shapes:](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_shapes)
https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_shapes
