variable "env"  { default = "dev" }
variable "project"          { default = "my"         }
variable "storage"                                      { default = "20"                                        }
#variable "max_allocated_storage" { default = "100" }
variable "type"                                                 { default = "gp2"                                       }
variable "dbengine"                                             { default = "postgres"                          }
variable "dbengine_ver"                                 { default = "14"                                     }
variable "db_parameter_group_name"      { default = "default.postgres14"       }
variable "port"                                                 { default = "5432"                                      }
variable "multi_az"                                     { default = "false"                                      }
variable "backup_retention_period"      { default = "0"                                          }

variable "dbname"                                               { default = "myappdb"                           }
variable "username"                                     { default = "myuser"                           }
variable "password"                                     { default = "Mypassword"                        }
variable "vpc"       { default = "vpc-0ca3293aa0a11b4bf" }
#variable "dbsubnet"  { 
#type        = list(string)
#default = ["subnet-02d9d493ce59fb57e,subnet-0b730c30c1a506b53"] 
#}
variable "instance_type"                                { default = "db.t3.micro"                                          }

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
  default     = ["subnet-0bbfe5f59e12b08d6","subnet-0111fbe2cc685390a"]
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

## added else while destroying it is an issue ##
variable "skip_final_snapshot" {default = true}
#variable "final_snapshot_identifier" {default = true}
