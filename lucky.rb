require "set"

NUMEROS_SORTEADOS = Set.new [26, 29, 34, 38, 50, 60]

class Jogada
  def self.cria_jogada
    jogadas = Set.new
    while jogadas.size != 6
      jogadas << rand(1..60)
    end
    jogadas
  end
end

class Jogador
  attr_accessor :tentativas
  
  def initialize
    @tentativas = Set.new
  end

  def jogar
    jogada = Jogada.cria_jogada
    while !@tentativas.add? jogada
      jogada = Jogada.cria_jogada
    end
    p "Jogada: #{jogada.to_a}"
    jogada
  end

  def joga_ate_acertar
    loop do
      break if jogar == NUMEROS_SORTEADOS
    end
    @tentativas.size
  end
end


jogador = Jogador.new
tentativas = jogador.joga_ate_acertar
p "Eu tive que jogar #{tentativas} para ficar rico!"


