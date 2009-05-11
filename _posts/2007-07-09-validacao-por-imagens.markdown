--- 
wordpress_id: 284
title: "Validac\xC3\xA3o por Imagens"
wordpress_url: http://www.tiagoluchini.eu/2007/07/09/validacao-por-imagens/
layout: post
---
<a href="http://www.tiagoluchini.eu/wp-content/uploads/2007/07/verification.jpg" target="_blank" title="Image Verification"><img src="http://www.tiagoluchini.eu/wp-content/uploads/2007/07/verification.thumbnail.jpg" title="Image Verification" alt="Image Verification" align="left" hspace="10" vspace="5" /></a>Em algum momento lá pelos idos de 2003 alguém percebeu que era muito fácil qualquer adolescente de 15 anos fazer um pequeno programa para ficar atormentando os sites comerciais. O programa era bobinho: ficar cadastrando milhares de usuários, mandando centenas de mensagens ou qualquer outra coisa que pudesse ser feita através de formulários dos sites.

Aí alguém teve uma idéia fantástica: antes de aceitar os dados dos formulários vamos aprensetar uma imagem toda distorcida que só um ser-humano consiga identificar e então validar que existe realmente alguém <em>in persona </em>do outro lado da rede.

A idéia não é de todo má exceto por três grandes problemas:
<ol>
	<li><strong>Implementacões ruins</strong>: me cansa a quantidade de sites nos quais, mesmo que eu escreva exatamente o que tem na imagem  bizarramente formatada, não aceitam meu input (e antes que alguém diga que eu sou meio cegueta e não consigo ler alguma imagem - lembrem que existem mais desenvolvedores inaptos na face da terra do que ceguetas como eu). Os sites deveriam também entender que a letra "E" e "e" são a mesma coisa (só eu que aprendi sobre case-insensitivity?)</li>
	<li><strong>Imagens ininteligíveis</strong>: alguns desenvolvedores foram tão à fundo na idéia que resolveram embaralhar tanto a imagem que nem os seres-humanos conseguem entender o que está representado lá. Novamente, muitas implementacões seguem essa linha. Lembrando da idéia original: apenas uma pequena oscilacão de ângulos já deveria servir. Não é preciso implementar linhas, quadrados e círculos multicoloridos sobre a palavra-chave: eu quero poder lê-la.</li>
	<li><strong>Pessoas com problemas visuais:</strong> essa solucão simplesmente ignora o fato de que muitas pessoas que navegam na internet ou não possuem nenhuma visão ou possuem algum outro tipo de limitacão visual. Uma em cada 100 pessoas tem problemas de assimilacão de cores (daltonismo) por exemplo.</li>
</ol>
Alguma alternativa precisa ser desenvolvida. Entre elas utilizar outros mecanismos de verificacão como áudio por exemplo. Um design que reduza a quantidade de vezes que o usuário precisa inputar o código de verificacão também é recomendado. Por último, lembrar das motivacões por trás da necessidade e fazer uma implementacão consciente e não simplesmente fazê-la porque "todo mundo está fazendo".
