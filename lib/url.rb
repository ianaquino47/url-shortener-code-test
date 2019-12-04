class Url 
    #can choose length of unique ID to be generated
    ID_LENGTH = 6

    @links = {}
    
    def self.shorten(link)
        #checks if user typed a link with http:// or https://
        if !link.start_with? "http" 
			link = "http://" + link
        end
        
        #checks if link has already been shortened
        return [@links.key(link), link] if @links.has_value?(link)
  
        unique_id = ([*('a'..'z'),*('0'..'9')]).sample(ID_LENGTH).join

        #stores the original url along with its corresponding unique ID into the links hash
        @links[unique_id] = link
        [unique_id, link]
    end

    def self.links
        @links
    end

    def link_unique
        
    end
end