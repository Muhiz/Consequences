function createBackground()
  camera = MOAICamera2D.new ()
--  camera:moveLoc (screenWidth*4, 0, 10, MOAIEaseType.SOFT_SMOOTH )

  layer1 = MOAILayer2D.new ()
  layer1:setViewport ( view )
  layer1:setCamera ( camera )
  layer1:setParallax ( 0.1, 1 )
  MOAISim.pushRenderPass ( layer1 )

  layer2 = MOAILayer2D.new ()
  layer2:setViewport ( view )
  layer2:setCamera ( camera )
  layer2:setParallax ( 0.2, 1 )
  MOAISim.pushRenderPass ( layer2 )

  layer3 = MOAILayer2D.new ()
  layer3:setViewport ( view )
  layer3:setCamera ( camera )
  layer3:setParallax( 0.3, 1 )
  
  MOAISim.pushRenderPass ( layer3 )

  bgrQuad = MOAIGfxQuad2D.new ()
  bgrQuad:setTexture ( "assets/bc_alin.png" )
  bgrQuad:setRect ( -screenWidth/2, screenHeight/2, screenWidth, -screenHeight/2 )

  
  cityQuad = MOAIGfxQuad2D.new ()
  cityQuad:setTexture ( "assets/bg_houses.png" )
  cityQuad:setRect ( -screenWidth/2, screenHeight/2 - 10, screenWidth/2, 0 )  

  groundQuad = MOAIGfxQuad2D.new ()
  groundQuad:setTexture ( "assets/ground.png" )
  groundQuad:setRect ( -screenWidth/2, screenHeight/2, screenWidth/2, screenHeight/2 - 20  )  


  grassQuad = MOAIGfxQuad2D.new ()
  grassQuad:setTexture ( "assets/grass.png" )
  grassQuad:setRect ( -screenWidth/2, screenHeight/2 - 18, screenWidth/2, screenHeight/2 - 30 )
  
  

  prop = MOAIProp2D.new ()
  prop:setDeck ( bgrQuad )

--  prop:setScl ( 0.75, 0.75 )
  layer1:insertProp ( prop )


  prop = MOAIProp2D.new ()
  prop:setDeck ( cityQuad )
--  prop:setScl ( 0.75, 0.75 )

  layer2:insertProp ( prop )

  prop = MOAIProp2D.new ()
  prop:setDeck( groundQuad )  
--  prop:setScl ( 1, 0.50 )  
  layer3:insertProp ( prop )
  
  prop = MOAIProp2D.new ()  
  prop:setDeck ( grassQuad )
--  prop:setScl ( 1, 0.50 )  
  
  layer3:insertProp ( prop )

 
end
