Incluir: "RNA.cx";

Classe: RedeJogoDaVelha
{
	Herdar: Rede;
	
	construtor(Objeto: interface)
	{
		este.adicionar(novo Camada());
		para(Inteiro: i; i < 9; i++)
		{
			este.valor(0).adicionar(novo Neuronio(interface));
		}
		
		este.adicionar(novo Camada());
		para(Inteiro: i; i < 8; i++)
		{
			este.valor(1).adicionar(novo Neuronio(interface));
		}
		
		este.adicionar(novo Camada());
		para(Inteiro: i; i < 2; i++)
		{
			este.valor(2).adicionar(novo Neuronio(interface));
		}
	}
}

e()
{
	retornar: 2.718281828459045;
}

Principal()
{
	Objeto: linear = novo Classe{
		ativar(Real: valor){
			retornar: valor;
		}
	}();
	Objeto: sigmoide = novo Classe{
		ativar(Real: valor){
			retornar: 1 / (1 + e() ^ -valor);
		}
	}();
	
	Objeto: rede = novo RedeJogoDaVelha(sigmoide);
	
	Objeto[]: entrada = rede.entradas();
	Objeto[]: saida = rede.saidas();
	
	para(Inteiro: i; i < entrada.tamanho; i++)
	{
		entrada[i].definir((i + 1) / 10);
	}
	
	rede.conectarCamadas();
	rede.processar();
	
	para(Inteiro: i; i < saida.tamanho; i++)
	{
		Tela.escreverLinha("Saída " << i << ": " << saida[i].valor());
	}
	
	rede.destruir();
	
	Tecla.ler();
}