#include <hmg.ch>


//FUNCTION ReadCSVToArray()
//   LOCAL aData := {}
//   LOCAL cLine := ""
//   LOCAL hFile := MEMOREAD("P:\Sistemas\Rafael\DataTickets\DataTickets.csv")  // Open the CSV file for reading
//   nLines := MLCOUNT(hFile,180)
//   
//	IF nLines > 0
//		FOR EACH cLine IN hb_ATokens(hFile, .t. )  
//			
//			registro:=alltrim(cLine)
//			aTokens:=hb_ATokens(registro,',',.t.)
//			ASize(aTokens,5)
//			AADD(aData,aTokens)
//		NEXT
//		FClose(hFile) 
//	ELSE
//		? "Error opening file:", cFileName
//	ENDIF
//	
//RETURN aData