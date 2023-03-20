Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B09AC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhrEX4/Qh/5YalJOukuec6HtGyjpeW69x3Q4+6323dI=; b=zs1RCEaGCd181V
	JW4ba1jv9WLzS4z6jARAComY5vWzvLCOYi8DA+xoAw60UJiXtZXAp91PZfyVQjcZhg9SIE4H4BLcU
	VXKM/ZcIXr59onsqBa+Ha7XVh+k61ZjNxGIeGbcbBqNPJeooeBbgbOq4+GoD5TqdkLhNlgwc1g90b
	rxC4YmSDkbB3QjSntm3FMd95rube7nlV7GHL1PF0Nc9MowrvnS7Xp6WkmBvOjmQ/8k3TJZDmESKBx
	8cNv7MJWeoZ/VEkcMN8/XdCmhs2vdAgLNA4cpl5CUnbiXK8cSDi/x0L3Xc5LdMDoknNAJokPl+2AY
	fLiAsl5+D65x6D8aNM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyQ-008s8H-2P;
	Mon, 20 Mar 2023 11:46:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyM-008rsN-09
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l27so1720619wrb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dInwRiaov3eW4SnMIasTLftHInE4mNys6ha30787nX8=;
        b=Hh0e6DaOovqv7E6R0PTGQqbHKSEu2LwS34zJ+QS384hkfA6hHAmT2ivA1jDFt70W+i
         MfBlgjbsZZGE/SkQHfp92KgWtVxmu52Ttz5NeNMs8TcEjIyDKEl9oT50LO0NUTsyzNNj
         DDP85cyb8a5aJ4e3YGo+s9XY6X87fJxrouClhGpV1A+CiOjO68B4hJTilkuC7UtIveNk
         8vwMxv9TE+P1SaRSA2FCKubd9caChKk19wQXVlnHlIbA+8jdcXeWCtrcHLh38FNlVQa9
         wIM90bZSmRRVwruJFzRwhq9M9ntekavlJVgQ/n6B2Xduu6viFXyyyWqJtsA+hRLDtvyP
         rlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dInwRiaov3eW4SnMIasTLftHInE4mNys6ha30787nX8=;
        b=APA8en6U9757CRzEVhkzaeCAaUtvDuegRIVrOsvX2YF1LCQD1K02ItjHEEfGAy6nk4
         3OfpNP/S5k/ae2q1xN+YrGAjsez8bTve9DeRRshQsu+jP+4pkhDbsyIkrqHpINpQvmTI
         XpzWM9RFgbrow1tlP5f9nlX0PwlUE7rdkgTJOwbFQzOs3ayx/jjFJVmVu5rqlQJb73eB
         78EbrIqE2RS7OW89Rj6lUe5sL4BjQRusG3z7ymSgNU8QGrCHRR16THlgRDGCdf65iF/l
         HBoSlguI8QFzD/o248OrBZ+d6F9kUQwtjKLTAog5lbn+urTA6U2bWjsyZs88F82MC/7M
         0O/A==
X-Gm-Message-State: AO0yUKVzs5vNFPAwVxhkTFy0qZHnLsFoQnweqFfWx0hCbWss5fMz5Sb8
	OfZ2JC8HFmN3FIPYPQXj1m0=
X-Google-Smtp-Source: AK7set9tWu2fjiZXFtrHKWjSVbzc7Nc7lshPLHnhGdSmZiBQyaOc47p7vEvdCtLwjpx7H3r7RdnR2Q==
X-Received: by 2002:a5d:6b0e:0:b0:2c3:db98:3e87 with SMTP id v14-20020a5d6b0e000000b002c3db983e87mr14106386wrw.20.1679312801559;
        Mon, 20 Mar 2023 04:46:41 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 18/33] doc: boards: amlogic: update documentation for ODROID-N2/N2+
Date: Mon, 20 Mar 2023 11:45:54 +0000
Message-Id: <20230320114609.930145-19-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044642_096018_FBEDD6DB 
X-CRM114-Status: GOOD (  11.45  )
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

Improve documentation. Notably mention the ODROID-N2+ and the option
to use FDTDIR not FDT for automatic device-tree selection.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/odroid-n2.rst | 122 +++++++++++++++++---------------
 1 file changed, 65 insertions(+), 57 deletions(-)

diff --git a/doc/board/amlogic/odroid-n2.rst b/doc/board/amlogic/odroid-n2.rst
index 7aad36e003..8ca1f89699 100644
--- a/doc/board/amlogic/odroid-n2.rst
+++ b/doc/board/amlogic/odroid-n2.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for ODROID-N2
-====================
+U-Boot for ODROID-N2/N2+ (S922X)
+================================
 
-ODROID-N2 is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
+ODROID-N2 and ODROID-N2+ are a Single Board Computers manufactured by Hardkernel with the
+following specifications:
 
  - Amlogic S922X ARM Cortex-A53 dual-core + Cortex-A73 quad-core SoC
  - 4GB DDR4 SDRAM
@@ -15,9 +15,13 @@ Co. Ltd with the following specifications:
  - eMMC, microSD
  - Infrared receiver
 
-Schematics are available on the manufacturer website.
+ODROID-N2+ uses Rev-C silicon allowing higher CPU opp-points. U-Boot contains logic to
+read the model detail from SARADC and select the correct device-tree file if FDTDIR is
+used instead of an FDT reference to a specfic device-tree.
 
-U-Boot compilation
+Schematics are available on the manufacturer website: https://wiki.odroid.com
+
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -26,14 +30,20 @@ U-Boot compilation
     $ make odroid-n2_defconfig
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
+    $ ./build-fip.sh odroid-n2 /path/to/u-boot/u-boot.bin my-output-dir
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `odroid-n2` or `odroid-n2-plus`
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -44,16 +54,14 @@ the git tree published by the board vendor:
     $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
 
     $ DIR=odroid-n2
-    $ git clone --depth 1 \
-       https://github.com/hardkernel/u-boot.git -b odroidn2-v2015.01 \
-       $DIR
+    $ git clone --depth 1 https://github.com/hardkernel/u-boot.git -b odroidn2-v2015.01 $DIR
 
     $ cd odroid-n2
     $ make odroidn2_defconfig
     $ make
     $ export UBOOTDIR=$PWD
 
- Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -76,57 +84,57 @@ the git tree published by the board vendor:
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
 
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
-    					--output fip/bl30_new.bin.g12a.enc \
-    					--level v3
+                                          --output fip/bl30_new.bin.g12a.enc \
+                                          --level v3
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
-    					--output fip/bl30_new.bin.enc \
-    					--level v3 --type bl30
+                                          --output fip/bl30_new.bin.enc \
+                                          --level v3 --type bl30
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
-    					--output fip/bl31.img.enc \
-    					--level v3 --type bl31
+                                          --output fip/bl31.img.enc \
+                                          --level v3 --type bl31
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
-    					--output fip/bl33.bin.enc \
-    					--level v3 --type bl33 --compress lz4
+                                          --output fip/bl33.bin.enc \
+                                          --level v3 --type bl33 --compress lz4
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
-    					--output fip/bl2.n.bin.sig
+                                          --output fip/bl2.n.bin.sig
     $ $UBOOTDIR/fip/g12b/aml_encrypt_g12b --bootmk \
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
+                                          --level v3
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
