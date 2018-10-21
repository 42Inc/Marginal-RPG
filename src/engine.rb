#!/usr/bin/ruby

require_relative "hero.rb"

$debug_engine = 0
$debug_level  = 0

class Engine
  public
    include Model
    def initialize()
      @game_variable = -1
      @menu_variable = ""
#      @GameEvents = Events.new 
    end

    def run()
      if ($debug_engine == 1)
        print_debug("Start method run()\n")
        $debug_level = $debug_level + 1
      end
      menu()
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
          process()
        when 2
          if ($debug_engine == 1)
            print_debug("Accept load game\n")
            print_debug("Load Hero in method game()\n")
          end
          @GameHero = HeroMarine.new(2)
          process()
        when 3
          if ($debug_engine == 1)
            print_debug("Accept quit\n")
          end
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

    def process()
      if ($debug_engine == 1)
        print_debug("Start method process()\n")
        $debug_level = $debug_level + 1
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method process()\n")
      end
    end

    def menu()
      if ($debug_engine == 1)
        print_debug("Start method menu()\n")
        $debug_level = $debug_level + 1
      end

      loop do
        print_menu()
        @menu_variable = STDIN.gets.chomp!

        if ($debug_engine == 1)
          print_debug("menu_variable in method menu() -> #@menu_variable\n")
        end

        break if (test_menu_variable() != -1)
        if ($debug_engine != 1)
          system "clear"
        end
        set_color("error")
        STDOUT.print "Wrong variant! Repeat\n\n"
        set_color("default")
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method menu()\n")
      end
    end

    def test_menu_variable()
      if ($debug_engine == 1)
        print_debug("Start method test_menu_variable()\n")
        $debug_level = $debug_level + 1
        print_debug("menu_variable in method test_menu_variable() -> #@menu_variable\n")
      end

      if (@@menu_variants_array.include?(@menu_variable))
        @game_variable = (@@menu_variants_array.index(@menu_variable) + 2) / 2
      else
        @game_variable = -1
      end

      if ($debug_engine == 1)
        print_debug("game_variable in method test_menu_variable() -> #@game_variable\n")
        $debug_level = $debug_level - 1
        print_debug("End method test_menu_variable()\n")
      end

      return @game_variable
    end

    @@menu_variants_array = ["n", "n - new game\n",
                             "l", "l - load game\n",
                             "q", "q - quit game\n",
                             "t", "t - start tests to game\n"]
    def print_menu()
      if ($debug_engine == 1)
        print_debug("Start method print_menu()\n")
        $debug_level = $debug_level + 1
      end
      
      @@menu_variants_array.each_with_index do |value,index|
        if (index % 2 == 1)
          STDOUT.print value
        end
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End method print_menu()\n")
      end
    end
end

def print_debug(string)
# color_level_indication
  set_color("debug")
  STDOUT.print "[#$debug_level] "
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
  elsif (color == "error")
    STDERR.print "\033[01;31m"
  elsif (color == "wrong")
    STDOUT.print "\033[01;31m"
  elsif (color == "default")
    STDOUT.print "\033[00m"
    STDERR.print "\033[00m"
  end
end

if (ARGV.length > 0)
  if (ARGV[0] == "y")
    $debug_engine = 1 
  else
    $debug_engine = 0
  end
end

GameEngine = Engine.new
GameEngine.run()
