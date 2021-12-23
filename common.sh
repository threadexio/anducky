gadget_vendor_id="0x1234"
gadget_vendor_name="threadexio"

gadget_product_id="0x1234"
gadget_product_name="AnDucky"

gadget_serial_number="123456789"

CFS="/config"
GADGETS_PATH="$CFS/usb_gadget"

GADGET_NAME="anducky"

info() {
	printf '\e[1;36m[*]\e[0m %s\n' "$@"
}

fatal() {
	printf "\e[0;31m[x]\e[0m %s\n" "$@"
	exit
}

if [ "$(id -u)" -ne 0 ]; then
	fatal "Run me as root"
fi

udc="$(ls /sys/class/udc | awk '{print $1}')"
