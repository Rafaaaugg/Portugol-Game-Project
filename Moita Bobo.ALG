Algoritmo "Moita Bobo"
//  
//  
//Aluno: Rafael Augusto Anselmo Mendes
//  
//FUN��O DE CADA VARI�VEL:
// repetir: Armazenar a resposta do usario, se ele quer ou nao jogar de novo
// dire: Mostrar a dire��o do monstro(Norte,Sul,Leste,Oeste,Nordeste...)
// vence: Decide se o jogador ganhou ou se o jogo acabou
// l: Linha
// c: Coluna
// lr: Linha em que se encontra o monstro
// lc: Coluna em que se encontra o monstro
// max: Controla quantas veses o jogador j� jogou
// jogo: vetor de 11 valores(0-10)indicado pela intersec��o da respectiva
// linha e coluna, corresponde a uma parte do campo onde o bicho pode estar
// escondido.
// mons: vetor de 11 valores(0-10) vetor responsavel de ser o monstro.
////////////////////////////////////
// Entrada de dados: 2 Matriz de ordem 11x11(O jogo em si e uma para o monstro)
// mostra-la na tela, com a dica abaixo
//
// processamento: o usuario deve inserir um linha e coluna de 0 a 10, apos isso
// verifica se ele achou o monstro, ele tem 5 tentativvas e apos cada um o
// monstro da uma dica sobre a dire��o que ele se encontra.
// o jogo acaba quando essas tentativas acaba ou se o jogador achar o monstro
// apos isso ele escolhe se quer jogar novamente se sim o jogo reinicia se nao o
// jogo agradece por jogar.
//
// Sa�da de dados: motrar o grafico do jogo e os locais ja ditos com um "T"
// mostrar se o jogador perdeu ou se achou o monstro
////////////////////////////////////
//===========================================================================//
Var
repetir,dire: caractere
vence: logico
l,c,lr,lc,max :  inteiro
jogo,mons : vetor[0..10,0..10] de caractere
//===========================================================================//
//inicio processamento
procedimento preencherMatriz() //inicio processamento preencher matriz
inicio
max <- 1//max recebe 1 pois vai ser a primeira jogada
repetir <- "" //repetir recebe vazio para que se houver repeti��o nao ocorra interferencia
vence <- falso  // vence recebe falso para que caso haja outra repeti��o nao tenha nenhum problema
para l de 0 ate 10 faca
  para c de 0 ate 10 faca
    jogo[l,c] <- "*" // todos os locais recebem o simbolo *
  fimpara
fimpara
fimprocedimento// fim procedimento
//===========================================================================//
procedimento monstro()//inicio procedimento monstro
inicio
para lr de 0 ate 10 faca
     para lc de 0 ate 10 faca
     mons[lr,lc] <- "*" // todos os locais possiveis do mostro recebem *
    fimpara
fimpara
lr <- Randi(11)// fun��o cujo objetivo � gerar um lugar aleatorio para o mostro
lc <- Randi(11)// toda vez que o jogo � iniciado
mons[lr,lc]<- "T"// o lugar aleatorio recebe o "T" para que seja mais facil o processamento
dire <- ""// dire��o come�a vazia
fimprocedimento //fimprocedimento
//===========================================================================//
procedimento moita()//inicio processamento
inicio
limpatela//limpa a tela para que na hora da execu��o fiquei mais organizado
escreval ("===================")
escreval ("   MOITA BOBO ")
escreval ("===================")
escreval("")
escreval ("    0  1  2  3  4  5  6  7  8  9  10")
para l de 0 ate 10 faca // fun��o para escrever na tela o jogo
  se l < 10 entao
   escreva (l:3)
  senao
   escreva (l:3)
  fimse
escreva(" ")
para c de 0 ate 10 faca
 escreva("")
  escreva (jogo[l,c]:3)
    se c >= 10 entao
     escreval("")
    fimse
fimpara
fimpara//fim da fun��o
 escreval ("")
 escreval (dire:25) // lugar que ir� aparecer a dire��o
