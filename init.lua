screenWidth = MOAIEnvironment.screenWidth
screenHeight = MOAIEnvironment.screenHeight

if screenWidth == nil then screenWidth = 800 end
if screenHeight == nil then screenHeight = 600 end

MOAISim.openWindow("Window",screenWidth,screenHeight)

view = MOAIViewport.new ()
view:setSize ( screenWidth, screenHeight )
view:setScale ( screenWidth, -screenHeight )


screen = MOAIViewport.new ()
screen:setSize ( screenWidth, screenHeight )
screen:setScale ( screenWidth, -screenHeight )
screen:setOffset(-1,1)


MOAIGfxDevice.setClearColor(1,1,1,1)

-- Helper for creating blocking action
function wait ( action )
    while action:isBusy () do 
      coroutine:yield () 
    end
end
----
-- Another with timer

