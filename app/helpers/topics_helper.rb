module TopicsHelper

    def add_block_to_topic_link(f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object) do |builder|
			render("admin/topics/#{association.to_s.singularize}_fields", f: builder, idx: id)
		end
		
		# Sanitize the HTML content
		sanitized_fields = fields
			.gsub(/\s*<!--.*?-->\s*/m, '') # Remove HTML comments
			.gsub(/\s+/, ' ')             # Replace multiple spaces with single space
			.strip                        # Remove leading/trailing whitespace
		
		link_to("Nuevo Bloque", '#', 
			id: "add-topic-block-btn", 
			class: "px-3 py-1.5 text-sm font-semibold text-white focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-yellow-600 ring-light cursor-pointer", 
			data: { 
				id: id, 
				fields: sanitized_fields 
			}
		)
	end

end