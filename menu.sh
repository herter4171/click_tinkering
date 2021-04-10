YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

show_menu() {
    tput reset

    MENU="$(cat dummy.txt)\n${GREEN}What would you like to do?\n"
    MENU+="--------------------------------------------------------------------------------\n${NC}"
    MENU+="1) Run the simple set locally via Docker Compose [${YELLOW}DO NOT RUN ON A HEAD NODE${NC}]\n"
    MENU+="2) Configure multidim run launch paremeters through Vim\n"
    MENU+="3) Launch cluster jobs for multidim lib gen [${YELLOW}COST EST TO BRANDON IF OVER \$1k${NC}]\n"
    MENU+="4) Build a multidim lib from existing cluster runs\n"
    MENU+="5) Validate mapping of an existing multidim lib\n"
    MENU+="6) Test an existing multidim lib with KP-AGREE\n"
    MENU+="7) Clear out old multidim run directories and library\n"
    MENU+="8) Exit back to shell\n\nChoice: "

    printf "$MENU"
}

process_user_choice() {
    CHOICE=""

    while [ -z $CHOICE ]; do
        show_menu
        read CHOICE

        # Go to top repo dir based on script path
        cd `dirname $0`
        cd `git rev-parse --show-toplevel`
        
        case "$CHOICE" in
        # Simple set
        1) echo $CHOICE
            ;;
        # Configure multidim
        2)  tmux split-window -h "vim test.txt ; exit 0"
            echo $CHOICE
            ;;
        # Launch cluster jobs
        3) tmux split-window -h 'printf "Launching jobs..." ; sleep 10; exit 0'
            ;;
        # Build multidim lib
        4) echo $CHOICE
            ;;
        # Validate multidim lib
        5) echo $CHOICE
            ;;
        # Test multidim lib
        6) echo $CHOICE
            ;;
        # Clear old run dirs and lib
        7) printf "Clearing old run data..."
            ;;
        # Exit
        8)  printf "Exiting\n"
            sleep 0.25
            exit 0
            ;;
        # Recurse until user makes a sensible choice
        *)  printf "${RED}\nChoice \"$CHOICE\" is invalid.  Please choose a numeric menu option"
            for i in {1..5}; do printf "." ; sleep 1; done
            printf "\n\n"

            process_user_choice
            ;;
        esac

        # Keep giving user options until they exit
        process_user_choice
    done
}

if [ $(env | grep -c TMUX) -eq 0 ]; then
    SESS_PFX="genx"
    SESS_NAME=$SESS_PFX
    SESS_IND=1

    while [ $(tmux ls | grep -c $SESS_NAME) -gt 0 ]; do
        SESS_NAME="${SESS_PFX}_${SESS_IND}"
        SESS_IND+=$((SESS_IND+1))
    done

    tmux new-session -s $SESS_NAME /bin/bash $0
else
    process_user_choice
fi