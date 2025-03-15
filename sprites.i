# 1 "sprites.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sprites.c"
# 1 "sprites.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 69 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 103 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 5 "sprites.h" 2



extern int playerImmuneToBombs;

void initializeEnemies();
void initializePlayer();
void updateEnemies();
void updatePlayer();
void updateBomb();
void drawEnemies();
void drawPlayer();
int winCondition();
int loseCondition();


typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;

typedef struct {
  int x;
  int y;
  int timer;
  int explosionTimer;
  int active;
  int oamIndex;
} BOMB;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 113 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int active;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 2 "sprites.c" 2
# 1 "helper.h" 1




int isPassablePixel(int x, int y, int game);
unsigned char colorAt(int x, int y);
unsigned char colorAt2(int x, int y);


unsigned short getTileAtWorld(int worldX, int worldY);
int checkCollisionWorld(int worldX, int worldY);
int checkCollisionDestructableWall(int worldX, int worldY);
int checkCollisionSoftBlock(int worldX, int worldY);
int checkCollisionWin(int worldX, int worldY);
void destroySoftBlockAt(int worldX, int worldY);


void drawText(int tileX, int tileY, char *text);
void drawNumber(int tileX, int tileY, int num);


int checkPlayerEnemyCollision();
# 3 "sprites.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "sprites.c" 2

# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 7 "sprites.c" 2
# 1 "bg.h" 1







extern unsigned short bgMap[2048];
# 8 "sprites.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[512];


extern const unsigned short tilesetPal[256];
# 9 "sprites.c" 2
# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[16384];


extern const unsigned short spritePal[256];
# 10 "sprites.c" 2
# 1 "gameOne.h" 1
# 11 "gameOne.h"
extern int score;
extern int lives;

void updateGameOne();
void drawGameOne();
# 11 "sprites.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 12 "sprites.c" 2
# 21 "sprites.c"

# 21 "sprites.c"
int playerImmuneToBombs = 0;


int enemy1DeathTimer = 0;
int enemy2DeathTimer = 0;
int enemy3DeathTimer = 0;
int enemy4DeathTimer = 0;

extern int lives;
extern OBJ_ATTR shadowOAM[128];
int round = 1;

typedef enum {
    DOWN,
    RIGHT,
    UP,
    LEFT
} DIRECTION;

SPRITE enemy1;
SPRITE enemy2;
SPRITE enemy3;
SPRITE enemy4;
SPRITE player;

BOMB bomb = {0, 0, 0, 0, 0, 5};

void initializePlayer() {
    player.x = 0;
    player.y = 24;
    player.currentFrame = 0;
    player.direction = 0;
    player.oamIndex = 0;
    player.width = 8;
    player.height = 8;
    player.numFrames = 4;
    player.timeUntilNextFrame = 15;
    player.currentFrame = 0;
    player.direction = RIGHT;
}


void initializeEnemies(int fullReset) {

    if (fullReset) {

    }



    if (enemy1.active) {
        enemy1.x = 104;
        enemy1.y = 104;
        enemy1.currentFrame = 2;
        enemy1.direction = RIGHT;
        enemy1.oamIndex = 1;
        enemy1.width = 8;
        enemy1.height = 8;
        enemy1.numFrames = 4;
        enemy1.timeUntilNextFrame = 15;
    }

    if (enemy2.active) {
        enemy2.x = 136;
        enemy2.y = 24;
        enemy2.currentFrame = 0;
        enemy2.direction = RIGHT;
        enemy2.oamIndex = 2;
        enemy2.width = 8;
        enemy2.height = 8;
        enemy2.numFrames = 4;
        enemy2.timeUntilNextFrame = 15;
    }

    if (enemy3.active) {
        enemy3.x = 24;
        enemy3.y = 136;
        enemy3.currentFrame = 0;
        enemy3.direction = RIGHT;
        enemy3.oamIndex = 3;
        enemy3.width = 8;
        enemy3.height = 8;
        enemy3.numFrames = 3;
        enemy3.timeUntilNextFrame = 4;
        enemy3.xVel = 3;
        enemy3.yVel = 3;
    }

    if (enemy4.active) {
        enemy4.x = 136;
        enemy4.y = 136;
        enemy4.currentFrame = 0;
        enemy4.direction = RIGHT;
        enemy4.oamIndex = 4;
        enemy4.width = 8;
        enemy4.height = 8;
        enemy4.numFrames = 3;
        enemy4.timeUntilNextFrame = 4;
        enemy4.xVel = 3;
        enemy4.yVel = 3;
    }
}



