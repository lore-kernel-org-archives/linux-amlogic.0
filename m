Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DB7C7618E
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaIPcQnI3hxnHo3whtm1b28gioi8MKYHnrbymlk0aTE=; b=gR0u2KHL69Zpic
	3NNApzs2gUam3eLEhhHsn2XlBok4hLiV+wAhgohG6oGsfX+zxnxtfAFT30K4zTocnaYc05ljR7VSE
	0vaw/nrNv/0sQ7/t3XkN/HaJbnMK+BLhkkcp61U058HI60sdLUZpqZSt1DVew85ulouSGp4ZgrnO7
	iA8mc8HyB94A8KJFYz0sZsHOx46V97eLpNogma+QiRioaoSahYeiwBWNYCBkjOD3EJdZtg9fcYPeF
	M0QspGexmvC82BedJZsjotYR9ufgP3DDLRyssi9lBnAjNIx9nAtZ3XxCS9KS+XqMoq/QLAHefbMS9
	Pq5l70vy6PAn9wWRBklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyl-008sOD-1a;
	Mon, 20 Mar 2023 11:47:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyi-008rwA-0p
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j2so10027349wrh.9
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcpHorJlJda5nW//a0yVnoGJJXcKO2Y9Lk0g22JcFtE=;
        b=MQP62o7Uwihx4W/czKQHpX8N4RbqpjB4JI17TRrTXKtwuADXQALHgSKm8MuhN7EsIg
         z/MahH2YCuUvW2VmQs2anCFBLc+gQJAe8K2JDoHkfCZJe/IqMAwmStcVhKzwTHaiydQu
         mGe2zX+MOx4zKRSVuJHGGmTFBxZ4wBMSdu5IGqslJPIa6OMyODyIlqjEKOZWpR1oTfSU
         90F+RfkdHXcYYMt0rzQFrRndLlXA9GVaw0YsQkWPoqdX2tlXgkHW0UdjUXdVAFFwj60d
         DaMwSQ5SmcWrygOL9Am2vg3oi9Cj5lHvDrIixKl9GYR8ckO6tYHIOTfzckwC38GhtWu+
         ueiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcpHorJlJda5nW//a0yVnoGJJXcKO2Y9Lk0g22JcFtE=;
        b=K3LtcA4Y9Ht4PJsaO8eYwbND/sto3riFKlfAKCZXjj1NYOJ8CcDCkJdejhjzdb6yIG
         f+LSV2eL/GsSAWimFPHPakMQIJlNiBQIPz2NQlZVC0JkWM2UadywIM/vQgCubJwMj2by
         RRTtAHLqWZLyQIUrIUer2bcfJyF2o0NXscEvTtYIqt6dkZyAHDSu4lY5gyNO7dy1ehzH
         pS8TKvqlVJiKUEp5EVNtiqkHxeXHoOMjhtmOVD+vnM8OD1jqZMZeHIPn7Fbez0lITfTP
         DRLuMu+vgNSqUyS2ZG/ZgdKqglfob8LWf0kgEbfjYV0460iodGS61NfK2VbS8eY1WM14
         S1ZA==
X-Gm-Message-State: AO0yUKW3I2PaM3TfOMSMD36sYW5eNQTUI5B6BEt6+1fyeJQDFjJMniBD
	x+/pDk6G7fTX8hzHqBcqIes=
X-Google-Smtp-Source: AK7set8lKZepeViQWoGUxmwRN5+BQSxhe08rEfy1YR3MKwwIfij038d9m/TG8Z5rc9qNEH/nF6GQoQ==
X-Received: by 2002:adf:d844:0:b0:2d1:5698:3f70 with SMTP id k4-20020adfd844000000b002d156983f70mr9106101wrl.29.1679312823830;
        Mon, 20 Mar 2023 04:47:03 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:47:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 32/33] doc: boards: amlogic: add documentation for GS-King-X
Date: Mon, 20 Mar 2023 11:46:08 +0000
Message-Id: <20230320114609.930145-33-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044704_391239_A0AD53D0 
X-CRM114-Status: GOOD (  15.05  )
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

GS-King-X is also supported with the beelink-s922x FIP sources and can use
the GT-King defconfig. Add a board document with instructions.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/beelink-s922x/MAINTAINERS |   3 +-
 doc/board/amlogic/beelink-gskingx.rst   | 121 ++++++++++++++++++++++++
 doc/board/amlogic/index.rst             |   1 +
 3 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 doc/board/amlogic/beelink-gskingx.rst

diff --git a/board/amlogic/beelink-s922x/MAINTAINERS b/board/amlogic/beelink-s922x/MAINTAINERS
index 47b622765a..8dddeb91d5 100644
--- a/board/amlogic/beelink-s922x/MAINTAINERS
+++ b/board/amlogic/beelink-s922x/MAINTAINERS
@@ -3,8 +3,9 @@ M:	Christian Hewitt <christianshewitt@gmail.com>
 S:	Maintained
 L:	u-boot-amlogic@groups.io
 F:	board/amlogic/beelink-s922x/
