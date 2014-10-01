

# CGI no Linux com Apache  bash

## Preparando o SGBD e o esquema. 

Prepare um acesso ao Banco de Dados. Vamos preparar o MySQL.

Vamos cadastrar pessoas, portanto, vamos criar uma tabela de pessoas, com atributos

id, nome e idade

Tabela Pessoas
| id 	| nome     	| idade 	|
|----	|----------	|-------	|
| 01 	| Fulano   	| 22    	|
| 02 	| Ciclano  	| 25    	|
| 03 	| Beltrano 	| 20    	|

Para tanto, podemos utilizar o seguinte código em SQL:

```SQL

create database exercicio1;

CREATE TABLE pessoas
(
	id int(11) NOT NULL,
	nome varchar(100) DEFAULT NULL,
	idade int(11) DEFAULT NULL,
	PRIMARY KEY (id)
);

```

## Configurando o Servidor Apache.

Configure o servidor Apache para Usar como contexto Raiz, ou seja, **/** do servidor de páginas, a pasta /var/www/site1


## Construindo o formulário HTML 

Crie uma página HTML estática, com um formulário para preencer as colunas id, nome e idade.

Salve este formulário como **formulário.html** no contexto raiz do servidor http Apache.

Aponte a ação do formulário para o script bash **inserir.sh** dentro da sub-pasta **cgi**.

Código de formulário.html
```html
<html>
<head></head>
<body>
        <Form Method = "post" action = "cgi/inserir.sh">
                Cadastro de Pessoas:<BR>
                <BR>
                id:        <Input Type="text" Name = "variavel1" size=20 value=""><BR>
                nome:      <Input Type="text" Name = "variavel2" size=20 value=""><BR>
                idade:     <Input Type="text" Name = "variavel3" size=20 value=""><BR>
                <Input Type="submit" value="enviar">
        </Form>
</body>
</html>
```
## Criando o script Bash para tratar a interface CGI.

Como vamos utilizar o método POST, a estringue **QUERYSTRING** será lida a partir da 
entrada padrão **STDIN**, ou seja, como se a estringue que **chega via http** estivesse sendo 
**digitada normalmente no teclado**.



**CGI** é um recurso normalmente pré-configurado ou fácil de ativar em **servidores WWW** como o **Apache**, mas no caso do **IIS7** da Microsoft que vem instalado 
nativamente nos windows Vista e Win7, você verá o quanto a Microsoft se preocupa com o seu conforto.   

![](https://lh5.googleusercontent.com/-z3beA29Qe3I/VBZGbCg6hiI/AAAAAAAABy8/yF2o\_oKQfW8/w947-h551-no/cgi.jpg)
