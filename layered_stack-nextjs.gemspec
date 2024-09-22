require_relative 'lib/layered_stack_nextjs/version'

Gem::Specification.new do |s|
  # General
  s.name                        = 'layered_stack-nextjs'
  s.version                     = LayeredStackNextjs::VERSION
  s.authors                     = ['Layered Stack']
  s.email                       = ['support@layeredstack.org']

  # About
  s.summary                     = 'Layered Stack NextJS'
  s.description                 = 'NextJS tools for Layered Stack'
  s.homepage                    = 'https://www.layeredstack.org/'
  s.license                     = 'MIT'

  # Metadata
  s.metadata['homepage_uri']    = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/LayeredStack/nextjs'

  # Ruby
  s.required_ruby_version       = '>=3.3.4'

  # Files and executables
  s.files                       = Dir.glob('lib/**/*.{rb,tt}') + Dir.glob('assets/**/*')
  s.executables                 = ['layered_stack-nextjs']

  # Dependencies
  s.add_dependency "thor", "~> 1.3.2"
end
