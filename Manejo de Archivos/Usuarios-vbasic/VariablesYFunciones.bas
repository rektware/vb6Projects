Attribute VB_Name = "VariablesYFunciones"
Dim ArchUsuarios As Integer

Public Function Verificar_Existe(path) As Boolean
    
    If Len(Trim$(Dir$(path))) Then
        Verificar_Existe = True
    Else
        Verificar_Existe = False
        
    End If
    
    
    
End Function

