Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99572C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFF220652
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTaTrQtu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZQzknzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFF220652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pt8crEHMFcWLZEV07O75/IoHhAU+V/IWPh0zqt4oqrw=; b=KTaTrQtu29TmmWNYHZRAbUXjzl
	eo006QwiJqBdRyjD4x4uVp5d+mjZJuV07WMHlinX3XidTFmePuI9Rn5wZumnErwBS+GZDlncDlYD4
	xMYzkgge6tX+lDH1V96EMz7bD5EsleRbvo0pfmmdJDysnyGvmo7EC8od5Q6JlItNbet3QtY01GYnB
	m8I2YH1+7KegzBexStxBRYUlVu2fh2deEy51nfEH0NjVBNZoiw75bxPxKR6L9ZQSB+uIbpQszz0L1
	HNIW1Dy62QztmAkNppwpF/OSZ8EbX1m3FTlw5hlXKE9k8NpTUy50lfaWIUWLahEMfI65sAx5bKsvw
	3yU4yhhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemBn-0001xy-Ew; Tue, 10 Dec 2019 20:32:59 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemAt-0000wO-DN; Tue, 10 Dec 2019 20:32:04 +0000
Received: by mail-pg1-x544.google.com with SMTP id r11so9450267pgf.1;
 Tue, 10 Dec 2019 12:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aJjh4TX7tIu5i+rCa4IwoPtzkcCu3DVe+AmQ4LsjGFE=;
 b=gZQzknzIqIApPvJCk1iRFQHzHlvudGFa4DkvphsH88qXsxvVZFHlomcdllkrTb27YN
 yUfG0AmPrk+30Tye1b5PugmQGyqJDdZqm3lInbKWgQX0ckY6j4kr0krsu9Sl+YtCGg/8
 Nl+mstS5YXfIlY74w+zEx6qGpzpz7tvHYtDiS5u0zk8wCbvCfswNmZzCnOAYUspw0DFb
 nOGUg6vMezl4ZafiDAMU8aAp8EhiyG/vR6ux/mAJbnxQ4Q/8lawY52cvRwL9tyuy6sHO
 EVDGTQC6kfmIBDfqJbS2sL1+9nuGYq+/3zmIy5OROU2Io97zdmX1ImU/BeTwYp5FZRtK
 RSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aJjh4TX7tIu5i+rCa4IwoPtzkcCu3DVe+AmQ4LsjGFE=;
 b=OoJ7In8v6IOqgksc+IrHIVadUdDq4vu/2OLTb6FdBkPagPbSh0+Gy1BkYT5OBI89N1
 ab0Nwj6ilzyCDs5JUVMlJEqHfPSwgCoHTYYBVDD7z2PIJ+fMnmKmd3h2Ie+gVmFfYQvY
 SkdobELFtULZhy7RTJeKoI6WtckUH3h6pH8f8a/Ob6t5N4AOkXwQ/IKj/krfmuHx1xL4
 lM4bUpCwWR09NoliEIcBiYpiL1qPkFpWZNGbvrzjbqEs6aCbqzkwaz64sDtDsJ+hBBp0
 XEJUo4s5D1OHKy+ZDQsYpfs+C6aYTuGsIs36ccvaA9Q6UCjymfM27uaRr6RJUeWP9OAo
 RvEg==
X-Gm-Message-State: APjAAAWt9kkwljc97+Px2ApEc31v+s8z8OViSX3PIt9b9PAxrFHkxS9q
 9BGEQLjsMb3luAgrF8xWhH4=
X-Google-Smtp-Source: APXvYqy9wb5VG/J8/gfbuJhrl2x731RJNVx5EKN7oDXSF1O1sSK9iEaSoweWjC42n/RNrAITMDlheg==
X-Received: by 2002:a63:4d1b:: with SMTP id a27mr17289782pgb.352.1576009922481; 
 Tue, 10 Dec 2019 12:32:02 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id w6sm4839677pfq.99.2019.12.10.12.32.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 12:32:01 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org,
 srinivas.kandagatla@linaro.org, vz@mleia.com, khilman@baylibre.com,
 mripard@kernel.org, wens@csie.org, andriy.shevchenko@linux.intel.com,
 mchehab+samsung@kernel.org, mans@mansr.com, treding@nvidia.com,
 suzuki.poulose@arm.com, bgolaszewski@baylibre.com, tglx@linutronix.de
Subject: [PATCH 3/5] nvmem: meson-mx-efuse: convert to
 devm_platform_ioremap_resource
Date: Tue, 10 Dec 2019 20:31:48 +0000
Message-Id: <20191210203149.7115-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210203149.7115-1-tiny.windzz@gmail.com>
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_123203_473905_72DBB297 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/nvmem/meson-mx-efuse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 07c9f38c1c60..24c6e8b15987 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -194,7 +194,6 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 {
 	const struct meson_mx_efuse_platform_data *drvdata;
 	struct meson_mx_efuse *efuse;
-	struct resource *res;
 
 	drvdata = of_device_get_match_data(&pdev->dev);
 	if (!drvdata)
@@ -204,8 +203,7 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 	if (!efuse)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	efuse->base = devm_ioremap_resource(&pdev->dev, res);
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(efuse->base))
 		return PTR_ERR(efuse->base);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
