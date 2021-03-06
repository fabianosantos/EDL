# A Linguagem de Programação Rust

### História
  Rust é uma linguagem de programação muilti-paradigma (general purpose programming language),  open source, desenvolvida pela Mozilla Research.
  Originalmente escrita por Graydon Hoare, empregado da Mozilla, como um de seus projetos pessoais em 2006, a linguagem ganhou apoio da organização em 2009
e teve seu projeto refinado durante o processo de desenvolvimento do Servo web browser e do Rust Compiler.
  Hoje a linguagem segue seu desenvolvimento e possui uma comunidade bastante ativa de usuários que a mantém, onde a maior parte das decisões são feitas
 em discussão aberta e consenso geral, sob a liderança de vários times.
  
  A linguagem tem em seu foco três pilares: <b>segurança, velocidade e concorrência</b>.
  E mantém esses objetivos sem o uso de um garbage collector, fazendo dela uma ótima opção em uma série de casos de uso onde outras linguagens não são boas.
  Como por exemplo, programas com requerimento específico de tempo e espaço, aplicações embarcadas, e em programações de baixo nível como em device drivers e Sistemas Operacionais.
  Seu ganho em relação a outras linguagens atuais nesses quesitos é obtido principalmente por Rust investir pesado em realizar uma série
de checkagens de segurança em tempo de compilação, evitando overhead em tempo de execução e eliminando possíveis Data Races (concorrência).

 Hoje a linguagem Rust é a primeira colocada na pesquisa de <b>Linguagens de Programação mais amadas</b>, pesquisa realizada pelo <b>Stack Overflow Developer Survey</b>, sendo vitoriosa pelo segundo ano consecutivo (2016 e 2017).

### Exemplos
 Exemplo clássico do programa <b>Hello World!</b> escrito em Rust:
 ```
 fn main() {
    println!("Hello, world!");
 }
 ```
 Execução:
 ```
 $ rustc main.rs
 $ ./main
 Hello, world!
 ```

### Referências
•	https://doc.rust-lang.org/book/README.html<br/>
•	https://pt.wikipedia.org/wiki/Rust_(linguagem_de_programa%C3%A7%C3%A3o)<br/>
•	https://en.wikipedia.org/wiki/Rust_(programming_language)<br/>
•	https://www.rust-lang.org/pt-BR/community.html<br/>
•	https://llogiq.github.io/2016/02/28/java-rust.html<br/>
