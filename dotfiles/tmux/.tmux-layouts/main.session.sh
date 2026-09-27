session_root ~/mac_env

if initialize_session main; then
	new_window "editor"
	run_cmd 'sleep 0.1'
	run_cmd 'while nvim; do :; done'
	select_pane 0

	new_window "shell"

	new_window "agent"
	run_cmd "pi"
	if [ -d ~/.git ]; then
		split_h 10
		run_cmd "lazygit"
	fi
	select_pane 0

	select_window 3
fi

finalize_and_go_to_session
