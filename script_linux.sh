#!/bin/bash

LANG="en"

declare -A MESSAGES

MESSAGES["en", "script_start"]="Starting security threat detection script..."
MESSAGES["en", "report_file_info"]="Report will be saved to"
MESSAGES["en", "backdoor_rootkit_detection"]="--- 1. Backdoor and Rootkit Detection ---"
MESSAGES["en", "chkrootkit_not_installed"]="chkrootkit is not installed. Installing..."
MESSAGES["en", "running_chkrootkit"]="Running chkrootkit..."
MESSAGES["en", "rkhunter_not_installed"]="rkhunter is not installed. Installing..."
MESSAGES["en", "updating_rkhunter_db"]="Updating rkhunter database..."
MESSAGES["en", "running_rkhunter"]="Running rkhunter..."
MESSAGES["en", "eavesdropping_detection"]="--- 2. Eavesdropping/Monitoring Detection ---"
MESSAGES["en", "promiscuous_mode_detection"]="Detecting interfaces in promiscuous mode..."
MESSAGES["en", "net_tools_not_installed"]="net-tools is not installed. Installing..."
MESSAGES["en", "displaying_connections"]="Displaying established network connections and listening ports..."
MESSAGES["en", "mitm_detection"]="--- 3. Man-in-the-Middle (MITM) Detection ---"
MESSAGES["en", "checking_arp_cache"]="Checking ARP cache..."
MESSAGES["en", "checking_dns_resolvers"]="Checking DNS resolvers..."
MESSAGES["en", "script_complete"]="Security threat detection script completed."
MESSAGES["en", "about_title"]="--- ABOUT THIS SCRIPT ---"
MESSAGES["en", "about_content"]="This script is designed to detect signs of backdoors, eavesdropping, and MITM attacks on Linux systems. It leverages standard tools like chkrootkit, rkhunter, netstat, and arp. It also demonstrates basic Bash scripting capabilities such as variable assignment, conditional statements (if), loops (for/while - though not explicitly used in main logic, they are fundamental), function definitions, and command execution. Bash is a powerful shell and scripting language for automating tasks and managing processes on Unix-like operating systems."
MESSAGES["en", "usage_info"]="Usage: $0 [-l <lang>] [-a]"
MESSAGES["en", "lang_option"]="  -l <lang>  : Set language (en, zh, pt_BR, ja). Default is en."
MESSAGES["en", "about_option"]="  -a         : Display information about this script and Bash."
MESSAGES["en", "conclusion_backdoor_rootkit"]="Conclusion: Review the chkrootkit and rkhunter outputs carefully for any 'Warning' or 'Infected' statuses. These tools are crucial for identifying hidden malicious software."
MESSAGES["en", "warning_backdoor_rootkit"]="Warning: False positives can occur. Always cross-reference findings with other security measures and investigate suspicious entries manually."
MESSAGES["en", "conclusion_eavesdropping"]="Conclusion: Check for any interfaces in promiscuous mode that are not intentionally configured. Analyze listening ports and established connections for unknown or unauthorized services/processes."
MESSAGES["en", "warning_eavesdropping"]="Warning: Unrecognized network activity could indicate malware or unauthorized monitoring. Prompt investigation is recommended."
MESSAGES["en", "conclusion_mitm"]="Conclusion: Examine ARP cache for duplicate or unusual MAC-IP mappings. Verify DNS resolvers against trusted sources to ensure no redirection is occurring."
MESSAGES["en", "warning_mitm"]="Warning: Anomalies in ARP or DNS settings are strong indicators of potential MITM attacks. Immediate action is advised."

