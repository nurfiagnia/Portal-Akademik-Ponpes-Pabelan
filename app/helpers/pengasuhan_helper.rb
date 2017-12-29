module PengasuhanHelper
	def naik_kelas
		@naik.each do |naik|
			naik.tahun_ajaran
		end
	end
	def naik_nis
		@naik.each do |naik|
			naik.nis
		end
	end
end