class Batalha
    
    def atacar_inimigo(jogador, inimigo)
        dano = jogador.ataque - inimigo.defesa
        hp_novo = inimigo.hp - dano
        puts "\e[93m- #{jogador.nome} acaba de atacar #{inimigo.nome}, causando #{dano} de dano
            \e[0m"
       if hp_novo < 1


        puts "\e[42m\e[30m- Bom trabalho, #{inimigo.nome} não tankou o ultimo ataque e foi de base parabens por concluir sua missão\e[0m"
        puts"\e[93m #{jogador.frase}\e[0m"
        inimigo.hp = 0
           
       else
           puts "\e[92m- Com seu ultimo ataque, #{inimigo.nome} agora está com o hp de #{hp_novo}\e[0m"
       end
       inimigo.hp = hp_novo
    end

    def atacar_jogador(jogador,inimigo)
        dano = inimigo.ataque - jogador.defesa
        hp_novo_heroi = jogador.hp - dano
        jogador.hp = hp_novo_heroi 
        puts "\e[91m- #{inimigo.nome} acaba de atacar #{jogador.nome}, causando #{dano} de dano
        \e[0m"

       if hp_novo_heroi > 1 
        
        puts "\e[92m- Com o ultimo ataque, #{jogador.nome} agora está com o hp de #{hp_novo_heroi}\e[0m
        "

       else hp_novo_heroi < 1
           puts "\e[91m- Você é muito fraco, #{jogador.nome} jamais iria tankar meus ataques, e com isso estou mais proximo de \e[41m\e[30m#{inimigo.objetivo}\e[0m
           "

       end

    end

    def usar_item(jogador, item, local_item,  inventario, quantos)
      
        puts "** #{jogador.nome} Usando #{item[:nome]} **
        "
                               
        inventario.excluir_item(local_item,  inventario, quantos)
        jogador.hp = jogador.hp + item[:bonus_hp].to_i
        jogador.ataque = jogador.ataque + item[:bonus_at].to_i
        puts "- Agora #{jogador.nome} está com #{jogador.hp} de HP e #{jogador.ataque} de ataque
        "
        puts "- Corra e volte logo para batalha #{jogador.nome}!
        "
    
    end
    def fim_turno
        puts "\e[44m|----------Proximo turno------------|\e[0m
        "
        
    end
    def fim_batalha(jogador, item)

    end
end

class Turnos
    def start(jogador, inimigo, batalha, inventario)
            @batalha = batalha
            batalha.atacar_inimigo(jogador, inimigo)
            batalha.atacar_jogador(jogador, inimigo)
            batalha.fim_turno()
            leave = false
        while jogador.hp > 0 && inimigo.hp > 0 && !leave
          puts "\e[32m|                                   |\e[0m"
          puts "\e[32m|    \e[0m \e[92m GOSTARIA DE FAZER?\e[0m\e[32m           |\e[0m"
          puts "\e[32m| a=\e[0m\e[2mAtaca-lo\e[0m\e[32m                        |\e[0m"
          puts "\e[32m|_i=\e[0m\e[2mUsar Item\e[32m                       |\e[0m"
          puts "\e[32m|_f=\e[0m\e[2mFugir\e[32m___________________________|\e[0m"
          puts "\e[2msua resposta:\e[0m "
          resposta = gets.chomp
 
          system "clear"
            if resposta == "a"
               batalha.atacar_inimigo(jogador, inimigo)
                if inimigo.hp > 0 
                      batalha.atacar_jogador(jogador, inimigo)
                          if jogador.hp > 0 && inimigo.hp > 0
                                   batalha.fim_turno()
                          else
                            puts "\e[7m|                           |\e[0m"
                            puts "\e[7m|       VOCÊ MORREU         |\e[0m"
                            puts "\e[7m|                           |\e[0m"
                          end
                 else
                    puts " ___________________________"
                    puts "\e[7m|                           |\e[0m"
                    puts "\e[7m|      INIMIGO ABATIDO      |\e[0m"
                    puts "\e[7m|                           |\e[0m"
                    puts "\e[7m|___________________________|\e[0m"
                             
                  end
            elsif resposta == "i" 
                    puts "\e[93mQual item gostaria de usar?\e[0m"
                    bag_empty = inventario.conteudo
                    puts bag_empty
                    unless bag_empty.empty? 

                    puts inventario.exibir_bau

                    puts "\e[2mPor favor, digite o n do item\e[0m"
                        item_usar = gets.chomp.to_i
                        item_usar -= 1
                    puts inventario.exibir_bau(@item_usar)
                    puts "\e[2mQuantos ?\e[0m"
                        quantos_itens = gets.chomp.to_i
                        item_total = inventario.lista[item_usar]
                        inventario.exibir_bau
                        batalha.usar_item(jogador, item_total, item_usar, inventario, quantos_itens)
                    else
                        puts "\e[7mSUA MOCHILA ESTA VAZIA\e[0m"
                    end      
            elsif resposta == "f" 
                puts "Você abandonou a batalha"
                leave = true
            else
            end
        end
    end
end
