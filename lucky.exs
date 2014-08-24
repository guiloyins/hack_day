
defmodule Jogada do
  def cria_jogada do
    do_cria_jogada(HashSet.new, 0)
  end

  defp do_cria_jogada(acc, 6) do
    IO.inspect acc
    acc
  end

  defp do_cria_jogada(acc, _) do
    newset = HashSet.put(acc, :random.uniform(59)+1)
    do_cria_jogada(newset, HashSet.size(newset))
  end
end


defmodule Jogador do
  def joga_ate_acertar do
    do_jogar([], Jogada.cria_jogada, numeros)
  end

  def numeros do
    Enum.into([26, 29, 34, 38, 50, 60], HashSet.new)
  end

  defp do_jogar(tentativas, jogada, numeros) do
    cond do
      jogada == numeros ->
        tentativas.size
      not jogada in tentativas ->
        do_jogar([jogada | tentativas], Jogada.cria_jogada, numeros)
      true ->
        do_jogar(tentativas, Jogada.cria_jogada, numeros)
    end
  end
end

tentativas = Jogador.joga_ate_acertar
IO.puts "Eu tive que jogar #{tentativas} para ficar rico!"


