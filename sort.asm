; bernardo_pandolfi_costa_addition.asm
;
; Title: 16 bit addition program for 8085
;
; Author: Bernardo Pandolfi Costa (19207646)
;
; Date: 06-Nov-2022
;
; Atividade:
; 
; 1. Quando o botão RST 7.5 for acionado, o programa deverá ler os valores das portas de entrada 00H – 09H.
; 2. Os valores devem ser salvos no endereço 1000H até o endereço 1009H em ordem crescente, ou seja, o menor valor deverá ser salvo no endereço 1000H, o segundo menor valor no endereço 1001H, e assim por diante, até o maior valor sendo salvo no endereço 1009H.
; 3. Enquanto o botão RST 7.5 não for acionado o programa deverá ficar em “stand by” (isto é, sem fazer nenhum tipo de operação).
;     * Note que para estar em “stand by” não devemos usar a instrução HLT.
; 4. Após terminar a ordenação e salvamento dos dados, o programa deverá retornar para o modo “stand by”.
; 
; Resumo dos passos:
; 1. Criar um loop infinito de standby. O loop só vai ser quebrado quando o interruptor RST 7.5 for ativado, que vai pular para a instrução no endereço 003CH.
; 2. Quando o interruptor for ativado, começar o algoritmo de ordenação.
; 3. Ler os valores nas portas de entrada.
; 4. Salvar os valores das portas de entrada em forma de vetor nas endereços de memória indicadas (1000H-1009H).
; 5. Começar a ordenação.
;   5.1. Ler cada número do vetor e comparar com os outros.
;   5.2. Caso um número do vetor for menor que o da coordenada atual e tem uma coordenada maior, trocamos eles de lugar.
;   5.3. Ao fim da ordenação, voltar ao modo stand by.

.org 0039H                  ; programa começa na endereço 0039H
stdby:  JMP stdby

        LXI H, 1000H        ; guiamos a memória onde queremos
        IN 00H              ; lemos o que está na coordenda 00H
        MOV M, A            ; colocamos o primeiro valor do vetor na memória 0000H
        INX H               ; adicionamos 1 à endereço do nosso vetor
        IN 01H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 02H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 03H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 04H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 05H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 06H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 07H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 08H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
        IN 09H              ; lemos o próximo valor do vetor
        MOV M, A            ; colocamos o atual valor do vetor na memória
        INX H               ; vamos à próximo endereço do vetor
                            ; neste momento, temos um vetor na memória
                            ; agora vamos poder comparar cada valor de forma mais fácil
inicio: LXI H, 1000H        ; colocamos a endereço de memória no início do vetor
        MVI D, 00H          ; D=00H, a variável auxiliar que vai indicar se houve troca
        MVI C, 09H          ; C=09H (tamanho do vetor)
check:  MOV A, M            ; colocamos o valor da memória no acumulador 
        INX H               ; vamos ao próximo valor do vetor
        CMP M               ; comparamos o valor atual com o da última endereço
        JC prox             ; se houver carry, significa que A < M
        JZ prox             ; se M = A, só continua
        MOV B, M            ; colocamos o valor de M em B para salvar o antigo valor do vetor e trocá-lo de lugar
        MOV M, A            ; movemos o valor de A (maior que M) ao seu novo lugar no vetor
        DCX H               ; diminuímos em 1 o índice do vetor para salvar o novo número na casa anterior
        MOV M, B            ; salvamos o valor antigo na sua nova casa
        INX H               ; aumentamos a endereço da memória
        MVI D, 01H          ; D=01H para indicar que houve uma troca de posições
prox:   DCR C               ; C=C-1 
        JNZ check           ; se C=0, terminamos a ordenação
        MOV A, D            ; movemos o valor de D ao acumulador pra ver se houve ou não troca
        RRC                 ; para verificar se houve ou não troca
        JC inicio           ; se tem carry, continuamos para a próxima verificação
        JMP stdby           ; voltamos pro modo stand by