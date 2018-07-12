session=tct
work_dir=/codes/skydata/tct_service

tmux has-session -t $session
if [ $? != 0 ]
then
    #window1: git
    tmux new-session -s $session -n git -d
    tmux send-keys -t $session:1 "cd $work_dir" C-m

    #window2: vim
    tmux new-window -a -n vim -t $session
    tmux send-keys -t $session:2 'vim' C-m
    tmux send-keys -t $session:2 ":Cdtctservice" C-m

    #window 3: tct-ui
    tmux new-window -a -n tct-ui-git -t $session
    tmux send-keys -t $session:3 "cd /codes/skydata/tct_ui" c-m

    #window 4: tct-ui
    tmux new-window -a -n tct-ui-vim -t $session
    tmux send-keys -t $session:4 'vim' c-m
    tmux send-keys -t $session:4 ":Cdtctui " c-m

    #window 5: ui npm
    tmux new-window -a -n tct-ui-npm -t $session
    tmux split-window -h -t $session:5
    tmux send-keys -t $session:5.1 "cd /codes/skydata/tct_ui" c-m "npm run dev" c-m
    tmux send-keys -t $session:5.2 "cd /codes/skydata/tct_ui" c-m "./deploy/rsync_250.sh"

    #window 6: 240 server
    tmux new-window -a -n ssh@240 -t $session
    tmux split-window -v -t $session:6
    tmux send-keys -t "$session":6.1 "ssh root@192.168.50.240" c-m  "cd /SkyAXE/cephfs/tct" c-m

    tmux split-window -h -t $session:6.2
    tmux send-keys -t "$session":6.2 "ssh root@192.168.50.240" c-m  "ssh root@10.0.0.14" c-m
    tmux send-keys -t "$session":6.3 "ssh root@192.168.50.240" c-m  "ssh root@10.0.0.15" c-m

    #window 7: 240-gpu-monitor
    tmux new-window -a -n 240-gpu -t $session
    tmux split-window -v -t $session:7
    tmux send-keys -t "$session":7.1 "ssh root@192.168.50.240" c-m  "ssh root@10.0.0.16" c-m  "watch -n 3 nvidia-smi" c-m

    tmux split-window -h -t $session:7.2
    tmux send-keys -t "$session":7.2 "ssh root@192.168.50.240" c-m  "ssh root@10.0.0.14" c-m "watch -n 3 nvidia-smi" c-m
    tmux send-keys -t "$session":7.3 "ssh root@192.168.50.240" c-m  "ssh root@10.0.0.15" c-m "watch -n 3 nvidia-smi" c-m
fi

tmux attach -t $session -c $work_dir


