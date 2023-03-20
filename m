Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A10C761AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58Oa8wxW96auyVyH+Xls4GQqTAaSiGdwHzdR8gmr2WE=; b=VDUZkt7mHfcrZL
	bOnxNRiKXFujV3Swj0CTAlb5do4btqkww4L7pcvAvMAti8qoYKP90pXruvSu1S25Q+4XYhGq/WYwV
	7Pknd6tO+gLBBaJDjzNCfZDx3+ma6fC3SkHY5flNLXEAV1tiErtVSZfHzeYo9IVvpRAXkyTwRpAir
	2a8SCFRiJredAQtyWqq5VQjENhBpEhCuuh3XwNVLfqnRXXIp0HFWu7DTZIA/jMA0a/rcghhjj2r0/
	N8ZqIB1rBtL2kmudoSQa/3JtC5Qnz3dwJY7C55Z0bmOvXo8xlM08xzPv/157ZsAZf31Isbfmgp3eQ
	3hX04AHDoGvb6krpGlbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyE-008rxx-2Q;
	Mon, 20 Mar 2023 11:46:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyC-008rv3-02
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id p16so7274674wmq.5
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXxkF+XbVbc4FJBnwx+bZ4z+3Rqpu6bv55HLEWO0AlI=;
        b=gZfN6ARN5/zMky3GK8v7su3CaiqX8Pf/cUtrb1nHIn3i9OULU9rda+X62KjmPdG3O9
         /arAdmhO3WJxCBuFw7g3dpOEAd+tUAvPdE2s2LKR7QZl43RdB6N60RzeGUnqRLJXHGv/
         GQwJT18gbFpd7N/sxNVoqBTGAeeHQdE1veA8SbWeW8ZNoVKQ+fyorVoiF+bVcvKPA7Ca
         ViOXvMAQAt5BIMhuRKGb8uDCDjROb6ZewvwOEZXX3QUDjioFj4ZrlZnSyUexEAoeD56I
         H2HZRl//Tu0Z+fYje7Ua4n7S440Qfe9xZKkoAA0ZAiPur805SMfXZn2NnQAiHb94C7oo
         Xk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXxkF+XbVbc4FJBnwx+bZ4z+3Rqpu6bv55HLEWO0AlI=;
        b=OtsltXasv6iHL5PjK8tooPWHrgFW5z010g4KWuyRCESd15moXyQOoElI5BL224gTg5
         j/IH0ZOvwlIKxyljolwIBUb9gtOxp1k37m+JPOKzAZF9pqM1mkAQxKZvRu3KBTXYKN1U
         loF3kXGLE7Gjsl3xia1EkbOqu7uJ1wy5je7NBsFbagPAtQQgaTjy8hXxJn7v3BtzLj0D
         7jjFeC7y7DHYUGaWKGF4VNiTLrzOG9kQHRE6cG3Upd4si8t/xgdfIUZcogUlrfdkGeUd
         SSVBOd8k8+o396yom/yHJAaa6YrumtdOJFRC2GrqUHT9qKCPMlH0MJKygihBfenOLhv9
         X5AA==
X-Gm-Message-State: AO0yUKVQwabZq9o0qjqJoGU++EmaVtz8+j/iIgNuK0lyPo2XfqwAiQqJ
	s7t1uOCX/tT7fSRj2VAXxew=
X-Google-Smtp-Source: AK7set8jdLrJIbmP0AeM27peovxv/uOECV5j81qTYMrvU630U3PBy2+XvOgoXinMNQQA6dAzI709ew==
X-Received: by 2002:a05:600c:3b8e:b0:3ed:290b:dc68 with SMTP id n14-20020a05600c3b8e00b003ed290bdc68mr24009919wms.12.1679312790135;
        Mon, 20 Mar 2023 04:46:30 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 11/33] doc: boards: amlogic: update documentation for Khadas VIM3L
