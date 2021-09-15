Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538E8C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE8E61211
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE8E61211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKlJ3sNZamo3/qs0aJp7x3SHi5sxTzfAThc3RoKQ0XY=; b=sdBsrEK6NkiCS9
	4X13xQ8BMraD1jToyxDqbKnP+adsKLvqeIXT0rbU+UVPpA2EWp2JwXlNeqsEyi7veryvV4hJx+OBt
	JG2ImMhaEFnLB1JKFvetRvDwzCfl/LyJbLWiv104K7Rcvy37ZkYd33oII3FCxyvgahkDi7HbBp9n/
	/TccvhLcPshtPmVsFZ0ASHsu1zVOMwgUkn4OWRAGmeARZdrCk4bufJOkTD8E++0n2TPg1vJB3yDq0
	s1t6novrViQwV43FHw728lZRYysKvN22rPJ62sjZjmCIUJDe7F+yPyWjpDg2aJc5jv0InEKIHJBDk
	InahLSb4CB49/IS4BZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQK13-007qyo-TQ; Wed, 15 Sep 2021 01:47:13 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQK10-007qxI-EI
 for linux-amlogic@lists.infradead.org; Wed, 15 Sep 2021 01:47:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id jg16so2672730ejc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Sep 2021 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zghrQGWLiqk11Frcn9gEYCNRCjRmbvWdIA9mpauKpAc=;
 b=lnLZrYOL5HpkyMPqWxuR3EKQ6ZCO/wTEPtrQ99lTw3UM6i3zSNrutTmQ9yZIUPzn9I
 C6X26G/Koua4U5/ZGOXKtomu1dip/wEjcwNgdqwUacMzvzZwWIsF673YdXztm0ro/Y/M
 ibozMuWTnMLL9A3wqef5hTGZSueZBe9flTvBt4ncp4Q40wzUd3LMj+zEXACStRDUXeSB
 5fphNPjpvebdaiSBz0aELufiIJguca4hGOPeMX/SyskkoMgRxnelP4SsLpc0Iw9WtDG1
 HZMb9iYUaPLNk3YGgfKK+DjuYAA9eTog9EtzQoa/0+qddbkdGA0twauxUdHm3HbOxt4f
 EJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zghrQGWLiqk11Frcn9gEYCNRCjRmbvWdIA9mpauKpAc=;
 b=yVhuhy/mFKFRX7d34/1JHU6Zquzb8Gja1AIS0pVCG8JZ7/VxBERqRR7gPuGNZp+jx4
 XdG0Lf9wfeUNwqb7lJrmW34+6h7F5YZIcGBSWcroZPocjTsPwEevJGKMFjhvAu8ZI76H
 +/DThrvghm44PZbQnIT/uW/+39eA3J34HMxgYCfgvrZKUvo/xrKIthGz2m6nsK82mgiy
 S3YWlvSFb878HygeE7Q7VF2aJp7nXGaPcJgT8+ZoemPDwVflbrRdAjcnHIo+btbqdpu3
 E0bjcQh5W/XXL+KQ18iakJEWZBle8Oe1Ap8IFpVFTGiLYjbV0Nuz71Fq7E1WPV8Mqpw6
 z3Ow==
X-Gm-Message-State: AOAM530sAIu/k5HpgWxrokhD46BhSFqHXvNgif4iWcbhDLnnj37CX/zx
 ROe5Q9T2o9nrLrXLCxuIuR9aLKfG3U0=
X-Google-Smtp-Source: ABdhPJzdGXQPPsXjDr/hYyiCPg1x5FerKSUq3ITs+Uo13ma993dwHkxFJntOP5umKJcOm07xUdg/+A==
X-Received: by 2002:a17:906:1451:: with SMTP id
 q17mr21842064ejc.214.1631670429044; 
 Tue, 14 Sep 2021 18:47:09 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a15sm6601835edr.2.2021.09.14.18.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 18:47:08 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 4/4] doc: boards: amlogic: update for Radxa Zero
Date: Wed, 15 Sep 2021 01:46:59 +0000
Message-Id: <20210915014659.5336-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915014659.5336-1-christianshewitt@gmail.com>
References: <20210915014659.5336-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_184710_531390_7D8C89DD 
X-CRM114-Status: GOOD (  15.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation bits for the Radxa Zero

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/index.rst      |  3 +-
 doc/board/amlogic/radxa-zero.rst | 74 ++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 doc/board/amlogic/radxa-zero.rst

diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index 2913ab281a..e2ab600f7f 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -17,7 +17,7 @@ This matrix concerns the actual source code version.
 +===============================+===========+=================+==============+============+============+=============+==============+
 | Boards                       	| Odroid-C2 | P212            | Khadas VIM2  | S400       | U200       | Odroid-N2   | SEI610       |
 |        			| Nanopi-K2 | Khadas-VIM      | Libretech-PC |	          | SEI510     | Khadas-VIM3 | Khadas-VIM3L |
-|        			| P200	    | LibreTech-CC v1 |	WeTek Core2  |	          |            | GT-King/Pro | Odroid-C4    |
+|        			| P200	    | LibreTech-CC v1 |	WeTek Core2  |	          | Radxa Zero | GT-King/Pro | Odroid-C4    |
 |        			| P201	    | LibreTech-AC v2 |	             |	          |            | GSKing-X    | Odroid-HC4   |
 |                               |           |                 |              |            |            |             | BananaPi-M5  |
 +-------------------------------+-----------+-----------------+--------------+------------+------------+-------------+--------------+
@@ -96,6 +96,7 @@ Board Documentation
    p201
    p212
    q200
+   radxa-zero
    s400
    sei510
    sei610
diff --git a/doc/board/amlogic/radxa-zero.rst b/doc/board/amlogic/radxa-zero.rst
new file mode 100644
index 0000000000..423403f3c7
--- /dev/null
+++ b/doc/board/amlogic/radxa-zero.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+U-Boot for Radxa Zero
+=====================
+
+Radxa Zero is a small form factor SBC based on the Amlogic S905Y2
+chipset that ships in a number of RAM/eMMC configurations:
+
+Boards with 512MB/1GB LPDDR4 RAM have no eMMC storage and BCM43436
+wireless (2.4GHz b/g/n) while 2GB/4GB boards have 8/16/32/64/128GB
+eMMC storage and BCM4345 wireless (2.4/5GHz a/b/g/n/ac).
+
+- Amlogic S905Y2 quad-core Cortex-A53
+- Mali G31-MP2 GPU
+- HDMI 2.1 output (micro)
+- 1x USB 2.0 port - Type C (OTG)
+- 1x USB 3.0 port - Type C (Host)
+- 1x micro SD Card slot
+- 40 Pin GPIO header
+
+Schematics are available on the manufacturer website:
+
+https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SCH_20210309.pdf
+
+U-Boot compilation
+------------------
+
+.. code-block:: bash
+
+    $ export CROSS_COMPILE=aarch64-none-elf-
+    $ make radxa-zero_defconfig
+    $ make
+
+Image creation
+--------------
+
+Amlogic does not provide sources for the firmware and for tools needed
+to create the bootloader image, so it is necessary to obtain them from
+git trees published by the board vendor:
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
+    $ make radxa-zero_defconfig
+    $ make
+
+    $ cp u-boot.bin ../fip/radxa-zero/bl33.bin
+    $ cd ../fip/radxa-zero
+    $ make
+
+This will generate:
+
+.. code-block:: bash
+
+    $ u-boot.bin u-boot.bin.sd.bin u-boot.bin.usb.bl2 u-boot.bin.usb.tpl
+
+Then write the image to SD with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/your_sd_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