void updatePlayer() {

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;



    if ((~(buttons) & ((1<<7)))) {
        if (player.y + player.height < 256 &&
            isPassablePixel(leftX, bottomY + 1, round) &&
            isPassablePixel(rightX, bottomY + 1, round)) {
            player.y++;
        }
        player.direction = DOWN;
    }


    if ((~(buttons) & ((1<<6)))) {
        if (player.y > 0 &&
            isPassablePixel(leftX, topY - 1, round) &&
            isPassablePixel(rightX, topY - 1, round)) {
            player.y--;
        }
        player.direction = UP;
    }


    if ((~(buttons) & ((1<<4)))) {
        if (player.x + player.width < 512 &&
            isPassablePixel(rightX + 1, topY, round) &&
            isPassablePixel(rightX + 1, bottomY, round)) {
            player.x++;
        }
        player.direction = RIGHT;
    }


    if ((~(buttons) & ((1<<5)))) {
        if (player.x > 0 &&
            isPassablePixel(leftX - 1, topY, round) &&
            isPassablePixel(leftX - 1, bottomY, round)) {
            player.x--;
        }
        player.direction = LEFT;
    }


    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) && !bomb.active) {

        bomb.x = (player.x / 8) * 8;
        bomb.y = (player.y / 8) * 8;

        bomb.timer = 60;
        bomb.active = 1;
    }


    if ((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9))))) {
        playerImmuneToBombs = 1;
    }

}


