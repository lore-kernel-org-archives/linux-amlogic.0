Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818BCC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgY40a4SuCC56F8EH1FGeKMiyNUaOzewl+pXynp8STQ=; b=XgezkAKUpQrSeO
	ZWND123WUAygM2OGYVD+Ea7ceqI1kKTZaQDnhRNQyBk0aMKcHsbvq5hh51mD9jmqZ7xnjwHQL8RPL
	Dx3RyG7OkurZF8oqhuB0OuB8SrGXAIw6Dghb7Jcpe/CLvX7xzE5qSiuQZeJ2N7+GS/858AP6t0aX9
	Zbp40/7qxiemrVZW9FBc/zMDt6sqHFRs/rvWpxkvLzNqPkqP3reY8PpEzWgqikMhQ0ta0GS7X8YS+
	o2lOcOIFMMTGfBIYjTnjlMs3/HjqRjarLVrQYEzyk7+tpb4KaXhh95baPZuOwhBdSmHF1mndUo+N1
	eh3KsvSGzV8ktlKEBFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyZ-008sEl-2M;
	Mon, 20 Mar 2023 11:46:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyS-008rwA-2R
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j2so10026519wrh.9
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atcu05uLW0E88v6JSwvj9fA2sSk5Aok0ROhgBvPOm2I=;
        b=g5/cPjWuMR0nNDgt0w5e7OWk9a8phhD9XO8WdCMKHuPWkqmAt01zEysRrx4ZON5cf+
         5noUhZc6cnRAEg3gDFrqQUteLaXhRrO56pEyywLfz0zLV5caaOBJshRNgi0hBsARTaSP
         iz/ZjQmExa9c5pzp/6T9WB+IuTvTInnZEZ6d1JiIrPprP9JJyxklCgbvugXtw/npIHiw
         HOfZCX9rhZgXxpspxCy9ZEq1TEBJxCmcbMNhJW+nNqpB3NrqaRwNOQZBBnn+TJ3ah+xu
         RcjFxT+qQ9dWk41yGYxMUj4p7WbO5Yk93IKn+4FdZLdBra3wUpdGsNoLimoIvuqtqG28
         x9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Atcu05uLW0E88v6JSwvj9fA2sSk5Aok0ROhgBvPOm2I=;
        b=297hFZuK5S7rCdIFWx/EdTrReT6QtiHhCrmQT4gYVYDzhCxxdRIer4G2ZWvb5a0Qr5
         UO0LX0nLBaLwbTzAqmvmerArNCLw4f4Xurf1ht1iSy3cxZiEJI+5DUjM7lRYxTBvw6Tp
         bIkUmJ0fU6lo/vlw7VWyGNYgY526Do4UwbbVOETZFgzJ2PKleXTncxWPw3nz7XPZkoB4
         zbsj8kfdnD3S7wIMzpMcrXDhf/8f7KmwOkmapdkbL1JF25RMCpxklDBEV60DNPatf5wM
         BgAnGeGx3oGJdyK5J8glymzlB0zuWaK0lXbfMr/lI6krM1d9Rql/k+GShkPzpLDwRhGy
         TXCA==
X-Gm-Message-State: AO0yUKVgna1V0jcv7WjDdfFUD2wgm3N03Kwb6vBhdvSqU6LuFXgduPat
	OytB6UjzC9Pqk70Cr/YAQt4=
X-Google-Smtp-Source: AK7set8OWvYQe+2g2L30IBomuI7D1rm+yMt7EdlTegz7zZOe0xhSW2j7e5RBsbiTKuRKg/oHapuUHg==
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id y16-20020adff150000000b002c970a44f94mr14651167wro.18.1679312808328;
        Mon, 20 Mar 2023 04:46:48 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:48 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 22/33] doc: boards: amlogic: update documentation for Q200
Date: Mon, 20 Mar 2023 11:45:58 +0000
Message-Id: <20230320114609.930145-23-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044648_813219_BF0865FE 
X-CRM114-Status: GOOD (  10.78  )
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
 doc/board/amlogic/q200.rst | 76 +++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/doc/board/amlogic/q200.rst b/doc/board/amlogic/q200.rst
index 3ac4116be4..c304980579 100644
--- a/doc/board/amlogic/q200.rst
+++ b/doc/board/amlogic/q200.rst
@@ -1,24 +1,24 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic Q200
-=======================
+U-Boot for Amlogic Q200 (S912)
+==============================
 
-Q200 is a reference board manufactured by Amlogic with the following
-specifications:
+Q200 is a reference board manufactured by Amlogic with the following specifications:
 
  - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
  - ARM Mali T860 GPU
  - 2/3GB DDR4 SDRAM
  - 10/100/1000 Ethernet
  - HDMI 2.0 4K/60Hz display
- - 2 x USB 2.0 Host, 1 x USB 2.0 Device
+ - 2x USB 2.0 Host
+ - 1x USB 2.0 Device
  - 16GB/32GB/64GB eMMC
  - 2MB SPI Flash
  - microSD
  - SDIO Wifi Module, Bluetooth
  - IR receiver
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -27,12 +27,20 @@ U-Boot compilation
     $ make khadas-vim2_defconfig
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
+    $ ./build-fip.sh q200 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image but sources have been shared by Linux development contractor, Baylibre:
 
 .. code-block:: bash
 
@@ -47,7 +55,7 @@ the git tree published by the board vendor:
     $ make
     $ export FIPDIR=$PWD/fip
 
-Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -62,40 +70,40 @@ Go back to mainline U-Boot source tree then :
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
