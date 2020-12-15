Return-Path: <SRS0=n1R+=FT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD38DC2BBCD
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A661224D2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A661224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eE7Q7bXln60PovMVvIJ1aI/4AI89RTtI9UkTKMvJEg=; b=j3kL+NEamxuQjHueIyIB3ZybbP
	76anJiQEpPdriWee4mLPBgxbCEEeuarpL53T4YQUhpJeNPBBThIEiR+IFjFVzD4uA72K/1IfBQ437
	f4q/89rn089vF85eQ3l7GVmBLWPZlE4Frn8ZC7guJ61kDEUC7IbERbCW2Tkdoz/hQKcJRCWdv1YD7
	+5PuMKYpAnfwkF/9QJ1BC7SQgqAfteCTEzdLAe99cYC0m8gVa6aCx6t7RGYrBxoeVhFkBJjdNs7x6
	sYlX5HAG27e5e9KmqJUGFWx4AnuzO8+a4RQfNMWBxrrBUUXVwXmEUPNQvgwB+ItggomjRrdWonylW
	ZKdUlfow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp9VF-00058J-4I; Tue, 15 Dec 2020 12:32:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp9VA-00056Z-Ss
 for linux-amlogic@lists.infradead.org; Tue, 15 Dec 2020 12:32:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id 91so19662326wrj.7
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Dec 2020 04:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z9iUoQ4Wap4UDaUD9Nyn62MUTm5cihfXRRiq9AEQgeg=;
 b=mlgf6qe4S88imDnU/dtW/FEKtZrxQzMDx5FhOm01CnULODQzuWq9zrW6aKY7iDmwrt
 O7YuZzv0/tMoHli5oQMPVpdpEb/w9kjLNEDUNt51eI4BMBb5zO0l7e0UfdwAKKYPG8nS
 xryzoeRGdsB9OhKwLwgBGwSQKADyia67izve5T1Fyix5FraJXXX3zlqJiu8W49RfIDhC
 +fppLI7vGUhq18u0D/u72QW/Yv1VnNNXYaEQ93O18kKnA4ZOiAN6ORWID4DhECAjyBPP
 6vAtLEsyKp4Sei/JdnVKW8CB4vGx+ktviMZu4Ad9mfoIZuFnKplRd/vs3pbqkUgagCXE
 xh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z9iUoQ4Wap4UDaUD9Nyn62MUTm5cihfXRRiq9AEQgeg=;
 b=A6kQL+XJeTI62IEqj9AwIhzhf9fLJv5ZdfFigdJpJcWzPJA4y88kkT1WjXBIizv1u4
 g4aPmvMg2FInTiMp6MpaWGxrktDUISINvbNmX/nIX6b6vTczEYIkPHspN4+1ktvlNiis
 75uFCJ7maGhp8uBZiuX2l9+bzYcblSPLBBVhs4pSx36PXMKC5PrDwx3CmksAGHumD5V4
 W4Hv2P6y3WI2Y47yjEQ8ZQidfTqjGd4vGN6vFbTc9rEPC88Zwmwjuh36hCGWvuZKm2iG
 EPuHUQ8v6ayYJ2kQoW//zwXZVvCTmrgda6JO755cLEWPhlwzHRTThcW7GI3NxiJARsbl
 yR5A==
X-Gm-Message-State: AOAM532qI96M9j0/enOEr3QBmOXxICHvuqwoH+p/mLd8G8c+HHYF6xtW
 BCswp9dIyDVwOMt5aZl5WoK8iZfVduO/Ng==
X-Google-Smtp-Source: ABdhPJyv0J94bRxM53cOCs2rYD+3cNvooroO96OVSRJtQ+vW6bjVrq+bfuyV8p8bf1ndRoePbZDmnA==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr2563143wrx.6.1608035543643; 
 Tue, 15 Dec 2020 04:32:23 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n3sm38488406wrw.61.2020.12.15.04.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 04:32:23 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 3/3] boards: amlogic: update documentation for WeTek Core2
Date: Tue, 15 Dec 2020 12:32:14 +0000
Message-Id: <20201215123214.18661-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215123214.18661-1-christianshewitt@gmail.com>
References: <20201215123214.18661-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_073225_035036_216ED198 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the device matrix and add build instructions.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/index.rst       |  3 +-
 doc/board/amlogic/wetek-core2.rst | 90 +++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 doc/board/amlogic/wetek-core2.rst

diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index cba1c7b726..a585d857df 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -17,7 +17,7 @@ This matrix concerns the actual source code version.
 +===============================+===========+=================+==============+============+============+=============+==============+
 | Boards                       	| Odroid-C2 | P212            | Khadas VIM2  | S400       | U200       | Odroid-N2   | SEI610       |
 |        			| Nanopi-K2 | Khadas-VIM      | Libretech-PC |	          | SEI510     | Khadas-VIM3 | Khadas-VIM3L |
-|        			| P200	    | LibreTech-CC v1 |	             |	          |            |	     | Odroid-C4    |
+|        			| P200	    | LibreTech-CC v1 |	WeTek Core2  |	          |            |	     | Odroid-C4    |
 |        			| P201	    | LibreTech-AC v2 |	             |	          |            |             |              |
 +-------------------------------+-----------+-----------------+--------------+------------+------------+-------------+--------------+
 | UART                       	| **Yes**   | **Yes**         | **Yes**      | **Yes**    | **Yes**    | **Yes**     | **Yes**      |
@@ -95,4 +95,5 @@ Board Documentation
    sei510
    sei610
    u200
+   wetek-core2
    w400
diff --git a/doc/board/amlogic/wetek-core2.rst b/doc/board/amlogic/wetek-core2.rst
new file mode 100644
index 0000000000..d2aeb90c3d
--- /dev/null
+++ b/doc/board/amlogic/wetek-core2.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0+
+U-Boot for WeTek Core2
+======================
+
+WeTek Core2 is an Android STB based on the Q200 reference design with
+the following specifications:
+
+ - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
+ - ARM Mali T820 GPU
+ - 3GB DDR4 SDRAM
+ - 10/100 Realtek RTL8152 Ethernet (internal USB)
+ - HDMI 2.0 4K/60Hz display
+ - 2x USB 2.0 Host, 1x USB 2.0 OTG (internal)
+ - 32GB eMMC
+ - microSD
+ - SDIO Wifi Module, Bluetooth
+ - Two channel IR receiver
+
+U-Boot compilation
+------------------
+
+.. code-block:: bash
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make wetek-core2_defconfig
+    $ make
+Image creation
+--------------
+
+Amlogic does not provide sources for the firmware or the tools needed
+to create the bootloader image, and WeTek has not publicly shared the
+precompiled FIP binaries. However the public Khadas VIM2 sources also
+work with the Core2 box so we can use the Khadas git tree:
+
+.. code-block:: bash
+    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+    $ tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+    $ tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+    $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+    $ git clone https://github.com/khadas/u-boot -b khadas-vim-v2015.01 vim-u-boot
+    $ cd vim-u-boot
+    $ make kvim2_defconfig
+    $ make
+    $ export FIPDIR=$PWD/fip
+
+Go back to mainline U-Boot source tree then:
+
+.. code-block:: bash
+    $ mkdir fip
+    $ cp $FIPDIR/gxl/bl2.bin fip/
+    $ cp $FIPDIR/gxl/acs.bin fip/
+    $ cp $FIPDIR/gxl/bl21.bin fip/
+    $ cp $FIPDIR/gxl/bl30.bin fip/
+    $ cp $FIPDIR/gxl/bl301.bin fip/
+    $ cp $FIPDIR/gxl/bl31.img fip/
+    $ cp u-boot.bin fip/bl33.bin
+    $ $FIPDIR/blx_fix.sh \
+        fip/bl30.bin \
+        fip/zero_tmp \
+        fip/bl30_zero.bin \
+        fip/bl301.bin \
+        fip/bl301_zero.bin \
+        fip/bl30_new.bin \
+        bl30
+    $ python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+    $ $FIPDIR/blx_fix.sh \
+        fip/bl2_acs.bin \
+        fip/zero_tmp \
+        fip/bl2_zero.bin \
+        fip/bl21.bin \
+        fip/bl21_zero.bin \
+        fip/bl2_new.bin \
+        bl2
+    $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
+    $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
+    $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
+    $ $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
+    $ $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
+        --output fip/u-boot.bin \
+        --bl2 fip/bl2.n.bin.sig \
+        --bl30 fip/bl30_new.bin.enc \
+        --bl31 fip/bl31.img.enc \
+        --bl33 fip/bl33.bin.enc
+
+then write the image to SD with:
+
+.. code-block:: bash
+    $ DEV=/dev/your_sd_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
