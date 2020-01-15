Before '@startup' do

    @nome = Faker::Company.name
    @cidade = Faker::Address.city

    @body = {
        "nome": @nome,
        "cidade": @cidade
    }
    #Caso precise transformar o body em JSON
    #@body = JSON.generate(body)

    @startup = Startup.new(@body)
end