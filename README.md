# LinuxMint-AfterInstall

Script shell projetado para automatizar o processo de pós-instalação do Linux Mint. Este script foi testado na versão 21.1 do Linux Mint, mas, devido à sua natureza, é provável que funcione também em outras distribuições baseadas no Ubuntu.

---

### 🛠️ Funcionalidades principais

O script `run.sh` automatiza diversas tarefas comuns após a instalação do sistema operacional, incluindo:

* Instalação de pacotes essenciais e utilitários.
* Configuração de drivers e ajustes específicos do sistema.
* Personalizações para melhorar a experiência do usuário.

É importante observar que o script pode exigir permissões de administrador para executar certas tarefas.

---

### ⚠️ Observações importantes

* **Drivers adicionais**: Para instalar o driver do adaptador USB para HDMI, é necessário seguir as instruções fornecidas no site oficial da Synaptics: [DisplayLink Graphics Downloads](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu).
* **Indicador de Caps Lock no XFCE**: Se você utiliza o ambiente de desktop XFCE e deseja um indicador visual para o Caps Lock, pode instalar o plugin `xfce4-kbdleds-plugin` através do repositório oficial do GitHub: [xfce4-kbdleds-plugin](https://github.com/oco2000/xfce4-kbdleds-plugin).

---

### 🧪 Como utilizar

Para executar o script, siga os passos abaixo:

1. Baixe o repositório ou clone-o utilizando o Git:

   ```bash
   git clone https://github.com/IgorAvilaPereira/LinuxMint-AfterInstall.git
   cd LinuxMint-AfterInstall
   ```

2. Conceda permissões de execução ao script:

   ```bash
   sudo chmod +x run.sh
   ```

3. Execute o script:([github.com][2])

   ```bash
   ./run.sh
   ```
   
Durante a execução, o script pode solicitar sua senha de administrador para realizar certas operações.([github.com][2])
