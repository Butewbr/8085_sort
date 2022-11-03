# Ordenador 8085
Programa de ordenador de 10 valores em 8085.

Este programa foi feito para uma tarefa da disciplina Organização e Arquitetura de Computadores I. Segue a tarefa:


## Tarefa 3:

1. Quando o botão RST 7.5 for acionado, o programa deverá ler os valores das portas de entrada 00H – 09H.
2. Os valores devem ser salvos no endereço 1000H até o endereço 1009H em ordem crescente, ou seja, o menor valor deverá ser salvo no endereço 1000H, o segundo menor valor no endereço 1001H, e assim por diante, até o maior valor sendo salvo no endereço 1009H.
3. Enquanto o botão RST 7.5 não for acionado o programa deverá ficar em “stand by” (isto é, sem fazer nenhum tipo de operação).
    * Note que para estar em “stand by” não devemos usar a instrução HLT.
4. Após terminar a ordenação e salvamento dos dados, o programa deverá retornar para o modo “stand by”.