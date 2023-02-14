Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A917C61DA4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0SvD9ZvGTk27B9UP2RboGUVG7jJ+VivxUuRspwUDYY=; b=pIhmXf+WUTXq7U
	MWJvUhxbLb/CcE7jsdZRuCb70MeX3bjNynwYbiSX88tbzv4HVlE5/cAkQ0nnE/jZ9ZaaMnUsNgL4+
	1GUviOGpah8XrbFuO8QbZw/3OnumFegh8htxX8OXzTgTlVXUGNaw5y7FYY0sQY24SFveYolagmXqO
	z2aagyPfvZZooYFKCZKJPQc/sSb1DmguHrYbUiwSYXbUanm45unxdY+DP4ZPrl1a+KVqayDtdiZFJ
	vKG1iqc9+SJWnVXpF78dUpOSEb5ZW2ww2Zc0wiBA2i9mVu6Xuvfa2HWb0riR+Cx8mJTy80T2v1aUb
	fkwnNu2P95JjrAmxL6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS36i-003eeC-C8; Tue, 14 Feb 2023 21:45:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS360-003eNs-TG; Tue, 14 Feb 2023 21:44:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k16so11946980ejv.10;
        Tue, 14 Feb 2023 13:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BIfz99riEO+C0c4evMHPspzVHbaE2cc0ey+M44tW6k=;
        b=pSoLA/FHrOhJh6EPr92JseA5V/Jc+lfvCdTbkaQQ2inTHx7KHtOkqlVTUYNQVnRqF3
         0tGS08tpOdKONsn+GZ05zOujHC0Di2IJ//kO7dIJ0ltgQ0WQF+Tlt5/jXn4ZaSLWBYcL
         tpw6kQxcMcvx9dOpIz7w/mAdrFds7v+Yjs0QMaEQw9FsA2m+0T2rkUZok4YPWG+nqX+G
         6UeqSqMg5DBArfueJ0Fh9aukoXRfHTSFbKKZarGv+xiJDwWWOiYRtjNihO3dmLqMEkp3
         gvS72fqASMYhqU0yPcIQ9/jBbqX00FSggC+w6JOb3rn+7tjuRnsAwLTT4TMZyFQraS5L
         cnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BIfz99riEO+C0c4evMHPspzVHbaE2cc0ey+M44tW6k=;
        b=HN60wOw8K/Wfovd6ERQBRDun+9aydsAabGpzFiJoAM+/6lPuIZ/CNCFjY+s7tNLOct
         9rKfAlPIDH+TpWSMdBmQbSGeY96H9E4DNnqpHRyvwmdKCb3EjsIzJNURa00QvPgNnIfR
         N2oO4Lo38D1cX0fb0lMl5RXpmMfE1akHJs6KM4Jx55N8YwTYFLOCeOX2T56ino2swBZm
         yGUN2v5HDtse7JgcPB462ssgVlvfc2Md1T9FuEz/8+GQfhPADLWJqfXjH/CZCuIYpynE
         TiDXtsOqPc4c9zaehx6d4lVTRStPuOS1CJby2NVd/VFgdRuos1iNkAu23MPZQVKZBUGG
         uxRw==
X-Gm-Message-State: AO0yUKVyKK5vLyvqPTNtjj24cBaST+ZZBSTetI3D480T48kGGHG/cdr0
	yb+RyeoblPlDAmwoZEf9FWI=
X-Google-Smtp-Source: AK7set+ItZXr1gbL0Bkw184xQW8mS3DVV4Kc6GhdErI/smY1OAbxoR/8UgxLWioNqlYnDeR9Dqm6zw==
X-Received: by 2002:a17:906:8699:b0:890:4731:d1bc with SMTP id g25-20020a170906869900b008904731d1bcmr4077934ejx.38.1676411053926;
        Tue, 14 Feb 2023 13:44:13 -0800 (PST)
Received: from ?IPV6:2a01:c22:7234:f800:b56b:f43d:948c:eede? (dynamic-2a01-0c22-7234-f800-b56b-f43d-948c-eede.c22.pool.telefonica.de. [2a01:c22:7234:f800:b56b:f43d:948c:eede])
        by smtp.googlemail.com with ESMTPSA id f20-20020a170906c09400b00872c0bccab2sm8715145ejz.35.2023.02.14.13.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 13:44:13 -0800 (PST)
Message-ID: <5777f38b-465f-ce48-a87f-5eb8b3c57b0a@gmail.com>
Date: Tue, 14 Feb 2023 22:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v2 1/3] mmc: core: support setting card detect interrupt from
 drivers
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
In-Reply-To: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_134417_021551_4AC9C3BE 
X-CRM114-Status: GOOD (  18.02  )
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

On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
due to the design of gpio / interrupt controller. Therefore provide an
option for drivers to pass the card detect interrupt number
(retrieved e.g. from device tree) to mmc core.

Suggested-by refers to the mechanism to pass and store the interrupt.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- use another mechanism for passing and storing the cd interrupt
---
 drivers/mmc/core/slot-gpio.c  | 17 ++++++++++++++++-
 include/linux/mmc/slot-gpio.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index dd2a4b6ab..2a2d949a9 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -23,6 +23,7 @@ struct mmc_gpio {
 	char *ro_label;
 	char *cd_label;
 	u32 cd_debounce_delay_ms;
+	int cd_irq;
 };
 
 static irqreturn_t mmc_gpio_cd_irqt(int irq, void *dev_id)
@@ -53,12 +54,24 @@ int mmc_gpio_alloc(struct mmc_host *host)
 	ctx->ro_label = devm_kasprintf(host->parent, GFP_KERNEL, "%s ro", devname);
 	if (!ctx->ro_label)
 		return -ENOMEM;
+	ctx->cd_irq = -EINVAL;
 	host->slot.handler_priv = ctx;
 	host->slot.cd_irq = -EINVAL;
 
 	return 0;
 }
 
+void mmc_gpio_set_cd_irq(struct mmc_host *host, int irq)
+{
+	struct mmc_gpio *ctx = host->slot.handler_priv;
+
+	if (!ctx || irq < 0)
+		return;
+
+	ctx->cd_irq = irq;
+}
+EXPORT_SYMBOL(mmc_gpio_set_cd_irq);
+
 int mmc_gpio_get_ro(struct mmc_host *host)
 {
 	struct mmc_gpio *ctx = host->slot.handler_priv;
@@ -98,7 +111,9 @@ void mmc_gpiod_request_cd_irq(struct mmc_host *host)
 	 * Do not use IRQ if the platform prefers to poll, e.g., because that
 	 * IRQ number is already used by another unit and cannot be shared.
 	 */
-	if (!(host->caps & MMC_CAP_NEEDS_POLL))
+	if (ctx->cd_irq >= 0)
+		irq = ctx->cd_irq;
+	else if (!(host->caps & MMC_CAP_NEEDS_POLL))
 		irq = gpiod_to_irq(ctx->cd_gpio);
 
 	if (irq >= 0) {
diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
index 4ae2f2908..5d3d15e97 100644
--- a/include/linux/mmc/slot-gpio.h
+++ b/include/linux/mmc/slot-gpio.h
@@ -15,6 +15,7 @@ struct mmc_host;
 
 int mmc_gpio_get_ro(struct mmc_host *host);
 int mmc_gpio_get_cd(struct mmc_host *host);
+void mmc_gpio_set_cd_irq(struct mmc_host *host, int irq);
 int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
 			 unsigned int debounce);
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
