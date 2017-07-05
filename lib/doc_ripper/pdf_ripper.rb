module DocRipper
  class PdfRipper < Ripper::Base

    def rip
      @text, _err, _status =
        Open3.capture3 "#{Xpdf::PDFTOTEXT} #{to_shell(@file_path)} > #{to_shell(@text_file_path)}"
    end

  end
end
