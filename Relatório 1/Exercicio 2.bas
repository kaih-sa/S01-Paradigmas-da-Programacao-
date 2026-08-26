'Exercicio 1 de rel 1'
Dim pin_inserido As Integer
Dim pin_fixo As Integer
Dim contador As Integer

pin_fixo = 1846 
contador = 0

While contador = 0
    Print "Insira o PIN: "
    Input pin_inserido
    if pin_inserido = pin_fixo Then
        Print "Transacao autorizada!"
        contador = 1        
    Else 
        Print "PIN invalido. Tente novamente."

    End if
Wend

Sleep