Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1732EC76195
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FqrJBVCUSy9Dy7EJXrsIQSiMevjAvPEFlX3kDmrVaQ=; b=GYOAfKYZh7S5k/
	Aw7lvOhuZJlVg1Me1AbbMv2olA/jMax5lakTjw3aUWD5twReSMJaR0WUDrrQ3PwlAva8ZtsNtFrFJ
	n6PxrydLkin8QsyMdjyqGTwpplj1/RB1/GAUABlmWu9QtadtNeUW0jEHH74vywgcwThr8TzOAQGBV
	aUWf43vUTJSuU2Fw6L2ekSRbQLG1sEf1mv0VU29TuBF6RxntWbaI8AzF6Os+fxy88n42xOnlyNAwe
	2zruHq34BFrxCs0OedXff0lzQ6gEumm/VhBDhg+gUwdLHymkkBbg3w76343SuYlZKjAvcPaP9avfG
	PQzAXSqKNxU8IqsDsobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLzA-002Boe-26;
	Thu, 23 Mar 2023 14:32:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLz7-002Bif-0P
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:32:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o40-20020a05600c512800b003eddedc47aeso1325220wms.3
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI8vr3/36JLF0airk6gRoq/8WvqXSJmOsue8+mcEZp4=;
        b=Ya09rERr9Wequlfelrx+8X+DvhdYFF5CE5oR/pJDtd32pknUMUH1wYowoBr3uCuHYy
         Fsr+xZt/b58WExiIeX8FJnMqTyZ5m9sGcjpiDEVi5KVzrL9Xp7dOFo5/NBnZVteeVrl9
         0A78pCUdnf8MzXMNlrj2HynD1czgK6EucL08+UQ+pnudYIAuGCvHc0c9h06mUu3Y87tl
         B8/pALR/CO9i9I9wIRbeInCxMZdy64xDgbrHvEnfFpxP6hJHYqkVw7sfFDrS0hjiFrJE
         uXa8xodzMmlzzan5Xw0RxMUlZl/AJ6azcMS9RElEfgSo8dd6sRHzhwFq2nLpkb7InYDW
         gxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI8vr3/36JLF0airk6gRoq/8WvqXSJmOsue8+mcEZp4=;
        b=aX/7kGge8IRiqW40GuknYQO7QtWZL2zvsA8jQsqex/l/HfR7fQcrtZvz+m1V8QMFB1
         GwF6iJzo+eVjSbHxP7ZbArVHI5fgybA41ML1EmscPqjGLkTsmjZwwKhhqOT4kl6WYC+C
         mN6HDZ+/KpPDrJiKiehREUqdRLKL4WnYOL+FWR+mhyY/9AQorw4N4vabP0dEAM9F9/ys
         Q3ndYKTL9+WyiuV+ohm0CBpxQxGz4ORfnsoolywi6hGduKOMYkCPTr62BRtNx9+SUsaW
         ah2J6jyXsevF/wM7y4WzICOWH4vja/yhO88kidIqEcrhpgt8GOZ217lMAYXKokpLUtb8
         rcRw==
X-Gm-Message-State: AO0yUKX/EHzG8s+JxKSgs4ltwFFjSjX/jqIWSfGJZTrC2C1SydiVQSp0
	sepVqGFb9vlrr0d465g+9zs=
X-Google-Smtp-Source: AK7set9pBsmqq7cg6s/xIpI2sXIgqdoFLBczBnQy7aSNo/CbWXdIX983/iQVC0OMiqJoyL7oOPs3rw==
X-Received: by 2002:a1c:7711:0:b0:3ed:316d:668d with SMTP id t17-20020a1c7711000000b003ed316d668dmr2524964wmi.5.1679581925317;
        Thu, 23 Mar 2023 07:32:05 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:32:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 11/14] doc: boards: amlogic: add documentation for Radxa Zero2
Date: Thu, 23 Mar 2023 14:31:39 +0000
Message-Id: <20230323143142.780306-12-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073209_176443_C9243B61 
X-CRM114-Status: GOOD (  13.00  )
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
 doc/board/amlogic/radxa-zero2.rst | 80 +++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
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
index 0000000000..dccf592459
--- /dev/null
+++ b/doc/board/amlogic/radxa-zero2.rst
@@ -0,0 +1,80 @@
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
+
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
