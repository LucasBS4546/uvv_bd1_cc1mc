## uvv_bd1_cc1mc
# PSET 1 - BANCOS DE DADOS 2023/1

<br>


**Aluno:** Lucas Bonato Soares.

**Professor:** Abrantes Araújo Silva Filho.

**Monitora:** Suellen Miranda Amorim.

Aqui está organizado todos os **arquivos** e **registros** do desenvolvimento de meu primeiro *PSET* da disciplina "*Design e Desenvolvimento de Bancos de Dados*" realizado na Universidade Vila Velha. 

<hr>
  
## Guia do repositório:

### Diretório 'pset1':  
É onde estão armazenados todos os arquivos da entrega do PSET. Dentro deste diretório temos:

* **'cc1mc_202307653_postgresql.sql'**: Um script SQL capaz de criar um banco de dados, gerar a sua estrutura e inserir comentários utilizando a linguagem administrativa do PostgreSQL.[^1]

* **'cc1mc_202307653_mariadb.sql'**: Um script SQL capaz de criar o mesmo banco de dados utilizando a linguagem administrativa do mariadb.[^2]

* **'cc1mc_202307653_sqlserver.sql'**: Um script SQL capaz de criar o mesmo banco de dados utilizando a linguagem administrativa do Microsoft SQL Server.[^3] 

* **'cc1mc_202307653_postgresql.architect'**: Um aquivo de diagrama ERD[^4] em formato .architect, criado utilizando o software PowerArchitect[^5]
 
* **'cc1mc_202307653_postgresql.architect.pdf'**: O arquivo do diagrama ERD em formato .pdf

<br>

Para saber mais sobre o conteúdo que está armazenado nesse repositório, leia o tópico "*Do que consiste o PSET?*"

<hr>

<details>
<summary>
  <b>O que é um PSET?</b>
 </summary>

Um PSET, ou _Problem set_[^6], é uma prática utilizada no ensino onde o aluno deve resolver uma série de problemas com uma única solução completa. Eles são amplamente utilizados nas áreas de exatas e ciências da natureza para auxiliar na fixação do conteúdo. 
  
Ao invés de apenas um ou poucos problemas isolados serem apresentados para o aluno em diversas atividades de prazo curto, apresenta-se um conjunto complexo e intercalado de problemas relacionados entre si em uma atividade única que possui um prazo maior. Isso estimula o desenvolvimento de soluções mais sofisticadas e demanda que o aluno não apenas entenda o conteúdo mas consiga visualizar uma situação-problema panoramica e ir aplicando o que aprendeu para soluciona-la.

</details>


<details>
<summary> 
<b>Do que consiste o PSET?</b>
</summary>

O PSET consiste em uma série de atividades de conhecimento teórico e prático acerca de bancos de dados.
  
Ele será dividido em duas partes: **Questões discursivas** e **Implementação de BD no PostgreSQL**.
  
As questões discursivas são manuscritas - apenas a segunda parte do PSET será armazenada aqui.
  
![Imagem ilustrativa da visão geral do PSET 1](https://cdn.discordapp.com/attachments/799851247410479155/1107054462956212375/image.png)

* Temos como base um diagrama ERD de um banco de dados chamado "Lojas UVV".[^7]
* Deve-se criar um script SQL que criará o banco de dados representado pelo ERD, preservando as entidades e relacionamentos do diagrama.
* Este script deve gerar todas as tabelas, colunas, constraints, chaves e comentários do banco de dados em uma sequência lógica comentada. 
* O desenvolvimento desse banco de dados deve ocorrer utilizando o _PostgreSQL_ por meio da aplicação cliente de terminal Linux "psql".
* Também deve-se criar uma réplica do diagrama ERD utilizando o aplicativo de interface gráfica "Power Architect".
* _Opcionalmente_, o aluno também pode tentar fazer a implementação utilizando o _MariaDB_ por meio da aplicação cliente "mysql" e o _Microsoft SQL Server_ por meio da aplicação cliente "sqlcmd".
</details>



[^1]: [O PostgreSQL é um sistema de gerenciamento de bancos de dados (SGBD) relacional, open-source e gratuito, considerado um dos melhores, se não o melhor, SGBD open-source no mercado. Ele pode ser acessado por uma aplicação cliente de terminal Linux chamada "psql".](https://www.postgresql.org/)
[^2]: [O MariaDB é um sistema de gerenciamento de bancos de dados (SGBD) relacional, open-source e gratuito, oferecendo menos poder que o PostgreSQL em troca de uma linguagem administrativa mais intuitiva e fácil de usar para iniciantes. Ele pode ser acessado por uma aplicação cliente de terminal Linux chamada "mysql".](https://mariadb.org)
[^3]: [O Microsoft SQL Server é um sistema de gerenciamento de bancos de dados (SGBD) relacional, comercial e pago. Embora ele ofereça versões gratuitas, as versões avançadas são associadas a licencas e outras formas de monetização. Ele pode ser acessado por uma aplicação cliente de terminal Linux chamada "sqlcmd".](https://www.microsoft.com/pt-br/sql-server/)
[^4]: [Diagrama entidade-relacionamento.](https://pt.wikipedia.org/wiki/Modelo_entidade_relacionamento)
[^5]: [Software utilizado para criar diagramas ERD e então converte-los em um scriptSQL capaz de implementar o diagrama em um SGBD escolhido.](https://bestofbi.com/products/sql-power-architect-data-modeling/)
[^6]: [Conjunto de problemas.](https://en.wikipedia.org/wiki/Problem_set) 
[^7]: [Lojas UVV](https://cdn.discordapp.com/attachments/799851247410479155/1107054756087738478/lojas-uvv.png)
