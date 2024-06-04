#include <hmg.ch>
#require "hbsqlit3"
#include "hmg.ch"

Function Main

	//  ____             _____  ______  _____   ______  _____         _______  ____    _____ 
	// |  _ \    /\     / ____||  ____||  __ \ |  ____||  __ \    /\ |__   __|/ __ \  / ____|
	// | |_) |  /  \   | (___  | |__   | |  | || |__   | |  | |  /  \   | |  | |  | || (___  
	// |  _ <  / /\ \   \___ \ |  __|  | |  | ||  __|  | |  | | / /\ \  | |  | |  | | \___ \ 
	// | |_) |/ ____ \  ____) || |____ | |__| || |____ | |__| |/ ____ \ | |  | |__| | ____) |
	// |____//_/    \_\|_____/ |______||_____/ |______||_____//_/    \_\|_|   \____/ |_____/ 
   ? sqlite3_libversion()
   sqlite3_sleep( 3000 )

   IF sqlite3_libversion_number() < 3005001
      RETURN
   ENDIF
   
   	PUBLIC lCreateIfNotExist := .T.
	PUBLIC db := sqlite3_open( "P:\Sistemas\Rafael\DataTickets\dataTickets.db", lCreateIfNotExist )
   
	
	
//  _____   _    _  ____   _       _____  _____  __      __       _____  
// |  __ \ | |  | ||  _ \ | |     |_   _|/ ____| \ \    / //\    |  __ \ 
// | |__) || |  | || |_) || |       | | | |       \ \  / //  \   | |__) |
// |  ___/ | |  | ||  _ < | |       | | | |        \ \/ // /\ \  |  _  / 
// | |     | |__| || |_) || |____  _| |_| |____     \  // ____ \ | | \ \ 
// |_|      \____/ |____/ |______||_____|\_____|     \//_/    \_\|_|  \_\

	PUBLIC ticketsRowRecibidas := {}
	
	PUBLIC ticketsRowEnviadas := {}
	
	PUBLIC aEquipos := {"Gabinete","Impresora","Telefono","Teclado","Mouse","Red","Otro Razon"}
	
	PUBLIC aDptos := {"Calidad y Procesos","Supervision","Sistemas","Facturacion","Atencion clientes","80 20","Contratos","CIGA","Cajas","Cortes","Gerencia General","Contabilidad","Contraloria","Gerencia Tecnica","Laboratorio","Capacitacion","Recursos Humanos","Nominas","Redes","Almacen","Compras","Vehiculos","Carpinteria","Mantenimiento","Padron","Juridico","Normatividad","Calidad del agua","Mantenimiento planta centro","Seguridad e Higiene"}
		
	PUBLIC idRegitrySelected := nil
	
	PUBLIC currentNumEmp := ""
	
	PUBLIC currentDepartamento := ""

	PUBLIC currentPassword := ""
	
	PUBLIC nRows := 0
