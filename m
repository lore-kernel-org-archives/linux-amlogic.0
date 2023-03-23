Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840D0C77B60
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2E1RJBJBsq1RIj+JCiwpiYiM+sfSPIFIXjbLxxz7S8=; b=IPjgHExDyMrORG
	8+zs33FZNwjQ2Hs2U8iRrLDb0zRaxmJBEygyoGiSNkLMmbzcObuRW6jwsxiI11YPnjiTQH+zTpEsW
	PIati5+pmfdwztjb1qW7ymahiUqQ/vV1EVizV3nFmijhae3p0g+psdFlCogBsrN/QtNH7xnri1bWr
	+m3H1iHSry/eRZK0FHlolWT16g7iJiJDMj9VYTgaUY7a5kVsivTNwNC/UWw5WGf64VHS/iWhnkI/N
	rVoWc0uP0h6iq/1z1f2Qjac2U8F0i19+2AGhGCAWZ3uocJuhsI2IPtAL5NwLSH8KNrpyU22eNbB3E
	jhhkoiKOVzCHWSS7z62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr2-0012hv-35;
	Thu, 23 Mar 2023 06:55:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqw-0012dx-0A
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id v1so13226025wrv.1
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oixIykBMvoGFssHX9IC6fC2nDt3/+Xhw8quPMHo5CAM=;
        b=GgQKT3Po/MAqsAyGbpAfxeg4qeVx9XEJeoqbouVI5kxNfe0kAthAfMUVLKabZTvGpd
         1gh22xcYJh54+zKUC2HNh6JXMhF57KJNhHe5UsONHHnNIfnwAOQoL8E22x+fETx7sUkH
         R2eCIhip2YLpWvHiBKndoajfskcXFOTC5P7vqzI1H4z6EdUb5uMYsga/QJgW/hZjql1M
         D2LKjOw+RmijmR9T/9Z2lth7FTa+F7u231KIIuwZCJi7dg/TpDGhSsNYYQhxVogGmmCs
         IGx68Dj6NP016qwYxqkboNcSHN9U9CWybB7BDOOhKUeC7GwO0M9tJui/bdeHWuVV32Mq
         Qy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oixIykBMvoGFssHX9IC6fC2nDt3/+Xhw8quPMHo5CAM=;
        b=b7C4un+2ecaG4QvAcNyVoAW8Svvs3M93mje1cLbhLqlCMSLG5mJpLyi5sGhTeICM0V
         6YZGDjuTPGM/vvDCYjApe6DF4LpEoO/ceRDwQTUDN/NDMrCI5dAGK4fwQHSVxEutafyU
         BHCHWPah1yeKY1To2/ihO3ZLQfImxqDN/cEEvp+R1p02zwz8KlLV9QEU0d1A+/NMZjL1
         jvpOi/uOa33T23/vWemzLm8Y/HODzH8MIzFHq7Ks0YtjONCUmGDq9qKqkZifIaV944g+
         MoDzz2PwmaaZ1sUNzfX3LsRCMX10p1ACTqCbx+YfOHWUxkleud/dMEFG0eesi0TVPpwT
         ntCA==
X-Gm-Message-State: AAQBX9cUzmxW2WZi3ashVK74zQse7u+aEsnRAJ5cfSX9qkXNNcKe6Y9D
	M7p39FRGqfw5RGSF2TjXLtsn7xA6aBcJjqbU
X-Google-Smtp-Source: AKy350Yw3ElP/D7r1czC+FlUCHnKxkov4djH9affgIgwXdIpuBrtz+S0r8kaUBqsIqgGqRvBtBxCdg==
X-Received: by 2002:adf:f147:0:b0:2d7:1ec1:9e46 with SMTP id y7-20020adff147000000b002d71ec19e46mr1535108wro.47.1679554512838;
        Wed, 22 Mar 2023 23:55:12 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 07/13] docs: boards: amlogic: add documentation for BananaPi M2S
Date: Thu, 23 Mar 2023 06:54:52 +0000
Message-Id: <20230323065458.776029-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235514_104910_500FEF23 
X-CRM114-Status: GOOD (  15.03  )
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

Add build docs for the BPI-M2S board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/w400/MAINTAINERS     |   2 +
 doc/board/amlogic/bananapi-m2s.rst | 152 +++++++++++++++++++++++++++++
 doc/board/amlogic/index.rst        |   1 +
 3 files changed, 155 insertions(+)
 create mode 100644 doc/board/amlogic/bananapi-m2s.rst

diff --git a/board/amlogic/w400/MAINTAINERS b/board/amlogic/w400/MAINTAINERS
index 26a4c2c587..042b523056 100644
--- a/board/amlogic/w400/MAINTAINERS
+++ b/board/amlogic/w400/MAINTAINERS
@@ -4,5 +4,7 @@ S:	Maintained
 L:	u-boot-amlogic@groups.io
 F:	board/amlogic/w400/
 F:	configs/bananapi-cm4-cm4io_defconfig
+F:	configs/bananapi-m2s_defconfig
 F:	doc/board/amlogic/w400.rst
 F:	doc/board/amlogic/bananapi-cm4io.rst
+F:	doc/board/amlogic/bananapi-m2s.rst
diff --git a/doc/board/amlogic/bananapi-m2s.rst b/doc/board/amlogic/bananapi-m2s.rst
new file mode 100644
index 0000000000..265df1aea7
--- /dev/null
+++ b/doc/board/amlogic/bananapi-m2s.rst
@@ -0,0 +1,152 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for BananaPi M2S (A311D & S922X)
+=======================================
+
+BananaPi BPI-M2S ships is a Single Board Computer manufactured by Sinovoip that ships in
+two variants with Amlogic S922X or A311D SoC and the following common specification:
+
+- 16GB eMMC
+- HDMI 2.1a video
+- 2x 10/100/1000 Base-T Ethernet (1x RTL8211F, 1x RTL811H)
+- 2x USB 2.0 ports
+- 2x Status LED's (green/blue)
+- 1x Power/Reset button
+- 1x micro SD card slot
+- 40-pin GPIO header
+- PWM fan header
+- UART header
+
+The S992X variant has:
+- 2GB LPDDR4 RAM
+
+The A311D variant has:
+
+- 4GB LPDDR4 RAM
+- NPU (5.0 TOPS)
+- MIPI DSI header
+- MIPI CSI header
+
+An optional RTL8822CS SDIO WiFi/BT mezzanine is available for both board variants.
+
+Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-M2S
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make bananapi-m2s_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh bananapi-m2s /path/to/u-boot/u-boot.bin my-output-dir
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
+    $ DIR=bananapi-m2s
+    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b khadas-g12b-v2015.01-m2s $DIR
+
+    $ cd $DIR
+    $ make bananapi_m2s_defconfig
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
+    $ cp $UBDIR/build/board/bananapi/bananpi_m2s/firmware/acs.bin fip/
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
index 8388acdd11..fa1b362731 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -87,6 +87,7 @@ Board Documentation
 
    bananapi-cm4io
    bananapi-m2pro
+   bananapi-m2s
    bananapi-m5
    beelink-gskingx
    beelink-gtking
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
