Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477EC636D6
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggbVBBHD3s8X2V4HGuKlJjfgc5gKuVbZp/pov6793dw=; b=G6/9XLCpv9ZiQ+
	8WaYFMmAA8j+3ZvL96STiLIs17LoHtZiK07LxFOyQ1m8b9O97U8vlJrkexcsnlBCyMvhoAFXOxUDX
	N1CyUjjFNV/EJR8CpSJUhwvJdoqpE/iQLDqcgy6lcDypDUl0CQFAn+wmGenIQAWtjMzVmfYjBKZPp
	5PcGFGlq7hY5/OSObCW6qfJArBwUATERFTzLtptRHgJZ79X2Vj+3qpCjbLndC/R82AgVQ7IaMkE9t
	po5b0e6qUMRlj2c3Fg8Ubraqme/oYVxGKFImLF05nKNljSUQIcin68xaRJlxjZD6tGiC5LAjvibL3
	WOMiglUeW4UPo72PQw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUneJ-00CDlx-0p; Wed, 22 Feb 2023 11:51:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUndy-00CDcB-VV; Wed, 22 Feb 2023 11:50:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8A7665FD63;
	Wed, 22 Feb 2023 14:50:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677066633;
	bh=CsQGfUCkH2ZamwaiMkFtrGFlOwLHzQzG+8+VcxmQvAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=caAUX07/ARkhhcAYGdi1TUU4bLJuMsAU0bp0VovhAsMfUHcFnog5xxbv5CHjytMf0
	 9z/F9+WVgw0wbIAFv1Bl0AtUEiWg8XiyueXBrNwNiQr7XUMahjQG4eUnQAMyg4BuGD
	 aNPT4m0MOD5DcOXnXDKATRtBTrtVtFu2J676ONOQHxPDysplknntSZPWbozWmt0mRh
	 Zu0iZiOcu/itWhxh2nDu9bzDruMj9J+hKaFe/KA9M/yVbo8iWvG6H0796ao47zLMfY
	 O2sQOS8D3cw/LpVWtMoMwg/N4rWP+yUqcZVUG8ugyAk/K1+hhkMT4xeQQy3ZUBHiGg
	 UizC/hSUL4Yxw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Feb 2023 14:50:33 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 2/3] firmware: meson: use CONFIG_MESON_SM with CONFIG_ARM
Date: Wed, 22 Feb 2023 14:50:19 +0300
Message-ID: <20230222115020.55867-3-avromanov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230222_035044_034209_76A40AB2 
X-CRM114-Status: GOOD (  12.33  )
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

Meson SM driver has one strong disturbing requirement.
It's size of the memory page, it should be equal to 4K.
ARM 32-bit arch always uses 4K page and doesn't support
bigger sizes. So it's not a stop factor.

Anyway, meson sm driver was tested in the meson-a1 ARM
board and it works correctly.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 drivers/firmware/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index f2fdd3756648..20303b7394fb 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -6,6 +6,6 @@ config MESON_SM
 	tristate "Amlogic Secure Monitor driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default y
-	depends on ARM64_4K_PAGES
+	depends on ARM || ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
