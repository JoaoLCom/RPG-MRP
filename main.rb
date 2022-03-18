# Os Contos de Moutain's Redparis
require "./personagens.rb"
require "./battle.rb"
require "./itens.rb"

pocao_hp = Item.new("Poção de Hp", 20, 0)
pocao_at = Item.new("Poção de Coragem", 0, 5)
pocao_mx = Item.new("Poção Lendaria", 100, 200)

tipo_classes = []
barbaro = Classes.new("Barbaro", 4, 4, 2, 30, 70, 'machado')
tipo_classes.push(barbaro.nome)
espadachim = Classes.new("Espadachim", 4, 3, 3, 60, 40, 'espada')
tipo_classes.push(espadachim.nome)
gatuno = Classes.new("Gatuno", 3, 3, 4, 30, 70, 'adagas')
tipo_classes.push(gatuno.nome)
guerreiro = Classes.new("Guerreiro", 2, 4, 4, 80, 20, 'escudo')
tipo_classes.push(guerreiro.nome)


puts " ___________________________________"
puts "\e[41m|                                   |\e[0m"
puts "\e[41m|   S E J A  B E M  V I N D O   À   |\e[0m"
puts "\e[41m|        \e[30mMOUTAIN  RED PARIS \e[0m\e[41m        |\e[0m"
puts "\e[41m|                                   |\e[0m"
puts "\e[41m|___________________________________|\e[0m
"
puts "\e[31mVamos começar a criando seu personagem\e[0m"
puts "\e[34mQual o nome do seu personagem? \e[0m"
nome_entrou = gets.chomp.capitalize

puts "\e[34mSelecione sua classe \e[0m"
tipo_classes.each_with_index.map { |x, i| puts "#{i+1} #{x} " }

print("\e[2mNumero referente: \e[0m")

classe_verifica = gets.chomp.to_i
classe_entrou = barbaro

    if classe_verifica == 1
     classe_entrou = barbaro
    elsif classe_verifica == 2
      classe_entrou = espadachim
    elsif classe_verifica == 3
      classe_entrou = gatuno
    elsif classe_verifica == 4
        classe_entrou = guerreiro
    else
        while classe_verifica <= 0 || classe_verifica > 4
        puts "Numero de classe invalido"
        puts "\e[34mSelecione sua classe \e[0m"
        tipo_classes.each_with_index.map { |x, i| puts "#{i+1} #{x} " }
        print("\e[2mNumero referente: \e[0m")
        classe_verifica = gets.chomp.to_i 
        end
    end


status = 30
puts "Você tem #{status} pontos de status para distruibir, escolha com cuidado!"

force_entrou = 0
while force_entrou <= 0 || force_entrou > 30
    puts "\e[34mQuanto de força? \e[0m"
    force_entrou = gets.chomp.to_i
end

status = status - force_entrou

puts "Você ainda tem #{status} pontos de status para distruibir"

res_entrou = 0
if res_entrou = 0 && status > 0

    puts "\e[34mQuanto de Resistência? \e[0m"
    res_verifica = gets.chomp.to_i

    while res_verifica < 0 || res_verifica > status
    puts "Entrada invalida"
    puts "\e[34mQuanto de Resistência? \e[0m"
    res_verifica = gets.chomp.to_i
    
    end
    res_entrou = res_verifica
    status = status - res_entrou
else
    "Você Ultrapassou o limite de pontos"
    res_entrou = 0
end

puts "Você ainda tem #{status} pontos de status para distruibir"
vit_entrou = 0
if vit_entrou = 0 && status > 0

    puts "\e[34mQuanto de Vitalidade? \e[0m"
    vit_verifica = gets.chomp.to_i

    while vit_verifica < 0 || vit_verifica > status
    puts "Entrada invalida"
    puts "\e[34mQuanto de Vitalidade? \e[0m"
    vit_verifica = gets.chomp.to_i
    
    end
    vit_entrou = vit_verifica
    status = status - vit_entrou
else
    "Você Ultrapassou o limite de pontos"
    vit_entrou = 0
end

puts "\e[34mQual sera sua frase de efeito?   \e[0m"
frase_entrou = gets.chomp

heroi_1 = Heroi.new(nome_entrou, classe_entrou, force_entrou, res_entrou, vit_entrou, frase_entrou)
heroi_1.apresentar       


puts "\e[7mPersonagem #{heroi_1.nome} criado com sucesso\e[0m"
puts "\e[32m ___________________________________ \e[0m"
puts "\e[32m|                                   |\e[0m"
puts "\e[32m|  VAMOS COMEÇAR NOSSA AVENTURA ?   |\e[0m"
puts "\e[32m|                                   |\e[0m"
puts "\e[32m| s=\e[0m\e[2mContinuar\e[0m\e[32m                       |\e[0m"
puts "\e[32m|_n=\e[0m\e[2mSair do jogo\e[0m\e[32m____________________|\e[0m"
puts "\e[2msua resposta:\e[0m "
frase_entrou = gets.chomp
bag_heroi1 = Inventario.new
yu_zhong = Inimigo.new("Yu Zhong", 18, 9, 295, "Me tornar o mais forte de todos!")
pocao_hp.drop(5, bag_heroi1, pocao_hp)

yu_zhong.apareceu()
inimigo = yu_zhong

batalha1 = Batalha.new()
turno = Turnos.new()

puts "\e[32m ___________________________________\e[0m"
puts "\e[32m|                                   |\e[0m"
puts "\e[32m|     GOSTARIA DE ATACA-LO ?        |\e[0m"
puts "\e[32m|                                   |\e[0m"
puts "\e[32m| s=\e[0m\e[2mContinuar\e[0m\e[32m                       |\e[0m"
puts "\e[32m|_n=\e[0m\e[2mSair do jogo\e[0m\e[32m|/__________________|\e[0m"
puts "\e[2msua resposta:\e[0m "


start = gets.chomp

if start == "s"
    puts ""
    turno.start(heroi_1, yu_zhong, batalha1, bag_heroi1)
    if inimigo.hp <=0 && heroi_1.hp > 0
        pocao_hp.drop(5, bag_heroi1, pocao_hp)
        bag_heroi1.exibir_bau
    elsif heroi_1.hp > 0
        puts "Gostaria de fazer oq?"
    end
    
else
    
end



puts "\e[31m ___________________________________\e[0m"
puts "\e[41m|                                   |\e[0m"
puts "\e[41m|              G A M E              |\e[0m"
puts "\e[41m|              O V E R              |\e[0m"
puts "\e[41m|                                   |\e[0m"
puts "\e[31m|___________________________________|\e[0m"