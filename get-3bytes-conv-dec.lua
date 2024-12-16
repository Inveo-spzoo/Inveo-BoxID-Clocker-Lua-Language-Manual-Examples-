function rfid_detect()
 dev.console("DETECT fun")
 rfid.pause(100)
 
 --uid=rfid.getUidAscii()

 uid="49003CA143"
 dev.console("UID:"..uid)

 extracted_len = uid:sub(5, 10)
 dev.console("UIDshort:"..extracted_len ) 
 

 uidDec= tonumber(extracted_len,16)
 
 final = string.format("%010d", uidDec)
 
 
 dev.console("UIDdec:"..final) 
 rfid.overwriteUidAscii(final )
 
end

function action_oncard()
 dev.console("ONCARD fun")
end

function action_known()
 dev.console("KNOWN fun")
end

function action_unknown()
 dev.console("UNKNOWN fun")
rfid.pause(100)

ret=mf.auth_key('4A0C28E1703D',1,0)
dev.console("Auth 2 ret="..ret)
if ret == 0 then
 mf.deauth()
 return
end

ret,s2=mf.rd(1)
dev.console("Read block 2 len="..ret)
if ret==0 then
 mf.deauth()
 return
end


mf.deauth()

len2,data2=bunpack(s2,"X16")

mf_data = '&block[1]='..data2

dev.console("Read block 2 len="..mf_data)


ip = dev.get_ip_ascii();
dev.console(ip)
mac = dev.get_mac_ascii();
dev.console(mac)

to_send = 'mac='..mac..'&ip='..ip..mf_data
dev.console(to_send)

len = string.len(to_send)
dev.http("http://192.168.0.85:333/index.php",data1,len,0,1)
dev.http(nil,to_send,len,0,0)

end

function action_hold()
end

function action_remove()
 dev.console("Remove")
end