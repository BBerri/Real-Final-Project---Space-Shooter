/*
 *                           <<---- // Notice \\ ---->>
 * ==================================================================================
 * | Written by Paras Jha                                                           |
 * | This library allows you to check if multiple keys are being pressed, something |
 * | that Processing does not support inherently. It's useful for games and things! |
 * | Distribute freely, but please give credit where credit is due                  |
 * ==================================================================================
 *
 * HOW TO USE [PROGRAMATICALLY]:
 *
 * Step 1
 *   You must 'import' the project into your current Processing sketch.
 *   A) First, save your current sketch. For example, we could save it as 'MySketch'
 *   B) Where you saved it, there should be a folder called 'MySketch' and a .pde file called 'MySketch.pde'
 *   C) Inside the folder 'MySketch', copy and paste the BlackBox.pde file
 *   D) Close the sketch 'MySketch' in processing, and then reopen it.
 *   E) If all went well, you should now see two tabs in processing, one called 'MySketch', and another called BlackBox
 *
 * Step 2
 *   In your setup() function, add this code: 'BlackBox.init(this);'
 *   Example Code:
 *     void setup() {
 *         BlackBox.init(this);
 *     }
 *
 * Step 3
 *   Check if a key is pressed or not
 *   Example Code:
 *     void draw() {
 *         if (BlackBox.isKeyDown(BlackBox.VK_A) && BlackBox.isKeyDown(BlackBox.VK_B)) {
 *             println("Both the 'A' key and the 'B' key are pressed!");
 *         }
 *     }
 *
 * Step 4
 *   Check if the mouse is clicked within a certain area (for buttons)
 *   Example Code:
 *     int buttonLocationX = 25;
 *     int buttonLocationY = 30;
 *     int buttonWidth = 100;
 *     int buttonHeight = 30;
 *     void draw() {
 *         if (BlackBox.checkClicked(buttonLocationX, buttonLocationY, buttonWidth, buttonHeight)) {
 *             println("The button was clicked!");
 *         }
 *     }
 * Step 5
 *   Generate a random number and get an int, not a float (fixes incompatible argument error)
 *   Example Code:
 *     int maxWidth = 20;
 *     
 *     int minHeight = 10;
 *     int maxHeight = 20;
 *     void draw() {
 *         ellipse(25, 25, BlackBox.r(maxWidth), BlackBox.r(minHeight, maxHeight));
 *     }
 *
 * Questions
 *   1. Why do the key names have VK in front of them?
 *      A. 'VK' stands for 'Virtual Keyboard'. The variable names were something I copied from the link.
 *   2. How do I use this?
 *      A. Scroll up
 *   3. Why the name BlackBox?
 *      A. 'Black Box' is something that usually "just works" without any extra help. You can use this
 *         entire library without ever knowing how it works (which was my goal).
 */

import java.awt.event.*;

static class BlackBox {
    
    private static PApplet instance;
    private static boolean[] keySet;
    
    public static void init(PApplet instance) {
        keySet = new boolean[525];
        for (int i = 0; i < keySet.length; i++) {
            keySet[i] = false;
        }
        instance.addKeyListener(new KeyListener() {
            @Override
            public void keyReleased(java.awt.event.KeyEvent e) {
                setKeyDownStatus(e.getKeyCode(), false);
            }
            
            @Override
            public void keyTyped(java.awt.event.KeyEvent e) {
                
            }
            
            @Override
            public void keyPressed(java.awt.event.KeyEvent e) {
                setKeyDownStatus(e.getKeyCode(), true);
            }
        });
    }
    
    public static boolean isKeyDown(int code) {
        return keySet[code];
    }
    
    public static void setKeyDownStatus(int code, boolean down) {
        if (code >= 0 && code < keySet.length) {
            keySet[code] = down;
        }
        else {
            throw new IllegalArgumentException("Number can't be less than 0 or greater than " + keySet.length);
        }
    }
    
    public static int r(int max) {
        return r(0, max);
    }
    
    public static int r(int min, int max) {
        return (int) instance.random(min, max);
    }
    
    public static boolean checkClicked(int x, int y, int bWidth, int bHeight) {
        if (instance.mousePressed && instance.mouseX > x && instance.mouseX < x + bWidth && instance.mouseY > y && instance.mouseY < y + bHeight)
            return true;
        return false;
    }
    
