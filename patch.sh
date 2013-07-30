#!/bin/sh
#
# Copyright (c) 2009-2013 Robert Nelson <robertcnelson@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Split out, so build_kernel.sh and build_deb.sh can share..

git="git am"

if [ -f ${DIR}/system.sh ] ; then
	. ${DIR}/system.sh
fi

if [ "${RUN_BISECT}" ] ; then
	git="git apply"
fi

echo "Starting patch.sh"

git_add () {
	git add .
	git commit -a -m 'testing patchset'
}

start_cleanup () {
	git="git am --whitespace=fix"
}

cleanup () {
	if [ "${number}" ] ; then
		git format-patch -${number} -o ${DIR}/patches/
	fi
	exit
}

arm () {
	echo "dir: arm"
	${git} "${DIR}/patches/arm/0001-kbuild-deb-pkg-set-host-machine-after-dpkg-gencontro.patch"

	#Status: v2 Review:
	#http://lists.infradead.org/pipermail/linux-arm-kernel/2012-August/112440.html
	${git} "${DIR}/patches/arm/0002-arm-add-definition-of-strstr-to-decompress.c.patch"
}

atmel_SAMA5 () {

	#Generated by:
	#git checkout v3.6.9 -b tmp
	#git pull --no-edit git://github.com/linux4sam/linux-at91.git linux-3.6.9-at91
	#git rebase v3.6.9
	#git format-patch -325 | grep 3.6.9 ; rm -rf *.patch
	#git format-patch -324 -o /opt/github/armv7_devel/patches/atmel_SAMA5/
	#git checkout master -f ; git branch -D tmp

	echo "dir: atmel_SAMA5"
	${git} "${DIR}/patches/atmel_SAMA5/0001-mmc-atmel-mci-remove-not-needed-DMA-capability-test.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0002-ARM-at91-atmel-mci-remove-unused-setup_dma_addr-macr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0003-mmc-atmel-mci-support-8-bit-buswidth.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0004-usb-gadget-at91_udc-move-the-dereference-below-the-N.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0005-ARM-at91-drop-duplicated-config-SOC_AT91SAM9-entry.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0006-ARM-at91-fix-at91x40-build.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0007-i2c-at91-remove-old-polling-driver.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0008-i2c-at91-add-new-driver.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0009-i2c-at91-add-dt-support-to-i2c-at91.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0010-i2c-at91-fix-SMBus-quick-command.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0011-mmc-atmel-mci-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0012-MMC-atmel-mci-add-device-tree-property-for-configura.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0013-MTD-at91-extract-hw-ecc-initialization-to-one-functi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0014-MTD-at91-add-dt-parameters-for-Atmel-PMECC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0015-MTD-at91-atmel_nand-Update-driver-to-support-Program.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0016-MTD-nand-add-return-value-for-write_page-write_page_.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0017-MTD-atmel_nand-add-9x5-to-list-of-SoC-with-DMA.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0018-MTD-atmel_nand-POI-fall-back-is-not-an-issue-change-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0019-MTD-atmel_nand-add-9n12-to-list-of-SoC-with-DMA.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0020-mtd-atmel_nand-add-4k-page-nand-flash-support-for-PM.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0021-mtd-atmel_nand-incease-the-chip_delay-time-tR-for-su.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0022-MTD-atmel-nand-fix-gpio-missing-request.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0023-MTD-atmel_nand-add-pinctrl-consumer-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0024-mtd-atmel_nand-fix-the-compile-error-which-miss-labe.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0025-input-atmel_tsadcc-add-support-for-ARCH_AT91SAM9X5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0026-input-atmel_tsadcc-add-touch-screen-pressure-measure.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0027-input-atmel_tsadcc-enable-touchscreen-averaging-and-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0028-input-atmel_tsadcc-add-ACR-register-and-change-trigg.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0029-AT91-input-atmel_tsadcc-rework-irq-infrastructure-an.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0030-input-at91-add-tsadcc_data-for-9x5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0031-input-at91-add-dt-support-for-atmel-touch-screen-adc.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0032-video-atmel_lcdfb-add-support-for-AT91SAM9x5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0033-video-atmel_lcdfb-The-output-bpp-should-not-change-a.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0034-video-atmelfb-initially-split-atmelfb-into-a-driver-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0035-video-atmelfb-refactor-core-setup.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0036-video-atmelfb-refactor-start-stop.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0037-video-atmelfb-refactor-isr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0038-video-atmelfb-refactor-backlight-routines.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0039-video-atmelfb-refactor-dma_update.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0040-video-atmelfb-refactor-LUT.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0041-video-atmelfb-refactor-limit_screeninfo.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0042-arm-at91-refactor-lcdc-includes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0043-video-atmel_hlcdfb-add-new-driver.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0044-WIP-add-clut-resource.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0045-video-atmel_lcdfb-add-error-msg-when-out-of-memory.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0046-video-atmel_lcdfb-HLCD-modifications.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0047-atmel_lcdfb-change-pixel-clock-ratio-calculation.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0048-media-at91sam9x5-video-new-driver-for-the-high-end-o.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0049-video-atmel_lcdfb-protect-bl_power-with-CONFIG_BACKL.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0050-video-atmel_lcdfb-adapt-to-all-IP-configurations.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0051-media-at91sam9x5-video-cleanup-modifications.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0052-media-at91sam9x5-video-align-DMA-descriptors-on-64-b.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0053-media-at91sam9x5-video-change-scaling-factor-calcula.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0054-media-at91sam9x5-video-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0055-media-video-atmel-isi-add-dumb-set_parm.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0056-media-atmel_isi-add-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0057-video-atmel_lcdfb-add-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0058-mmc-at91-add-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0059-ARM-at91-i2c-change-id-to-let-i2c-at91-work.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0060-i2c-at91-fix-compilation-warning.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0061-i2c-at91-change-struct-members-indentation.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0062-i2c-at91-add-dma-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0063-i2c-at91-add-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0064-i2c-at91-add-dt-property-for-DMA-configuration.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0065-net-macb-add-AT91RM9200-specific-registers-and-bits-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0066-net-at91_ether-use-macb-register-definitions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0067-net-at91_ether-use-macb-access-functions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0068-net-at91_ether-use-macb-defs-for-rx-dma-buffers.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0069-net-at91_ether-macb-absorb-at91_private-in-to-macb-p.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0070-net-at91_ether-use-pclk-member-instead-of-ether_clk.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0071-net-macb-export-some-symbols-for-at91_ether.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0072-net-at91_ether-compile-macb-for-exported-functions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0073-net-at91_ether-use-ethtool-and-mdio-from-macb.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0074-net-at91_ether-share-macb_set_rx_mode-with-macb.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0075-net-at91_ether-use-macb-dma-description-struct.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0076-net-at91_ether-clean-up-rx-buffer-handling.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0077-net-at91_ether-convert-to-devm_-functions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0078-net-macb-fix-truncate-warnings.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0079-net-cadence-get-rid-of-HAVE_NET_MACB.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0080-net-at91_ether-select-MACB-in-Kconfig.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0081-net-at91_ether-add-pdata-flag-for-reverse-Eth-addr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0082-net-cadence-depend-on-HAS_IOMEM.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0083-net-macb-Add-support-for-Gigabit-Ethernet-mode.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0084-net-macb-memory-barriers-cleanup.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0085-net-macb-change-debugging-messages.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0086-net-macb-remove-macb_get_drvinfo.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0087-net-macb-tx-status-is-more-than-8-bits-now.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0088-net-macb-clean-up-ring-buffer-logic.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0089-net-macb-ethtool-interface-add-register-dump-feature.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0090-net-macb-better-manage-tx-errors.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0091-net-macb-Offset-first-RX-buffer-by-two-bytes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0092-net-macb-add-pinctrl-consumer-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0093-macb-Keep-driver-s-speed-duplex-in-sync-with-actual-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0094-net-at91_ether-add-dt-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0095-net-at91_ether-add-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0096-net-macb-check-all-address-registers-sets.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0097-net-macb-support-reversed-hw-addr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0098-net-macb-export-macb_set_hwaddr-and-macb_get_hwaddr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0099-net-at91_ether-use-macb-functions-for-get-set-hwaddr.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0100-net-at91_ether-use-stat-function-from-macb.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0101-net-at91_ether-drop-board_data-private-struct-member.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0102-net-at91_ether-clean-up-print-outs.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0103-net-at91_ether-fix-comment-and-style-issues.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0104-net-macb-add-support-for-phy-irq-via-gpio-pin.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0105-net-macb-clear-unused-address-register.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0106-net-macb-move-to-circ_buf-macros-and-fix-initial-con.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0107-net-ethernet-remove-useless-is_valid_ether_addr-from.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0108-net-macb-GEM-DMA-configuration-register-update.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0109-rtc-at91-add-dt-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0110-ASoC-atmel-ssc-use-devm_xxx-managed-function.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0111-ASoC-atmel-ssc-use-module_platform_driver-macro.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0112-ARM-at91-atmel-ssc-add-platform-device-id-table.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0113-ARM-at91-atmel-ssc-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0114-ASoC-atmel-ssc-dai-register-dai-and-pcm-directly.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0115-ASoC-atmel-ssc-add-phybase-in-device-structure.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0116-mtd-nand-remove-stale-config-options.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0117-video-atmel-lcd-only-request-the-pinctrl-once.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0118-ARM-at91-atmel-ssc-add-pinctrl-comsumer.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0119-ASoC-atmel-ssc-using-temp-method-for-DMA-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0120-ASoC-atmel_ssc_dai-change-according-to-SAMA5-RevD-ha.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0121-ASoC-atmel-pcm-split-into-two-file.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0122-ASoC-atmel-pcm-dma-support-based-on-pcm-dmaengine.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0123-video-atmel_hlcdfb-add-second-overlay-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0124-video-atmel_hlcdfb-increase-the-base-layer-AHB-burst.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0125-of-add-dma-mask-binding.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0126-of_spi-add-generic-binding-support-to-specify-cs-gpi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0127-spi-atmel_spi-add-physical-base-address.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0128-spi-atmel_spi-call-unmapping-on-transfers-buffers.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0129-spi-atmel_spi-status-information-passed-through-cont.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0130-spi-atmel_spi-add-flag-to-controller-data-for-lock-o.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0131-spi-atmel_spi-add-DT-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0132-input-qt1070-add-irq-pinctrl-consumer.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0133-MTD-at91-atmel_nand-since-PMECC-support-different-ec.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0134-MTD-atmel_nand-use-devm_xxx-gpio-kzalloc-gpio-and-io.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0135-atmel_isi-fix-irq-shuold-be-int-instead-of-unsigned-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0136-spi-atmel_spi-add-dmaengine-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0137-spi-atmel_spi-Fix-spi-atmel-driver-to-adapt-to-slave.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0138-spi-atmel_spi-correct-16-bits-transfers-using-PIO.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0139-spi-atmel_spi-correct-16-bits-transfer-with-DMA.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0140-spi-atmel-add-support-to-read-dt-property-for-DMA-co.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0141-spi-atmel_spi-Add-pinctrl-support-for-atmel-spi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0142-can-at91_can-add-dt-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0143-can-at91_can-add-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0144-ARM-at91-move-platform_data-definitions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0145-crypto-add-atmel-test-driver.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0146-crypto-Atmel-AES-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0147-crypto-Atmel-TDES-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0148-crypto-Atmel-SHA-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0149-crypto-Atmel-Test-add-SHA224-SHA384-and-SHA512-suppo.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0150-watchdog-at91sam9_wdt-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0151-watchdog-core-dt-add-support-for-the-timeout-sec-dt-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0152-watchdog-orion_wdt-add-timeout-sec-property-binding.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0153-watchdog-at91sam9_wdt-add-timeout-sec-property-bindi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0154-watchdog-WatchDog-Timer-Driver-Core-fix-comment.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0155-watchdog-at91sam9_wdt-Remove-the-file_operations-str.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0156-watchdog-at91sam9_wdt-Remove-the-global-variable-at9.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0157-watchdog-at91sam9_wdt-Add-to-use-the-watchdog-framew.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0158-watchdog-at91sam9_wdt-Remove-the-options-WDIOF_SETTI.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0159-watchdog-at91sam9_wdt-Use-module_platform_driver.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0160-watchdog-at91sam9_wdt-Add-nowayout-helpers-to-Watchd.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0161-watchdog-at91sam9_wdt-Remove-the-__initdata-of-at91w.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0162-net-macb-increase-RX-buffer-size-for-GEM.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0163-input-touchscreen-add-dt-support-for-Atmel-maXTouch-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0164-tty-atmel_serial-add-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0165-Serial-AT91-Correct-defination-of-PDC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0166-DMA-AT91-Serial-Add-parameter-for-serial-dma-use.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0167-Serial-AT91-Add-device-tree-property-for-conf.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0168-Serial-AT91-use-compatible-device-to-distinguish-dma.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0169-Serial-AT91-distinguish-PDC-and-DMA-when-no-dt-suppo.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0170-Serial-AT91-Request-tx-dma-channel.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0171-Serial-AT91-Enable-tx-dma.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0172-Serial-AT91-Request-rx-dma-channel.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0173-DMA-AT91-Add-value-about-transmit-buswidth.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0174-DMA-AT91-Get-residual-bytes-in-dma-buffer.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0175-DMA-AT91-Check-fifo-empty.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0176-Serial-AT91-Enable-rx-cyclic-DMA-transfer.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0177-ARM-AT91-IIO-add-low-and-high-res-support-for-at91-a.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0178-ARM-AT91-IIO-add-pinctrl-support-to-at91_adc.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0179-USB-gadget-atmel_usba-add-device-tree-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0180-ASoC-atmel-pcm-dma-fix-aplay-without-parameters-bug.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0181-atmel-isi-add-explaination-for-all-items-of-isi_plat.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0182-Serial-AT91-remove-tx-dma-issue-pending.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0183-net-macb-change-RX-path-for-GEM.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0184-net-macb-Try-to-optimize-struct-macb-layout.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0185-usb-gadget-atmel_usba-add-pinctrl-consumer-for-vbus.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0186-ASoC-atmel-ssc-dai-enable-to-play-24-and-32-bit-audi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0187-arm-at91-use-macro-to-declare-soc-boot-data.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0188-ARM-at91-gpio-implement-request.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0189-at91-regroup-gpio-and-pinctrl-under-the-same-ranges.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0190-arm-at91-at91sam9x5-fix-gpio-number-per-bank.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0191-ARM-at91-add-dummies-pinctrl-for-non-dt-platform.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0192-ARM-at91-add-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0193-arm-at91-dt-at91sam9-add-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0194-pinctrl-at91-add-deglitch-debounce-pull-down-and-sch.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0195-pinctrl-at91-fix-compatible-order.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0196-pinctrl-at91-fix-gpio-irq-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0197-pinctrl-at19-fix-typo-on-PULL_UP.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0198-pinctrl-at91-fix-pull-down-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0199-pinctrl-at91-fix-debounce-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0200-ARM-dts-add-dma-cells-to-dma-controller-nodes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0201-ARM-dts-add-nodes-for-atmel-hsmci-controllers-for-at.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0202-ARM-dts-add-nodes-for-atmel-hsmci-controllers-for-at.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0203-ARM-at91-add-MCI-DMA-for-at91sam9x5.dtsi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0204-ARM-at91-add-clocks-for-MCI-DT-entries.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0205-at91-9x5-add-DT-parameters-to-enable-PMECC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0206-ARM-at91-9x5-family-add-at91sam9x25ek.dts.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0207-ARM-at91-add-new-at91sam9g35ek.dts.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0208-ARM-at91-add-LCD-HEO-DT-entry-for-at91sam9x5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0209-ARM-at91-add-clocks-for-I2C-DT-entries.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0210-ARM-dts-add-twi-nodes-for-atmel-SoCs.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0211-ARM-dts-add-twi-nodes-for-atmel-boards.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0212-ARM-dts-add-i2c-dma-conf-for-9x5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0213-arm-at91-dt-at91sam9-add-nand-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0214-ARM-at91-split-9x5-dts-dtsi-in-a-common-set-of-perip.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0215-arm-at91sam9x5-sync-with-the-mainline.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0216-ARM-at91-add-LCD-pdata-for-9x5-LCD.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0217-ARM-at91-DT-add-i2c-mmc-nand-pinctrl-in-device-tree-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0218-at91sam9x5-add-lcd-pinctrl-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0219-AT91SAM9G45-crypto-same-platform-data-header-for-all.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0220-AT91SAM9N12-add-crypto-peripherals.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0221-ARM-dts-add-spi-nodes-for-atmel-SoC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0222-ARM-dts-add-spi-nodes-for-atmel-boards.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0223-ARM-dts-introduce-simple-bus-to-represent-the-LCDC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0224-ARM-at91-update-due-to-second-lcd-overlay-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0225-ARM-at91-dts-add-at91sam9_wdt-driver-to-at91sam926x-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0226-ARM-dts-add-the-watchdog-nodes-for-at91sam9x5-and-at.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0227-ARM-dts-add-the-watchdog-nodes-for-at91sam9g25ek-boa.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0228-ARM-at91-change-serial-driver-name-according-to-the-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0229-MTD-atmel_nand-add-sama5d3-to-cpu_has_dma-function.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0230-media-atmel_isi-allocate-memory-to-store-the-isi-pla.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0231-enable-SAMA5D3-support-in-touch-screen-adc-controlle.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0232-media-video-at91sam9x5-video-add-sama5d3-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0233-atmel_nand-add-nand-flash-controller-NFC-definitions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0234-atmel_nand-add-Nand-Flash-Controller-NFC-resources-a.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0235-atmel_nand-nfc-enable-NFC-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0236-atmel_nand-nfc-enable-read-operation-via-nfc-sram.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0237-atmel_nand-replace-pmecc-enable-code-with-one-functi.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0238-atmel_nand-enable-write-page-function-with-nfc-sram-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0239-atmel_nand-can-switch-the-sram-banks.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0240-atmel_nand-nfc-enable-dma-for-page-read-with-nfc-sra.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0241-atmel_nand-add-dma-operation-for-write-via-NFC-sram.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0242-atmel_nand-nfc-add-interrupt-definitions.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0243-atmel_nand-add-dummy-interrupt-handler.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0244-atmel_nand-nfc-use-interrupt-instead-of-pooling-the-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0245-Revert-media-soc-camera-Pass-the-physical-device-to-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0246-ASoC-sama5d3-wm8904-add-audio-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0247-SAMA5-pmc-use-PCR-register-to-manage-peripheral-cloc.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0248-WIP-SAMA5-support-new.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0249-SAMA5-dynamically-change-lcd-configuration-for-PDA-m.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0250-ARM-at91-add-peripheral-clock-division-support-for-s.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0251-ARM-at91-add-dma-conf-to-mci-nodes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0252-ARM-at91-add-dma-conf-to-i2c-nodes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0253-ARM-sama5d3-add-dma-property-to-ssc-nodes.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0254-ARM-dts-add-serial-dma-conf-for-sama5d3.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0255-spi-atmel-add-dt-property-for-DMA-configuration-for-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0256-ARM-at91-dts-add-eeprom-entry-for-sama5d34ek.dts.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0257-SAMA5-sort-and-update-dtb-files.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0258-ARM-sama5-add-usba-vbus-pinctrl-and-enable-detecting.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0259-SAMA5-update-defconfig.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0260-SAMA5-dts-update-pinctrl-for-adc-on-sama5d35.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0261-atmel_nand-nfc-change-printk-to-dev_dbg.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0262-atmel_nand-nfc-According-to-the-data-sheet-for-READI.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0263-ARM-at91-board-dt-add-fake-ISI-material.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0264-ARM-at91-board-dt-fix-i2c_camera_power_revB-return-v.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0265-ARM-at91-dts-add-pinctrl-to-EMAC-ethernet-interface.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0266-atmel-spi-quick-implementation-of-WDRBT-feature.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0267-ARM-at91-board-dt-fix-return-value-in-i2c_camera_pow.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0268-ARM-at91-dts-leds-remove-d3-for-sama5d35ek.dts-since.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0269-atmel_nand-nfc-add-time-out-condition-in-case-that-n.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0270-ASoC-atmel-ssc-change-dev_dbg-to-dev_err.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0271-ASoC-sama5-wm8904-setting-dai-format-through-dai-lin.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0272-ASoC-sama5_wm8904-using-dapm-widget-directly.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0273-spi-spi_atmel-fix-compilation-issue-when-no-DT.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0274-SAMA5-fixes-for-at91_dt_device_init.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0275-SAMA5-remove-all-mb-revB-device-tree-part.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0276-SAMA5-big-rework-on-dts-files.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0277-arm-at91sam9g45-add-missing-uart-pinctrl-node.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0278-arm-at91sam9263-add-missing-uart-pinctrl-node.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0279-arm-at91sam9260-add-missing-uart-pinctrl-node.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0280-arm-at91sam9xcm-add-specific-nand-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0281-ARM-sama5-update-the-dts-for-audio.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0282-net-macb-fix-race-with-RX-interrupt-while-doing-NAPI.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0283-net-macb-set-discard-rx-packets-if-no-DMA-resource-f.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0284-net-macb-RX_USED-bit-is-managed-in-gem_rx_refill-fun.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0285-net-macb-no-need-to-test-available-space-in-TX-ring.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0286-net-macb-fix-the-macb_close-function.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0287-net-macb-when-freeing-tx-buffer-make-sure-to-unmap-t.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0288-net-macb-trivial-remove-unneeded-asignment-in-poll-f.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0289-SAMA5-dts-add-pb_user1-to-sama5d35ek.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0290-ARM-at91-fix-infinite-loop-for-AIC5.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0291-Input-qt1070-becomes-a-wakeup-source.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0292-pinctrl-at91-manage-gpio-suspend-resume.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0293-ARM-at91-cleanup-to-remove-conflicts-between-pinctrl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0294-video-atmel_hlcdfb-don-t-read-a-write-only-register.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0295-video-atmel_hlcdfb-don-t-wait-when-going-to-suspend.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0296-video-atmel_hlcdfb-now-suspend-resume-is-managed-onl.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0297-drivers-video-atmel_hlcdfb.c-fix-bad-timing-configur.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0298-drivers-video-atmel_hlcdfb.c-Remove-bad-default-conf.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0299-SAMA5-Update-the-correctable-ECC-to-4bits-instead-of.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0300-USB-gadget-atmel_usba_udc-fix-bug-when-using-devm_kz.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0301-SAMA5-update-defconfig-file.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0302-ASoC-atmel-pcm-make-it-buildable-for-modules.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0303-ASoC-atmel_ssc_dai-remove-redundant-code.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0304-ASoC-sama5_wm8904-disable-clock-when-remove.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0305-ARM-at91-fix-sama5d3-pmc-reg.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0306-ARM-at91-sama5d3-provide-the-correct-pclk-for-each-m.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0307-ARM-at91-clock-add-sama5-debugfs-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0308-ARM-at91-fix-pinctrl-and-old-gpio-simultaneous-suppo.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0309-ARM-at91-enhance-linux-at91-at91sam9x5-support.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0310-dt-define-of_find_device_by_node-when-dt-is-not-enab.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0311-ARM-at91-trivial-fix-model-name-for-SAM9G15-EK.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0312-ARM-at91-trivial-fix-alsa-driver-module-description-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0313-ARM-at91-trivial-fix-typo-in-NFC-driver-comments.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0314-mtd-atmel_nand-avoid-to-report-an-error-when-lookup-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0315-mtd-atmel_nand-make-pmecc-cap-pmecc-sector-size-in-d.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0316-mtd-at91-atmel_nand-for-PMECC-add-code-to-check-the-.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0317-sama5d3-reduce-the-lookup-table-size-for-PMECC.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0318-ARM-at91-sama5d3-reduce-TWI-internal-clock-frequency.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0319-Input-atmel_tsadcc-fix-compilation-as-a-module.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0320-Change-internal-SRAM-memory-type-to-MT_MEMORY_SO.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0321-Change-the-internal-SRAM-memory-type-MT_MEMORY_NONCA.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0322-pm-ddr-make-ddr-sdram-enter-self-refresh-mode-when-e.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0323-pm-sama5d3-add-pm-support-for-sama5d3xek.patch"
	${git} "${DIR}/patches/atmel_SAMA5/0324-pm-disable-UPLL-when-excuting-PM.patch"
}

arm
atmel_SAMA5

echo "patch.sh ran successful"
