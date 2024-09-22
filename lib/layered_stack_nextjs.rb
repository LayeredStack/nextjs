require 'thor'
require 'fileutils'

# Require all .rb files in the layered_stack_nextjs folder recursively
Dir[File.join(__dir__, 'layered_stack_nextjs/**/*.rb')].each { |file| require_relative file }

module LayeredStackNextjs
  class Cli < Thor
    desc "generate", "Generates resources from ../app.yml"
    def generate
      LayeredStackNextjs::Generate.execute
    end
  end
end
