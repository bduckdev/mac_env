session_root "${SESSION_DIR}"

SESSION_NAME=$(basename "$SESSION_DIR" | tr '. ' '__')

if initialize_session "${SESSION_NAME}"; then
	new_window "editor"
	run_cmd "exec zsh -f -c 'while nvim; do true; done'"
	select_pane 0

	new_window "shell"

	new_window "agent"
	run_cmd "pi"
	select_pane 0

	select_window 3
fi

finalize_and_go_to_session
