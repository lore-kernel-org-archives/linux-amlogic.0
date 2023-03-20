Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B354C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sMLNyViBqbuBH6owd+xH4WVsYp6awX+hD35XWGBLLM=; b=MHRHS7bWuz5S6v
	qWSJh4PprigRNWKvwNKREaWudjuP4m7OtZ9ssalAPfhxqk9UdeamiQO2Pu8Ly0N/d3Mc7Szkr/Lsy
	XFMbTQqCZy3s5IsGD3njAk0dIIgvhM3GQwr2ci+hj1vODioT+UxYR+nKLyBuG6t3xo7eUlwT4FWRx
	17hf4nOzR7csAOL4XejiW756/nkB06pjI89ISlgeHuVacQCnC953oChYtlkk/vHoQ5euipuJsQ7On
	hAZDuVRSvkgGGSERdH0uhshVWN5O0YKfYDqxa1yvc4tCnUoYkRtGapDVjJzfkO+kl9REMAbIo0VHz
	HPYsWh9ZgWT2OJSfM1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDye-008sIu-1C;
	Mon, 20 Mar 2023 11:47:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyc-008rjz-0U
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id j24so1129623wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bugdDMHDRSrJ0SoWYmfBOUKMC6hXV0hF4DSwnKaEycw=;
        b=PymzN8ZDc0V0y27EX4+AH7pL9qAairBwP+7pLRF2gcz+e/ynD0tIWMh4G+GKV5kZj2
         /3wcV7IIev9Ys8q3EcXsnjBM/5oIoup2NNAN+C3xn+Io1Ysytp14acP1uYVe3jNlOtgC
         hWdcmq8G8GGvkq8XrrGR+9edES1sq30TNWzj/tree6kZ1sbXVOAJV8MheR4YzBh1oI1q
         zRx9JQd2L3wD0bVUxqvgWQGqA5CyoVfhJzXqHPB6fsH03TMvHXwJWuLDUYIbYMcXcp/F
         qLMnJ9LJ0B3vlemkjJJXLM+5cLai/vsslKKnQxWQX0e9TRNc12jhYAfYED8CA6qJGEJm
         2Oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bugdDMHDRSrJ0SoWYmfBOUKMC6hXV0hF4DSwnKaEycw=;
        b=Jz6AGJGgoxRZAzji8MG6TM1IPAl2q2XIHqA0ovQ+xB3ELhRDNikZxDh3kR6FU/gyCA
         cJU0nJmeZF9IhLZHdpjXPloa/eOpyZKWAG8DlJS50auoY51mjiaRHnxI6StNya9vY/7n
         Q71O8yVZszicn7XAl6FELAbA/7Ah8M+bgAaICm0svU91x0M0tQrFP+vVGL7/FGm/5VJf
         9UH/B45N8Dzoh9cUysR2pwwg4y34IiDW4gI2TDvCzvw/xfgCZyvKQDBDjb6qys1GuI6o
         a4vtTqzkqWfkeqwJwA+noJ50MTIfnW+YC27Kz10HG/ckReGunwOakwvWBDabK5e3aWZq
         un/w==
X-Gm-Message-State: AO0yUKWETbFUqHew12gYJac92W1tXW73eTW3ZAkuYl/tKY6bPSb4e+MH
	XfH1V6U1VMcHBo1tbQ55JUI=
X-Google-Smtp-Source: AK7set/7qmK/l7O1KqA1nFXd8+iLVc2UqEUHF2Uq7xq0VEVweBRYLBtgPMygadDqpakvjeBzNAng7Q==
X-Received: by 2002:adf:f711:0:b0:2ce:a893:e45f with SMTP id r17-20020adff711000000b002cea893e45fmr13231405wrp.15.1679312817623;
        Mon, 20 Mar 2023 04:46:57 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:57 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 28/33] doc: boards: amlogic: update documentation for W400
Date: Mon, 20 Mar 2023 11:46:04 +0000
Message-Id: <20230320114609.930145-29-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044658_208156_DE790420 
X-CRM114-Status: GOOD (  10.91  )
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
 doc/board/amlogic/w400.rst | 115 ++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/doc/board/amlogic/w400.rst b/doc/board/amlogic/w400.rst
index 38dbf52fb9..634fe1298d 100644
--- a/doc/board/amlogic/w400.rst
+++ b/doc/board/amlogic/w400.rst
@@ -1,15 +1,14 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic W400
-=======================
+U-Boot for Amlogic W400 (S922X)
+===============================
 
-U200 is a reference board manufactured by Amlogic with the following
-specifications:
+W400 is a reference board manufactured by Amlogic with the following specification:
 
  - Amlogic S922X ARM Cortex-A53 dual-core + Cortex-A73 quad-core SoC
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
@@ -29,12 +28,20 @@ U-Boot compilation
     $ make w400_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh jethub-j100 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -49,7 +56,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Download the latest Amlogic Buildroot package, and extract it :
+Download the latest Amlogic buildroot package and extract it:
 
 .. code-block:: bash
 
@@ -58,7 +65,7 @@ Download the latest Amlogic Buildroot package, and extract it :
     $ export BRDIR=$PWD/buildroot_openlinux_kernel_4.9_fbdev_20180706
     $ export FIPDIR=$BRDIR/bootloader/uboot-repo/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -81,57 +88,57 @@ Go back to mainline U-Boot source tree then :
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
 
     $ $FIPDIR/g12b/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
-    					--output fip/bl30_new.bin.g12a.enc \
-    					--level v3
+                                              --output fip/bl30_new.bin.g12a.enc \
+                                              --level v3
     $ $FIPDIR/g12b/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
-    					--output fip/bl30_new.bin.enc \
-    					--level v3 --type bl30
+                                             --output fip/bl30_new.bin.enc \
+                                             --level v3 --type bl30
     $ $FIPDIR/g12b/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
-    					--output fip/bl31.img.enc \
-    					--level v3 --type bl31
+                                             --output fip/bl31.img.enc \
+                                             --level v3 --type bl31
     $ $FIPDIR/g12b/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
-    					--output fip/bl33.bin.enc \
-    					--level v3 --type bl33
+                                             --output fip/bl33.bin.enc \
+                                             --level v3 --type bl33
     $ $FIPDIR/g12b/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
-    					--output fip/bl2.n.bin.sig
+                                             --output fip/bl2.n.bin.sig
     $ $FIPDIR/g12b/aml_encrypt_g12b --bootmk \
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
+                                    --ddrfw8 fip/aml_ddr.fw \
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
