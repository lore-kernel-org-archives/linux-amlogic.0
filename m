Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B84C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=218r3w0TQNqXuwr+nsvKyE83dfqjJ8puud8HcJkoR+4=; b=1GDkjAK63QJFcD
	YgeRQ3EsVV5yql2AVsjYpcHfBtTQrrgMsa7oYMIr2LyDwecupi/zw82XARVsSktlwWfqAFKqo8x2v
	4rWasDMfOE3XGEn5UOZYEx0rewyB/oStU0xUEIf46ML4NpuVhJWQrWk+tCv5Ioe26g0O2Y5Aua3mA
	X8WxyhLRjNW0hYJCqE0PczXOLde7+WDY8blg3sdpkamnIycjpX727mbC9epPhcY6IRm5zvAS8Scen
	L+QxexXoayAdU2buBPziMFkyFKCzV/fez5lPlQqw7ACpbJNLvrVhDVVZKYAOHTmXMh2/yK/QlYnhT
	G91f5roBY+1Rd/9yskMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyC-008rwa-22;
	Mon, 20 Mar 2023 11:46:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy8-008rsN-29
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l27so1719899wrb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9MwXvf+flhTQSJUpZFWyNrBWTEpWDup8ZklCGcRg7Y=;
        b=Lvk3881Fg8L26vamATTqBXKfs0MCW6Tbb+AqIlVBiqG7axe8CNJ4Fnf53akwXjQfMj
         mwXPES6KvBbl7PRpuZ/tR+cuA/WbPB6o80UtKJAxuwmeXMsUQtaMeTO0IrUmDV5rjEeh
         0QYGxqQOWnRAmq5Bbb5HeYktM5vbeiMISwRB8pe5VH+yCo1SzeJKPg6XJe98SBYSLBNx
         xHwrRPK4nR2u7p67espVh/KYzwmK1OPwgsNp51vTj30/PCgKLcQykkwvTmPuzbuRc06V
         wzOpAVLKq2pOiqftb3OM7ldWNJdo2uUnEn45SSTPznNJV6z2HhZLaqv2cYzj+LdQUpf3
         MrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9MwXvf+flhTQSJUpZFWyNrBWTEpWDup8ZklCGcRg7Y=;
        b=lJba0VFBqBSiWuYBDxU/Y1GR/zPp6KjlSej9p1piJ0Cpp4jaFOneAHrIfgCwEovFlz
         4Nqr6Jx0Gts6Igowsfz+fFzyfQY7FKA/qofDorJ6QT4EKtVbnU85NK129V5Qic455hDf
         yqvahBVkrUJQJXi5kJRsgNFuHc3WZ7g/r/ML81ANYyemxL9tC0f86pPIER5VCtneaRiU
         wQbtJfXY6ZJxmuGPBeFuaxDltuftDcgjNfQfjKHNn8/CktALve4YcYbn1OHYB0oNdpUz
         /8YgwQ9okm7FzuYf3m8buG67mPOhMOXs7t5oXVVrCNXPTvrs691iJfK64sjDjYRDQ5h3
         Y9Rw==
X-Gm-Message-State: AO0yUKUmf1OS+xTQ0j+orVPJiuiWlH6ZvpIvX9PK0FGCOeq8wft+N2mW
	Cwkt8wMw+C7FPi3cOg1fDZM=
X-Google-Smtp-Source: AK7set/ZQ7zS4cj/Snwuzh6H7mhwsI8C1Wy7w+uvG45SEgJsSQ1nmmLt7AqZP4pGdzdcertRKA1gDw==
X-Received: by 2002:adf:f607:0:b0:2cb:c474:7597 with SMTP id t7-20020adff607000000b002cbc4747597mr12911062wrp.66.1679312787021;
        Mon, 20 Mar 2023 04:46:27 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:26 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 09/33] doc: boards: amlogic: update documentation for Khadas VIM2
Date: Mon, 20 Mar 2023 11:45:45 +0000
Message-Id: <20230320114609.930145-10-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044628_709575_FE137EBF 
X-CRM114-Status: GOOD (  11.15  )
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
 doc/board/amlogic/khadas-vim2.rst | 76 +++++++++++++++++--------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/doc/board/amlogic/khadas-vim2.rst b/doc/board/amlogic/khadas-vim2.rst
index 7ac3bdcbaf..78d47f93fe 100644
--- a/doc/board/amlogic/khadas-vim2.rst
+++ b/doc/board/amlogic/khadas-vim2.rst
@@ -1,25 +1,25 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Khadas VIM2
-=======================
+U-Boot for Khadas VIM2 (S912)
+=============================
 
-Khadas VIM2 is an Open Source DIY Box manufactured by Shenzhen Wesion
-Technology Co., Ltd with the following specifications:
+Khadas VIM2 is a Single Board Computer manufactured by Shenzhen Wesion Technology Co. Ltd
+with the following specifications:
 
  - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
  - ARM Mali T860 GPU
- - 2/3GB DDR4 SDRAM
+ - 2GB/3GB DDR4 SDRAM
+ - 16GB/32GB/64GB eMMC
  - 10/100/1000 Ethernet
  - HDMI 2.0 4K/60Hz display
  - 40-pin GPIO header
  - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
- - 16GB/32GB/64GB eMMC
  - 2MB SPI Flash
  - microSD
  - SDIO Wifi Module, Bluetooth
  - Two channels IR receiver
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -28,14 +28,20 @@ U-Boot compilation
     $ make khadas-vim2_defconfig
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
+    $ ./build-fip.sh khadas-vim2 /path/to/u-boot/u-boot.bin my-output-dir
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `khadas-vim2`
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -50,7 +56,7 @@ the git tree published by the board vendor:
     $ make
     $ export FIPDIR=$PWD/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -65,40 +71,40 @@ Go back to mainline U-Boot source tree then :
     $ cp u-boot.bin fip/bl33.bin
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
 
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
 
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
     $ $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc
+                                  --output fip/u-boot.bin \
+                                  --bl2 fip/bl2.n.bin.sig \
+                                  --bl30 fip/bl30_new.bin.enc \
+                                  --bl31 fip/bl31.img.enc \
+                                  --bl33 fip/bl33.bin.enc
 
-and then write the image to SD with:
+Then write U-Boot to SD or eMMC with:
 
 .. code-block:: bash
 
     $ DEV=/dev/your_sd_device
     $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
-    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
