
![image](https://github.com/user-attachments/assets/99194d8e-dc7e-4195-a938-89aa0f0cdae8)


# Lua Function and Library Documentation - BoxID/Clocker

This documentation provides an overview of Lua functions and libraries related to the BoxID/Clocker system.

## System Triggered Functions

### `rfid_detect()`
- **Description**: Function runs when the RFID subsystem detects a card and reads its UID.

### `action_oncard()`
- **Description**: Function runs when the system recognizes the card.

### `action_known()`
- **Description**: Function runs when the system recognizes the card as known.

### `action_unknown()`
- **Description**: Function runs when the system recognizes the card as unknown.

### `action_hold()`
- **Description**: Function runs when the card remains on the reader for a prolonged time.

### `action_remove()`
- **Description**: Function runs when the card is removed from the reader.

---

## Library `dev`

### Output Control

#### `function out_on(channel)`
- **Description**: Set channel to On.
- **Example**: `dev.out_on(0)`

#### `function out_off(channel)`
- **Description**: Clear the output channel.

#### `function out_single(channel, time)`
- **Description**: Set output for a specified time.

#### `function out_blink(channel, ton, toff, cnt)`
- **Description**: Set output in blink mode.

#### `function out_get(channel)`
- **Description**: Return output state.

#### `function in_get(channel)`
- **Description**: Return input state.

#### `function in_get_cnt(channel)`
- **Description**: Return input counter.

### Sound and Communication

#### `function buzz(sound)`
- **Description**: Make a sound. 
  - `0` = Accept 
  - `1` = Reject 
  - `2` = Pulse tone.

#### `void email(recipient, subject, text)`
- **Description**: Send an email.

#### `http_send(url, data, data_length, method, content_type)`
- **Description**: Send an HTTP request.

#### `mqtt(topic, data, length)`
- **Description**: Publish an MQTT message.

#### `console(message)`
- **Description**: Print to Lua console.

#### `log(message)`
- **Description**: Log a message to flash memory.

### LCD Control

#### `lcd_clear()`
- **Description**: Clear LCD display.

#### `lcd_text_line(line, text)`
- **Description**: Print text on selected line (1-4) of the LCD.

#### `lcd_text(text)`
- **Description**: Print text on LCD.

#### `lcd_text_timeout(timeout)`
- **Description**: Set timeout for LCD standard text.

### Network Information

#### `get_mac_ascii()`
- **Description**: Return MAC address.

#### `get_ip_ascii()`
- **Description**: Return IP address.

---

## Library `mf` (Mifare Classic)

### Authentication and Data Manipulation

#### `auth_ee(key_no, block, ab)`
- **Description**: Authenticate with key from secure memory.

#### `auth_key(key, block, ab)`
- **Description**: Authenticate with given key.

#### `rd(block)`
- **Description**: Read a Mifare Classic block.

#### `wr(block, data)`
- **Description**: Write to a Mifare Classic block.

#### `deauth()`
- **Description**: Deauthenticate.

---

## Library `card` (User Related)

### User Information

#### `getFlag()`
- **Description**: Get flags related to the assigned user.

#### `getUserId()`
- **Description**: Get user ID related to the assigned user.

---

## Library `rfid`

### UID Management

#### `getUidBin()`
- **Description**: Get UID as binary.

#### `getUidBinLen()`
- **Description**: Get binary UID length.

#### `getUidAscii()`
- **Description**: Get UID as ASCII (HEX).

#### `getUidAsciiLen()`
- **Description**: Get ASCII UID length.

#### `overwriteUidAscii(uid)`
- **Description**: Override UID in the device.

#### `pause(ms)`
- **Description**: Pause RFID for a specified time (ms).

---
