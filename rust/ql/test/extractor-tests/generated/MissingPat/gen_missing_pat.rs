// generated by codegen, do not edit

fn test_missing_pat() -> () {
    // A missing pattern, used as a place holder for incomplete syntax.
    match Some(42) {
        .. => "bad use of .. syntax",
    };
}
