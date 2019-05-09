Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD78C04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E1E3217D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qs/2+KXr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q6sRXgfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E1E3217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Mj/NGmqAQ71pbylEIhHGPTsffwFHPNYPeaq3NW8/9tk=; b=qs/2+KXrjzyOEGnsZY5DRYNlL2
	kOzMXpW8GSq1hl582dC2lvIqdK4gYXvrz1Uf/u0r6SQx/2hXsovRw2AkNQ8yNzolnQopYVkvv0+L7
	2rOxo+c/E9bfFB1ZqBlCKhv4RW82YeoFTr52bKHLv+zzE+9KpEfXkYGM2G2/6mIrauozc9jeHRuV5
	f3dHuWb1Z3TjNCYfpugWkjG9D8AfPTR+o9BbB14gpH47aoWHTA81a7x/bPxGUYAL5VozoRW4rkXSR
	9a2w2RB66YaILuhRuxPkn87cT4WJwWgAysCrQpdMhqA/zSqeETgsUVRCJ42PxWtMRdaiQEoQSNfTX
	FQg9utDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOlvM-0006AT-UJ; Thu, 09 May 2019 16:29:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOlvG-00060v-63
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so3955023wrq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
 b=q6sRXgfrPS1ftufCAYoUuOq9QwnKCARST8ggrwycQjcZEErNyH9+1jKicpx23HkC/C
 6Tgi6ceqLnhlx42xWUIYG8+ienjUrl62Y7kbMWzp2XcPQHE6r0zqdusvDMTg+wSw/EqF
 L8AkMdxu20sO+KfFYKteAsmrnXDx9QI8K1PVG/1r+Agpuwq0jOdMduFxfF+MHn7UdH9h
 XaBAmYlAsM2vsukhUM2sJSjRI5FuEPfZpV81calRjNKdAX/c9Z4C0NkVZ0HzvRkwukaS
 zly0hygjE2gPggWhUU9FT7Kh7pse1ZVzJeTk/G8RPzbIpPoRtmR1AucMvltDAnEDvFHM
 kQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
 b=jxIQHdQdNlfa63yZmEb2Rq7K0+1zr902F1Z7ndJKWtA3behNOR5b+hApWh1jPZoiT/
 TooQOopPA+yjWSTTncE8cwSlj7ZAPCG4+NHD9qWXqRbtdyDFCw016XE9YtH5jUAeGk2i
 vwG0dZM7ar73yG5BxhBuu/DjTFppZH7zZqF6L4p08rmuKAOWvmP0koweNlWtVOCV/pyw
 A0yTHXX7OEScdpXCPHrixSCPaNGeuLGUXhMa8GDMOyvAWTUB5padCrwBUn4f66u/q/C4
 ZDDO3H9Lvl6ttt4bCjl/e5i1k5ZlnI0cw0em6nv6QEil9xbVPJIcMXHgrq20b+N+noXO
 NY6w==
X-Gm-Message-State: APjAAAU4715+/XXHM0TKuKwog6eO8+TvpypfnwBDouSwKlobRjZGry7F
 icsfOXVZHbWv8J5ag7knRwPwLw==
X-Google-Smtp-Source: APXvYqzj+ok+fo5I5fpLh+PgmP0jZdB7XOCCyhpRY/RVnOJ6kCV7LLIaPMaBoUBOW/zSbhP7uYluzg==
X-Received: by 2002:adf:f488:: with SMTP id l8mr2233330wro.287.1557419368935; 
 Thu, 09 May 2019 09:29:28 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:28 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 6/6] pinctrl: meson: g12a: add DS bank value
Date: Thu,  9 May 2019 18:29:20 +0200
Message-Id: <20190509162920.7054-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092930_233288_795CC546 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add drive-strength bank regiter and bit value for G12A SoC

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d494492e98e9..3475cd7bd2af 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 };
 
 static struct meson_bank meson_g12a_periphs_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in */
-	BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
-	     4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
-	BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
-	     3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
-	BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
-	     0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
-	BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
-	     1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
-	BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
-	     5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
-	BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
-	     2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
+		4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
+	BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
+		3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
+	BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
+		0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
+	BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
+		1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
+	BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
+		5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
+	BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
+		2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
 };
 
 static struct meson_bank meson_g12a_aobus_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
-	     3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
+		0, 0),
 	/* GPIOE actually located in the AO bank */
-	BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
-	     3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
+	BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
+		16, 1, 0),
 };
 
 static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
