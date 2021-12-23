#!/bin/sh
set -x

. ./common.sh

if [ ! -d "$GADGETS_PATH/$GADGET_NAME" ]; then
	info "creating device..."

	mkdir -p "$GADGETS_PATH/$GADGET_NAME"
	cd "$GADGETS_PATH/$GADGET_NAME" || exit

	# setup gadget info
	info "setting up device..."
	echo "$gadget_vendor_id" >idVendor
	echo "$gadget_product_id" >idProduct

	mkdir -p strings/0x409

	echo "$gadget_vendor_name" >strings/0x409/manufacturer
	echo "$gadget_product_name" >strings/0x409/product
	echo "$gadget_serial_number" >strings/0x409/serialnumber

	# configure keyboard function
	mkdir -p functions/hid.kbd

	echo 1 >functions/hid.kbd/protocol
	echo 1 >functions/hid.kbd/subclass
	echo 8 >functions/hid.kbd/report_length
	echo '05010906a101050719e029e71500250175019508810295017508810395057501050819012905910295017503910395067508150025650507190029658100c0' | xxd -r -p >functions/hid.kbd/report_desc

	# create default configuration
	mkdir -p configs/c.1
	echo 120 >configs/c.1/MaxPower
	ln -s functions/hid.kbd configs/c.1
fi

if ! grep -q '[^[:space:]]' "$GADGETS_PATH/$GADGET_NAME/UDC"; then
	cd "$GADGETS_PATH" || exit
	for g in $(ls | grep -v "$GADGET_NAME" | sort); do
		grep -q '[^[:space:]]' "./$g/UDC" && (
			echo "" >"./$g/UDC"
			echo "$udc" >"./$GADGET_NAME/UDC"
		)
	done
fi
