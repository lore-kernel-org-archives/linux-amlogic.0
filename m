Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658D7C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQd18kU+23cF/3sEBc8KTue8mPjn6ajOoBJ81Z10YKU=; b=Cl7BJrUeLCIC4u
	JffOcz/yd99lALxT5jXOsxW0vtduQYCKKhJVsHUDKeFSIODmDn8hFQwKVxkzChFH9sB1lu2ePOAnZ
	2lCAgSsS5C7ND0Z0UexYzEuNiZcsBJkllw5ORTtkRBZMAf8gNOq6NtP2S2n/oVtcVp3LQYuLtCRrj
	JcwlOSpMdQp32h/BNf/KSF/8yovYpZ22NY5rdHk4A0mNijcXvc2nPF97s3cof7vsBCvfCG0rcCdwE
	xkEhvAD2IEyEvaT0bSBGw2LuGU7/Osh6Mu2wD4bOL4s6Z/ALASXYK1E8L58YmE/6tftwQToQvLsyb
	P/6adUxltW4nBa+lD4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyA-008ruR-0f;
	Mon, 20 Mar 2023 11:46:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy6-008rqP-1M
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so10027846wrm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO4DLMa8pve8yBOZZSy2SbTPcwEaMc25HFl7WBtOZkQ=;
        b=fq03gNkl/3QMUef8M4c2UvAB1ZEaQwG//1Droz/0lHYyy8gHUfSBChvsdCDuy9nQk8
         s82VgqY3HzIY0IP+YIDR8UfgTCgQ3Wr+0jo6pF1t1E1vsInKCc7kjq2PcWdiJ90X5C1r
         40KVFwJziEL/4cYxhJpEMlzuDtF/6mI99uFB7kSESpG8m5oBqbVX+GmyrT/YYAswS+HK
         qu2NBPTVBUg0pYK8KJiWYNJcp7zy3lNr5CDQDhyvraGNET2scmQRs9wjElNNjC8S3o93
         /iD/vPhfB556OTlPcPOLdNQ2vCNsAzdeixMAUr3mU+4d+xRyRn8gfGh2Y7iow/YwGnDu
         lZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eO4DLMa8pve8yBOZZSy2SbTPcwEaMc25HFl7WBtOZkQ=;
        b=guWfmWcw6IFT7+C1kIemBRk4CvEwKRvXhyFHuYdCk+wlAZW7L9OaLLq/s+ffqNp23p
         vzy8+w6y+KGUzCLR/k12UwuS38OooLyiPL6OI8yq/qciF4RFR9fi5W7TqIkHhIhuP4Mz
         M9q+EvrTFv/Dqcfd5lBiA6oSD1b2i7I56+3mk7QRcfWgtQHCo0XIV5FEbMULGVuEgx89
         S4uoC8byJV5fvDcVh2TtfCjV4jfWDlBiHSF8SvtT1Kmif0qmWCoqFzuKafD2UoAK0u0R
         e8rXliy1yukGLB4F1I3XpOd9ZNR8QXGxMOyQ1V36WUyDvKKt6rIjY6czlCzqTe9gqIgC
         O44w==
X-Gm-Message-State: AO0yUKXVv4GW3kTqVghjsH6INwWDS1Su6h3rHIECe97NAgIX2gT3dN61
	CoY37g/nChGELhoI0Mf2dPw=
X-Google-Smtp-Source: AK7set98q8LF1h5KQ3DwBVzdWslbOnaNfjRV2G76E4naHpjKVCZMRDqhS5hGWDCo9wMqZzZQKxAIvA==
X-Received: by 2002:adf:e406:0:b0:2d6:405f:8b16 with SMTP id g6-20020adfe406000000b002d6405f8b16mr3936589wrm.66.1679312785232;
        Mon, 20 Mar 2023 04:46:25 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:24 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 08/33] doc: boards: amlogic: update documentation for Khadas VIM
Date: Mon, 20 Mar 2023 11:45:44 +0000
Message-Id: <20230320114609.930145-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044626_469154_933DFC09 
X-CRM114-Status: GOOD (  10.32  )
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
 doc/board/amlogic/khadas-vim.rst | 76 +++++++++++++++++---------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/doc/board/amlogic/khadas-vim.rst b/doc/board/amlogic/khadas-vim.rst
index 04025d737c..f1fbe1a8a6 100644
--- a/doc/board/amlogic/khadas-vim.rst
+++ b/doc/board/amlogic/khadas-vim.rst
@@ -1,24 +1,24 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Khadas VIM
-======================
+U-Boot for Khadas VIM (S905X)
+=============================
 
-Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Wesion
-Technology Co., Ltd with the following specifications:
+Khadas VIM is a Single Board Computer manufactured by Shenzhen Wesion Technology Co. Ltd
+with the following specifications:
 
  - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
+ - 8GB/16GB eMMC
  - 10/100 Ethernet
  - HDMI 2.0 4K/60Hz display
  - 40-pin GPIO header
  - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
- - 8GB/16GBeMMC
  - microSD
  - SDIO Wifi Module, Bluetooth
- - Two channels IR receiver
+ - Two channel IR receiver
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -27,14 +27,20 @@ U-Boot compilation
     $ make khadas-vim_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `khadas-vim`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh khadas-vim /path/to/u-boot/u-boot.bin my-output-dir
+
+U-Boot Manual Signing
+---------------------
 
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
+Amlogic does not provide sources for the firmware and tools needed to create a bootloader
+image so it is necessary to obtain binaries from sources published by the board vendor:
 
 .. code-block:: bash
 
@@ -64,40 +70,40 @@ Go back to mainline U-Boot source tree then :
     $ cp u-boot.bin fip/bl33.bin
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+              fip/bl30.bin \
+              fip/zero_tmp \
+              fip/bl30_zero.bin \
+              fip/bl301.bin \
+              fip/bl301_zero.bin \
+              fip/bl30_new.bin \
+              bl30
 
     $ python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
     $ $FIPDIR/blx_fix.sh \
-    	fip/bl2_acs.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/bl21.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+              fip/bl2_acs.bin \
+              fip/zero_tmp \
+              fip/bl2_zero.bin \
+              fip/bl21.bin \
+              fip/bl21_zero.bin \
+              fip/bl2_new.bin \
+              bl2
 
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
     $ $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
     $ $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc
+                                  --output fip/u-boot.bin \
+                                  --bl2 fip/bl2.n.bin.sig \
+                                  --bl30 fip/bl30_new.bin.enc \
+                                  --bl31 fip/bl31.img.enc \
+                                  --bl33 fip/bl33.bin.enc
 
-and then write the image to SD with:
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
