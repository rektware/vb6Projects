VERSION 5.00
Begin VB.Form frmCajeros 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Captura de Vendedores"
   ClientHeight    =   6990
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   15150
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   6990
   ScaleWidth      =   15150
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   3135
      Left            =   1920
      TabIndex        =   0
      Top             =   3120
      Width           =   12015
      Begin VB.TextBox txtCajero 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2040
         TabIndex        =   7
         Top             =   1200
         Width           =   1095
      End
      Begin VB.TextBox txtNombre 
         Height          =   375
         Left            =   2040
         TabIndex        =   4
         Top             =   720
         Width           =   5415
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Aceptar"
         Height          =   495
         Left            =   2280
         TabIndex        =   3
         Top             =   1800
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Limpiar"
         Height          =   495
         Left            =   3480
         TabIndex        =   2
         Top             =   1800
         Width           =   1095
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Salir"
         Height          =   495
         Left            =   4680
         TabIndex        =   1
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Image Image1 
         Height          =   2100
         Left            =   8760
         Picture         =   "Form2.frx":0000
         Top             =   600
         Width           =   2250
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "N� Vendedor:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   360
         TabIndex        =   6
         Top             =   1200
         Width           =   1425
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Nombre:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   960
         TabIndex        =   5
         Top             =   720
         Width           =   900
      End
   End
   Begin VB.Image Image2 
      Height          =   2415
      Left            =   2400
      Picture         =   "Form2.frx":32D8
      Top             =   240
      Width           =   11190
   End
End
Attribute VB_Name = "frmCajeros"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
ArchUsuarios = FreeFile
'/////////////////////////
'Verifica si ya Eiste el Cajero
 If BuscarCajero(txtCajero) = True Then
 MsgBox "El Cajero Ya Exite ", vbCritical, "VeraSoftDevelopment"
txtCajero = Empty
txtNombre = Empty
 Exit Sub
 End If
'//////////////////////////


If txtNombre = Empty Or txtCajero = Empty Then
MsgBox "Asegurese de Llenar Todos los Capos", vbCritical, "VeraSoft Developmet"
Exit Sub
End If

Open App.path + "\Cajeros.Dat" For Append As #ArchUsuarios
Print #ArchUsuarios, txtCajero
Print #ArchUsuarios, UCase(txtNombre)
Close #ArchUsuarios
MsgBox "Registro Agregado", vbExclamation, "VeraSoft Development"

txtCajero = Empty
txtNombre = Empty

End Sub

Private Sub Command2_Click()
txtCajero = Empty
txtNombre = Empty
End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub txtCajero_KeyPress(KeyAscii As Integer)
'VALIDA SI EL  DATO INTRODUCIDO
'ES NUMERICO
If IsNumeric(txtCajero.Text) = False Then
Beep
txtCajero = Empty
Exit Sub
End If
End Sub
