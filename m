Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DFC77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrRsMo7uuSgSPaPCH3E3kbRpVlfLePGnUtF6lfGY8+c=; b=Sfy/iTCz1dUn8u
	j0H0R5bBOl4NUkL8M1e8VG3Ccb+iFCz0nuViJ0Ogc+f9lLpwbzWLlP9F39u4n2LDr2URg9ncSVcjd
	hQWIncsjh0F16/kedxU7VsJSYeDoClw+UjWi6j0mb20mXiUb/FZjAlp+oq+xxQFfzI9edGB2fPpn6
	q8bafn4dffFSMCJVSuCHVRDB0OqDNMjFXuF2zKNTFlalmPA5XBN8ZAibKwlsq4zR37GVDzSQWOjcU
	2DSxNGitQNjyLaqcW01ERuWz336BKxwBZXItTr7DAzh0r6+9prhgUgYYlRfJJhJusOe/Pc7DO3a6q
	q2YpCmZL1sg8oBFsfqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7b-00928h-32;
	Mon, 20 Mar 2023 13:00:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyP-008rp7-18
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o7so10043990wrg.5
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPxxmWcR46ur14NKsEcVWS/WLKmARgpHeR6EHeDbDc8=;
        b=Esb4FgqVInGJ1WHHC7+XazAfEC7bAkZoXA2ebFMJwgDYpXSQEPS2jsrRJDphIJgJVx
         IcZ4sJtjkViShyy+EaPp+BA0auDXOlJ70O8WQ92vDapFU3LA+CGCaPIGbgVjo4hKMNcR
         F/7w9v0U+538WbZ0m3RaglvvgZF4uAlJLLaylMjrCkrivu7Un3R7nFZKdpZ+ZXMZxU3a
         lwZJV5effnyeJo4dO5G9CxE3lZy0ouixCJC/M5jdSYXUYThyiLjVZvuxQGE5KFSfQGF3
         0vjPyFAYIG28rFFx6mYm4GCZA5fhAX8KFX4YOT4DDk+w9Unzyp1zRCZuXFn84Ym7VCdw
         1QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPxxmWcR46ur14NKsEcVWS/WLKmARgpHeR6EHeDbDc8=;
        b=dPevyjl7fHcYcdI32Tqh98cZWTyVztZzI2S5jJqCOlnDTWQbxMwt54d2g1Cr8pye/q
         i6sfUVuMXbXevbL6GqHzq4DXQeXyjmN3fNCl5tyFXGEntR8yerWekr9Rkd5PsIQceUuo
         Ei2g3m8MJJHTfoSiOtEAoMVDvlFxK9XBvEo0jd2oMz+USM3iLtt5WgBy1TnVPH08DNlZ
         RnQ7BOIlFlomJfqqWnLM8W08NAYlBkpMfSmp8RxKnSBSAVsS5l1eoJT3rgjimYeSp9xM
         pFO0dlxsoM6LZKLY/fcm9qs9OqT7SOCKrcxmUiAq+4kv0fFb7gmWXe8bK0cOMLZJWnVq
         ncPA==
X-Gm-Message-State: AO0yUKVLeZD/lX7jjDok5gRKsI7yi+pL6klSPCoYc86RZfrDZNJwgCFM
	DICaDuJ/0OKCpPAf2XDuU7E29wH5LgQMrAPL
X-Google-Smtp-Source: AK7set+dql9H+EmVTWMGUlRDkv5qcNsGyIYqCqr/mDO6F6MGgLraew+VSkJr2HyhNp3NcS+D+qyOQA==
X-Received: by 2002:adf:ee4f:0:b0:2cf:ef5d:4ee7 with SMTP id w15-20020adfee4f000000b002cfef5d4ee7mr13294187wro.69.1679312804846;
        Mon, 20 Mar 2023 04:46:44 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:44 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 20/33] doc: boards: amlogic: update documentation for P200
Date: Mon, 20 Mar 2023 11:45:56 +0000
Message-Id: <20230320114609.930145-21-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044645_440798_7EC8169A 
X-CRM114-Status: GOOD (  11.23  )
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
the internal eMMC storage in addition to SD cards.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/p200.rst | 87 +++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/doc/board/amlogic/p200.rst b/doc/board/amlogic/p200.rst
index 5e7c6b0276..b5c6ad096e 100644
--- a/doc/board/amlogic/p200.rst
+++ b/doc/board/amlogic/p200.rst
@@ -1,25 +1,24 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic P200
-=======================
+U-Boot for Amlogic P200 (S905)
+==============================
 
-P200 is a reference board manufactured by Amlogic with the following
-specifications:
+P200 is a reference board manufactured by Amlogic with the following specification:
 
  - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
  - Gigabit Ethernet
  - HDMI 2.0 4K/60Hz display
- - 2 x USB 2.0 Host
+ - 2x USB 2.0 Host
  - eMMC, microSD
  - Infrared receiver
  - SDIO WiFi Module
- - CVBS+Stereo Audio Jack
+ - CVBS + Stereo Audio Jack
 
 Schematics are available from Amlogic on demand.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -28,14 +27,20 @@ U-Boot compilation
     $ make p200_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `p200`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh p200 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image but sources have been shared by Linux development contractor, Baylibre:
 
 .. code-block:: bash
 
@@ -50,7 +55,7 @@ the git tree published by the board vendor:
     $ make
     $ export FIPDIR=$PWD/fip
 
-Go back to mainline U-boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -63,37 +68,51 @@ Go back to mainline U-boot source tree then :
     $ cp $FIPDIR/gxb/bl301.bin fip/
     $ cp $FIPDIR/gxb/bl31.img fip/
     $ cp u-boot.bin fip/bl33.bin
+    $ wget https://github.com/LibreELEC/amlogic-boot-fip/raw/master/nanopi-k2/bl1.bin.hardkernel fip/bl1.bin.hardkernel
+    $ chmod +x fip/bl1.bin.hardkernel
+    $ wget https://github.com/LibreELEC/amlogic-boot-fip/raw/master/nanopi-k2/aml_chksum fip/aml_chksum
+    $ chmod +x fip/aml_chksum
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl30.bin \
-        fip/zero_tmp \
-        fip/bl30_zero.bin \
-        fip/bl301.bin \
-        fip/bl301_zero.bin \
-        fip/bl30_new.bin \
-        bl30
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
 
     $ python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
     $ $FIPDIR/blx_fix.sh \
-        fip/bl2_acs.bin \
-        fip/zero_tmp \
-        fip/bl2_zero.bin \
-        fip/bl21.bin \
-        fip/bl21_zero.bin \
-        fip/bl2_new.bin \
-        bl2
-
-    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin --bl31 fip/bl31.img --bl33 fip/bl33.bin fip/fip.bin
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
+
+    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
+                         --bl31 fip/bl31.img \
+                         --bl33 fip/bl33.bin \
+                         fip/fip.bin
 
     $ cat fip/bl2_new.bin fip/fip.bin >fip/boot_new.bin
 
-    $ $FIPDIR/gxb/aml_encrypt_gxb --bootsig --input fip/boot_new.bin --output fip/u-boot.bin
+    $ $FIPDIR/gxb/aml_encrypt_gxb --bootsig \
+                                  --input fip/boot_new.bin \
+                                  --output fip/u-boot.bin
 
 and then write the image to SD with:
 
 .. code-block:: bash
 
-    $ DEV=/dev/your_sd_device
-    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
-    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
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
