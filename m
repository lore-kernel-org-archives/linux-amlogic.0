Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B7C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbOE/885c1qra67vu9i49exZuN6N1E3eiR8FNU2Pjng=; b=Z6jwH8JT7xw/Iu
	CvXFo7Sle1CkTJGzIvy6BmakZkoFZdJhx4CaJ3tsdPQaZp4oTGqxRxrTqEQaNlCpYLVww1r073G43
	lzB6yTbFi5B5EU44DWpXTJ/8EjSohOVXkKvQJ8N/3WA99skhtru/p8+rUeBZH0rzEwU20Zhv96zVd
	0B1N/qa/5LmA2Bc+jjusMz7zqQy/R5Fd/ybL1eLH8PeR8n8UfVfTsLroQ5RykYgyRghgHxYXigFUj
	ZajYKRtaqGVTdu4RsvMfPavwMl6+Jnd/8TmuAAjYMXvR0esVRe1b2reeB0kZaX6GOVHCi4l0+mJf/
	c6OUpEw63djtkOQyh3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7b-00928V-20;
	Mon, 20 Mar 2023 13:00:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyN-008rqP-2L
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so10028815wrm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCUlzkd+ZiUVoODVUj+CDP7kcBJvcDYrO0Lw0y8ZFBw=;
        b=k7ltuPeuVkrAen+lIpq9si4Pj3SgyStetVbU0fJ6sFbf5kGvyjEqI7cAzCtXTAKpdb
         YE6s7rtq1EV5LZf2wzrcKJFhjXY/mJBjfpsCQwnwnylgoJjx7RKKB0Y3D9H/4AaymKIx
         jTk2S4FbC8H+UF0CfSpw06mbaAmb2ig3WnNUJA//8CM+TuIcFdcuNQul2RRsts/d4KJF
         /SqmnSbyrsWxFfzrGWtI61W8JfjAtZW5Pa1mZAVPyGoCW8mDUbJhtL9CoBhnvQWGp8Ms
         Uxbr/qARsA4gnMneMpVgRhclQN+UgcaCg2eyj44GVCS/cOFNF1MgeGEivujzw4YRcezy
         o6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCUlzkd+ZiUVoODVUj+CDP7kcBJvcDYrO0Lw0y8ZFBw=;
        b=KAO/7iV3y89dNy3YNEq4wjLxHjnIbME9NAg0B42jPRmZDsRi4b4mwY/CYKj6gyrsRE
         WGR7Sc4oWbkbKjxs7+EsiBQiS2eGjJO6yoD8oLohF8OfVT6OnbuMHjkOPxx0JNOpk078
         hUNExrjGOFWnPjLE4yfcdRg/tfw4bRTsvi7OGN3osTacJyjZ6hhWiYionI2Sjwlfgaus
         RjWypjTCr6/PIxIP5F9JmAbq001ssSBUQ5toqnHmcpy/jOF0JS6uvhUMSfFisv37kAwd
         Isq82kEKWJatHw6hCoJsMn4k1wq1eVmb2jkP9yiQGLQJBPZaYxbZEgcD/qqDvuf52pcs
         krFg==
X-Gm-Message-State: AO0yUKXDoXg6RwKYTd7PwqPBaIolXitzlGcLROmJXqvILktlXpRd1Xdf
	rGorFrbmtT6hB423GN/PuhM=
X-Google-Smtp-Source: AK7set+cu8/Sooexo1ycGHzJnbhIdwi1lW/fxCkwMOT2WzK3wIS42mkuYW4STAI8Bm8KEpuDJUP/3A==
X-Received: by 2002:adf:f947:0:b0:2d2:f3e3:115d with SMTP id q7-20020adff947000000b002d2f3e3115dmr9372020wrr.59.1679312803300;
        Mon, 20 Mar 2023 04:46:43 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 19/33] doc: boards: amlogic: update documentation for ODROID-N2L
Date: Mon, 20 Mar 2023 11:45:55 +0000
Message-Id: <20230320114609.930145-20-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044643_764003_BEBB2534 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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
 doc/board/amlogic/odroid-n2l.rst | 33 ++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/doc/board/amlogic/odroid-n2l.rst b/doc/board/amlogic/odroid-n2l.rst
index afd4409d1b..b264ace7f5 100644
--- a/doc/board/amlogic/odroid-n2l.rst
+++ b/doc/board/amlogic/odroid-n2l.rst
@@ -1,22 +1,23 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for ODROID-N2L
-=====================
+U-Boot for ODROID-N2L (S922X)
+=============================
 
-ODROID-N2L is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
+ODROID-N2L is a Single Board Computer manufactured by Hardkernel with the following
+specifications:
 
  - Amlogic S922X ARM Cortex-A53 dual-core + Cortex-A73 quad-core SoC
  - 4GB DDR4 SDRAM
  - HDMI 2.1 4K/60Hz display
  - 40-pin GPIO header
- - 1 x USB 3.0 Host, 1 x USB USB 2.0 Host
+ - 1x USB 3.0 Host
+ - 1x USB 2.0 Host
  - eMMC, microSD
  - MIPI DSI Port
 
-Schematics are available on the manufacturer website.
+Schematics are available on the manufacturer website: https://wiki.odroid.com
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -25,7 +26,19 @@ U-Boot compilation
     $ make odroid-n2l_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-For simplified usage, pleaser refer to :doc:`pre-generated-fip` with codename `odroid-n2l`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh odroid-n2l /path/to/u-boot/u-boot.bin my-output-dir
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
