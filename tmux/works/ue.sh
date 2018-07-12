session=ue
work_dir=/codes/github/UnrealEngine/

tmux has-session -t $session
if [ $? != 0 ]
then
    #window1: git
    tmux new-session -s $session -n git -d
    tmux send-keys -t $session:1 "cd $work_dir" C-m

    #window2: ag
    tmux new-window -a -n ag -t $session
    tmux send-keys -t $session:2 "cd $work_dir/Engine/Source/Runtime" c-m

    #window3: vim
    tmux new-window -a -n vim -t $session
    tmux send-keys -t $session:3 "cd $work_dir/Engine/Source/Runtime" c-m 'vim' c-m
fi

tmux attach -t $session -c $work_dir


