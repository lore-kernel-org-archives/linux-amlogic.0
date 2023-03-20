Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F61DC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzNRUiHw++Qv4drXGbPoTvNor3UzzuSiCUme0fb+6cM=; b=DQe6aHa7Ao0zRF
	5+xtHKmAk02tY2r6bHOUFhJ6FVTC7+oBtV6vC2o5mojEXmIeo0iz9UNkDZt92koBt6z+LNJkarF8S
	OgzI4OlKzwRAk/GVoin2KNXOYObN7ViATyrNFpKlEAtajjJFDo2vY7r1clybP+1V5HCNp/AQ9bGjV
	hvA77hRl8D9RGhQM48RXxHa1hVluKL9/pXRAusHBh2VHFcXjssr37oubtEoKekpm6JDvXa3PTJhbV
	X5M7HOsCjGnIYQM4AdJ6FuHxjZaRGQmq+J91kLYRgpSzTKNFzv8NLYtr3Mo/9G5Bz1O9aaVvB72Kl
	jNvwejIOel4Lc3iUA+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyN-008s57-0P;
	Mon, 20 Mar 2023 11:46:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyI-008s0j-2J
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so8971320wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTDW0SCqpNfpSHS0rXT+ze4p7/dNzF26TO6fxVNniNc=;
        b=N80UnbmLnO7fZ+2Rfqx2YXlz/Mf4DRMbP0vesJg1dDF4WsV68qmGqzlHBO2wKzby+l
         yny8EgifxdCiCRCKVxUHc8ON5OIatZITR31VSop4WBWUYvZnNMBCEzfFWk0SD1jV0xOO
         lqltDDnFKtvuIvBhS2mdXd1IeoK+HNFdsw6UYgRlME1Rm844XwI9rpNpdcxCnc1ecQ2a
         Ac6p4PXMB8Q7Xjurkpvxpr/MYDeRuxmJ8MdtR1BCQiJs3Jaq3IKd2tEzModPJ0RKXRTV
         36flo9HSXga1pWd92WqXUG62abjrKITwYcDznhPMeuinxkwk0dKnWQ70UMxJFlDKrzn7
         SXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTDW0SCqpNfpSHS0rXT+ze4p7/dNzF26TO6fxVNniNc=;
        b=Afy7u6Wh1UlH+f0Hm4fWE1R+mmYW+OGLxXhgdjSLkTj/66Lxz8p9umgEowVAxFJcgV
         2UcAPOk83tJF47lWlpDzRCUUL8pwXgU4RGwD1Lb3BPiJo7Tb/OcRLl1LuDbEnL8LaxPT
         I1qj112mgFZs4xQKU/iWvESbHHy2bInx7y2cUliBSmYs2+ntbtqL8cveUws7jdfAk8HG
         rT5W4Q5oJwK3zB8jAyADajVQMD9QtiKMbVDOJZXRXJNiAGf121hqRxV9thxzJVKed6bg
         uuFMlkBns4VguDLREWnlDKt4FkjWh3U7DRdlnltt2aVvaiTo+Ngi2UXEB6pCeLuvtX5d
         MFZg==
X-Gm-Message-State: AO0yUKWHwHwHKWeaHY9XoCvDq3u1bAYrZsJuX5+D02J6Y+BjaqnC2vdf
	kBi2TnU7i+cXqBuntr8+dgc=
X-Google-Smtp-Source: AK7set8H5dccekDb8PtlPXSlBa8GKZfp4GeOilUwC3/UBsubiTv+1X9FjAtYhMiBamzd3ERvUcGTjQ==
X-Received: by 2002:a05:600c:4752:b0:3ea:e834:d0d1 with SMTP id w18-20020a05600c475200b003eae834d0d1mr32964840wmo.36.1679312796864;
        Mon, 20 Mar 2023 04:46:36 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:36 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 15/33] doc: boards: amlogic: update documentation for ODROID-C2
Date: Mon, 20 Mar 2023 11:45:51 +0000
Message-Id: <20230320114609.930145-16-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044638_760393_F1777185 
X-CRM114-Status: GOOD (  10.06  )
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
 doc/board/amlogic/odroid-c2.rst | 54 ++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/doc/board/amlogic/odroid-c2.rst b/doc/board/amlogic/odroid-c2.rst
index 8a1be4bf55..82eea3820e 100644
--- a/doc/board/amlogic/odroid-c2.rst
+++ b/doc/board/amlogic/odroid-c2.rst
@@ -1,12 +1,12 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for ODROID-C2
-====================
+U-Boot for ODROID-C2 (S905)
+===========================
 
-ODROID-C2 is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
+ODROID-C2 is a single board computer manufactured by Hardkernel with the following
+specifications:
 
- - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 2GHz
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
  - Gigabit Ethernet
@@ -16,9 +16,9 @@ Co. Ltd with the following specifications:
  - eMMC, microSD
  - Infrared receiver
 
-Schematics are available on the manufacturer website.
+Schematics are available on the manufacturer website: https://wiki.odroid.com
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -27,38 +27,44 @@ U-Boot compilation
     $ make odroid-c2_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `odroid-c2`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh odroid-c2 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
     $ DIR=odroid-c2
-    $ git clone --depth 1 \
-       https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 \
-       $DIR
+    $ git clone --depth 1 https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 $DIR
+
     $ $DIR/fip/fip_create --bl30  $DIR/fip/gxb/bl30.bin \
-                       --bl301 $DIR/fip/gxb/bl301.bin \
-                       --bl31  $DIR/fip/gxb/bl31.bin \
-                       --bl33  u-boot.bin \
-                       $DIR/fip.bin
+                          --bl301 $DIR/fip/gxb/bl301.bin \
+                          --bl31  $DIR/fip/gxb/bl31.bin \
+                          --bl33  u-boot.bin \
+                          $DIR/fip.bin
+
     $ $DIR/fip/fip_create --dump $DIR/fip.bin
     $ cat $DIR/fip/gxb/bl2.package $DIR/fip.bin > $DIR/boot_new.bin
     $ $DIR/fip/gxb/aml_encrypt_gxb --bootsig \
-                                --input $DIR/boot_new.bin \
-                                --output $DIR/u-boot.img
+                                   --input $DIR/boot_new.bin \
+                                   --output $DIR/u-boot.img
     $ dd if=$DIR/u-boot.img of=$DIR/u-boot.gxbb bs=512 skip=96
 
-and then write the image to SD with:
+Then write U-Boot to SD or eMMC with:
 
 .. code-block:: bash
 
-    $ DEV=/dev/your_sd_device
+    $ DEV=/dev/your_boot_device
     $ BL1=$DIR/sd_fuse/bl1.bin.hardkernel
     $ dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
     $ dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
