Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7AC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQAizW9xJT7nUvQc20vAAnGSF0XIo3d7UhoM/35PR1Y=; b=twMQogBxL6nKqk
	ieNmVXKVb+KPoAOBvwgeBQq00u4GfHHMqoEM1Vcel358kQoDkCMwZRJXWIp80U/3VFm6PY8Pt8BSc
	vtdqQ0sr9quqjvmvwalXfbn3CGz5mn/tVpScwijCmjlk7j2KKDWBIJClHSD7M3W+yA91dIS0eio7B
	0i73Hg7Zj5J7btFCDLgPFp1qmsWbCCjSAw6SYeEVryZslMIC2MisiPGoX1DbnUSll920RA8RmCEF6
	xvg1W7KJJ1hpiTkqPukS4ybD31bDYjyJ+gpyI+J2x0q12h00HNO4lnndEDN3bAMDbOm4Hamxwiwpy
	Jci9pofFBDzKouZWjdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyi-008sLx-37;
	Mon, 20 Mar 2023 11:47:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyf-008rnC-0G
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so10043993wrq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB+d4E0cfzUuNXDX2irleo3J76K7B2sR0N8tgKAsICI=;
        b=IvZQIo5/ckHQvjWJOFQY14PslFiPKOG2jQ3ctH/6K67ATI5NT2070jSJB0J2+WgdY7
         ymS2yprSxPABfHQWRLd6VOKPxyxzq/sCjgkkfC2daOaDfOwtNxgikPlj3ko0h2MzEzWp
         6NV0QmbM/mXmJfZm3FTzG038zOY/e4CGGdVg1jwkrIQTrnk8i935EhGgj8drFEittYlL
         ccEaIp6mR57UWS9bWAZ93CVcTZGwptkNyuUmSR+5vUVEv1RdoABRbNvfXGreyxAI42Kd
         ErwInMa89S/AFaoIkcDoZNy07BrHNrdps1pZ3isL7Ozkc4I0SZn5wJXwtbOjcTlkhNIK
         9cbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB+d4E0cfzUuNXDX2irleo3J76K7B2sR0N8tgKAsICI=;
        b=HX61VxfEQlVHQu9YSKPS98MQrXe7mR8hIB6/Xx3X2eBaHtKYH5IjQggpjnvHNAuFPG
         JKD94UwqZrMkPtCe/4uXUvHWCoIfxgQn1LIhkAXbmQidwMIpleD7GrRMjp4KNLebeZCj
         2rciH7pSmUZzXAQcUijZQ96sSXGypGpYi2uhpB0J66uQQVCkaIPn/oVGew36WnhIMIoV
         VXi32poP7Nmgb24qV5Pu/Nbd4suVx0ygIYuD9YnGjfBz1TvOp3yzViZ/YUUn8/406Qra
         1LZQWO2rhowBS9koOJSO/b4JiXHj43kYRmxRDoYnAwRxFy6LD8OAwgUFge9/b+7oUz6b
         2WUw==
X-Gm-Message-State: AO0yUKXFYCuFfRbaHJAonSklu/Am10Q48rqR0+7zc9cmJcVGD2X3vzVJ
	04pXgdTQJW+2sth0SmY5ZqE=
X-Google-Smtp-Source: AK7set+2tfFpMrDEf+aj4MIkPJHb6vWh0A3sahT7kgnpg8pcQ8NMKk3D1VqDRWcFJdugknvR852SPw==
X-Received: by 2002:adf:fb8e:0:b0:2cf:e77e:2eef with SMTP id a14-20020adffb8e000000b002cfe77e2eefmr14313257wrr.8.1679312820667;
        Mon, 20 Mar 2023 04:47:00 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:47:00 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 30/33] doc: boards: amlogic: add documentation for BananaPi CM4IO
Date: Mon, 20 Mar 2023 11:46:06 +0000
Message-Id: <20230320114609.930145-31-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044701_153047_393EF41F 
X-CRM114-Status: GOOD (  15.58  )
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

Add build instructions for the BananaPi BPI-CM4IO carrier board with
BPI-CM4 module.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/u200/MAINTAINERS       |   1 -
 board/amlogic/w400/MAINTAINERS       |   2 +
 doc/board/amlogic/bananapi-cm4io.rst | 152 +++++++++++++++++++++++++++
 doc/board/amlogic/index.rst          |   1 +
 4 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 doc/board/amlogic/bananapi-cm4io.rst

diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
index 7535e489d1..47cec234a1 100644
--- a/board/amlogic/u200/MAINTAINERS
+++ b/board/amlogic/u200/MAINTAINERS
@@ -4,7 +4,6 @@ S:	Maintained
 L:	u-boot-amlogic@groups.io
 F:	board/amlogic/u200/
 F:	configs/u200_defconfig
-F:	configs/bananapi-cm4-cm4io_defconfig
 F:	configs/bananapi-m5_defconfig
 F:	configs/radxa-zero_defconfig
 F:	doc/board/amlogic/u200.rst
diff --git a/board/amlogic/w400/MAINTAINERS b/board/amlogic/w400/MAINTAINERS
index 96ccda2001..26a4c2c587 100644
--- a/board/amlogic/w400/MAINTAINERS
+++ b/board/amlogic/w400/MAINTAINERS
@@ -3,4 +3,6 @@ M:	Neil Armstrong <neil.armstrong@linaro.org>
 S:	Maintained
 L:	u-boot-amlogic@groups.io
 F:	board/amlogic/w400/
+F:	configs/bananapi-cm4-cm4io_defconfig
 F:	doc/board/amlogic/w400.rst
