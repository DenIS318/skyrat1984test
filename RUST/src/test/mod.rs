byond_fn!(fn test_rust_stuff(input) {
    Some(format!("{}{}", input, " good"))
    // match input {
    //     None => "input is empty",
    //     Some(value) if value.is_empty() => "input is empty",
    //     Some(value) => value + " good",
    // }
});
