Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BCBC77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DyWh4n7sLtb+FKJC7bXvqDlEyczxPFKctoHcdmOonQM=; b=uaEI6QcKt8D/Fl
	CsniGzb2uT6sBZuZSsiDuLfxr7A+RHfq0oM6eRHWXOthKIQ14YAcNxXG7GDnPs4udY7wdTi5iuxoU
	fN/F3h80mqBjM8l54yZTWatl+Ot833o89SrxiGkW3lScPCL28C0m6tcV7oizwDuuj3oWPWOLs118X
	lxxPr+MFXKKxOuAHcAt1pIhJySiS8BS0wHvXXMGCWNGHs2cGq5AjzIxSTqyR1DjhKci17liRTOajT
	0k+np+YaHHLx/TvUjc76DymAneifwIpUBAOpsnKaMESEbD8BIa03L2mRc8G9KvRhkUML1yywA2ezp
	ulXvNopX3VONcyU7GYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7vDR-00Ffoc-18;
	Sat, 10 Jun 2023 09:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7vDP-00Ffo5-2R;
	Sat, 10 Jun 2023 09:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xdrE0qSZT9DJMknXlOlA3GHw6tt6TuBcUDeBnwfeW5U=; b=qfJ8jwAubR7eRT7okvAB6ShfTP
	sDnmEgPCcc89hwbf99hD3QBnjWbtnnKWB6IvaJq5Xpet8TJNsf4CY1obxpW4dceNBu6Hd9rhVWxPB
	jHNLJzZO8TNWL1oZlEBxgxIzuJGyE2kIJIErTq9Y17jXssYG5KqcfhCKEEL244Ep/LmBCXbMF2MQe
	TiaGI3a+qN+lrW2GNDDHANt0UfTkv41Tw2n0lpPHDOvT90RJk1nBIg61kEUk9c+8E4J/hISODTUpq
	XZHnEY62TkQc5RSqCJpL79o+QDL6sq8jbfT8kCby3spGvR10IMygICj/Db9yKGJzw4YbqOz9IQKs6
	Uc/xYXhw==;
Received: from mx.sberdevices.ru ([45.89.227.171])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7uWW-007sy8-1t;
	Sat, 10 Jun 2023 09:04:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 47F215FD0C;
	Sat, 10 Jun 2023 12:04:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686387866;
	bh=xdrE0qSZT9DJMknXlOlA3GHw6tt6TuBcUDeBnwfeW5U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nZWZ6Om6Mf5PtBD39msvoiY+AyLIyz+WL1YthOLd6zmvxqMEhWPB8tL+3L8eNyW83
	 /hIc0vzOpwSFz0H8Rtn18pt6VjCyurahmdLMviJy9iCBT44hD86TYrRhFkH1zw32fA
	 uHTh2qvcy03MooEciaT7r7tv5tIcHfisPxVgheqlXxzr53Gao/oB+ydpfMLAnzsy3B
	 1WQYoggEt++Fe2Rs6ttbAk3Zw+wY2/dvAWNDfik/2Mul8vTlIFsAL/CtarNRfT4zDT
	 IXGa85AhoXlVKqx7yH3WJJJqV481O04Y9W2DHqmru/fPyE2CiDXb389cKdul028cdo
	 Wjf4g9ZHymlIA==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Sat, 10 Jun 2023 12:04:25 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kernel@sberdevices.ru>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Alexey
 Romanov" <avromanov@sberdevices.ru>
Subject: [PATCH v1] drivers: meson: secure-pwrc: always enable DMA domain
Date: Sat, 10 Jun 2023 12:04:14 +0300
Message-ID: <20230610090414.90529-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/10 03:45:00 #21472184
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_100441_523458_BAAAF426 
X-CRM114-Status: GOOD (  12.03  )
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

Starting from commit e45f243409db ("firmware: meson_sm:
populate platform devices from sm device tree data") pwrc
is probed successfully and disables unused pwr domains.
By A1 SoC family design, any TEE requires DMA pwr domain
always enabled.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
I'm not entirely sure if this domain should always be enabled on or it
should be separately enabled in dts file. Comments are welcome.
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index e93518763526..25b4b71df9b8 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -105,7 +105,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(ACODEC,	0),
 	SEC_PD(AUDIO,	0),
 	SEC_PD(OTP,	0),
-	SEC_PD(DMA,	0),
+	SEC_PD(DMA,	GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
 	SEC_PD(SD_EMMC,	0),
 	SEC_PD(RAMA,	0),
 	/* SRAMB is used as ATF runtime memory, and should be always on */
-- 
2.30.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
