# Location der Testgruppe
variable "location" {
  type        = string
  description = "Location der Test-Tag-Resourcengruppen"
  default     = "northeurope"
}

# Tags die z.B. immer gesetzt werden sollen
variable "default_tags" {
  type        = map(string)
  description = "Die Default Tags, die jede Resouce bekommt"
  # Default Werte, falls keine Werte explizit gesetzt werden  
  default = {
    Konstenstelle = "Kostenstelle-Default",
    Besitzer      = "Beitzer-Default",
    Team          = "Team-Default"
  }
}

# Tads die z.B. nur in der Prod-Umgebung gesetzt werden
variable "prod_tags" {
  type        = map(string)
  description = "Die Default Tags, die jede PROD Resouce bekommt"
  # Default Werte, falls keine Werte explizit gesetzt werden  
  default = {
    Produktionsdatum    = "01.01.2021-Default",
    Produktionsumgebung = "Umgebung-Default",
    Sicherheitsstufe    = "SecStufe-Default"
  }
}

# Zusätzliche einzelne Tags
variable "spezial_tag" {
  type        = string
  description = "Ein zusätzlicher Tag"
  default     = "Defaul-Spezial-Tag"
}
variable "extra_tag" {
  type        = string
  description = "Ein zusätzlicher Tag"
  default     = "Defaul-Extra-Tag"
}
