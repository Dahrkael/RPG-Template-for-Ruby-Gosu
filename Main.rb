begin
  # In case you use Gosu via rubygems.
  require 'rubygems'
rescue LoadError
  # In case you don't.
end
begin
require 'lib/gosu'
rescue LoadError
require 'gosu'
end

require 'FPSCounter.rb'
require 'Timer.rb'
require 'Initial.rb'
require 'Temp.rb'
require 'Hero.rb'
require 'Party.rb'
require 'Effects.rb'
require 'Window.rb'
require 'Character.rb'
require 'Character_Hero.rb'
require 'Map.rb'
require 'Window_Base.rb'
require 'Window_Selectable'
require 'Window_Command.rb'
require 'Window_MenuStatus.rb'
require 'Window_Gold.rb'
require 'Window_Steps.rb'
require 'Window_PlayTime.rb'
require 'Window_Location.rb'
require 'Scene_Title.rb'
require 'Scene_Map.rb'
require 'Scene_Menu.rb'




include Gosu

$initial = Initial_Settings.new
$window = Game_Window.new
$window.show