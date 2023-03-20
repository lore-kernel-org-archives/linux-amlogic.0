Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FF6C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtynN2VKg+u5R8tk9k6tgBd8OYZR3vsYCHHU6M/MfG0=; b=DhdLhu5mycJt5F
	amXtf2pFrOAy9d2kbry6XvxyAo+nj3jx7qE70z6OxDXQa0FWjD0VRJgFuyFl1tdJyqh0zK8cnFgVK
	bX6Wys7OsrZ4A4FkxS69xqk7FatiB8ukQQgyn6rbh9BECcH+qOosn26/lBqXBQLXG32XdaR9css5n
	4KRBZdGXkzBkCUicGMmj/lh/ZDCKYZHGqNXRm1sSVXeZtdrU+IasT0q+ZT0Qb/oSAF9IrOvxHs17w
	QkxQPv9vD0jMmARQG1Zcukz+RLxW6g/v2K9MTf1UKWx1SKtL2flTU3onHMEkSkFkm9/7V4dlG1UzI
	XBNgMdz6kz0B/slHWRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyo-008sQ9-16;
	Mon, 20 Mar 2023 11:47:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyl-008sFI-0h
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id h17so10028148wrt.8
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmcVnpXoBYjxiK6PzinhKQ1A5neoyZ/06WqfZdqy/O4=;
        b=lvCSbjLvNehou79aEj41MlM42kMjhSe+Vx02tFHzWxYyJIi6eg7G7eqqHSwfnjRm9p
         HnRyuOm3F5kZ1spTthm5LvF9XTZy4QmHbpcTX62VCreJzZQKP24KLDZYHIDqWx32/+73
         +UmR5mBL1+szcxRJn1W+WaK1CKftlBsUnoQEgzoWdyDln6QTeMNHSHsSD9Ae57kezSgo
         NE9gU6KCAD5RmBmwIJTDXt8UEqwfG9aVknnv2le6csvQHse3qAV6QTKmIJp6xcr1IBxc
         Krp14ikh7GU0LioUvoDYGLJ7826qE37y3EsQM6vMBX7+PvjOTpVwReR6D8i/7cHOnj00
         L2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmcVnpXoBYjxiK6PzinhKQ1A5neoyZ/06WqfZdqy/O4=;
        b=X2gqtw+Sb71J1oz76mLgSKRiRm6Omt5keUe7ejkyA7ITIxjcCoFZ7OqOUwZV/SIOQk
         Gqx6cA8b1Lymlnc6/cvBuiCLl57LzyGc5z6jajlwoKn30pb2UGU0ZBSBBC4r8sojkRyA
         pmUtS5CgMfRQsX0Wy5lSJBdzykln/9zKZJZ3PRsewOVRc4/o/jTPyOGWDhT/qOtenaU4
         /92iVW9YPV2qhEdyAaOHLe2dnr6t9LxifdRBoqWCPGLGq3MjPAAYw583q87sz7mU08nv
         0OYXj2epB8GavVFX2No3soktDNtIpuayf2KjEL1TZGmCePshk15lJ5LydkFulONnwRVZ
         1LzQ==
X-Gm-Message-State: AO0yUKVM5Qbw/p7RtqDAwGpWaNoor4CRl/6qrkzEkuDhY94HKLlbkemw
	8urILM/BT0K/8rSCWow59Uk=
X-Google-Smtp-Source: AK7set/MNDRNwT+T+Uv7GhUKfTgQaYyz+kimCUgwOmmSiF8QF5kCiQReq/bJu8j06V677NedDY7nNg==
X-Received: by 2002:adf:dcca:0:b0:2c5:4db8:3dde with SMTP id x10-20020adfdcca000000b002c54db83ddemr13643515wrm.70.1679312815967;
        Mon, 20 Mar 2023 04:46:55 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:55 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 27/33] doc: boards: amlogic: update documentation for U200
Date: Mon, 20 Mar 2023 11:46:03 +0000
Message-Id: <20230320114609.930145-28-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044707_255244_9B3A42E0 
X-CRM114-Status: GOOD (  11.02  )
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

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/u200.rst | 113 +++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/doc/board/amlogic/u200.rst b/doc/board/amlogic/u200.rst
index 53213fdb68..6d1d66b4ea 100644
--- a/doc/board/amlogic/u200.rst
+++ b/doc/board/amlogic/u200.rst
@@ -1,15 +1,14 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic U200
-=======================
+U-Boot for Amlogic U200 (S905X2)
+================================
 
