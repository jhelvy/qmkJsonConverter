#include QMK_KEYBOARD_H


#define _LAYER0 0
#define _LAYER1 1
#define _LAYER2 2
#define _LAYER3 3

enum custom_keycodes {
  LAYER0 = SAFE_RANGE,
  LAYER1,
  LAYER2,
  LAYER3,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[_LAYER0] = LAYOUT( \
                  KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                               KC_6,    KC_7,    KC_8,    KC_9,    KC_0,     KC_EQL, \
        KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                               KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_MINS, \
        KC_BSPC, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                               KC_H,    KC_J,    KC_K,    KC_L,    KC_QUOT,  KC_ENT, \
        KC_LSPO, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,     KC_NO,            KC_NO,  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSPC, \
                                         MO(3),KC_LGUI,    MO(1),                    KC_SPC,  MO(2),       TG(2)),

[_LAYER1] = LAYOUT( \
                  KC_ESC,LGUI(KC_1),LGUI(KC_2),LGUI(KC_3),LGUI(KC_4),LGUI(KC_5),                            KC_SCLN, KC_PIPE, KC_COLN,LCTL(KC_9),LCTL(KC_0),     KC_F20, \
  LCTL(KC_TAB),LGUI(KC_Q),LGUI(KC_W),  KC_ESC,LGUI(KC_R),LGUI(KC_T),                         LCTL(KC_Y),LGUI(KC_LEFT),   KC_UP,LGUI(KC_RGHT), KC_TILD,     KC_F21, \
  LGUI(KC_BSPC),MO(2),LGUI(KC_S),LGUI(KC_C),LGUI(KC_V),LGUI(KC_X),                             KC_DEL, KC_LEFT, KC_DOWN, KC_RGHT,     KC_GRV,   KC_NO, \
         KC_F24,LGUI(KC_A),LGUI(KC_D),   KC_F1,LGUI(KC_Z),LGUI(KC_Y),     KC_NO,            KC_NO,KC_BSPC,LGUI(KC_F), SGUI(KC_G),LGUI(KC_G),  KC_BSLS,  KC_F23, \
                                    LALT(KC_A),KC_LGUI,  KC_TRNS,                    KC_SPC,KC_RGUI,       KC_NO),

[_LAYER2] = LAYOUT( \
        LGUI(LCTL(KC_A)),LGUI(LALT(KC_1)),LGUI(LALT(KC_2)),   KC_F3,   KC_F4,   KC_F5,                              KC_F6,   KC_F7,   KC_F8,   KC_F9,  KC_F10,     KC_F14, \
        KC_F22, KC_NO,   KC_NO,   KC_NO,SGUI(KC_R),   KC_F2,                         SGUI(KC_K),SGUI(KC_LEFT),LSFT(KC_UP),SGUI(KC_RGHT),  KC_F11,     KC_F15, \
          KC_NO,KC_TRNS,   KC_NO, KC_LBRC, KC_RBRC,  KC_TAB,                             KC_F18,LSFT(KC_LEFT),LSFT(KC_DOWN),LSFT(KC_RGHT),     KC_F12,  KC_F16, \
        KC_LSPO,KC_ASTG,   KC_NO, KC_LCBR, KC_RCBR,LCTL(KC_U),     KC_NO,            KC_NO,KC_F19,LCTL(LGUI(KC_A)),LALT(LSFT(KC_LEFT)),LALT(LSFT(KC_RIGHT)),   KC_F13,  KC_F17, \
                                         KC_NO,LALT(KC_SPC),  KC_LGUI,                    KC_SPC,KC_TRNS,     KC_TRNS),

[_LAYER3] = LAYOUT( \
                   KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,      KC_NO, \
         KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,LGUI(KC_LBRC), KC_MS_U,LGUI(KC_RBRC),   KC_NO,      KC_NO, \
  SGUI(KC_BSPC),KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO, KC_MS_L, KC_MS_D, KC_MS_R,      KC_NO,   KC_NO, \
          KC_NO,KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,     KC_NO,            KC_NO, KC_NO,   KC_NO,      KC_NO,  KC_NO,    KC_NO,   KC_NO, \
                                       KC_TRNS, KC_NO,    KC_NO,                   KC_BTN1,KC_BTN2,       KC_NO)

};

void encoder_update_user(uint8_t index, bool clockwise) {
    if (IS_LAYER_ON(_LAYER1)) {
        if (clockwise) {
            tap_code(KC_MS_WH_LEFT);
        } else {
            tap_code(KC_MS_WH_RIGHT);
        }
    } else if (IS_LAYER_ON(_LAYER2)) {
        if (clockwise) {
            tap_code(KC_VOLD);
        } else {
            tap_code(KC_VOLU);
        }
    } else if (IS_LAYER_ON(_LAYER3)) {
        if (clockwise) {
            register_code(KC_LGUI);
            tap_code(KC_MINS);
            unregister_code(KC_LGUI);
        } else {
            register_code(KC_LGUI);
            tap_code(KC_EQL);
            unregister_code(KC_LGUI);
        }
    } else {
        if (clockwise) {
            tap_code(KC_MS_WH_UP);
        } else {
            tap_code(KC_MS_WH_DOWN);
        }
    }
}
