Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED28AC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WGP39JJHbr60hEL6vyT7Jk1+jnIgdUqLdtfQA6iiko=; b=sz4ItXEPHFJYaV
	bR4RgX6DDuCtQNGay1Vw42bKYTCbSk94MCkqf4Kpi4al/amtMOFJbnX69ZfkKQ7LQ2H7ZkLYnTyDY
	scevxFSfNHfYHvfEjClvSY1nJA1z0KyHUbA6jRYP3IF1q0fhv4key1k1yynl92s1rCtebU0U7ldZk
	OEs0/pWC9NKCtx6IZBZc0I69sda31cX9fIWO45DQ5dmQpVZzRS+/FvD2pV2cMOs98PcMonlYMrgs9
	XyM3ijbJ7rt4pj4+ib8Sc5OVDH74zh5uA/1W0XRyEaEbVMouCYzy8n+KdqDYQ45xOYUQJFIj7Z/PY
	IX4H/ZoYtGKwOnzMijXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7d-00929n-0r;
	Mon, 20 Mar 2023 13:00:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyd-008rqP-2W
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:47:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so10029656wrm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaJQuomWRLKQE+KLyYWHiJ+/lNL7h9a/2ACaktG++Y8=;
        b=U/kATEcEU9ZVL6Htx5y1Bq6qyB++v97Z/XpiZttOL92NCul02iCwnqbxzbzxknNiVX
         YP5spkhamRU+xkGG3RM+dvyrTMB8n0FoL8K3X/GN4UE+16RAe8XFqNaAMhFT672mbvdd
         ioeprti0chDQP8wpnvijedHaPpbxaZHS2JXC5rpCDndDtVMinvoRXmNtkcRcU+hN/PjA
         UgcQ05M4CSNjtj0m4bGXSBXKWEIKfVYjWH6nSG17RNRX/9uLFa+2BZB/bwzgHqdvTZXj
         qXXAYKJtZ4owYuJUDA/tR/MyrgbHZBTkbsRENavE0D9geKNtnofoGKC/v3gsiSEKY9oD
         F3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaJQuomWRLKQE+KLyYWHiJ+/lNL7h9a/2ACaktG++Y8=;
        b=bcvlZP7+U0/g3P0Tg1p8I53rorJWtjWa4zUPmeLh8sjFlFoV0Tq2Qmrr5qJnWNsmCE
         MqwyCsvtKKuk2BbWw9wqPsL9EWXIbtzau75snbRb5rxOxiw+seKpUzN3XmeIgze5D9eS
         Bqk7n0zR8eAiphrrwl4D4tlLShd7PYlTniqK016liG91cy4Wspyk7u7O4+9qa+HPl5Tn
         wwPYXB81hV0wbCGQSDLwCxqhmF86X1FeE5KJ9DwedTF8lGGDz6D8ItOZjdsgJdgtkM0a
         G1QUvud23QM0+UcOitgcpfVY3B96S5XOdtCsvhaTMehpP0C7g3lM+ht+A67/6Acr3FMc
         7X1g==
X-Gm-Message-State: AO0yUKX8fMItnppsLIz7SDUauiQSVMayRTEzadNEONYEcg02M7fRtKiq
	Df8GzruIvCrXvRwk35ZJY9k=
X-Google-Smtp-Source: AK7set8oeWdVk4E8dYfhqBgKIE44HgvZA1KoLjB1rpzwH3R25ZQz7+mkvzp986SFGQ23fIzDv04MXg==
X-Received: by 2002:a5d:4ace:0:b0:2cf:f279:378f with SMTP id y14-20020a5d4ace000000b002cff279378fmr13437190wrs.44.1679312819131;
        Mon, 20 Mar 2023 04:46:59 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 29/33] doc: boards: amlogic: update documentation for WeTek Core2
Date: Mon, 20 Mar 2023 11:46:05 +0000
Message-Id: <20230320114609.930145-30-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044659_821045_58BF90D9 
X-CRM114-Status: GOOD (  11.47  )
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
 doc/board/amlogic/wetek-core2.rst | 83 +++++++++++++++++--------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/doc/board/amlogic/wetek-core2.rst b/doc/board/amlogic/wetek-core2.rst
index 0147d5fbe2..5eba566af4 100644
--- a/doc/board/amlogic/wetek-core2.rst
+++ b/doc/board/amlogic/wetek-core2.rst
@@ -1,23 +1,24 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for WeTek Core2
-======================
+U-Boot for WeTek Core2 (S912)
+=============================
 
-WeTek Core2 is an Android STB based on the Q200 reference design with
-the following specifications:
+WeTek Core2 is an Android STB based on the Q200 reference design with the following
+specifications:
 
  - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
  - ARM Mali T820 GPU
  - 3GB DDR4 SDRAM
  - 10/100 Realtek RTL8152 Ethernet (internal USB)
  - HDMI 2.0 4K/60Hz display
- - 2x USB 2.0 Host, 1x USB 2.0 OTG (internal)
+ - 2x USB 2.0 Host
+ - 1x USB 2.0 OTG (internal)
  - 32GB eMMC
  - microSD
  - SDIO Wifi Module, Bluetooth
  - Two channel IR receiver
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -26,15 +27,21 @@ U-Boot compilation
     $ make wetek-core2_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `wetek-core2`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh wetek-core2 /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic does not provide sources for the firmware or the tools needed
-to create the bootloader image, and WeTek has not publicly shared the
-precompiled FIP binaries. However the public Khadas VIM2 sources also
-work with the Core2 box so we can use the Khadas git tree:
+Amlogic does not provide firmware sources or tools needed to create the bootloader image
+and WeTek has not publicly shared the precompiled FIP binaries. However the Khadas VIM2
+sources also work with the Core2 box so we can use the Khadas git tree:
 
 .. code-block:: bash
 
@@ -49,7 +56,7 @@ work with the Core2 box so we can use the Khadas git tree:
     $ make
     $ export FIPDIR=$PWD/fip
 
-Go back to mainline U-Boot source tree then:
+Go back to the mainline U-Boot source tree then:
 
 .. code-block:: bash
 
@@ -61,38 +68,42 @@ Go back to mainline U-Boot source tree then:
     $ cp $FIPDIR/gxl/bl301.bin fip/
     $ cp $FIPDIR/gxl/bl31.img fip/
     $ cp u-boot.bin fip/bl33.bin
+
     $ $FIPDIR/blx_fix.sh \
-        fip/bl30.bin \
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
+
     $ python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+
     $ $FIPDIR/blx_fix.sh \
-        fip/bl2_acs.bin \
-        fip/zero_tmp \
-        fip/bl2_zero.bin \
-        fip/bl21.bin \
-        fip/bl21_zero.bin \
-        fip/bl2_new.bin \
-        bl2
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
+
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
     $ $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-        --output fip/u-boot.bin \
-        --bl2 fip/bl2.n.bin.sig \
-        --bl30 fip/bl30_new.bin.enc \
-        --bl31 fip/bl31.img.enc \
-        --bl33 fip/bl33.bin.enc
+                                  --output fip/u-boot.bin \
+                                  --bl2 fip/bl2.n.bin.sig \
+                                  --bl30 fip/bl30_new.bin.enc \
+                                  --bl31 fip/bl31.img.enc \
+                                  --bl33 fip/bl33.bin.enc
 
-then write the image to SD with:
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
