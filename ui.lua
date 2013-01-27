require "dudeson"

local function insertElement(x,y,w,h,texture)
  uiTexture = MOAIImage.new()
  uiTexture:load(texture)

  uiQuad = MOAIGfxQuad2D.new()

  uiQuad:setTexture(uiTexture)
  uiQuad:setRect( x,y,w,h )
  uiQuad:setUVRect ( 0, 0, 1, 1 )

  prop = MOAIProp2D.new ()
  prop:setDeck ( uiQuad )
--  prop:setBlendMode(MOAIProp2D.BLEND_MULTIPLY );

  uiLayer:insertProp ( prop )  
end

function createUI()
  uiLayer = MOAILayer2D.new ()
  uiLayer:setViewport ( screen )

  insertElement(0,0,screenWidth, 80, "assets/header.png")  
  insertElement(0,85,200, screenHeight-15, "assets/leftBar.png")  
  insertElement(screenWidth-150,85,screenWidth, 150, "assets/heart.png")  

local spriteLibs = dofile ( 'assets/animation/harttt.lua' )
 spriteLibs = loadSpriteLibs ( spriteLibs )
local spriteLib = spriteLibs [ 1 ]

local sprite = MOAIProp2D.new ()
sprite:setDeck ( spriteLib )

local player = MOAIAnim.new ()
player:reserveLinks(1)

local curve = MOAIAnimCurve.new ()

curve:reserveKeys ( 4 )
curve:setKey ( 1, 0.00, 1, MOAIEaseType.FLAT )
curve:setKey ( 2, 0.33, 2, MOAIEaseType.FLAT )
curve:setKey ( 3, 0.66, 3, MOAIEaseType.FLAT )
curve:setKey ( 4, 1.00, 4, MOAIEaseType.FLAT )

player:setLink ( 1, curve, sprite, MOAIProp2D.ATTR_INDEX )

player:setMode ( MOAITimer.LOOP )
player:start()
--sprite:setBlendMode( MOAIProp2D.BLEND_MULTIPLY )

sprite:setLoc(400,200, 200,200 )
uiLayer:insertProp ( sprite )  


  MOAISim.pushRenderPass ( uiLayer )
  
end
