module Concerns::Findable
  
  def find_by_name(name)
    all.find { |instance| instance.name == name }    
  end
    
  def find_or_create_by_name(name)
    instance = find_by_name(name)
    instance = create(name) if song.nil?
      
    instance
  end
  
end