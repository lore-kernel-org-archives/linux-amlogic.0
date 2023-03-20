Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C090C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hKpayawMJX5vpMQwmhaI7+vJo9pWF3LscIPEePOkTM=; b=tiUk34ilRNJrNy
	0nyF3lL4CROGbjEH8yZorZ8ptIkmEKmPxUJGgXzamyjhBt6Yfj9GaGWqttt2PbBMHZXv6qWNFFlU3
	PRG685REjD4t9cweLveNAnXnYNJK1hgwJuj/fvwzj9yDEowId4MbFceiN4CJohHWhRYIyfysC/AX1
	6HQZBK+fItZOVzRzhYpu86Gfc8tBjMG3zVmuFtNsZo8VnbG9L3YULptfzR4ws9a77sX7vl2NQ2HGw
	VR2ZRbDuOf2FGj6fsbPO5kTW0+ZUMDjCQVt4fTEg8Azyk1xlmwogHrrT6qELjR5ZwbQywnMGebfT3
	NsY1sjFJt2haUJABgqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7b-00928O-0y;
	Mon, 20 Mar 2023 13:00:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyF-008rjz-22
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id j24so1128529wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxnHVYKNCE/GVy5zjfpoO6N7DVnCQIkYWWe8AnYCmdM=;
        b=fnSboEXCJulyFxFta06RIg6NksExFjstwLMrC71YYz2tA7+Dona8D09KXndbpVD1r4
         FjAsw8yarbYPLWYgP88IlB0m15Kpt937eVhQWkSCOONdrb85weV0bc6wzSGxWeVSzkRb
         dRETCFYClXARixjI32/l5HmIiNiFCHg9fti7i6FeVr0kEUwsblNGhXiIth0h8i7jkesC
         qNOJihnT4xCAFKChNYvenroosKFPbGr8RZGW9JvBgT8a3M9KDKYi5JLsfQXueFKZKalH
         bDCiYe7RV8fYXlwWSAAviPV/ljx7v3Vsm3+0Iow/Pvf/zB87IcnQBvruPBc2ignPRofY
         5CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxnHVYKNCE/GVy5zjfpoO6N7DVnCQIkYWWe8AnYCmdM=;
        b=pDFICZ3X/98fz9hYy8ozeC+/RsMesSpn0R5fcNyThJ8FEVrLIcXICA6d2pV/bNF88h
         fqsuCpys/8TCT8+RndItXPLJ9/1l9Si0nUnx9BmpxoB/7mVvQskCw97FZmKLwcfHLwOY
         k0e2hp7kZm/GqXgtJipyfrHcKoLZacyYhucO8CUq/RCid2GV6OWTxVMpvQvV/lzuQ2Au
         iSQM2lP52q1641df8oNdxFudXIrWsVHS2MnPVcNaVyQg51vf87EdgVZ6LScOAFPeXcQV
         O+7ZhY+bje8p8/VXRtsbipEeiN8J4BwLLtr4qMXWze+hRU+bevgOPiQZSKd2JfxB/Sxx
         sufA==
X-Gm-Message-State: AO0yUKXtxoahj8laWdW90qosj0V5muG74xUO9yZQTTsyoQZ2Lsmwf6pP
	6wG1iJVDboujw7UEKjvtcqA=
X-Google-Smtp-Source: AK7set/JMo8sS9q2FAdmp66axHFTTwmNmzCaiwiYZl8AzosPf6xvjHn0V+O6lIxFj11SrwIfFyy3IQ==
X-Received: by 2002:adf:f711:0:b0:2ce:a893:e45f with SMTP id r17-20020adff711000000b002cea893e45fmr13230768wrp.15.1679312795148;
        Mon, 20 Mar 2023 04:46:35 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:34 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 14/33] doc: boards: amlogic: update documentation for NanoPi-K2
Date: Mon, 20 Mar 2023 11:45:50 +0000
Message-Id: <20230320114609.930145-15-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044635_675938_90E0974F 
X-CRM114-Status: GOOD (  11.41  )
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

