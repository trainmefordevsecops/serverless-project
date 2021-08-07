variable "env"  { default = "dev" }
variable "project"          { default = "my"         }
variable "storage"                                      { default = "20"                                        }
#variable "max_allocated_storage" { default = "100" }
variable "type"                                                 { default = "gp2"                                       }
variable "dbengine"                                             { default = "postgres"                          }
variable "dbengine_ver"                                 { default = "9.6.6"                                     }
variable "db_parameter_group_name"      { default = "default.postgres9.6"       }
variable "port"                                                 { default = "5432"                                      }
variable "multi_az"                                     { default = "false"                                      }
variable "backup_retention_period"      { default = "0"                                          }

variable "dbname"                                               { default = "myappdb"                           }
variable "username"                                     { default = "myuser"                           }
variable "password"                                     { default = "Mypassword"                        }
variable "vpc"       { default = "zzz" }
#variable "dbsubnet"  { 
#type        = list(string)
#default = ["subnet-06054b2d323548f95,subnet-0b4c816acef20d2d0"] 
#}
variable "instance_type"                                { default = "db.t2.micro"                                          }

variable "create" {
  description = "Whether to create this resource or not?"
  default     = true
}

#variable "identifier" {
#  description = "The identifier of the resource"
#  name = "mydb"
#}

variable "subnet_ids" {
  type        = "list"
  description = "A list of VPC subnet IDs"
  default     = ["zzz","zzz"]
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the resource"
  default     = {}
}
