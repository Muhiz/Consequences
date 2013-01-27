
function initInput()

if(MOAIInputMgr.device.keyboard) then
    print("Keyboard")
    MOAIInputMgr.device.keyboard:setCallback(
        function(key,down)
            if down==true then
                print(string.char(tostring(key)))

            end
        end
    )
else
    print("No Keyboard")

    if(MOAIEnvironment.osBrand == "iOS")   then
        MOAIKeyboardIOS.showKeyboard()
        MOAIKeyboardIOS.setListener(MOAIKeyboardIOS.EVENT_INPUT,function(start,length,textVal)
            print(textVal)
        end
        )
    else
        print("The keyboard is a lie");
        -- Android, no keyboard support :(
    end
end
end