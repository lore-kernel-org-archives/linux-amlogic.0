Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC826C61CE8
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jan 2019 17:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3FE2087E
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jan 2019 17:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2ngFZPT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3FE2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+95pEfs+rTF1xKr7pTVtpJLdfXIJqfrVZNYQyZlpH8=; b=L2ngFZPTUzv4ab
	sr2tWhfWJ7ZGiMl2eLpHTbdYUn+bInbgfycITLUbfiPbxhDkSKv4gPOKbGXgGZ+wyb2iO+lfIf9CK
	HI2DkXV8nqYo6f5KW1O0TNXJ6YQO0fxQuoBXZsjcnOUqUFAzxpgRqzn3R8GVMuzXGD7nv/DGT1jEe
	awUp27qGIHxgXrAmV1VPe/BC5UcEvTuLguRKT0UOoCFwizaqnpZ+TfAaxhs2lU14YpBvwmXGOHngB
	/922/PwPVxHQaqCccd8o2DKjvWjsi3/eoeo5dZtcl8Pq5mlx25IGp9WZt6FWpijBaHrlpAyEvGSeJ
	7dWY+N1Uu/4E6YEGdJEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gku1R-0001HK-Ge; Sat, 19 Jan 2019 17:03:05 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gku1G-00019J-OO; Sat, 19 Jan 2019 17:02:56 +0000
Received: from localhost.localdomain (10.18.11.217) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Sun, 20 Jan 2019
 01:03:30 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller driver
Date: Sun, 20 Jan 2019 01:02:35 +0800
Message-ID: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.217]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_090254_793755_F665CD76 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org,
 Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add entry for Amlogic NAND controller driver and its bindings[0].

[0] https://lore.kernel.org/lkml/1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com/

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abecc5..7d976a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9628,6 +9628,13 @@ F:	drivers/media/platform/meson/ao-cec.c
 F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
 T:	git git://linuxtv.org/media_tree.git
 
+MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
+M:	Liang Yang <liang.yang@amlogic.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/raw/meson_*
+F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+
 MICROBLAZE ARCHITECTURE
 M:	Michal Simek <monstr@monstr.eu>
 W:	http://www.monstr.eu/fdt/
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