+F:	doc/board/amlogic/bananapi-cm4io.rst
diff --git a/doc/board/amlogic/bananapi-cm4io.rst b/doc/board/amlogic/bananapi-cm4io.rst
new file mode 100644
index 0000000000..aabe2ef197
--- /dev/null
+++ b/doc/board/amlogic/bananapi-cm4io.rst
@@ -0,0 +1,152 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for BananaPi CM4 with CM4IO (A311D)
+==========================================
+
+BPI-CM4 is a system-on-module board manufactured by Sinovoip. It follows the Raspberry Pi
+CM4 interface specification but with a single HDMI port and a single DSI output:
+
+ - Amlogic A311D Arm Cortex-A53 dual-core + Cortex-A73 quad-core SoC 
+ - 4GB DDR4 SDRAM
+ - 16GB eMMC
+ - NPU
+ - HDMI 2.1 display
+ - Gigabit Ethernet
+ - RTL8822CS WiFi (a/b/g/n/ac) + BT 5.0
+
+BPI-CM4IO is a carrier board for the BPI-CM4 module with the following specification:
+
+ - CM4 interface
+ - HDMI interface
+ - MIPI CSI interface
+ - MIPI DSI interface
+ - Ethernet interface
+ - PCIe interface
+ - SD (micro)
+ - SIM (micro)
+ - 26-pin GPIO
+ - UART serial
+ - 1x USB-C (power)
+ - 2x USB 2.0
+
+Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-CM4
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make bananapi-cm4io_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh bananapi-cm4io /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
+
+.. code-block:: bash
+
+    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+    $ tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+    $ tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+    $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+
+    $ DIR=bananapi-cm4io
+    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b khadas-g12b-v2015.01-m2s $DIR
+
+    $ cd $DIR
+    $ make bananapi_cm4_defconfig
+    $ make
+    $ export UBDIR=$PWD
+
+Go back to the mainline U-Boot source tree then:
+
+.. code-block:: bash
+
+    $ mkdir fip
+
+    $ wget https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc/blx_fix_g12a.sh -O fip/blx_fix.sh
+    $ cp $UBDIR/build/scp_task/bl301.bin fip/
+    $ cp $UBDIR/build/board/bananapi/bananpi_cm4/firmware/acs.bin fip/
+    $ cp $UBDIR/fip/g12a/bl2.bin fip/
+    $ cp $UBDIR/fip/g12a/bl30.bin fip/
+    $ cp $UBDIR/fip/g12a/bl31.img fip/
+    $ cp $UBDIR/fip/g12a/ddr3_1d.fw fip/
+    $ cp $UBDIR/fip/g12a/ddr4_1d.fw fip/
+    $ cp $UBDIR/fip/g12a/ddr4_2d.fw fip/
+    $ cp $UBDIR/fip/g12a/diag_lpddr4.fw fip/
+    $ cp $UBDIR/fip/g12a/lpddr3_1d.fw fip/
+    $ cp $UBDIR/fip/g12a/lpddr4_1d.fw fip/
+    $ cp $UBDIR/fip/g12a/lpddr4_2d.fw fip/
+    $ cp $UBDIR/fip/g12a/piei.fw fip/
+    $ cp $UBDIR/fip/g12a/aml_ddr.fw fip/
+    $ cp u-boot.bin fip/bl33.bin
+
+    $ sh fip/blx_fix.sh \
+         fip/bl30.bin \
+         fip/zero_tmp \
+         fip/bl30_zero.bin \
+         fip/bl301.bin \
+         fip/bl301_zero.bin \
+         fip/bl30_new.bin \
+         bl30
+
+    $ sh fip/blx_fix.sh \
+         fip/bl2.bin \
+         fip/zero_tmp \
+         fip/bl2_zero.bin \
+         fip/acs.bin \
+         fip/bl21_zero.bin \
+         fip/bl2_new.bin \
+         bl2
+
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
+                                       --output fip/bl30_new.bin.g12a.enc \
+                                       --level v3
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
+                                       --output fip/bl30_new.bin.enc \
+                                       --level v3 --type bl30
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
+                                       --output fip/bl31.img.enc \
+                                       --level v3 --type bl31
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
+                                       --output fip/bl33.bin.enc \
+                                       --level v3 --type bl33 --compress lz4
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
+                                       --output fip/bl2.n.bin.sig
+    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bootmk \
+                                       --output fip/u-boot.bin \
+                                       --bl2 fip/bl2.n.bin.sig \
+                                       --bl30 fip/bl30_new.bin.enc \
+                                       --bl31 fip/bl31.img.enc \
+                                       --bl33 fip/bl33.bin.enc \
+                                       --ddrfw1 fip/ddr4_1d.fw \
+                                       --ddrfw2 fip/ddr4_2d.fw \
+                                       --ddrfw3 fip/ddr3_1d.fw \
+                                       --ddrfw4 fip/piei.fw \
+                                       --ddrfw5 fip/lpddr4_1d.fw \
+                                       --ddrfw6 fip/lpddr4_2d.fw \
+                                       --ddrfw7 fip/diag_lpddr4.fw \
+                                       --ddrfw8 fip/aml_ddr.fw \
+                                       --ddrfw9 fip/lpddr3_1d.fw \
+                                       --level v3
+
+Then write the image to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index 3eb1cf46e0..e3ed1158df 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -85,6 +85,7 @@ Board Documentation
 .. toctree::
    :maxdepth: 1
 
+   bananapi-cm4io
    beelink-gtking
    beelink-gtkingpro
    jethub-j80
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
