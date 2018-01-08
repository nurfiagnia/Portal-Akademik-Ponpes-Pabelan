module SantriHelper
	def kelas_collect
		@kelas.collect{ |k| [k.thn_ajaran, k.thn_ajaran] }
	end
end