fimprocedimento//fim do procedimento
//===========================================================================//
procedimento jogando()//inicio procedimento
inicio
enquanto max <= 5 faca // enquanto o numero de jogadas for menor ou igual a 5 o jogador pode continuar jogando
se vence = falso entao // e se a variavel vence for falso o jogo continua ou seja o jogador nao descobriu o mostro
escreval("")
escreva("Digite uma linha.:")// o jogador vai digitar a linha que deseja jogar
leia(l)
 se (l<0) ou (l>10) entao // se a linha for menor que 0 ou maior que 10 mostra linha incorreta e solicitar novamente
   repita// o processamento vai repetir
    escreval("")
     escreva("Linha incorreta, por favor, digite novamente.:")
    leia(l)
   ate (l>=0) e (l<=10)//ate que o jogador digite um numero valido
   escreval("")
    escreva ("Digite uma coluna.:")// se o jogador digitar um numero valido poder� insirir uma coluna
   leia(c)
    se (c<0) ou (c>10)entao// se a culuna digitada for invalida solicitar novamente a coluna
      repita // repetir ate que a culuna for um numero valido
        escreval("")
         escreva("Coluna incorreta, por favor, digite novamente.:")
        leia(c)
       ate (c>=0) e (c<=10)//
         max <- max + 1  // a variavel max receb mais um pois foi executado uma jogada
        jogo[l,c]<- "T" // o lugar falado pelo jogador recebera um "T" para identifica��o
       vencedor()// ser� verificado se o jogador venceu
      direcao() // a variavel direcao ira receber uma dire��o
     moita()// reinicia o processo
    senao
      max <- max + 1 // a variavel max receb mais um pois foi executado uma jogada
        jogo[l,c]<- "T" // o lugar falado pelo jogador recebera um "T" para identifica��o
       vencedor()// ser� verificado se o jogador venceu
      direcao() // a variavel direcao ira receber uma dire��o
     moita()// reinicia o processo
    fimse
 senao // se a linha digitada for valida
    escreval("")
     escreva ("Digite uma coluna.:")// solicitar uma coluna
    leia(c)
     se (c<0) ou (c>10)entao// se a coluna for invalida solicitar novamente
       repita //repetir
        escreval("")
         escreva("Coluna incorreta, por favor, digite novamente.:")
          leia(c)
       ate(c>=0) e (c<=10)// ate que a coluna seja valida
           max <- max + 1 // a variavel max receb mais um pois foi executado uma jogada
          jogo[l,c]<- "T" // o lugar falado pelo jogador recebera um "T" para identifica��o
         vencedor()// ser� verificado se o jogador venceu
        direcao() // a variavel direcao ira receber uma dire��o
       moita()// reinicia o processo
     senao
       max <- max + 1 // a variavel max receb mais um pois foi executado uma jogada
        jogo[l,c]<- "T" // o lugar falado pelo jogador recebera um "T" para identifica��o
        vencedor()// ser� verificado se o jogador venceu
       direcao() // a variavel direcao ira receber uma dire��o
      moita()// reinicia o processo
     fimse
 fimse
fimse
fimenquanto
fimprocedimento//fimprocedimento
//===========================================================================//
procedimento direcao()//inicio procedimento
inicio
se l < lr entao // se a linha digitada for menor que a linha do monstro
  se c = lc entao // se a coluna digitada for igual a coluna do mostro
    dire <- "                 SUL" // dire recebe Sul
  senao //senao se a coluna digitada for menor a coluna do mostro
     se c < lc entao
      dire <- "             SUDESTE"// dire recebe Sudeste
     senao// senao claramente a coluna so pode ser maior
      dire <- "           SUDOESTE"// dire recebe Sudoeste
     fimse
  fimse
