class Inventario
    attr_accessor  :lista, :peso, :peso_limite

    def initialize()
        @lista = []
        @peso = 0
        @peso_limite = 2
    end 
    def excluir_item(local_item,  inventario, quantos)
        inventario.lista[local_item][:quantidade] = inventario.lista[local_item][:quantidade] - quantos.to_i 
    end
       
    def add_pot(quantas, item)
        if @peso + 1 <= @peso_limite 
            nova_pot = {
                nome: item.nome,
                quantidade: quantas,
                bonus_de_hp: item.bonus_hp,
                bonus_de_ataque: item.bonus_at
            }
            @peso += 1
            @lista.push(nova_pot)
        else
            puts "\e[41mMOCHILA LOTADA\e[0m"

        end
        
    end
    def exibir_bau(itens = nil)
        if itens.nil?
        puts "\e[1m  Seu Baú contem:      \e[0m"
        puts "\e[2mn  Nome  /  Quantidade \e[0m"
        puts "-------------------------"
        lista.map.with_index{ |valor, index| puts "\e[92m#{index+1}  #{@lista[index][:nome]} / #{@lista[index][:quantidade]}\e[0m"} 
        puts "\e[1mTotal de itens na sua mochila é de\e[91m #{@lista.length}\e[0m \e[1mitens\e[0m"
        else
            puts "Mochila vazia"
        end
    end
end

class Item
    attr_accessor :nome, :bonus_hp, :bonus_at

    def initialize(nome, bonus_hp, bonus_at)
        @nome = nome
        @bonus_hp = bonus_hp
        @bonus_at = bonus_at
    end
    def drop(quantidade, inventario, item)
        @quantidade = quantidade
        puts "\e[42m\e[30m- Olhe, você encontrou #{quantidade} de #{self.nome}\e[0m"
        puts "\e[92m deseja pegar #{self.nome}?\e[0m"
        puts "\e[2ms=Sim----ou aperta qualquer tecla para ignorar?\e[0m"
        resposta_drop = gets.chomp
        if resposta_drop == "s"
            inventario.add_pot(quantidade, item)
        else
            
        end
    end
end

