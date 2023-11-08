variable "MaquinaVirtualWindows" {
  type = object({
    NomeMaquinasVirtuais     = list(string)
    ImagemFornecedor         = string
    ImagemSistemaOperacional = string
    ImagemDistribuicao       = string
    ImagemVersao             = string
    TamanhoComputacional     = string
    UsuarioAdministrador     = string
    SenhaAdministrador       = string
    Regiao                   = string
    GrupoRecurso             = string
  })

  default = {
    NomeMaquinasVirtuais     = []
    ImagemFornecedor         = ""
    ImagemSistemaOperacional = ""
    ImagemDistribuicao       = ""
    ImagemVersao             = ""
    TamanhoComputacional     = ""
    UsuarioAdministrador     = ""
    SenhaAdministrador       = ""
    Regiao                   = ""
    GrupoRecurso             = ""
  }

  validation {
    condition     = length(var.MaquinaVirtualWindows.NomeMaquinasVirtuais) == 0 || (length(distinct(var.MaquinaVirtualWindows["NomeMaquinasVirtuais"])) == length(var.MaquinaVirtualWindows["NomeMaquinasVirtuais"]))
    error_message = "A lista de nomes de Máquinas Virtuais contém valores duplicados."
  }

  validation {
    condition     = length(var.MaquinaVirtualWindows.NomeMaquinasVirtuais) == 0 || (length(var.MaquinaVirtualWindows.NomeMaquinasVirtuais) > 0 && alltrue([for name in var.MaquinaVirtualWindows.NomeMaquinasVirtuais : length(name) >= 1 && length(name) <= 15]))
    error_message = "A lista de nomes de Máquinas Virtuais não pode estar vazia e os nomes devem ter entre 1 e 15 caracteres."
  }

  validation {
    condition     = length(var.MaquinaVirtualWindows.NomeMaquinasVirtuais) == 0 || alltrue([for name in var.MaquinaVirtualWindows.NomeMaquinasVirtuais : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes das Máquinas Virtuais devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "MaquinaVirtualLinux" {
  type = object({
    NomeMaquinasVirtuais     = list(string)
    ImagemFornecedor         = string
    ImagemSistemaOperacional = string
    ImagemDistribuicao       = string
    ImagemVersao             = string
    TamanhoComputacional     = string
    UsuarioAdministrador     = string
    SenhaAdministrador       = string
    Regiao                   = string
    GrupoRecurso             = string
  })

  default = {
    NomeMaquinasVirtuais     = []
    ImagemFornecedor         = ""
    ImagemSistemaOperacional = ""
    ImagemDistribuicao       = ""
    ImagemVersao             = ""
    TamanhoComputacional     = ""
    UsuarioAdministrador     = ""
    SenhaAdministrador       = ""
    Regiao                   = ""
    GrupoRecurso             = ""
  }

  validation {
    condition     = length(var.MaquinaVirtualLinux.NomeMaquinasVirtuais) == 0 || (length(distinct(var.MaquinaVirtualLinux["NomeMaquinasVirtuais"])) == length(var.MaquinaVirtualLinux["NomeMaquinasVirtuais"]))
    error_message = "A lista de nomes de Máquinas Virtuais contém valores duplicados."
  }

  validation {
    condition     = length(var.MaquinaVirtualLinux.NomeMaquinasVirtuais) == 0 || (length(var.MaquinaVirtualLinux.NomeMaquinasVirtuais) > 0 && alltrue([for name in var.MaquinaVirtualLinux.NomeMaquinasVirtuais : length(name) >= 1 && length(name) <= 48]))
    error_message = "A lista de nomes de Máquinas Virtuais não pode estar vazia e os nomes devem ter entre 1 e 48 caracteres."
  }

  validation {
    condition     = length(var.MaquinaVirtualLinux.NomeMaquinasVirtuais) == 0 || alltrue([for name in var.MaquinaVirtualLinux.NomeMaquinasVirtuais : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes das Máquinas Virtuais devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "ConjuntoEscalarMaquinaVirtualWindows" {
  type = object({
    NomeConjuntoMaquinaVirtual = string
    NumeroInstancias           = number
    ImagemFornecedor           = string
    ImagemSistemaOperacional   = string
    ImagemDistribuicao         = string
    ImagemVersao               = string
    TamanhoComputacional       = string
    UsuarioAdministrador       = string
    SenhaAdministrador         = string
    Regiao                     = string
    GrupoRecurso               = string
  })

  default = {
    NomeConjuntoMaquinaVirtual = ""
    NumeroInstancias           = 1
    ImagemFornecedor           = ""
    ImagemSistemaOperacional   = ""
    ImagemDistribuicao         = ""
    ImagemVersao               = ""
    TamanhoComputacional       = ""
    UsuarioAdministrador       = ""
    SenhaAdministrador         = ""
    Regiao                     = ""
    GrupoRecurso               = ""
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) == 0 || (length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) >= 3 && length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) <= 24)
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve ter entre 3 e 24 caracteres."
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) == 0 || can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual))
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) == 0 || (var.ConjuntoEscalarMaquinaVirtualWindows.NumeroInstancias >= 1 && var.ConjuntoEscalarMaquinaVirtualWindows.NumeroInstancias <= 100)
    error_message = "O número de instancias do Conjunto de Escalas da Máquina Virtual deve ser entre 1 a 100 instancias."
  }
}

variable "ConjuntoEscalarMaquinaVirtualLinux" {
  type = object({
    NomeConjuntoMaquinaVirtual = string
    NumeroInstancias           = number
    ImagemFornecedor           = string
    ImagemSistemaOperacional   = string
    ImagemDistribuicao         = string
    ImagemVersao               = string
    TamanhoComputacional       = string
    UsuarioAdministrador       = string
    SenhaAdministrador         = string
    Regiao                     = string
    GrupoRecurso               = string
  })

  default = {
    NomeConjuntoMaquinaVirtual = ""
    NumeroInstancias           = 1
    ImagemFornecedor           = ""
    ImagemSistemaOperacional   = ""
    ImagemDistribuicao         = ""
    ImagemVersao               = ""
    TamanhoComputacional       = ""
    UsuarioAdministrador       = ""
    SenhaAdministrador         = ""
    Regiao                     = ""
    GrupoRecurso               = ""
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) == 0 || (length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) >= 3 && length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) <= 24)
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve ter entre 3 e 24 caracteres."
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) == 0 || can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual))
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) == 0 || (var.ConjuntoEscalarMaquinaVirtualLinux.NumeroInstancias >= 1 && var.ConjuntoEscalarMaquinaVirtualLinux.NumeroInstancias <= 100)
    error_message = "O número de instancias do Conjunto de Escalas da Máquina Virtual deve ser entre 1 a 100 instancias."
  }
}

