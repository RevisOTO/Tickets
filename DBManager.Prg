#include <hmg.ch>
#include <hbcurl.ch>

// FUNCTION addNewTicket(NUMEMP,TIPO,FECHA,HORA,STATUS,DPTO,DESC,NOTAS)
// 	LOCAL QUERY := "INSERT INTO Tickets( NUMEMP,TIPO,FECHA,HORA,STATUS,DEPARTAMENTO,DESC,NOTAS ) VALUES('"+NUMEMP+"', '"+TIPO+"','"+FECHA+"','"+HORA+"','"+STATUS+"','"+DPTO+"','"+DESC+"','"+NOTAS+"' );"
	
// 	//MSGBOX(QUERY)
// 	  sqlite3_exec( db, ;
// 	 "BEGIN TRANSACTION;" + ;
// 	 QUERY + ;
// 	 "COMMIT;" )
// 	 sqlite3_sleep( 3000 ) 
// RETURN

// FUNCTION updateTicket(ID,DESC,NOTAS)
// 	LOCAL QUERY := "UPDATE 'Tickets' SET 'DESC' = '"+DESC+"','NOTAS' = '"+NOTAS+"' WHERE ID = "+ID+";"
	
// 	//MSGBOX(QUERY)
// 	  sqlite3_exec( db, ;
// 	 "BEGIN TRANSACTION;" + ;
// 	 QUERY + ;
// 	 "COMMIT;" )
// 	 sqlite3_sleep( 3000 )
// RETURN

// FUNCTION deleteTicket(ID)
// 	LOCAL QUERY := "DELETE FROM 'Tickets' WHERE 'ID' = "+ID+";"
	 
// 	sqlite3_exec( db, ;
// 	 "BEGIN TRANSACTION;" + ;
// 	 QUERY + ;
// 	 "COMMIT;" )
// 	 sqlite3_sleep( 3000 )
// RETURN

// FUNCTION fetchDbEnviadas()
//    LOCAL cSQLTEXT := "SELECT * FROM Tickets WHERE NUMEMP = '"+currentNumEmp+"';"
//    LOCAL cb := @CallBack_fetchDBEnviadas() // "CallBack"
// 	sqlite3_exec( db, cSQLTEXT, cb )
// RETURN NIL


// FUNCTION CallBack_fetchDBEnviadas( nColCount, aValue, aColName )
	
// 	LOCAL aAuxValuesRow := {}
	
// 	LOCAL nI
// 	FOR nI := 1 TO nColCount
// 		? PadR( aColName[ nI ], 5 ), " == ", aValue[ nI ]
// 		AADD(aAuxValuesRow, aValue[ nI ])
// 	NEXT   
// 	setItemEnvaidas(aAuxValuesRow)
// 	sqlite3_sleep( 3000 )
// RETURN 0


// FUNCTION fetchDbRecibidas()
//    LOCAL cSQLTEXT := "SELECT * FROM Tickets WHERE DEPARTAMENTO = '"+currentDepartamento+"';"
//    LOCAL cb := @CallBack_fetchDBRecibidas() // "CallBack"
// 	sqlite3_exec( db, cSQLTEXT, cb )
// RETURN NIL

// FUNCTION CallBack_fetchDBRecibidas( nColCount, aValue, aColName )
	
// 	LOCAL aAuxValuesRow := {}
	
// 	LOCAL nI
// 	FOR nI := 1 TO nColCount
// 		? PadR( aColName[ nI ], 5 ), " == ", aValue[ nI ]
// 		AADD(aAuxValuesRow, aValue[ nI ])
// 	NEXT
	
// 	aAuxValuesRow[6] := statusCon(aAuxValuesRow[6],.F.)
// 	//msgbox(aAuxValuesRow[6])
// 	setItemRecibidas(aAuxValuesRow)
// 	sqlite3_sleep( 3000 )
// RETURN 0

FUNCTION statusCon(value,isNum)
//'PENDIENTE','REVISADO','TERMINADO','REINCIDENCIA'
	conversion := ""
	IF isNum
	   DO CASE
		CASE value = 1
		  RETURN 'PENDIENTE'
		CASE value = 2
		  RETURN 'REVISADO'
		CASE value = 3
		  RETURN 'TERMINADO'
		CASE value = 4
		  RETURN 'REINCIDENCIA'
	   ENDCASE
	ELSE
	   DO CASE
		CASE value = 'PENDIENTE'
		  RETURN 1
		CASE value = 'REVISADO'
		  RETURN 2
		CASE value = 'TERMINADO'
		  RETURN 3
		CASE value = 'REINCIDENCIA'
		  RETURN 4
	   ENDCASE
	ENDIF
