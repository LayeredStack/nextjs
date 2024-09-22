require 'fileutils'
require 'erb'

module LayeredStackNextjs
  class PageGenerator
    TEMPLATE_SOURCE = File.expand_path('templates', __dir__).freeze

    def create(page_name)
      template_content = File.read(File.join(TEMPLATE_SOURCE, 'page.jsx.tt'))
      template = ERB.new(template_content)

      page_name_capitalized = page_name.split('_').map(&:capitalize).join

      result = template.result_with_hash(
        page_name_capitalized: page_name_capitalized,
        page_name: page_name
      )

      dir_path = "frontend/src/app/#{page_name}"
      FileUtils.mkdir_p(dir_path)

      File.write("#{dir_path}/page.jsx", result)
    end
  end
end
