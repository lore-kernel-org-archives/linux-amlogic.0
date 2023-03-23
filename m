Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD50C76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu64BCNRBgAyiN/WL/9cxE2tUXW1rCtGD3uJmwWGy34=; b=uA2+4kwNBM3Cgr
	h5e6CSanb9vhfPVU4fYjUGGOVzYpq8191FHvy2L5Yp1h3LY3wnY715xjRBP8pp/qiVIXDFcWgu2Sn
	661STwILh+Y8AQJ1vbAi2fU8cUJeYa//k2C7BURRAe/W2csBVpqz9qPGpLAWgHfQReJ643RUaA1hB
	yq7R+oOCIBSKOtEPoZ/Qpb7niWtlJTlszF/GixO0AXYrCtOxFfuzbZOnRfYmN/FGRA78ATXZLTIGB
	Oj4xrIraU6gc7yrHMa+MtXYde7KIJvi6lia0FzzHIEhUzGWMqgCB25Wb6lECG1JWB8pwlZFIFRHy5
	7hCMrsZKru9jGSGDLFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfErB-0012oh-02;
	Thu, 23 Mar 2023 06:55:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr4-0012ba-10
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id i9so19324952wrp.3
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Byvi1Z+GzUHZkw2Og9sfb3zz93108SCs7BAIyh0CC08=;
        b=UZYyiJUwCkoshdNv8sjovRxcQxXEMX9j4pkqnnR2Nidv12lljd3vldA+aLR+3kszP0
         KWmPWeGxRN1KhZRIeuacutqr+ZYI8+7j4cweDm4WcjUBqNyJE3K1ktAuWFg4jJo09OIo
         qvY84XaljywZtCmH5hkuvqEr7+StRKdxaOFh6RQOCwZCytKGNvzoWY2gZfghHwVaG7YW
         dz5zqharK/qmlWiV62pIgsqGJBHBTYgxlgNN9SUQDEJ1UQ4U77yzfgUPpqqS0aHr+Pve
         U7fkGKpOCo/0QP+BHQv4HP12HGf00O+DlglA11BlJN4c/mFLXkPUcG4e3wQXFZ9mFFcW
         F/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Byvi1Z+GzUHZkw2Og9sfb3zz93108SCs7BAIyh0CC08=;
        b=JppLPCdTwZ9wcpcEkVc+5Hm/AFhS80Gw5BR/AuucFgKi/8IkqDMZuwU9Bo1ZAaJhH+
         L3SSVIXonBE8acAyBvJRNw5sMs9HVHoiFHGN5VAT0d9GC7noy1vZDL2yKCE+Ny8awe3i
         LVgpvHBBkhfssRE/1972cZDqoyIAUk98uekEouE1wQzbtDkGDqmTJ4BjN8bxChHBhqZs
         sxiObkT7FcJvw0FSQxA1yzDembt7aPdKJmjPpDlhF1xWVL2GP6cQbYAT4Dhri1d2/0B8
         pxGnudZIhs+MlSZTvkm4Adi5IzYsL3pQ9+D3w7WPzoRNrkBcVQ2AP0mhs8kinur3OZ8v
         +74g==
X-Gm-Message-State: AAQBX9dCSd57La10ERaZqHS7a0saVu0hFSfQAvw2p1eIYOAyM3vXzyQm
	uXSEdnJ/3dHMvAiyueq7y+0=
X-Google-Smtp-Source: AKy350ZquAbBB0Ho7S2LlI1i/A+aNSyL2Ij1UmNxWGjDri8P3zzxn9VB0W2eLYjELQur9KUTQf1KNA==
X-Received: by 2002:a5d:4685:0:b0:2d1:46eb:3f98 with SMTP id u5-20020a5d4685000000b002d146eb3f98mr1750135wrq.36.1679554521707;
        Wed, 22 Mar 2023 23:55:21 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 13/13] doc: boards: amlogic: add documentation for WeTek Hub and WeTek Play2
Date: Thu, 23 Mar 2023 06:54:58 +0000
Message-Id: <20230323065458.776029-14-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235522_385119_4B93E7AE 
X-CRM114-Status: GOOD (  16.35  )
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

Add build instructions for the WeTek Hub and WeTek Play2 boards.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/p200/MAINTAINERS    |   2 +
 doc/board/amlogic/index.rst       |   2 +
 doc/board/amlogic/wetek-hub.rst   | 109 ++++++++++++++++++++++++++++
 doc/board/amlogic/wetek-play2.rst | 114 ++++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+)
 create mode 100644 doc/board/amlogic/wetek-hub.rst
 create mode 100644 doc/board/amlogic/wetek-play2.rst

diff --git a/board/amlogic/p200/MAINTAINERS b/board/amlogic/p200/MAINTAINERS
index 264218e3be..fe451dd7db 100644
--- a/board/amlogic/p200/MAINTAINERS
+++ b/board/amlogic/p200/MAINTAINERS
@@ -12,3 +12,5 @@ F:	configs/wetek-play2_defconfig
 F:	doc/board/amlogic/p200.rst
 F:	doc/board/amlogic/nanopi-k2.rst
 F:	doc/board/amlogic/odroid-c2.rst
+F:      doc/board/amlogic/wetek-hub.rst
+F:      doc/board/amlogic/wetek-play2.rst
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index 71b7e1f3ed..deb7976436 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -118,4 +118,6 @@ Board Documentation
    s400
    u200
    wetek-core2
