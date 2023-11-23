locals {
  create_virtual_network = (
    length(var.MaquinaVirtualEC2["NomeInstancias"]) > 0 ||
    length(var.GrupoAutoScalarEC2["NomeGrupo"]) > 0 ||
    length(var.ServicoBancoRelacional.NomeBancos) > 0
  ) ? 1 : 0
}

variable "MaquinaVirtualEC2" {
  type = object({
    NomeInstancias           = list(string)
    ImagemSistemaOperacional = string
    TipoInstancia            = string
    Regiao                   = string
    NomeUsuario              = string
    SenhaUsuario             = string
  })

  default = {
    NomeInstancias           = []
    ImagemSistemaOperacional = ""
    TipoInstancia            = ""
    Regiao                   = ""
    NomeUsuario              = ""
    SenhaUsuario             = ""
  }

  validation {
    condition     = length(var.MaquinaVirtualEC2.NomeInstancias) == 0 || length(distinct(var.MaquinaVirtualEC2["NomeInstancias"])) == length(var.MaquinaVirtualEC2["NomeInstancias"])
    error_message = "A lista de nomes contém valores duplicados"
  }

  validation {
    condition     = length(var.MaquinaVirtualEC2.NomeInstancias) == 0 || length(var.MaquinaVirtualEC2.NomeInstancias) > 0 && length(var.MaquinaVirtualEC2.NomeInstancias) <= 32
    error_message = "O número de instancias deve ser entre 1 a 32 instancias"
  }

  validation {
    condition     = length(var.MaquinaVirtualEC2.NomeInstancias) == 0 || length(var.MaquinaVirtualEC2.ImagemSistemaOperacional) >= 3
    error_message = "Consulte a documentação para saber mais sobre Imagem para o Sistema Operacional das EC2: \n\nhttps://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html"
  }

  validation {
    condition     = length(var.MaquinaVirtualEC2.NomeInstancias) == 0 || can(regex("^[a-z0-9]{2,}\\.[a-z0-9]{2,}$", var.MaquinaVirtualEC2.TipoInstancia))
    error_message = "O formato do tipo da instância EC2 não é válido. \nDeve seguir o padrão de letras minúsculas, números e um ponto, com dois ou mais caracteres em cada lado."
  }

  validation {
    condition     = length(var.MaquinaVirtualEC2.NomeInstancias) == 0 || alltrue([for name in var.MaquinaVirtualEC2.NomeInstancias : length(name) >= 3 && length(name) <= 128])
    error_message = "Cada nome deve ter entre 3 e 128 caracteres"
  }
}

