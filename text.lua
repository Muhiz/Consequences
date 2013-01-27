chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

function loadHeaderFont( fontfile ) 
  headerfont = MOAIFont.new()
  headerfont:loadFromTTF(fontfile,chars,60,72)
end

function loadFont( fontfile ) 
  font = MOAIFont.new()
  font:loadFromTTF(fontfile,chars,60,72)
end


function initText()
  if not headerfont then 
    loadHeaderFont('assets/In The Know.otf')
  end
  
  if not font then 
    loadFont('assets/arial-rounded.ttf')
  end
  
  
  textLayer = MOAILayer2D.new ()
  textLayer:setViewport ( screen )

  MOAISim.pushRenderPass ( textLayer )
end

function createTitle()
  local title = MOAITextBox.new()
  title = MOAITextBox.new()
  title:setString('Basic needs')
  title:setFont(headerfont)
  title:seekColor ( 0, 0, 0, 1,0, MOAIEaseType.FLAT )
  title:setTextSize(40,72)
  title:setYFlip(false)
  title:setRect(50,10,150,70)
  title:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
  textLayer:insertProp ( title )
  
  title = MOAITextBox.new()
  title = MOAITextBox.new()
  title:setString('Consequences')
  title:setFont(headerfont)
  title:seekColor ( 0, 0, 0, 1,0, MOAIEaseType.FLAT )
  title:setTextSize(60,72)
  title:setYFlip(false)
  title:setRect(screenWidth/2-100,0,screenWidth/2+200,90)
  title:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
  textLayer:insertProp ( title )    
end

function createTextBox()  
  text = MOAITextBox.new()
  text:setString('Press BEST Z, D or H key!')
  text:setFont(font)
  text:seekColor ( 1, 0, 0, 1, 3, MOAIEaseType.EASE_IN )
  text:setTextSize(60,72)
  text:setYFlip(false)
  text:setRect(500,200,800,500)
  text:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
  textLayer:insertProp ( text )
end

function setText( txt )
  text:setString(txt)
end

function insertText(x,y,w,h, text)
   text = MOAITextBox.new()
  text:setString(text)
  text:setFont(font)
  text:seekColor ( 1, 0, 0, 1, 3, MOAIEaseType.EASE_IN )
  text:setTextSize(60,72)
  text:setYFlip(false)
  text:setRect(screenWidth/2-100,screenHeight/2-300,screenWidth/2+100,screenHeight/2+100)
  text:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
  textLayer:insertProp ( text ) 
end
