Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF6C7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6D40scd9MswEj8o9VN23v65lxXwQpQ5IWReD/B29nLc=; b=qeblohyGlkxuR6
	vf+QrCX4sy+E3+Ej+MaCvSDThbCqv3ZWIKyk7VuvxAKrjEJtVGyH7FQWhbBCcKJs06nhmwYRkbSLa
	ABA0c6c9aGOfpbu2LDsNWIpAxJixpTkJCPVKMDjUsUM539BhE/xrxdSrA2/LK5LDVJznjlOQGpZ9G
	YeUM4PJclE4VTNnsdo5AP16gLdU4h+DyfNWWINStYy6BNfZd6/P3Zy6XsVT2gQp/yjQkDwbBozs2h
	fc1TcIBEHZmv0uctEfcCaxCWrmY1VJBckIvao+WFBkVAzrhRmG+QFmeeqJSoeA87K6FhBpuBVUYdw
	wGCL1Cz5hqQOQsmX2yiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy9-008ru8-2o;
	Mon, 20 Mar 2023 11:46:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy5-008rp7-2J
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o7so10042887wrg.5
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDDPokm7BWMRXPNQJsOsLQ6+Agr/JtPpcM2AM4ODhyQ=;
        b=qAqxy0pI6FTuUZrUueK5qMIGhQytoskBnXtNXVPU5tUvbTcZaYUImnihylriZzJsdW
         qJA0EhJUR5vvILeiOQ274JxFCPOmitFC7Kt6aPdGuM4KInxI91e8EoB67mFloywhQoif
         UVjcFG2w0eZH4CCKluKPSwErOQwxhOoLYaA6BS0+3YBFCJ4IRr9HMxOLKcEjE72o5Zz0
         eFakHzmTbTyvpQkOYXQUphStuGfHIHH4pCZvEmm3TqAPnsuCfP86DZHZegRERUOFbUxu
         MZuN5/+OxlDKqSC+BQhl/6DgXHoI0wybthjscYscHGquArdwMQOZA+gp6miHWiPNSPp0
         9x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDDPokm7BWMRXPNQJsOsLQ6+Agr/JtPpcM2AM4ODhyQ=;
        b=jbLvR7M5hVW1q5zNI8Jkq6O+mc/voVVjtrC/yh+4Uq/q+ZLHphxQM8DssZQqRbbShQ
         eYApfUkzOJv/DGIPsK+ziKfGEvRlPXZybMMSAyn6G+4AnX4hGLgL1vmYWqFvi/TnVtA4
         N7VXelpe5Mgbhc4wm2CUvpOMAP7mmV9Bmtp1d2Xx/h1WPE90Y07C0fqzUKdSipvg/EXy
         dg3XO9ysUnjuhJIanC6aoftM2XpGB2qiYmQN7zdqGL1nADljbjG+pTp+kdn/i4Xns+w1
         qWa418IYwNd/Y6elCuCy+N0n3cge9bAunghYEsnjqtyFBIauWhO0WMwgvUJ3n4Y2Kzcu
         NjKQ==
X-Gm-Message-State: AO0yUKXp+MPLbbGZ4LsyzbiqcQkgLaPPGnKewGJhLZLSDCeuXJRy5Lso
	M4rYL5t/2pVzkCsxF5JB4FI=
X-Google-Smtp-Source: AK7set84B2F+4sNgZiEFVNGrsnDDvoV35xZcfWmyfFZoQzKtAAkFmFIIRWrhyNto5sH3f1Y+2DaCMQ==
X-Received: by 2002:adf:dec9:0:b0:2d4:e032:6322 with SMTP id i9-20020adfdec9000000b002d4e0326322mr5580832wrn.31.1679312783699;
        Mon, 20 Mar 2023 04:46:23 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:23 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 07/33] doc: boards: amlogic: update documentation for JetHub J80
Date: Mon, 20 Mar 2023 11:45:43 +0000
Message-Id: <20230320114609.930145-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044625_752551_4B382832 
X-CRM114-Status: GOOD (  10.52  )
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
 doc/board/amlogic/jethub-j80.rst | 46 ++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/doc/board/amlogic/jethub-j80.rst b/doc/board/amlogic/jethub-j80.rst
index f669a0118d..d20fbad4c5 100644
--- a/doc/board/amlogic/jethub-j80.rst
+++ b/doc/board/amlogic/jethub-j80.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for JetHub J80
-======================
+U-Boot for JetHub J80 (S905W)
+=============================
 
-JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation
-controller manufactured by JetHome with the following specifications:
+JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation controller device
+manufactured by JetHome with the following specifications:
 
  - Amlogic S905W (ARM Cortex-A53) quad-core up to 1.5GHz
  - No video out
@@ -21,7 +21,7 @@ controller manufactured by JetHome with the following specifications:
  - DC source 5V microUSB
  - Square plastic case
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -30,14 +30,20 @@ U-Boot compilation
     $ make jethub_j80_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `jethub-j80`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh jethub-j80 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain binaries
-from the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -45,7 +51,7 @@ from the git tree published by the board vendor:
     $ cd jethub-u-boot
     $ export FIPDIR=$PWD
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -84,16 +90,16 @@ Go back to mainline U-Boot source tree then :
     $ $FIPDIR/j80/aml_encrypt_gxl --bl3enc --input fip/bl33.bin --compress lz4
     $ $FIPDIR/j80/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
     $ $FIPDIR/j80/aml_encrypt_gxl --bootmk \
-                --output fip/u-boot.bin \
-                --bl2 fip/bl2.n.bin.sig \
-                --bl30 fip/bl30_new.bin.enc \
-                --bl31 fip/bl31.img.enc \
-                --bl33 fip/bl33.bin.enc
+                                  --output fip/u-boot.bin \
+                                  --bl2 fip/bl2.n.bin.sig \
+                                  --bl30 fip/bl30_new.bin.enc \
+                                  --bl31 fip/bl31.img.enc \
+                                  --bl33 fip/bl33.bin.enc
 
-and then write the image to SD/eMMC with:
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
