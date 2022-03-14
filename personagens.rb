class Heroi
    attr_accessor :nome, :ataque, :defesa, :hp, :frase

    def initialize(nome, ataque, defesa, hp, frase)
        @nome = nome
        @ataque = ataque
        @defesa = defesa
        @hp = hp
        @frase = frase
    end

    def apresentar
        
         puts"\e[93m- Eu me chamo #{self.nome}, tenho uma incrivel defesa de #{self.defesa} e um poderoso ataque de #{self.ataque}, minha vida é de #{self.hp}, será que é o suficiente para essa aventura?\e[0m"
         
        
        puts "\e[36m- #{self.frase}\e[0m
        "
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

