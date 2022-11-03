# Ordenador 8085
Programa ordenador de um vetor de 10 valores em 8085.

Este programa foi feito para uma tarefa da disciplina Organização e Arquitetura de Computadores I. Segue a tarefa:


## Tarefa 3:

1. Quando o botão RST 7.5 for acionado, o programa deverá ler os valores das portas de entrada 00H – 09H.
2. Os valores devem ser salvos no endereço 1000H até o endereço 1009H em ordem crescente, ou seja, o menor valor deverá ser salvo no endereço 1000H, o segundo menor valor no endereço 1001H, e assim por diante, até o maior valor sendo salvo no endereço 1009H.
3. Enquanto o botão RST 7.5 não for acionado o programa deverá ficar em “stand by” (isto é, sem fazer nenhum tipo de operação).
    * Note que para estar em “stand by” não devemos usar a instrução HLT.
4. Após terminar a ordenação e salvamento dos dados, o programa deverá retornar para o modo “stand by”.

### Resumo dos passos:
1. Criar um loop infinito de standby. O loop só vai ser quebrado quando o interruptor RST 7.5 for ativado, que vai pular para a instrução no endereço 003CH.
2. Quando o interruptor for ativado, começar o algoritmo de ordenação.
3. Ler os valores nas portas de entrada.
4. Salvar os valores das portas de entrada em forma de vetor nas endereços de memória indicadas (1000H-1009H).
5. Começar a ordenação.
    * Ler cada número do vetor e comparar com os outros.
    * Caso um número do vetor for menor que o da coordenada atual e tem uma coordenada maior, trocamos eles de lugar.
    * Ao fim da ordenação, voltar ao modo stand by.
