## uvv_bd1_cc1mc
# PSET 1 - BANCOS DE DADOS 2023/1

<br>


**Aluno:** Lucas Bonato Soares.

**Professor:** Abrantes Araújo Silva Filho.

**Monitora:** Suellen Miranda Amorim.

Aqui está organizado todos os **arquivos** e **registros** do desenvolvimento de meu primeiro *PSET* da disciplina "*Design e Desenvolvimento de Bancos de Dados*" realizado na Universidade Vila Velha. 

<br>
<hr>
<br>

  
## Guia do repositório:

### Diretório 'pset1':  
É onde estão armazenados todos os arquivos da entrega do PSET. Dentro deste diretório temos:

* **'cc1mc_202307653_postgresql.sql'**: Um script SQL capaz de criar um banco de dados, gerar a sua estrutura e inserir dados utilizando a linguagem administrativa do PostgreSQL._[^1]
 
* **O subdiretório 'Diagrama Power Architect'**
 
* **O subdiretório 'Relatórios SQL'**

<br>


### Subdiretório 'Diagrama Power architect':
É onde está armazenado o diagrama ERD[^2] feito na aplicação Power Architect. Dentro deste subdiretório temos:

* **'cc1mc_202307653_postgresql.architect'**: O arquivo do diagrama em formato .architect

* **'cc1mc_202307653_postgresql.architect.pdf'**: O arquivo do diagrama em formato .pdf

<br>


### Subdiretório 'Relatórios SQL':
É onde estão armazenados diversos scripts SQL de relatório (Queries!)


Para saber mais sobre o conteúdo que está armazenado nesse repositório, leia o tópico "*Do que consiste o PSET?*"

<br>

<hr>
<br>


<details>
<summary>
<b>O que é um PSET?
 </summary>

Um PSET, ou _Problem set_[^3], é uma prática utilizada no ensino onde o aluno deve resolver uma série de problemas com uma solução completa. Eles são amplamente utilizados nas áreas de exatas e ciências da natureza para auxiliar na fixação do conteúdo. 
  
Ao invés de apenas um ou poucos problemas isolados serem apresentados para o aluno em diversas atividades de prazo curto, apresenta-se um conjunto complexo e intercalado de problemas relacionados entre si em uma atividade única que possui um prazo maior. Isso estimula o desenvolvimento de soluções mais sofisticadas e demanda que o aluno não apenas entenda o conteúdo mas consiga visualizar uma situação-problema panoramica e ir aplicando o que aprendeu para soluciona-la.

</details>


<br>


<details>
<summary> 
<b>Do que consiste o PSET?
</summary>

O PSET consiste em uma série de atividades de conhecimento teórico e prático acerca de bancos de dados.
  
Ele será dividido em duas partes: **Questões discursivas** e **Implementação de BD no PostgreSQL**.
  
As questões discursivas são manuscritas - apenas a segunda parte do PSET será armazenada aqui.
  
![Imagem ilustrativa da visão geral do PSET 1](https://cdn.discordapp.com/attachments/799851247410479155/1107054462956212375/image.png)

* Temos como base um diagrama ERD de um banco de dados chamado "Lojas UVV".[^5]
* Deve-se criar um script SQL que criará o banco de dados representado pelo ERD, preservando as entidades e relacionamentos do diagrama.
* Este script deve gerar todas as tabelas, colunas, constraints, chaves e comentários do banco de dados em uma sequência lógica comentada. 
* O desenvolvimento desse banco de dados deve ocorrer utilizando o PostgreSQL por meio da aplicação cliente de terminal Linux "psql".
* Também deve-se criar uma réplica do diagrama ERD utilizando o aplicativo de interface gráfica "Power Architect".
* Ao final do desenvolvimento do banco de dados, deve-se realizar também diversos scripts de consulta SQL para realizar relatórios requisitados pelo professor.
</details>



[^1]: [O PostgreSQL é um sistema de gerenciamento de bancos de dados (SGBD) relacional, open-source e gratuito, considerado um dos melhores, se não o melhor, SGBD open-source no mercado. Ele pode ser acessado por uma aplicação cliente de terminal Linux chamada "psql".](https://www.postgresql.org/)
[^2]: Diagrama entidade-relacionamento.
[^3]: Conjunto de problemas. 
[^5]: [Lojas UVV](https://cdn.discordapp.com/attachments/799851247410479155/1107054756087738478/lojas-uvv.png)
