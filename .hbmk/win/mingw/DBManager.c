/*
 * Harbour 3.2.0dev (r1601151502)
 * MinGW GNU C 4.6.1 (32-bit)
 * Generated C source from "C:\Users\Rafael\Desktop\HarborProjects\Tickets\DBManager.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( STATUSCON );
HB_FUNC( ISCONNECTIONREADY );
HB_FUNC( GENERICHTTPREQUEST );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( MSGSTOP );
HB_FUNC_EXTERN( CURL_GLOBAL_INIT );
HB_FUNC_EXTERN( CURL_EASY_INIT );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( CURL_EASY_SETOPT );
HB_FUNC_EXTERN( CURL_EASY_PERFORM );
HB_FUNC_EXTERN( CURL_EASY_DL_BUFF_GET );
HB_FUNC_EXTERN( CURL_GLOBAL_CLEANUP );
HB_FUNC( SEEKUSER );
HB_FUNC_EXTERN( HB_JSONDECODE );
HB_FUNC( CREATEUSER );
HB_FUNC( FETCHADMINPASS );
HB_FUNC( ADDNEWTICKET );
HB_FUNC( UPDATETICKETRECIEVER );
HB_FUNC( UPDATETICKETSENDER );
HB_FUNC( FETCHDBENVIADAS );
HB_FUNC_EXTERN( MEMOWRIT );
HB_FUNC_EXTERN( HB_MEMOREAD );
HB_FUNC( ARRAYJSONCONVERSION );
HB_FUNC_EXTERN( HB_HGET );
HB_FUNC_EXTERN( SETITEMENVIADAS );
HB_FUNC( FETCHDBRECIBIDAS );
HB_FUNC_EXTERN( SETITEMRECIBIDAS );
HB_FUNC_EXTERN( ERRORSYS );


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_DBMANAGER )
{ "STATUSCON", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( STATUSCON )}, NULL },
{ "CONVERSION", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ISCONNECTIONREADY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( ISCONNECTIONREADY )}, NULL },
{ "GENERICHTTPREQUEST", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( GENERICHTTPREQUEST )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "MSGSTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGSTOP )}, NULL },
{ "AHEADER", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CURL_GLOBAL_INIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_GLOBAL_INIT )}, NULL },
{ "CURL_EASY_INIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_EASY_INIT )}, NULL },
{ "HCURL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "CURL_EASY_SETOPT", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_EASY_SETOPT )}, NULL },
{ "CURL_EASY_PERFORM", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_EASY_PERFORM )}, NULL },
{ "NRET", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CURL_EASY_DL_BUFF_GET", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_EASY_DL_BUFF_GET )}, NULL },
{ "CURL_GLOBAL_CLEANUP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURL_GLOBAL_CLEANUP )}, NULL },
{ "SEEKUSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( SEEKUSER )}, NULL },
{ "HB_JSONDECODE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_JSONDECODE )}, NULL },
{ "CREATEUSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( CREATEUSER )}, NULL },
{ "FETCHADMINPASS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( FETCHADMINPASS )}, NULL },
{ "ADDNEWTICKET", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( ADDNEWTICKET )}, NULL },
{ "UPDATETICKETRECIEVER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDATETICKETRECIEVER )}, NULL },
{ "UPDATETICKETSENDER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDATETICKETSENDER )}, NULL },
{ "FETCHDBENVIADAS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( FETCHDBENVIADAS )}, NULL },
{ "UVALUE", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "RES", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "JSONSTRING", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ROWVALUE", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CURRENTNUMEMP", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CURL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "MEMOWRIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( MEMOWRIT )}, NULL },
{ "HB_MEMOREAD", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_MEMOREAD )}, NULL },
{ "FANSWER", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ARRAYJSONCONVERSION", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( ARRAYJSONCONVERSION )}, NULL },
{ "JVALUEARRAY", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "NLEN", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HB_HGET", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_HGET )}, NULL },
{ "SETITEMENVIADAS", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETITEMENVIADAS )}, NULL },
{ "FETCHDBRECIBIDAS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( FETCHDBRECIBIDAS )}, NULL },
{ "CURRENTDEPARTAMENTO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETITEMRECIBIDAS", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETITEMRECIBIDAS )}, NULL },
{ "ARRAYJSON", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "WRITEFLAG", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CCHAR", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_DBMANAGER, "C:\\Users\\Rafael\\Desktop\\HarborProjects\\Tickets\\DBManager.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_DBMANAGER
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_DBMANAGER )
   #include "hbiniseg.h"
#endif

HB_FUNC( STATUSCON )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,36,81,0,106,1,0,83,1,0,36,82,
		0,95,2,28,112,36,84,0,95,1,122,5,28,19,
		36,85,0,106,10,80,69,78,68,73,69,78,84,69,
		0,110,7,36,86,0,95,1,92,2,5,28,18,36,
		87,0,106,9,82,69,86,73,83,65,68,79,0,110,
		7,36,88,0,95,1,92,3,5,28,19,36,89,0,
		106,10,84,69,82,77,73,78,65,68,79,0,110,7,
		36,90,0,95,1,92,4,5,29,132,0,36,91,0,
		106,13,82,69,73,78,67,73,68,69,78,67,73,65,
		0,110,7,36,95,0,95,1,106,10,80,69,78,68,
		73,69,78,84,69,0,5,28,8,36,96,0,122,110,
		7,36,97,0,95,1,106,9,82,69,86,73,83,65,
		68,79,0,5,28,9,36,98,0,92,2,110,7,36,
		99,0,95,1,106,10,84,69,82,77,73,78,65,68,
		79,0,5,28,9,36,100,0,92,3,110,7,36,101,
		0,95,1,106,13,82,69,73,78,67,73,68,69,78,
		67,73,65,0,5,28,9,36,102,0,92,4,110,7,
		36,105,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( ISCONNECTIONREADY )
{
	static const HB_BYTE pcode[] =
	{
		13,2,0,36,108,0,106,42,104,116,116,112,115,58,
		47,47,122,104,103,120,112,110,115,54,45,51,48,48,
		48,46,117,115,119,51,46,100,101,118,116,117,110,110,
		101,108,115,46,109,115,47,0,80,1,36,109,0,176,
		3,0,95,1,106,4,71,69,84,0,106,1,0,12,
		3,80,2,36,110,0,176,4,0,95,2,12,1,28,
		75,36,113,0,176,5,0,106,63,83,105,115,116,101,
		109,97,32,110,111,32,100,105,115,112,111,110,105,98,
		108,101,44,32,105,110,116,101,110,116,101,32,109,97,
		115,32,116,97,114,100,101,32,111,32,99,111,110,116,
		97,99,116,101,32,97,32,115,105,115,116,101,109,97,
		115,0,20,1,36,115,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( GENERICHTTPREQUEST )
{
	static const HB_BYTE pcode[] =
	{
		13,2,3,36,119,0,106,42,104,116,116,112,115,58,
		47,47,122,104,103,120,112,110,115,54,45,51,48,48,
		48,46,117,115,119,51,46,100,101,118,116,117,110,110,
		101,108,115,46,109,115,47,0,95,1,72,80,5,36,
		120,0,4,0,0,83,6,0,36,121,0,176,7,0,
		20,0,36,123,0,176,4,0,176,8,0,12,0,165,
		83,9,0,12,1,32,46,1,36,125,0,176,10,0,
		109,6,0,106,31,67,111,110,116,101,110,116,45,84,
		121,112,101,58,32,97,112,112,108,105,99,97,116,105,
		111,110,47,106,115,111,110,0,20,2,36,127,0,176,
		11,0,109,9,0,92,23,109,6,0,20,3,36,129,
		0,176,11,0,109,9,0,92,2,95,5,20,3,36,
		134,0,95,2,106,4,71,69,84,0,5,32,138,0,
		36,136,0,95,2,106,5,80,79,83,84,0,5,28,
		33,36,137,0,176,11,0,109,9,0,92,47,120,20,
		3,36,138,0,176,11,0,109,9,0,92,15,95,3,
		20,3,25,91,36,139,0,95,2,106,4,80,85,84,
		0,5,28,38,36,140,0,176,11,0,109,9,0,92,
		36,106,4,80,85,84,0,20,3,36,141,0,176,11,
		0,109,9,0,92,15,95,3,20,3,25,41,36,142,
		0,95,2,106,7,68,69,76,69,84,69,0,5,28,
		24,36,143,0,176,11,0,109,9,0,92,36,106,7,
		68,69,76,69,84,69,0,20,3,36,148,0,176,11,
		0,109,9,0,92,52,122,20,3,36,149,0,176,11,
		0,109,9,0,92,64,121,20,3,36,152,0,176,11,
		0,109,9,0,93,240,3,20,2,36,155,0,176,12,
		0,109,9,0,12,1,165,83,13,0,121,8,28,15,
		36,156,0,176,14,0,109,9,0,12,1,80,4,36,
		160,0,176,15,0,20,0,36,163,0,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( SEEKUSER )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,36,166,0,106,1,0,80,2,36,167,0,
		106,1,0,80,3,36,168,0,106,13,117,115,101,114,
		63,110,117,109,69,109,112,61,0,95,1,72,80,4,
		36,169,0,176,3,0,95,4,106,4,71,69,84,0,
		106,1,0,12,3,80,5,36,170,0,176,17,0,95,
		5,96,2,0,20,2,36,172,0,95,5,106,6,69,
		114,114,111,114,0,8,28,12,36,173,0,100,120,4,
		2,0,110,7,36,175,0,95,2,9,4,2,0,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( CREATEUSER )
{
	static const HB_BYTE pcode[] =
	{
		13,3,4,36,180,0,106,11,99,114,101,97,116,101,
		85,115,101,114,0,80,5,36,181,0,106,12,123,34,
		110,117,109,69,109,112,34,58,34,0,95,1,72,106,
		15,34,44,34,102,117,108,108,78,97,109,101,34,58,
		34,0,72,95,2,72,106,11,34,44,34,100,112,116,
		111,34,58,34,0,72,95,3,72,106,15,34,44,34,
		112,97,115,115,119,111,114,100,34,58,34,0,72,95,
		4,72,106,3,34,125,0,72,80,6,36,182,0,176,
		3,0,95,5,106,5,80,79,83,84,0,95,6,12,
		3,80,7,36,183,0,95,7,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( FETCHADMINPASS )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,36,186,0,106,1,0,80,2,36,187,0,
		106,12,97,100,109,105,110,63,112,97,115,115,61,0,
		95,1,72,80,3,36,188,0,176,3,0,95,3,106,
		4,71,69,84,0,106,1,0,12,3,80,4,36,189,
		0,176,17,0,95,4,96,2,0,20,2,36,191,0,
		95,4,106,6,69,114,114,111,114,0,8,28,12,36,
		192,0,100,120,4,2,0,110,7,36,194,0,95,2,
		9,4,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( ADDNEWTICKET )
{
	static const HB_BYTE pcode[] =
	{
		13,3,8,36,199,0,106,13,99,114,101,97,116,101,
		84,105,99,107,101,116,0,80,9,36,200,0,106,12,
		123,34,78,85,77,69,77,80,34,58,34,0,95,1,
		72,106,11,34,44,34,84,73,80,79,34,58,34,0,
		72,95,2,72,106,12,34,44,34,70,69,67,72,65,
		34,58,34,0,72,95,3,72,106,11,34,44,34,72,
		79,82,65,34,58,34,0,72,95,4,72,106,13,34,
		44,34,83,84,65,84,85,83,34,58,34,0,72,95,
		5,72,106,19,34,44,34,68,69,80,65,82,84,65,
		77,69,78,84,79,34,58,34,0,72,95,6,72,106,
		11,34,44,34,68,69,83,67,34,58,34,0,72,95,
		7,72,106,12,34,44,34,78,79,84,65,83,34,58,
		34,0,72,95,8,72,106,3,34,125,0,72,80,10,
		36,201,0,176,3,0,95,9,106,5,80,79,83,84,
		0,95,10,12,3,80,11,36,202,0,95,11,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATETICKETRECIEVER )
{
	static const HB_BYTE pcode[] =
	{
		13,3,3,36,205,0,106,20,117,112,100,97,116,101,
		84,105,99,107,101,116,82,101,99,105,118,101,114,0,
		80,4,36,206,0,106,8,123,34,73,68,34,58,34,
		0,95,1,72,106,13,34,44,34,83,84,65,84,85,
		83,34,58,34,0,72,176,0,0,95,2,120,12,2,
		72,106,12,34,44,34,78,79,84,65,83,34,58,34,
		0,72,95,3,72,106,3,34,125,0,72,80,5,36,
		207,0,176,3,0,95,4,106,4,80,85,84,0,95,
		5,12,3,80,6,36,208,0,95,6,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATETICKETSENDER )
{
	static const HB_BYTE pcode[] =
	{
		13,3,3,36,211,0,106,19,117,112,100,97,116,101,
		84,105,99,107,101,116,83,101,110,100,101,114,0,80,
		4,36,212,0,106,8,123,34,73,68,34,58,34,0,
		95,1,72,106,11,34,44,34,68,69,83,67,34,58,
		34,0,72,95,2,72,106,3,34,125,0,72,80,5,
		36,213,0,176,3,0,95,4,106,4,80,85,84,0,
		95,5,12,3,80,6,36,215,0,95,6,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( FETCHDBENVIADAS )
{
	static const HB_BYTE pcode[] =
	{
		36,218,0,106,1,0,83,24,0,36,219,0,106,1,
		0,83,25,0,36,220,0,106,1,0,83,26,0,36,
		221,0,4,0,0,83,27,0,36,222,0,106,18,71,
		69,84,110,117,109,69,109,112,63,110,117,109,69,109,
		112,61,0,109,28,0,72,83,29,0,36,223,0,176,
		3,0,109,29,0,106,4,71,69,84,0,106,1,0,
		12,3,83,24,0,36,224,0,176,4,0,109,24,0,
		12,1,32,192,1,36,226,0,176,30,0,106,15,82,
		101,115,112,117,101,115,116,97,46,106,115,111,110,0,
		109,24,0,20,2,36,227,0,176,31,0,106,15,82,
		101,115,112,117,101,115,116,97,46,74,83,79,78,0,
		12,1,83,32,0,36,228,0,176,4,0,109,32,0,
		12,1,28,58,36,229,0,176,5,0,106,42,78,111,
		32,115,101,32,112,117,100,111,32,111,98,116,101,110,
		101,114,32,114,101,115,112,117,101,115,116,97,32,100,
		101,108,32,115,101,114,118,105,100,111,114,0,20,1,
		36,230,0,7,36,232,0,176,33,0,109,32,0,12,
		1,83,34,0,36,234,0,109,34,0,99,26,0,129,
		1,1,29,37,1,36,235,0,176,17,0,109,26,0,
		99,25,0,12,2,83,35,0,36,236,0,176,10,0,
		109,27,0,176,36,0,109,25,0,106,3,73,68,0,
		12,2,20,2,36,237,0,176,10,0,109,27,0,176,
		36,0,109,25,0,106,7,78,85,77,69,77,80,0,
		12,2,20,2,36,238,0,176,10,0,109,27,0,176,
		36,0,109,25,0,106,5,84,73,80,79,0,12,2,
		20,2,36,239,0,176,10,0,109,27,0,176,36,0,
		109,25,0,106,6,70,69,67,72,65,0,12,2,20,
		2,36,240,0,176,10,0,109,27,0,176,36,0,109,
		25,0,106,5,72,79,82,65,0,12,2,20,2,36,
		241,0,176,10,0,109,27,0,176,36,0,109,25,0,
		106,7,83,84,65,84,85,83,0,12,2,20,2,36,
		242,0,176,10,0,109,27,0,176,36,0,109,25,0,
		106,13,68,69,80,65,82,84,65,77,69,78,84,79,
		0,12,2,20,2,36,243,0,176,10,0,109,27,0,
		176,36,0,109,25,0,106,5,68,69,83,67,0,12,
		2,20,2,36,244,0,176,10,0,109,27,0,176,36,
		0,109,25,0,106,6,78,79,84,65,83,0,12,2,
		20,2,36,245,0,176,37,0,109,27,0,20,1,36,
		246,0,4,0,0,83,27,0,36,247,0,130,32,225,
		254,132,36,250,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( FETCHDBRECIBIDAS )
{
	static const HB_BYTE pcode[] =
	{
		36,253,0,106,1,0,83,24,0,36,254,0,106,1,
		0,83,25,0,36,255,0,106,1,0,83,26,0,36,
		0,1,4,0,0,83,27,0,36,1,1,106,14,71,
		69,84,100,112,116,111,63,100,112,116,111,61,0,109,
		39,0,72,83,29,0,36,2,1,176,3,0,109,29,
		0,106,4,71,69,84,0,106,1,0,12,3,83,24,
		0,36,3,1,176,4,0,109,24,0,12,1,32,196,
		1,36,5,1,176,30,0,106,15,82,101,115,112,117,
		101,115,116,97,46,106,115,111,110,0,109,24,0,20,
		2,36,6,1,176,31,0,106,15,82,101,115,112,117,
		101,115,116,97,46,74,83,79,78,0,12,1,83,32,
		0,36,7,1,176,4,0,109,32,0,12,1,28,58,
		36,8,1,176,5,0,106,42,78,111,32,115,101,32,
		112,117,100,111,32,111,98,116,101,110,101,114,32,114,
		101,115,112,117,101,115,116,97,32,100,101,108,32,115,
		101,114,118,105,100,111,114,0,20,1,36,9,1,7,
		36,11,1,176,33,0,109,32,0,12,1,83,34,0,
		36,13,1,109,34,0,99,26,0,129,1,1,29,41,
		1,36,14,1,176,17,0,109,26,0,99,25,0,12,
		2,83,35,0,36,15,1,176,10,0,109,27,0,176,
		36,0,109,25,0,106,3,73,68,0,12,2,20,2,
		36,16,1,176,10,0,109,27,0,176,36,0,109,25,
		0,106,7,78,85,77,69,77,80,0,12,2,20,2,
		36,17,1,176,10,0,109,27,0,176,36,0,109,25,
		0,106,5,84,73,80,79,0,12,2,20,2,36,18,
		1,176,10,0,109,27,0,176,36,0,109,25,0,106,
		6,70,69,67,72,65,0,12,2,20,2,36,19,1,
		176,10,0,109,27,0,176,36,0,109,25,0,106,5,
		72,79,82,65,0,12,2,20,2,36,20,1,176,10,
		0,109,27,0,176,0,0,176,36,0,109,25,0,106,
		7,83,84,65,84,85,83,0,12,2,9,12,2,20,
		2,36,21,1,176,10,0,109,27,0,176,36,0,109,
		25,0,106,11,68,80,84,79,83,69,78,68,69,82,
		0,12,2,20,2,36,22,1,176,10,0,109,27,0,
		176,36,0,109,25,0,106,5,68,69,83,67,0,12,
		2,20,2,36,23,1,176,10,0,109,27,0,176,36,
		0,109,25,0,106,6,78,79,84,65,83,0,12,2,
		20,2,36,24,1,176,40,0,109,27,0,20,1,36,
		25,1,4,0,0,83,27,0,36,26,1,130,32,221,
		254,132,36,29,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( ARRAYJSONCONVERSION )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,36,32,1,4,0,0,83,41,0,36,33,
		1,106,1,0,83,26,0,36,34,1,9,83,42,0,
		36,35,1,106,1,0,83,43,0,36,37,1,95,1,
		99,43,0,129,1,1,28,108,36,38,1,109,43,0,
		106,2,123,0,8,28,11,36,39,1,120,83,42,0,
		25,59,36,40,1,109,43,0,106,2,125,0,8,28,
		46,36,41,1,109,26,0,106,2,125,0,72,83,26,
		0,36,42,1,176,10,0,109,41,0,109,26,0,20,
		2,36,44,1,106,1,0,83,26,0,36,45,1,9,
		83,42,0,36,47,1,109,42,0,28,15,36,48,1,
		109,26,0,109,43,0,72,83,26,0,36,50,1,130,
		31,152,132,36,51,1,109,41,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

