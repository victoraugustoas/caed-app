# CAED App

## Descrição
Este é um projeto Flutter que visa aplicar os conhecimentos para a vaga de desenvolvedor flutter mobile.

Features
 - Login
 - Home com listagem de pacotes
 - Home com tabs de informações
 - Barra de navegação
 - Tela de detalhes de um pacote

## Instalação
Siga os passos abaixo para configurar localmente.

## Pré-requisitos
Certifique-se de ter o FVM instalado na sua máquina. Para mais detalhes sobre a instalação do FVM, consulte a documentação oficial [aqui](https://fvm.app/documentation/getting-started/installation).

## Iniciando projeto
0. Instalação da versão flutter do projeto
```bash
fvm install
```
2. Instalação das dependências
```bash
fvm flutter pub get
```
3. Iniciar o build runner para geração de código
```bash
make build-runner
```
4. Execute o projeto
```bash
make run-app
```

## Estrutura do Projeto
```bash
.
├── assets                                          # Assets da aplicação
├── lib
│   ├── global                                      # Configurações globais da aplicação
│   │   ├── container                               # Configurações para injeção de dependências
│   │   ├── http                                    # Configuração do cliente HTTP
│   │   ├── initializer.dart                        # Arquivo para inicialização de configurações globais
│   │   └── router
│   ├── main.dart                                   # Arquivo principal de inicialização do app
│   ├── model
│   │   ├── dtos
│   │   └── enums
│   ├── network                                     # Configurações de API
│   │   ├── endpoints                               # Lista de endpoints
│   │   └── providers                               # Conjuto de classes para fazer requisições
│   ├── routes                                      # Configuração de rotas
│   ├── screens                                     # Telas do aplicativo
│   │   └── splash_screen
│   ├── utils
│   │   ├── assets.dart                             # Mapeamento de assets
│   │   ├── exceptions                              # Classes de exceção
│   │   └── extensions
│   └── widgets                                     # Componentes da aplicação
└── test                                            # Testes seguindo as pastas da aplicação
    └── screens
        └── package_detail
```

## Considerações

### Melhorias
- Adicionar i18n no projeto
- Criar classes de exceção específicas para cada cenário
  - Exemplo: RequestTimeoutException

### Gerenciador de estado
Neste projeto, estamos utilizando o GetIt como container de injeção de dependências. Além disso, estamos usando o Riverpod para gerenciamento de estado. O pacote Provider e o Riverpod são semelhantes, então a troca de um pelo outro, caso necessário, não deve ser tão custosa.

O container de injeção de dependências, em conjunto com o pacote Mockito, nos ajuda a criar mocks de requisições nos testes de forma mais fácil.
