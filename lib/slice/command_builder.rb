# ## Slice::CommandBuilder
# Creates a new command object from the given ARGV.
#
# ```ruby
# builder = Slice::CommandBuilder.new(ARGV)
# builder.call
# ```
#
module Slice
  class CommandBuilder
    ### Slice::CommandBuilder.new(argv)
    # Creates a new instance of Slice::CommandBuilder from the given command line arguments.
    #
    def initialize(argv)
      @argv = argv
    end

    ### Slice::CommandBuilder#call
    # Returns a new instance of command class that inherits from Slice::Commands::Base.
    #
    def call
      if arguments.valid?
        Slice::Commands::Request.new(arguments)
      else
        Slice::Commands::Error.new(arguments)
      end
    end

    private

    def arguments
      @arguments ||= Arguments.new(@argv)
    end
  end
end
