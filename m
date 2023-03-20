Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF5AC76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHNUFeuSjMfLgGgRE3KAsXpAjk7lWpFU3mwCJ4i4qWg=; b=L8vHuSzjsmEaNj
	t+kY5lFxuFVTx/4l2yifkrEOWMYjR7KXSqDOXH1kX59YaR2VgAZUz2PCa95s+8mkbkPJZFeEHmUh9
	4Lbdf9T7Lpe+fvofMaboKr4ZztQTR5t5Gdf+xLDO8xygMK5iLmrKO1nRgGLLnw2s65pozD7RignxT
	ido//tqldL/BPm4ldvm5lFA2EtsN5xkRvof8QXzyrqqUgB87/f8mV2VQkczF9KYxibfqjsJoJlxJC
	O1+AokEC3lnRWoKWwUc4QlOYAnLSmPj0fNJe78cKnmiMi4TTUnjC6rk9eOId9386H1AKk52AnO26+
	bwo1vRUlTqZGNzOso5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7c-00929R-2z;
	Mon, 20 Mar 2023 13:00:20 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyd-008sBt-2H
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:01 +0000
Received: by mail-wr1-f52.google.com with SMTP id r29so10019084wra.13
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7cjgEYI29KMpo57s2rb53lbtSRPUWD30me1nYvBnTc=;
        b=FnN/BII+srkmdFKf94GZ/ZocC6Tdd5uk6upz+b/KabXgMVGSwGzdAzQISOmTUiB4aT
         i5WYeSUrHDcE24OJab2R55h3m9xXSpRSegESwQjz+m0LyZsjkCQ4XReoxolwpY49tv5R
         09Pj0tJ8efu5tOrYLlnQp2g3iqUGy6kH4xhyyoo8jOjJtOSPDdT4Slo/OkhcAgsPpONA
         5HameRJfIAVVtUNDACCgSnp8MGITp77B1NXVFhZSY0aB+7ukLu63BmaR1aQFQOgkj4+F
         GMJ3Tthi+tc1i5pVHypcZb5zVI/djWeTNaZKiCgMpMjjju2uO/fcOwnChJ3W7QrwyhlW
         n6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7cjgEYI29KMpo57s2rb53lbtSRPUWD30me1nYvBnTc=;
        b=4krGiO5tcfSbcJuaIrg9FfNg7yZ8hgpeBB39dPAlqNL7YRlw7gbFwncVm6OMP8b5tV
         47QV+00qTHUZWbhIRex4vQRWd0iesuLpKWF++N3diSf9AhFAhuU56cshVWmMcHHK3FFU
         P8ZpXitPF1l+V2PDjlW4VL2ULBEJgk+8bBRpRcDDDBEA6CZ1L1Yn/quJXO4jlT0sB1yV
         W4S7Thet93ttifomUIsav/Cz9KNkssGFOmigdghLZteK7iNb0Pu67OYnJ6AjD9lFJU5d
         XxNhe1KFit7kI40pYk9hUwXsWLrEQN1u46vbRaBKZL6yrG9by99pKvVAlfkhZgMR9Bxr
         k9rA==
X-Gm-Message-State: AO0yUKUNPvnN0pj4CW6fLaCVZYcPiRnVFDc2AWFGpO1oRFdQvdBLN080
	z6H2Heu5xsn8pEpRbSxnnsM=
X-Google-Smtp-Source: AK7set8UPFMlWkGrlRcOaDbSIR9mfI60G8U7O+O4rpZH4BbkKphUPIPpyuiwBTfc2nw9T1AQCb0wog==
X-Received: by 2002:adf:f3c9:0:b0:2cf:9889:8428 with SMTP id g9-20020adff3c9000000b002cf98898428mr14357338wrp.35.1679312809848;
        Mon, 20 Mar 2023 04:46:49 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:49 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 23/33] doc: boards: amlogic: update documentation for Radxa Zero
Date: Mon, 20 Mar 2023 11:45:59 +0000
Message-Id: <20230320114609.930145-24-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044659_767326_B1B31EBA 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
 doc/board/amlogic/radxa-zero.rst | 45 +++++++++++++++++---------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/doc/board/amlogic/radxa-zero.rst b/doc/board/amlogic/radxa-zero.rst
index f5611f52ec..e8a8d87320 100644
--- a/doc/board/amlogic/radxa-zero.rst
+++ b/doc/board/amlogic/radxa-zero.rst
@@ -1,14 +1,13 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Radxa Zero
-=====================
+U-Boot for Radxa Zero (S905Y2)
+==============================
 
-Radxa Zero is a small form factor SBC based on the Amlogic S905Y2
-chipset that ships in a number of RAM/eMMC configurations:
+Radxa Zero is a small form factor SBC based on the Amlogic S905Y2 chipset that ships in
+a number of RAM/eMMC configurations:
 
-Boards with 512MB/1GB LPDDR4 RAM have no eMMC storage and BCM43436
-wireless (2.4GHz b/g/n) while 2GB/4GB boards have 8/16/32/64/128GB
-eMMC storage and BCM4345 wireless (2.4/5GHz a/b/g/n/ac).
+512MB/1GB LPDDR4 RAM boards have no eMMC and BCM43436 wireless (2.4GHz b/g/n) while the
+2GB/4GB boards have 8/16/32/64/128GB eMMC and BCM4345 wireless (2.4/5GHz a/b/g/n/ac).
 
 - Amlogic S905Y2 quad-core Cortex-A53
 - Mali G31-MP2 GPU
@@ -18,11 +17,9 @@ eMMC storage and BCM4345 wireless (2.4/5GHz a/b/g/n/ac).
 - 1x micro SD Card slot
 - 40 Pin GPIO header
 
-Schematics are available on the manufacturer website:
+Schematics are available on the manufacturer website: https://dl.radxa.com/zero/docs/hw
 
-https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SCH_20210309.pdf
-
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -31,14 +28,20 @@ U-Boot compilation
     $ make radxa-zero_defconfig
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
+    $ ./build-fip.sh radxa-zero /path/to/u-boot/u-boot.bin my-output-dir
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `radxa-zero`
+U-Boot Manual Signing
+---------------------
 
-Amlogic does not provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-git trees published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -61,16 +64,16 @@ git trees published by the board vendor:
     $ cd ../fip/radxa-zero
     $ make
 
-This will generate:
+This will generate the signed U-Boot binaries:
 
 .. code-block:: bash
 
     $ u-boot.bin u-boot.bin.sd.bin u-boot.bin.usb.bl2 u-boot.bin.usb.tpl
 
-Then write the image to SD with:
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
