Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF1FC4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E665233E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E665233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpvugezyQk2Fu88lOKQ0E5x2Zzo/ubEtwyhbZAtrIXQ=; b=SdmWWAdSNLy0ktJKEvblKmpwPL
	KNqL7/R6PN1G7Q4ont0PHTDmtYl2h5IPSsgZ5nHhQNkfTbMx9l5l05TcEBmAjXelIZdArffB/GnlN
	TRCck26GbbG5CRR6xBTBz8QYeC4Cj4PiWcBFnDGyTgDMjG4zM6ZC7SVT2S0lzL3fh9U/9YWgbNtII
	S/R+Cbnr23FxbfGOVQmXLT+8LiAVIBK3e83dC4MKIuzFxofjAH3nRDsP60nprfcaTHchmYkFaSTYa
	RS8S2Fmy2iDdXB/c3Xm89+pTxDinpiG3GS96eRuf7aTa3pBm6p4O0ES82xhCRSduqbapboEJqLVYM
	jFxc8png==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBOk-0007TF-7G; Fri, 18 Dec 2020 08:46:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBOh-0007Rg-BZ
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 08:46:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id y23so1683124wmi.1
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=thQ1R8dKB62JvkRRxk7WM2fZWynKL+qHRU9jjxKd5s4=;
 b=qzheN53i5WF0H2wqyWfIYMZUahcLOdohNusLC4uzVzcQli+OPxLF9AhG8B+1x9quZG
 JwQ+JAI4Z4F5D2OxrFA6XfVbMCUMmHD6dLIxLteAgHk9gahAC5efvICoAsgALu8K5zf/
 18CEVG7DOk6cCZiN+eg1HCw3tn0YCBjZv2rEvp0gCcLNueSzHhyOwtDDuLQ3N0NVyHI3
 u81MyMKQNooFTdN0x1pIWz4OcBcFzUFiKElZCl0a4w07CrhuAbVMGDNRRDvlUE254UHN
 FoyPpL1YOE7YO9qzUBeOJhHAXqqYt33hb9NA7dJSjjj4FZxXMGOwQC9DFVy1anFZ2uPT
 bmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=thQ1R8dKB62JvkRRxk7WM2fZWynKL+qHRU9jjxKd5s4=;
 b=NcwiFaFCup51ANgNGGFIWLl/xmsvZXYI6RJgp/K1KqgdASleL5O17W/ZwTV7ZHzBkw
 jz6Dept5+JUsq2zAdqY1+iW3g7Xa9dgkgc/PVSzvy2Z9W1ZEuEUucyGtojdUf8x3StOX
 MrVWGoSy0Rdteeuwt9KvpdfXP4J5kufeuLe89T2nUety4HjBhtDv/jjDOTzznX+tYZJa
 tthsxkW/et/23J25EFXXg2KP6xEyA1pExqnbLVMEYkBW5xG8u6++GYAt1coehEw5k/vL
 yoUXgzNRa9YZUegQ6Y/2M2DHarJWpS3v684gCE7aG1qrUuki7tdGsolMoNHY+MK/kJnP
 SnIA==
X-Gm-Message-State: AOAM531FYQa5GoXSm5wND3eEjztQZMXSI1KJB3ya5+pWr31GsGNUKldr
 E0f/Hd4/AXY04fl203b6od/FkzvzoAtfcQ==
X-Google-Smtp-Source: ABdhPJxFSqYQrn6OsLIDCyVOiEwf0ZmfnEcI9E695wMJj2EcGGKzcF05Yua8dRS0Ymu+nsuV9lKM4w==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr3146926wma.69.1608281157741;
 Fri, 18 Dec 2020 00:45:57 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o8sm12426767wrm.17.2020.12.18.00.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 00:45:57 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 5/5] boards: amlogic: update documentation for Beelink
 GT-King/Pro
Date: Fri, 18 Dec 2020 08:45:45 +0000
Message-Id: <20201218084545.29135-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218084545.29135-1-christianshewitt@gmail.com>
References: <20201218084545.29135-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_034559_475073_A088A7AE 
X-CRM114-Status: GOOD (  16.63  )
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
 doc/board/amlogic/beelink-gtking.rst    | 115 +++++++++++++++++++++++
 doc/board/amlogic/beelink-gtkingpro.rst | 116 ++++++++++++++++++++++++
 doc/board/amlogic/index.rst             |   4 +-
 3 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 doc/board/amlogic/beelink-gtking.rst
 create mode 100644 doc/board/amlogic/beelink-gtkingpro.rst

