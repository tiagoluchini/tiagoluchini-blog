--- 
wordpress_id: 225
title: Precisamos de Analistas de Sistemas
wordpress_url: http://www.tiagoluchini.eu/2007/06/19/precisamos-de-analistas-de-sistemas/
layout: post
---
Descobri hoje uma ótima solucão para resolver os problemas políticos do Brasil: precisamos de Analistas de Sistemas!

Veja bem, foi publicada ontem uma pesquisa feita pelo próprio governo que revolou que <a href="http://www1.folha.uol.com.br/folha/brasil/ult96u305357.shtml" target="_blank">1.039 salários do Ministério Público estão acima do teto de R$ 22,1 mil</a>. Tirando o fato que o teto já é absurdamente alto (estamos falando em R$ 309.400,00 por ano por pessoa, ou quase R$ 31 por hora assumindo que o indivíduo trabalhe sem parar 24 horas por dia e 7 dias por semana) essa notícia me diz que praticamente absurdos R$ 321,5 milhões que deveriam estar sendo pagos  no máximo(teto) por mês, estão na verdade pagando muito mais.

Outro detalhe funesto da notícia é que demoraram um ano para chegar a essa conclusão!

Isso tudo me levou a uma conclusão: precisamos de Analistas de Sistemas!

Afinal de contas, encontrar quem ganha mais do que R$ 22.100 requer eternos 2 segundos e uma simples instrucão como essa:

<code>SELECT nome FROM funcionarios WHERE salario &gt; 22100;</code>

Além disso, garantir que os salários não ultrapassem o teto requer algo tão simples quanto:

<code>teto = 22100
if (salario &gt; teto) then
mensagem = "Salário acima do teto."
error
end if</code>

Se não estamos conseguindo fazer isso, não sei o que estamos fazendo.
