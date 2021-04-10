YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

show_menu() {
    MENU="$(cat dummy.txt)\nWhat would you like to do?\n"
    MENU+="--------------------------------------------------------------------------------\n"
    MENU+="1) Run the simple set [${YELLOW}DO NOT RUN ON A HEAD NODE${NC}]\n"
    MENU+="2) Configure multidim run launch paremeters\n"
    MENU+="3) Launch cluster jobs for multidim lib gen [${YELLOW}COST EST TO BRANDON IF OVER \$1k${NC}]\n"
    MENU+="4) Build a multidim lib from existing cluster runs\n"
    MENU+="5) Validate mapping of an existing multidim lib\n"
    MENU+="6) Test an existing multidim lib with KP-AGREE\n"
    MENU+="7) Exit back to shell\n\nChoice: "

    printf "$MENU"
}

process_user_choice() {
    CHOICE=""

    while [ -z $CHOICE ]; do
        show_menu
        read CHOICE

        case "$CHOICE" in
        # Simple set
        1) echo $CHOICE
            ;;
        # Configure multidim
        2)  vim test.txt
            echo $CHOICE
            ;;
        # Launch cluster jobs
        3) echo $CHOICE
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
        # Exit
        7)  printf "Exiting\n"
            exit 0
            ;;
        # Recurse until user makes a sensible choice
        *)  printf "${RED}\nInvalid choice.  Please choose a numeric menu option"
            for i in {1..5}; do printf "." ; sleep 1; done
            printf "\n\n"

            process_user_choice
            ;;
        esac

        # Keep giving user options until they exit
        process_user_choice
    done
}

process_user_choice