RETURN

FUNCTION isConnectionReady()
	LOCAL cURL := "https://zhgxpns6-3000.usw3.devtunnels.ms/"
	LOCAL cResponse := genericHTTPRequest(cURL, "GET", "")
	IF !Empty(cResponse)
		
	ELSE
		msgstop("Sistema no disponible, intente mas tarde o contacte a sistemas")
	ENDIF
RETURN

function genericHTTPRequest(extension, nChoice, cData)
	local uValue
	LOCAL cURL := "https://zhgxpns6-3000.usw3.devtunnels.ms/"+extension
	aHeader := {}
  curl_global_init()

  if ! empty( hCurl := curl_easy_init() )
    //Set the headers:
	AADD(aHeader, "Content-Type: application/json")
	
 	curl_easy_setopt(hCurl,HB_CURLOPT_HTTPHEADER,aHeader)
    //Set the URL:
    curl_easy_setopt( hCurl, HB_CURLOPT_URL, cURL ) 
	

	//Set the request type:
	DO CASE
	CASE nChoice = "GET"
		//curl_easy_setopt( hCurl, HB_CURLOPT_GET, .T. )
	CASE nChoice = "POST"
		curl_easy_setopt( hCurl, HB_CURLOPT_POST, .T. )
		curl_easy_setopt(hCurl, HB_CURLOPT_POSTFIELDS, cData)
	CASE nChoice = "PUT"
		curl_easy_setopt(hCurl, HB_CURLOPT_CUSTOMREQUEST, "PUT")
		curl_easy_setopt(hCurl, HB_CURLOPT_POSTFIELDS, cData)
	CASE nChoice = "DELETE"
		curl_easy_setopt( hCurl, HB_CURLOPT_CUSTOMREQUEST, "DELETE" )
	ENDCASE
 
	
    //Disabling the SSL peer verification (you can use it if you have no SSL certificate yet, but still want to test HTTPS)
    curl_easy_setopt(hCurl, HB_CURLOPT_FOLLOWLOCATION, 1)
    curl_easy_setopt(hCurl, HB_CURLOPT_SSL_VERIFYPEER, 0)      

    //Setting the buffer
    curl_easy_setopt( hCurl, HB_CURLOPT_DL_BUFF_SETUP )
    
    //Sending the request and getting the response
    IF (nret:=curl_easy_perform( hCurl )) == 0
        uValue := curl_easy_dl_buff_get( hCurl )
    ENDIF
  ENDIF

  curl_global_cleanup()   

  
return uValue

FUNCTION seekUser(numEmp)
	LOCAL res := ""
	LOCAL user := ""
	LOCAL cUrl := "user?numEmp="+numEmp
	LOCAL cResponse := genericHTTPRequest(cURL, "GET", "")
	hb_jsonDecode(cResponse,@res)

	IF cResponse == "Error"
		RETURN {nil,.T.}
	ELSE
		RETURN {res, .F.}
	ENDIF
RETURN

FUNCTION createUser(numEmp, nombre, dpto, pass)
	LOCAL cUrl := "createUser"
	LOCAL cData := '{"numEmp":"' + numEmp + '","fullName":"' + nombre + '","dpto":"' + dpto + '","password":"' + pass + '"}'
	LOCAL cResponse := genericHTTPRequest(cURL, "POST", cData)
RETURN cResponse

FUNCTION fetchAdminPass(pass)
	LOCAL res := ""
	LOCAL cUrl := "admin?pass="+pass
	LOCAL cResponse := genericHTTPRequest(cURL, "GET", "")
	hb_jsonDecode(cResponse,@res)

	IF cResponse == "Error"
		RETURN {nil,.T.}
	ELSE
		RETURN {res, .F.}
	ENDIF
RETURN

FUNCTION addNewTicket(NUMEMP, TIPO, FECHA, HORA, STATUS, DPTO, DESC, NOTAS)
	LOCAL cUrl := "createTicket"
	LOCAL cData := '{"NUMEMP":"' + NUMEMP + '","TIPO":"' + TIPO + '","FECHA":"' + FECHA + '","HORA":"' + HORA + '","STATUS":"' + STATUS + '","DEPARTAMENTO":"' + DPTO + '","DESC":"' + DESC + '","NOTAS":"' + NOTAS + '"}'
	LOCAL cResponse := genericHTTPRequest(cURL, "POST", cData)
