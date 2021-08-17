class EquiposPage
  include Capybara::DSL

  def create(equipo)
    #verificando se estou na tela correta:
    page.has_css?("#equipoForm")

    if equipo[:img].length > 0
      upload(equipo[:img])
    end

    find("input[placeholder$=equipamento]").set equipo[:nome]

    if equipo[:categoria].length > 0
      categoria(equipo[:categoria])
    end

    find("input[placeholder^='Valor']").set equipo[:preco]

    click_button ("Cadastrar")
  end

  def categoria(cat)
    find("#category").find("option", text: cat).select_option
  end

  def upload(file_name)
    img = Dir.pwd + "/features/support/fixtures/images/" + file_name
    img = img.tr("/", "\\") if OS.windows? #para sanar o problema de upload das imagens no firefox
    find("#thumbnail input[type=file]", visible: false).set img
  end
end
