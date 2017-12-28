class Forum < ApplicationRecord
	#attr_accesible :title, :body, :author
	acts_as_tree order: 'created_at DESC'
	def to_digraph_label
  		title
	end
end
