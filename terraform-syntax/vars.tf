variable "name" {
    default = "leedonggyu"
}

variable "friends" {
  type = map(string)

    default= {
        "leedonggyu" ="backend developer",
        "limjeahyock" = "frontend developer",
        "sinjunghyeon" = "police",
        "kimhyeonchoel" = "police"
    }
}

variable "langs" {
    type = list(string)

    default = [ "typescript","golang", "c++"]
}