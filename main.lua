require "init"
--require "input"
require "audio"
require "animation"
require "background"
require "ui"
require "text"
require "dudeson"

currentText = ""
--mainThread = MOAIThread.new ()
local function main()
  initAudio()
  initPlayer()
  createBackground()
--  loadFont('assets/arial-rounded.ttf')

  createUI()

  initText()

--  initInput()
  initAnimations()
  gameOver = false
--  createTextBox()
  createTitle()
  
  createTextBox()
  
  currentText = "Press a key"
--  thread = MOAIThread.new ()
--  thread:run ( playerTick( ))
end

function playerTick()
    wait ( player:tick())
end

inAnimation = false


function foo(currentAnim)
  if currentAnim == 'walk' then
    setText("Quick, Press Z!")

    inAnimation = false
    
  elseif currentAnim == 'sleep' then
    
    setText("You need to talk!")
    
    inAnimation = true
  elseif currentAnim == 'talk' then
    
    setText("You stink!")
    
    inAnimation = true
    
elseif currentAnim == 'shower' then
    
    setText("You're hungry!")
    
    inAnimation = true
  else
    setText("Good, Now Press any key!")    
  end
end

main()

if(MOAIInputMgr.device.keyboard) then
    MOAIInputMgr.device.keyboard:setCallback(
        function(key,down)
          --if inAnimation == true then 
          --  return
          if down == true then
            if key==100 then
              switchAnimation('drink')
            elseif key ==122 then
              switchAnimation('sleep')              
            elseif key == 101 then
              switchAnimation('eat') 
            elseif key ==98 then
              switchAnimation('breathe')              
            elseif key == 115 then
              switchAnimation('shit')  
            elseif key == 116 then
              switchAnimation('talk')  
            elseif key == 104 then
              switchAnimation('shower')  
            end

          end
        end
    )
end




-- MOAISim.pushRenderPass (dudelayer )


-- background:insertProp(text)