+   wetek-hub
+   wetek-play2
    w400
diff --git a/doc/board/amlogic/wetek-hub.rst b/doc/board/amlogic/wetek-hub.rst
new file mode 100644
index 0000000000..7362b7d7f5
--- /dev/null
+++ b/doc/board/amlogic/wetek-hub.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for WeTek Hub (S905)
+===========================
+
+WeTek Hub is a small form-factor Android STB manufactured by WeTek with the following
+specification:
+
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 1GB DDR3 SDRAM
+ - 8GB eMMC
+ - Gigabit Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 1x USB otg
+ - microSD
+ - UART jack
+ - Infrared receiver
+
+Schematics are not publicly available but have been shared privately to maintainers.
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make wetek-hub_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh wetek-hub /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image and WeTek has not publicly shared the U-Boot sources needed to build FIP binaries
+for signing. However you can download them from the amlogic-fip-repo.
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip/wetek-hub
+    $ export FIPDIR=$PWD
+
+Go back to the mainline U-Boot source tree then:
+
+.. code-block:: bash
+
+    $ mkdir fip
+
+    $ cp $FIPDIR/bl2.bin fip/
+    $ cp $FIPDIR/acs.bin fip/
+    $ cp $FIPDIR/bl21.bin fip/
+    $ cp $FIPDIR/bl30.bin fip/
+    $ cp $FIPDIR/bl301.bin fip/
+    $ cp $FIPDIR/bl31.img fip/
+    $ cp u-boot.bin fip/bl33.bin
+
+    $ $FIPDIR/blx_fix.sh \
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
+
+    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
+                         --bl31 fip/bl31.img \
+                         --bl33 fip/bl33.bin \
+                         fip/fip.bin
+
+    $ sed -i 's/\x73\x02\x08\x91/\x1F\x20\x03\xD5/' fip/bl2.bin
+    $ python3 $FIPDIR/acs_tool.py fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+
+    $ $FIPDIR/blx_fix.sh \
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
+
+    $ cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
+
+    $ $FIPDIR/aml_encrypt_gxb --bootsig \
+                              --input fip/boot_new.bin
+                              --output fip/u-boot.bin
+
+Then write U-Boot to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 conv=fsync
+    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 seek=9 skip=8 count=87 conv=fsync,notrunc
+    $ dd if=/dev/zero of=fip/u-boot.bin.gxbb bs=512 seek=8 count=1 conv=fsync,notrunc
+    $ dd if=bl1.bin.hardkernel of=fip/u-boot.bin.gxbb bs=512 seek=2 skip=2 count=1 conv=fsync,notrunc
+    $ ./aml_chksum fip/u-boot.bin.gxbb
+    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=1 count=440
diff --git a/doc/board/amlogic/wetek-play2.rst b/doc/board/amlogic/wetek-play2.rst
new file mode 100644
index 0000000000..31c839dcd5
--- /dev/null
+++ b/doc/board/amlogic/wetek-play2.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for WeTek Play2 (S905)
+=============================
+
+WeTek Play2 is an Android STB manufactured by WeTek with the following specification:
+
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - 8GB eMMC
+ - Gigabit Ethernet
+ - AP6335 (v1) or AP6255 (v2) WiFi (b/g/n) and BT 4.0
+ - HDMI 2.0 4K/60Hz display
+ - 2x USB 2.0 host
+ - 1x USB 2.0 otg
+ - microSD
+ - UART jack
+ - Infrared receiver
+ - Power LED (blue)
+ - Power button (case, front)
+ - Reset button (underside)
+ - DVB Card: DVB-S or DVB-T/C or ATSC
+
+Schematics are not publicly available but have been shared privately to maintainers.
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make wetek-play2_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh wetek-play2 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image and WeTek has not publicly shared the U-Boot sources needed to build FIP binaries
+for signing. However you can download them from the amlogic-fip-repo.
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip/wetek-play2
+    $ export FIPDIR=$PWD
+
+Go back to the mainline U-Boot source tree then:
+
+.. code-block:: bash
+
+    $ mkdir fip
+
+    $ cp $FIPDIR/bl2.bin fip/
+    $ cp $FIPDIR/acs.bin fip/
+    $ cp $FIPDIR/bl21.bin fip/
+    $ cp $FIPDIR/bl30.bin fip/
+    $ cp $FIPDIR/bl301.bin fip/
+    $ cp $FIPDIR/bl31.img fip/
+    $ cp u-boot.bin fip/bl33.bin
+
+    $ $FIPDIR/blx_fix.sh \
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
+
+    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
+                         --bl31 fip/bl31.img \
+                         --bl33 fip/bl33.bin \
+                         fip/fip.bin
+
+    $ sed -i 's/\x73\x02\x08\x91/\x1F\x20\x03\xD5/' fip/bl2.bin
+    $ python3 $FIPDIR/acs_tool.py fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+
+    $ $FIPDIR/blx_fix.sh \
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
+
+    $ cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
+
+    $ $FIPDIR/aml_encrypt_gxb --bootsig \
+                              --input fip/boot_new.bin
+                              --output fip/u-boot.bin
+
+Then write U-Boot to SD or eMMC with:
+
+.. code-block:: bash
+
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
