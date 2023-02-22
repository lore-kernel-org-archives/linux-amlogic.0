Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE91C636D6
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWFyf7D+gkBqyNcjUXmJch/q+1YFmMRG3OHnTh9hHBM=; b=hcoLg1Gsjk7OzG
	+m7rDsbDSaIv2HdI97PvQjjppOvHUmX9BsqW7k5db9xzpFLJmFbeh4kKppQZxAk73+GoNvBlV6AA6
	uDvU1zguSFZ75qr1c4LkwCgm6eb17QnXis7mDW8zxHTpN5zndjS4chmDjSuv8jcg3rnOqxhubI2Pj
	ZELAJ/e5oW9KqTLsmc4inOuKdLW5U6FemTHPUPpYAq2pLZfR//9MxX94hasLQtTi2ExAcKmj93yCv
	Y0TpdrzcTm1lABcbN+YTB7rtgPIIr5h8lPnMmushh56YGBqoJAbGUUGF25PuuYApA3IXgJBAkSEFA
	jR3Vq5qT02OuMxq8NZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUne2-00CDeh-6W; Wed, 22 Feb 2023 11:50:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUndz-00CDc0-2u; Wed, 22 Feb 2023 11:50:45 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 98DE75FD62;
	Wed, 22 Feb 2023 14:50:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677066631;
	bh=UdeT4IMQpdav5+UNKBr3En6Ud+lKewoeO2W5d6ugRCo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FNCs88+vv+SiOwI4RlYHySChJ3BxeI8mHNaz9tgquViBGRiAI8JAPsdvoI1LPtqqW
	 c1kDr1Mw9Z+uhALbCEz/ohwZVGYcrfhsAId1aoy/r77VjTYTUuQMD7wrf9d5M4RZyO
	 ksWb5vZYH+HbwIognMi7c+XCZs3G7ggCpeFPiHqTBk97LaJh46S5ecl4chKOw/jGBp
	 91ArVHxG38OUkBsbMP1dNpdSbQTCZ6jrcNg8sha6JJxIUt1dpBcKW1n9aS/6KNLFe4
	 39L44IRMlcfTXuJKuz5PQmTbi62pOwlSwyy6mLF/di7SrhZnR92qQ7H7C1H5IRpAQn
	 t9dAo488t7eKA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Feb 2023 14:50:31 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 1/3] meson: pinctrl: use CONFIG_PINCTRL_A1 with CONFIG_ARM
Date: Wed, 22 Feb 2023 14:50:18 +0300
Message-ID: <20230222115020.55867-2-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222115020.55867-1-avromanov@sberdevices.ru>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/22 06:32:00 #20888384
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_035044_019300_032C2169 
X-CRM114-Status: GOOD (  10.79  )
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

Tested A1 pinctrl support for ARM and it works.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 drivers/pinctrl/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 64fb9e074ac6..fad688cabd05 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -57,7 +57,7 @@ config PINCTRL_MESON_G12A
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM || ARM64
 	select PINCTRL_MESON_AXG_PMX
 	default y
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
