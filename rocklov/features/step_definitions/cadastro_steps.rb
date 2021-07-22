Dado('que acesso a página de cadastro') do
    visit "http://rocklov-web:3000/signup"
end
  
Quando('submeto o meu cadastro completo') do
    find("#fullName").set "Anderson Oliveira"
    find("#email").set "anderson.tr@gmail.com"
    find("#password").set "senha123"
    click_button "Cadastrar"
    sleep 5
    #@welcome = find("[class=welcome]").text
end
  
Então('sou redirecionado para o Dashboard') do
   #expect(@welcome).to eql ("Let`s Rock Baby")
   expect(page). to have_css ".dashboard"
   sleep 5
end