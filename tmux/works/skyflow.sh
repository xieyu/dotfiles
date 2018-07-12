session=skyflow
work_dir=/codes/skydata/axe

tmux has-session -t $session
if [ $? != 0 ]
then
    #window1: git
    tmux new-session -s $session -n git -d
    tmux send-keys -t $session:1 "cd $work_dir" C-m

    #window2: vim
    tmux new-window -a -n vim -t $session
    tmux send-keys -t $session:2 "cd $work_dir" c-m 'vim' c-m
    tmux send-keys -t $session:2 ":Cdaxe" C-m

    #window 3: local server
    tmux new-window -a -n local -t $session
    tmux split-window -h -t $session:3
    tmux send-keys -t $session:3.1 "cd $work_dir" c-m "export SKYDATA_AXE_CONFIG=/codes/skydata/axe/configs/test/config.py" c-m "python2 src/manage.py runserver -p 9200" c-m 
    tmux send-keys -t $session:3.2 "cd $work_dir" c-m "tail -F logs/*.log"
fi

tmux -CC attach -t $session -c $work_dir


