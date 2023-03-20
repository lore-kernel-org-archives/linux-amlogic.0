Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19A8C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+onjLHxixmzlks57V9EhpdFL9bj3osTsUCOhOQC058=; b=Tqi8XEOnrQz3+i
	vItP1IKajB8QRopAPJOEgMWjm9/FUvJUDuHP1tY05Cp0v8Aiw6BI3u0JOc/u/FebPQXlmFzB986Zl
	zWuMhvjp5RZWi7CmDqyEsIB+tIoTFIW4kPlmYo1c9rJ3OGAlum2JAtRvyIxfcFvA1XqhKv2hriCwi
	Cppf2BjRjGNWVdhiv2yKr9SZaslML3O1geL/J3rKuntCzJnLnHrlg+JUya4fU217TjtnrNtaOsrHV
	Ydh3RImJaO8eqmuxz07vmD5m5E8c5/SCHEPcgJy+aT6I4N16dFsT6u4BGbXmLrMTBt9Uxlzbjlr/H
	CuSvYue37Qu1OGl7M6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyr-008sRz-2m;
	Mon, 20 Mar 2023 11:47:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyo-008sKf-1D
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v1so3934931wrv.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xkFOBT9a7E5jsB06XKcP3k1R6qx8QP/tgBp+DQ2wCY=;
        b=AovXahGYJIa6JZssaQCc+Ac+39TGzHC+KSvJTDsmfMUqaoaHxHoyI8DD2RyrAzCUIq
         Dx+fEHeGE/1culBSCpHNbIWsdo/Nke4fcfFdoNzgmEOhIiupDOt8cKriwaKEQo8Fsb5o
         feDii5zPGKO2HCVW5nppbgSLEBNBPjXnsfrWibS2QBlxc4rbAaMivKd3WrB9dNrr1TDL
         JeV2VkjvXB4i/c35eTgBqdbOqpxmQxyQLJ2kmVsSqCMuYGDBlLF6+7rXM/MTfBKZLQ4A
         8H+EmnouZEN3FLdul9cSbiwwu8NU0U6KGcxkwUMmzDUaKaRh0dOQEa4/p1gNUXVA6xuY
         uVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xkFOBT9a7E5jsB06XKcP3k1R6qx8QP/tgBp+DQ2wCY=;
        b=PQbxSFrIsa/z/NoSRrA+4Cqvr9CCVD7FF8s6EH4R65SBIlF0NIC7IhRE4jpeP05f6u
         DieEtywrDdp1/0PlgaWuQBnuIgyUTFiaXXsJDqigbylsX9GwPpdvXdkDKjY36cpUw1OE
         MU7XES7v0UtKOt1XsVLYQcAmPzhnitvkTMYnIGOE20l7nVrsXKF2w6cGQNS8d0qs2YKk
         PVgZGjGq1IlQbapFn+GJu7K8wEh5kYEoNZrBdJpIoFA+NTFugmEPvAd39mD1xvg5EDSw
         +xvOXq/ldE1HUp20k9iQ8G0DeNtJqRtb6/Z5Id2fENxV4ZBNN1rStQm0UHr4tSoFSxbr
         tlHg==
X-Gm-Message-State: AO0yUKVby0CShqv/mQpj82tTiZGlNwCxHNPBFrmdxAFDKFIRCMoH7XK9
	09B+mM8dSyNoRjXwipQBwJk=
X-Google-Smtp-Source: AK7set8GSY5+CBW7X5CvlS3W3CafwQlw7wPo0OLwuWzYDY2YS5RKpGxcCxxm0byl5iM+7ryMKuhHpw==
X-Received: by 2002:adf:e406:0:b0:2d6:405f:8b16 with SMTP id g6-20020adfe406000000b002d6405f8b16mr3937781wrm.66.1679312822237;
        Mon, 20 Mar 2023 04:47:02 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:47:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 31/33] doc: boards: amlogic: add documentation for BananaPi M5
Date: Mon, 20 Mar 2023 11:46:07 +0000
Message-Id: <20230320114609.930145-32-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044710_435036_303636A7 
X-CRM114-Status: GOOD (  13.56  )
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

Add missing build documentation for the BPI-M5 board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/bananapi-m5.rst | 141 ++++++++++++++++++++++++++++++
 doc/board/amlogic/index.rst       |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 doc/board/amlogic/bananapi-m5.rst

diff --git a/doc/board/amlogic/bananapi-m5.rst b/doc/board/amlogic/bananapi-m5.rst
new file mode 100644
index 0000000000..ddc14b4eef
--- /dev/null
+++ b/doc/board/amlogic/bananapi-m5.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for BananaPi BPI-M5 (S905X3)
+===================================
+
+BananaPi BPI-M5 is a Single Board Computer manufactured by Sinovoip with the following
+specification:
+
+ - Amlogic S905X3 Arm Cortex-A55 quad-core SoC
+ - 4GB DDR4 SDRAM
+ - 16GB eMMC
+ - Gigabit Ethernet
+ - HDMI 2.1 display
+ - 40-pin GPIO header
+ - 4x USB 3.0 Host
+ - 1x USB-C (power)
+ - microSD
+ - UART serial
+ - Infrared receiver
+
+Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-M5
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make bananapi-m5_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh bananapi-m5 /path/to/u-boot/u-boot.bin my-output-dir
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
+    $ DIR=bananapi-m5
+    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b odroidg12-v2015.01-c4-m5 $DIR
+
+    $ cd $DIR
+    $ make bananapi_m5_defconfig
+    $ make
+    $ export UBOOTDIR=$PWD
+
+Go back to the mainline U-Boot source tree then:
+
+.. code-block:: bash
+
+    $ mkdir fip
+
+    $ wget https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc/blx_fix_g12a.sh -O fip/blx_fix.sh
+    $ cp $UBOOTDIR/build/scp_task/bl301.bin fip/
+    $ cp $UBOOTDIR/build/board/bananapi/bananpi_m5/firmware/acs.bin fip/
+    $ cp $UBOOTDIR/fip/g12a/bl2.bin fip/
+    $ cp $UBOOTDIR/fip/g12a/bl30.bin fip/
+    $ cp $UBOOTDIR/fip/g12a/bl31.img fip/
+    $ cp $UBOOTDIR/fip/g12a/ddr3_1d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/ddr4_1d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/ddr4_2d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/diag_lpddr4.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/lpddr3_1d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/lpddr4_1d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/lpddr4_2d.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/piei.fw fip/
+    $ cp $UBOOTDIR/fip/g12a/aml_ddr.fw fip/
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
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl30sig --input fip/bl30_new.bin \
+                                          --output fip/bl30_new.bin.g12a.enc \
+                                          --level v3
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl30_new.bin.g12a.enc \
+                                          --output fip/bl30_new.bin.enc \
+                                          --level v3 --type bl30
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl31.img \
+                                          --output fip/bl31.img.enc \
+                                          --level v3 --type bl31
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl33.bin --compress lz4 \
+                                          --output fip/bl33.bin.enc \
+                                          --level v3 --type bl33 --compress lz4
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl2sig --input fip/bl2_new.bin \
+                                          --output fip/bl2.n.bin.sig
+    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bootmk \
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
+Then write the image to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index e3ed1158df..808c857622 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -86,6 +86,7 @@ Board Documentation
    :maxdepth: 1
 
    bananapi-cm4io
+   bananapi-m5
    beelink-gtking
    beelink-gtkingpro
    jethub-j80
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
