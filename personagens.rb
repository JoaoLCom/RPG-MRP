class Heroi
    attr_accessor :nome, :ataque, :defesa, :hp, :frase, :force, :resistencia, :vitalidade, :vigor, :tipo_arma

    def initialize(nome, classe, force, resistencia, vitalidade, frase)
        @poder_arma = 0
        @defesa_armadura = 0
        @nome = nome
        @classe = classe
        @force = force
        @resistencia = resistencia
        @vitalidade = vitalidade
        @ataque = classe.force + (@force + @poder_arma)
        @defesa = classe.resistencia + (@resistencia + @defesa_armadura)
        @hp = classe.hp * (@vitalidade + classe.vitalidade)
        @vigor =classe.vigor * ((classe.resistencia + @resistencia) + (classe.force + @force))/5
        @frase = frase
        @tipo_arma = classe.tipo_arma
    end

    def apresentar
        
         puts"\e[93m- Eu me chamo #{self.nome}, tenho uma incrivel defesa de #{self.defesa} e um poderoso ataque de #{self.ataque}, minha vida é de #{self.hp}, e um vidor de #{@vigor} e uso #{@tipo_arma} como arma será que é o suficiente para essa aventura?\e[0m"
         
        
        puts "\e[36m- #{self.frase}\e[0m
        "
    end
end

class Classes
    attr_accessor :force, :resistencia, :vitalidade, :hp, :vigor, :tipo_arma
    def initialize (force, resistencia, vitalidade, hp, vigor, tipo_arma)
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

