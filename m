Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B326C7618E
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UjcvVuei+D1kpGEnnWmnFAvZHn1c97X9SpAsX9UwlM=; b=RK+au1yxZeGqqb
	U20znqIggZEXwPp9JQqhonRhi00odIUsKixmT4cttGfJ8xYerNL5+k8A/GeH127fuM1/ppD2v0YyA
	Npo/MQKEdZ2pz9o6YlRmsF2V5PjTbXcSufG3GDWaWmA4O12pS4r5+DN0UGiNtRImHMq16A5XnQn1v
	P8izOmB4AdtaRNnHVqWbc7SLbvgBNFvi+TT45n4ZTAUKQ5XX3wu/zARAkDYP7lVUEr9+7MyHZstQY
	Cx6v/bffOspzmzvThyUWJf2zqHVtD/kGKu/v2k/9V2bloHwmyXjifSHj8X5FfJxOhd4/rPqJgcD+/
	eid9STwkIyIFDU/MKfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyb-008sGm-31;
	Mon, 20 Mar 2023 11:46:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyY-008rnC-2r
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so10043696wrq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAtnln5Ywi5ePclZoX20T/TmZufEC2pp0oMOI8VQoEk=;
        b=bvOd/rEcJjOoDtiEErlMGACkOHq2Qm1X68QqDBX122FBiljfMNsPZAAbL15/ohCnY9
         0Kegu6JOK2QTtMslncC/L11N7R7DN1hxJ5OXYqMkW27aAiSsvBBqC1MY6mVC1uLoGl27
         XpLe9JNUyhWAYgHLzVKbXnGGRQuW2YgasQHN7LD4SwR8k/vbZ82H8euMB+usY6LeRhIB
         eOiWCuckF/bdSAClu+xVXX8t5qRtDLDXdeHBt9Nr/4EUn12UTD8EfmqpX+zJi6OoeH30
         bWXCYhpsRP28mkJ87KU39REtpwP7pzy2eEBgYrAUwjmEvi3snEV51tM/JxexHD3DSboY
         LW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAtnln5Ywi5ePclZoX20T/TmZufEC2pp0oMOI8VQoEk=;
        b=rbxlzCahiCIyB9YUGR7AKMcNsm28iATSF8sA5sGdxnoQ5wzIqsA+299AHrqB64Owah
         DXKIT6lkOzFec/e3xEJ0/gKtFUwFXL7p81EBhTnlwUjh9t2AYZTc9MfY+PY8rTR1Z8C3
         KtIYg0UqRrTGoM/0BpF+Avw57I5bnU1evLcAHvxbek+ZN7IxrNaLREmshexvCEU+sH4d
         mDTBMjYYbyCR5LnYgBs6cDX5SVNBt+aDDrbFTvpm7ovBSfs6Ux0K4riBKDHyiSHKdhGu
         yJ3Uv2T7p3vKG763w7ruNkSPjg4raxBUJqtD2JwtOQh4BFVNeUmJBzW80OeAVPLuL0ZR
         RBlQ==
X-Gm-Message-State: AO0yUKUhqWc++hJYffYdZ4kKtG2Cv7x6e607Ukv1E3dpbFiUd2j01W+m
	GQGej7ItPBvMzdlpRT1E67M=
X-Google-Smtp-Source: AK7set9rchtCQXyRgPIQFl4jRIWjsYXNwhyqjJnLL+YX6B39rXhRxyhLNLdkgwciNOl5e0mYWjHhhw==
X-Received: by 2002:adf:ee91:0:b0:2ce:ae7d:f818 with SMTP id b17-20020adfee91000000b002ceae7df818mr14240210wro.23.1679312814462;
        Mon, 20 Mar 2023 04:46:54 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 26/33] doc: boards: amlogic: update documentation for SEI610
Date: Mon, 20 Mar 2023 11:46:02 +0000
Message-Id: <20230320114609.930145-27-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044654_920675_E88DAAC3 
X-CRM114-Status: GOOD (  10.40  )
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
 doc/board/amlogic/sei610.rst | 118 ++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 57 deletions(-)

diff --git a/doc/board/amlogic/sei610.rst b/doc/board/amlogic/sei610.rst
index 2d754497cc..84aaeff4ed 100644
--- a/doc/board/amlogic/sei610.rst
+++ b/doc/board/amlogic/sei610.rst
@@ -1,23 +1,22 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic SEI610
-=========================
+U-Boot for Amlogic SEI610 (S905X3)
+==================================
 
-SEI610 is a customer board manufactured by SEI Robotics with the following
-specifications:
+SEI610 is a customer board manufactured by SEI Robotics with the following specification:
 
  - Amlogic S905X3 ARM Cortex-A55 quad-core SoC
  - 2GB DDR4 SDRAM
  - 10/100 Ethernet (Internal PHY)
- - 1 x USB 3.0 Host
- - 1 x USB Type-C DRD
- - 1 x FTDI USB Serial Debug Interface
+ - 1x USB 3.0 Host
+ - 1x USB Type-C DRD
+ - 1x FTDI USB Serial Debug Interface
  - eMMC
  - SDcard
  - Infrared receiver
  - SDIO WiFi Module
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -26,14 +25,20 @@ U-Boot compilation
     $ make sei610_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `sei610`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh sei610 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -48,7 +53,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Download the latest Amlogic Buildroot package, and extract it :
+Download the latest Amlogic buildroot package and extract it:
 
 .. code-block:: bash
 
@@ -57,8 +62,7 @@ Download the latest Amlogic Buildroot package, and extract it :
     $ export BRDIR=$PWD/buildroot-openlinux-A113-201901
     $ export FIPDIR=$BRDIR/bootloader/uboot-repo/fip
 
-Go back to mainline U-Boot source tree then :
-
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -80,56 +84,56 @@ Go back to mainline U-Boot source tree then :
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