    /*
     *                         <<---- // NOTICE \\ ---->>
     * =============================================================================
     * | The variables initialized directly below have been adapted from the       |
     * | documentation publicly available at the following website (just giving    |
     * | credit where credit is due!)                                              |
     * | http://docs.oracle.com/javase/1.4.2/docs/api/java/awt/event/KeyEvent.html |
   * |                                       |
   * | The reason that I copied these values is since they exist inside KeyEvent |
   * | in the package java.awt.event.KeyEvent, and NOT in the KeyEvent class     |
   * | that Processing provides, which means unless people used the explicit     |
   * | class name java.awt.event.KeyEvent.KEY_NAME, they would not be able to    |
   * | use these key codes. It's a convenience thing ;D                          |
     * =============================================================================
     */
    public static final int  KEY_FIRST = 400;
    public static final int  KEY_LAST = 402;
    public static final int  KEY_LOCATION_LEFT = 2;
    public static final int  KEY_LOCATION_NUMPAD = 4;
    public static final int  KEY_LOCATION_RIGHT = 3;
    public static final int  KEY_LOCATION_STANDARD = 1;
    public static final int  KEY_LOCATION_UNKNOWN = 0;
    public static final int  KEY_PRESSED = 401;
    public static final int  KEY_RELEASED = 402;
    public static final int  KEY_TYPED = 400;
    public static final int  VK_0 = 48;
    public static final int  VK_1 = 49;
    public static final int  VK_2 = 50;
    public static final int  VK_3 = 51;
    public static final int  VK_4 = 52;
    public static final int  VK_5 = 53;
    public static final int  VK_6 = 54;
    public static final int  VK_7 = 55;
    public static final int  VK_8 = 56;
    public static final int  VK_9 = 57;
    public static final int  VK_A = 65;
    public static final int  VK_ACCEPT = 30;
    public static final int  VK_ADD = 107;
    public static final int  VK_AGAIN = 65481;
    public static final int  VK_ALL_CANDIDATES = 256;
    public static final int  VK_ALPHANUMERIC = 240;
    public static final int  VK_ALT = 18;
    public static final int  VK_ALT_GRAPH = 65406;
    public static final int  VK_AMPERSAND = 150;
    public static final int  VK_ASTERISK = 151;
    public static final int  VK_AT = 512;
    public static final int  VK_B = 66;
    public static final int  VK_BACK_QUOTE = 192;
    public static final int  VK_BACK_SLASH = 92;
    public static final int  VK_BACK_SPACE = 8;
    public static final int  VK_BRACELEFT = 161;
    public static final int  VK_BRACERIGHT = 162;
    public static final int  VK_C = 67;
    public static final int  VK_CANCEL = 3;
    public static final int  VK_CAPS_LOCK = 20;
    public static final int  VK_CIRCUMFLEX = 514;
    public static final int  VK_CLEAR = 12;
    public static final int  VK_CLOSE_BRACKET = 93;
    public static final int  VK_CODE_INPUT = 258;
    public static final int  VK_COLON = 513;
    public static final int  VK_COMMA = 44;
    public static final int  VK_COMPOSE = 65312;
    public static final int  VK_CONTROL = 17;
    public static final int  VK_CONVERT = 28;
    public static final int  VK_COPY = 65485;
    public static final int  VK_CUT = 65489;
    public static final int  VK_D = 68;
    public static final int  VK_DEAD_ABOVEDOT = 134;
    public static final int  VK_DEAD_ABOVERING = 136;
    public static final int  VK_DEAD_ACUTE = 129;
    public static final int  VK_DEAD_BREVE = 133;
    public static final int  VK_DEAD_CARON = 138;
    public static final int  VK_DEAD_CEDILLA = 139;
    public static final int  VK_DEAD_CIRCUMFLEX = 130;
    public static final int  VK_DEAD_DIAERESIS = 135;
    public static final int  VK_DEAD_DOUBLEACUTE = 137;
    public static final int  VK_DEAD_GRAVE = 128;
    public static final int  VK_DEAD_IOTA = 141;
    public static final int  VK_DEAD_MACRON = 132;
    public static final int  VK_DEAD_OGONEK = 140;
    public static final int  VK_DEAD_SEMIVOICED_SOUND = 143;
    public static final int  VK_DEAD_TILDE = 131;
    public static final int  VK_DEAD_VOICED_SOUND = 142;
    public static final int  VK_DECIMAL = 110;
    public static final int  VK_DELETE = 127;
    public static final int  VK_DIVIDE = 111;
    public static final int  VK_DOLLAR = 515;
    public static final int  VK_DOWN = 40;
    public static final int  VK_E = 69;
    public static final int  VK_END = 35;
    public static final int  VK_ENTER = 10;
    public static final int  VK_EQUALS = 61;
    public static final int  VK_ESCAPE = 27;
    public static final int  VK_EURO_SIGN = 516;
    public static final int  VK_EXCLAMATION_MARK = 517;
    public static final int  VK_F = 70;
    public static final int  VK_F1 = 112;
    public static final int  VK_F10 = 121;
    public static final int  VK_F11 = 122;
    public static final int  VK_F12 = 123;
    public static final int  VK_F13 = 61440;
    public static final int  VK_F14 = 61441;
    public static final int  VK_F15 = 61442;
    public static final int  VK_F16 = 61443;
    public static final int  VK_F17 = 61444;
    public static final int  VK_F18 = 61445;
    public static final int  VK_F19 = 61446;
    public static final int  VK_F2 = 113;
    public static final int  VK_F20 = 61447;
    public static final int  VK_F21 = 61448;
    public static final int  VK_F22 = 61449;
    public static final int  VK_F23 = 61450;
    public static final int  VK_F24 = 61451;
    public static final int  VK_F3 = 114;
    public static final int  VK_F4 = 115;
    public static final int  VK_F5 = 116;
    public static final int  VK_F6 = 117;
    public static final int  VK_F7 = 118;
    public static final int  VK_F8 = 119;
    public static final int  VK_F9 = 120;
    public static final int  VK_FINAL = 24;
    public static final int  VK_FIND = 65488;
    public static final int  VK_FULL_WIDTH = 243;
    public static final int  VK_G = 71;
    public static final int  VK_GREATER = 160;
    public static final int  VK_H = 72;
    public static final int  VK_HALF_WIDTH = 244;
    public static final int  VK_HELP = 156;
    public static final int  VK_HIRAGANA = 242;
    public static final int  VK_HOME = 36;
    public static final int  VK_I = 73;
    public static final int  VK_INPUT_METHOD_ON_OFF = 263;
    public static final int  VK_INSERT = 155;
    public static final int  VK_INVERTED_EXCLAMATION_MARK = 518;
    public static final int  VK_J = 74;
    public static final int  VK_JAPANESE_HIRAGANA = 260;
    public static final int  VK_JAPANESE_KATAKANA = 259;
    public static final int  VK_JAPANESE_ROMAN = 261;
    public static final int  VK_K = 75;
    public static final int  VK_KANA = 21;
    public static final int  VK_KANA_LOCK = 262;
    public static final int  VK_KANJI = 25;
    public static final int  VK_KATAKANA = 241;
    public static final int  VK_KP_DOWN = 225;
    public static final int  VK_KP_LEFT = 226;
    public static final int  VK_KP_RIGHT = 227;
    public static final int  VK_KP_UP = 224;
    public static final int  VK_L = 76;
    public static final int  VK_LEFT = 37;
    public static final int  VK_LEFT_PARENTHESIS = 519;
    public static final int  VK_LESS = 153;
    public static final int  VK_M = 77;
    public static final int  VK_META = 157;
    public static final int  VK_MINUS = 45;
    public static final int  VK_MODECHANGE = 31;
    public static final int  VK_MULTIPLY = 106;
    public static final int  VK_N = 78;
    public static final int  VK_NONCONVERT = 29;
    public static final int  VK_NUM_LOCK = 144;
    public static final int  VK_NUMBER_SIGN = 520;
    public static final int  VK_NUMPAD0 = 96;
    public static final int  VK_NUMPAD1 = 97;
    public static final int  VK_NUMPAD2 = 98;
    public static final int  VK_NUMPAD3 = 99;
    public static final int  VK_NUMPAD4 = 100;
    public static final int  VK_NUMPAD5 = 101;
    public static final int  VK_NUMPAD6 = 102;
    public static final int  VK_NUMPAD7 = 103;
    public static final int  VK_NUMPAD8 = 104;
    public static final int  VK_NUMPAD9 = 105;
    public static final int  VK_O = 79;
    public static final int  VK_OPEN_BRACKET = 91;
    public static final int  VK_P = 80;
    public static final int  VK_PAGE_DOWN = 34;
    public static final int  VK_PAGE_UP = 33;
    public static final int  VK_PASTE = 65487;
    public static final int  VK_PAUSE = 19;
    public static final int  VK_PERIOD = 46;
    public static final int  VK_PLUS = 521;
    public static final int  VK_PREVIOUS_CANDIDATE = 257;
    public static final int  VK_PRINTSCREEN = 154;
    public static final int  VK_PROPS = 65482;
    public static final int  VK_Q = 81;
    public static final int  VK_QUOTE = 222;
    public static final int  VK_QUOTEDBL = 152;
    public static final int  VK_R = 82;
    public static final int  VK_RIGHT = 39;
    public static final int  VK_RIGHT_PARENTHESIS = 522;
    public static final int  VK_ROMAN_CHARACTERS = 245;
    public static final int  VK_S = 83;
    public static final int  VK_SCROLL_LOCK = 145;
    public static final int  VK_SEMICOLON = 59;
    public static final int  VK_SEPARATER = 108;
    public static final int  VK_SEPARATOR = 108;
    public static final int  VK_SHIFT = 16;
    public static final int  VK_SLASH = 47;
    public static final int  VK_SPACE = 32;
    public static final int  VK_STOP = 65480;
    public static final int  VK_SUBTRACT = 109;
    public static final int  VK_T = 84;
    public static final int  VK_TAB = 9;
    public static final int  VK_U = 85;
    public static final int  VK_UNDEFINED = 0;
    public static final int  VK_UNDERSCORE = 523;
    public static final int  VK_UNDO = 65483;
    public static final int  VK_UP = 38;
    public static final int  VK_V = 86;
    public static final int  VK_W = 87;
    public static final int  VK_X = 88;
    public static final int  VK_Y = 89;
    public static final int  VK_Z = 90;
}