void updateEnemies() {

    static int changeTimer = 0;
    changeTimer++;





    if (enemy1.active && enemy1DeathTimer == 0) {
        if (changeTimer % 30 == 0) {
            if (enemy1.direction == LEFT || enemy1.direction == RIGHT)
                enemy1.direction = (rand() % 2) ? UP : DOWN;
            else
                enemy1.direction = (rand() % 2) ? LEFT : RIGHT;
        }
        if (enemy1.direction == DOWN) {
            if (isPassablePixel(enemy1.x, enemy1.y + enemy1.height, round) &&
                isPassablePixel(enemy1.x + enemy1.width - 1, enemy1.y + enemy1.height, round)
                && enemy1.y + enemy1.width < 160) {
                enemy1.y++;
            }
        } else if (enemy1.direction == UP) {
            if (isPassablePixel(enemy1.x, enemy1.y - 1, round) &&
                isPassablePixel(enemy1.x + enemy1.width - 1, enemy1.y - 1, round) && enemy1.y > 0) {
                enemy1.y--;
            }
        } else if (enemy1.direction == RIGHT) {
            if (isPassablePixel(enemy1.x + enemy1.width, enemy1.y, round) &&
                isPassablePixel(enemy1.x + enemy1.width, enemy1.y + enemy1.height - 1, round)
                && enemy1.x + enemy1.width < 240) {
                enemy1.x++;
            }
        } else if (enemy1.direction == LEFT) {
            if (isPassablePixel(enemy1.x - 1, enemy1.y, round) &&
                isPassablePixel(enemy1.x - 1, enemy1.y + enemy1.height - 1, round)
                && enemy1.x > 0) {
                enemy1.x--;
            }
        }
    }





    if (enemy2.active && enemy2DeathTimer == 0) {
        if (changeTimer % 30 == 0) {
            if (enemy2.direction == LEFT || enemy2.direction == RIGHT)
                enemy2.direction = (rand() % 2) ? UP : DOWN;
            else
                enemy2.direction = (rand() % 2) ? LEFT : RIGHT;
        }
        if (enemy2.direction == DOWN) {
            if (isPassablePixel(enemy2.x, enemy2.y + enemy2.height, round) &&
                isPassablePixel(enemy2.x + enemy2.width - 1, enemy2.y + enemy2.height, round)
                && enemy1.y + enemy1.width < 160) {
                enemy2.y++;
            }
        } else if (enemy2.direction == UP) {
            if (isPassablePixel(enemy2.x, enemy2.y - 1, round) &&
                isPassablePixel(enemy2.x + enemy2.width - 1, enemy2.y - 1, round)
                && enemy1.y > 0) {
                enemy2.y--;
            }
        } else if (enemy2.direction == RIGHT) {
            if (isPassablePixel(enemy2.x + enemy2.width, enemy2.y, round) &&
                isPassablePixel(enemy2.x + enemy2.width, enemy2.y + enemy2.height - 1, round)
                && enemy1.x + enemy1.height < 240) {
                enemy2.x++;
            }
        } else if (enemy2.direction == LEFT) {
            if (isPassablePixel(enemy2.x - 1, enemy2.y, round) &&
                isPassablePixel(enemy2.x - 1, enemy2.y + enemy2.height - 1, round)
                && enemy2.x > 0) {
                enemy2.x--;
            }
        }
    }

    static int enemyDelayCounter = 0;
    enemyDelayCounter++;
    if (enemyDelayCounter >= 3) {
        enemyDelayCounter = 0;




        if (enemy3.active && enemy3DeathTimer == 0) {
            if (player.x > enemy3.x)
                enemy3.x++;
            else if (player.x < enemy3.x)
                enemy3.x--;
            if (player.y > enemy3.y)
                enemy3.y++;
            else if (player.y < enemy3.y)
                enemy3.y--;
        }




        if (enemy4.active && enemy4DeathTimer == 0) {
            if (player.x > enemy4.x)
                enemy4.x++;
            else if (player.x < enemy4.x)
                enemy4.x--;
            if (player.y > enemy4.y)
                enemy4.y++;
            else if (player.y < enemy4.y)
                enemy4.y--;
        }
    }


    if (enemy1DeathTimer > 0) {
        enemy1DeathTimer--;
        if (enemy1DeathTimer == 0) {
            enemy1.active = 0;
            shadowOAM[enemy1.oamIndex].attr0 = (2<<8);
        }
    }
    if (enemy2DeathTimer > 0) {
        enemy2DeathTimer--;
        if (enemy2DeathTimer == 0) {
            enemy2.active = 0;
            shadowOAM[enemy2.oamIndex].attr0 = (2<<8);
        }
    }
    if (enemy3DeathTimer > 0) {
        enemy3DeathTimer--;
        if (enemy3DeathTimer == 0) {
            enemy3.active = 0;
            shadowOAM[enemy3.oamIndex].attr0 = (2<<8);
        }
    }
    if (enemy4DeathTimer > 0) {
        enemy4DeathTimer--;
        if (enemy4DeathTimer == 0) {
            enemy4.active = 0;
            shadowOAM[enemy4.oamIndex].attr0 = (2<<8);
        }
    }
}

void updateBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            bomb.timer--;
            if (bomb.timer == 0) {


                bomb.explosionTimer = 20;
                handleExplosion(bomb.x, bomb.y);
            }
        } else if (bomb.explosionTimer > 0) {
            bomb.explosionTimer--;
            if (bomb.explosionTimer == 0) {

                shadowOAM[bomb.oamIndex].attr0 = (2<<8);
                shadowOAM[6].attr0 = (2<<8);
                shadowOAM[7].attr0 = (2<<8);
                shadowOAM[8].attr0 = (2<<8);
                shadowOAM[9].attr0 = (2<<8);
                bomb.active = 0;
            }
        }
    }
}