variable "AplicativoWebWindows" {
  type = object({
    NomeAplicativos      = list(string)
    NomeInstancia        = string
    NumeroInstancias     = number
    TamanhoComputacional = string
    GrupoRecurso         = string
    Regiao               = string
  })

  default = {
    NomeAplicativos      = []
    NomeInstancia        = "plan"
    NumeroInstancias     = 1
    TamanhoComputacional = ""
    GrupoRecurso         = ""
    Regiao               = ""
  }

  validation {
    condition     = length(var.AplicativoWebWindows.NomeAplicativos) == 0 || (length(distinct(var.AplicativoWebWindows["NomeAplicativos"])) == length(var.AplicativoWebWindows["NomeAplicativos"]))
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.AplicativoWebWindows.NomeAplicativos) == 0 || (length(var.AplicativoWebWindows.NomeAplicativos) > 0 && alltrue([for name in var.AplicativoWebWindows.NomeAplicativos : length(name) >= 3 && length(name) <= 63]))
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = length(var.AplicativoWebWindows.NomeAplicativos) == 0 || alltrue([for name in var.AplicativoWebWindows.NomeAplicativos : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = length(var.AplicativoWebWindows.NomeAplicativos) == 0 || (var.AplicativoWebWindows.NumeroInstancias >= 1 && var.AplicativoWebWindows.NumeroInstancias <= 30)
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }
}

variable "AplicativoWebLinux" {
  type = object({
    NomeAplicativos      = list(string)
    NomeInstancia        = string
    NumeroInstancias     = number
    TamanhoComputacional = string
    GrupoRecurso         = string
    Regiao               = string
  })

  default = {
    NomeAplicativos      = []
    NomeInstancia        = "plan"
    NumeroInstancias     = 1
    TamanhoComputacional = ""
    GrupoRecurso         = ""
    Regiao               = ""
  }

  validation {
    condition     = length(var.AplicativoWebLinux.NomeAplicativos) == 0 || (length(distinct(var.AplicativoWebLinux["NomeAplicativos"])) == length(var.AplicativoWebLinux["NomeAplicativos"]))
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.AplicativoWebLinux.NomeAplicativos) == 0 || (length(var.AplicativoWebLinux.NomeAplicativos) > 0 && alltrue([for name in var.AplicativoWebLinux.NomeAplicativos : length(name) >= 3 && length(name) <= 63]))
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = length(var.AplicativoWebLinux.NomeAplicativos) == 0 || alltrue([for name in var.AplicativoWebLinux.NomeAplicativos : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = length(var.AplicativoWebLinux.NomeAplicativos) == 0 || (var.AplicativoWebLinux.NumeroInstancias >= 1 && var.AplicativoWebLinux.NumeroInstancias <= 30)
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }
}

variable "FunctionWebWindows" {
  type = object({
    NomeFunctions        = list(string)
    NomeInstancia        = string
    NumeroInstancias     = number
    TamanhoComputacional = string
    ContaArmazenamento   = string
    GrupoRecurso         = string
    Regiao               = string
  })

  default = {
    NomeFunctions        = []
    NomeInstancia        = ""
    NumeroInstancias     = 1
    TamanhoComputacional = ""
    ContaArmazenamento   = "storage"
    GrupoRecurso         = ""
    Regiao               = ""
  }

  validation {
    condition     = length(var.FunctionWebWindows.NomeFunctions) == 0 || length(distinct(var.FunctionWebWindows["NomeFunctions"])) == length(var.FunctionWebWindows["NomeFunctions"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.FunctionWebWindows.NomeFunctions) == 0 || (length(var.FunctionWebWindows.NomeFunctions) > 0 && alltrue([for name in var.FunctionWebWindows.NomeFunctions : length(name) >= 3 && length(name) <= 63]))
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = length(var.FunctionWebWindows.NomeFunctions) == 0 || alltrue([for name in var.FunctionWebWindows.NomeFunctions : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = length(var.FunctionWebWindows.NomeFunctions) == 0 || (var.FunctionWebWindows.NumeroInstancias >= 1 && var.FunctionWebWindows.NumeroInstancias <= 30)
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }

  validation {
    condition     = length(var.FunctionWebWindows.NomeFunctions) == 0 || (length(var.FunctionWebWindows.ContaArmazenamento) >= 3 && length(var.FunctionWebWindows.ContaArmazenamento) <= 24)
    error_message = "O nome do Storage para a Function deve ter entre 3 e 24 caracteres."
  }
}

variable "FunctionWebLinux" {
  type = object({
    NomeFunctions        = list(string)
    NomeInstancia        = string
    NumeroInstancias     = number
    TamanhoComputacional = string
    ContaArmazenamento   = string
    GrupoRecurso         = string
    Regiao               = string
  })

  default = {
    NomeFunctions        = []
    NomeInstancia        = ""
    NumeroInstancias     = 1
    TamanhoComputacional = ""
    ContaArmazenamento   = "storage"
    GrupoRecurso         = ""
    Regiao               = ""
  }

  validation {
    condition     = length(var.FunctionWebLinux.NomeFunctions) == 0 || length(distinct(var.FunctionWebLinux["NomeFunctions"])) == length(var.FunctionWebLinux["NomeFunctions"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.FunctionWebLinux.NomeFunctions) == 0 || (length(var.FunctionWebLinux.NomeFunctions) > 0 && alltrue([for name in var.FunctionWebLinux.NomeFunctions : length(name) >= 3 && length(name) <= 63]))
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = length(var.FunctionWebLinux.NomeFunctions) == 0 || alltrue([for name in var.FunctionWebLinux.NomeFunctions : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = length(var.FunctionWebLinux.NomeFunctions) == 0 || (var.FunctionWebLinux.NumeroInstancias >= 1 && var.FunctionWebLinux.NumeroInstancias <= 30)
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }

  validation {
    condition     = length(var.FunctionWebLinux.NomeFunctions) == 0 || (length(var.FunctionWebLinux.ContaArmazenamento) >= 3 && length(var.FunctionWebLinux.ContaArmazenamento) <= 24)
    error_message = "O nome do Storage para a Function deve ter entre 3 e 24 caracteres."
  }
}

variable "ServidorMSSql" {
  type = object({
    NomeBancos           = list(string)
    NomeServidor         = string
    UsuarioAdministrador = string
    SenhaAdministrador   = string
    TamanhoMaximoGb      = number
    Linguagem            = string
    Versao               = string
    Regiao               = string
    GrupoRecurso         = string
    TamanhoComputacional = string
  })

  default = {
    NomeBancos           = []
    NomeServidor         = ""
    UsuarioAdministrador = ""
    SenhaAdministrador   = ""
    TamanhoMaximoGb      = 0
    Linguagem            = ""
    Versao               = ""
    Regiao               = ""
    GrupoRecurso         = ""
    TamanhoComputacional = ""
  }

  validation {
    condition     = length(var.ServidorMSSql.NomeBancos) == 0 || length(distinct(var.ServidorMSSql["NomeBancos"])) == length(var.ServidorMSSql["NomeBancos"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.ServidorMSSql.NomeBancos) == 0 || length(var.ServidorMSSql.NomeBancos) > 0 && alltrue([for name in var.ServidorMSSql.NomeBancos : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = length(var.ServidorMSSql.NomeBancos) == 0 || alltrue([for name in var.ServidorMSSql.NomeBancos : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "ServidorMariaDB" {
  type = object({
    NomeBancos             = list(string)
    NomeServidor           = string
    GrupoRecurso           = string
    Linguagem              = string
    ConjuntoCaracteres     = string
    RetencaoBackupDias     = number
    TamanhoComputacional   = string
    TamanhoArmazenamentoMb = number
    UsuarioAdministrador   = string
    SenhaAdministrador     = string
    Versao                 = string
    Regiao                 = string
  })

  default = {
    NomeBancos             = []
    NomeServidor           = ""
    GrupoRecurso           = ""
    Linguagem              = ""
    ConjuntoCaracteres     = ""
    RetencaoBackupDias     = 0
    TamanhoComputacional   = ""
    TamanhoArmazenamentoMb = 0
    UsuarioAdministrador   = ""
    SenhaAdministrador     = ""
    Versao                 = ""
    Regiao                 = ""
  }

  validation {
    condition     = length(var.ServidorMariaDB.NomeBancos) == 0 || length(distinct(var.ServidorMariaDB["NomeBancos"])) == length(var.ServidorMariaDB["NomeBancos"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.ServidorMariaDB.NomeBancos) == 0 || length(var.ServidorMariaDB.NomeBancos) > 0 && alltrue([for name in var.ServidorMariaDB.NomeBancos : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = length(var.ServidorMariaDB.NomeBancos) == 0 || alltrue([for name in var.ServidorMariaDB.NomeBancos : can(regex("^[a-zA-Z0-9_]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "ServidorMySQL" {
  type = object({
    NomeBancos             = list(string)
    NomeServidor           = string
    GrupoRecurso           = string
    Linguagem              = string
    ConjuntoCaracteres     = string
    RetencaoBackupDias     = number
    TamanhoComputacional   = string
    TamanhoArmazenamentoMb = number
    UsuarioAdministrador   = string
    SenhaAdministrador     = string
    Versao                 = string
    Regiao                 = string
  })

  default = {
    NomeBancos             = []
    NomeServidor           = ""
    GrupoRecurso           = ""
    Linguagem              = ""
    ConjuntoCaracteres     = ""
    RetencaoBackupDias     = 0
    TamanhoComputacional   = ""
    TamanhoArmazenamentoMb = 0
    UsuarioAdministrador   = ""
    SenhaAdministrador     = ""
    Versao                 = ""
    Regiao                 = ""
  }

  validation {
    condition     = length(var.ServidorMySQL.NomeBancos) == 0 || length(distinct(var.ServidorMySQL["NomeBancos"])) == length(var.ServidorMySQL["NomeBancos"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.ServidorMySQL.NomeBancos) == 0 || length(var.ServidorMySQL.NomeBancos) > 0 && alltrue([for name in var.ServidorMySQL.NomeBancos : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = length(var.ServidorMySQL.NomeBancos) == 0 || alltrue([for name in var.ServidorMySQL.NomeBancos : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "ServidorPostgreSQL" {
  type = object({
    NomeBancos             = list(string)
    NomeServidor           = string
    Linguagem              = string
    ConjuntoCaracteres     = string
    TamanhoComputacional   = string
    RetencaoBackupDias     = number
    Versao                 = string
    TamanhoArmazenamentoMb = number
    UsuarioAdministrador   = string
    SenhaAdministrador     = string
    GrupoRecurso           = string
    Regiao                 = string
  })

  default = {
    NomeBancos             = []
    NomeServidor           = ""
    Linguagem              = ""
    ConjuntoCaracteres     = ""
    TamanhoComputacional   = ""
    RetencaoBackupDias     = 0
    Versao                 = ""
    TamanhoArmazenamentoMb = 0
    UsuarioAdministrador   = ""
    SenhaAdministrador     = ""
    GrupoRecurso           = ""
    Regiao                 = ""
  }

  validation {
    condition     = length(var.ServidorPostgreSQL.NomeBancos) == 0 || (length(distinct(var.ServidorPostgreSQL["NomeBancos"])) == length(var.ServidorPostgreSQL["NomeBancos"]))
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.ServidorPostgreSQL.NomeBancos) == 0 || (length(var.ServidorPostgreSQL.NomeBancos) > 0 && alltrue([for name in var.ServidorPostgreSQL.NomeBancos : length(name) >= 1 && length(name) <= 128]))
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = length(var.ServidorPostgreSQL.NomeBancos) == 0 || alltrue([for name in var.ServidorPostgreSQL.NomeBancos : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "ContainerArmazenamento" {
  type = object({
    NomeContainers     = list(string)
    ContaArmazenamento = string
    GrupoRecurso       = string
    Regiao             = string
  })

  default = {
    NomeContainers     = []
    ContaArmazenamento = "storage"
    GrupoRecurso       = ""
    Regiao             = ""
  }

  validation {
    condition     = length(var.ContainerArmazenamento.NomeContainers) == 0 || (length(var.ContainerArmazenamento.ContaArmazenamento) >= 3 && length(var.ContainerArmazenamento.ContaArmazenamento) <= 24)
    error_message = "O nome do Storage Account deve ter entre 3 e 24 caracteres."
  }

  validation {
    condition     = length(var.ContainerArmazenamento.NomeContainers) == 0 || (length(distinct(var.ContainerArmazenamento["NomeContainers"])) == length(var.ContainerArmazenamento["NomeContainers"]))
    error_message = "A lista de nomes de container contém valores duplicados."
  }

  validation {
    condition     = length(var.ContainerArmazenamento.NomeContainers) == 0 || can(regex("^[a-z0-9]*$", var.ContainerArmazenamento.ContaArmazenamento))
    error_message = "O nome do Storage Account deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = length(var.ContainerArmazenamento.NomeContainers) == 0 || (length(var.ContainerArmazenamento.NomeContainers) > 0 && alltrue([for name in var.ContainerArmazenamento.NomeContainers : length(name) >= 3 && length(name) <= 63]))
    error_message = "A lista de nomes de contêineres do Storage Account não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = length(var.ContainerArmazenamento.NomeContainers) == 0 || alltrue([for name in var.ContainerArmazenamento.NomeContainers : can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", name))])
    error_message = "Os nomes de contêineres devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'."
  }
}