MESSAGES["zh", "script_start"]="正在启动安全威胁检测脚本..."
MESSAGES["zh", "report_file_info"]="报告将保存到"
MESSAGES["zh", "backdoor_rootkit_detection"]="--- 1. 后门和Rootkit检测 ---"
MESSAGES["zh", "chkrootkit_not_installed"]="chkrootkit 未安装。正在安装..."
MESSAGES["zh", "running_chkrootkit"]="正在运行 chkrootkit..."
MESSAGES["zh", "rkhunter_not_installed"]="rkhunter 未安装。正在安装..."
MESSAGES["zh", "updating_rkhunter_db"]="正在更新 rkhunter 数据库..."
MESSAGES["zh", "running_rkhunter"]="正在运行 rkhunter..."
MESSAGES["zh", "eavesdropping_detection"]="--- 2. 窃听/监控检测 ---"
MESSAGES["zh", "promiscuous_mode_detection"]="正在检测混杂模式下的接口..."
MESSAGES["zh", "net_tools_not_installed"]="net-tools 未安装。正在安装..."
MESSAGES["zh", "displaying_connections"]="正在显示已建立的网络连接和监听端口..."
MESSAGES["zh", "mitm_detection"]="--- 3. 中间人 (MITM) 检测 ---"
MESSAGES["zh", "checking_arp_cache"]="正在检查 ARP 缓存..."
MESSAGES["zh", "checking_dns_resolvers"]="正在检查 DNS 解析器..."
MESSAGES["zh", "script_complete"]="安全威胁检测脚本完成。"
MESSAGES["zh", "about_title"]="--- 关于此脚本 ---"
MESSAGES["zh", "about_content"]="此脚本旨在检测 Linux 系统上的后门、窃听和 MITM 攻击迹象。它利用 chkrootkit、rkhunter、netstat 和 arp 等标准工具。它还演示了基本的 Bash 脚本功能，例如变量赋值、条件语句 (if)、循环 (for/while - 尽管在主要逻辑中没有明确使用，但它们是基础)、函数定义和命令执行。Bash 是一个强大的 shell 和脚本语言，用于在类 Unix 操作系统上自动化任务和管理进程。"
MESSAGES["zh", "usage_info"]="用法: $0 [-l <lang>] [-a]"
MESSAGES["zh", "lang_option"]="  -l <lang>  : 设置语言 (en, zh, pt_BR, ja)。默认为 en。"
MESSAGES["zh", "about_option"]="  -a         : 显示有关此脚本和 Bash 的信息。"
MESSAGES["zh", "conclusion_backdoor_rootkit"]="结论：仔细检查 chkrootkit 和 rkhunter 的输出，看是否有任何“警告”或“已感染”状态。这些工具对于识别隐藏的恶意软件至关重要。"
MESSAGES["zh", "warning_backdoor_rootkit"]="警告：可能会出现误报。始终将发现与其他安全措施进行交叉引用，并手动调查可疑条目。"
MESSAGES["zh", "conclusion_eavesdropping"]="结论：检查是否有任何未故意配置的接口处于混杂模式。分析监听端口和已建立的连接，以查找未知或未经授权的服务/进程。"
MESSAGES["zh", "warning_eavesdropping"]="警告：无法识别的网络活动可能表明存在恶意软件或未经授权的监控。建议立即调查。"
MESSAGES["zh", "conclusion_mitm"]="结论：检查 ARP 缓存中是否存在重复或异常的 MAC-IP 映射。根据受信任的来源验证 DNS 解析器，以确保没有发生重定向。"
MESSAGES["zh", "warning_mitm"]="警告：ARP 或 DNS 设置中的异常是潜在 MITM 攻击的强烈指标。建议立即采取行动。"

