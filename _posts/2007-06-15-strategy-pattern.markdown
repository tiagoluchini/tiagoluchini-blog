--- 
wordpress_id: 218
title: Strategy Pattern
wordpress_url: http://www.tiagoluchini.eu/2007/06/15/strategy-pattern/
layout: post
---
Depois de uma semana sofrendo com um algoritmo para fazer load-balance e alocacão de portas para um servidor de live-streaming, finalmente consegui sair com uma solucão 100% funcional e que deixou todos felizes.

Foram mais de 12 classes, 2 bibliotecas externas, um protocolo de criptografia decomposto, uma pseudo-linguagem de macrosubstituicão enganada e um banco de dados mais um container de aplicacão sem pessimist locking - mesmo que isso fizesse parte dos requisitos funcionais.

Licão aprendida (ou seria reafirmada)?

Sempre utilize strategy pattern mais algum mecanismo de factory (qualquer um que abstraia a classe implementadora completament) . Fiquei muito feliz de conseguir trabalhar na implementacão da inteligência sem afetar muito as interfaces. Sinal que o meu design original era à prova de mudancas comportamentais do código: um ótimo sinal!

Detalhe assustador: o que era para ser uma simples alocacao de uma série de números virou um gigantesco sub-sistema de load-balancing com SSH, templates Velocity flexíveis e uma implementacão manual de Optimistic locking.

Como sempre bati o pé com meus alunos:  o strategy pattern é o melhor design pattern que poderiam ter inventado (ou, como os intelectuais gostam de dizer: "descoberto") e, ao mesmo tempo, o mais esquecido, tanto na prática quanto na didática.

Isso me inspirou até a escrever um artigo sobre isso... em breve.
