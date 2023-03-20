Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331EAC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aX2KxzS1G3Pqiz5ngpduuPMdZsvlV9h7suLWghI6wJ0=; b=WPhQXwJ11D/8Zt
	13phKOf+GFxcNf9rSZZbL6rRz7qLWB7AQPz4JhC95lhgMa5XaFe5ag09BGep9O5Uq84STpaEOjIeq
	UmQ6LfMYwHEkroswMd2zLft0PMwarrkh8xWT0MCqJVyUE6wxcA1dT1UtBe8MVAnPAT7SHKEIHYNVN
	LRzDHXMfaPZHyTj8uEKxuwkdv1qJbS5rx+bO1mReFryfIpUTxGpjFV57r/oEPXdGobAztIqdrIBe2
	2ZbxUpSnujfc7yxDNhtyk6TEixzhO2w11N5Tlxx9IDmfKWC6XKjztchHmuYcjYaJ3mygiCLZ8q4zw
	fs715tnjGtSB2ywOTGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDya-008sF2-0U;
	Mon, 20 Mar 2023 11:46:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyV-008rqP-2q
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so10029245wrm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jleqg1TxYhdSHi2FXGuYOR0T5CjWp5CMTfwWaNHKtDY=;
        b=DOqDDE1wgCrnCRU0Q0Y1B8Hp4TepJulv0RpyfuGyXkPVc7REb5lQJCejYAPjUBa8W6
         jpSZglffbv2Sg8KlsKmq3KmVi/WKzusljQR7imz0NPJIEWvnTuQWc/24jQ/7iHQ2uDC3
         VMih+4lqCee+uQJBVkO5L/kpvmu95WvazW8ZZzGDEgSogj3frQqYLciydg8XEUpggQXO
         k3hUencfO8UNImP9WirucRSY93s536z++jik9GrXzsV9pjLSCY+PNBYRlwtHJqocDiQz
         BwtMDGqlb01XArqA4XZXIl3bG85xHgK059BtpJflXyxjbUh5jaxp6yok2hd7FdThRBcy
         xoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jleqg1TxYhdSHi2FXGuYOR0T5CjWp5CMTfwWaNHKtDY=;
        b=z3SajaHGQzEVPSdxvQMRFasiAsBqtMCk50XzMGv0mutczMYAekECz1AoTUdnIjg6vs
         NY4ArOMnZQgUXn/lowTqpoBNFES9DtKa8qrQONLGqcHofuWTme8gxJ7k9uEsioZYpu+o
         NAFP239XuhrgkCRDoVkRaMc5lQl7GvJ3Qgcvsp1hbWKK/F1G9YJblKbIzLaEwUkJacwM
         YB8UcqTve/k3pem7Hqm2He9g7SflMxlWPrzF1lmvmfNxsD+L3bO/jnLrWkgkEsUM9ccp
         0Z1ftayLULCxDMWJ/XNGHpUH2xXP1iN1dOK3m9XTGnlA3AgOZ5lWM2PDURDj9ZT4nZsp
         u3BQ==
X-Gm-Message-State: AO0yUKWnAhKKt2n/BWv5H6sNsNwrarNDGB5DfKynm+cg9hpwXRiBcRAW
	Y+mlRB/DemnMZd5YyMLVBxk=
X-Google-Smtp-Source: AK7set/cDTAZGoFQCF+25lALm2Z5fDcVdpFmZ536F4gEr903gZWJ99k5KHH/bkabXEgMo/iOIeZ14A==
X-Received: by 2002:a5d:668d:0:b0:2d4:99f:6701 with SMTP id l13-20020a5d668d000000b002d4099f6701mr6621837wru.58.1679312811413;
        Mon, 20 Mar 2023 04:46:51 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:51 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 24/33] doc: boards: amlogic: update documentation for S400
Date: Mon, 20 Mar 2023 11:46:00 +0000
Message-Id: <20230320114609.930145-25-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044651_977296_5899AD9B 
X-CRM114-Status: GOOD (  10.12  )
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
 doc/board/amlogic/s400.rst | 89 ++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/doc/board/amlogic/s400.rst b/doc/board/amlogic/s400.rst
index c92817b421..b00fe64e1b 100644
--- a/doc/board/amlogic/s400.rst
+++ b/doc/board/amlogic/s400.rst
@@ -1,15 +1,14 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic S400
-=======================
+U-Boot for Amlogic S400 (A113X)
+===============================
 
-S400 is a reference board manufactured by Amlogic with the following
-specifications:
+S400 is a reference board manufactured by Amlogic with the following specifications:
 
- - Amlogic A113DX ARM Cortex-A53 quad-core SoC @ 1.2GHz
+ - Amlogic A113X ARM Cortex-A53 quad-core SoC @ 1.2GHz
  - 1GB DDR4 SDRAM
  - 10/100 Ethernet
- - 2 x USB 2.0 Host
+ - 2x USB 2.0 Host
  - eMMC
  - Infrared receiver
  - SDIO WiFi Module
@@ -19,7 +18,7 @@ specifications:
 
 Schematics are available from Amlogic on demand.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -28,14 +27,20 @@ U-Boot compilation
     $ make s400_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `s400`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh s400 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image but sources have been shared by Linux development contractor, Baylibre:
 
 .. code-block:: bash
 
@@ -65,47 +70,47 @@ Go back to mainline U-boot source tree then :
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
 
     $ $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
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
 
     $ $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl30_new.bin \
-    					--output fip/bl30_new.bin.enc \
-    					--level v3 --type bl30
+                                           --output fip/bl30_new.bin.enc \
+                                           --level v3 --type bl30
     $ $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl31.img \
-    					--output fip/bl31.img.enc \
-    					--level v3 --type bl31
+                                           --output fip/bl31.img.enc \
+                                           --level v3 --type bl31
     $ $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl33.bin --compress lz4 \
-    					--output fip/bl33.bin.enc \
-    					--level v3 --type bl33
+                                           --output fip/bl33.bin.enc \
+                                           --level v3 --type bl33
     $ $FIPDIR/axg/aml_encrypt_axg --bl2sig --input fip/bl2_new.bin \
-    					--output fip/bl2.n.bin.sig
+                                           --output fip/bl2.n.bin.sig
     $ $FIPDIR/axg/aml_encrypt_axg --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc --level v3
+                                  --output fip/u-boot.bin \
+                                  --bl2 fip/bl2.n.bin.sig \
+                                  --bl30 fip/bl30_new.bin.enc \
+                                  --bl31 fip/bl31.img.enc \
+                                  --bl33 fip/bl33.bin.enc --level v3
 
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
