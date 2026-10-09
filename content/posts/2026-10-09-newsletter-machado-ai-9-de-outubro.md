---
title: "Newsletter Machado AI - 9 de outubro"
date: 2026-10-09
slug: newsletter-machado-ai-9-de-outubro
---
No dia 15 de setembro de 2026, a TypeSafe AI lançou o modelo Jev.

Uma classe nova de modelos de IA que não geram textos, mas sim tomam decisões predefinidas baseadas no que foi enviado.

É como se fosse um if semântico. 

**E isso pode ser muito maior que nós imaginamos.** Tomar (pequenas) decisões é uma das coisas mais valiosas que a IA pode fazer por nós e a TypeSafe promete isso 100x mais rápido e 400x mais barato com boa calibração.

**Mas não é possível fazer isso com a LLM comum? Sim, é.** O problema é a tríade custo, tempo, calibração.

![Triângulo com os vértices custo, tempo e calibração](/triangulo-custo-tempo-calibracao.png)

- **rápido e barato**: provavelmente não tão bem calibrado.
- **calibrado e rápido**: provavelmente o custo vai ser alto por usar uma estratégia de paralelização.
- **calibrado e barato**: usar um modelo pequeno.

O JEV promete quebrar isso.

## Por que isso parece ser tão importante?

As LLMs são boas de cumprir diversas atividades humanas. Alguns exemplos:
- **escrita**: textos, código, traduções.
- **síntese**: pesquisas, resumos, planejamento
- **análise**: dados, documentos

E mais uma delas é: **tomar decisões**. Podemos apresentar critérios e opções e obteremos uma boa decisão na maioria das vezes, a depender do contexto.

Historicamente, decisões, mesmo pequenas sempre foram tomadas por humanos. Alguns softwares começaram a automatizar isso, como Excel e todo tipo de software que é lançado hoje em dia.

Só que ainda tinha uma limitação. Toda decisão deveria ser "preto no branco", baseada em uma decisão lógica ou numérica. As LLMs trouxeram uma nova possibilidade, que é a **decisão semântica**. 

Eu posso fazer um sistema que em um determinado ponto precisaria de uma decisão humana e usar a IA para escolher o caminho a seguir. E os humanos ficam livres para tomar as decisões que as IAs são sabidamente ruins.

**O problema: custo, tempo e calibração.** O time do JEV entendeu perfeitamente. O lançamento desse tipo de modelo pode ser um divisor de águas nas aplicações que usam IA.

### Como eles fizeram isso?

Eles afirmaram usar RLCD (Reinforcement Learning for Calibrated Decisions). Um método de treinamento criado por eles mesmos que afirma recompensar o modelo por **probabilidades honestas**. Ao invés de acertar 100% das vezes, o que é basicamente impossível para os modelos, dizer 90% e acertar 90% é o que eles buscam.

Já é aceita a expectativa de que a LLM não vai acertar sempre e teremos o humano ou outra AI assumindo quando o modelo de decisão não conseguir. Dessa forma, **O MAIS IMPORTANTE é ele saber o que não sabe.**

### Impacto no trabalho

**Todo fluxo no trabalho é feito de pequenas decisões.** Quanto mais decisões você puder delegar à AI, melhor, desde que o risco seja assumido por erros (eles vão existir).

Algumas ideias:
- triagem de tickets (decidir para qual time vai)
- triagem de reclamações (decidir se precisa de intervenção humana)
- classificar leads
- sentimento de clientes
- triagem de contratos e documentos
- roteamento entre modelos
- marcar transações suspeitas para revisão
- priorização de alertas e logs

### Impacto na vida pessoal

O impacto é bem menor, já que as decisões na vida pessoal são muitíssimo particulares, mas algumas coisas que passam pela minha cabeça:

- Classificação de despesas de cartão de crédito
- Filtros de notícias/newsletters
- Alertas de anúncios (imóveis, carros, produtos) por relevância

Mas como as decisões na vida pessoal não são tão numerosas e também não são dependentes de latência, provavelmente usar um modelo dos mais comuns como Sonnet ou Sol pode entregar resultados parecidos.

**A questão é se a calibração desses modelos for ordens de magnitude melhor, aí eles terão uma diferença maior na vida das pessoas.**

### Como implementar?

Vou falar sobre como implementar isso em um post separado, até porque a maioria das opções de API de decisões estão em beta ainda.

Por enquanto é aguardar e preparar casos em que as decisões são relevantes a ponto de comportarem bem os modelos de decisão.
