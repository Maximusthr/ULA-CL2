# :abacus::gear: Projeto Unidade Lógica e Aritmética

- ### [:dart: Objetivo](#dart-objetivo-1)
- ### [:gear: Como rodar](#gear-como-rodar-1)
- ### [:desktop_computer: Simulação](#desktop_computer-simulação-1)
- ### [:arrow_down: Baixar o projeto](https://github.com/Maximusthr/ULA-CL2/archive/refs/heads/main.zip)

## Disciplina de Circuitos Lógicos II

Esse foi um projeto desenvolvido por discentes do curso de *Engenharia da Computação da Universidade Federal da Paraíba*, curso este que pertence ao *[Centro de Informática](http://ci.ufpb.br/)*, localizado na *[Rua dos Escoteiros S/N - Mangabeira - João Pessoa - Paraíba - Brasil](https://g.co/kgs/xobLzCE)*. O código desenvolvido em SystemVerilog foi avaliado por meio de simulações realizadas no Quartus, permitindo a verificação do funcionamento correto do projeto e a validação dos resultados esperados. 

### :control_knobs: Autores:

-  :link:  *[Arthur Maximus Cavalcante Beuttenmuller](https://github.com/Maximusthr)*
-  :link:  *[Lucas Henrique Vieira da Silva](https://github.com/hvslucas)*
-  :link:  *Luis Antônio Gadelha Pinheiro*
-  :link:  *[Marco Antonio de Vasconcelos Souza Filho](https://github.com/MarcoFilho1)*
-  :link:  *[Sabrina Xavier Almeida](https://github.com/sabrina78394)*

###  :control_knobs: Docente:

-  :link: *Verônica Maria*
<br>
<br>

[![chip-logo](https://github.com/user-attachments/assets/63eea007-4a99-4238-b66c-cc52ebe194f4)](#abacusgear-projeto-unidade-lógica-e-aritmética)

## :dart: Objetivo:

O do projeto é projetar, implementar e simular uma Unidade Lógica e Aritmética (ULA)[^1] em SystemVerilog[^2] que seja capaz de realizar operações lógicas e aritméticas sobre operandos de 6 bits, seguindo as especificações a partir de entradas de seleção. Para o desenvolvimento deste projeto, foi recomendado pela docente a utilização do software Quartus II.[^3] (Mais detalhes sobre a utilização do software em [Como rodar](#gear-como-rodar-1))

[^1]: A [Unidade Lógica e Aritmética (ULA) ou Arithmetic Logic Unit (ALU)](https://www.icloud.com.br/20798/o-que-e-uma-unidade-logica-aritmetica) é um tipo de unidade da [Unidade Central de Processamento (CPU)](https://www.ibm.com/br-pt/think/topics/central-processing-unit-types#:~:text=Unidade%20l%C3%B3gica%20aritm%C3%A9tica%20(ALU)%3A,a%20a%C3%A7%C3%B5es%20espec%C3%ADficas%20do%20computador.)

[^2]: SystemVerilog é uma [linguagem de descrição e verificação de hardware](https://pt.wikipedia.org/wiki/Linguagem_de_descri%C3%A7%C3%A3o_de_hardware)

[^3]: Quartus uma plataforma completa da Intel para projetos de hardware. Permite a síntese, simulação e implementação de circuitos digitais.

### Especificações da ULA e Atribuições

#### Entradas:

- **Operando A** (6 bits)
- **Operando B** (6 bits)
- **Reset** (zera as saídas)
- **Seleção de Modo** (distingue entre operações aritméticas e lógicas)
- **Seleção de Operação** (3 bits para determinar a operação específica)

#### Saídas:

- **Output ULA** (6 bits) – Resultado da operação
- **Carry_out/Overflow** – Indica se houve estouro de representação
- **Zero** – Indica se o resultado da operação é igual a zero (1 = Verdadeiro, 0 = Falso)

Seguindo as especificações determinadas, as atribuições no código ficaram:

- **`A` e `B`**  : São os operandos de 6 bits, conforme especificado
- **`reset`**    : Zera as saídas (1 bit)
- **`mode`**     : Define se a operação será lógica ou aritmética (1 bit)
- **`oper`**     : Entrada de 3 bits para seleção da operaççao (S3-S2-S1-S0)
- **`O`**        : O output da operação, com 6 bits
- **`overflow`** : 1 bit, indica o overflow
- **`zero`**     : 1 bit que indica o resultado nulo


### Tabela de Operações da ULA

#### Operações Aritméticas

| S3 S2 S1 S0 | Operação           | Descrição                          |
|-------------|--------------------|------------------------------------|
| 0000        | O = A + B          | Soma dos operandos                 |
| 0001        | O = A – B          | Subtração de A por B               |
| 0010        | O = A + not(B)     | Soma de A com o complemento de B   |
| 0011        | O = A – not(B)     | Subtração de A com complemento de B|
| 0100        | O = A + 1          | Incrementa A                       |
| 0101        | O = A – 1          | Decrementa A                       |
| 0110        | O = B + 1          | Incrementa B                       |
| 0111        | O = B – 1          | Decrementa B                       |

#### Operações Lógicas

| S3 S2 S1 S0 | Operação           | Descrição                          |
|-------------|--------------------|------------------------------------|
| 1000        | O = A AND B        | AND lógico entre os operandos      |
| 1001        | O = NOT(A)         | Complemento de A                   |
| 1010        | O = NOT(B)         | Complemento de B                   |
| 1011        | O = A OR B         | OR lógico entre os operandos       |
| 1100        | O = A XOR B        | XOR lógico entre os operandos      |
| 1101        | O = A NAND B       | NAND lógico entre os operandos     |
| 1110        | O = A              | Transfere A para a saída           |
| 1111        | O = B              | Transfere B para a saída           |



## :gear: Como rodar

Para o desenvolvimento deste projeto, foi utilizado o Quartus II versão 13.0sp1, uma plataforma mantida pela Intel para projetos de hardware. Por isso, recomendamos a utilização dessa versão (ou superior) por oferecer a melhor compatibilidade com o código. O download do software pode ser encontrado em: [**Download**](https://www.intel.com/content/www/us/en/software-kit/711791/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-windows.html)

[**Atenção:** Lembre de baixar o projeto e extraí-lo devidamente do `.zip`.](#abacusgear-projeto-unidade-lógica-e-aritmética)

- **1 Abrir o Quartus II e Iniciar projeto:**

  - Inicie o Quartus II no seu computador.

  - Criar um Novo Projeto:
    - No menu principal, vá em `File` > `New Project Wizard`
    - Siga as instruções do assistente para criar um novo projeto.
    - Defina o diretório do projeto, **Recomendamos que crie uma pasta com o nome `"ULA"`**
    - **!** Defina o nome do projeto como **`"ULA"`**
    - **!** Defina o dispositivo FPGA como **`"Cyclone II"`** (`Device family` >  `Family`)

- **2 Adicionar o código da ULA:**
  - Após criar o projeto, adicionar o arquivo **`ULA.sv`**:
    - Vá em `Project` > `Add/Remove Files in Project`
    - Clique em `...` ao lado do campo `File name` para navegar até o local do arquivo **`ULA.sv`**
    - Selecione o arquivo **`ULA.sv`** e clique em `Abrir` e depois em `Add`
    - Certifique-se de que o arquivo está marcado para ser incluído no projeto e clique em `Apply` e depois em `Okay`

- **3 Simular**
  - Executar a compilação:
    - No **Painel Superior de Opções** procure pelo ícone de *play* descrito como `Start Compilation`
      - Ou, `Processing` > `Start Analysis & Synthesis`

    - Importar a Simulação com entradas estabelecidas:
      - Vá em `Project` > `Add/Remove Files in Project`
      - Clique em `...` ao lado do campo `File name` para navegar até o local do arquivo `Waveform.vwf`
      - **!** O arquivo desejado possivelmente não irá aparecer, acima do botão `Abrir` terá a opção de tipo de arquivo, selecione `All Files (*)`
      - Selecione o arquivo `Waveform.vwf` e clique em `Abrir` e depois em `Add`
      - Certifique-se de que o arquivo está marcado para ser incluído no projeto e clique em `Apply` e depois em `Okay`
     
    - Executar:
      - Na ferramenta de simulação, clique em `Simulation` > `Run Functional Simulation` ou no **Painel Superior de Opções** ícone na para iniciar a simulação
     
    - Alterar valores de entrada:
      - É possível alterar os valores dos operandos na ferramenta de simulação utilizando as opções do **Painel Superior de Opções** (opções ao lado do botão de rodar a simulação)
      - A opção com um R, `Random Values`, estabelece valores aleatórios ao longo do intervalo estabelecido
      - Após associar os valores arbitrários, basta executar o passo de execução

## :desktop_computer: Simulação
