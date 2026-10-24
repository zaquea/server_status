
#!/usr/bin/env bash

set -o nounset
set -o pipefail

BASH_PID=$$

show_memory() {
    echo
    echo "===== Memory Usage ====="
    free -h
}

show_disk() {
    echo
    echo "===== Disk Usage ====="
    df -h /
}

show_uptime() {
    echo
    echo "===== Uptime ====="
    uptime
}

show_logical_cpus() {
    echo
    echo "===== Logic CPUs ====="
    nproc
}

show_five_process() {
    echo
    echo "===== 5 process with more CPU usage ====="
    ps -eo pid,comm,%cpu --sort=-%cpu |
    awk -v nome="$BASH_PID" 'NR == 1 || ($2 != "ps" && $2 != "awk" && $1 != nome)' |
    head -n 6
}

show_five_memory() {
    echo
    echo "===== 5 process with more memory usage ====="
    ps -eo pid,comm,%mem --sort=-%mem |
    awk -v nome="$BASH_PID" 'NR == 1 || ($2 != "ps" && $2 != "awk" && $1 != nome)' |
    head -n 6
}

show_memory_details() {
    echo
    echo "===== Memory Details ====="
    grep -E '^(MemTotal|MemAvailable|SwapFree):' /proc/meminfo
}

show_full_memory_details() {
    echo
    echo "===== Full Memory Details ====="
    cat /proc/meminfo
}


main() {
    echo "================================"
    
    if
         [[ ${1:-} != "--full-memory" && $# -gt 0 ]]; then
         echo "CRITICAL ERROR: Argumento inválido"
         echo "================================"
         return 1
    else
         echo "Prosseguindo..."
    fi

    echo "================================"
    echo "================================"
    echo "      SERVER PERFORMANCE STATS"
    echo "================================"
    
    # chamada das funções
    show_memory
    show_disk
    show_uptime
    show_logical_cpus
    show_five_process
    show_five_memory
if
           [[ ${1:-} == "--full-memory" ]]; then
           show_full_memory_details
           echo ""
           echo "SUCESS: Argumento processado com sucesso"
elif
           [[ -z "${1:-}" ]]; then
           show_memory_details
           echo ""
           echo "INFO: Nenhum argumento processado"
fi

} 

main "$@"
