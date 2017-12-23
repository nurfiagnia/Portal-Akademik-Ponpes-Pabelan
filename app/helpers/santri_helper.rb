module SantriHelper
	def kelas_collect
		@kelas.collect{ |k| [k.kelas, k.kelas] }
	end
end
