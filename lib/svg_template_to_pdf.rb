require "svg_template_to_pdf/version"
require 'csv'
require 'svg2pdf'
require 'securerandom'

class SvgTemplateToPdf

  def initialize(svg_filename, csv_filename, output_folder = "~", pdf_filename = nil)
    @svg_input     = File.read(svg_filename)
    @csv_filename  = csv_filename
    @output_folder = output_folder
    @pdf_filename  = pdf_filename
  end

  # Get header names from svg
  def variables
    result     = @svg_input.scan(/%VAR_(\w+)%/).flatten
    duplicates = get_duplicates(result)
    raise StandardError, "More than 1 use of variables #{duplicates.join(", ")} in the SVG file." if duplicates.size != 0
    result
  end

  def process
    output_files = []
    CSV.read(@csv_filename, headers: true).each_with_index do |row, i| # for each row produce pdf with data
      content = @svg_input.dup
      variables.each { |col| content.sub!("%VAR_#{col}%", row[col].to_s) }
      output_files << Svg2pdf.convert_from_data(content, :pdf, working_dir: @output_folder, output_name: "#{@pdf_filename}#{i}")
    end
    output_files
  end

  private

  def get_duplicates(ary)
    ary.group_by { |v| v }.select { |k, v| v.count > 1 }.keys
  end
end

# Update output file naming options
class Svg2pdf::Processor
  private
  def setup_options(options)
    @options               = options
    @options[:output_file] = File.join(@options[:working_dir], @options[:output_name] + '.' + @mode.to_s)
  end
end