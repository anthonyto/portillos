class PortillosPicker
    
  def options
    options = []
    File.readlines("lib/portillos_options.txt").each do |option|
      options << option.delete!("\n")
    end
  end
  
end
