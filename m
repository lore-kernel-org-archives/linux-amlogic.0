Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02ADC001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jul 2023 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LqWvVW8y158jvbNoSHBv5CFEkyGZLwsw18RGUIzaTU=; b=AbD50Ns+WyBHH0
	qco5x9PCEMe9kz3HVnL6pFgafg6QpMXmjCnstQ7jdyZNEnv8aGcobUhYuaF8Q3jiMuEBqPyWnnm3+
	Q4K6QWMxuE3p7yMvvOPLkIFnJSquqHGmF51jl2eRhIciC9KAqy4LHUz0p/Mnh4rcqd3l8zydDo4va
	kh24t5H4xxrseiOJVFOuVTftCPz/aZ4S9bvcS8FE70jCadDYircOsA+2PKXMzwArJEWDR2VVfVqP1
	w9M3rBmALwKOL/K9oj7ZiWGsec260dn28zodjg7r6GsKomFMuEgGYk14GaBKqbLaQeLku9u7oxiQX
	B/r1xIVVvwBUMyaxOaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNoeU-002uNN-1g;
	Mon, 24 Jul 2023 06:02:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNoeM-002uHH-19;
	Mon, 24 Jul 2023 06:02:31 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 24 Jul 2023
 14:01:54 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 2/3] pinctrl: Replace the IRQ number in the driver with the IRQID macro definition
Date: Mon, 24 Jul 2023 14:01:07 +0800
Message-ID: <20230724060108.1403662-3-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_230230_398192_0A326BB9 
X-CRM114-Status: UNSURE (   9.90  )
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

Replacing IRQ numbers with IRQID macro definitions makes driver code
easier to understand.

Associated platforms:
- Amlogic Meson-G12A
- Amlogic Meson-G12B
- Amlogic Meson-SM1

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---

V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h

 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 35 +++++++++++-----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d182a575981e..3cd86d6a0a60 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
 #include "pinctrl-meson.h"
 #include "pinctrl-meson-axg-pmx.h"
 
@@ -1318,31 +1319,31 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 
 static struct meson_bank meson_g12a_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
-	BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
-		4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
-	BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
-		3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
-	BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
-		0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
-	BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
-		1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
-	BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
-		5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
-	BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
-		2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
+	BANK_DS("Z",    GPIOZ_0,  GPIOZ_15,  IRQID_GPIOZ_0,  IRQID_GPIOZ_15,
+		4,  0,  4,  0,  12,  0, 13,  0,  14,  0,  5, 0),
+	BANK_DS("H",    GPIOH_0,  GPIOH_8,   IRQID_GPIOH_0,  IRQID_GPIOH_8,
+		3,  0,  3,  0,   9,  0, 10,  0,  11,  0,  4, 0),
+	BANK_DS("BOOT", BOOT_0,   BOOT_15,   IRQID_BOOT_0,   IRQID_BOOT_15,
+		0,  0,  0,  0,   0,  0,  1,  0,   2,  0,  0, 0),
+	BANK_DS("C",    GPIOC_0,  GPIOC_7,   IRQID_GPIOC_0,  IRQID_GPIOC_7,
+		1,  0,  1,  0,   3,  0,  4,  0,   5,  0,  1, 0),
+	BANK_DS("A",    GPIOA_0,  GPIOA_15,  IRQID_GPIOA_0,  IRQID_GPIOA_15,
+		5,  0,  5,  0,  16,  0, 17,  0,  18,  0,  6, 0),
+	BANK_DS("X",    GPIOX_0,  GPIOX_19,  IRQID_GPIOX_0,  IRQID_GPIOX_19,
+		2,  0,  2,  0,   6,  0,  7,  0,   8,  0,  2, 0),
 };
 
 static struct meson_bank meson_g12a_aobus_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
-	BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
-		0, 0),
+	BANK_DS("AO",   GPIOAO_0, GPIOAO_11, IRQID_GPIOAO_0, IRQID_GPIOAO_11,
+		3,  0,  2,  0,   0,  0,  4,  0,   1,  0,  0, 0),
 	/* GPIOE actually located in the AO bank */
-	BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
-		16, 1, 0),
+	BANK_DS("E",    GPIOE_0,  GPIOE_2,   IRQID_GPIOE_0,  IRQID_GPIOE_2,
+		3, 16,  2, 16,   0, 16,  4, 16,   1, 16,  1, 0),
 };
 
 static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
-	/*	 name	 first		lask	   reg	offset  */
+	/*	 name	 first	  last	    reg	 offset  */
 	BANK_PMX("Z",    GPIOZ_0, GPIOZ_15, 0x6, 0),
 	BANK_PMX("H",    GPIOH_0, GPIOH_8,  0xb, 0),
 	BANK_PMX("BOOT", BOOT_0,  BOOT_15,  0x0, 0),
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
