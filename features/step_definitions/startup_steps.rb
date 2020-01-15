#startup
Dado("o endereço da API para manter o cadastro da Startup") do
    #já instanciado pela classe Startup
end

#Post
Quando("realizar uma requisição para cadastrar uma startup") do
    $response = @startup.postStartup
end

Então("a API irá retornar os dados do cadastro da Startup respondendo o código {int}") do |int|
    #expect do status code e message
    expect($response.code).to eq(int)
    puts "response code #{$response.code}"
    expect($response.message).to eq("Created")
    puts "response message #{$response.message}"

    #imprime os atributos da requisição
    puts "ID    : #{$response["id"]}"
    puts "Data  : #{$response["data"]}"
    puts "Nome  : #{$response["nome"]}"
    puts "Conta : #{$response["conta"]}"
    puts "Cidade: #{$response["cidade"]}"

    #Salvar o ID em uma na váriavel id para usar nos outros requests
    $id = $response["id"]
end

#Get
Quando("realizar uma requisição passando o ID da startup") do
    #Estou passando o ID que foi salvo no request de cima
    $get = @startup.getStartup($id)
end

Então("a API irá retornar os dados da Startup correspondente respondendo o código {int}") do |int|
    #expect do status code e message
    expect($get.code).to eq(int)
    expect($get.message).to eq("OK")
    expect($get["id"]).to eq($response["id"])

    #imprime os atributos da requisição
    puts "ID    :       #{$get["id"]}"
    puts "Data  :       #{$get["data"]}"
    puts "Nome  :       #{$get["nome"]}"
    puts "Conta :       #{$get["conta"]}"
    puts "Cidade:       #{$get["cidade"]}"
    puts "Status Code:  #{$get.code}"
end

#Put
Quando("realizar uma requisição para alterar uma startup") do
    $put = @startup.putStartup($get["id"])
end

Então("a API irá retornar os dados da Startup alterados respondendo o código {int}") do |int|
    #expect do status code e message
    expect($put.code).to eq(int)
    expect($put.message).to eq("OK")
    expect($put["id"]).to eq($response["id"])

    #imprime os atributos da requisição
    puts "ID    :       #{$put["id"]}"
    puts "Data  :       #{$put["data"]}"
    puts "Nome  :       #{$put["nome"]}"
    puts "Conta :       #{$put["conta"]}"
    puts "Cidade:       #{$put["cidade"]}"
    puts "Status Code:  #{$put.code}"
end

#Delete
Quando("realizar uma requisição para excluir uma startup") do
    $delete = @startup.deleteStartup($put["id"])
end

Então("a API irá retornar os dados da exclusão respondendo o código {int}") do |int|
    #expect do status code e message
    expect($delete.code).to eq(int)
    expect($delete.message).to eq("OK")

    #imprime os atributos da requisição
    puts "ID    :       #{$delete["id"]}"
    puts "Data  :       #{$delete["data"]}"
    puts "Nome  :       #{$delete["nome"]}"
    puts "Conta :       #{$delete["conta"]}"
    puts "Cidade:       #{$delete["cidade"]}"
    puts "Status Code:  #{$delete.code}"
end
  
  