//  _       ____    _____  _____  _   _  ______  ____   _____   __  __ 
// | |     / __ \  / ____||_   _|| \ | ||  ____|/ __ \ |  __ \ |  \/  |
// | |    | |  | || |  __   | |  |  \| || |__  | |  | || |__) || \  / |
// | |    | |  | || | |_ |  | |  | . ` ||  __| | |  | ||  _  / | |\/| |
// | |____| |__| || |__| | _| |_ | |\  || |    | |__| || | \ \ | |  | |
// |______|\____/  \_____||_____||_| \_||_|     \____/ |_|  \_\|_|  |_|
	
	DEFINE WINDOW Login ;
		AUTORELEASE .T.; 
		AT 30,0 ;
		WIDTH 700 ;
		HEIGHT 300 ;
		TITLEBAR .F. ;
		BACKCOLOR {225,225,225,0};
		SIZABLE .F. ;
		CHILD;
		ON INIT isConnectionReady();
		
		DEFINE IMAGE halfLeft 
            PARENT Login 
            WIDTH 300 
            HEIGHT 300 
			STRETCH .T.
			PICTURE "./Images/BG.png"
		END IMAGE
		
		@ 20,40 LABEL lblTicket;
			VALUE "Ticket Manager";
			TRANSPARENT ;
			AUTOSIZE;
			FONT 'Courier' SIZE 22 ;
		
		@ 90,90 IMAGE imgTicketLogo PICTURE "./Images/ticketLogo.png"  WIDTH 120 HEIGHT 120
		
		@ 30 ,445 LABEL lblSignIn;
			VALUE "SIGN IN";
			TRANSPARENT ;
			AUTOSIZE;
			FONT 'Courier' SIZE 20 ;
			
		@ 80 ,325 LABEL lblEmpleado;
			VALUE "NUM# Empleado";
			TRANSPARENT ;
			AUTOSIZE;
			FONT 'Courier' SIZE 10 ;
		
		@ 100,325 TEXTBOX txtNumEmpleado ;
			WIDTH 50 ;
			MAXLENGTH 4;
			UPPERCASE ;
			ON CHANGE logIn();
			
		@ 100,385 TEXTBOX txtUsuario_Login ;
			VALUE "" ;
			WIDTH 287 ;
			READONLY ;
		
		@ 130 ,325 LABEL lblPassword;
			VALUE "Password";
			TRANSPARENT ;
			AUTOSIZE;
			FONT 'Courier' SIZE 10 ;
			

		@ 150,325 TEXTBOX txtPassword ;
			WIDTH 337 ;
			PASSWORD ;
			ON ENTER OnEnterHandle_txtPassword();
			
		@ 200,350 LABEL lblWait;
			VALUE "ESPERE UN MOMENTO" ;
			WIDTH 400 ;
			TRANSPARENT;
			FONT 'Courier' SIZE 22 ;
			BOLD;
			INVISIBLE;
			
		DEFINE BUTTON btnExitButton
			
			COL 650
			ROW 0
			PARENT Login
			CAPTION "X"
			WIDTH 50
			HEIGHT 20
			ACTION Thiswindow.Release

		END BUTTON
		
		DEFINE BUTTON btnHelpButton
			
			COL 650
			ROW 250
			PARENT Login
			CAPTION "?"
			WIDTH 30
			HEIGHT 30
			FONTSIZE 20
			FONTBOLD .T.
			ACTION activateNewUserForm()

		END BUTTON
	END WINDOW
	CENTER WINDOW Login
	ACTIVATE WINDOW Login
	
Return


FUNCTION activateNewUserForm
	LOCAL newUser := ""
	Load Window NewUser
	NewUser.Center
	NewUser.Activate
RETURN

function logIn()
	currentNumEmp := Login.txtNumEmpleado.value
	if len(currentNumEmp) == 4
		Login.lblWait.visible := .T.
		user := seekUser(currentNumEmp)
		//msgbox(user[2]) 
		IF user[2]
			Login.lblWait.visible := .F.
			MSGBOX("Este usario no existe")
			Login.txtUsuario_Login.value := ""
			RETURN
		ENDIF
		Login.txtUsuario_Login.value := HB_HGet( user[1], "fullName" )
		currentPassword := HB_HGet( user[1], "password" )
		currentDepartamento := HB_HGet( user[1], "dpto" )
		Login.lblWait.visible := .F.
	endif
return nil

FUNCTION OnEnterHandle_txtPassword()
	IF Login.txtPassword.value == currentPassword
		Login.lblWait.visible := .T.
		Load Window Home
		Home.Center
		Home.lblUsuario_Home.value := Login.txtUsuario_Login.value
		fetchDbRecibidas()
		fetchDbEnviadas()
		Login.lblWait.visible := .F.
		Login.release
		Home.activate
	ELSE
		MsgExclamation ( 'La contrasena es incorrecta!' ,'Atencion!')
	ENDIF

