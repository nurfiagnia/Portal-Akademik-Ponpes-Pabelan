class NilaiController < ApplicationController
  def create
    @nilai = Nilai.new(nilai_params)
      if @nilai.save
        redirect_back(fallback_location: guru_penilaian_path)
      else
        flash.now[:danger] = "Gagal menambahkan nilai"
        render 'penilaian'
      end
  end
  def update
    @nilai = Nilai.find(params[:id])
    if @nilai.update(nilai_params)
        redirect_back(fallback_location: guru_penilaian_path)
      else
        flash.now[:danger] = "Gagal merubah nilai"
        render 'penilaian'
      end
  end
end