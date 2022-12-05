variable "token" {
    description = "DO Token"
    type = string
    sensitive = true
}

variable "ssh_keys"{
    description = "SSH keys for DO"
    type = list
    sensitive = true
}