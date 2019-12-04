class Url 
    #can choose length of unique ID to be generated
    ID_LENGTH = 6

    @links = {}
    
    def self.shorten(link)
        unique_id = ([*('a'..'z'),*('0'..'9')]).sample(ID_LENGTH).join

        #checks if user typed a link with http:// or https://
        if !link.start_with? "http" 
			link = "http://" + link
		end

        #stores the original url along with its corresponding unique ID into the links hash
        @links[unique_id] = link
        [unique_id, link]
    end

    def self.links
        @links
    end
end