void drawEnemies() {

    if (enemy1.active) {
        int tileRow = 2;
        int tileCol = 2;

        if (enemy1DeathTimer > 0) {
            tileCol = 1;

            tileRow = (enemy1DeathTimer > 15) ? 0 : 1;
        } else {
            tileRow = enemy1.currentFrame % 2;
        }
        shadowOAM[enemy1.oamIndex].attr0 = ((enemy1.y) & 0xFF) | (0<<14) | (0<<8);
        shadowOAM[enemy1.oamIndex].attr1 = ((enemy1.x) & 0x1FF) | (0<<14);
        if (enemy1.direction == RIGHT)
            shadowOAM[enemy1.oamIndex].attr1 |= (1<<12);
        shadowOAM[enemy1.oamIndex].attr2 = ((((tileCol) * (32) + (tileRow))) & 0x3FF) | (((0) & 0xF) <<12);
    } else {
        shadowOAM[enemy1.oamIndex].attr0 = (2<<8);
    }


    if (enemy2.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy2DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy2DeathTimer > 15) ? 0 : 1;
        } else {
            tileRow = enemy2.currentFrame % 2;
        }
        shadowOAM[enemy2.oamIndex].attr0 = ((enemy2.y) & 0xFF) | (0<<14) | (0<<8);
        shadowOAM[enemy2.oamIndex].attr1 = ((enemy2.x) & 0x1FF) | (0<<14);
        if (enemy2.direction == RIGHT)
            shadowOAM[enemy2.oamIndex].attr1 |= (1<<12);
        shadowOAM[enemy2.oamIndex].attr2 = ((((tileCol) * (32) + (tileRow))) & 0x3FF) | (((0) & 0xF) <<12);
    } else {
        shadowOAM[enemy2.oamIndex].attr0 = (2<<8);
    }


    if (enemy3.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy3DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy3DeathTimer > 15) ? 2 : 3;
        } else {
            tileRow = (enemy3.currentFrame % 2) + 2;
        }
        shadowOAM[enemy3.oamIndex].attr0 = ((enemy3.y) & 0xFF) | (0<<14) | (0<<8);
        shadowOAM[enemy3.oamIndex].attr1 = ((enemy3.x) & 0x1FF) | (0<<14);
        if (enemy3.direction == RIGHT)
            shadowOAM[enemy3.oamIndex].attr1 |= (1<<12);
        shadowOAM[enemy3.oamIndex].attr2 = ((((tileCol) * (32) + (tileRow))) & 0x3FF) | (((0) & 0xF) <<12);
    } else {
        shadowOAM[enemy3.oamIndex].attr0 = (2<<8);
    }


    if (enemy4.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy4DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy4DeathTimer > 15) ? 2 : 3;
        } else {
            tileRow = (enemy4.currentFrame % 2) + 2;
        }
        shadowOAM[enemy4.oamIndex].attr0 = ((enemy4.y) & 0xFF) | (0<<14) | (0<<8);
        shadowOAM[enemy4.oamIndex].attr1 = ((enemy4.x) & 0x1FF) | (0<<14);
        if (enemy4.direction == RIGHT)
            shadowOAM[enemy4.oamIndex].attr1 |= (1<<12);
        shadowOAM[enemy4.oamIndex].attr2 = ((((tileCol) * (32) + (tileRow))) & 0x3FF) | (((0) & 0xF) <<12);
    } else {
        shadowOAM[enemy4.oamIndex].attr0 = (2<<8);
    }
}

void drawPlayer() {
    int tileIndex = 0;


    switch(player.direction) {
        case DOWN: tileIndex = 10; break;
        case UP: tileIndex = 2; break;
        case RIGHT: tileIndex = 11; break;
        case LEFT: tileIndex = 8; break;
    }
    shadowOAM[player.oamIndex].attr0 = ((player.y) & 0xFF) | (0<<14);
    shadowOAM[player.oamIndex].attr1 = ((player.x) & 0x1FF);
    shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (tileIndex))) & 0x3FF) | (((0) & 0xF) <<12);
}

void drawBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {

            shadowOAM[bomb.oamIndex].attr0 = ((bomb.y) & 0xFF) | (0<<14) | (0<<8);
            shadowOAM[bomb.oamIndex].attr1 = ((bomb.x) & 0x1FF);
            shadowOAM[bomb.oamIndex].attr2 = ((((3) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
        } else if (bomb.explosionTimer > 0) {

            shadowOAM[bomb.oamIndex].attr0 = ((bomb.y) & 0xFF) | (0<<14) | (0<<8);
            shadowOAM[bomb.oamIndex].attr1 = ((bomb.x) & 0x1FF);
            shadowOAM[bomb.oamIndex].attr2 = ((((4) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);


            if (checkCollisionDestructableWall(bomb.x - 8, bomb.y)) {
                destroySoftBlockAt(bomb.x - 8, bomb.y);
            }
            if (!checkCollisionWorld(bomb.x - 8, bomb.y)) {
                shadowOAM[6].attr0 = ((bomb.y) & 0xFF) | (0<<8);
                shadowOAM[6].attr1 = ((bomb.x - 8) & 0x1FF);
                shadowOAM[6].attr2 = ((((4) * (32) + (1))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[6].attr0 = (2<<8);
            }


            if (checkCollisionDestructableWall(bomb.x + 8, bomb.y)) {
                destroySoftBlockAt(bomb.x + 8, bomb.y);
            }
            if (!checkCollisionWorld(bomb.x + 8, bomb.y)) {
                shadowOAM[7].attr0 = ((bomb.y) & 0xFF) | (0<<8);
                shadowOAM[7].attr1 = ((bomb.x + 8) & 0x1FF);
                shadowOAM[7].attr2 = ((((4) * (32) + (3))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[7].attr0 = (2<<8);
            }


            if (checkCollisionDestructableWall(bomb.x, bomb.y - 8)) {
                destroySoftBlockAt(bomb.x, bomb.y - 8);
            }
            if (!checkCollisionWorld(bomb.x, bomb.y - 8)) {
                shadowOAM[8].attr0 = ((bomb.y - 8) & 0xFF) | (0<<8);
                shadowOAM[8].attr1 = ((bomb.x) & 0x1FF);
                shadowOAM[8].attr2 = ((((3) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[8].attr0 = (2<<8);
            }


            if (checkCollisionDestructableWall(bomb.x, bomb.y + 8)) {
                destroySoftBlockAt(bomb.x, bomb.y + 8);
            }
            if (!checkCollisionWorld(bomb.x, bomb.y + 8)) {
                shadowOAM[9].attr0 = ((bomb.y + 8) & 0xFF) | (0<<8);
                shadowOAM[9].attr1 = ((bomb.x) & 0x1FF);
                shadowOAM[9].attr2 = ((((5) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[9].attr0 = (2<<8);
            }
        }
    }
}

int loseCondition() {
    if (collision(enemy1.x, enemy1.y, enemy1.width, enemy1.height, player.x, player.y, player.width, player.height) ||
        collision(enemy2.x, enemy2.y, enemy2.width, enemy2.height, player.x, player.y, player.width, player.height) ||
        collision(enemy3.x, enemy3.y, enemy3.width, enemy3.height, player.x, player.y, player.width, player.height) ||
        collision(enemy4.x, enemy4.y, enemy4.width, enemy4.height, player.x, player.y, player.width, player.height)) {


        lives--;
        if (lives <= 0) {

            goToLose();
        } else {

            initializePlayer();

            initializeEnemies(0);
        }
        return 1;
    }
    return 0;
}


int winCondition() {
    if (checkCollisionWin(player.x, player.y)) {
        return 1;
    }
    return 0;
}

void handleExplosion(int bx, int by) {
    int explosionTiles[5][2] = {
        {bx, by}, {bx - 8, by}, {bx + 8, by},
        {bx, by - 8}, {bx, by + 8}
    };

    for (int i = 0; i < 5; i++) {
        int ex = explosionTiles[i][0];
        int ey = explosionTiles[i][1];


        if (enemy1.active && enemy1DeathTimer == 0 &&
            collision(ex, ey, 8, 8, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            enemy1DeathTimer = 50;
            score += 100;
        }
        if (enemy2.active && enemy2DeathTimer == 0 &&
            collision(ex, ey, 8, 8, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            enemy2DeathTimer = 50;
            score += 100;
        }
        if (enemy3.active && enemy3DeathTimer == 0 &&
            collision(ex, ey, 8, 8, enemy3.x, enemy3.y, enemy3.width, enemy3.height)) {
            enemy3DeathTimer = 50;
            score += 150;
        }
        if (enemy4.active && enemy4DeathTimer == 0 &&
            collision(ex, ey, 8, 8, enemy4.x, enemy4.y, enemy4.width, enemy4.height)) {
            enemy4DeathTimer = 50;
            score += 150;
        }


        if (!playerImmuneToBombs &&
            collision(ex, ey, 8, 8, player.x, player.y, player.width, player.height)) {
            lives--;
            if (lives <= 0) {
                goToLose();
            } else {
                initializePlayer();
                initializeEnemies(0);
            }
        }
    }
}





void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}
