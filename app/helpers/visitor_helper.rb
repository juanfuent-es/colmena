module VisitorHelper

	def visitor_login(visitor)
	  cookies.permanent[:visitor_ip] = visitor.id
	  self.current_visitor = visitor
	end
  
	def current_visitor
	  @current_visitor ||= Visitor.where(ip: request.remote_ip).first_or_create!
	end
  
	def current_visitor=(visitor)
	  @current_visitor = visitor
	end
	
	def visitor_logged?
	  !current_visitor.nil?
	end
  
	def register_visit(record)
	  visit = Visit.where(visitor: current_visitor, visitable: record).first_or_create!
	  visit.update(counter: visit.counter + 1)
	  update_total_views(record)
	end
  
	def update_total_views(record)
	  views = record.visits.sum(:counter)
	  record.update(total_views: views)
	end
  
end