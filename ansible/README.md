# Ansible

Procedimentos de Instalação:
[https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html);

Documentações de apoio:
[https://docs.ansible.com/ansible/latest/index.html](https://docs.ansible.com/ansible/latest/index.html);

Referência para o módulo criado neste exemplo:
- [Manual:Running MediaWiki on Debian or Ubuntu](https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Debian_or_Ubuntu);

- [How To Deploy a Basic PHP Application Using Ansible on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-basic-php-application-using-ansible-on-ubuntu-14-04);

Alterações no arquivo ansible.cfg para este módulo:

1. O inventário utilizado no momento inicial do projeto é estático portanto a seguinte instrução foi adicionada:

```
inventory       =  $PWD/hosts.ini
#library        = /usr/share/my_modules/
...
#poll_interval  = 15
sudo_user       = root
```

2. O host de destino no processo de configuração é um ubuntu servers 18.04 LTS, o usuário padrão ubuntu foi configurado como um parâmetro no inventário:

```
[webserver]
X.X.X.X ansible_ssh_user=ubuntu

[database]
Y.Y.Y.Y ansible_ssh_user=ubuntu
```

3. Para possibilitar a instalação de pacotes privilégios administrativos foram adicionados a execução:

```
[privilege_escalation]
become=True
become_method=sudo
become_user=root
become_ask_pass=Fals
```