# Network Environments

### Подготовка исходных данных
В первом шаге были созданы COMPARTMENTS.
Далее необходимо подготовить сетевое окружение для запуска виртуальных машин. Начнем с подготовки файла terraform.tfvars, для этого откройте его на редактирование и довавьте в него переменную compartment_id, значение для этой переменной можно взять из файла ../The_first_step_compartment/output/compartments.lst. Как вариант можно взять terraform.tfvars.example файл из текущего каталога и заменить все примеры переменных их реальными значениями.
Также добавлены следующие переменные: vcn_display_name, vcn_dns_label, vcn_cidr_block, subnet_display_name, subnet_dns_label, subnet_cidr_block и другие. Все переменные описаны в файле terraform.tfvars.example
### Network environment for the VM
Современные компьютеры, являются ли они реальными (персональный компьтер, ноутбук и так далее) или, как в нашем случае виртуальный компьютер, нуждаются в сетевом окружении. Так реальные компьютеры могут использовать WiFi или же подключение к какому-нибудь сетевому устройству посредством кабеля для того, чтобы можно было пользоваться огромным числом сервисов, предоставляемых Internet. Безусловно реальные компьютеры могут работать и без сетевого окружения но это сейчас скорее всего исключение чем правило.
Для создания сетевого окружения реальных компьютеров существует огромное количество устройств, таких как: routers, switches, bridges и так далее.
Работа же виртуальной машины без сетевого окружения вообще не представляется возможной, поскольку даже стандартные средства ввода и вывода информации, такие как клавиатура и дисплей, вообще отсутствуют в ней. Поэтому одна из задач - это подготовка сетевого окружения для запуска в нем виртуальной машины.
#### VCNs and SUBNETs
Каким образом можно создавать Virtual Networks Cloud и SUBNETs в нашем Tenancy? В ресурсах terraform необходимых для создания VCN и SubNet имеется параметр compartment_id. В первом шаге данный параметр использовался для того, чтобы создавать иерархическую структуру COMPARTMENT. Можно предположить что применяя различные данные для этого параметра можно создавать различные комбинации соотношений VCNs и SUBNETs. Главное условие при создании VCNs и SUBNETs это соблюдение требования о не "пересечении" CIDR блоков между собой.
Также необходимо отметить что SUBNETs создаются внутри одной VPC и соответственно CIDR блоки SUBNETs не должны пересекаться между собой и не выходить за пределы VCN, где они создаются. Также адреса сетей в VCN не должны пересекаться между собой.

К примеру можно создать одну VCN под TENANCY и создать SubNet для каждого из COMPARTMENTs. Или создать для каждого COMPARTMENT свою VCN и далее создать необходимое количество подсетей в созданных VCN. Можно легко провести эксперимент меняя значение compartment_id в соответствующих resource и добавляя необходимое количество resource.

Ознакомиться с оригинальным описанием VCNs и SUBNETs можно [здесь:](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs_topic-Overview_of_VCNs_and_Subnets.htm#Overview)
https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs_topic-Overview_of_VCNs_and_Subnets.htm#Overview
#### GateWay, Route table, DNS and DHCP services for the virtual machine
При создании VCN по умолчанию создаются: таблица маршрутизации - ресурс oci_core_default_route_table и список безопасности - ресурс oci_core_default_security_list. В связи с этим можно не создавать свои ресурсы route table и security list и использовать уже созданные ресурсы для внесения своих собственных данных.
#### Security list
По умолчанию создаются: одна запись в egress и три записи в ingress security list.
```text
egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
}
```
Данная запись означает что все разрешено на "выход" из VCN.
```text
ingress_security_rules {
    protocol = "6"
    source = "0.0.0.0/0"
    tcp_options {
        max = "22"
        min = "22"
    }
}
```
Данная запись означает что разрешено подключение по порту 22 с любого адреса. Это необходимо для использования ssh для входа в виртуальную машину.
```text
ingress_security_rules {
    protocol = "1"
    source = "0.0.0.0/0"
    icmp_options {
        type = 3
        code = 4
    }
}
```
Данная запись означает что разрешены ответы на запросы icmp из VCN с любого адреса.
```text
ingress_security_rules {
    protocol = "1"
    source = "CIDR VCN block"
    icmp_options {
        type = 3
    }
}
```
Данная запись означает что разрешены запросы icmp с любого адреса внутри VCN и получение соответствующих ответов.

С информацией о протоколах можно ознакомиться [здесь:](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
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
