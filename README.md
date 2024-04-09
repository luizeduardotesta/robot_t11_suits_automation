# Nome do Projeto

Este é um projeto feito para estudar, melhor entender e aprender a testar utilizando o Robot Framework.

## Estrutura do Projeto

robot_t11_automation/
│
├── backend/
│   ├── tests/
│   │   ├── board/
│   │   │   ├── create_board/
│   │   │   │   ├── create_board_tests.robot
│   │   │   │   └── create_board.resource
│   │   │   ├── list_board/
│   │   │   │   ├── list_board_tests.robot
│   │   │   │   └── list_board.resource
│   │   │   └── update_board/
│   │   │       ├── update_board_tests.robot
│   │   │       └── update_board.resource
│   │   ├── company/
│   │   │   ├── create_company/
│   │   │   │   ├── create_company_tests.robot
│   │   │   │   └── create_company.resource
│   │   │   ├── list_company/
│   │   │   │   ├── list_company_tests.robot
│   │   │   │   └── list_company.resource
│   │   │   ├── update_company/
│   │   │   │   ├── update_company_tests.robot
│   │   │   │   ├── update_company.resource
│   │   │   └── delete_company/
│   │   │       ├── delete_company_tests.robot
│   │   │       ├── delete_company.resource
│   │   ├── login/
│   │   │   ├── auth_common.resource/
│   │   │   └── auth_sysadmin.resource/
│   │   └── user/
│   │       ├── create_user/
│   │       │   ├── create_user_tests.robot
│   │       │   └── create_user.resource
│   │       ├── list_user/
│   │       │   ├── list_user_tests.robot
│   │       │   └── list_user.resource
│   │       ├── update_user/
│   │       │   ├── update_user_tests.robot
│   │       │   ├── update_user.resource
│   │       └── delete_user/
│   │           ├── delete_user_tests.robot
│   │           ├── delete_user.resource
│   ├── utils/
│   │   ├── resources.robot
│   │   └── data/
│   │       └── dynamic_data.robot
│   └── config/
│       └── settings.yaml
│
├── frontend/
│   ├── tests/
│   └── config/
└── README.md


## Pré-requisitos

Certifique-se de ter instalado os seguintes pré-requisitos antes de executar os testes:

### Ferramentas e Bibliotecas

- [Python](https://www.python.org/) - Certifique-se de ter o Python instalado.
- [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) - Certifique-se de ter o Chromedriver instalado para executar testes de interface do usuário usando o navegador Chrome.
- [Robot Framework](https://robotframework.org/) - Framework de automação de testes.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) - Biblioteca para automação de testes web.
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests) - Biblioteca para realizar solicitações HTTP em testes de API.
- [FakerLibrary](https://github.com/guykisel/robotframework-faker) - Biblioteca para geração de dados falsos.

## Como Executar os Testes

Para executar os testes automatizados deste projeto, siga as instruções abaixo:

Passos para Execução
Abra o terminal ou prompt de comando.
Navegue até o diretório raiz do projeto.
Execute o seguinte comando para acessar o backend:

```bash
    robot -d backend/log backend/tests
```

Execute o seguinte comando para acessar o frontend:

```bash
    robot -d frontend/log frontend/tests
```


## Contribuição

Este projeto é voltado para estudo e aprendizado do Robot Framework. Contribuições são bem-vindas, especialmente por meio de comentários que possam ajudar a melhorar o código, corrigir erros ou adicionar novos recursos.

Se você encontrar algum problema ou tiver alguma sugestão para melhorar este projeto, sinta-se à vontade para deixar um comentário no código ou abrir uma nova issue.

Obrigado por contribuir para tornar este projeto melhor para todos!

## Contato

Você pode entrar em contato comigo pelo LinkedIn: https://www.linkedin.com/in/luiz-eduardo-testa-38727b226/ para qualquer dúvida, sugestão ou feedback relacionado a este projeto. Estou sempre aberto para trocar ideias e colaborar!
