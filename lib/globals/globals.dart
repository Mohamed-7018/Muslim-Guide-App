library quran.globals;

/*---------------------------------------------------------------------------------------------*/
/*---------------------------  Arabic Quraan Global Values ------------------------------------*/
/*---------------------------------------------------------------------------------------------*/


/*---------------------------  Current page ------------------------------------*/
/// changes when onChanged Callback
int currentPage;

/*--------------------------  bookmarked page ------------------------------------*/
int bookmarkedPage;

/*---------------------------  last page ------------------------------------*/
int lastViewedPage;

/*----------------------  brightness of the device ------------------------------------*/
double brightnessLevel;



/*---------------------------------------------------------------------------------------------*/
/*---------------------------  Arabic Quraan Default Values ------------------------------------*/
/*---------------------------------------------------------------------------------------------*/


/// if bookmarkedPage not defined
/// Default Bookmarked page equals to surat Al-baqara index [Default value =569] (Reversed)
const DEFAULT_BOOKMARKED_PAGE = 569;

const DEFAULT_BRIGHTNESS_LEVEL = 0.5;


/*---------------------------------------------------------------------------------------------*/
/*---------------------  Arabic Quraan SharedPreferences Values -------------------------------*/
/*---------------------------------------------------------------------------------------------*/
const LAST_VIEWED_PAGE = 'lastViewedPage';
const BRIGHTNESS_LEVEL = 'brightness_level';
const BOOKMARKED_PAGE = 'bookmarkedPage';
