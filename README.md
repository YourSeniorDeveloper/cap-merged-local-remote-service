### Apresentação

Este é o primeiro aplicativo que será utilizado no nosso treinamento. Ele consiste em um cadastro de materiais juntamente com um menu onde os usuários poderão criar requisições de compra

### Passos após a clonagem do repositório;

executar cds deploy para criar o arquivo sqlite.db

# Configurar a instancia do Destination e xsuaa service
cf login --sso
cf create-service xsuaa application cap_ext_serv-xsuaa
cf create-service-key cap_ext_serv-xsuaa cap_ext_serv-xsuaa-key
cf create-service destination lite cap_ext_serv-destination
cf create-service-key cap_ext_serv-destination cap_ext_serv-destination-key
cds bind -2 cap_ext_serv-xsuaa,cap_ext_serv-destination

# Ajustar o .cdsrc-private.json para testar local
Adicionar o serviço externo do packages.json para o profile hybrido

# Ajustar o launch.json
O comando para executar cds watch --profile hybrid

### Para executar o aplicativo, utilize os comandos
# somente se ja não estiver logado
cf login --sso


