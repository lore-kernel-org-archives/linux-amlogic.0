Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4844BC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hCYGGzm+8kGJFQe3Hsmj8Hy5tVkm7vewXTrrSeaZ7qQ=; b=zAOIr/cFAVRHT5
	oe3ThBq57Xh/Shop3m6aTejC272HnnX7xfPjk/yxR71B+zI8NnCtz9IfKE0c/yVL/+Z1eHsq9a97K
	F/Xy7J7pkhzVTKd9YenuudKCncB377AfMVmIohnCOyQm9+Keov3/LP3c3sEn5q32UOMxcYKFEt7RP
	NYR467PN7PQS2A8BqllKy6lQp9myZ6sRE+wnyn+gWnhESopnvGpWk77iFp3ESFwJVaGk0i0fzCV4g
	qKrEAqxoSMWvzmGr2iNoQ++CnZ0rC2r4K4BAKWwmPQzPhhH8BYdLb33yRfHh5/5uLZ9P4/LRh5YR3
	fvwpMWV2fgETXvBHXOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc8OS-00B0MA-15;
	Tue, 14 Mar 2023 17:25:00 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc8OO-00B0LR-2G
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 17:24:57 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0140620048F;
	Tue, 14 Mar 2023 18:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678814695;
	bh=2e5jAUF8/ZirLPQZM6YQfIUnTkYXb6j3MWx9iDVhC4Q=;
	h=Date:To:Cc:From:Subject:From;
	b=qFak2Zi44M/RwtD/NtNYnTwkFP1fEnUuhHCR3zcHHXd2a46o+i4G5EMxJ+GzDIvYD
	 d30Qz/k+vij8HxGCxOxRDpnFJuKpXL4LNF441xThOJ0vn6UkoLqM4pCcTnaIMK/M0H
	 st5Ea+fRrcH1DMrDhwz4KNKpfFbw+dfRBdYBueAVAeymmTCqER2nmDOVXPWzNN9ack
	 k4OU+bsTHEyNRa0JcdCo5Vuq/67YXZRx7HPZ/nGZ4YFHn/jMhTncKvcMPpqX4tWQwa
	 wVChT6YXL9SzfdP72R4WjQkyYPrcobMUluHR8MG/KuQAQvmqTihVxifgyWzmO6AsSP
	 wKsiMzPjEOmAw==
Message-ID: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
Date: Tue, 14 Mar 2023 18:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Heiner Kallweit <hkallweit1@gmail.com>,
 Rong Chen <rong.chen@amlogic.com>, Yang Yingliang <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH] mmc: meson-gx: increase power-up delay
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_102456_879310_22441193 
X-CRM114-Status: UNSURE (   9.18  )
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

With the default power-up delay, on small kernels, the host probes
too soon, and mmc_send_io_op_cond() times out.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Stress-tested with 80 cold boots, checking every time
mmc2: new ultra high speed SDR50 SDIO card at address 0001
IIUC, this will also slow down SD & MMC probing,
but an additional 20 ms seems acceptable?
---
 drivers/mmc/host/meson-gx-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213b477..73ecbcf588c65 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1182,6 +1182,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
 	if (!mmc)
 		return -ENOMEM;
+	mmc->ios.power_delay_ms = 20;
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 	host->dev = &pdev->dev;
-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
