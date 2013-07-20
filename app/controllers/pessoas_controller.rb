class PessoasController < ApplicationController
  def create
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.save
    flash[:success] = "O e-mail foi adicionado com sucesso."
    redirect_to '/'
  end

  private
    def pessoa_params
      params.require(:pessoa).permit(:email)
    end
end
