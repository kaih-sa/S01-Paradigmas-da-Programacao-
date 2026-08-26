'Exercicio 1 de rel 1'
Dim peso As Integer
Dim agua_ingerida As Integer
Dim meta As double

Print "Insira a quantidade de agua ingerida(em ml): "
Input agua_ingerida
Print "Insira seu peso(em kg): "
Input peso

meta = peso * 35
if agua_ingerida >= meta Then
    Print "Meta atingida!"
else
    Print "Meta nao atingida"
End if

Sleep