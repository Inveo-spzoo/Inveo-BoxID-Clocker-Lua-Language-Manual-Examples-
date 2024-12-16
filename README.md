
![image](https://github.com/user-attachments/assets/ea436010-d1d3-4cb7-a72c-3b2d3069bd1c)

![image](https://github.com/user-attachments/assets/99194d8e-dc7e-4195-a938-89aa0f0cdae8)



Lua Function and Library Documentation - BoxID/Clocker Lua Functions Triggered by System function
rfid_detect() - Function runs when the RFID subsystem detects a card and reads its UID. function 
action_oncard() - Function runs when the system recognizes the card. function 
action_known() - Function runs when the system recognizes the card as known. 
function action_unknown() - Function runs when the system recognizes the card as unknown. function 
action_hold() - Function runs when the card remains on the reader for a prolonged time. function 
action_remove() - Function runs when the card is removed from the reader.

Library dev
 ● // set output ● function out_on(channel) - Set channel to On (e.g., dev.out_on(0)). 
 ● function out_off(channel) - Clear the output channel. 
 ● function out_single(channel, time) - Set output for a specified time. 
 ● function out_blink(channel, ton, toff, cnt) - Set output in blink mode. 
 ● function out_get(channel) - Return output state. 
 ● function in_get(channel) - Return input state.
 ● function in_get_cnt(channel) - Return input counter. 
 ● function buzz(sound) - Make a sound: 0=Accept, 1=Reject, 2=Pulse tone.
 ● void email(recipient, subject, text) - Send an email.
 ● http_send(url, data, data_length, method, content_type) - Send an HTTP request. 
 ● mqtt(topic, data, length) - Publish an MQTT message.
 ● console(message) - Print to Lua console.
 ● log(message) - Log a message to flash memory.
 ● lcd_clear() - Clear LCD display.
 ● lcd_text_line(line, text) - Print text on selected line [1-4] of the LCD.

● lcd_text(text) - Print text on LCD.
● lcd_text_timeout(timeout) - Set timeout for LCD standard text.
● get_mac_ascii() - Return MAC address.
● get_ip_ascii() - Return IP address. Library mf (Mifare Classic) 
● auth_ee(key_no, block, ab) - Authenticate with key from secure memory.
● auth_key(key, block, ab) - Authenticate with given key. 
● rd(block) - Read a Mifare Classic block. 
● wr(block, data) - Write to a Mifare Classic block. 
● deauth() - Deauthenticate. Library card (User Related) 
● getFlag() - Get flags related to the assigned user.
● getUserId() - Get user ID related to the assigned user. Library rfid
● getUidBin() - Get UID as binary. 
● getUidBinLen() - Get binary UID length. 
● getUidAscii() - Get UID as ASCII (HEX). 
● getUidAsciiLen() - Get ASCII UID length. 
● overwriteUidAscii(uid) - Override UID in the device. 
● pause(ms) - Pause RFID for a specified time (ms).