FUNCTION OnDblClickHandle_dvgEnviadas()
	LOCAL rowValues := Home.dgvTicketsEnviadas.item(This.CellRowIndex)
	Home.btnEditar.visible := .T.
	Home.txtDptoRO.visible := .T.
	Home.txtEquipoRO.visible := .T.
	Home.btnEliminar.visible := .T.
	
	Home.btnAgregar.visible := .F.
	Home.cmbEquipos.visible := .F.
	Home.cmbDeptos.visible := .F.
	
	
	idRegitrySelected := rowValues[1]
	Home.txtEquipoRO.value := rowValues[3]
	Home.txtDptoRO.value := rowValues[7]
	Home.txtDesc.value := rowValues[8]
	Home.txtNotas.value := rowValues[9]
RETURN

FUNCTION OnClickHandle_btnCreateUser()
	IF Empty(NewUser.txtNewNumEmpUser.value) .OR. Empty(NewUser.txtNewNameUser.value) .OR. Empty(NewUser.txtNewPasswordUser.value) .OR. Empty(NewUser.cmbNewDptos.value)
		MsgExclamation ( 'Todos los campos deben estar llenos!' ,'Atencion!')
		RETURN
	ENDIF
	
	
	IF .not. seekUser(NewUser.txtNewNumEmpUser.value)[2]
		MsgExclamation ( 'El usuario ya existe!' ,'Atencion!')
		RETURN
	ENDIF

	IF fetchAdminPass(newUser.txtAdminPass.value)[2]
		MsgExclamation ( 'La contrasena de administrador es incorrecta!' ,'Atencion!')
		RETURN
	ENDIF
	
	createUser(NewUser.txtNewNumEmpUser.value,NewUser.txtNewNameUser.value,aDptos[NewUser.cmbNewDptos.value],NewUser.txtNewPasswordUser.value)
	
	MsgInfo ( "El usuario se a agregado con exito.", "Usuario Agregado")
	
	NewUser.release
RETURN nil

FUNCTION OnDblClickHandle_dvgRecibidas()
	LOCAL rowValues := Home.dgvTicketsRecibidas.item(This.CellRowIndex)
	Home.btnEditar.visible := .T.
	Home.txtDptoRO.visible := .T.
	Home.txtEquipoRO.visible := .T.
	
	Home.btnEliminar.visible := .F.
	Home.btnAgregar.visible := .F.
	Home.cmbEquipos.visible := .F.
	Home.cmbDeptos.visible := .F.
	
	
	idRegitrySelected := rowValues[1]
	Home.txtEquipoRO.value := rowValues[3]
	
	Home.cmbStatus.value := rowValues[6]
	Home.txtDptoRO.value := rowValues[7]
	Home.txtDesc.value := rowValues[8]
	Home.txtNotas.value := rowValues[9]
RETURN

FUNCTION OnChangeHandle_cmbEquipos()
	IF Home.cmbEquipos.value == LEN(aEquipos)
		Home.txtOtro.visible := .T.
		RETURN .T.
	ELSE
		Home.txtOtro.visible := .F.
		RETURN .F.
	ENDIF
	
RETURN

FUNCTION OnClickHandle_btnAgregar()
	LOCAL currentDate := STR(DAY(Date())) +"/"+ CMONTH(Date()) +"/"+ STR(YEAR(Date()))
	
	IF Empty(Home.cmbDeptos.value) .OR. Empty(Home.txtDesc.value)
		MsgExclamation ( 'Todos los campos deben estar llenos!' ,'Atencion!')
		RETURN
	ENDIF
	CharRem(Home.txtDesc.value,"{")
	CharRem(Home.txtDesc.value,"}")

	CharRem(Home.txtNotas.value,"{")
	CharRem(Home.txtNotas.value,"}")

	CharRem(Home.txtOtro.value,"{")
	CharRem(Home.txtOtro.value,"}")

	WaitWindow("Espere un momento",.T.)
	IF OnChangeHandle_cmbEquipos()
		IF Empty(Home.txtOtro.value)
			MsgExclamation ( 'Todos los campos deben estar llenos!' ,'Atencion!')
			RETURN
		ENDIF
		addNewTicket(currentNumEmp,Home.txtOtro.value,currentDate,TIME(),"PENDIENTE",aDptos[Home.cmbDeptos.value],Home.txtDesc.value,Home.txtNotas.value)
	ELSE
		IF Empty(Home.cmbEquipos.value)
			MsgExclamation ( 'Todos los campos deben estar llenos!' ,'Atencion!')
			RETURN
		ENDIF
		addNewTicket(currentNumEmp,aEquipos[Home.cmbEquipos.value],currentDate,TIME(),"PENDIENTE",aDptos[Home.cmbDeptos.value],Home.txtDesc.value,Home.txtNotas.value)
	ENDIF
	
	clearAllControls()
	Home.dgvTicketsEnviadas.DeleteAllItems()
	Home.dgvTicketsRecibidas.DeleteAllItems()
	fetchDbRecibidas()
	fetchDbEnviadas()
	Wait CLEAR
	
	MsgInfo ( "El registro se a agregado con exito.", "Registro Agregado")
