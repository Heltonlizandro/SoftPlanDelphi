[![N|Solid](https://s3-sa-east-1.amazonaws.com/prod-jobsite-files.kenoby.com/uploads/softplan-1523912238-logo-softplan-rgb-versao-cor-oficialpng.png)](https://nodesource.com/products/nsolid)

# Projeto de Downloads

O sistema deverá realizar o download via HTTP resquest.

  - Informar o link do arquivo no qual será baixado
  - Inicar o Download
  - Acompanhar o processo de download (progressbar) sendo executado até seu término
  - Todo processo de download realizado será registrado no banco de dados SQLite

# Características

  - Insira um caminho válido de arquivo a ser baixado e inicie o download
  - Informar uma pasta válida para salvar o arquivo a ser baixado
  - O sistema informará que existe downloads em anadmento caso tente fechá-lo

Você também pode:
  - Cancelar a qualquer momento o download já iniciado
  - Visualizar o percentual já realizado do download
  - Visualizar o histórico dos downloads já realizados anteriormente

### Tecnologia

Segue a linguagem e componentes utilizado no software:

* [Delphi] - IDE utilizada para desenvolvimento da aplicação!
* [IdHTTP] - Componente utilizado para efetuar o GET do arquivo a ser baixado
* [idAntiFreeze] - Não permite o congelamento da tela
* [SaveDialog] - Permite a escolha do caminho a ser salvo o arquivo
* [idSSLIOHandlerSocketOpenSSL] - Utilizado na escolha da(s) versão(ões) do SSL
* [FDConnectio] - Utilizado para conectar com o banco de dados "SQLite"
* [FDQuery] - Utilizado para realização das consultas e inserções na tabela de log

### Instalação

Dependências da instaçaão:

```sh
$ Criar uma pasta "SoftPlanDownload"
$ Inserir na pasta SoftPlanDownload o executável "SoftPlan" 
$ Inserir o arquivo "SoftPlan.ini" e apontar o caminho banco de dados
```
