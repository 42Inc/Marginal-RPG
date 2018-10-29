#!/usr/bin/ruby

$debug_engine = 0
$debug_level  = 0

if (ARGV.length > 0)
  if (ARGV[0] == "y")
    $debug_engine = 1
  else
    $debug_engine = 0
  end
end

def print_debug(string)
# color_level_indication
  set_color("debug")
  STDOUT.print "[#$debug_level] "
  set_color("default")
  STDOUT.print string
end

def print_error_msg(string)
# color_level_indication
  set_color("error")
  STDOUT.print string
  set_color("default")
end

def print_system(string)
# color_level_indication
  set_color("system")
  STDOUT.print "[SYSTEM] "
  set_color("default")
  STDOUT.print string
end

def print_error(string)
# color_level_indication
  set_color("error")
  STDERR.print string
  set_color("default")
end

def set_color(color)
  if (color == "debug")
    STDOUT.print "\033[01;36m"
    STDERR.print "\033[01;36m"
  elsif (color == "error")
    STDOUT.print "\033[01;31m"
    STDERR.print "\033[01;31m"
  elsif (color == "system")
    STDOUT.print "\033[01;33m"
    STDERR.print "\033[01;33m"
  elsif (color == "wrong")
    STDOUT.print "\033[01;31m"
    STDERR.print "\033[01;31m"
  elsif (color == "default")
    STDOUT.print "\033[00m"
    STDERR.print "\033[00m"
  end
end

require_relative "hero.rb"
require_relative "events.rb"

class Engine
  public
    include Model
    def initialize()
      @game_variable = -1
      @main_menu_variable = ""
      @proc_menu_variable = -1
      @GameEvents = Events.new
      print_system("Creating events...\n")
    end

    def run()
      if ($debug_engine == 1)
        print_debug("Start method run()\n")
        $debug_level = $debug_level + 1
      end

      main_menu()
      game()
      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method run()\n")
      end
    end

  private
    def game()
      if ($debug_engine == 1)
        print_debug("Start method game()\n")
        $debug_level = $debug_level + 1
      end

      case @game_variable
        when 1
          if ($debug_engine == 1)
            print_debug("Accept new game\n")
            print_debug("Create new Hero in method game()\n")
          end
          @GameHero = HeroMarine.new(1)
          game_process()
        when 2
          if ($debug_engine == 1)
            print_debug("Accept load game\n")
            print_debug("Load Hero in method game()\n")
          end
          @GameHero = HeroMarine.new(2)
          game_process()
        when 3
          if ($debug_engine == 1)
            print_debug("Accept quit\n")
          end
            print_system("Quit game...\n")
        when 4
          if ($debug_engine == 1)
            print_debug("Accept tests\n")
          end
        else
          print_error("Method game() -> switch-case error!\n")
          exit(1)
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method game()\n")
      end
    end

    def game_process()
      if ($debug_engine == 1)
        print_debug("Start method game_process()\n")
        $debug_level = $debug_level + 1
      end

      loop do
        @GameHero.print_stats
        @proc_menu_variable = @GameEvents.get_event_for_hero(@GameHero)
        break if (@proc_menu_variable == -1 || @proc_menu_variable == -2)
      end

      if (@proc_menu_variable == -2)
        print_system("Game Over\n")
      end
      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method game_process()\n")
      end
    end

    def main_menu()
      if ($debug_engine == 1)
        print_debug("Start method main_menu()\n")
        $debug_level = $debug_level + 1
      end

      loop do
        print_main_menu()
        @main_menu_variable = STDIN.gets.chomp!

        if ($debug_engine == 1)
          print_debug("main_menu_variable in method main_menu() -> #@main_menu_variable\n")
        end

        break if (test_main_menu_variable() != -1)
        if ($debug_engine != 1)
          system "clear"
        end
        set_color("error")
        STDOUT.print "[ERROR]  Incorrect option! Try again...\n\n"
        set_color("default")
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method main_menu()\n")
      end
    end

    def test_main_menu_variable()
      if ($debug_engine == 1)
        print_debug("Start method test_main_menu_variable()\n")
        $debug_level = $debug_level + 1
        print_debug("main_menu_variable in method test_main_menu_variable() -> #@main_menu_variable\n")
      end

      if (@@main_menu_variants_array.include?(@main_menu_variable))
        @game_variable = (@@main_menu_variants_array.index(@main_menu_variable) + 2) / 2
      else
        @game_variable = -1
      end

      if ($debug_engine == 1)
        print_debug("game_variable in method test_main_menu_variable() -> #@game_variable\n")
        $debug_level = $debug_level - 1
        print_debug("End method test_main_menu_variable()\n")
      end

      return @game_variable
    end

    @@main_menu_variants_array = ["n", "n - New game\n",
                             "l", "l - Load game\n",
                             "q", "q - Quit game\n",
                             "t", "t - Start game testing\n"]
    def print_main_menu()
      if ($debug_engine == 1)
        print_debug("Start method print_main_menu()\n")
        $debug_level = $debug_level + 1
      end

      @@main_menu_variants_array.each_with_index do |value,index|
        if (index % 2 == 1)
          STDOUT.print value
        end
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method print_main_menu()\n")
      end
    end
end

if (ARGV.length > 0)
  if (ARGV[0] == "y")
    $debug_engine = 1
  else
    $debug_engine = 0
  end
end

print_system("Starting engine...\n")