variable "ArmazenamentoS3" {
  type = object({
    NomeBuckets = list(string)
  })

  default = {
    NomeBuckets = []
  }

  validation {
    condition     = length(var.ArmazenamentoS3.NomeBuckets) == 0 || length(distinct(var.ArmazenamentoS3["NomeBuckets"])) == length(var.ArmazenamentoS3["NomeBuckets"])
    error_message = "A lista de nomes contém valores duplicados"
  }

  validation {
    condition     = length(var.ArmazenamentoS3.NomeBuckets) == 0 || alltrue([for name in var.ArmazenamentoS3.NomeBuckets : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres"
  }

  validation {
    condition     = length(var.ArmazenamentoS3.NomeBuckets) == 0 || alltrue([for name in var.ArmazenamentoS3.NomeBuckets : can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", name))])
    error_message = "Os nomes dos bucket devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'"
  }
}

variable "ServicoBancoRelacional" {
  type = object({
    #create               = bool
    NomeBancos           = list(string)
    ArmazenamentoAlocado = number
    Mecanismo            = string
    MecanismoVersao      = string
    TipoInstancia        = string
    NomeUsuario          = string
    SenhaUsuario         = string
    GrupoParametro       = string
    Regiao               = string
  })

  default = {
    NomeBancos           = []
    ArmazenamentoAlocado = 0
    Mecanismo            = ""
    MecanismoVersao      = ""
    TipoInstancia        = ""
    NomeUsuario          = ""
    SenhaUsuario         = ""
    GrupoParametro       = ""
    Regiao               = ""
  }

  validation {
    condition     = length(var.ServicoBancoRelacional.NomeBancos) == 0 || length(distinct(var.ServicoBancoRelacional.NomeBancos)) == length(var.ServicoBancoRelacional.NomeBancos)
    error_message = "A lista de nomes contém valores duplicados"
  }

  validation {
    condition     = length(var.ServicoBancoRelacional.NomeBancos) == 0 || alltrue([for name in var.ServicoBancoRelacional.NomeBancos : length(name) >= 3 && length(name) <= 60])
    error_message = "Cada nome deve ter entre 3 e 60 caracteres"
  }

  validation {
    condition     = length(var.ServicoBancoRelacional.NomeBancos) == 0 || alltrue([for name in var.ServicoBancoRelacional.NomeBancos : can(regex("^[a-z0-9]*$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas e números"
  }
}

variable "BancoAthena" {
  type = object({
    NomeBancos = list(string)
    NomeBucket = string
  })

  default = {
    NomeBancos = []
    NomeBucket = "bucket"
  }

  validation {
    condition     = length(var.BancoAthena.NomeBancos) == 0 || length(var.BancoAthena.NomeBucket) >= 3 && length(var.BancoAthena.NomeBucket) <= 63
    error_message = "O nome do Bucket deve conter entre 3 a 63 caracteres"
  }

  validation {
    condition     = length(var.BancoAthena.NomeBancos) == 0 || can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.BancoAthena.NomeBucket))
    error_message = "Os nome do bucket deve conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'"
  }

  validation {
    condition     = length(var.BancoAthena.NomeBancos) == 0 || length(distinct(var.BancoAthena.NomeBancos)) == length(var.BancoAthena.NomeBancos)
    error_message = "A lista de nomes contém valores duplicados"
  }

  validation {
    condition     = length(var.BancoAthena.NomeBancos) == 0 || alltrue([for name in var.BancoAthena.NomeBancos : length(name) >= 3 && length(name) <= 32])
    error_message = "Cada nome deve ter entre 3 e 32 caracteres"
  }

  validation {
    condition     = length(var.BancoAthena.NomeBancos) == 0 || alltrue([for name in var.BancoAthena.NomeBancos : can(regex("^[a-z0-9_]*$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '_'"
  }
}

variable "AplicacaoContainer" {
  type = object({
    NomeAplicacoes  = list(string)
    ImagemContainer = string
    Porta           = string
    TipoRepositorio = string
  })

  default = {
    NomeAplicacoes  = []
    ImagemContainer = ""
    Porta           = ""
    TipoRepositorio = ""
  }

  validation {
    condition     = length(var.AplicacaoContainer.NomeAplicacoes) == 0 || alltrue([for name in var.AplicacaoContainer.NomeAplicacoes : length(name) >= 3 && length(name) <= 40])
    error_message = "Cada nome deve ter entre 3 e 40 caracteres"
  }

  validation {
    condition     = length(var.AplicacaoContainer.NomeAplicacoes) == 0 || alltrue([for name in var.AplicacaoContainer.NomeAplicacoes : can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]*$", name))])
    error_message = "Os nomes dos runner devem conter apenas letras minúsculas, números e os caracteres: '-' e '_'; também não deve iniciar com '-' ou '_'"
  }
}

variable "ServicoAplicacaoBeanstalk" {
  type = object({
    NomeAplicacoes = list(string)
  })

  default = {
    NomeAplicacoes = []
  }

  validation {
    condition     = length(var.ServicoAplicacaoBeanstalk.NomeAplicacoes) == 0 || alltrue([for name in var.ServicoAplicacaoBeanstalk.NomeAplicacoes : can(regex("^[a-zA-Z0-9_-]*$", name))])
    error_message = "Os nomes dos application devem conter apenas letras minúsculas, números e os caracteres: '-' e '_'"
  }

  validation {
    condition     = length(var.ServicoAplicacaoBeanstalk.NomeAplicacoes) == 0 || (alltrue([for name in var.ServicoAplicacaoBeanstalk.NomeAplicacoes : length(name) >= 3 && length(name) <= 100]))
    error_message = "Cada nome deve ter entre 3 e 100 caracteres"
  }
}

variable "GrupoAutoScalarEC2" {
  type = object({
    NomeGrupo                = string
    ImagemSistemaOperacional = string
    TipoInstancia            = string
    MinimoInstancia          = number
    MaximoInstancia          = number
    Regiao                   = string
  })

  default = {
    NomeGrupo                = ""
    ImagemSistemaOperacional = ""
    TipoInstancia            = ""
    MinimoInstancia          = 0
    MaximoInstancia          = 0
    Regiao                   = ""
  }

  validation {
    condition     = length(var.GrupoAutoScalarEC2.NomeGrupo) == 0 || (var.GrupoAutoScalarEC2.MaximoInstancia >= 0 && var.GrupoAutoScalarEC2.MaximoInstancia <= 32)
    error_message = "O número máximo de instancias do Grupo AutoScaling deve ser entre 0 a 32 instancias"
  }

  validation {
    condition     = length(var.GrupoAutoScalarEC2.NomeGrupo) == 0 || (var.GrupoAutoScalarEC2.MinimoInstancia >= 0 && var.GrupoAutoScalarEC2.MinimoInstancia <= var.GrupoAutoScalarEC2.MaximoInstancia)
    error_message = "O número mínimo de instancias do Grupo AutoScaling deve ser maior que 0 e menor que o número máximo"
  }
}
