terraform {
  required_version = ">=0.14.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Beispiel 1 -> Default Tags
resource "azurerm_resource_group" "rg1" {
  location = var.location
  name     = "tftest-testtags-1-rg"
  tags     = var.default_tags # Default Tags
}

# Beispiel 2 -> Default Tags und Prod Tags
resource "azurerm_resource_group" "rg2" {
  location = var.location
  name     = "tftest-testtags-2-rg"
  tags     = merge(var.default_tags, var.prod_tags) # Default Tags + Prod Tags
  # merge() fügt die beiden map-variablen zu einer zusammen
}

# Beispiel 3 -> Default Tags mit Zusatz Tags
resource "azurerm_resource_group" "rg3" {
  location = var.location
  name     = "tftest-testtags-3-rg"
  # "map()" wandelt die zusätzlichen Tags ("Spezial Tag" und "Extra Tag") in ein key-value pair
  # "merge()" fügt mehrere "maps" zusammen
  tags = merge(map(
    "Spezial Tag", "Spezial Wert", # Zusatz Tag 1
    "Extrag Tag", "Extra Wert"),   # Zusatz Tag 2
    var.default_tags,              # Default Tags
  var.prod_tags)                   # Prod Tags              
}

# Beispiel 4 -> Default Tags mit Zusatz Tags die variabel sind
resource "azurerm_resource_group" "rg4" {
  location = var.location
  name     = "tftest-testtags-4-rg"
  # Ein Beispiel wie man die Tags noch variabler machen kann
  tags = merge(map(
    "Spezial Tag", var.spezial_tag,          # Variable direk
    "Extrag Tag", "Super ${var.extra_tag}"), # Variable in einem String
    var.default_tags,                        # Default Tags
  var.prod_tags)                             # Prod Tags     
}
