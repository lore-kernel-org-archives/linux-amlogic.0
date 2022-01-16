Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C3CC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 05:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s6SRB5AKSK9BCpOIUcbd99wZYjktbIrwFT+XjI38ZXs=; b=eT/cB40UaAdtQg
	1wfZJYtkWOs8SwE5FvWvwfxArhvfi9Hj0P5zQ+mFBO6L/c2oYqM2CZ0/eMuMlWwhr2Af2D7tQzBji
	VEZNnZCHAwi7nq6e01/TyrLYGq32oVxStOcTWegGjr9JUxHyqasYhjcFCs6on1W7VVlNotVOvUHKl
	VBRqnlchnEm62aC1TGEPgvFsP9zeLM3Vf2iyUov/XJIRSVL1Dkd4pBwIrQpO+H6NYDbOK31mKaS/s
	wzpoYP6K/7j+n0/lW8V6tc5tV8i2Bg36AhdguB8EO/Nc7xSOpsU/5TDGSpGBuKTIW2PFm9HhIicRp
	hmMCR8Bewkmkyke7cMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8yEf-00BvdU-4W; Sun, 16 Jan 2022 05:37:49 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8yES-00Bvcf-M3; Sun, 16 Jan 2022 05:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1642311449;
 bh=+2LM+SczSHz+FBaJcHC0eWw+7fFZDut/nzx8cE5g3Pk=;
 h=From:To:Cc:Subject:Date;
 b=UjZFP2U5G4Mu89cdBW3V+gluB87T9azYMghShMuwx1JrOZgi8uulMMsB31y28nQyP
 t0NhB5ASrX3JcQ67x5gAsXzGEpZup176tMuBoyMZ1t0Rv9fIOPJdDPN4UnPcN9pkJg
 aOUzcLwYt1xEt5m4qLtTwq5FN1NJz/EB8griWDrM=
Received: from localhost.localdomain ([43.227.138.48])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 95A2BC55; Sun, 16 Jan 2022 13:37:26 +0800
X-QQ-mid: xmsmtpt1642311446t2njfay55
Message-ID: <tencent_0F8E090AA07050A5857F1E9067E6B9DC0C07@qq.com>
X-QQ-XMAILINFO: M2QCdMyLnance75j6VAMOjid3HELJLkG+ubJAjKE+y0IN++DdWHdBUo2HQYWpq
 0VqaMvpWwH20Bq+IPHzje/7EdgUClL6em9eqXg2n+kRXNddGGIe8zmhhmG/X+5hS0Bdd04EXfb6L
 ZLjJ9lsB9ZsZ8qKiKO8iW+uHY/BfRsdy9GulwrUcDxWrzXyAaOwuGbsS5M7OXtOOmAk0kDCi6ita
 /M4t4EFRqgxLKPzUZ0beuIayLrOPF0iDH/5nTRz7XAc/FK8+25raUX5VEnAojqFKD14NlG1qJU8l
 eCD2q4gkzYQ1wEuoSC7VWiJNXpcTB5zfJ8dofyyHLWk4cKG6UrayPxnZAkyzHnr3QcVfH903xuj7
 4kOLs+8pOTWD6ZRiluXQTpHepEORMX8CVCxuFFO1AOFW0qQx70C0196nzVmkwnm3MNfECaNOLy1L
 aQjoxwmHBW2Z1PHrJxIS21R/jCpvPIxXXoewYitM29tnv0KGKF8oAVplMu6aG3ywKxdQzTL8+erK
 O2x8vGz7N11LWAf2wfyMnQnyMd0DedEGX2olzYHIvtyn6heIYAYlCNhPhCbwQtYR7koFu6MyZ+vY
 hhnf7T7vv0e7NeTqMbHN7nI89pMfbMeASoL+NHunqUsrYjYPJbsyvKpeQW9y2l1/BrN5CCy+GvRr
 S0VSML1r1K133nq+Z2j36zWQhmSoNWGSKJ9MKod3hIsmdCTp6VLQHBBErBheHt3Oo5qNpO9XFrrI
 JEH9G1rOmnlEEcqv9d3bUaoG0rz9FBdE1vupzKo0wh0C4VCfe8BbV69LtENCXcZmDKxuAS8YSHN3
 UbbMhe9XYvP5VynaJ89PL1p3VKqXH8K/NERnF/eGOSSnMwG1n6QUd6ltKumTHroWQCbQTm+KNLI3
 l4vFXqM7XpHXylRkTjVxGYjHa0mOXhRigOlCkRMiqJMCx8GDBDvTjHZk7kB/g7DQ==
From: xkernel.wang@foxmail.com
To: srinivas.kandagatla@linaro.org, narmstrong@baylibre.com,
 khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] nvmem: meson-mx-efuse: check the return value of
 devm_kstrdup()
Date: Sun, 16 Jan 2022 13:34:50 +0800
X-OQ-MSGID: <20220116053450.2440-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_213737_120533_C38C6644 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

devm_kstrdup() returns pointer to allocated string on success,
NULL on failure. So it is better to check the return value of it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/nvmem/meson-mx-efuse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 07c9f38..38e6a5f 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -211,6 +211,9 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 
 	efuse->config.name = devm_kstrdup(&pdev->dev, drvdata->name,
 					  GFP_KERNEL);
+	if (!efuse->config.name)
+		return -ENOMEM;
+
 	efuse->config.owner = THIS_MODULE;
 	efuse->config.dev = &pdev->dev;
 	efuse->config.priv = efuse;
-- 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
