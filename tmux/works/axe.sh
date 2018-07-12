session=axe
work_dir=/codes/skydata/axe

tmux has-session -t $session
if [ $? != 0 ]
then
    #window1: git
    tmux new-session -s $session -n git -d
    tmux send-keys -t $session:1 "cd $work_dir" C-m

    #window2: axe-vim
    tmux new-window -n vim -t $session
    tmux send-keys -t $session:2 'vim' C-m
    tmux send-keys -t $session:2 ":Cdaxe" C-m

    #window3: 24 server
    echo "server 24 window"
    log_dir="/web/axe/logs"
    tmux new-window -n log@24 -t $session
    tmux split-window -v -t $session:3 -p 30
    tmux send-keys -t "$session":3.1 "ssh taas@10.0.2.24" c-m  "tail -F $log_dir/debug.log" c-m
    tmux split-window -h -t $session:3.1
    tmux send-keys -t "$session":3.2 "ssh taas@10.0.2.24" c-m  "tail -F $log_dir/exception.log" c-m

    tmux split-window -h -t $session:3.3
    tmux send-keys -t "$session":3.3 "ssh taas@10.0.2.24" c-m  "tail -F $log_dir/gunicorn.log" c-m
    tmux send-keys -t "$session":3.4 "ssh taas@10.0.2.24" c-m  "tail -F $log_dir/*.log" c-m

    #window 4: auto-deploy
    tmux new-window -n auto-deploy-git -t $session
    tmux split-window -h -t $session:4
    tmux send-keys -t "$session":4.1 "cd /codes/skydata/auto-deploy" c-m
    tmux send-keys -t "$session":4.2 "docker exec -it auto-deploy /bin/bash" c-m "cd /codes/skydata/auto-deploy/" c-m

    #window 5: auto-deploy-vim
    tmux new-window -n auto-deploy-vim -t $session
    tmux send-keys -t $session:5 "vim" c-m ":Cdautodeploy" C-m
fi

tmux attach -t $session -c $work_dir