-U200 is a reference board manufactured by Amlogic with the following
-specifications:
+U200 is a reference board manufactured by Amlogic with the following specification:
 
  - Amlogic S905D2 ARM Cortex-A53 quad-core SoC
  - 2GB DDR4 SDRAM
  - 10/100 Ethernet (Internal PHY)
- - 1 x USB 3.0 Host
+ - 1x USB 3.0 Host
  - eMMC
  - SDcard
  - Infrared receiver
@@ -20,7 +19,7 @@ specifications:
 
 Schematics are available from Amlogic on demand.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -29,14 +28,20 @@ U-Boot compilation
     $ make u200_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `u200`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh u200 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -51,7 +56,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Download the latest Amlogic Buildroot package, and extract it :
+Download the latest Amlogic buildroot package and extract it:
 
 .. code-block:: bash
 
@@ -60,7 +65,7 @@ Download the latest Amlogic Buildroot package, and extract it :
     $ export BRDIR=$PWD/buildroot_openlinux_kernel_4.9_fbdev_20180706
     $ export FIPDIR=$BRDIR/bootloader/uboot-repo/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -82,56 +87,56 @@ Go back to mainline U-Boot source tree then :
     $ cp u-boot.bin fip/bl33.bin
 
     $ sh fip/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+         fip/bl30.bin \
+         fip/zero_tmp \
+         fip/bl30_zero.bin \
+         fip/bl301.bin \
+         fip/bl301_zero.bin \
+         fip/bl30_new.bin \
+         bl30
 
     $ sh fip/blx_fix.sh \
-    	fip/bl2.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/acs.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+         fip/bl2.bin \
+         fip/zero_tmp \
+         fip/bl2_zero.bin \
+         fip/acs.bin \
+         fip/bl21_zero.bin \
+         fip/bl2_new.bin \
+         bl2
 
     $ $FIPDIR/g12a/aml_encrypt_g12a --bl30sig --input fip/bl30_new.bin \
-    					--output fip/bl30_new.bin.g12a.enc \
-    					--level v3
+                                              --output fip/bl30_new.bin.g12a.enc \
+                                              --level v3
     $ $FIPDIR/g12a/aml_encrypt_g12a --bl3sig --input fip/bl30_new.bin.g12a.enc \
-    					--output fip/bl30_new.bin.enc \
-    					--level v3 --type bl30
+                                             --output fip/bl30_new.bin.enc \
+                                             --level v3 --type bl30
     $ $FIPDIR/g12a/aml_encrypt_g12a --bl3sig --input fip/bl31.img \
-    					--output fip/bl31.img.enc \
-    					--level v3 --type bl31
+                                             --output fip/bl31.img.enc \
+                                             --level v3 --type bl31
     $ $FIPDIR/g12a/aml_encrypt_g12a --bl3sig --input fip/bl33.bin --compress lz4 \
-    					--output fip/bl33.bin.enc \
-    					--level v3 --type bl33
+                                             --output fip/bl33.bin.enc \
+                                             --level v3 --type bl33
     $ $FIPDIR/g12a/aml_encrypt_g12a --bl2sig --input fip/bl2_new.bin \
-    					--output fip/bl2.n.bin.sig
+                                             --output fip/bl2.n.bin.sig
     $ $FIPDIR/g12a/aml_encrypt_g12a --bootmk \
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
-    		--level v3
-
-and then write the image to SD with:
+                                    --output fip/u-boot.bin \
+                                    --bl2 fip/bl2.n.bin.sig \
+                                    --bl30 fip/bl30_new.bin.enc \
+                                    --bl31 fip/bl31.img.enc \
+                                    --bl33 fip/bl33.bin.enc \
+                                    --ddrfw1 fip/ddr4_1d.fw \
+                                    --ddrfw2 fip/ddr4_2d.fw \
+                                    --ddrfw3 fip/ddr3_1d.fw \
+                                    --ddrfw4 fip/piei.fw \
+                                    --ddrfw5 fip/lpddr4_1d.fw \
+                                    --ddrfw6 fip/lpddr4_2d.fw \
+                                    --ddrfw7 fip/diag_lpddr4.fw \
+                                    --level v3
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
