Dado('que acesso a página principal') do                                          
    visit "/"     
end                                                                               
                                                                                    
Quando('submeto minhas credenciais com {string} e {string}') do |email_input, senha_input| 
    find("input[placeholder='Seu e-email']").set email_input
    find("input[type=password]").set senha_input
    click_button "Entrar"     
end                                                                               