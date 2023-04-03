variable "myVar" {
    type = string
    default = "Hello World"
}

variable "myMap" {
    type = map(any)

    default = {
        "name" : "leedonggyu"
        "age" : 30,
        "job" : "developer"
    }
}

variable "myList" {
    type = list
    default = [1,2,3]
}