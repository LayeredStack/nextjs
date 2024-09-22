require 'thor'
require 'logger'
require 'yaml'
require_relative '../generators/page_generator'

module LayeredStackNextjs
  class Generate < Thor
    def self.execute
      new.execute
    end

    no_commands do
      def execute
        logger.info("> layered_stack-nextjs/generate")

        yaml_content = YAML.load_file(File.join("app.yml"))
        screens = yaml_content["screens"]
        screens.each do |screen|
          screen.each do |screen_name, screen_data|
            if screen_data
              logger.info("Generating screen #{screen_name}")
              LayeredStackNextjs::PageGenerator.new.create(screen_name)
              screen_data["sections"].each do |section|
                section.each do |section_name, section_data|
                  logger.info("Section: #{section_name}")
                  logger.info("Section data: #{section_data}")
                end
              end
            else
              logger.error("Screen #{screen_name} not found in app.yml")
            end
          end
        end
      end

      private

      def logger
        @logger ||= Logger.new(STDOUT)
      end
    end
  end
end
