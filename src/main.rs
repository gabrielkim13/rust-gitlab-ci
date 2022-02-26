fn main() {
    let hello = get_hello("world");

    println!("{}", hello);
}

fn get_hello(who: &str) -> String {
    format!("Hello, {}!", who)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hello() {
        let hello = get_hello("test");

        assert_eq!(hello, "Hello, test!");
    }
}