diff --git a/doc/board/amlogic/beelink-gtking.rst b/doc/board/amlogic/beelink-gtking.rst
new file mode 100644
index 0000000000..56ce2cb273
--- /dev/null
+++ b/doc/board/amlogic/beelink-gtking.rst
@@ -0,0 +1,115 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for Beelink GT-King
+==========================
+
+The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
+board with an S922X-H chip.
+
+- 4GB LPDDR4 RAM
+- 64GB eMMC storage
+- 10/100/1000 Base-T Ethernet
+- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
+- HDMI 2.1 video
+- S/PDIF optical output
+- Analogue audio output
+- 1x USB 2.0 port
+- 2x USB 3.0 ports
+- IR receiver
+- 1x micro SD card slot
+
+Beelink do not provide public schematics, but have been willing
+to share them with known distro developers on request.
+
+U-Boot compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make beelink-gtking_defconfig
+    $ make
+
+Image creation
+--------------
+
+Amlogic does not provide sources for the firmware and for tools needed
+to create the bootloader image. Beelink have provided the Amlogic "SDK"
+in their forums, but the u-boot sources included result in 2GB RAM being
+detected. The following FIPs were generated with newer private sources
+and give correct (4GB) RAM detection:
+
+https://github.com/LibreELEC/amlogic-boot-fip/tree/master/beelink-s922x
+
+NB: Beelink use a common board config for GT-King, GT-King Pro and the
+GS-King-X model, hence the "beelink-s922x" name.
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
+    	fip/bl30.bin \
+    	fip/zero_tmp \
+    	fip/bl30_zero.bin \
+    	fip/bl301.bin \
+    	fip/bl301_zero.bin \
+    	fip/bl30_new.bin \
+    	bl30
+
+    $ sh fip/blx_fix.sh \
+    	fip/bl2.bin \
+    	fip/zero_tmp \
+    	fip/bl2_zero.bin \
+    	fip/acs.bin \
+    	fip/bl21_zero.bin \
+    	fip/bl2_new.bin \
+    	bl2
+
+    $ fip/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
+    				--output fip/bl30_new.bin.g12a.enc \
+    				--level v3
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
+    				--output fip/bl30_new.bin.enc \
+    				--level v3 --type bl30
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
+    				--output fip/bl31.img.enc \
+    				--level v3 --type bl31
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
+    				--output fip/bl33.bin.enc \
+    				--level v3 --type bl33
+    $ fip/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
+    				--output fip/bl2.n.bin.sig
+    $ fip/aml_encrypt_g12b --bootmk \
+    		--output fip/u-boot.bin \
+    		--bl2 fip/bl2.n.bin.sig \
+    		--bl30 fip/bl30_new.bin.enc \
+    		--bl31 fip/bl31.img.enc \
+    		--bl33 fip/bl33.bin.enc \
+    		--ddrfw1 fip/ddr4_1d.fw \
+    		--ddrfw2 fip/ddr4_2d.fw \
+    		--ddrfw3 fip/ddr3_1d.fw \
+    		--ddrfw4 fip/piei.fw \
+    		--ddrfw5 fip/lpddr4_1d.fw \
+    		--ddrfw6 fip/lpddr4_2d.fw \
+    		--ddrfw7 fip/diag_lpddr4.fw \
+    		--ddrfw8 fip/aml_ddr.fw \
+    		--level v3
+
+and then write the image to SD with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/your_sd_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/doc/board/amlogic/beelink-gtkingpro.rst b/doc/board/amlogic/beelink-gtkingpro.rst
new file mode 100644
index 0000000000..d750351361
--- /dev/null
+++ b/doc/board/amlogic/beelink-gtkingpro.rst
@@ -0,0 +1,116 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for Beelink GT-King Pro
+==============================
+
+The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
+board with an S922X-H chip.
+
+- 4GB LPDDR4 RAM
+- 64GB eMMC storage
+- 10/100/1000 Base-T Ethernet
+- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
+- HDMI 2.1 video
+- Analogue audio output
+- 1x RS232 port
+- 2x USB 2.0 port
+- 2x USB 3.0 ports
+- IR receiver
+- 1x SD card slot
+- 1x Power on/off button
+
+Beelink do not provide public schematics, but have been willing
+to share them with known distro developers on request.
+
+U-Boot compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make beelink-gtkingpro_defconfig
+    $ make
+
+Image creation
+--------------
+
+Amlogic does not provide sources for the firmware and for tools needed
+to create the bootloader image. Beelink have provided the Amlogic "SDK"
+in their forums, but the u-boot sources included result in 2GB RAM being
+detected. The following FIPs were generated with newer private sources
+and give correct (4GB) RAM detection:
+
+https://github.com/LibreELEC/amlogic-boot-fip/tree/master/beelink-s922x
+
+NB: Beelink use a common board config for GT-King, GT-King Pro and the
+GS-King-X model, hence the "beelink-s922x" name.
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
+    	fip/bl30.bin \
+    	fip/zero_tmp \
+    	fip/bl30_zero.bin \
+    	fip/bl301.bin \
+    	fip/bl301_zero.bin \
+    	fip/bl30_new.bin \
+    	bl30
+
+    $ sh fip/blx_fix.sh \
+    	fip/bl2.bin \
+    	fip/zero_tmp \
+    	fip/bl2_zero.bin \
+    	fip/acs.bin \
+    	fip/bl21_zero.bin \
+    	fip/bl2_new.bin \
+    	bl2
+
+    $ fip/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
+    				--output fip/bl30_new.bin.g12a.enc \
+    				--level v3
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
+    				--output fip/bl30_new.bin.enc \
+    				--level v3 --type bl30
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
+    				--output fip/bl31.img.enc \
+    				--level v3 --type bl31
+    $ fip/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
+    				--output fip/bl33.bin.enc \
+    				--level v3 --type bl33
+    $ fip/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
+    				--output fip/bl2.n.bin.sig
+    $ fip/aml_encrypt_g12b --bootmk \
+    		--output fip/u-boot.bin \
+    		--bl2 fip/bl2.n.bin.sig \
+    		--bl30 fip/bl30_new.bin.enc \
+    		--bl31 fip/bl31.img.enc \
+    		--bl33 fip/bl33.bin.enc \
+    		--ddrfw1 fip/ddr4_1d.fw \
+    		--ddrfw2 fip/ddr4_2d.fw \
+    		--ddrfw3 fip/ddr3_1d.fw \
+    		--ddrfw4 fip/piei.fw \
+    		--ddrfw5 fip/lpddr4_1d.fw \
+    		--ddrfw6 fip/lpddr4_2d.fw \
+    		--ddrfw7 fip/diag_lpddr4.fw \
+    		--ddrfw8 fip/aml_ddr.fw \
+    		--level v3
+
+and then write the image to SD with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/your_sd_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index a585d857df..275c3664b7 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -17,7 +17,7 @@ This matrix concerns the actual source code version.
 +===============================+===========+=================+==============+============+============+=============+==============+
 | Boards                       	| Odroid-C2 | P212            | Khadas VIM2  | S400       | U200       | Odroid-N2   | SEI610       |
 |        			| Nanopi-K2 | Khadas-VIM      | Libretech-PC |	          | SEI510     | Khadas-VIM3 | Khadas-VIM3L |
-|        			| P200	    | LibreTech-CC v1 |	WeTek Core2  |	          |            |	     | Odroid-C4    |
+|        			| P200	    | LibreTech-CC v1 |	WeTek Core2  |	          |            | GT-King/Pro | Odroid-C4    |
 |        			| P201	    | LibreTech-AC v2 |	             |	          |            |             |              |
 +-------------------------------+-----------+-----------------+--------------+------------+------------+-------------+--------------+
 | UART                       	| **Yes**   | **Yes**         | **Yes**      | **Yes**    | **Yes**    | **Yes**     | **Yes**      |
@@ -77,6 +77,8 @@ Board Documentation
 .. toctree::
    :maxdepth: 1
 
+   beelink-gtking
+   beelink-gtkingpro
    khadas-vim2
    khadas-vim3l
    khadas-vim3
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
