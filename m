Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6265C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTx1Ra9VzwY+SY73GPksBUzXnGMZ/jQ4iGN+7KnHd3Q=; b=4+fQEtMn+DSGJF
	MC4HuZKNmcktFCV4bRyPVrzQi924mZZb3uhp8c4a3HCVxxTdVHskmYQ02M3txQXOd3J7tEt4MVFCl
	1tBu47eSy8Iw3RqNuvqbkiyqHxSQI1Hkt+6VpcD2o4+drc7SP7TyZlD+GxPZfoKss3abf98p8qpAG
	xESbRfrSbsac7svLeuthxqXLS1/gBZ7ACuEatdhbPLRw0piPmn5h3pqfEdYpcG42bGJU3L03qektc
	REjTT83UczmAwbk+ZL56Dfy/TyxYzyyPG6lFjf32gKBkWC0yxaoPfY+lVr/zuN01X4J8HuWT/sH/K
	zNXGaSXitveVGG1JI3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyH-008s0a-0q;
	Mon, 20 Mar 2023 11:46:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyD-008rwA-1T
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j2so10025624wrh.9
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIu2nkbZaeeSZVf/VpVNuKVvrHd1Zd4yr37NWjQNMt4=;
        b=o3tI3BPpIXyp9grPdHmQSJfOlQf1+8vIspFRes5hu7hgDI0EsE+/IZEM+Nf/jTM/Vt
         iaThXmlyOpswiIi2fMcxjivTyACJce5XV8B3JnZd3Pap4Jdi/IeHY0jwLuqdBLuxa20B
         jD2qxRJ03cOlCssa5uxkvp3WBukL/IwIvhK82eHv7Vgj2quRkMWcfuv5xzA7Cb86oIx8
         /eN57tnYNFLBBTZeWYOGYc/PRogdBJYIfBTwxF2lRXOPGBH9RhDT3sCgNhO2Stfjxm6S
         XT22a6QR/AA4Y4gNTES9H/8m70d22H6l6XNeLO6jj3ezV+VeP1YJm9/mNIUOlS83V5mt
         X1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIu2nkbZaeeSZVf/VpVNuKVvrHd1Zd4yr37NWjQNMt4=;
        b=evBP7x8ZZti7h/3BoZF6fHrzCfM5IS4jcUZNd4mVPOh2pIK/X3mcpldv6U9QEZGB03
         ClfnlMbSfiZNV+cauiA5LcPRjsdfJYfNHThTpGpRO82YF+BE6mKMKV0jnlbX7LYtxKOD
         hP8AuXWx6PTOC9bEm0MoKIs9ZGPWz4JLNxogVVhapTcQ/E2XW4f4HC86wbUa9ESGgAIN
         y1EEJPfjNHk5xu1a0XM1CcGnNMrsQWve5HGzN05q0VXsSg9DqEM10dRgfoX+NyfZCrXw
         mUUJ2JVyB3xDP3RLeOXOJV5zi+YKX3lb6QvaDG9L0t2hjhx5Kx5zlJqBVTUAgIW9wGaz
         FyzQ==
X-Gm-Message-State: AO0yUKXk+f7NNwZRq8B1U0lnl9FOFf4CxwCAwFIZ+7jttfl6v0YGBZPa
	QFrf0JcXGNMbNHPtTrkToXM=
X-Google-Smtp-Source: AK7set+4700uyCBz5nTpBowAK1xG46/wTZah1K8ec7Bq4QkcxXZXQzk3gXSQSD9kV9YcdRj419g18w==
X-Received: by 2002:adf:eb0e:0:b0:2d7:1ec1:9e46 with SMTP id s14-20020adfeb0e000000b002d71ec19e46mr2024285wrn.47.1679312791696;
        Mon, 20 Mar 2023 04:46:31 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:31 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 12/33] doc: boards: amlogic: update documentation for LaFrite
Date: Mon, 20 Mar 2023 11:45:48 +0000
Message-Id: <20230320114609.930145-13-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044633_497874_F8F1AF0D 
X-CRM114-Status: GOOD (  10.67  )
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
 doc/board/amlogic/libretech-ac.rst | 77 ++++++++++++++++--------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/doc/board/amlogic/libretech-ac.rst b/doc/board/amlogic/libretech-ac.rst
index 7a915f9f26..6ebb7f646d 100644
--- a/doc/board/amlogic/libretech-ac.rst
+++ b/doc/board/amlogic/libretech-ac.rst
@@ -1,9 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for LibreTech AC
-=======================
+U-Boot for LibreTech-AC 'LaFrite' (S805X)
+=========================================
 
-LibreTech AC is a single board computer manufactured by Libre Technology
+LibreTech-AC aka 'LaFrite' is a Single Board Computer manufactured by Libre Computer
 with the following specifications:
 
  - Amlogic S805X ARM Cortex-A53 quad-core SoC @ 1.2GHz
@@ -13,12 +13,13 @@ with the following specifications:
  - HDMI 2.0 4K/60Hz display
  - 40-pin GPIO header
  - 4 x USB 2.0 Host
- - eMMC, SPI NOR Flash
+ - SPI NOR Flash
+ - Removable eMMC module
  - Infrared receiver
 
 Schematics are available on the manufacturer website.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -27,14 +28,20 @@ U-Boot compilation
     $ make libretech-ac_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `lafrite`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh lafrite /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -50,7 +57,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Download the latest Amlogic Buildroot package, and extract it :
+Download the latest Amlogic buildroot package and extract it:
 
 .. code-block:: bash
 
@@ -58,7 +65,7 @@ Download the latest Amlogic Buildroot package, and extract it :
     $ tar xfz buildroot_openlinux_kernel_4.9_fbdev_20180418.tar.gz buildroot_openlinux_kernel_4.9_fbdev_20180418/bootloader
     $ export BRDIR=$PWD/buildroot_openlinux_kernel_4.9_fbdev_20180418
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -73,40 +80,40 @@ Go back to mainline U-Boot source tree then :
     $ cp u-boot.bin fip/bl33.bin
 
     $ sh $UBOOTDIR/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+                   fip/bl30.bin \
+                   fip/zero_tmp \
+                   fip/bl30_zero.bin \
+                   fip/bl301.bin \
+                   fip/bl301_zero.bin \
+                   fip/bl30_new.bin \
+                   bl30
 
     $ $BRDIR/bootloader/uboot-repo/fip/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
     $ sh $UBOOTDIR/blx_fix.sh \
-    	fip/bl2_acs.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/bl21.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+                   fip/bl2_acs.bin \
+                   fip/zero_tmp \
+                   fip/bl2_zero.bin \
+                   fip/bl21.bin \
+                   fip/bl21_zero.bin \
+                   fip/bl2_new.bin \
+                   bl2
 
     $ $BRDIR/bootloader/uboot-repo/fip/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
     $ $BRDIR/bootloader/uboot-repo/fip/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
     $ $BRDIR/bootloader/uboot-repo/fip/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
     $ $BRDIR/bootloader/uboot-repo/fip/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
     $ $BRDIR/bootloader/uboot-repo/fip/gxl/aml_encrypt_gxl --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc
+                   --output fip/u-boot.bin \
+                   --bl2 fip/bl2.n.bin.sig \
+                   --bl30 fip/bl30_new.bin.enc \
+                   --bl31 fip/bl31.img.enc \
+                   --bl33 fip/bl33.bin.enc
 
-and then write the image to SD with:
+Then write U-Boot to USB or SPI-NOR with:
 
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
