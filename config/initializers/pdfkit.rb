PDFKit.configure do |config|
  config.default_options = {
    page_size: 'A4',
    print_media_type: true,
    margin_top: '10mm',
    margin_right: '10mm',
    margin_bottom: '15mm',
    margin_left: '10mm'
  }
  if RUBY_PLATFORM =~ /linux/
    wkhtmltopdf_executable = 'wkhtmltopdf-amd64'
  else
    raise "Unsupported. Must be running linux or intel-based Mac OS."
  end
  config.wkhtmltopdf = Rails.root.join('vendor', 'bin', wkhtmltopdf_executable).to_s

  if Rails.env.production?
    font_dir = File.join(Dir.home, ".fonts")
    Dir.mkdir(font_dir) unless Dir.exists?(font_dir)

    Dir.glob(Rails.root.join("vendor", "fonts", "*")).each do |font|
      target = File.join(font_dir, File.basename(font))
      File.symlink(font, target) unless File.exists?(target)
    end
  end
end