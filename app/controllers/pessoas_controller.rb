class PessoasController < ApplicationController
  def create
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.save

    redirect_to '/'
  end

  private
    def pessoa_params
      params.require(:pessoa).permit(:email)
    end
end
