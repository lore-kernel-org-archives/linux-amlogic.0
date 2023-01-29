Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC08C636D0
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 23:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puIlJSOizqKSYOLNzJhJsh18G3d68kckE6TQinhXl88=; b=hULAkwwu5e2oU+
	lRoEs3ie55cU6iTnKViLdxCoPf/Yksy+nlYLQdxLbT5rQ7PLSuETVozwjx3/O/3bZWmJTG76BSZsC
	CL3DYhh3BbLzCy7g5PpJ/rwijZr5vK8E7l3YTqbMfEtjJtZqei9HFog2GVLocdOZwyOHFaqxo2AQ4
	oO6KL+csiKanbAF1c2l3eSBkwFWnlNKgvjnB2bJ4eICsWP8nZhaX8VEli3Jx/R5fC25lNbIK+rnC7
	JauULNNbztHCRwm06xVqWNMzZ6sFSwiwDSo/a3uGx7snEpV2+pPWKCnX0BXwL4Luwu2z+0uMd8mSB
	0IoeeMSt/mOVQGvLy65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGp8-0020Nd-Ug; Sun, 29 Jan 2023 23:10:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGp5-0020M1-SM; Sun, 29 Jan 2023 23:10:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id y11so9374892edd.6;
        Sun, 29 Jan 2023 15:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXcahrTpEcHakTb1PxvBW7NnUoqs5ML+Ax9G8+xTpOo=;
        b=YijHuSSFkceumoCasRb9wWLGPPv6n0kzmEuQ4kok7nb/jPmn0c2KUKiRQq8MZ4iHcS
         TmzwdBRtJAqU+GfIGZDnGNRRMOeqhqae+DZ+ypiPkbJspZM50XeaYPSZtCEUrmngtCIa
         vQH/SxmwQUXqGh+5Q/UFXMTpC4/cAaEedIsaoFuCnMmVYnWlnooO8WHZiHiy6swTH5Yp
         09TO3q0+m/YJFe/4qxxY9VTY5x4SDmFaAdBQd63ukCj8bxTSEJTEvp3xtbAmGX3ebl62
         5CMIOE3S7tkbsCzCfCPSumW8QqtTpNcDHNUQmcbQkLXYhrGhxoM4gDyff0Tj5A4gwipX
         pHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXcahrTpEcHakTb1PxvBW7NnUoqs5ML+Ax9G8+xTpOo=;
        b=le0GsXFxmuDgO4jpWugpwe7BFiKic/mEsDBvGxC785T0UmXLuDNmwZEywl/bbZCvRY
         N1h3UnHp/iYCA6J9UIbqD0CginBaGBsrOtlSwRhdOOFsNrkAMwtf3UgRMrLgR3WaDfbl
         P7YUaB5UE4H3pUWqW440J9787kUAxFjzosTFE0IEy4rkjEOf0EnqdKTVO2g8Hj77QGA0
         trxvCdb4UCcouMtRN8omYQ5ANI4pDg0thbWi2Fh1Gz98jk4yIS2qvw0Jtr1ikA8M9hco
         H117E8/FHfICXmctpSjOsUFPnHwPFbNFqZ0gNR4ogyR/HdImM6Z/23GdcCmLJAllcA5T
         5Q7w==
X-Gm-Message-State: AO0yUKVQOfaoZAJ3P0AgIh0KPzQ3+Lgh5ZwARidSgeb9iTnAmH0jAJjd
	KXr3H1O73hARCNLTIXeE0lk=
X-Google-Smtp-Source: AK7set8l4bLKRYd3u8nhlm3xuNXlamvmBI17VqNVo7b97Qc0K9huFD8rt9ZgamaTA+sqXQ77V+zBZg==
X-Received: by 2002:a05:6402:24a0:b0:4a0:8f4e:52dd with SMTP id q32-20020a05640224a000b004a08f4e52ddmr24320224eda.17.1675033853437;
        Sun, 29 Jan 2023 15:10:53 -0800 (PST)
Received: from ?IPV6:2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4? (dynamic-2a01-0c23-c5b5-3100-78bb-34b6-bd6e-6fb4.c23.pool.telefonica.de. [2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4])
        by smtp.googlemail.com with ESMTPSA id i1-20020a056402054100b0049ef05260besm5888588edx.59.2023.01.29.15.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 15:10:52 -0800 (PST)
Message-ID: <a0f895b3-f895-f256-1274-a61571264617@gmail.com>
Date: Mon, 30 Jan 2023 00:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/2] mmc: core: support platform interrupt as card detect
 interrupt
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
In-Reply-To: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_151055_974077_33E4B424 
X-CRM114-Status: GOOD (  13.28  )
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
option to specify the cd interrupt e.g. by device tree. The host
controller can store the interrupt in cd_irq for use by
mmc_gpiod_request_cd_irq().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/core/slot-gpio.c | 2 +-
 include/linux/mmc/host.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index dd2a4b6ab..69c22a997 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -99,7 +99,7 @@ void mmc_gpiod_request_cd_irq(struct mmc_host *host)
 	 * IRQ number is already used by another unit and cannot be shared.
 	 */
 	if (!(host->caps & MMC_CAP_NEEDS_POLL))
-		irq = gpiod_to_irq(ctx->cd_gpio);
+		irq = host->cd_irq > 0 ? host->cd_irq : gpiod_to_irq(ctx->cd_gpio);
 
 	if (irq >= 0) {
 		if (!ctx->cd_gpio_isr)
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 8fdd3cf97..e998e919e 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -470,6 +470,7 @@ struct mmc_host {
 
 	struct delayed_work	detect;
 	int			detect_change;	/* card detect flag */
+	int			cd_irq;		/* for use by mmc_gpiod_request_cd_irq */
 	struct mmc_slot		slot;
 
 	const struct mmc_bus_ops *bus_ops;	/* current bus driver */
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
