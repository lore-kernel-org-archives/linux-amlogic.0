Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF32C48BCF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 15:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04F961351
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 15:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04F961351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cKpki9ApvKYyb0kUmWTG+WI/3Hr6Got3bHsV03Seo64=; b=THO9yQ1vpD0gEW
	1hxqKnGD/xej/rOlNAhF2K/ErOjxp/Q2clAZ2Dz3DaaeVYkMl4GXLWvc2+egjWk1A8H6XwRpT8ce4
	k8B8fGLBI3FMHFN94BVfMMDQXs9Scsq5+rsc+Mpka1wjHkJTuyFVKx6IjdVxIrK98epeNyo26TfIm
	eCCEL+xiWCqpXa5laiZ4t/0D9EXCruRos1gUWig3DClxcQDwicPegErt3E1j5K+eeWh/esKaNfzA5
	H+GOIfmZmJwjwG5YDyc/NRQyi87Lak1cGZBr3XJ/SOwQONnp4JTIS9pky1NaFCCqfUfZOB85f+UFS
	8WjYrPRI1ByKa9JxgXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0Nc-00EfD3-Ax; Wed, 09 Jun 2021 15:44:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqz6L-00EHYt-Jq; Wed, 09 Jun 2021 14:22:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id l1so19615014pgm.1;
 Wed, 09 Jun 2021 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDoBgeXGas8ONL+4xxWqdRXTO15tMUsAgoTQmxOnpK0=;
 b=C0YmE5h9l9ASPpHuN75UQGqMrb/OkBhyKVSkSt9iH+5kg3uUX5e1Cw7X9VLWwEz4Tw
 usB7I6HJCFWW5ZjNXbaUbFnpEdx4MKnGeGmOCWp0C2w+FLqJaQ4xN/JZFvfGBeT/1XzL
 GWXXbwzkMJ6SrokwfkCGxR0XlvmXi2EX6h5d7IVJ2ZZZxmUHWl2tpY8cfHZomWhJNswm
 DiEILbXiDyOLl3xH6zJDsongoirPnn3mlPbL6UfqDJDal5BRwubys/xzQkkF5lSnZw2X
 XD9fDeLRaEAJdnRjkaX+8cGHl8wo4+BeqWO4wnVDaFP2v9sKHdh5td4WxWRwpz4BqM4T
 fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDoBgeXGas8ONL+4xxWqdRXTO15tMUsAgoTQmxOnpK0=;
 b=Qnaf1wSuGQZ9kN0SjavyiEg1KMx80dF3Qca9BPT5pog62bCAcxpGyaVLTYA0dHjSlj
 T9qhYevoXlXlKcLDv5WIq926Ld9R9riI2gODJsaTOJhOMszczDSnka4Yy32HoGpmDR3l
 AQ0chj+7dTJGgbU3rbQADhcchEfIqImx7As5CnOsZ+pqv50HSRn7Gz4SvPdhnN9fHEYL
 buHdZGTxSwetkhSKPAs6KMSnY05VfzL9YPQvtABXWY2wJ/rpc1nmnqzTigRuMpnq3EAl
 og2ou9tVDu2Qo4chKnC9nu/uaZqvLFT2RPm+rq+jTl+PCmWLJaXRb4lzUvFs1wkkCFgu
 2o8g==
X-Gm-Message-State: AOAM5313HcvQlBwGFmanz0EgT6g7Y1YlDoaSJvhBnvH3/wfWjxWq0KMq
 IR3rA3f2CBYregyyhhHNj7Y=
X-Google-Smtp-Source: ABdhPJwNfGVfozXjFPOmgigW9OaAlLh16hECyaYSxbmVCUR8PMj+EhBdPpirjL3Ntb0QGiy9Tbu6UQ==
X-Received: by 2002:a65:4608:: with SMTP id v8mr4088470pgq.435.1623248556065; 
 Wed, 09 Jun 2021 07:22:36 -0700 (PDT)
Received: from localhost.members.linode.com ([2400:8902::f03c:92ff:fe55:8c1e])
 by smtp.gmail.com with ESMTPSA id
 k21sm42920pgb.56.2021.06.09.07.22.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:22:35 -0700 (PDT)
From: zpershuai <zpershuai@gmail.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zpershuai <zpershuai@gmail.com>
Subject: [PATCH] =?UTF-8?q?Fix=20some=20wrong=20goto=20jumps=C2=A0for=20av?=
 =?UTF-8?q?oiding=20memory=20leak.?=
Date: Wed,  9 Jun 2021 22:22:18 +0800
Message-Id: <1623248538-4352-1-git-send-email-zpershuai@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_072237_710559_23941ED9 
X-CRM114-Status: GOOD (  10.96  )
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

In meson_spifc_probe function, when  enable the device pclk clock is
error, it should use clk_disable_unprepare to release the core clock.

And when meson_spicc_clk_init returns failed,  it should goto the
out_clk label.

Signed-off-by: zpershuai <zpershuai@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index ecba6b4..b2c4621 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -725,7 +725,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(spicc->pclk);
 	if (ret) {
 		dev_err(&pdev->dev, "pclk clock enable failed\n");
-		goto out_master;
+		goto out_core_clk;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -752,7 +752,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = meson_spicc_clk_init(spicc);
 	if (ret) {
 		dev_err(&pdev->dev, "clock registration failed\n");
-		goto out_master;
+		goto out_clk;
 	}
 
 	ret = devm_spi_register_master(&pdev->dev, master);
@@ -764,9 +764,11 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk:
-	clk_disable_unprepare(spicc->core);
 	clk_disable_unprepare(spicc->pclk);
 
+out_core_clk:
+	clk_disable_unprepare(spicc->core);
+
 out_master:
 	spi_master_put(master);
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
