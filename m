Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83471C4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 11:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C0F60FC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 11:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43C0F60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHAHXlRPB9TK82cHYifM8A9whaZCZidTBodat2ULHvY=; b=c94n5NxE3sqoEo
	ET9KQfwQicFvCcPMYyxriTkt2uxbotwdOOuvLNWWD0UCldyFJPkXUYiU3mKe3HDJT3mOQDFJ6pz+q
	67kGfHGSdvWIz0uCmeQKG4oZ2IHjnx+Lr9/Rnn5A4oUB/BZbqqR0TiK2ZzTyx/kS7LqN3vmPk112a
	Bx39xdU8pg3k8smnx8g8pr0Wk1wjREgAopyGxnpuEWaOJnkFShtpAKkrhhvZsbWoNe5jqjnFa8U5U
	kKCQVSs0ibv9dJ/fbnZzxH04aHSs1+Xg5AQ/Qw5HnuzkgRKU7/tTaGcfmmN8ctr0sd5do/aUjVJx2
	YUXSYwqB/32k3nsO1nXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBEeA-005pH4-PR; Wed, 04 Aug 2021 11:01:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBEe8-005pGU-D6
 for linux-amlogic@lists.infradead.org; Wed, 04 Aug 2021 11:01:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id l18so1749246wrv.5
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Aug 2021 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NMoqCHjbUkcqYPxqu+W3CXQFpc5u6rdd/YG1wZuv/Z4=;
 b=ir3ysTI/vUhwoXtBC1UkfCeNQHv0GN+iswcWfb1hkUwVw+XRed/PgFiIR2M8vzqS7I
 b3ZztfLcJdc4L3+KUqALBEI7oP41Kz1m88xvBe1UausluaLUva5FZ7WBDkAIiUcqVmf8
 d58vbUvDpe5U69tbxDzueHDZrT6XPpL3IUF/wQe+VKL+KS9Cb/jAyLv3NqIA1kJoypza
 pnjEsMPR+R7skyxrJ6ql9Tuo5NC6PN/GJAw7Bv3LQvKhxwv7HJfV7uBEn4VS7v5wljyC
 E3bVQwCnu/WSTd4LjTx0NH6z0J54gHukbwRJAETlW2Q16o7awPouhLQl3HNftpQ6JwXJ
 q3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NMoqCHjbUkcqYPxqu+W3CXQFpc5u6rdd/YG1wZuv/Z4=;
 b=ozoPBtZtTa0D0ruOEEvHgFwWjpauAZ4mQHePsXIoYfl9zDOqI2KzMuCNvg5VAT5XRo
 Ypzpmz9B5vUq5utDbLQpJvHEUrCTwiFUGDTnJn4I3Ulmw5YWbCrPv5Mx2edglg1uPdSe
 WOF5KqiGeGuD+65XInivXfU3AM2eEWxVzI37f79zYBOSmJYvW4xNOGsjuTsruGf15cZp
 XZIFMNAjM07L9yjtw4U6z1rUP87Jhas4Isb50AovRZODqqB4/5RRjS/j+9U4YSsbiZWS
 JNkRfzzJ24VTybCWMtlEh++inrt0qUHC0bYJRNF+6Caoheo1tGIyp3sJmCob+IvLP1lE
 gFQQ==
X-Gm-Message-State: AOAM5305a7Nrk//UDSONMM6g/hxKF4SoLgZw/nVohAGkNpWDsAajJFHo
 yemzmBOohvyUS/4HeSiHu3I=
X-Google-Smtp-Source: ABdhPJzjz5aCKDw4f6H3WMwtxBqcgAC0UHJD1Q6R6D6+8WMT1+EiI3+PPrfGF3ZjLUdqk0F487E+zQ==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr28561401wrq.131.1628074870249; 
 Wed, 04 Aug 2021 04:01:10 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h11sm5155324wmq.34.2021.08.04.04.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:01:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] board: amlogic: odroid-n2: fix fdtfile suffix for n2-plus
Date: Wed,  4 Aug 2021 11:01:07 +0000
Message-Id: <20210804110107.2127-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_040112_497286_4186E667 
X-CRM114-Status: GOOD (  12.17  )
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

The N2+ dtb is meson-g12b-odroid-n2-plus.dtb, not n2_plus, so
correct the suffix provided in the board file. Also align the
board ident string shown during boot to match.

Fixes: 8bc780106c13 ("board: amlogic: odroid: add runtime detection of the N2/N2+/C4/HC4 variants")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/odroid-n2/odroid-n2.c | 2 +-
 configs/odroid-n2_defconfig         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/amlogic/odroid-n2/odroid-n2.c b/board/amlogic/odroid-n2/odroid-n2.c
index 88a60f34fe..acfd107fc5 100644
--- a/board/amlogic/odroid-n2/odroid-n2.c
+++ b/board/amlogic/odroid-n2/odroid-n2.c
@@ -48,7 +48,7 @@ static struct meson_odroid_boards {
 	/* OdroidN2 rev 2019,2,7 */
 	{ MESON_SOC_ID_G12B, 330 * 4, 350 * 4, "n2" },
 	/* OdroidN2plus rev 2019,11,20 */
-	{ MESON_SOC_ID_G12B, 410 * 4, 430 * 4, "n2_plus" },
+	{ MESON_SOC_ID_G12B, 410 * 4, 430 * 4, "n2-plus" },
 	/* OdroidC4 rev 2020,01,29 */
 	{ MESON_SOC_ID_SM1,   80 * 4, 100 * 4, "c4" },
 	/* OdroidHC4 rev 2019,12,10 */
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index bac44b61ab..1f718a3154 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -9,7 +9,7 @@ CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-odroid-n2"
 CONFIG_MESON_G12A=y
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
-CONFIG_IDENT_STRING=" odroid-n2/n2_plus"
+CONFIG_IDENT_STRING=" odroid-n2/n2-plus"
 CONFIG_DEBUG_UART=y
 CONFIG_OF_BOARD_SETUP=y
 # CONFIG_DISPLAY_CPUINFO is not set
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