Improve documentation. Notably we can now support U-Boot install to
the removable eMMC storage module in addition to SD cards.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/nanopi-k2.rst | 93 +++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/doc/board/amlogic/nanopi-k2.rst b/doc/board/amlogic/nanopi-k2.rst
index 76ff874434..2316dae0ec 100644
--- a/doc/board/amlogic/nanopi-k2.rst
+++ b/doc/board/amlogic/nanopi-k2.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for NanoPi-K2
-====================
+U-Boot for NanoPi-K2 (S905)
+===========================
 
-NanoPi-K2 is a single board computer manufactured by FriendlyElec
-with the following specifications:
+NanoPi-K2 is a single board computer manufactured by FriendlyElec with the following
+specifications:
 
  - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
@@ -18,7 +18,7 @@ with the following specifications:
 
 Schematics are available on the manufacturer website.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -27,14 +27,20 @@ U-Boot compilation
     $ make nanopi-k2_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `nanopi-k2`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh nanopi-k2 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -43,7 +49,6 @@ the git tree published by the board vendor:
     $ tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
     $ tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
     $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
-    $ git clone https://github.com/BayLibre/u-boot.git -b libretech-cc amlogic-u-boot
     $ git clone https://github.com/friendlyarm/u-boot.git -b nanopi-k2-v2015.01 amlogic-u-boot
     $ cd amlogic-u-boot
     $ sed -i 's/aarch64-linux-gnu-/aarch64-none-elf-/' Makefile
@@ -52,7 +57,7 @@ the git tree published by the board vendor:
     $ make
     $ export FIPDIR=$PWD/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -65,42 +70,52 @@ Go back to mainline U-Boot source tree then :
     $ cp $FIPDIR/gxb/bl301.bin fip/
     $ cp $FIPDIR/gxb/bl31.img fip/
     $ cp u-boot.bin fip/bl33.bin
+    $ wget https://github.com/LibreELEC/amlogic-boot-fip/raw/master/nanopi-k2/bl1.bin.hardkernel fip/bl1.bin.hardkernel
+    $ chmod +x fip/bl1.bin.hardkernel
+    $ wget https://github.com/LibreELEC/amlogic-boot-fip/raw/master/nanopi-k2/aml_chksum fip/aml_chksum
+    $ chmod +x fip/aml_chksum
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
-
-    $ $FIPDIR/fip_create \
-    	 --bl30 fip/bl30_new.bin \
-    	 --bl31 fip/bl31.img \
-    	 --bl33 fip/bl33.bin \
-    	 fip/fip.bin
-
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
+
+    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
+                         --bl31 fip/bl31.img \
+                         --bl33 fip/bl33.bin \
+                         fip/fip.bin
+
+    $ sed -i 's/\x73\x02\x08\x91/\x1F\x20\x03\xD5/' fip/bl2.bin
     $ python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl2_acs.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/bl21.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
 
     $ cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
 
     $ $FIPDIR/gxb/aml_encrypt_gxb --bootsig \
-    		--input fip/boot_new.bin
-    		--output fip/u-boot.bin
+                                  --input fip/boot_new.bin
+                                  --output fip/u-boot.bin
 
-and then write the image to SD with:
+Then write U-Boot to SD or eMMC with:
 
 .. code-block:: bash
 
-    $ DEV=/dev/your_sd_device
-    $ dd if=fip/u-boot.bin of=$DEV conv=fsync,notrunc bs=512 seek=1
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 conv=fsync
+    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 seek=9 skip=8 count=87 conv=fsync,notrunc
+    $ dd if=/dev/zero of=fip/u-boot.bin.gxbb bs=512 seek=8 count=1 conv=fsync,notrunc
+    $ dd if=bl1.bin.hardkernel of=fip/u-boot.bin.gxbb bs=512 seek=2 skip=2 count=1 conv=fsync,notrunc
+    $ ./aml_chksum fip/u-boot.bin.gxbb
+    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
