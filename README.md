# Gestão de Voos - Way Arlines app

![info2](https://github.com/user-attachments/assets/dca6ec50-cbbc-43d3-9deb-9c09ff99c948)
![info1](https://github.com/user-attachments/assets/0ab0ef2b-6e91-43ea-829f-8aabe3488f3c)

## Descrição

Este aplicativo foi desenvolvido para gerenciar e monitorar os voos de uma empresa aérea. Ele permite aos responsáveis pela gestão dos equipamentos ter uma visão geral das operações de voos, facilitando o controle e a tomada de decisões.

Com o aplicativo, é possível:

- **Listar todos os voos**: Obtenha uma visão geral de todas as viagens realizadas ou programadas pela empresa.
- **Listar voos concluídos**: Acompanhe as viagens que já foram realizadas com sucesso.
- **Listar voos cancelados**: Tenha controle sobre as viagens que não ocorreram conforme o planejado.
- **Listar voos a realizar**: Monitore as viagens programadas que ainda não aconteceram.
- **Listar voos em viagem**: Acompanhe as viagens que estão acontecendo atualmente.

## Decisões de Design

- **Arquitetura**: O aplicativo foi desenvolvido utilizando a arquitetura MVVM (Model-View-ViewModel).
- **Tecnologia**: Utilizado SwiftUI para a construção da interface, permitindo uma experiência de usuário fluida e moderna.
- **Banco de Dados**: O aplicativo utiliza dados mockados para simular dados recebidos de um API.

## Bibliotecas Utilizadas

- **SwiftUI**: Para a construção da interface do usuário.
- **Foundation**: Usada para manipulação de dados.

## Instruções de Execução

### Pré-requisitos

- **Xcode**: Certifique-se de ter o Xcode instalado (preferencialmente a versão mais recente).
- **Swift**: O projeto foi desenvolvido utilizando Swift 5.
- **iOS**: Utilize a versão iOS 17 ou superior.
  
### Configuração do Projeto

1. Clone o repositório:
    ```bash
    git clone https://github.com/victorsaccucci/Way-Airlines-app.git
    cd Way-Airlines-app
    ```

2. Abra o projeto no Xcode:
    - Navegue até a pasta do repositório clonado e abra o arquivo `.xcodeproj` ou `.xcworkspace`.

3. Compile e execute o projeto:
    - Selecione um simulador ou dispositivo físico e clique em "Run".

## Observações

É necessário o uso do iOS 17 ou superior para rodar este projeto, devido a propriedades que são fornecidas a partir do iOS 17, como a função `.scrollTargetLayout()`, que permite um layout mais flexível e adaptável durante o scroll de listas e conteúdos.

