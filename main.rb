# Os Contos de Moutain's Redparis
require "./personagens.rb"
require "./battle.rb"
require "./itens.rb"

pocao_hp = Item.new("Poção de Hp", 20, 0)
pocao_at = Item.new("Poção de Coragem", 0, 5)
pocao_mx = Item.new("Poção Lendaria", 100, 200)


puts " ___________________________________"
puts "\e[41m|                                   |\e[0m"
puts "\e[41m|   S E J A  B E M  V I N D O   À   |\e[0m"
puts "\e[41m|        \e[30mMOUTAIN  RED PARIS \e[0m\e[41m        |\e[0m"
puts "\e[41m|                                   |\e[0m"
puts "\e[41m|___________________________________|\e[0m
"
puts "\e[31mVamos começar a criando seu personagem\e[0m"
puts "\e[34mQual o nome do seu personagem? \e[0m"
nome_entrou = gets.chomp
status = 20

puts "Você tem #{status} pontos de status para distruibir, escolha com cuidado!"

ataque_entrou = 0
while ataque_entrou < 10 || ataque_entrou > 20
    puts "\e[34mQuanto vc tem de ataque? (10-20) \e[0m"
    ataque_entrou = gets.chomp.to_i
end

status = status - ataque_entrou

defesa_entrou = 0
while defesa_entrou < 2 || defesa_entrou > 10 
    
    puts "\e[34mQuanto vc tem de defesa? (2-10)  \e[0m"
    defesa_entrou = gets.chomp.to_i
    
end

status = status - ataque_entrou

hp_entrou = 0 
while hp_entrou < 100 || hp_entrou > 300
    puts "\e[34mQuanto vc tem de hp? (100-300)  \e[0m"
    hp_entrou = gets.chomp.to_i
end
puts "\e[34mQual sera sua frase de efeito?   \e[0m"
frase_entrou = gets.chomp
heroi_1 = Heroi.new(nome_entrou, ataque_entrou, defesa_entrou, hp_entrou, frase_entrou)
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
yu_zhong = Inimigo.new("Yu Zhong", 18, 9, 95, "Me tornar o mais forte de todos!")
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