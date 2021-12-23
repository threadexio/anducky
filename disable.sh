#!/bin/sh

. ./common.sh

info "disabling device..."

cd "$GADGETS_PATH" || exit

if grep -q '[^[:space:]]' "$GADGETS_PATH/$GADGET_NAME/UDC"; then
	echo "" >"./$GADGET_NAME/UDC"
	echo "$udc" >"./$(ls | grep -v "$GADGET_NAME" | sort | head -n1)/UDC"
fi

info "deleting device..."
cd "$GADGET_NAME" || exit

rm configs/c.1/hid.kbd
rmdir configs/c.1

rmdir functions/hid.kbd
rmdir strings/0x409
cd "$GADGETS_PATH" || exit
rmdir "$GADGET_NAME"
