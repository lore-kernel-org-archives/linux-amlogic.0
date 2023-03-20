Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B170C7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdeyuFJFjBIW1M0YM14p1khSBpCMzI1s1Ck3S/FV1hE=; b=JU1iZ4LeZ8eOcs
	k0H3c9JBoNxvdUdkUTXzVP8VnKr9liYA3AFq8CIr2wWkfZDXOIJgZiKPcVX7tDd0nqhDJAD4EP3Fa
	72IlpY3posqYersyIUewta0tLghcWiF1UjgHMrF1c5mKeHsM6a6VVanueLtQy9Az2GxeJlkQW9q2Y
	/6CwIsjhpl3XUrqxjWH+NvOzXgH4vMofKcJAsknPmvoKDp6nlBk0u5a47A8fX7asAlbpaHqCSDbmd
	lhWxhJmZ1naDgHDZYxYBg4t/YTYSZnN+h2vdkPDGzbXXaCdrCExApMcSCIOlnXlFpAmAlUMyn2NWm
	1zupycrt2e8O2B+RzLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy7-008rsA-1K;
	Mon, 20 Mar 2023 11:46:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy4-008ro6-1P
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id v1so3932885wrv.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPKSZKQAkxfQwjhbzG6pHQxSwGjcBFMBCf2hvSJPr+s=;
        b=dVf0vTeyD08DnCj6xy18uRRWYK5s8/g/T062gOM/YBcifxWIDDFZ2ydKffKFTfI0n4
         JDFmHIZ8dP9IvZnHddTIrx6Q922DmI4hLZc0/pNrwc91uYsa+i3DuLose53fq1rav09h
         YHny1QRoRQ1ZSJMtWyXRTlmU+QsOnyBSQIdDdMcTfPCaJw0uS9Nh8jXbGmz56d7hdCRL
         LA/MQWzXLpcJsBsiumQYk90TrIbd5t4f9xhzPNj8KhnPygKppjQ5pKpIEeLdSyeso9ib
         NRbJ69VqtNTL/k8Y1uKXnewR5rq7ddjtgYGGjuhQq4wFH5qxNsm0swKtsQ5H6JEFp8JO
         VbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPKSZKQAkxfQwjhbzG6pHQxSwGjcBFMBCf2hvSJPr+s=;
        b=Zo5/aUUV8tPx6WA4zgGS+78AoCWMNODZxkmEaS8Pyt2OQ8gg2rzUyL3zFnSSLpntX9
         jxrkH02WPgNoGPGzosdCKvYJEALuSZSM5GORAsxadClTdyXFWupem4Lt2nkLyKmYzTpZ
         EyRGlMahf/R/459VFSZzTahA1Pv6zgdSKmTrfbO4JtiApxrbw4GPYmWmhLQugvm2fOjZ
         qO6SCRu7t2qrWlgaliyAfpZ7t05pXJTYe62zLHDgth1FSTjdHuX/8OOn7rGxEFeS2KIC
         oZl4WaHZOXhpsMLURXhJcOiBaEpo9kYTukYrfdKbFvSuT1ltjNtA6U43sPiqGTFQA9VT
         uIrA==
X-Gm-Message-State: AO0yUKXT1FQsrY9NugFiVEKNGxjU4QXiOWkE8H8OuZePPfaKcw6RhiXJ
	VoGJ7c5cHgdP71dl1eDVl0M=
X-Google-Smtp-Source: AK7set9HS+qeowDa72fVoskrtqSi5s4lw8RXvx/KjDroYTmv1mDVN6riS6h3GIm2mgKZjg3YM00Nbw==
X-Received: by 2002:a5d:67c4:0:b0:2d1:5b75:28f0 with SMTP id n4-20020a5d67c4000000b002d15b7528f0mr13156361wrw.39.1679312782154;
        Mon, 20 Mar 2023 04:46:22 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 06/33] doc: boards: amlogic: update documentation for JetHub J100
Date: Mon, 20 Mar 2023 11:45:42 +0000
Message-Id: <20230320114609.930145-7-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044624_472775_C6B616C0 
X-CRM114-Status: GOOD (  10.92  )
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
 doc/board/amlogic/jethub-j100.rst | 66 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/doc/board/amlogic/jethub-j100.rst b/doc/board/amlogic/jethub-j100.rst
index dd1ed68b9c..0d63976789 100644
--- a/doc/board/amlogic/jethub-j100.rst
+++ b/doc/board/amlogic/jethub-j100.rst
@@ -1,11 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for JetHub J100
-=======================
+U-Boot for JetHub J100 (A113X)
+==============================
 
-JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a series of home
-automation controller manufactured by JetHome with the following
-specifications:
+JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation controller device
+manufactured by JetHome with the following specifications:
 
  - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
  - no video out
@@ -22,16 +21,15 @@ specifications:
  - DC source with a voltage of 9 to 56 V / Passive POE
  - DIN Rail Mounting case
 
-Basic version also has:
+The basic version also has:
 
- - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output
-   power and Zigbee 3.0 support.
+ - TI CC2538 + CC2592 Zigbee Wireless with upto 20dBm output power and Zigbee 3.0
  - 1 x 1-Wire
  - 2 x RS-485
  - 4 x dry contact digital GPIO inputs
  - 3 x relay GPIO outputs
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -40,14 +38,20 @@ U-Boot compilation
     $ make jethub_j100_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `jethub-j100`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh jethub-j100 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain binaries
-from the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -55,7 +59,7 @@ from the git tree published by the board vendor:
     $ cd jethub-u-boot
     $ export FIPDIR=$PWD
 
-Go back to mainline U-boot source tree then :
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -90,27 +94,27 @@ Go back to mainline U-boot source tree then :
         bl2
 
     $ $FIPDIR/j100/aml_encrypt_axg --bl3sig --input fip/bl30_new.bin \
-                                        --output fip/bl30_new.bin.enc \
-                                        --level v3 --type bl30
+                                   --output fip/bl30_new.bin.enc \
+                                   --level v3 --type bl30
     $ $FIPDIR/j100/aml_encrypt_axg --bl3sig --input fip/bl31.img \
-                                        --output fip/bl31.img.enc \
-                                        --level v3 --type bl31
+                                   --output fip/bl31.img.enc \
+                                   --level v3 --type bl31
     $ $FIPDIR/j100/aml_encrypt_axg --bl3sig --input fip/bl33.bin --compress lz4 \
-                                        --output fip/bl33.bin.enc \
-                                        --level v3 --type bl33
+                                   --output fip/bl33.bin.enc \
+                                   --level v3 --type bl33
     $ $FIPDIR/j100/aml_encrypt_axg --bl2sig --input fip/bl2_new.bin \
-                                        --output fip/bl2.n.bin.sig
+                                   --output fip/bl2.n.bin.sig
     $ $FIPDIR/j100/aml_encrypt_axg --bootmk \
-                --output fip/u-boot.bin \
-                --bl2 fip/bl2.n.bin.sig \
-                --bl30 fip/bl30_new.bin.enc \
-                --bl31 fip/bl31.img.enc \
-                --bl33 fip/bl33.bin.enc --level v3
+                                   --output fip/u-boot.bin \
+                                   --bl2 fip/bl2.n.bin.sig \
+                                   --bl30 fip/bl30_new.bin.enc \
+                                   --bl31 fip/bl31.img.enc \
+                                   --bl33 fip/bl33.bin.enc --level v3
 
-and then write the image to eMMC with:
+Then write U-Boot to SD or eMMC with:
 
 .. code-block:: bash
 
-    $ DEV=/dev/your_emmc_device
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
