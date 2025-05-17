module TopicsHelper

    def add_block_to_topic_link(f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render("admin/topics/#{association.to_s.singularize}_fields", f: builder, idx: id)
		end
		link_to("Nuevo Bloque", '#', :id => "add-page-log-btn", class: "btn btn-primary", data: { id: id, fields: fields.gsub("\n", "") })
	end

end