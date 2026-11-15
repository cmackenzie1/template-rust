fn main() {
    println!("{}", hello("world"));
}

fn hello(name: &str) -> String {
    format!("Hello, {name}!")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn greets() {
        assert_eq!(hello("world"), "Hello, world!");
    }
}