MESSAGES["pt_BR", "script_start"]="Iniciando script de detecção de ameaças de segurança..."
MESSAGES["pt_BR", "report_file_info"]="O relatório será salvo em"
MESSAGES["pt_BR", "backdoor_rootkit_detection"]="--- 1. Detecção de Backdoor e Rootkit ---"
MESSAGES["pt_BR", "chkrootkit_not_installed"]="chkrootkit não está instalado. Instalando..."
MESSAGES["pt_BR", "running_chkrootkit"]="Executando chkrootkit..."
MESSAGES["pt_BR", "rkhunter_not_installed"]="rkhunter não está instalado. Instalando..."
MESSAGES["pt_BR", "updating_rkhunter_db"]="Atualizando banco de dados do rkhunter..."
MESSAGES["pt_BR", "running_rkhunter"]="Executando rkhunter..."
MESSAGES["pt_BR", "eavesdropping_detection"]="--- 2. Detecção de Escuta/Monitoramento ---"
MESSAGES["pt_BR", "promiscuous_mode_detection"]="Detectando interfaces em modo promíscuo..."
MESSAGES["pt_BR", "net_tools_not_installed"]="net-tools não está instalado. Instalando..."
MESSAGES["pt_BR", "displaying_connections"]="Exibindo conexões de rede estabelecidas e portas de escuta..."
MESSAGES["pt_BR", "mitm_detection"]="--- 3. Detecção de Man-in-the-Middle (MITM) ---"
MESSAGES["pt_BR", "checking_arp_cache"]="Verificando cache ARP..."
MESSAGES["pt_BR", "checking_dns_resolvers"]="Verificando resolvedores DNS..."
MESSAGES["pt_BR", "script_complete"]="Script de detecção de ameaças de segurança concluído."
MESSAGES["pt_BR", "about_title"]="--- SOBRE ESTE SCRIPT ---"
MESSAGES["pt_BR", "about_content"]="Este script foi projetado para detectar sinais de backdoors, escuta e ataques MITM em sistemas Linux. Ele utiliza ferramentas padrão como chkrootkit, rkhunter, netstat e arp. Ele também demonstra recursos básicos de script Bash, como atribuição de variáveis, instruções condicionais (if), loops (for/while - embora não explicitamente usados na lógica principal, são fundamentais), definições de funções e execução de comandos. Bash é um poderoso shell e linguagem de script para automatizar tarefas e gerenciar processos em sistemas tipo Unix."
MESSAGES["pt_BR", "usage_info"]="Uso: $0 [-l <lang>] [-a]"
MESSAGES["pt_BR", "lang_option"]="  -l <lang>  : Definir idioma (en, zh, pt_BR, ja). O padrão é en."
MESSAGES["pt_BR", "about_option"]="  -a         : Exibir informações sobre este script e o Bash."
MESSAGES["pt_BR", "conclusion_backdoor_rootkit"]="Conclusão: Revise cuidadosamente as saídas do chkrootkit e do rkhunter para quaisquer status de 'Aviso' ou 'Infectado'. Essas ferramentas são cruciais para identificar softwares maliciosos ocultos."
MESSAGES["pt_BR", "warning_backdoor_rootkit"]="Aviso: Falsos positivos podem ocorrer. Sempre faça referência cruzada aos achados com outras medidas de segurança e investigue entradas suspeitas manualmente."
MESSAGES["pt_BR", "conclusion_eavesdropping"]="Conclusão: Verifique se há interfaces em modo promíscuo que não estejam configuradas intencionalmente. Analise as portas de escuta e as conexões estabelecidas para serviços/processos desconhecidos ou não autorizados."
MESSAGES["pt_BR", "warning_eavesdropping"]="Aviso: Atividade de rede não reconhecida pode indicar malware ou monitoramento não autorizado. A investigação imediata é recomendada."
MESSAGES["pt_BR", "conclusion_mitm"]="Conclusão: Examine o cache ARP para mapeamentos MAC-IP duplicados ou incomuns. Verifique os resolvedores DNS em relação a fontes confiáveis para garantir que nenhuma redireção esteja ocorrendo."
MESSAGES["pt_BR", "warning_mitm"]="Aviso: Anomalias nas configurações de ARP ou DNS são fortes indicadores de possíveis ataques MITM. A ação imediata é aconselhada."

MESSAGES["ja", "script_start"]="セキュリティ脅威検出スクリプトを開始します..."
MESSAGES["ja", "report_file_info"]="レポートは以下に保存されます:"
MESSAGES["ja", "backdoor_rootkit_detection"]="--- 1. バックドアとルートキットの検出 ---"
MESSAGES["ja", "chkrootkit_not_installed"]="chkrootkitがインストールされていません。インストールします..."
MESSAGES["ja", "running_chkrootkit"]="chkrootkitを実行中..."
MESSAGES["ja", "rkhunter_not_installed"]="rkhunterがインストールされていません。インストールします..."
MESSAGES["ja", "updating_rkhunter_db"]="rkhunterデータベースを更新中..."
MESSAGES["ja", "running_rkhunter"]="rkhunterを実行中..."
MESSAGES["ja", "eavesdropping_detection"]="--- 2. 盗聴/監視の検出 ---"
MESSAGES["ja", "promiscuous_mode_detection"]="プロミスキャスモードのインターフェースを検出中..."
MESSAGES["ja", "net_tools_not_installed"]="net-toolsがインストールされていません。インストールします..."
MESSAGES["ja", "displaying_connections"]="確立されたネットワーク接続とリスニングポートを表示中..."
MESSAGES["ja", "mitm_detection"]="--- 3. Man-in-the-Middle (MITM) 検出 ---"
MESSAGES["ja", "checking_arp_cache"]="ARPキャッシュを確認中..."
MESSAGES["ja", "checking_dns_resolvers"]="DNSリゾルバを確認中..."
MESSAGES["ja", "script_complete"]="セキュリティ脅威検出スクリプトが完了しました。"
MESSAGES["ja", "about_title"]="--- このスクリプトについて ---"
MESSAGES["ja", "about_content"]="このスクリプトは、Linuxシステム上でバックドア、盗聴、MITM攻撃の兆候を検出するために設計されています。chkrootkit、rkhunter、netstat、arpなどの標準ツールを活用しています。また、変数代入、条件文（if）、ループ（for/while - 主要なロジックでは明示的に使用されていませんが、これらは基本です）、関数定義、コマンド実行など、基本的なBashスクリプト機能も示しています。Bashは、Unix系オペレーティングシステムでタスクを自動化し、プロセスを管理するための強力なシェルおよびスクリプト言語です。"
MESSAGES["ja", "usage_info"]="使用法: $0 [-l <lang>] [-a]"
MESSAGES["ja", "lang_option"]="  -l <lang>  : 言語を設定 (en, zh, pt_BR, ja)。デフォルトは en。"
MESSAGES["ja", "about_option"]="  -a         : このスクリプトとBashに関する情報を表示。"
MESSAGES["ja", "conclusion_backdoor_rootkit"]="結論: chkrootkitとrkhunterの出力を注意深く確認し、「警告」または「感染」状態がないか確認してください。これらのツールは、隠れた悪意のあるソフトウェアを特定するために不可欠です。"
MESSAGES["ja", "warning_backdoor_rootkit"]="警告: 誤検知が発生する可能性があります。常に他のセキュリティ対策と照合し、疑わしいエントリは手動で調査してください。"
MESSAGES["ja", "conclusion_eavesdropping"]="結論: 意図的に設定されていないプロミスキャスモードのインターフェースがないか確認してください。不明または不正なサービス/プロセスがないか、リスニングポートと確立された接続を分析してください。"
MESSAGES["ja", "warning_eavesdropping"]="警告: 認識できないネットワークアクティビティは、マルウェアまたは不正な監視を示している可能性があります。迅速な調査が推奨されます。"
MESSAGES["ja", "conclusion_mitm"]="結論: ARPキャッシュで重複または異常なMAC-IPマッピングを調べてください。信頼できるソースに対してDNSリゾルバを検証し、リダイレクトが発生していないことを確認してください。"
MESSAGES["ja", "warning_mitm"]="警告: ARPまたはDNS設定の異常は、潜在的なMITM攻撃の強力な指標です。直ちに行動することをお勧めします。"

