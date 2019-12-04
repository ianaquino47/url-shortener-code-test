class Url 
    ID_LENGTH = 6

    @links = {}
    
    def self.shorten(link)
        unique_id = ([*('a'..'z'),*('0'..'9')]).sample(ID_LENGTH).join
        if !link.start_with? "http"
			link = "http://" + link
		end

        @links[unique_id] = link
        [unique_id, link]
    end

    def self.links
        @links
    end
end