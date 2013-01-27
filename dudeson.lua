-- setup player
player = {}

function initPlayer()
  player = {}
  player.age = 0
  player.thirsty = 1.0
  player.hungry = 1.0
  player.air = 1.0
  player.scheisse = 0.0
  player.social = 0.0
  player.tick = function(self)
      self.age = self.age + 1
      self.air = self.air - 0.3
      
    end
end