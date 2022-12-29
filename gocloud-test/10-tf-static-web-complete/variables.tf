variable "website-domain-main" {
  description = "Main website domain, e.g. prafect.link"
  type        = string
  default     = "prafect.link"
}
variable "website-domain-redirect" {
  description = "Secondary FQDN that will redirect to the main URL (e.g., www.prafect.link)"
  default     = null
  type        = string
}

variable "domains-zone-root" {
  description = "Root zone under which the domains should be registered"
  type        = string
  default     = null
}
variable "website-additional-domains" {
  description = "Main website additional domains (e.g., additional.prafect.link) that don't need redirection"
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "Tags added to resources"
  default     = {}
  type        = map(string)
}
variable "prafuls-web" {
  description = "Support prafuls web (Single-Page Application) website with redirect to index.html"
  default     = false
  type        = bool
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "alias" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "web_file" {
  type        = string
  description = "Path to the root of website content"
  default     = "./webfiles"
}