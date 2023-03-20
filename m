Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3875DC77B60
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/XeOf7N6eRQvfMtOEq3r/F0622VPFjK5aykUzjdc4A=; b=0Hou87MF6J47DM
	LA4YASC6oQUnMFB9kRVqTzePFH7TPYLSwt/EyJCHPCNfk5WmfOue7ZRM/l0IXmEVzxQZXpAdJCUHA
	7LEfu+KUF+H8Dn2VF3Aw0ciKiWJS3I6Pu/WgH/Yxz99AJb5Jdo0IDyY7fzDYmffgEJbkYXmhNDqM8
	Ckmk6F9FhA8tKZ3uZEObmTGJ/61SnWa797k7ayGBgCLYuA8E5+HQz5o0IQdfQuBwUhdQocBFN1wut
	kChLhlJoqdKewjC4J3rGmC90JbrDE34n7/2gi8GFKb5mxws/9eJVdToSJ94+watWxmfampWXKKhoo
	47JN/q0CQ7PlVVoumwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7c-00929D-1u;
	Mon, 20 Mar 2023 13:00:20 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyS-008s8h-0l
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:49 +0000
Received: by mail-wr1-f51.google.com with SMTP id o7so10044053wrg.5
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1j0pT0rKRqAnlEnQeXBE7k3l8qsVlNzG8h9gMj7DWs=;
        b=PQrApTLRE61ivCIyBZd6lx5aRXW34D4mUxpmI8Qco1rGy57Wt93drJf4lKRQNrtUgJ
         eS53AaOnOYOgGVzXCrRfIW0aO4miIGLiH+XXFrqhAmY+ft3t511UAlfFgdjZhybhfEK4
         1Jv0pcmPTuDUgYi7ozz5em506IF/aRLU+uJfKkYo4KzvooGImQZ+HwFwPAboOyTLdk3L
         VB2qY25WbyRMjOy/Ti5BYw9+WJFdLVAzH1OvLTL12LB5vfH+pIllETD93WA/Je4nZDJo
         lA51Fwfu8L71oz8VgkAPoasARDbHKqmdmFO/x0jN5LwMZ8FUNZGYopEcmynodFwZeGvv
         ewSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1j0pT0rKRqAnlEnQeXBE7k3l8qsVlNzG8h9gMj7DWs=;
        b=alsqL2Lft4ox0bn9tSh5Py7k1wc5dn64vLfwd2grJrpJxLUW5m8c8YwKsRB/vjciQ9
         2fSa83urwZLmv3uGK7twT233QIWfKwSV3+OLm3lzwgadSLQLsFnhHt9zyHIjEI7vqcDe
         rIEkovuMN6kk5Gx7wWVTtlvibE1tvhIFCWoxn5yZjKULn5GUNUw53b186AESUOiN0AqX
         80aRmnHEqv7pzFB9qErrBr9phLth1s56Yu2olQtV0+buuwdifcb5qwbItiSAKl/SUG72
         bmqT+22k6xyjez+rolvRw2KlZJARAtRt6kLzQmYIT8LZ5vz8eAKlmHvZ3C6Jt6Ff859p
         buTA==
X-Gm-Message-State: AO0yUKXZc0Dedo/QJ/0Ymn7QNXTxOmhAI9hOcd1g9XAwScdF40dgm0Hp
	8mRGXzlrcpBNZjuNYZycg3g=
X-Google-Smtp-Source: AK7set+vvwlWJ1TgnCRtC5HeKOCtDRzQTw8H63/unaGSGD9M6r/W9eodQXouxM5WZgcOKB86QcRJpA==
X-Received: by 2002:adf:e348:0:b0:2cf:e70a:ad9e with SMTP id n8-20020adfe348000000b002cfe70aad9emr12317927wrj.46.1679312806401;
        Mon, 20 Mar 2023 04:46:46 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:46 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 21/33] doc: boards: amlogic: update documentation for P201
Date: Mon, 20 Mar 2023 11:45:57 +0000
Message-Id: <20230320114609.930145-22-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044648_273930_C06E5775 
X-CRM114-Status: GOOD (  10.37  )
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
 doc/board/amlogic/p201.rst | 87 +++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/doc/board/amlogic/p201.rst b/doc/board/amlogic/p201.rst
index 2cd236582a..b3dce4204e 100644
--- a/doc/board/amlogic/p201.rst
+++ b/doc/board/amlogic/p201.rst
@@ -1,25 +1,24 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Amlogic P201
-=======================
+U-Boot for Amlogic P201 (S905)
+==============================
 
-P201 is a reference board manufactured by Amlogic with the following
-specifications:
+P201 is a reference board manufactured by Amlogic with the following specifications:
 
  - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
  - 10/100 Ethernet
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
     $ make p201_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `p201`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh p201 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image but sources have been shared by Linux development contractor, Baylibre:
 
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
 
-and then write the image to SD with:
+Then write U-Boot to SD or eMMC with:
 
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
