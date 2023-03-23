Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D51C761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLeCYgLKcmO72v0rul6V3Iy3Q+P7tYT8zlIoFTOlR5k=; b=i0ngGzqvfxBQOY
	EXL1oRv9jIf4KP9ta6PiN+q1n83QAWRQ88AlwMO+fMnNiEF79tIAtCbcRyzCgoiJ8UO6X09BOPFpQ
	b2l//8Wk58yTNbPkieElnDAO+HKrhxTKnHK8Jr1m3DKG9JUAeAMb4uRK7DnFkJjtSETDSOwWHYLf8
	FN92bpSte2MwulXPx3b3ZWrFr/lrCeZpMOjA8kS6DFqgSNnv56Ik878ifJaZhzCL+tZy0eAS2V3OC
	6q5fXEIHo/ZmEorZ0fS5C5wi7qvN9JgFf+BkaK//1blC+wpUtnU5IFH+h/NWg2K0f4xaDooEQB7Vb
	LCQmQ0THOo6h4MjHj90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqy-0012fE-2v;
	Thu, 23 Mar 2023 06:55:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqu-0012cF-0J
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id l27so11011882wrb.2
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N0OYb9wKh76xF+BytsqT7IpkxfhEfMYmv2IrjGnteI=;
        b=d8dL36kyi2L5L8n+c75mxPfpk+6GERZjf4d+IZhXyCStHVjSRx0PsgbP3pGV1XEK8S
         6F4jeLgvHErDbrI1D8OI/GA2ghAcVyNHrJqK65gwcoy1EOyYn6xSK2DoVqK+oJtJSp8h
         6sAP+3DMfob8bh8ICFCA6sU5pnp4fcuVLyJDBfy+c1sTQ0JceW0itnWECHz3SjnoheHw
         iYn4ZDQfDUKkK06HOSwSEMZu8VgV1pMRWc1kORDqbMiMz//Dcy35r2Gxv68HLFs1OxBC
         ck0Nj1Z9DggER29/xfNRglKv7TCLexQhgFV8Ub2crArD6vS71OKwGC/cBFNA7x84KsiE
         24bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N0OYb9wKh76xF+BytsqT7IpkxfhEfMYmv2IrjGnteI=;
        b=Gab4N4Dfs9ReTpzsTmpFKu63rjOzSVsIXomWRidKjEybLWbuc4b6aeByiFG7fb4Fs+
         yvUCeLyscrBTvE2Qs27IEGq7JXfL2rFq6AuVElAALqNdqayujJIPnFXhjCY4njLUxLgo
         U7DDgoSsouhlwmrGqUqA1ywGnr5WAZf0G2MEBfXMVO10/wNO8O2TmDSJ23CJuFohnRYL
         jgZiFDG7eHW3Fwxc/3kxvCJ+Y7AJ7KaQhSvFW7xIedI7vBbyEJZuioCJ2a4Y3YTlch2k
         BegEi4ZNLu+vNdnv4p18ImFQxWcTfhg2sKjzeXDeLG2Z/gJeX8f1i6vuYueD8sCAPRgl
         exHA==
X-Gm-Message-State: AAQBX9dKTe2FpHMGNN/UFGGYcFiNQNhs7F6E+TguFastXIWT5xZFMTK/
	OXmZpjpdEf7HPB2QUh4HRoB4nMwJ8mVrO1zc
X-Google-Smtp-Source: AKy350ZaWIggr7Z9dc2/XwbAVnHxrAuiOKpJFmvZ1lR2NsHK7hWhZtnFLLc3X6G4LfMKdyesEPJ5lA==
X-Received: by 2002:adf:e9c9:0:b0:2ce:9a15:3724 with SMTP id l9-20020adfe9c9000000b002ce9a153724mr1612355wrn.3.1679554508247;
        Wed, 22 Mar 2023 23:55:08 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:07 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 04/13] docs: boards: amlogic: add documentation for BananaPi M2-Pro
Date: Thu, 23 Mar 2023 06:54:49 +0000
Message-Id: <20230323065458.776029-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235512_133246_6676703B 
X-CRM114-Status: GOOD (  14.36  )
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

Add build docs for the BPI-M2-PRO board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/u200/MAINTAINERS       |   2 +
 doc/board/amlogic/bananapi-m2pro.rst | 142 +++++++++++++++++++++++++++
 doc/board/amlogic/index.rst          |   1 +
 3 files changed, 145 insertions(+)
 create mode 100644 doc/board/amlogic/bananapi-m2pro.rst

diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
index 919e349922..f429c212ba 100644
--- a/board/amlogic/u200/MAINTAINERS
+++ b/board/amlogic/u200/MAINTAINERS
@@ -4,8 +4,10 @@ S:	Maintained
 L:	u-boot-amlogic@groups.io
 F:	board/amlogic/u200/
 F:	configs/u200_defconfig
+F:	configs/bananapi-m2pro_defconfig
 F:	configs/bananapi-m5_defconfig
 F:	configs/radxa-zero_defconfig
 F:	doc/board/amlogic/u200.rst
+F:	doc/board/amlogic/bananapi-m2pro.rst
 F:	doc/board/amlogic/bananapi-m5.rst
 F:	doc/board/amlogic/radxa-zero.rst
diff --git a/doc/board/amlogic/bananapi-m2pro.rst b/doc/board/amlogic/bananapi-m2pro.rst
new file mode 100644
index 0000000000..6c2974f323
--- /dev/null
+++ b/doc/board/amlogic/bananapi-m2pro.rst
@@ -0,0 +1,142 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for BananaPi BPI-M2-PRO (S905X3)
+=======================================
+
+BananaPi BPI-M2-PRO is a Single Board Computer manufactured by Sinovoip with the
+following specification:
+
+ - Amlogic S905X3 Arm Cortex-A55 quad-core SoC
+ - 2GB DDR4 SDRAM
+ - 16GB eMMC
+ - Gigabit Ethernet
+ - RTL8821CU USB WiFi (a/b/g/n/ac) + BT 5.0
+ - HDMI 2.1 display
+ - 40-pin GPIO header
+ - 2x USB 3.0 Host
+ - 1x DC Jack (power)
+ - microSD
+ - UART serial
+ - Infrared receiver
+
+Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Pro
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make bananapi-m2pro_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh bananapi-m2pro /path/to/u-boot/u-boot.bin my-output-dir
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
+    $ DIR=bananapi-m2pro
+    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b odroidg12-v2015.01-c4-m5 $DIR
+
+    $ cd $DIR
+    $ make bananapi_m2pro_defconfig
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
index 9b76bca427..8388acdd11 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -86,6 +86,7 @@ Board Documentation
    :maxdepth: 1
 
    bananapi-cm4io
+   bananapi-m2pro
    bananapi-m5
    beelink-gskingx
    beelink-gtking
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
