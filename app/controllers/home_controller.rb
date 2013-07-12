class HomeController < ApplicationController
  def index
    num = "#{params['numero']}"
    
    if (num)
      agent = Mechanize.new
      agent.log = Logger.new "mech.log"
      agent.user_agent_alias = 'Mac Safari'
      
      page = agent.get "http://www.siad.ufba.br/login.asp"
      search_form = page.form_with :name => "frmConsultaProcesso"
      search_form.field_with(:name => "numero_processo").value = num
  
      search_results = agent.submit search_form
      
      #content_type 'text/html', :charset => 'windows-1252'
      
      body = search_results.body
      
      if body =~ %r{Nome\s*Interessado</font></b></td>\s*<td width="84%" bgcolor="#c0c0c0"><font face="Verdana, Arial, Helvetica" size="1">(.*?)</font>}
        @resultado = "Nome do interessado: #{$1}"
      end
    end
  end
end
