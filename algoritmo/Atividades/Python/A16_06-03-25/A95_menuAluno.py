def nomePrograma():
    print(''' 
 _______  _______  _        _______  _______    ______   _______ 
(  ____ \(  ____ \( (    /|(  ___  )(  ____ \  (  __  \ (  ____ |
| (    \/| (    \/|  \  ( || (   ) || (    \/  | (  \  )| (    \/
| (_____ | (__    |   \ | || (___) || |        | |   ) || (__    
(_____  )|  __)   | (\ \) ||  ___  || |        | |   | ||  __)   
      ) || (      | | \   || (   ) || |        | |   ) || (      
/\____) || (____/\| )  \  || )   ( || (____/\  | (__/  )| )      
\_______)(_______/|/    )_)|/     \|(_______/  (______/ |/       
                                                                 
''')
# opcao = 0

def Opcao():
    print('''Selecione uma opção:
==========================
=| 1 -  Cadastrar Aluno |=
=| 2 -  Listar Alunos   |=
=| 3 -  Buscar Aluno    |=
=| 4 -  Remover Aluno   |=
=| 5 -  Sair            |=
=| 6 -  Limpar a tela   |=
==========================
          ''')

aluno = {}    
alunoLista = []
def cadAluno():
    nomeAluno = input("Insira o nome do aluno: ")
    aluno["nomeAluno"] = nomeAluno
    alunoLista.append(aluno)
    print("Aluno cadastrado com sucesso!\n")

def listaAluno():
    print(f"Nome: {aluno["nomeAluno"].capitalize()}\n")
    print(alunoLista)

def buscarAluno():
    print("perai caba")
    if "nomeAluno" in aluno:
        print(aluno)
    else:
        print("funcionou nn")

def removerAluno():
    del aluno["nomeAluno"]
    alunoLista.pop(aluno["nomeAluno"])
    print("Aluno removido com sucesso!\n")

def sair():
    print("Programa encerrado...")

def limpaTerminal():
    print("\n" * 50)

def menu():
    while True:
        Opcao()
        opcao = int(input(""))
        match opcao:
            case 1:
                cadAluno()
            case 2:
                listaAluno()
            case 3:
                buscarAluno()
            case 4:
                removerAluno()
            case 5:
                sair()
                break
            case 6:
                limpaTerminal()
            case _:
                print("Opção inválida")

def main():
    nomePrograma()
    menu()
#==================| PROGRAMA |==============================
main()


#==================| TESTE |==============================
# nomePrograma()