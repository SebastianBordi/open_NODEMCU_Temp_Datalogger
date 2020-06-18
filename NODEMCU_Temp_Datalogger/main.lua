
adcStep = 2.79/1024
led = 4

function sendData()
    gpio.write(led,gpio.LOW)
    headers = "nill"

    temp = (adc.read(0) * adcStep) * 100


    http.post("http://192.168.0.10:8367/ecs/api/temp", headers,"{ \"temp\" : ".. temp .." }", 
        function(code, body, headers)
            gpio.write(led,gpio.HIGH)
            if (code < 0) then
                print("HTTP request failed")
            else
                --print(temp .. "°c")
                --for key,value in pairs(headers) do print(key,value) end
            end
        end)
end


gpio.mode(led,gpio.OUTPUT)      --LED pin as output

--Blink LED
for i = 5, 0 , -1
do
    gpio.write(led,gpio.LOW)       
    tmr.delay(100000)
    gpio.write(led,gpio.HIGH)       
    tmr.delay(100000)
end

tobj = tmr.create()
tobj:alarm(60000, tmr.ALARM_AUTO, sendData)


