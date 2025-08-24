byond_fn!(fn test_rust_stuff(input) -> Result<String> {
    match input {
        None => Err("input is empty"),
        Some(value) if value.is_empty() => Err("input is empty"),
        Some(value) => Ok(format!("{} good", value)),
    }
});