get_message() {
    echo "${MESSAGES[${LANG}, $1]}"
}

format_message() {
    local msg_key=$1
    local lang_code=$LANG
    local en_msg="${MESSAGES["en", ${msg_key}]}"
    local zh_msg="${MESSAGES["zh", ${msg_key}]}"
    local pt_BR_msg="${MESSAGES["pt_BR", ${msg_key}]}"
    local ja_msg="${MESSAGES["ja", ${msg_key}]}"

    printf "---------- %s | %s | %s | %s ---------------\n" "$(get_message ${msg_key})" "${en_msg}" "${zh_msg}" "${pt_BR_msg}"
}

show_about() {
    echo "$(get_message "about_title")"
    echo "$(get_message "about_content")"
    echo ""
    echo "$(get_message "usage_info")"
    echo "$(get_message "lang_option")"
    echo "$(get_message "about_option")"
    exit 0
}

while getopts "l:a" opt; do
    case ${opt} in
        l ) LANG=$OPTARG
            if [[ ! "en zh pt_BR ja" =~ "$LANG" ]]; then
                echo "Unsupported language: $LANG. Using default (en)."
                LANG="en"
            fi
            ;;
        a ) show_about
            ;;
        \? ) echo "$(get_message "usage_info")"
             echo "$(get_message "lang_option")"
             echo "$(get_message "about_option")"
             exit 1
            ;;
    esac
done
shift $((OPTIND -1))

format_message "script_start"

REPORT_FILE="security_threat_report_$(date +%Y%m%d_%H%M%S).txt"
format_message "report_file_info"
echo "$REPORT_FILE"

exec > >(tee -a "$REPORT_FILE") 2>&1

format_message "backdoor_rootkit_detection"

if ! command -v chkrootkit &> /dev/null
then
    format_message "chkrootkit_not_installed"
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y chkrootkit
fi
format_message "running_chkrootkit"
sudo chkrootkit

if ! command -v rkhunter &> /dev/null
then
    format_message "rkhunter_not_installed"
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends rkhunter
fi
format_message "updating_rkhunter_db"
sudo rkhunter --update
format_message "running_rkhunter"
sudo rkhunter --check

format_message "conclusion_backdoor_rootkit"
format_message "warning_backdoor_rootkit"

format_message "eavesdropping_detection"

if ! command -v netstat &> /dev/null
then
    format_message "net_tools_not_installed"
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools
fi

format_message "promiscuous_mode_detection"
ip link show | grep PROMISC

format_message "displaying_connections"
sudo netstat -tulnp

format_message "conclusion_eavesdropping"
format_message "warning_eavesdropping"

format_message "mitm_detection"

format_message "checking_arp_cache"
arp -a

format_message "checking_dns_resolvers"
cat /etc/resolv.conf

format_message "conclusion_mitm"
format_message "warning_mitm"

format_message "script_complete"
