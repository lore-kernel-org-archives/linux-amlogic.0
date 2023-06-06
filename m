Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7467C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XGzZJdGuZh8o3fuMH+EoBd9qpdKtBF0DQK6yCHskkaU=; b=rzHhGzvLElUwbI
	G98I5ejg5H2SkXbBccJOlXJbEaXvsgy0wX9x/FJ+sC6bAbC011GFKhDw8QqoxKVW8oZeYU/Nwmenq
	0TW9Ngf/U9zzfmp4+Tzf7eNgag2WJUmj3f1qXIofe9CBgcw38RgRJxrI4fw4S9ZpqF6wNSYd9DBIK
	u7Fxs5ETbr2/RfS+c9/lEH64AubZEFC9tqoGrK1x4h4kFee+ElNi5mzzEYMVQdtFfOdgMNyRSct9F
	CJQQM8QmWu0pM/plp6FQlYUYhZ+WYZTkHwPGwQKdc72tsfQf9CyZpJdKQhKOYLvrZmw9rf2VAFuQZ
	p0YK6ocJ03aroiVBvXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ZxQ-002VGD-1g;
	Tue, 06 Jun 2023 16:54:56 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ZxJ-002VEr-2X;
	Tue, 06 Jun 2023 16:54:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 896615FD54;
	Tue,  6 Jun 2023 19:54:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686070484;
	bh=Z3E+qqaUAGaWeT5IbR6dVGiBQMvs+bk43lDEXzhVAAM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fgwjx5hWc0N6KD5F2kmUMsEI66q9ktsm4bEQsZ+iks1z7gfXBQG2tNEnz1Pq8KI78
	 1Pn2/Q9VxsdRutm+UetCUiAHpBYdE8xOT2DdqzQncNCn+oIHBOvT+zPxuyMOMgrFKP
	 5yEyxKWOLB3uC6ADDK8eW+atxanhPzx96iMfStYjJd5U64zQ7gADzrfEZSjNmiRhfm
	 181PB9c3UsYX1wiIXYJ/E8iYowHM66h9QxyfpPpYK9zQaS/VBVumepUU9/nJrj5vGi
	 zPtKSyUSHf3PvOKDfgGMHOVjivk67q1cWKg+ANHSbdMzdFvpfeVgYQQp4ueFKaM7Wr
	 B/ZODUZrKU07g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 19:54:42 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v3] meson saradc: fix clock divider mask length
Date: Tue, 6 Jun 2023 19:53:57 +0300
Message-ID: <20230606165357.42417-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 14:43:00 #21444531
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_095450_351323_2B807298 
X-CRM114-Status: GOOD (  10.49  )
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

According to datasheets of supported meson SOCs length of ADC_CLK_DIV
field is 6 bits long. Although all supported SOCs have the register
with that field documented later SOCs use external clock rather than
ADC internal clock so this patch affects only meson8 family (S8* SOCs)

Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
Changelog:

v1 -> v2:
    * Update commit message
v2 -> v3:
    * Update commit message
---
 drivers/iio/adc/meson_saradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 85b6826cc10c..b93ff42b8c19 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -72,7 +72,7 @@
 	#define MESON_SAR_ADC_REG3_PANEL_DETECT_COUNT_MASK	GENMASK(20, 18)
 	#define MESON_SAR_ADC_REG3_PANEL_DETECT_FILTER_TB_MASK	GENMASK(17, 16)
 	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_SHIFT		10
-	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		5
+	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		6
 	#define MESON_SAR_ADC_REG3_BLOCK_DLY_SEL_MASK		GENMASK(9, 8)
 	#define MESON_SAR_ADC_REG3_BLOCK_DLY_MASK		GENMASK(7, 0)
 
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
