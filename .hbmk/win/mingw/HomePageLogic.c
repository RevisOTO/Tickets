/*
 * Harbour 3.2.0dev (r1601151502)
 * MinGW GNU C 4.6.1 (32-bit)
 * Generated C source from "C:\Users\Rafael\Desktop\HarborProjects\Tickets\HomePageLogic.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( ADDTICKET );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( ERRORSYS );


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_HOMEPAGELOGIC )
{ "ADDTICKET", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( ADDTICKET )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "TICKETS", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_HOMEPAGELOGIC, "C:\\Users\\Rafael\\Desktop\\HarborProjects\\Tickets\\HomePageLogic.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_HOMEPAGELOGIC
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_HOMEPAGELOGIC )
   #include "hbiniseg.h"
#endif

HB_FUNC( ADDTICKET )
{
	static const HB_BYTE pcode[] =
	{
		36,6,0,176,1,0,109,2,0,106,1,0,106,1,
		0,106,1,0,106,1,0,106,1,0,4,5,0,20,
		2,36,7,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

