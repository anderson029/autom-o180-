Então('sou redirecionado para o Dashboard') do
    #expect(@welcome).to eql ("Let`s Rock Baby")
    expect(page). to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.messenger_alert).to eql (expect_alert)
end