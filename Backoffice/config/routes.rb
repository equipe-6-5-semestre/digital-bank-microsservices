Rails.application.routes.draw do
  get '/pegar_emprestimos', to: 'emprestimos#pegar_emprestimos', as: 'pegar_emprestimos'
  post '/validar_emprestimo', to: 'emprestimos#validar_emprestimo', as: 'validar_emprestimo'
  
  get '/configuracao/emprestimo', to: 'configuracoes#emprestimo', as: 'configuracao_emprestimo'
  post '/configuracao/emprestimo', to: 'configuracoes#criar_atualizar_emprestimo', as: 'configuracao_atualizar_emprestimo'

  # Endpoints de Teste
  get '/emprestimos', to: 'emprestimos#emprestimos', as: 'emprestimos'
  resources :emprestimos, except: %i[index new create show] do
    member do
      post 'enviar_resultado_validacao'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end