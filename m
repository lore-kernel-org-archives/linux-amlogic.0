Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E229AC636D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+CoaXG5ujXGjiMBnaHHjSz/nj2RyXUMRuMxS+olrfs=; b=BFbJktQxLc4eFj
	gk4Vt7ZyaHVe4Yhqm/0lBwERXqqw1inDJ0wsfInfYXIm4VALp1lIrIUFFy3xv10zI5dihGjqieJvY
	AM4PidGE0+yIFqaa0ACZRg1wo/MXq/ELLGiRdS8rjqtKbJ1N0X6gOotzdZu79wVPVDmiSmqRatRfC
	V1UdreNp2C6QCbkSo6SzldIkhtGHZlEzS+ee3eKRnBgAKh4uQdXXAgPNLbE4mew4c6aOu1hqBefhz
	l/Kdj8zumiYhDbxHwdG9pLA0WuYlFAJ3JkbHumCz+J6wMXLsmih/XVQEV6aGOwd/lmW6lzNlLUy2/
	yoXkYG1cQb/qWAKygubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNyu-0072zU-Uv; Wed, 15 Feb 2023 20:02:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNyb-0072sz-FM; Wed, 15 Feb 2023 20:02:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id co8so16590324wrb.1;
        Wed, 15 Feb 2023 12:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDuLc/Vv+/D54ip1urJ0aPwrswjREsdYP1joaEHODEM=;
        b=B9Puxk98hSEtzhZlGwqtYzI1yDF2qTvNsaxBp9XUic1dHe84Ef24Ggi+Mgd9Ecz2Dk
         taLgTtcMuL8tjSEuTxyWesjna9AJ6RMZkbHdpKfHQqOctwjLrXNK3I3PFiJZuD+OQmLe
         +9uPIV+mLgpdFyeyQXI3k6I8ZhN1qQJd9DQksKxiCkUd/fePBokheFLpuU+CBldP3BjA
         kwq4yEXFBSr8s1CoJe0OT3U6CjgLtEFgKkBNLBWfdD7lWOHncdQMAlMuwBvqv7lNAcvt
         BVug7M6w2V0ohQlVzwE67MLq0tBYSRbqDDAqYkEKETu+zn/nG8n0Xr71yULZHZS/M0RD
         DfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TDuLc/Vv+/D54ip1urJ0aPwrswjREsdYP1joaEHODEM=;
        b=wQc0r6i7oBYUEEgXHfOP8AwKPC+6VhXMsScbx0T/HMUtAdH6PbODNQhjumaOBxtg0l
         7RfAx7HYcwn0Y9s3ifdjX7jrkcxpNWt1X4MZhFCRO/d5kII6kH2tQ72rYkK4ZFBb8q/r
         vNypfr94y5aNmwetOECUznEwqYT/WZOWDDKHioev+P6BHnDyn5+b7tAz35rPGeNmujtm
         ACtBYXjEDH3EFYixcXaykuCst6Etj2Udr7d6Yw+YbOSy+GItnOvKrg1gckrFNkxwNkqa
         NYe9+Qku5exmA5oBBsn8mw68zCj123TliS6JOdBP4diWOBVRWnxOu/Z5QkYFUAgpLOlh
         ii8A==
X-Gm-Message-State: AO0yUKXZsQvKsFcAuXFWTpSIxz6zCUNafzRWdW1M7dT5eVzs6K/b/x9c
	Ef46VGzIgpnuUYA793+MpmY=
X-Google-Smtp-Source: AK7set8YP4kJK2NB9GcOPW6s0+dzQgPDiAyIHo4G+LHzZ+aZV0Wx855kYSEisgkfKCEOyG90bBFqhA==
X-Received: by 2002:a5d:574a:0:b0:2c5:582b:bad1 with SMTP id q10-20020a5d574a000000b002c5582bbad1mr2852064wrw.30.1676491316020;
        Wed, 15 Feb 2023 12:01:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:ccee:9a0d:2992:c73? (dynamic-2a01-0c23-b9d5-9700-ccee-9a0d-2992-0c73.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:ccee:9a0d:2992:c73])
        by smtp.googlemail.com with ESMTPSA id f8-20020a0560001b0800b002c577e2fc87sm143815wrz.15.2023.02.15.12.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:01:55 -0800 (PST)
Message-ID: <70e5520f-e327-111d-9ea4-824460e41561@gmail.com>
Date: Wed, 15 Feb 2023 21:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: constify member data of struct meson_host
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_120201_553644_E956D8BB 
X-CRM114-Status: GOOD (  10.55  )
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

Constify member data of struct meson_host. This also allows to remove
the cast as of_device_get_match_data() returns a const void *.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6ed95c555..641ea4292 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -150,7 +150,7 @@ struct sd_emmc_desc {
 
 struct meson_host {
 	struct	device		*dev;
-	struct	meson_mmc_data *data;
+	const struct meson_mmc_data *data;
 	struct	mmc_host	*mmc;
 	struct	mmc_command	*cmd;
 
@@ -1195,8 +1195,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (mmc->caps & MMC_CAP_SDIO_IRQ)
 		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
 
-	host->data = (struct meson_mmc_data *)
-		of_device_get_match_data(&pdev->dev);
+	host->data = of_device_get_match_data(&pdev->dev);
 	if (!host->data)
 		return -EINVAL;
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
