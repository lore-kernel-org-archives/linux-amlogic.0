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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCE2C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE82A20652
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2STqbBI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmsu+hX/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE82A20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fVy5lLB8KD4Fe2qIVz4UblrNiP7n0paRXJcDXy0rJZo=; b=N2STqbBIuTM4LtDhnDGbYMvWMJ
	RuNxEi0v7Ooo628KdZunziAouKa+a/8JDKXI0/KNNXwmlAARV+tMyWRBNw1bhUMl1oFZk79dti9yX
	dUpMZnp1Xm2bSosMRBa6sTyPrsn7qT25EmKce7rl4xbZpAmB7G67dqckdze0l4i5lI66kTLgvmxJJ
	OCFY6aR0v8GCzU7xuU3MfzkFWGzmJJtgCiIzMLeWQCzoyHh1DiatEyG5TTlkdCFXOdlaFxscNBsv+
	o01AjwxIlUA6d+W4fZ6/0PfBvdKl6dmwWcloClHgDgOWD+acC267eS+G7ZfHj16i9X8beZoSMNVkQ
	5Q01m4pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemBY-0001ho-Pr; Tue, 10 Dec 2019 20:32:44 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemAr-0000ug-4Y; Tue, 10 Dec 2019 20:32:02 +0000
Received: by mail-pf1-x444.google.com with SMTP id n13so412219pff.1;
 Tue, 10 Dec 2019 12:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DeuPvEztiSd7kwjPtC2mIn2agkbYJRYt91C1Dr0gXE0=;
 b=rmsu+hX/vtvPaWJCq4ljOZUIP/cy9yN52b7v/ouD0Lh2irVI2MBDIZc4axiNpaklzQ
 tA4uM7Hz+jvc7llrhG/UZDyK2O4vTkMOHK9T9ozJVuIRkIWV6BXQW2iMJN0JYpihdN0A
 ee1mgMWjdlolzMH+VSdLEwHtep8kltmatJWWXItL6j0HaW4qSR3pdbd2mG64hiCRKR50
 UbSD1PcRFjjokwgE9nqeytHDcxtwWdPgmE48NLJ/eL0mvM5KAF8bYHGRyjU1CFU5NAao
 X9mp6hnQO3YF3o9T7rRrJTlUpDUYPUX1JvFF8IRJz80gwH7TfaBaI2tVJOkaSAke3u+7
 BD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DeuPvEztiSd7kwjPtC2mIn2agkbYJRYt91C1Dr0gXE0=;
 b=cabTn/tfcdsnI4lBcxG/RsZPz4YS8WBKa4h1QwnQsD61Yr++sY2cgyKo7k30PBXbEt
 poPcT6yl/6buKywBmAziQ6fKbrh8YvZVct3ykOq5y34XvG2JWTb0tf6CCs9owQWb+EkI
 kNi3vp7lhtdfNjWTVqCc8AG2c7Rw7aGdgyiZ88CQB+rS+yCZRetJ2EhWJWYByJCST20p
 0dn1+TMPL48Utv2lrW8HDjaxpX0BiiPjCCcHSPbcXOOffh8hQL8VNq9MrB/Iwwbd5zNI
 P6Pk0W8QDsmypYJGF5thzeAS8qR4DV02N42Zw6pyMa3gTmgwhwN4jTlJ7Sld42z2d7JX
 m1BA==
X-Gm-Message-State: APjAAAU5lFop5vnjRUuAApccear3UJ7878kJIUSb3yAX7Kmk/MVm+uWw
 vJLg4kt7xEnsvDv3WynIn4Q=
X-Google-Smtp-Source: APXvYqw7AoFbBg2zwdq2kcqlhEL98Zy/ORPpibsdgJWtVjsbOp7kvJtHC0tBmKZiEZAgIMFoZm00rg==
X-Received: by 2002:a63:c207:: with SMTP id b7mr26754619pgd.422.1576009920632; 
 Tue, 10 Dec 2019 12:32:00 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id gc1sm3621984pjb.20.2019.12.10.12.31.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 12:32:00 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org,
 srinivas.kandagatla@linaro.org, vz@mleia.com, khilman@baylibre.com,
 mripard@kernel.org, wens@csie.org, andriy.shevchenko@linux.intel.com,
 mchehab+samsung@kernel.org, mans@mansr.com, treding@nvidia.com,
 suzuki.poulose@arm.com, bgolaszewski@baylibre.com, tglx@linutronix.de
Subject: [PATCH 2/5] nvmem: lpc18xx_otp: convert to
 devm_platform_ioremap_resource
Date: Tue, 10 Dec 2019 20:31:47 +0000
Message-Id: <20191210203149.7115-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210203149.7115-1-tiny.windzz@gmail.com>
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_123201_222786_E1346ED4 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
 drivers/nvmem/lpc18xx_otp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/lpc18xx_otp.c b/drivers/nvmem/lpc18xx_otp.c
index 16c92ea85d49..8faed05e3cbe 100644
--- a/drivers/nvmem/lpc18xx_otp.c
+++ b/drivers/nvmem/lpc18xx_otp.c
@@ -68,14 +68,12 @@ static int lpc18xx_otp_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
 	struct lpc18xx_otp *otp;
-	struct resource *res;
 
 	otp = devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);
 	if (!otp)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	otp->base = devm_ioremap_resource(&pdev->dev, res);
+	otp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(otp->base))
 		return PTR_ERR(otp->base);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