RETURN NIL

FUNCTION OnClickHandle_btnEditar()
	WaitWindow("Espere un momento",.T.)
	Home.dgvTicketsEnviadas.DeleteAllItems()
	Home.dgvTicketsRecibidas.DeleteAllItems()
	IF Home.tbMenu.value == 1
		updateTicketSender(idRegitrySelected,Home.txtDesc.value)
	ELSE
		updateTicketReciever(idRegitrySelected,Home.cmbStatus.value,Home.txtNotas.value)
	ENDIF
	MsgInfo ( "El registro se a editado con exito.", "Registro Editado")
	
	clearAllControls()
	fetchDbRecibidas()
	fetchDbEnviadas()
	WAIT CLEAR
RETURN

FUNCTION OnClickHandle_btnEliminar()
	WaitWindow("Espere un momento",.T.)
	Home.dgvTicketsEnviadas.DeleteAllItems()
	Home.dgvTicketsRecibidas.DeleteAllItems()
	// deleteTicket(idRegitrySelected)
	
	MsgInfo ( "El registro se a eliminado con exito.", "Registro Eliminado")
	
	clearAllControls()
	fetchDbRecibidas()
	fetchDbEnviadas()
	WAIT CLEAR
	
RETURN

FUNCTION setItemEnviadas(values)
	Home.dgvTicketsEnviadas.AddItem(values)
RETURN

FUNCTION setItemRecibidas(values)
	Home.dgvTicketsRecibidas.AddItem(values)
RETURN

FUNCTION clearAllControls()
	Home.dgvTicketsEnviadas.DeleteAllItems()
	Home.dgvTicketsRecibidas.DeleteAllItems()

	idRegitrySelected := nil
	
	Home.txtDesc.value := ""
	Home.txtNotas.value := ""
	Home.txtOtro.value := ""
	
	Home.cmbEquipos.value := 0
	Home.cmbDeptos.value := 0
	Home.cmbStatus.value := 0
	
	
	Home.btnEditar.visible := .F.
	Home.txtEquipoRO.visible := .F.
	Home.txtDptoRO.visible := .F.
	Home.btnEliminar.visible := .F.
	
	
	Home.btnAgregar.visible := .T.
	Home.cmbEquipos.visible := .T.
	Home.cmbDeptos.visible := .T.
	
	IF Home.tbMenu.value == 2
		WaitWindow("Espere un momento",.T.)
		fetchDbRecibidas()
		Home.txtNotas.ReadOnly := .F.
		Home.txtDesc.ReadOnly := .T.
		Home.lblStatus.visible := .T.
		Home.cmbStatus.visible := .T.
		Home.btnAgregar.visible := .F.
		WAIT CLEAR
	ELSE
		WaitWindow("Espere un momento",.T.)
		fetchDbEnviadas()
		Home.txtNotas.ReadOnly := .T.
		Home.txtDesc.ReadOnly := .F.
		Home.lblStatus.visible := .F.
		Home.cmbStatus.visible := .F.
		WAIT CLEAR
	ENDIF
RETURN