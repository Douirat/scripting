pub fn reverse(input: &str) -> String {
    let mut s = String::from("");
   for ch in input.chars().rev() {
       s.push(ch);
   }
    s
}
