require 'yaml'

$debug_hero = $debug_engine

module Model
  class HeroMarine
    attr_reader :name
    attr_accessor :hp, :mp, :st, :san, :cash

    def initialize(choice)
      case choice
        when 1
          if ($debug_hero != 1)
            system "clear"
          end
          print_system("Starting new game...\n")
          create_new_hero('cfg/stats.yml')
        when 2
          if ($debug_hero != 1)
            system "clear"
          end
          print_system("Loading game...\n")
          load_hero('saves/stats.yml')
        else
          system 'clear'
          puts '[FAILED]  Input error!'
      end
    end

    def create_new_hero(file)
      if ($debug_hero == 1)
        print_debug("Start method create_new_hero()\n")
        $debug_level = $debug_level + 1
      end
      states = YAML.load_file(file)
      @hp = states[0]["HP"]
      @mp = states[0]["MP"]
      @st = states[0]["ST"]
      @san = states[0]["San"]
      @cash = states[0]["Cash"]
      print_system("Created new hero: Marginal Valera\n")
#      print_stats()
      if ($debug_hero == 1)
        $debug_level = $debug_level - 1
        print_debug("End method create_new_hero()\n")
      end
    end

    def load_hero(file)
      if ($debug_hero == 1)
        print_debug("Start method load_hero()\n")
        $debug_level = $debug_level + 1
      end
      states = YAML.load_file(file)
      @hp = states[0]["HP"]
      @mp = states[0]["MP"]
      @st = states[0]["ST"]
      @san = states[0]["San"]
      @cash = states[0]["Cash"]
      print_system("Loaded existing hero: Marginal Valera\n")
#      print_stats()
      if ($debug_hero == 1)
        $debug_level = $debug_level - 1
        print_debug("End method load_hero()\n")
      end
    end

    def print_stats()
      if ($debug_hero == 1)
        print_debug("Start method print_stats()\n")
        $debug_level = $debug_level + 1
      end
      printf("HP:\t%s\n", @hp)
      printf("MP:\t%s\n", @mp)
      printf("ST:\t%s\n", @st)
      printf("San:\t%s\n", @san)
      printf("Cash:\t%s\n", @cash)
      if ($debug_hero == 1)
        $debug_level = $debug_level - 1
        print_debug("End method print_stats()\n")
      end
    end
  end
end
