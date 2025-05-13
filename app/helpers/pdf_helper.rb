module PdfHelper
  def font_base64(font_name)
    font_path = Rails.root.join('public', 'static', font_name)
    return unless File.exist?(font_path)
    
    Base64.strict_encode64(File.read(font_path))
  end

  def font_face_css
    fonts = {
      'Poppins-Regular' => 'Poppins-Regular.ttf',
      'Poppins-Bold' => 'Poppins-Bold.ttf',
      'Poppins-Medium' => 'Poppins-Medium.ttf'
    }

    fonts.map do |name, file|
      base64 = font_base64(file)
      next unless base64

      <<~CSS
        @font-face {
          font-family: '#{name}';
          src: url(data:font/truetype;charset=utf-8;base64,#{base64}) format('truetype');
          font-weight: normal;
          font-style: normal;
        }
      CSS
    end.compact.join("\n")
  end
end 