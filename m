Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8195C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2KEka13ZgO9+tBh7nd/SU9SLj1O7GTEfBXHi7w3YiM=; b=jOa7wsncYzv3kQ
	Gs6qhDnU41+QCATmWR21Jzrd90zYLPf1MMVjYQLB8K51pks4Hz4v/UJrbjEzs2ZKa6El+vik/G4BU
	oEHaQiZ6cgnONmdZG9J1O8f3V6mzyMqe58tnjJ9i97ZItHJ/zEbms2kHKZggS+94HndB3EQBD0gi2
	zlHbxonBzb5JnI337RtplSbQJyptwMGB0HtRIxELKvJPF36/SunL8r5gLkVC8tSdREqnw4T5o+08X
	k2/8mUGrxNmXd8VT6HqtK0iIUSEUuHH8ilKxCOHl9yB1vBQfvcT4/lo9i6IPZjvQUvoCPnZ9RRzKW
	cZHzybtohQeXkmnhl8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyb-008sG4-1u;
	Mon, 20 Mar 2023 11:46:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyX-008rkn-1S
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j24so1129401wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94HmntJfhtzEnhOObGr9eOswGC99lf/O0pDaQvj/vrk=;
        b=HcHc342EA1BiU6J/8nQI7mDcfnEKDgTZtZ+iYawBXpuNxn/6ISKZLGqRsfHXZ6g9Jg
         4eGeGeVIw6fjDZ0h6ehiBDmSJhBf5x6ZrsiHAIAhEd6oE/Y3rnMS+ck5Mww2+LE3pIdu
         XENkL1nEscW7ZsiergN8bmfsxm/qumvmwVbpJwxJTWHBCWGenn/O83PKh508n761GPHp
         LNaPc8dtfn6xvFTmO3aiNysu7Xyuge+2Udjw7knVX74ZSTuNebV/ATfqio8BSrP7I5u3
         EFwwN4Zs5uGaa5tAxERYeAC7o38BX6o5gVbLuFYqKXHzWlln7xGMVXzh16mrw6j9xS61
         o+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94HmntJfhtzEnhOObGr9eOswGC99lf/O0pDaQvj/vrk=;
        b=LSN0o9/r0poPY3H6u6lx0sGfm1xetex6sc+ZKHFoNZNb5mMOka718T3MBwZmELGjiw
         8/iDK7M/hFwEBKeTFWodTisWYO0h+HG0/YtDSe+ldj051mPHHKjDfwkADVqY6AMtek7w
         HjhcZpP7/JDMlokBzM2PIc7pduTcANVpjoBrYX16P1Jar5aT4UpuhJRXumEYOifhVok6
         w8Zyym5OMqu7zkqU84FItbh5Y2WPQwNkCBeWm7dVJcqD4Ax+C3ZvpLgUa41q/jFVqY3l
         zJulfWWfaGWXCusoCSwlsbwBiGps7ZMe8s/Ff51yS1r6yMqDd7ENGXscfGuCM1Oe8c/q
         99kg==
X-Gm-Message-State: AO0yUKVSmG7XnigjSsd84VFkQUfz3zbK9oLv3/iSD/MFCBrc09gCWUBs
	QUjJGROP95JvLBk0nTuJdiA=
X-Google-Smtp-Source: AK7set9nA7nadx6Ld/U+TL+QFBStuJF/mI8vOLVOD3ifjJ1rCjAA5VbWn3Zrzz30W6jeuP5cQTFt0A==
X-Received: by 2002:a5d:638b:0:b0:2cf:f312:86dd with SMTP id p11-20020a5d638b000000b002cff31286ddmr12841368wru.18.1679312812924;
        Mon, 20 Mar 2023 04:46:52 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:52 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 25/33] doc: boards: amlogic: update documentation for SEI510
Date: Mon, 20 Mar 2023 11:46:01 +0000
Message-Id: <20230320114609.930145-26-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044653_507356_02EFD9BE 
X-CRM114-Status: GOOD (  10.34  )
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
 doc/board/amlogic/sei510.rst | 113 ++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/doc/board/amlogic/sei510.rst b/doc/board/amlogic/sei510.rst
index c55e778494..09b0f53e16 100644
--- a/doc/board/amlogic/sei510.rst
+++ b/doc/board/amlogic/sei510.rst
@@ -1,21 +1,20 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic SEI510
-=========================
+U-Boot for Amlogic SEI510 (S905X2)
+==================================
 
-SEI510 is a customer board manufactured by SEI Robotics with the following
-specifications:
+SEI510 is a customer board manufactured by SEI Robotics with the following specification:
 
  - Amlogic S905X2 ARM Cortex-A53 quad-core SoC
  - 2GB DDR4 SDRAM
  - 10/100 Ethernet (Internal PHY)
- - 1 x USB 3.0 Host
+ - 1x USB 3.0 Host
  - eMMC
  - SDcard
  - Infrared receiver
  - SDIO WiFi Module
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -24,14 +23,20 @@ U-Boot compilation
     $ make sei510_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `sei510`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh sei510 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -46,7 +51,7 @@ the git tree published by the board vendor:
     $ make
     $ export UBOOTDIR=$PWD
 
-Download the latest Amlogic Buildroot package, and extract it :
+Download the latest Amlogic Buildroot package and extract it:
 
 .. code-block:: bash
 
@@ -55,7 +60,7 @@ Download the latest Amlogic Buildroot package, and extract it :
     $ export BRDIR=$PWD/buildroot_openlinux_kernel_4.9_fbdev_20180706
     $ export FIPDIR=$BRDIR/bootloader/uboot-repo/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -77,56 +82,56 @@ Go back to mainline U-Boot source tree then :
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
