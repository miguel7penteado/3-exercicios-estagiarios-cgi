

# CGI no Linux com Apache  bash
![](https://lh6.googleusercontent.com/-t29IhOVisE8/VCtpEmTZIaI/AAAAAAAAB30/VibT4zKosy8/w580-h269-no/apache_imagem.jpg)
![](https://lh6.googleusercontent.com/ciJEGVH-vPMg1_515dawBa9SfoePqQOnkh_wxrNwWgE=s551-no)
![](https://lh5.googleusercontent.com/-58LeMcMMocc/VCtqb2BanGI/AAAAAAAAB4Y/1KOqS16pe-8/w399-h291-no/mysql%5B1%5D.jpg)


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

Por ultimo, vamos criar um usuário sem senha chamado script 
sem necessidade de senha para acessar o esquema exercicio1 localmente, com todas as 
permissões DDL e DML para as tabelas que estiverem dentro do esquema exercicio1.

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

grant all on exercicio1.* to 'script'@'localhost';

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
                id:        <Input Type="text" Name ="variavel1" size=20 value=""><BR>
                nome:      <Input Type="text" Name ="variavel2" size=20 value=""><BR>
                idade:     <Input Type="text" Name ="variavel3" size=20 value=""><BR>
                <Input Type="submit" value="enviar">
        </Form>
</body>
</html>
```
## Criando o script Bash para tratar a interface CGI.

Como vamos utilizar o método POST, a estringue **QUERYSTRING** será lida a partir da 
entrada padrão **STDIN**, ou seja, como se a estringue que **chega via http** estivesse sendo 
**digitada normalmente no teclado**.

arquivo inserir.sh
```bash
#!/bin/bash

entrada=""

read entrada
echo Content-type: text/html
echo ""
echo A estringue de esntrada eh: $entrada
echo "<p>"

# separando a string de entrada em variaveis e seus valores:
parametro2=$(echo "$entrada" | awk -F'[=&]' '{print $2}')
parametro4=$(echo "$entrada" | awk -F'[=&]' '{print $4}')
parametro6=$(echo "$entrada" | awk -F'[=&]' '{print $6}')

mysql --user=script -e 'insert into exercicio1.pessoas(id,nome,idade) values (${parametro2},"${parametro4}","${parametro6}");'

echo "Registro inserido com sucesso..."
mysql --user=script -H -e 'select * from exercicio1.pessoas where id= ${parametro2};'

```


**CGI** é um recurso normalmente pré-configurado ou fácil de ativar em **servidores WWW** como o **Apache**, mas no caso do **IIS7** da Microsoft que vem instalado 
nativamente nos windows Vista e Win7, você verá o quanto a Microsoft se preocupa com o seu conforto.   

![](https://lh5.googleusercontent.com/-z3beA29Qe3I/VBZGbCg6hiI/AAAAAAAABy8/yF2o\_oKQfW8/w947-h551-no/cgi.jpg)

