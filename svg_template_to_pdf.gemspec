# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svg_template_to_pdf/version'

Gem::Specification.new do |spec|
  spec.name          = "svg_template_to_pdf"
  spec.version       = SvgTemplateToPdf::VERSION
  spec.authors       = ["Filip Sakala"]
  spec.email         = ["fil.sakala@gmail.com"]

  spec.summary       = %q{This gem takes picture in SVG format with defined variables and CSV data file and produce generated PDF files.}
  spec.description   = %q{This gem takes picture in SVG format with defined variables and CSV data file and produce generated PDF files.}
  spec.homepage      = "https://github.com/sakalfil/svg_template_to_pdf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "svg2pdf", '~> 0.2.0'
  spec.add_development_dependency "csv", '~> 0.0.1'
end
