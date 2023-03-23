Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4009C76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InY/bA+Yk8n4cxCjKIqbOhSuL4eofCL6qqu8tlGtL2s=; b=C5PxGRKaFiuB1k
	8GSgr9GzOVilMByd1/jAkMYp0dnGr33Dry2pEFOJl84WetCt28Q4gbDJGJgepCqYsdW4RfvxV/pAp
	rgss+gm6Kv8Yd4TZ5B473+/2WnFoMkXxe1XFHSCZiuWRyRifQVRb0i792l0RsJ7/8V53NRD98R7/P
	ykOqG4Db+emwYuMmV3KS2hhQVthAteA5LG9a4bKZKYGHb2EwxRvDG2u7+fZC1kPfAwGfSX/FDlDE9
	HktczaZWmq19DkbqutaOi6P22hZHJ4V8PO0awrrRvKsg/HSZO21SA+Y3pxFwhZ3yVRzmQ+328sK2W
	x9CwgnTmtujq/dx1nXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr5-0012kG-2B;
	Thu, 23 Mar 2023 06:55:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr0-0012gC-1w
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id t15so19320137wrz.7
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlFxVkOUcTjIg+gr4Rq5oVtAcsKoR2mAEejaZ6YIadk=;
        b=gJfGIhqqWPTnk8er7dou4aF1OizKMazALo89TsgQVEYRN+PudMIbDyDTHxCJlfGDH8
         1VYck7N+aC++RK7dxiISwg0hGzENNTknzbrfEkgkg6QLtO2i6tRqnfiSvmIEHy9b+MFU
         9SqSr7zEwiAULp29l8G2VsRy07U8YjijJCj9gNSIZAL3syj/GsEdHbeHIaNdP0RWxuMA
         VkeG25enM3wNwkMl5Umrbah1Uzz7oeJ2wBhPDabym2LlSgCY0LYnQME8TfKrsOTT3Msy
         1BEty0XPa+AZp9d05L6gCgnEFO7Wy8Vx6mNAKp8S2aUxSPH+V4wLdLBSUx+/opDPAW7L
         jkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlFxVkOUcTjIg+gr4Rq5oVtAcsKoR2mAEejaZ6YIadk=;
        b=LZnz3z8xQFzurdLMUkTXrd/q85/4YjVg6wUi6z7UgYDEU5ncUpCyIcoOvDHCUSPOqC
         kMvXxD2F1CnckswcaV4AP3r75FdB0Ruiz3KszQ5CSvLoRxghIEqYQcv5GtW4dagRYFaX
         PwOBq10QBl97wMcopRxQWeFiWQi4CsRU4mHYtx3OsBwxgP/7Iage2evrWGlmD0x8C32P
         Tu/24jjkRVjj+b22zqqqEho8Mrju8FzhHOb+z/K/lA36ZBH37pyNCR1K311/wZcT0PJT
         koDMu3qRG8tPPj7ML54o/jf5ir5cr9EPhGS2l786O0VyHA7UKba+7hUq2Sixj1Xr9eil
         1tUg==
X-Gm-Message-State: AAQBX9fFNwmbB5BulTSnx/9Z/uOMFWz/4DSeKSsbzyi0PI5eZypkIgwb
	jYT1D43bSRtkrfiqBwO71DQ=
X-Google-Smtp-Source: AKy350bkI/la2qGD7Ikhcd4tqPkdEgoxP/XfS6R9u9f++v9jnGjO9dPm764r6y5hKVDvq0LdW51Hag==
X-Received: by 2002:a05:6000:152:b0:2d3:b49c:23d5 with SMTP id r18-20020a056000015200b002d3b49c23d5mr1543974wrx.29.1679554517326;
        Wed, 22 Mar 2023 23:55:17 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 10/13] doc: boards: amlogic: add documentation for Radxa Zero2
Date: Thu, 23 Mar 2023 06:54:55 +0000
Message-Id: <20230323065458.776029-11-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235518_649445_AB881225 
X-CRM114-Status: GOOD (  12.91  )
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

Add build docs for the Radxa Zero2 board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/w400/MAINTAINERS    |  2 +
 doc/board/amlogic/index.rst       |  1 +
 doc/board/amlogic/radxa-zero2.rst | 79 +++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 doc/board/amlogic/radxa-zero2.rst

diff --git a/board/amlogic/w400/MAINTAINERS b/board/amlogic/w400/MAINTAINERS
index 042b523056..117f79ea04 100644
--- a/board/amlogic/w400/MAINTAINERS
+++ b/board/amlogic/w400/MAINTAINERS
@@ -5,6 +5,8 @@ L:	u-boot-amlogic@groups.io
 F:	board/amlogic/w400/
 F:	configs/bananapi-cm4-cm4io_defconfig
 F:	configs/bananapi-m2s_defconfig
+F:	configs/radxa-zero2_defconfig
 F:	doc/board/amlogic/w400.rst
 F:	doc/board/amlogic/bananapi-cm4io.rst
 F:	doc/board/amlogic/bananapi-m2s.rst
+F:	doc/board/amlogic/radxa-zero2.rst
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index fa1b362731..71b7e1f3ed 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -112,6 +112,7 @@ Board Documentation
    p212
    q200
    radxa-zero
+   radxa-zero2
    sei510
    sei610
    s400
diff --git a/doc/board/amlogic/radxa-zero2.rst b/doc/board/amlogic/radxa-zero2.rst
new file mode 100644
index 0000000000..3fb5d360e8
--- /dev/null
+++ b/doc/board/amlogic/radxa-zero2.rst
@@ -0,0 +1,79 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for Radxa Zero2 (A311D)
+==============================
+
+Radxa Zero2 is a small form factor SBC based on the Amlogic A311D chipset with the
+following specification:
+
+- Amlogic A311D (Quad A73 + Dual A53) CPU
+- 4GB LPDDR4 RAM
+- 32/64/128GB eMMC
+- Mali G52-MP4 GPU
+- HDMI 2.1 output (micro)
+- BCM4345 WiFi (2.4/5GHz a/b/g/n/ac) and BT 5.0
+- 1x USB 2.0 port - Type C (OTG)
+- 1x USB 3.0 port - Type C (Host)
+- 1x micro SD Card slot
+- 40 Pin GPIO header
+
+Schematics are available on request from Radxa.
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make radxa-zero2_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh radxa-zero2 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
+
+.. code-block:: bash
+
+    $ git clone -b radxa-zero-v2021.07 https://github.com/radxa/u-boot.git
+    $ git clone https://github.com/radxa/fip.git
+
+    $ sudo apt-get install -y gcc-aarch64-linux-gnu device-tree-compiler libncurses5 libncurses5-dev
+    $ sudo apt-get install -y bc python dosfstools flex build-essential libssl-dev mtools
+
+    $ wget https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf.tar.xz
+    $ sudo tar xvf gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf.tar.xz -C /opt
+
+    $ export CROSS_COMPILE=/opt/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
+    $ export ARCH=arm
+    $ cd u-boot
+    $ make radxa-zero2_defconfig
+    $ make
+
+    $ cp u-boot.bin ../fip/radxa-zero2/bl33.bin
+    $ cd ../fip/radxa-zero2
+    $ make
+
+This will generate the signed U-Boot binaries:
+
+.. code-block:: bash
+
+    $ u-boot.bin u-boot.bin.sd.bin u-boot.bin.usb.bl2 u-boot.bin.usb.tpl
+
+Then write U-Boot to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
