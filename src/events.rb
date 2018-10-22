require "yaml"

class Events
  def initialize
    @eventList = YAML.load_file('cfg/events.yml')
    parser
  end

  def parser
    statesSamples = ['name', 'HP', 'MP', 'ST', 'San', 'Cash']
    @actionsList = Array.new(8).map!{Array.new(6)}
    counter_i = 0
    counter_j = 0
    cnt = 0
    for counter_i in 0..7
      for counter_j in 0..5
        if @eventList[counter_i][statesSamples[counter_j]] != nil
          @actionsList[counter_i][counter_j] = @eventList[counter_i][statesSamples[counter_j]]
          unless statesSamples[counter_j] != 'name'
            printf("\n[DEBUG]  Loaded event '%s'\n", @actionsList[counter_i][counter_j])
          else
            printf("[DEBUG]    %s:  %s\n", statesSamples[counter_j], @actionsList[counter_i][counter_j])
          end
        end
      end
    end
    printf("[SYSTEM]  Triggering events...\n")
  end
end

stream = Events.new
