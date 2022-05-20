Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97435C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 May 2022 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fnXfh2y0KDuN2uZDVapK6rrnTsFRVCuyH6xagYc2tpQ=; b=aIOY/ydvewgfbR
	UrQR1jtbi44W5OVwmsKOgV1ShTf5p1MXeIHAwb+efuYkpz4vc6EfDIRKo3qkeJOsH/mrkyDfKINv5
	nVZQ4rMoNudTAgFFHLENNEp9cDL4uG0jINWwfZnOtWf41cvWJbYbvDufUYLn2Qiyg/Oe5/JIMvdEb
	l51ED+wVyvPGPoIYrVJb2q9+jlfBcCGG3nrsdlGqjKQRmfysihQNcxA7CpwAAlBdpGjzYGeLXdZ/e
	AGy3Y3tHvfwyWEKGktPp6AwgDRiwd+TbEyoJnDewthigeKUvzJfpruYOxwPBUfDlMwW4ixdiOBhHI
	tdwJk4nU+ge94gkR3zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns5hS-00DlnP-3o; Fri, 20 May 2022 16:42:02 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns5hG-00DlfO-6C
 for linux-amlogic@lists.infradead.org; Fri, 20 May 2022 16:41:52 +0000
Received: from pop-os.home ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id s5h8n8HpQgoLGs5h8nsi7u; Fri, 20 May 2022 18:41:44 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 20 May 2022 18:41:44 +0200
X-ME-IP: 86.243.180.246
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] mtd: rawnand: meson: Fix a potential double free issue
Date: Fri, 20 May 2022 18:41:40 +0200
Message-Id: <ec15c358b8063f7c50ff4cd628cf0d2e14e43f49.1653064877.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_094150_455214_FBCA9BF4 
X-CRM114-Status: UNSURE (   8.73  )
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

When meson_nfc_nand_chip_cleanup() is called, it will call:
	meson_nfc_free_buffer(&meson_chip->nand);
	nand_cleanup(&meson_chip->nand);

nand_cleanup() in turn will call nand_detach() which calls the
.detach_chip() which is here meson_nand_detach_chip().

meson_nand_detach_chip() already calls meson_nfc_free_buffer(), so we
could double free some memory.

Fix it by removing the unneeded explicit call to meson_nfc_free_buffer().

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative, so review with care.
---
 drivers/mtd/nand/raw/meson_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ac3be92872d0..032180183339 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1307,7 +1307,6 @@ static int meson_nfc_nand_chip_cleanup(struct meson_nfc *nfc)
 		if (ret)
 			return ret;
 
-		meson_nfc_free_buffer(&meson_chip->nand);
 		nand_cleanup(&meson_chip->nand);
 		list_del(&meson_chip->node);
 	}
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
