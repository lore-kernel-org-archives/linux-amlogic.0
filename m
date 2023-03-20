Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8261AC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Y507Ow6M1afuD3NVI8NgcK9VnLZNkDD9fTaaZ6FhME=; b=Eoy6CzaZf6Esyr
	b1ZhaXmWgFNkelwsp/IMo7HsBhkZG2Q4zxR+/Zguco27BspF8WtajR1n5xqsj10lhldb3G/zZkIUi
	+0IuILEZbmoQJSlFdMx20v90xn/zv0X8EoZMeXrk1jx6SbfDQ+7QGMYSq7WZ0e5jYogxNJTVBeW37
	I0X/1AUaA+bOxQ1GcADDjBZNoL2EG72JAJG254Eref5W2JDWMqes/9r1TB/kkXjwv+MqiGyRHGfF+
	Tgy0PIC5sfs5SDKcw6vXn+9N9VV3UN5fPZ/bV6KzUQtD1T5QULi1/bQ6cZC0aYZRyqmEba9N45piF
	Hmtd2dFRqUCc80NwjisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy5-008rqj-2w;
	Mon, 20 Mar 2023 11:46:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy2-008rnC-32
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so10041966wrq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIelX5cDcYvZ2BR37oAOKw+1iFz4JqaD5QMst5RKypY=;
        b=csi7G6B4XNOqrJLgNY/qXrq4OJhKM37D1M8nJAtim+1Dvo12kebIqRDbpQ5tTxzHbt
         NwvT1pB5gIUmEojxd38is+SAetgOtDW/5yH82hwMxeLmfbwbaG5ugR43xtq28rU7vFAu
         7Dj/9WlpdTK0zXU/J2NHzBicmoGQB56qq1r0QPM7gqS3ZvKrW0LMgL1ZqZ91TZS51lSK
         ZvsRh0zSGxvIR1k6WsWx2D2rjjqgJLHUOaAU/Rg8DBfZZsqkTfB1DIZ8lFbAO5/IxEAe
         WUDuiBVSDLAaovprpGlNKXP8rqPgm47YVDDZ+PbJOKkyBdKFvlsVpOzF7mKx1jjusc0V
         tWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIelX5cDcYvZ2BR37oAOKw+1iFz4JqaD5QMst5RKypY=;
        b=cL5CcvSbssZV9Tldf1aTktgIML3F3iowqXJNvLhdtnLbH4qm60c5c8PX2yBQlb9JQM
         M9Gmjtfn9lqF1+5sXdN8sTZQFY7Q4OMS5j84OQtEW0AMbLwARO1NWTsikj0FtAQGiQm6
         LppjAziv8Lg6MczoDqGdZb/fUxmiwz/ZoO287LbLHCFj1IHkXFvqKmccDbwOAkmR+0M1
         wXwKJeiluGQl8tr5xY1PCpplFGh+7SnduZWW80Ih+nnsxw5mJymcCN2K3kRwpRO3jJM8
         UrzO0vezz99+ZlQ/2vlcBOz4uAhWqmJWPLYlT4QK4er366dLvDJDaY2eODwpqa/nQ3ag
         A+7A==
X-Gm-Message-State: AO0yUKWOXCUzLgusVlLYPbT6qHrmKJNBDVcYqmaL/vr/vvt9raZQLsDA
	X9rJP1lIPib6UltfucL1dCM=
X-Google-Smtp-Source: AK7set//RQvc4FWDU3FKp/4vjc+w491miWR48rdgjvoZ3MjlRziiN6o7IWSfHuxKW5n7x4A96wF+Lw==
X-Received: by 2002:a5d:4a4c:0:b0:2d0:cf21:a40e with SMTP id v12-20020a5d4a4c000000b002d0cf21a40emr13143208wrs.30.1679312780612;
        Mon, 20 Mar 2023 04:46:20 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:20 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 05/33] doc: boards: amlogic: update documentation for Beelink GT-King Pro
Date: Mon, 20 Mar 2023 11:45:41 +0000
Message-Id: <20230320114609.930145-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044622_976144_C8B3CAAC 
X-CRM114-Status: GOOD (  11.06  )
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
 doc/board/amlogic/beelink-gtkingpro.rst | 120 ++++++++++++------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/doc/board/amlogic/beelink-gtkingpro.rst b/doc/board/amlogic/beelink-gtkingpro.rst
index 07bb04bb36..541938b103 100644
--- a/doc/board/amlogic/beelink-gtkingpro.rst
+++ b/doc/board/amlogic/beelink-gtkingpro.rst
@@ -1,10 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for Beelink GT-King Pro
-==============================
+U-Boot for Beelink GT-King Pro (S922X)
+======================================
 
