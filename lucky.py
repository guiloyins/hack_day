#!/usr/bin/python
import random
NUMEROS_SORTEADOS = set([26, 29, 34, 38, 50, 60]);


def cria_jogada():
  jogadas = set()
  while len(jogadas) != 6:
    jogadas.add(random.randint(1,60))
  return jogadas


class Jogador:  
  def __init__(self):
    self.tentativas = []

  def jogar(self):
    while True:
      jogada = cria_jogada()
      if not jogada in self.tentativas:
        self.tentativas.append(jogada)
        break
    print "Jogada: %s" % jogada
    return jogada

  def joga_ate_acertar(self):
    while  self.jogar() != NUMEROS_SORTEADOS:
      pass
    return len(self.tentativas)


jogador = Jogador()
tentativas = jogador.joga_ate_acertar()
print "Eu tive que jogar %d para ficar rico!" % tentativas


