Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEE9C04EB8
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 08:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C1C20989
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 08:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfCnh6a4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IYL4o12d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C1C20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcZN7lAXYsYgVgUqR64F1OiwsswGXz8Gaek1xa4t398=; b=cfCnh6a4tHfdqw
	7ssgd1LxXatk/24pu7MIoeoHaoU7r1mfji7FomyIQr3GU10VEYkeM8btJcAWZ710eSI4s8KLxKmGC
	1HeoScXdwUiBSOD96c6F8OxxvUt4va+eEi+ZJjTWVccYw2iKZqqBGvg/hdbm6xqexIqNjXnM5tSRH
	oqfrT55iOcdIKZy27d2bM6KudkhmS2RSwd9HT1uVwMn1B73/sk/6Dg5qu8fIoYUgDSvrY9TIB0CWL
	b8EErq1ZM1CE/g4Gg/Rg53u4SPugTJ97iBYI6HgyFGvaORparrZd7CVfAje1yenXuy1Zm7Sbq8NdJ
	ZLNtx93Mk6vKcZlXPc9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUoi2-0004bv-Cm; Thu, 06 Dec 2018 08:08:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUohw-0004bL-3X
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 08:08:32 +0000
Received: by mail-wm1-x344.google.com with SMTP id z18so15867383wmc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 00:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FSHq2iBQCrSLo+lxzbd3YK0O/5uRXso3eFpPbSZnXs=;
 b=IYL4o12d0Jahc96ULFTHQD70bFlP1jUFYQlrHarqcdK2tw+SDedu9qOR2Ts6n84UB6
 uuiXPiQory3+MFCT7KdCGebK7HLivogBLjHGD4qJaGPMy+7Cv6tfY4EYFuFHxuZV03Vr
 tu64v4+/VtrC/iMpg1ZT24Gu2S4NfexcwxXmqTxYN/kNCGfWKxeJFc9R/Ks22QLKsZCc
 sveDSVPsap34pv+5We1t0cI6g1EfdqlZvmfKECuHXaILUTWMXeBaAx7sHDc5aTyQh6jS
 gu43q/if6r/bnkXzXULkd/ffStwIJcii+rdWLEs9PlYV9vAIdRCuSd9S1YfjZtSFcYBY
 0t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FSHq2iBQCrSLo+lxzbd3YK0O/5uRXso3eFpPbSZnXs=;
 b=U9OgXAHG8fuz88GWp+KCpHKwW5EjXqo2zSUXVVpPqgaLSYDhvhC69hMDKY2GFblFA/
 qFehkyeXZob1PmxBG2HE81J6aWaLCM6v0EVpMrvsAprXjSkik2N4m573k+xYQBbbrfjr
 zp+Pt9JgJFQ76SSQuHe5b0y/bpvgfi9KN0nQwEQhOCsYMhfIApIcCfaqr/QO7pgjqim4
 qaletKcgHIMaQY6qkeMoeGUnnRwXCQ0IJXOBLYHQAv8uiqSzOKsaiWJy/OuW8jeuybuK
 +ZtSkt00uD5NKg9APEEmJuVWg0Ih5RX8dYICSN7euKjlVIcpf+YLnAovPq0DtmWWmLVT
 mbDA==
X-Gm-Message-State: AA+aEWZKy//lyTe4eJA/IoolO3ITG+q9g5VwT14g1OnMdsh649m8w2JJ
 Q7hdEzHxMVFNKjYcXlzUC4mQDiEJ89nwGA==
X-Google-Smtp-Source: AFSGD/VI0ZqYH+cVv87wbs38TWIQjNfwTsPMVXG7g3sU2pr9a0kUzrNy/iv7EdBHdFRzie235FOjjw==
X-Received: by 2002:a1c:1801:: with SMTP id 1mr19869382wmy.153.1544083695528; 
 Thu, 06 Dec 2018 00:08:15 -0800 (PST)
Received: from xps.expressvpn ([2a00:23c4:f7a1:ce00:7082:d306:16fb:dc71])
 by smtp.gmail.com with ESMTPSA id x76sm29448886wmd.27.2018.12.06.00.08.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 00:08:14 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl: meson: axg: Fix GPIO pin offsets
Date: Thu,  6 Dec 2018 08:08:11 +0000
Message-Id: <20181206080811.30320-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_000828_196429_CF3792DB 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The pin number (first and last) in the bank definition is missing the
pin base offset shifting. This is causing a miscalculation when
retrieving the register and pin offsets in the GPIO driver causing the
'gpio' command to drive the wrong pins / GPIOs in the second GPIO chip
(the AO bank is driven correctly because the shifting is already 0).

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index a54fbce910..3bbbe817b4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -14,7 +14,7 @@
 
 #include "pinctrl-meson-axg.h"
 
-#define EE_OFF	14
+#define EE_OFF	15
 
 /* emmc */
 static const unsigned int emmc_nand_d0_pins[] = {BOOT_0};
@@ -893,17 +893,17 @@ static struct meson_pmx_func meson_axg_aobus_functions[] = {
 };
 
 static struct meson_bank meson_axg_periphs_banks[] = {
-	/*   name    first      last      pullen  pull    dir     out     in  */
-	BANK("Z",    GPIOZ_0,	GPIOZ_10, 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
-	BANK("BOOT", BOOT_0,	BOOT_14,  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
-	BANK("A",    GPIOA_0,	GPIOA_20, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
-	BANK("X",    GPIOX_0,	GPIOX_22, 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
-	BANK("Y",    GPIOY_0,	GPIOY_15, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
+	/*   name    first                      last                    pullen  pull    dir     out     in  */
+	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_10, EE_OFF), 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
+	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_14, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
+	BANK("A",    PIN(GPIOA_0, EE_OFF),	PIN(GPIOA_20, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
+	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF), 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_15, EE_OFF), 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
 };
 
 static struct meson_bank meson_axg_aobus_banks[] = {
-	/*   name    first      last       pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
+	/*   name    first              last              pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
@@ -931,11 +931,11 @@ static struct meson_axg_pmx_data meson_axg_aobus_pmx_banks_data = {
 
 struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
-	.pin_base	= 11,
+	.pin_base	= 15,
 	.groups		= meson_axg_periphs_groups,
 	.funcs		= meson_axg_periphs_functions,
 	.banks		= meson_axg_periphs_banks,
-	.num_pins	= 100,
+	.num_pins	= 86,
 	.num_groups	= ARRAY_SIZE(meson_axg_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_axg_periphs_functions),
 	.num_banks	= ARRAY_SIZE(meson_axg_periphs_banks),
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