Date: Mon, 20 Mar 2023 11:45:47 +0000
Message-Id: <20230320114609.930145-12-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044632_053031_5F3826DC 
X-CRM114-Status: GOOD (  12.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Improve documentation.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/khadas-vim3l.rst | 137 ++++++++++++++---------------
 1 file changed, 68 insertions(+), 69 deletions(-)

diff --git a/doc/board/amlogic/khadas-vim3l.rst b/doc/board/amlogic/khadas-vim3l.rst
index 692ab3d21d..935f43c725 100644
--- a/doc/board/amlogic/khadas-vim3l.rst
+++ b/doc/board/amlogic/khadas-vim3l.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Khadas VIM3L
-=======================
+U-Boot for Khadas VIM3L (S905D3)
+================================
 
-Khadas VIM3L is a single board computer manufactured by Shenzhen Wesion
-Technology Co., Ltd. with the following specifications:
+Khadas VIM3L is a Single Board Computer manufactured by Shenzhen Wesion Technology Co. Ltd
+with the following specifications:
 
  - Amlogic S905D3 Arm Cortex-A55 quad-core SoC
  - 2GB LPDDR4 SDRAM
@@ -20,32 +20,27 @@ Schematics are available on the manufacturer website.
 
 PCIe Setup
 ----------
-The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
-lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
-an USB3.0 Type A connector and a M.2 Key M slot.
-The PHY driving these differential lines is shared between
-the USB3.0 controller and the PCIe Controller, thus only
-a single controller can use it.
 
-To setup for PCIe, run the following commands from U-Boot:
+The on-board MCU can mux the PCIe/USB3.0 shared differential lines using a FUSB340TMX USB
+3.1 SuperSpeed Data Switch between a USB3.0 Type-A connector and an M.2 Key-M slot. The
+PHY driving these differential lines is shared between the USB3.0 controller and the PCIe
+Controller, thus only a single controller can use it.
+
+To setup for PCIe run the following commands from U-Boot then power-cycle the board:
 
 .. code-block:: none
 
     i2c dev i2c@5000
     i2c mw 0x18 0x33 1
 
-Then power-cycle the board.
-
-To set back to USB3.0, run the following commands from U-Boot:
+To revert to USB3.0 run the following commands from U-Boot then power-cycle the board:
 
 .. code-block:: none
 
     i2c dev i2c@5000
     i2c mw 0x18 0x33 0
 
-Then power-cycle the board.
-
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -54,14 +49,20 @@ U-Boot compilation
     $ make khadas-vim3l_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh khadas-vim3l /path/to/u-boot/u-boot.bin my-output-dir
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `khadas-vim3l`
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -72,16 +73,14 @@ the git tree published by the board vendor:
     $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
 
     $ DIR=vim3l-u-boot
-    $ git clone --depth 1 \
-       https://github.com/khadas/u-boot.git -b khadas-vims-v2015.01 \
-       $DIR
+    $ git clone --depth 1 https://github.com/khadas/u-boot.git -b khadas-vims-v2015.01 $DIR
 
     $ cd vim3l-u-boot
     $ make kvim3l_defconfig
     $ make CROSS_COMPILE=aarch64-none-elf-
     $ export UBOOTDIR=$PWD
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -105,58 +104,58 @@ Go back to mainline U-Boot source tree then :
     $ cp u-boot.bin fip/bl33.bin
 
     $ bash fip/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+           fip/bl30.bin \
+           fip/zero_tmp \
+           fip/bl30_zero.bin \
+           fip/bl301.bin \
+           fip/bl301_zero.bin \
+           fip/bl30_new.bin \
+           bl30
 
     $ bash fip/blx_fix.sh \
-    	fip/bl2.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/acs.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+           fip/bl2.bin \
+           fip/zero_tmp \
+           fip/bl2_zero.bin \
+           fip/acs.bin \
+           fip/bl21_zero.bin \
+           fip/bl2_new.bin \
+           bl2
 
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl30sig --input fip/bl30_new.bin \
-    					--output fip/bl30_new.bin.g12a.enc \
-    					--level v3
+                                          --output fip/bl30_new.bin.g12a.enc \
+                                          --level v3
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl30_new.bin.g12a.enc \
-    					--output fip/bl30_new.bin.enc \
-    					--level v3 --type bl30
+                                          --output fip/bl30_new.bin.enc \
+                                          --level v3 --type bl30
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl31.img \
-    					--output fip/bl31.img.enc \
-    					--level v3 --type bl31
+                                          --output fip/bl31.img.enc \
+                                          --level v3 --type bl31
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl33.bin --compress lz4 \
-    					--output fip/bl33.bin.enc \
-    					--level v3 --type bl33 --compress lz4
+                                          --output fip/bl33.bin.enc \
+                                          --level v3 --type bl33 --compress lz4
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl2sig --input fip/bl2_new.bin \
-    					--output fip/bl2.n.bin.sig
+                                          --output fip/bl2.n.bin.sig
     $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc \
-    		--ddrfw1 fip/ddr4_1d.fw \
-    		--ddrfw2 fip/ddr4_2d.fw \
-    		--ddrfw3 fip/ddr3_1d.fw \
-    		--ddrfw4 fip/piei.fw \
-    		--ddrfw5 fip/lpddr4_1d.fw \
-    		--ddrfw6 fip/lpddr4_2d.fw \
-    		--ddrfw7 fip/diag_lpddr4.fw \
-    		--ddrfw8 fip/aml_ddr.fw \
-    		--ddrfw9 fip/lpddr3_1d.fw \
-    		--level v3
-
-and then write the image to SD with:
+                                          --output fip/u-boot.bin \
+                                          --bl2 fip/bl2.n.bin.sig \
+                                          --bl30 fip/bl30_new.bin.enc \
+                                          --bl31 fip/bl31.img.enc \
+                                          --bl33 fip/bl33.bin.enc \
+                                          --ddrfw1 fip/ddr4_1d.fw \
+                                          --ddrfw2 fip/ddr4_2d.fw \
+                                          --ddrfw3 fip/ddr3_1d.fw \
+                                          --ddrfw4 fip/piei.fw \
+                                          --ddrfw5 fip/lpddr4_1d.fw \
+                                          --ddrfw6 fip/lpddr4_2d.fw \
+                                          --ddrfw7 fip/diag_lpddr4.fw \
+                                          --ddrfw8 fip/aml_ddr.fw \
+                                          --ddrfw9 fip/lpddr3_1d.fw \
+                                          --level v3
+
+Then write U-Boot to SD or eMMC with:
 
 .. code-block:: bash
 
-    $ DEV=/dev/your_sd_device
+    $ DEV=/dev/boot_device
     $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
-    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
