Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DBEC7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiE25hBeRlZgycrIdOaa1/awWJo+5cayGamvKtNu63g=; b=pfG52MagAE7kmA
	eVYYFVNGFISNcltLEVwv39s7gz3Nl13g0DenIYOu9jpSoDlla0etMm6C8RxDubVqWsCWIyzvMXgCX
	lFa1Yf5ejaB6Lm9QzpL4uWzQ2N33Eae4UzSrxsksPRlL9TnWVWm6gFB44YDZb7uRXNL6ak8n5pqf/
	1WRjPqtllmC4cUdr19I4bEQTT5+OaeorWBPclWGwJZRVANcKgk2DzetfoFAaUmjmfCayeCwa3rYi2
	D1GEY/1sE4oLbVCb3ostg6ndF4AcgKYSjGC01xZHUNBZh8q2g+kgFoGuuGMAcIU5ig1rTRDusepAz
	iARzKWO5Xyp31essv/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7a-00928J-39;
	Mon, 20 Mar 2023 13:00:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyE-008rxh-2U
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d17so1608488wrb.11
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/1NGisBICDWKySTthh8leLs4mxW+Mpv+VVXG9ecVfo=;
        b=RTOji96/oYV6kpRrT9EEicTs7jEAbtTfreSo0mosAjuVZRoIqYAZVFjwDO6fal6lq1
         vA9yftIpzbWRcbIwUyHJQG4jh1ij2QEeRGdbQoiYWAQo4xfiGXalUGEn9q4U4Q4Muxmh
         FrihhCHypXoc0zj+XFUV7ArpSI1rAyyFNlugWbjoXOCTv2SYsrpHMEjgsk6Jf3jHiMdk
         1J680ld10dajPk98gOlh8Y0XQWFnzg+PFZluGtu2v2ikRqv/bqei4xGJPN7qBwjGIwHA
         JbVga9qwrO/oA8Pk3/swnw94tgyDaJ4gvVRysoSXxwZxArvhtccEya3S02RyKyyRJWj+
         l81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/1NGisBICDWKySTthh8leLs4mxW+Mpv+VVXG9ecVfo=;
        b=fcgq0VeaYxPqEbXPW0/bNAua+PahKccZ+cUolTS8Gg3NwNzZ1bE3uYQMKvt6h8cg/x
         M08SeLkdDSkUwdL+ZC2tDtoZi4A4KA5z+Wgktyv9Hwk2VVCLnr1TXUHBHnVxoJmfEHzQ
         7OJdlcoufkLav83rxjyLe2mkwFfQichuMAvRb3CXR+fyiLpp4d7JSqyLixc74F4kiNI1
         Op4y9P+9TRe3NXvTSWbJpuTsei59IpKgGSrTY7o9R7tAKUhUUUVt+vF8XiRLHfstFds3
         ylJwJcpO9ma/z2PXWO3h1dQO1lanyMo3pTmvZBIq0VT8lHOide4klYVZfDPKeW9I4Nfb
         jM6w==
X-Gm-Message-State: AO0yUKU22qKNo4lwYBZ5JA8ZE/gZoKVflKWjIiipz+nDLUdqg05i8Sdj
	nvR9kWZNysE1J9KLtdrHG5RBFjNYZ89XVli/
X-Google-Smtp-Source: AK7set+ABEis4YSYwMD8CUNGligpDKxcDmJxcDFufGLuaJNhRJA52jJE8D3weIa6U8uaCHP6XbVfrQ==
X-Received: by 2002:adf:eb0f:0:b0:2d6:6af:4891 with SMTP id s15-20020adfeb0f000000b002d606af4891mr4079244wrn.3.1679312793584;
        Mon, 20 Mar 2023 04:46:33 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 13/33] doc: boards: amlogic: update documentation for LePotato
Date: Mon, 20 Mar 2023 11:45:49 +0000
Message-Id: <20230320114609.930145-14-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044634_816475_24280407 
X-CRM114-Status: GOOD (  12.90  )
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
 doc/board/amlogic/libretech-cc.rst | 109 +++++++++++------------------
 1 file changed, 40 insertions(+), 69 deletions(-)

diff --git a/doc/board/amlogic/libretech-cc.rst b/doc/board/amlogic/libretech-cc.rst
index 596ce45dc4..d1d3ce49f6 100644
--- a/doc/board/amlogic/libretech-cc.rst
+++ b/doc/board/amlogic/libretech-cc.rst
@@ -1,12 +1,12 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for LibreTech CCs
-========================
+U-Boot for LibreTech CC 'LePotato' (S905X)
+==========================================
 
-LibreTech CC is a single board computer manufactured by Libre Technology
-with the following specifications:
+LibreTech CC is a Single Board Computer manufactured by Libre Computer Technology with
+the following specifications:
 
-V1:
+v1:
 
  - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
@@ -19,14 +19,14 @@ V1:
  - Infrared receiver
  - Jack for CVBS and Audio
 
-V2:
+v2:
 
  - Added SPI NOR
  - Removed Jack
 
 Schematics are available on the manufacturer website.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -37,36 +37,20 @@ U-Boot compilation
 
 Use libretech-cc_v2_defconfig for v2.
 
-Image creation
---------------
-
-To boot the system, u-boot must be combined with several earlier stage
-bootloaders:
-
-* bl2.bin: vendor-provided binary blob
-* bl21.bin: built from vendor u-boot source
-* bl30.bin: vendor-provided binary blob
-* bl301.bin: built from vendor u-boot source
-* bl31.bin: vendor-provided binary blob
-* acs.bin: built from vendor u-boot source
-
-These binaries and the tools required below have been collected and prebuilt
-for convenience at <https://github.com/BayLibre/u-boot/releases/>. These
-apply to both v1 and v2.
-
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `lepotato`
-
-Download and extract the libretech-cc release from there, and set FIPDIR to
-point to the `fip` subdirectory.
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
 .. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh lepotato /path/to/u-boot/u-boot.bin my-output-dir
 
-    $ export FIPDIR=/path/to/extracted/fip
+U-Boot Manual Signing
+---------------------
 
-Alternatively, you can obtain the original vendor u-boot tree which
-contains the required blobs and sources, and build yourself.
-Note that old compilers are required for this to build. The compilers here
-are suggested by Amlogic, and they are 32-bit x86 binaries.
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -81,9 +65,7 @@ are suggested by Amlogic, and they are 32-bit x86 binaries.
     $ make
     $ export FIPDIR=$PWD/fip
 
-Once you have the binaries available (either through the prebuilt download,
-or having built the vendor u-boot yourself), you can then proceed to glue
-everything together. Go back to mainline U-Boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -98,51 +80,40 @@ everything together. Go back to mainline U-Boot source tree then :
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
-
-Note that Amlogic provides aml_encrypt_gxl as a 32-bit x86 binary with no
-source code. Should you prefer to avoid that, there are open source reverse
-engineered versions available:
-
-1. gxlimg <https://github.com/repk/gxlimg>, which comes with a handy
-   Makefile that automates the whole process.
-2. meson-tools <https://github.com/afaerber/meson-tools>
-
-However, these community-developed alternatives are not endorsed by or
-supported by Amlogic.
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
