# SvgTemplateToPdf

This gem takes picture in SVG format with defined variables and CSV data file
 and produce generated PDF files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'svg_template_to_pdf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svg_template_to_pdf
    
This gem also uses some other gems, such as csv, svg2pdf.

## Usage

Two input files are needed and you should prepare them before you start:
- SVG file which contains variables in format: %VAR_variable1%, %VAR_variable2%, ... 
    - Tip: You can use a visual editor (Inkscape, ...). 
- CSV file which contains variable1, variable2, ... as header and other data 
in these columns

Then you can run: 
```ruby
s = SvgTemplateToPdf.new(svg_path, csv_path, output_folder = "~", pdf_filename = "output")
s.process
```

You can also get an array of variables, which are contained in the SVG file:
```ruby
s.variables
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sakalfil/svg_template_to_pdf. 
This project is intended to be a safe, welcoming space for collaboration, and 
contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

