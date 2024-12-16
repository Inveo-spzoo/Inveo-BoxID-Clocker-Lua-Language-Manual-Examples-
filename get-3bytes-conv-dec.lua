-- Function to handle RFID detection
function rfid_detect()
    -- Log that the detection function has been triggered
    dev.console("DETECT fun")
    
    -- Pause for 100ms (may be to stabilize RFID read)
    rfid.pause(100)
    
    -- The UID of the RFID tag is hardcoded for this example (replace with actual reading logic)
    -- uid = rfid.getUidAscii()
    uid = "49003CA143"
    
    -- Log the detected UID
    dev.console("UID:"..uid)

    -- Extract a portion of the UID (from index 5 to 10) to shorten it
    extracted_len = uid:sub(5, 10)
    
    -- Log the shortened UID
    dev.console("UIDshort:"..extracted_len)

    -- Convert the extracted UID portion from hexadecimal to decimal
    uidDec = tonumber(extracted_len, 16)
    
    -- Format the decimal UID to a 10-digit number, padding with leading zeros if necessary
    final = string.format("%010d", uidDec)
    
    -- Log the final decimal UID
    dev.console("UIDdec:"..final)

    -- Overwrite the RFID UID with the newly formatted UID
    rfid.overwriteUidAscii(final)
end

-- Action for when a card is present (but currently doesn't do anything)
function action_oncard()
    dev.console("ONCARD fun")
end

-- Action for when the card is recognized as known (currently doesn't do anything)
function action_known()
    dev.console("KNOWN fun")
end

-- Action for when the card is recognized as unknown
function action_unknown()
    dev.console("UNKNOWN fun")
    
    -- Pause for 100ms (for stabilization)
    rfid.pause(100)

    -- Authenticate with the Mifare card using a given key (key and block are hardcoded here)
    ret = mf.auth_key('4A0C28E1703D', 1, 0)
    dev.console("Auth 2 ret="..ret)
    
    -- If authentication fails, deauthenticate and return
    if ret == 0 then
        mf.deauth()
        return
    end

    -- Read data from block 1 of the Mifare card
    ret, s2 = mf.rd(1)
    dev.console("Read block 2 len="..ret)
    
    -- If read fails, deauthenticate and return
    if ret == 0 then
        mf.deauth()
        return
    end

    -- Deauthenticate after reading
    mf.deauth()

    -- Unpack the data read from the card (in this case, it seems to unpack a 16-byte data)
    len2, data2 = bunpack(s2, "X16")

    -- Store the data in a formatted string for further use
    mf_data = '&block[1]='..data2

    -- Log the read block data
    dev.console("Read block 2 len="..mf_data)

    -- Retrieve the device's IP and MAC addresses
    ip = dev.get_ip_ascii()
    dev.console(ip)
    mac = dev.get_mac_ascii()
    dev.console(mac)

    -- Prepare the data to send, which includes IP, MAC, and the read Mifare block data
    to_send = 'mac='..mac..'&ip='..ip..mf_data
    dev.console(to_send)

    -- Get the length of the data to send
    len = string.len(to_send)

    -- Send the data via HTTP POST request to a specified URL
    dev.http("http://192.168.0.85:333/index.php", data1, len, 0, 1)
    
    -- Optionally send another HTTP request with the same data
    dev.http(nil, to_send, len, 0, 0)
end

-- Placeholder function for an action when the card is held
function action_hold()
end

-- Action for when the card is removed
function action_remove()
    -- Log that the card has been removed
    dev.console("Remove")
end
