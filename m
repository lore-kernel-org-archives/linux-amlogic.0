Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809AC7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me8TD6Fg2M/0/mDw6FhLe15J55AsszKV+satQj+/opw=; b=M3l2PjFJIWqzuj
	OzZtFjdz9Zv122fre6qIuBM6kHUUFKr9O+XCEke7EyYzT8Z3Xr2y4aRA96aVLEiBrtsoqY57eIBxz
	8lnyyH255D4CPt/oT2raImUDH4DS8nKhg01BpCibt/h/fdZN5dXaMAqKBId5Q3Cr8OpeBxbujK3dE
	/MtqBS3uXTaQacxzmyTvPABqlQ5NNA+zAa3FnKKQTwGXgsA7gxqCt3O8CgtwP1BCtorkZJjfvluBE
	OJ23g7mGL/A6M4A/UwgoaVgmoVCqcvQCrRJqwMyyZXKPHq2wpDBNYnPSi39MekkxL0zRWvkH+rLUl
	Laqg+VQtEnnu8DoV4IWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyQ-008s7x-1H;
	Mon, 20 Mar 2023 11:46:46 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyK-008s28-1R
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:42 +0000
Received: by mail-wm1-f44.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso7315309wmo.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAPjc+wftc1KWbsSLasANfXAMogdqoGMpHyLr7Kq5OU=;
        b=Ubbb42P0tUB0e/2/FJdvBuI8/Blt7CIlj5zO67QUPjUJqfu0zh+rgYMBknHCkpJPyW
         fTCh4Y2kP3QKdIW1H4dTOyEARdcwP0aRm6GZTGYCiIyu2doc5LC7cpG7aDbyuugHIdbI
         W7+fwwudQIBKKVSa6NP/g1fMZgp6TZJ9r8sqk/plMBCiclfw+Wgm66WlOD9V3yhVcX09
         f/7blStQfTjRGU/5baoh4OUJBc/ey677cGekZBK1/ah7cV0kl8zFmDP8D2uAk2rEphus
         HWUwY2VVfIl1O5G8mlggTykzbJPIxb0WdspaKEgZ9lIJooUEJEd9Fz7HjOJI6u+eJSiD
         t3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAPjc+wftc1KWbsSLasANfXAMogdqoGMpHyLr7Kq5OU=;
        b=IBlnUbMjmn6D+dF7bStJkKZATXfTf6TgA4b2mKUwqADijWz/FKoha0Q5/gmFCBCS4y
         meChMptebax2sNEAGC1TRRzPOs6H/vAw5N7Esib027yPgL+IC32+Kn+eLQUFX9+SX/9T
         6r3ToEIEUOLmOJcyKjJksK9MUyQxkadjJx98P/FpEAHdKl70IQZDMyaAx+gg9fbvFdek
         50w5h6Iqk0m3rnU34gitZ5bi6AWSQsyHYJxWRe6LlzvwPALXhgeqD/c/nLWebXiENhlU
         EMtphONevWizEIQaLhdKP3OyHzJRk7AIiaKnky1Ox2yAAcjXheWW72G0XyoJviZE7XEw
         6d3A==
X-Gm-Message-State: AO0yUKXjNkXusG+CyZBCUOPNPqBHqRuAcyA6L3N07tsX5v24/XBFpK1a
	2ySpcPoyorh6edABGiRwivA=
X-Google-Smtp-Source: AK7set9JOfRF8mFwlxlZwZB+dozSQra04LoYj0R2LevmwB73UTz+DSG62SQG9iBSkZspj1m9eqVK3w==
X-Received: by 2002:a05:600c:201:b0:3ed:e715:1784 with SMTP id 1-20020a05600c020100b003ede7151784mr3566004wmi.15.1679312798421;
        Mon, 20 Mar 2023 04:46:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 16/33] doc: boards: amlogic: update documentation for ODROID-C4
Date: Mon, 20 Mar 2023 11:45:52 +0000
Message-Id: <20230320114609.930145-17-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044641_144960_68C27BCC 
X-CRM114-Status: GOOD (  11.14  )
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

Improve documentation. Notably drop references to the ODROID-HC4 board
as its support has evolved and we will add an HC4 specific document in
a later patch.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/odroid-c4.rst | 117 ++++++++++++++++----------------
 1 file changed, 60 insertions(+), 57 deletions(-)

diff --git a/doc/board/amlogic/odroid-c4.rst b/doc/board/amlogic/odroid-c4.rst
index b512c6a3d8..89198cda91 100644
--- a/doc/board/amlogic/odroid-c4.rst
+++ b/doc/board/amlogic/odroid-c4.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for ODROID-C4
-====================
+U-Boot for ODROID-C4 (S905X3)
+=============================
 
-ODROID-C4 is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
+ODROID-C4 is a Single Board Computer manufactured by Hardkernel with the following
+specifications:
 
  - Amlogic S905X3 Arm Cortex-A55 quad-core SoC
  - 4GB DDR4 SDRAM
@@ -17,12 +17,9 @@ Co. Ltd with the following specifications:
  - UART serial
  - Infrared receiver
 
-The ODROID-HC4 is a variant with a PCIe-SATA controller, the same commands
-applies for HC4.
-
 Schematics are available on the manufacturer website.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -31,14 +28,20 @@ U-Boot compilation
     $ make odroid-c4_defconfig
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
+    $ ./build-fip.sh odroid-c4 /path/to/u-boot/u-boot.bin my-output-dir
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `odroid-c4` or `odroid-hc4`
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -58,7 +61,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -82,58 +85,58 @@ Go back to mainline U-Boot source tree then :
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
+Then write the image to SD or eMMC with:
 
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
