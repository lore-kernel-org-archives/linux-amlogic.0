Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37FDC636D3
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uhdQfg7A6MiE0ZIwIrgPWd65V8JKkHu2oMNjzNd23Pk=; b=rN9Gqud8bqRN1x
	2kZOV6LkNasW3Gjmhkfh+MLohTX09bZOn08o2CU2NMpwvdxsU3gCWOLs3hEOW+SeYKEhNzS7bttai
	PEhXMEy7eTDXow1qrMfqAZmxN1MAxsham87eNemRW0yaNpDAhQI5/YNX/iVHarFqKUEl+JtPIYPq9
	zqzqA8OosTNrZCQF5ejotKFpSJ1AfGpxQSRBlYO4L1vLTOXsJFbiDKCVlUg9Gqgqmry+AsW3qRPhp
	c51vGJK+nLB2vyaThUb2YGfMSkYyA8cp5lsaLxCk71vzO+nJtokSdVZwinv9ewsrJjLLe+enamdFL
	xO5WIZubfTnNBCRIc48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKJ3-00CQYt-UP; Sun, 12 Feb 2023 21:54:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKIq-00CQUo-R0; Sun, 12 Feb 2023 21:54:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id fj20so10612720edb.1;
        Sun, 12 Feb 2023 13:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Qha8qrOtRQul9zEnOYzqLrmbz40JcVU27T/LLl1YA0=;
        b=iShYEslGDEbVYb0FHuwGgh10PnxM3ep1oXkDU3iUWSTJoFKkfwE8bPISmrCp5Dwkie
         zZefRiroutaJe2CuAM92egUfFsRNW3EhtY44GmE6N3Z0cDVrVy2OsNreuJAs69Q1Ml4B
         Y2j3UAr1GT1cVvc6UjPL4jSqVRPtR/3jEOH/WiEVr39+xh0ZELoFc//5D4lk6ctLA5vg
         eiaNTA/2MZtOArR1W/s7+6lFrEEFa4qm5IKXm9WgMLjgRWPrrJXv0P2n9MAbgTd8fSvl
         R51MKcZEEgF5G69/vN3eOqtOO+n56HcrnEhKXCbzWl8St4M04cO84ZFuuo4e3ni1lVdu
         3OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Qha8qrOtRQul9zEnOYzqLrmbz40JcVU27T/LLl1YA0=;
        b=ihlOaB5G8bIgGNSng7TCa6lcY4kdPK/5BzjdTyvHCncWXErXKK6MFDrBbTNoYk5YNV
         0jPaF7CjVKmzTQXeA/OFx1DqmjIQxNCTGtORxuxKnZslCpm+eO9k+LCJb2neVuhnjqdk
         pXg8djVwYWta5fS8UptZkE9NNQAzi0PjkQ21IKQh48DLvcVnJnpf7oz9nlqjiRmR8cjn
         npe6hOLQ6bTSYXU5HsNlmGqDwnzQb7TL0G8TpjohP5JSFsLBPxYcOs5gEwhAB3IhbNGY
         gA0cb6e8qWRMpD/k1gkrKKkZO1xRypN46s+Wth+8Dpq2T1uz9sMtycfzhOWzyRnE9dWR
         eu0A==
X-Gm-Message-State: AO0yUKWp88eRmi9CEyL6GCGLkC1bxeM9LkLEPe235397tWPoBOkvS0wH
	C45DeZC/BY3x5cUSD33a9KQ=
X-Google-Smtp-Source: AK7set9gtN42qoq+WZ6BAwH02EDZ+b/8eUq1z6bXvcF2fuHg09Bt848oY1AZ2oavxyRqlxPKbNtsjA==
X-Received: by 2002:a50:d613:0:b0:4aa:a280:55b5 with SMTP id x19-20020a50d613000000b004aaa28055b5mr5452016edi.20.1676238870961;
        Sun, 12 Feb 2023 13:54:30 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id t23-20020a50ab57000000b004acbf1d8412sm1637291edc.1.2023.02.12.13.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 13:54:30 -0800 (PST)
Message-ID: <16502040-3beb-a3cc-b28d-28184fba0f10@gmail.com>
Date: Sun, 12 Feb 2023 22:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: remove meson_mmc_get_cd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_135433_184171_16DFD809 
X-CRM114-Status: GOOD (  10.24  )
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

MMC core only checks whether return value of .get_cd() equals zero.
Therefore -ENOSYS and 1 are effectively the same and the function
can be removed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6d5caf233..1d761f33d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1064,20 +1064,6 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/*
- * NOTE: we only need this until the GPIO/pinctrl driver can handle
- * interrupts.  For now, the MMC core will use this for polling.
- */
-static int meson_mmc_get_cd(struct mmc_host *mmc)
-{
-	int status = mmc_gpio_get_cd(mmc);
-
-	if (status == -ENOSYS)
-		return 1; /* assume present */
-
-	return status;
-}
-
 static void meson_mmc_cfg_init(struct meson_host *host)
 {
 	u32 cfg = 0;
@@ -1146,7 +1132,7 @@ static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
 static const struct mmc_host_ops meson_mmc_ops = {
 	.request	= meson_mmc_request,
 	.set_ios	= meson_mmc_set_ios,
-	.get_cd         = meson_mmc_get_cd,
+	.get_cd         = mmc_gpio_get_cd,
 	.pre_req	= meson_mmc_pre_req,
 	.post_req	= meson_mmc_post_req,
 	.execute_tuning = meson_mmc_resampling_tuning,
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
