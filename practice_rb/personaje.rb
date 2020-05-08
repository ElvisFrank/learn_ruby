class Personaje
    def initialize(vida, tipo, armas)
        @vida = vida; @tipo = tipo; @armas = armas
    end
    attr_reader :vida, :tipo, :armas
end