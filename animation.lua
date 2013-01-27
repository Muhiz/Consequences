require "init"

function printf ( ... )
	return io.stdout:write ( string.format ( ... ))
end



local currentAnim = 'walk'


local spriteLibs = {}
spriteLibs['drink'] = dofile ( 'assets/animation/drinking.lua' )
spriteLibs['breathe'] = dofile ( 'assets/animation/breathing.lua' )
spriteLibs['eat'] = dofile ( 'assets/animation/eating.lua' )
spriteLibs['shit'] = dofile ( 'assets/animation/shitting.lua' )
spriteLibs['sleep'] = dofile ( 'assets/animation/sleeping.lua' )
spriteLibs['talk'] = dofile ( 'assets/animation/talking.lua' )
spriteLibs['shower'] = dofile ( 'assets/animation/showering.lua' )


spriteLibs['walk'] = dofile ( 'assets/animation/walk.lua' )

function loadSpriteLibs ( specList )
  print("Load sprite" )
  print( specList.texture )
	local list = {}

	local texture = MOAITexture.new ()
	texture:load ( specList.texture )

	for i, spec in ipairs ( specList ) do

		local spriteLib = MOAIGfxQuadListDeck2D.new ()
		table.insert ( list, spriteLib );

		spriteLib:reserveUVQuads ( #spec.uvRects )
		for j, uvRect in ipairs ( spec.uvRects ) do

			if uvRect.r then
				spriteLib:setUVQuad ( j,
					uvRect.x0, uvRect.y0,
					uvRect.x0, uvRect.y1,
					uvRect.x1, uvRect.y1,
					uvRect.x1, uvRect.y0
				)
			else
				spriteLib:setUVRect ( j, uvRect.x0, uvRect.y0, uvRect.x1, uvRect.y1 )
			end
		end

		spriteLib:reserveQuads ( #spec.quads )
		for j, quad in ipairs ( spec.quads ) do
			if quad.x0 ~= nil then
				spriteLib:setRect ( j, quad.x0, quad.y0, quad.x1, quad.y1 )
			else
				spriteLib:setQuad ( j,
					quad.v0.x, quad.v0.y,
					quad.v1.x, quad.v1.y,
					quad.v2.x, quad.v2.y,
					quad.v3.x, quad.v3.y
				)
			end
		end

		spriteLib:reservePairs ( #spec.prims )
		for j, prim in ipairs ( spec.prims ) do
			spriteLib:setPair ( j, prim.uv, prim.q )
		end

		spriteLib:reserveLists ( #spec.sprites )
		for j, sprite in ipairs ( spec.sprites ) do
			spriteLib:setList ( j, sprite.base, sprite.size )
		end

		spriteLib:setTexture ( texture )
	end

	return list
end


local player = {}
local sprite = {}

function initAnimations()
  
  dudelayer = MOAILayer2D.new ()
  dudelayer:setViewport ( view )


  for k,v in pairs(spriteLibs) do
    player[k] = MOAIAnim.new ()
    
    spriteLibs[k] = loadSpriteLibs ( spriteLibs[k] )
    local spriteLib = spriteLibs[k][ 1 ]

    sprite[k] = MOAIProp2D.new ()
    sprite[k]:setDeck ( spriteLib )
    --sprite[k]:setScl ( 0.75, 0.75 )
    sprite[k]:setLoc( 200,75 )

    player[k]:reserveLinks(1)

    local curve = MOAIAnimCurve.new ()

    curve:reserveKeys ( 11 )
--    curve:setKey ( 1, 0.00, 1, MOAIEaseType.FLAT )
--    curve:setKey ( 2, 0.25, 2, MOAIEaseType.FLAT )
--    curve:setKey ( 3, 0.50, 3, MOAIEaseType.FLAT )
--    curve:setKey ( 4, 0.75, 4, MOAIEaseType.FLAT )
--    curve:setKey ( 5, 1.00, 2, MOAIEaseType.FLAT )
--
    curve:setKey ( 1, 0.00, 1, MOAIEaseType.EASE_IN )
    curve:setKey ( 2, 0.10, 2, MOAIEaseType.SMOOTH )
    curve:setKey ( 3, 0.20, 3, MOAIEaseType.SMOOTH )
    curve:setKey ( 4, 0.30, 4, MOAIEaseType.SMOOTH )
    curve:setKey ( 5, 0.40, 5, MOAIEaseType.SMOOTH )
    curve:setKey ( 6, 0.50, 6, MOAIEaseType.SMOOTH )
    curve:setKey ( 7, 0.60, 7, MOAIEaseType.SMOOTH )
    curve:setKey ( 8, 0.70, 8, MOAIEaseType.SMOOTH )
    curve:setKey ( 9, 0.80, 9, MOAIEaseType.SMOOTH )
    curve:setKey ( 10, 0.90, 10, MOAIEaseType.SMOOTH )
 
    curve:setKey ( 11, 1.0, 11, MOAIEaseType.EASE_OUT )
  

    player[k]:setLink ( 1, curve, sprite[k], MOAIProp2D.ATTR_INDEX )
    if k == 'walk' then 
      player[k]:setMode ( MOAITimer.LOOP )
    else
      player[k]:setMode ( MOAITimer.NORMAL )
    end
    
    player[k]:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, onEndSpan )
  end
-- sprite:setBlendMode( MOAIProp2D.BLEND_ADD )
-- 	sprite:setIndex ( sprite:getIndex () + 1 )
  MOAISim.pushRenderPass ( dudelayer )
  
end

function startAnimation()
  player[currentAnim]:start()
end

function stopAnimation()
  player[currentAnim]:stop()
end

function switchAnimation(to)
  player[currentAnim]:stop()
  dudelayer:removeProp ( sprite[currentAnim] )

  player[to]:start()
  dudelayer:insertProp ( sprite[to] )
  currentAnim = to

end

function onEndSpan()
    foo(currentAnim)

  if currentAnim == 'walk' then 
    return
  else
    switchAnimation('walk')
  end
  
  
end