RETURN cResponse

FUNCTION updateTicketReciever(ID, STATUS, NOTAS)
	LOCAL cUrl := "updateTicketReciver"
	LOCAL cData := '{"ID":"' + ID + '","STATUS":"' + statusCon(STATUS,.T.) + '","NOTAS":"' + NOTAS + '"}'
	LOCAL cResponse := genericHTTPRequest(cURL, "PUT", cData)
return cResponse

FUNCTION updateTicketSender(ID, DESC, NOTAS)
	LOCAL cUrl := "updateTicketSender"
	LOCAL cData := '{"ID":"' + ID + '","DESC":"' + DESC +'"}'
	LOCAL cResponse := genericHTTPRequest(cURL, "PUT", cData)
	
return cResponse

FUNCTION fetchDbEnviadas()
	uValue := ""
	res := ""
	jsonString := ""
	rowValue := {}
	cURL := "GETnumEmp?numEmp="+currentNumEmp
	uValue := genericHTTPRequest(cURL, "GET", "")
	 IF !Empty(uValue)
	 
	 	memowrit("Respuesta.json",uValue)
		fAnswer:=hb_memoread("Respuesta.JSON")
		IF empty(fAnswer)
			msgstop("No se pudo obtener respuesta del servidor")
			RETURN
		ENDIF
		jValueArray := arrayJsonConversion(fAnswer)

		FOR EACH jsonString IN jValueArray
			nLen := hb_jsonDecode(jsonString,@res)
			AADD(rowValue,HB_HGet(res,"ID"))
			AADD(rowValue,HB_HGet(res,"NUMEMP"))
			AADD(rowValue,HB_HGet(res,"TIPO"))
			AADD(rowValue,HB_HGet(res,"FECHA"))
			AADD(rowValue,HB_HGet(res,"HORA"))
			AADD(rowValue,HB_HGet(res,"STATUS"))
			AADD(rowValue,HB_HGet(res,"DEPARTAMENTO"))
			AADD(rowValue,HB_HGet(res,"DESC"))
			AADD(rowValue,HB_HGet(res,"NOTAS"))
			setItemEnviadas(rowValue)
			rowValue := {}
		NEXT

	 ENDIF
RETURN

FUNCTION fetchDbRecibidas()
	uValue := ""
	res := ""
	jsonString := ""
	rowValue := {}
	cURL := "GETdpto?dpto="+currentDepartamento
	uValue := genericHTTPRequest(cURL, "GET", "")
	 IF !Empty(uValue)
	 
	 	memowrit("Respuesta.json",uValue)
		fAnswer:=hb_memoread("Respuesta.JSON")
		IF empty(fAnswer)
			msgstop("No se pudo obtener respuesta del servidor")
			RETURN
		ENDIF
		jValueArray := arrayJsonConversion(fAnswer)

		FOR EACH jsonString IN jValueArray
			nLen := hb_jsonDecode(jsonString,@res)
			AADD(rowValue,HB_HGet(res,"ID"))
			AADD(rowValue,HB_HGet(res,"NUMEMP"))
			AADD(rowValue,HB_HGet(res,"TIPO"))
			AADD(rowValue,HB_HGet(res,"FECHA"))
			AADD(rowValue,HB_HGet(res,"HORA"))
			AADD(rowValue,statusCon(HB_HGet(res,"STATUS"),.F.))
			AADD(rowValue,HB_HGet(res,"DPTOSENDER"))
			AADD(rowValue,HB_HGet(res,"DESC"))
			AADD(rowValue,HB_HGet(res,"NOTAS"))
			setItemRecibidas(rowValue)
			rowValue := {}
		NEXT

	 ENDIF
RETURN

FUNCTION arrayJsonConversion(jsonArrayString)
	arrayJson := {}
	jsonString := ""
	writeFlag := .F.
	cChar := ""

	FOR EACH cChar IN jsonArrayString
		IF cChar == "{"
			writeFlag := .T.
		ELSEIF cChar == "}" 
			jsonString += "}"
			AADD(arrayJson, jsonString)
			
			jsonString := ""
			writeFlag := .F.
		ENDIF
		IF writeFlag
			jsonString += cChar
		ENDIF
	NEXT
RETURN arrayJson