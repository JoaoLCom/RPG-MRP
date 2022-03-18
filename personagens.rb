class Heroi
    attr_accessor :nome, :ataque, :defesa, :hp, :frase, :force, :resistencia, :vitalidade, :vigor, :tipo_arma

    def initialize(nome, classe, force, resistencia, vitalidade, frase)
        @poder_arma = 0
        @defesa_armadura = 0
        @nome = nome
        @classe = classe.nome
        @force = force + classe.force
        @resistencia = resistencia + classe.resistencia 
        @vitalidade = vitalidade + classe.vitalidade
        @ataque = @force + @poder_arma
        @defesa = @resistencia + @defesa_armadura
        @hp = classe.hp * @vitalidade
        @vigor = classe.vigor * (@resistencia + @force) /5
        @frase = frase
        @tipo_arma = classe.tipo_arma
    end

    def apresentar
        puts "------Status-------"
        puts "Nome: #{@nome}"
        puts "Classe: #{@classe}"
        puts "Força: #{@force}"
        puts "Resistência: #{@resistencia}"
        puts "Vitalidade: #{@vitalidade}"
        puts "Ataque: #{@ataque}"
        puts "Desefa: #{@defesa}"
        puts "HP: #{@hp}"
        puts "Vigor: #{@vigor}"

        
    end
end

class Classes
    attr_accessor :nome, :force, :resistencia, :vitalidade, :hp, :vigor, :tipo_arma
    def initialize (nome, force, resistencia, vitalidade, hp, vigor, tipo_arma)
        @nome = nome
        @force = force
        @resistencia = resistencia
        @vitalidade = vitalidade
        @hp = hp
        @vigor = vigor
        @tipo_arma = tipo_arma
    end

end

class Inimigo
    attr_accessor :nome, :ataque, :defesa, :hp, :objetivo

    def initialize(nome, ataque, defesa, hp, objetivo)
        @nome = nome
        @ataque = ataque
        @defesa = defesa
        @hp = hp
        @objetivo = objetivo
    end

    def apareceu
       
        puts "\e[96m|---- #{self.nome} APARECEU-----|\e[0m"
     
        
      puts "\e[31m- Muahahaha eu, #{self.nome} com meus #{self.ataque} grandiosos pontos de ataque e minha indestrutivel defesa de #{self.defesa} e tenho #{self.hp} estou aqui para acabar com você e assim finalmente consegui #{self.objetivo}\e[0m
      "
    end
end

class NPC
    attr_accessor :nome, :lugar, :loja
    def initialize(nome, lugar)
        @nome = nome
        @lugar = lugar
        @loja = []
    end
    def add_item_loja(item, quantidade)
        add_item = {
            @item = item
            @quantidade = quantidade
            @valor = item.valor
        }
        loja.push(add_item)
        puts "item adicionado ao NPC"
    end 
    def compra_item(item, quantidade, inventario)
        puts "qual item ?"
        loja.each do |itens|
            index = 1
            puts "#{index} #{@loja[index][:nome]} #{@loja[index][:valor]}"
            index += 1
    end
end