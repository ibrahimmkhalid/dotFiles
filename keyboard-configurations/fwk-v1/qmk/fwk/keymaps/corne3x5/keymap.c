#include QMK_KEYBOARD_H

#define KEY_POS_Q KC_Q
#define KEY_POS_W KC_W
#define KEY_POS_E KC_E
#define KEY_POS_R KC_R
#define KEY_POS_T KC_T
#define KEY_POS_Y KC_Y
#define KEY_POS_U KC_U
#define KEY_POS_I KC_I
#define KEY_POS_O KC_O
#define KEY_POS_P KC_P
#define KEY_POS_A KC_A
#define KEY_POS_S KC_S
#define KEY_POS_D KC_D
#define KEY_POS_F KC_F
#define KEY_POS_G KC_G
#define KEY_POS_H KC_H
#define KEY_POS_J KC_J
#define KEY_POS_K KC_K
#define KEY_POS_L KC_L
#define KEY_POS_SC KC_SCLN
#define KEY_POS_Z KC_Z
#define KEY_POS_X KC_X
#define KEY_POS_C KC_C
#define KEY_POS_V KC_V
#define KEY_POS_B KC_B
#define KEY_POS_N KC_N
#define KEY_POS_M KC_M
#define KEY_POS_COMM KC_COMM
#define KEY_POS_DOT KC_DOT
#define KEY_POS_SLSH KC_SLSH
#define KEY_MOD_A   LGUI_T(KEY_POS_A)
#define KEY_MOD_S   LALT_T(KEY_POS_S)
#define KEY_MOD_D   LCTL_T(KEY_POS_D)
#define KEY_MOD_F   LSFT_T(KEY_POS_F)
#define KEY_MOD_J   RSFT_T(KEY_POS_J)
#define KEY_MOD_K   RCTL_T(KEY_POS_K)
#define KEY_MOD_L   LALT_T(KEY_POS_L)
#define KEY_MOD_SC  RGUI_T(KEY_POS_SC)
// mod top for gaming layer 1
// #define KEY_MODG_Z  LCTL_T(KC_Z)
#define KEY_MODG_A  LSFT_T(KC_A)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /**/[0]=LAYOUT(  /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/           /*||*/         /**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KEY_POS_Q   ,/**/KEY_POS_W    ,/**/KEY_POS_E  ,/**/KEY_POS_R  ,/**/KEY_POS_T ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KEY_POS_Y ,/**/KEY_POS_U ,/**/KEY_POS_I   ,/**/KEY_POS_O    ,/**/KEY_POS_P      ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KEY_MOD_A   ,/**/KEY_MOD_S    ,/**/KEY_MOD_D  ,/**/KEY_MOD_F  ,/**/KEY_POS_G ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KEY_POS_H ,/**/KEY_MOD_J ,/**/KEY_MOD_K   ,/**/KEY_MOD_L    ,/**/KEY_MOD_SC     ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KEY_POS_Z   ,/**/KEY_POS_X    ,/**/KEY_POS_C  ,/**/KEY_POS_V  ,/**/KEY_POS_B ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KEY_POS_N ,/**/KEY_POS_M ,/**/KEY_POS_COMM,/**/KEY_POS_DOT  ,/**/KEY_POS_SLSH   ,/**/KC_NO     ,/**/
    /**/KC_ENT      ,/**/LT(4,KC_SPC),/**/KC_NO        ,/**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/KC_NO        ,/**/LT(2,KC_BSPC)  ,/**/KC_DEL    ,/**/
    /**/             /**/             /**/LT(1,KC_TAB) ,/**/KC_NO      ,/**/            /**/           /**/           /*||*/         /**/           /**/           /**/KC_NO       ,/**/LT(3,KC_ESC)  /**/                /**/           /**/
    /**/)           ,/**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/

    /**/[1]=LAYOUT(  /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/           /*||*/         /**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_TAB      ,/**/KC_WBAK      ,/**/KC_WFWD    ,/**/KC_WREF    ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_MS_L   ,/**/KC_MS_D   ,/**/KC_MS_U     ,/**/KC_MS_R      ,/**/KC_ACL0        ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_LGUI     ,/**/KC_LALT      ,/**/KC_LCTL    ,/**/KC_LSFT    ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_LEFT   ,/**/KC_DOWN   ,/**/KC_UP       ,/**/KC_RGHT      ,/**/KC_ACL1        ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_HOME     ,/**/KC_PGDN      ,/**/KC_PGUP    ,/**/KC_END     ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_WH_L   ,/**/KC_WH_D   ,/**/KC_WH_U     ,/**/KC_WH_R      ,/**/KC_ACL2        ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/KC_NO        ,/**/KC_BTN1        ,/**/KC_BTN3   ,/**/
    /**/             /**/             /**/KC_TRNS      ,/**/KC_NO      ,/**/            /**/           /**/           /*||*/         /**/           /**/           /**/KC_NO       ,/**/KC_BTN2       /**/                /**/           /**/
    /**/)           ,/**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/

    /**/[2]=LAYOUT(  /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/           /*||*/         /**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_1        ,/**/KC_2         ,/**/KC_3       ,/**/KC_4       ,/**/KC_5      ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_6      ,/**/KC_7      ,/**/KC_8        ,/**/KC_9         ,/**/KC_0           ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_LGUI     ,/**/KC_LALT      ,/**/KC_LCTL    ,/**/KC_LSFT    ,/**/KC_F11    ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_F12    ,/**/KC_RSFT   ,/**/KC_RCTL     ,/**/KC_LALT      ,/**/KC_LGUI        ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_F1       ,/**/KC_F2        ,/**/KC_F3      ,/**/KC_F4      ,/**/KC_F5     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_F6     ,/**/KC_F7     ,/**/KC_F8       ,/**/KC_F9        ,/**/KC_F10         ,/**/KC_NO     ,/**/
    /**/KC_ENT      ,/**/KC_SPC      ,/**/KC_NO        ,/**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/KC_NO        ,/**/KC_TRNS        ,/**/KC_NO     ,/**/
    /**/             /**/             /**/KC_BSPC      ,/**/KC_NO      ,/**/            /**/           /**/           /*||*/         /**/           /**/           /**/KC_NO       ,/**/KC_NO         /**/                /**/           /**/
    /**/)           ,/**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/

    /**/[3]=LAYOUT(  /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/           /*||*/         /**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_EXLM     ,/**/KC_AT        ,/**/KC_HASH    ,/**/KC_DLR     ,/**/KC_PERC   ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_CIRC   ,/**/KC_AMPR   ,/**/KC_ASTR     ,/**/KC_MINS      ,/**/KC_EQL         ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_LGUI     ,/**/KC_LALT      ,/**/KC_LCTL    ,/**/KC_LSFT    ,/**/KC_LPRN   ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_RPRN   ,/**/KC_RSFT   ,/**/KC_RCTL     ,/**/KC_LALT      ,/**/KC_LGUI        ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_QUOT     ,/**/KC_DQUO      ,/**/KC_PIPE    ,/**/KC_LBRC    ,/**/KC_LCBR   ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_RCBR   ,/**/KC_RBRC   ,/**/KC_BSLS     ,/**/KC_UNDS      ,/**/KC_PLUS        ,/**/KC_NO     ,/**/
    /**/KC_ENT      ,/**/KC_SPC      ,/**/KC_NO        ,/**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/KC_NO        ,/**/KC_GRV         ,/**/KC_TILD   ,/**/
    /**/             /**/             /**/KC_BSPC      ,/**/KC_NO      ,/**/            /**/           /**/           /*||*/         /**/           /**/           /**/KC_NO       ,/**/KC_TRNS       /**/                /**/           /**/
    /**/)           ,/**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/

    /**/[4]=LAYOUT(  /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
    /**/QK_BOOT     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/           /*||*/         /**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/QK_BOOT     ,/**/KC_INS       ,/**/KC_SCRL    ,/**/KC_PAUS    ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_NO     ,/**/KC_VOLD   ,/**/KC_MUTE     ,/**/KC_VOLU      ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_APP       ,/**/KC_CAPS    ,/**/KC_PSCR    ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_NO     ,/**/KC_MPRV   ,/**/KC_MPLY     ,/**/KC_MNXT      ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO      ,/**/KC_NO      ,/**/KC_NO     ,/**/KC_NO     ,/*||*/KC_NO   ,/**/KC_NO     ,/**/KC_NO     ,/**/KC_NO       ,/**/KC_NO        ,/**/KC_NO          ,/**/KC_NO     ,/**/
    /**/KC_NO       ,/**/KC_TRNS     ,/**/KC_NO        ,/**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/KC_NO        ,/**/KC_ESC         ,/**/KC_NO     ,/**/
    /**/             /**/             /**/KC_NO        ,/**/KC_NO      ,/**/            /**/           /**/           /*||*/         /**/           /**/           /**/KC_NO       ,/**/KC_NO         /**/                /**/           /**/
    /**/)            /**/             /**/              /**/            /**/            /**/           /**/           /*||*/         /**/           /**/           /**/             /**/              /**/                /**/           /**/
};