-The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
-board with an S922X-H chip.
+The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference board with
+an S922X-H chip and the following specifications:
 
 - 4GB LPDDR4 RAM
 - 64GB eMMC storage
@@ -19,10 +19,10 @@ board with an S922X-H chip.
 - 1x SD card slot
 - 1x Power on/off button
 
-Beelink do not provide public schematics, but have been willing
-to share them with known distro developers on request.
+Beelink do not provide public schematics, but have been willing to share them with known  
+distro developers to assist with development.
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -31,21 +31,21 @@ U-Boot compilation
     $ make beelink-gtkingpro_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-Amlogic does not provide sources for the firmware and for tools needed
-to create the bootloader image. Beelink have provided the Amlogic "SDK"
-in their forums, but the u-boot sources included result in 2GB RAM being
-detected. The following FIPs were generated with newer private sources
-and give correct (4GB) RAM detection:
-
-https://github.com/LibreELEC/amlogic-boot-fip/tree/master/beelink-s922x
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh beelink-s922x /path/to/u-boot/u-boot.bin my-output-dir
 
-NB: Beelink use a common board config for GT-King, GT-King Pro and the
-GS-King-X model, hence the "beelink-s922x" name.
+U-Boot Manual Signing
+---------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `beelink-s922x`
+Beelink released an Amlogic "SDK" dump in their forums, but the U-Boot sources included
+result in 2GB RAM detected. The following FIPs were generated with newer sources and
+detect 4GB RAM: https://github.com/LibreELEC/amlogic-boot-fip/tree/master/beelink-s922x
 
 .. code-block:: bash
 
@@ -62,57 +62,57 @@ Go back to the mainline U-Boot source tree then:
     $ cp u-boot.bin fip/bl33.bin
 
     $ sh fip/blx_fix.sh \
-    	fip/bl30.bin \
-    	fip/zero_tmp \
-    	fip/bl30_zero.bin \
-    	fip/bl301.bin \
-    	fip/bl301_zero.bin \
-    	fip/bl30_new.bin \
-    	bl30
+         fip/bl30.bin \
+         fip/zero_tmp \
+         fip/bl30_zero.bin \
+         fip/bl301.bin \
+         fip/bl301_zero.bin \
+         fip/bl30_new.bin \
+         bl30
 
     $ sh fip/blx_fix.sh \
-    	fip/bl2.bin \
-    	fip/zero_tmp \
-    	fip/bl2_zero.bin \
-    	fip/acs.bin \
-    	fip/bl21_zero.bin \
-    	fip/bl2_new.bin \
-    	bl2
+         fip/bl2.bin \
+         fip/zero_tmp \
+         fip/bl2_zero.bin \
+         fip/acs.bin \
+         fip/bl21_zero.bin \
+         fip/bl2_new.bin \
+         bl2
 
     $ fip/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
-    				--output fip/bl30_new.bin.g12a.enc \
-    				--level v3
+                           --output fip/bl30_new.bin.g12a.enc \
+                           --level v3
     $ fip/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
-    				--output fip/bl30_new.bin.enc \
-    				--level v3 --type bl30
+                           --output fip/bl30_new.bin.enc \
+                           --level v3 --type bl30
     $ fip/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
-    				--output fip/bl31.img.enc \
-    				--level v3 --type bl31
+                           --output fip/bl31.img.enc \
+                           --level v3 --type bl31
     $ fip/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
-    				--output fip/bl33.bin.enc \
-    				--level v3 --type bl33
+                           --output fip/bl33.bin.enc \
+                           --level v3 --type bl33
     $ fip/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
-    				--output fip/bl2.n.bin.sig
+                           --output fip/bl2.n.bin.sig
     $ fip/aml_encrypt_g12b --bootmk \
-    		--output fip/u-boot.bin \
-    		--bl2 fip/bl2.n.bin.sig \
-    		--bl30 fip/bl30_new.bin.enc \
-    		--bl31 fip/bl31.img.enc \
-    		--bl33 fip/bl33.bin.enc \
-    		--ddrfw1 fip/ddr4_1d.fw \
-    		--ddrfw2 fip/ddr4_2d.fw \
-    		--ddrfw3 fip/ddr3_1d.fw \
-    		--ddrfw4 fip/piei.fw \
-    		--ddrfw5 fip/lpddr4_1d.fw \
-    		--ddrfw6 fip/lpddr4_2d.fw \
-    		--ddrfw7 fip/diag_lpddr4.fw \
-    		--ddrfw8 fip/aml_ddr.fw \
-    		--level v3
-
-and then write the image to SD with:
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
