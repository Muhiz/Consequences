

local function checkAudio()
    return MOAIUntzSystem
end

function initAudio()
  if not checkAudio() then 
    print("No audio") 
    return 
  end
  
  MOAIUntzSystem.initialize()
  MOAIUntzSystem.setVolume(1)
  song1 = MOAIUntzSound.new()
  song1:load("assets/Audio/heartbeat-01.mp3")
  song2 = MOAIUntzSound.new()
  song2:load("assets/Audio/As the Blossom burns.mp3")
  
  song1:setVolume ( 1 )
  song1:setLooping ( true )
  song1:play ()  

  song2:setVolume ( 0.3 )
  song2:setLooping ( true )
  song2:play ()  

end
