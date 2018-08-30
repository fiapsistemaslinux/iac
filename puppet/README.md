![alt tag](https://github.com/fiapsistemaslinux/iac/raw/master/images/puppet-labs-squarelogo.png)

# Automação de Infraestrutura com Puppet

O Puppet é uma solução de automação de ambientes que opera no modelo client/server mantido pela empresa de mesmo nome, uma empresa privada de software com sede em Portland, Oregon especializada exatamente em automação e tecnologia e cujo foco e investimento nas chamadas culturas DevOps vem crescendo nos últimos anos.

---

**Definições Básicas**

Segundo [as definições propostas pela própria empresa](https://puppet.com/products/how-puppet-works) o Puppet oferece uma maneira automática de inspecionar, entregar, operar e preparar infraestrutura e software de forma agnóstica a tecnologias, ou seja, não importando onde essa infraestrutura ou software esteja sendo executada.

**Linguagem e Formato**

O puppet trabalha de forma declarativa, ou seja, a partir da aplicação de arquivos que atuam como templates descrevendo o estado esperado para objetovs como usuários, serviços e pacotes, sua linguagem de declaração é estruturada com base na linguagem de programação Ruby.

**Deploy**

Sendo uma ferramenta de automação e controle o puppet usualmente é configurado utilizando a arquitetura cliente/servidor embora também possa ser implementado no formato standalone (aplicando e mantendo um conjunto de configurações no estado esperado em um determinado host por exemplo);

---

## Instalação e Configuração

A instalação do Puppet tanto na versão comunnit como na versão Enterprise está bem documentada nas paginas oficiais do projeto;

- [Installing Puppet agent: Linux](https://puppet.com/docs/puppet/5.3/install_linux.html);

- [Puppet Server: Installing From Packages](https://puppet.com/docs/puppetserver/5.1/install_from_packages.html);

---

## Utilizando o Puppet

No diretório resources existem dois exemplos extremamente simples de aplicação de resources utilizando puppet, é importante destacar que em ambos os exemplos boas práticas como parametrização e divisão de classes foram deixadas de fora;

Para modelos mais complexos eis algumas opções de consultas interessantes:


Criando uma pilha lamp completa com Puppet a partir de um artigo publicado no linode: [Use Puppet Modules to Create a LAMP Stack](https://www.linode.com/docs/applications/configuration-management/use-puppet-modules-to-create-a-lamp-stack/);