+F:	configs/beelink-gsking-x_defconfig
 F:	configs/beelink-gtking_defconfig
 F:	configs/beelink-gtkingpro_defconfig
-F:	configs/beelink-gsking-x_defconfig
+F:	doc/board/amlogic/beelink-gskingx.rst
 F:	doc/board/amlogic/beelink-gtking.rst
 F:	doc/board/amlogic/beelink-gtkingpro.rst
diff --git a/doc/board/amlogic/beelink-gskingx.rst b/doc/board/amlogic/beelink-gskingx.rst
new file mode 100644
index 0000000000..987d358c77
--- /dev/null
+++ b/doc/board/amlogic/beelink-gskingx.rst
@@ -0,0 +1,121 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for Beelink GS-King-X (S922X)
+====================================
+
+The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference board with an
+S922X-H chip and the following specifications:
+
+- 4GB LPDDR4 RAM
+- 64GB eMMC storage
+- 10/100/1000 Base-T Ethernet
+- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
+- HDMI 2.1 video
+- S/PDIF optical output
+- 2x ESS9018 audio DACs
+- 4x Ricor RT6862 audio amps
+- Analogue headphone output
+- 1x USB 2.0 OTG port
+- 3x USB 3.0 ports
+- IR receiver
+- 1x micro SD card slot (internal)
+- USB SATA controller with 2x 3.5" drive bays
+- 1x Power on/off button
+
+Beelink do not provide public schematics, but have been willing to share them with known
+distro developers to assist with development.
+
+U-Boot Compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make beelink-gsking-x_defconfig
+    $ make
+
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
+
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh beelink-s922x /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
+
+Beelink released an Amlogic "SDK" dump in their forums but the U-Boot sources included
+result in 2GB RAM detected. The following FIPs were generated with newer sources and
+detect 4GB RAM: https://github.com/LibreELEC/amlogic-boot-fip/tree/master/beelink-s922x
+
+.. code-block:: bash
+
+    $ wget https://github.com/LibreELEC/amlogic-boot-fip/archive/master.zip
+    $ unzip master.zip
+    $ export FIPDIR=$PWD/amlogic-boot-fip/beelink-s922x
+
+Go back to the mainline U-Boot source tree then:
+
+.. code-block:: bash
+
+    $ mkdir fip
+    $ cp $FIPDIR/* fip/
+    $ cp u-boot.bin fip/bl33.bin
+
+    $ sh fip/blx_fix.sh \
+         fip/bl30.bin \
+         fip/zero_tmp \
+         fip/bl30_zero.bin \
+         fip/bl301.bin \
+         fip/bl301_zero.bin \
+         fip/bl30_new.bin \
+         bl30
+
+    $ sh fip/blx_fix.sh \
+         fip/bl2.bin \
+         fip/zero_tmp \
+         fip/bl2_zero.bin \
+         fip/acs.bin \
+         fip/bl21_zero.bin \
+         fip/bl2_new.bin \
+         bl2
+
+    $ fip/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
+                           --output fip/bl30_new.bin.g12a.enc \
+                           --level v3
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
+                           --output fip/bl30_new.bin.enc \
+                           --level v3 --type bl30
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
+                           --output fip/bl31.img.enc \
+                           --level v3 --type bl31
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
+                           --output fip/bl33.bin.enc \
+                           --level v3 --type bl33
+    $ fip/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
+                           --output fip/bl2.n.bin.sig
+    $ fip/aml_encrypt_g12b --bootmk \
+                           --output fip/u-boot.bin \
+                           --bl2 fip/bl2.n.bin.sig \
+                           --bl30 fip/bl30_new.bin.enc \
+                           --bl31 fip/bl31.img.enc \
+                           --bl33 fip/bl33.bin.enc \
+                           --ddrfw1 fip/ddr4_1d.fw \
+                           --ddrfw2 fip/ddr4_2d.fw \
+                           --ddrfw3 fip/ddr3_1d.fw \
+                           --ddrfw4 fip/piei.fw \
+                           --ddrfw5 fip/lpddr4_1d.fw \
+                           --ddrfw6 fip/lpddr4_2d.fw \
+                           --ddrfw7 fip/diag_lpddr4.fw \
+                           --ddrfw8 fip/aml_ddr.fw \
+                           --level v3
+
+Then write U-Boot to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index 808c857622..7c4c161e0d 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -87,6 +87,7 @@ Board Documentation
 
    bananapi-cm4io
    bananapi-m5
+   beelink-gskingx
    beelink-gtking
    beelink-gtkingpro
    jethub-j80
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
