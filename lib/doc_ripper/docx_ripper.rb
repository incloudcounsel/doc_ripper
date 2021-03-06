module DocRipper
  class DocxRipper < Ripper::Base
    def rip
      text, _err, _status = Open3.capture3 "unzip -p #{to_shell(@file_path)} word/document.xml"
      return unless text && text.length > 0
      doc = Nokogiri::XML(text)
      doc.xpath('//w:del').each(&:remove)
      File.open(@text_file_path, 'w') { |f| f.write doc.xpath('//w:p').map(&:content).join("\n") }
      text
    end
  end
end
