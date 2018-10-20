#!/usr/bin/ruby

$debug_engine = 0
$debug_level  = 0

class Engine
  public
    def initialize()
      @game_variable = -1
      @menu_variable = ""
    end

    def run()
      if ($debug_engine == 1)
        print_debug("Start metod run()\n")
        $debug_level = $debug_level + 1
      end
      menu()
      game()
      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End metod run()\n")
      end
    end

  private
    def game()
      if ($debug_engine == 1)
        print_debug("Start metod game()\n")
        $debug_level = $debug_level + 1
      end
      
      case @game_variable
        when 1
          STDOUT.print "Accept new game\n"
        when 2
          STDOUT.print "Accept load game\n"
        when 3
          STDOUT.print "Accept quit\n"
        when 4
          STDOUT.print "Accept tests\n"
        else
          print_error("Metod game() -> switch-case error!\n")
          exit(1)
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End metod game()\n")
      end
    end

    def menu()
      if ($debug_engine == 1)
        print_debug("Start metod menu()\n")
        $debug_level = $debug_level + 1
      end

      loop do
        print_menu()
        @menu_variable = STDIN.gets.chomp!

        if ($debug_engine == 1)
          print_debug("menu_variable in metod menu() -> #@menu_variable\n")
        end

        break if (test_menu_variable() != -1)
        STDOUT.print "Wrong variant! Repeat\n\n"
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End metod menu()\n")
      end
    end

    def test_menu_variable()
      if ($debug_engine == 1)
        print_debug("Start metod test_menu_variable()\n")
        $debug_level = $debug_level + 1
        print_debug("menu_variable in metod test_menu_variable() -> #@menu_variable\n")
      end

      if (@@menu_variants_array.include?(@menu_variable))
        @game_variable = (@@menu_variants_array.index(@menu_variable) + 2) / 2
      else
        @game_variable = -1
      end

      if ($debug_engine == 1)
        print_debug("game_variable in metod test_menu_variable() -> #@game_variable\n")
        $debug_level = $debug_level - 1
        print_debug("End metod test_menu_variable()\n")
      end

      return @game_variable
    end

    @@menu_variants_array = ["n", "n - new game\n",
                             "l", "l - load game\n",
                             "q", "q - quit game\n",
                             "t", "t - start tests to game\n"]
    def print_menu()
      if ($debug_engine == 1)
        print_debug("Start metod print_menu()\n")
        $debug_level = $debug_level + 1
      end
      
      @@menu_variants_array.each_with_index do |value,index|
        if (index % 2 == 1)
          STDOUT.print value
        end
      end

      if ($debug_engine == 1)
        $debug_level = $debug_level - 1
        print_debug("End metod print_menu()\n")
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

E = Engine.new
E.run()