senao// senao ou seja se a linha for maior que a linha do monstro
   se l > lr   entao
     se c = lc entao // se a coluna digitada for igual a coluna do mostro
      dire <- "               NORTE" //dire recebe norte
     senao //senao se a coluna digitada for menor a coluna do mostro
        se c < lc entao
         dire <- "           NORDESTE" //dire recebe nordeste
        senao //senao claramente a coluna so pode ser maior
         dire <- "           NOROESTE"//dire recebe noroeste
        fimse
    fimse
   senao// senao linha so pode ser igual
      se c < lc entao// se coluna digitada menor que coluna do mostro
        dire <- "               LESTE" //dire recebe leste
      senao // senao se coluna digitada menor que a do monstro
         se c > lc entao
           dire <- "               OESTE"//dire recebe oeste
         fimse
      fimse
   fimse
fimse
fimprocedimento//fimprocedimento
//===========================================================================//
procedimento vencedor()//inicio procedimento
inicio
se (l = lr) e (c = lc) entao// se linha e coluna digitadas forem iguais a do mostro
  vence <- verdadeiro// a variavel vence recebe verdadeiro
  max <- 6 // e o numero de jogadas recebe 6 deste modo acabando o jogo
fimse
fimprocedimento//fimprocedimento
//===========================================================================//
procedimento fim()//inicio procedimento
inicio
se vence = falso entao // se o jogador esgotou as suas jogadas ele perde
 escreval("")
  escreval("===================")
   escreval("   FIM DE JOGO")
    escreval("===================")
     escreval("===================")
    escreval("   VOC� PERDEU !!")
   escreval("===================")
  escreval("")
senao // se ele achou o monstro ele vence
 escreval("|||||||||")// desenho de um monstro kkkkkkkk
  escreval("|||||||||")
   escreva("")
    escreval("|_|||||_|")
     escreval("|vvvvvvv")
      escreval("|")
       escreval("| N�OOOO VOC� ME ACHOU !!")
        escreval("|")
         escreval("|^^^^^^^")
         escreval("|||||||||")
        escreval("|| ||")
       escreval("")
      escreval("===================")
     escreval("     PARAB�NS")
    escreval("")
   escreval(" VOC� ACHOU O MONSTRO !!")
  escreval("===================")
 escreval("")
fimse
escreva("JOGAR NOVAMENTE ? ")// apos o fim do jogo ele pergunta jogar novamente ?
escreval("Sim ou N�o")
leia(repetir)

se (repetir = "Sim") ou (repetir = "sim") entao // se Sim ou sim come�a tudo de novo
    preencherMatriz() // sua fun��o � preencher a matriz e dar o simbolo * para todos os locais
    monstro()// gerar um lugar aleatorio para o monstro
    moita()// desenhar o jogo na tela ( tabela, dire��o, locais ja ditos com "T")
    jogando()//entrada da linha e coluna pelo usuario( al�m de verificar se o jogador vence, atribui a dire�ao)
    direcao()//responsavel por dar as dire�oes do mostro em rela�ao ao ponto dito pelo usuario
    vencedor()//verificar se o jogador venceu
    fim()//encerramento do jogo( venceu ou perdeu) e resonsavel por perguntar se o jogador quer jogar denovo
senao // senao o jogo agradece por jogar
      escreval("")
       escreval("===================")
        escreval("OBRIGADO POR JOGAR !!")
       escreval("===================")
      escreval("")
fimse
fimprocedimento//fimprocedimento
//===========================================================================//
Inicio
preencherMatriz()// sua fun��o � preencher a matriz e dar o simbolo * para todos os locais
monstro()// gerar um lugar aleatorio para o monstro
moita()// desenhar o jogo na tela ( tabela, dire��o, locais ja ditos com "T")
jogando()//entrada da linha e coluna pelo usuario( al�m de verificar se o jogador vence, atribui a dire�ao)
direcao()//responsavel por dar as dire�oes do mostro em rela�ao ao ponto dito pelo usuario
vencedor()//verificar se o jogador venceu
fim()//encerramento do jogo( venceu ou perdeu) e resonsavel por perguntar se o jogador quer jogar denovo
Fimalgoritmo