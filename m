Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDD4C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9882173B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xn2OGBUI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uhtIwH/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9882173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Mj/NGmqAQ71pbylEIhHGPTsffwFHPNYPeaq3NW8/9tk=; b=Xn2OGBUIhsVgOHBkssAQlY0T4E
	c9aNpG1FGeK+ZEUHqolDvsK8pSXMN0E0pa2Z4tNXAJCN8JG4tNOymejQ0YysKPKzSdDtxYVbzCP05
	Fa7wiFDDBoeUjKjJMhQLBEZ+pvPrMPwYdho6omCA4B04/Ampy7Am05IQW78OM+eUv8ZrCULeMuMkc
	wlqdbsPR2ap8C1rgSG+HQM84HyXtSSzHFuJbsqMDz5nQ6LZ6r+cp41aUE86tH7mx4EE0HLDNEPaE4
	KDEiKYeeKWktabJyJMYQmcLFF6k+h/E21JsaW/wLNjdyMn+A6sRtbtt9rMd0ELbvNsmdndvrx2nsS
	xsoXiQtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0oh-0002fw-WE; Fri, 10 May 2019 08:23:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0oX-0002R8-Rw
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:23:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id s15so6644669wra.12
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
 b=uhtIwH/NZFJ48uIDBhqwqTjMsx8agUVdKqxKn/wT/HGQlFyxplSo0EsUpNiPGg6JHo
 Hwk87YTmDU83xzZU4f/LZkFJEptHPgRlhmGbuvPSGo0flQPdltEjUO/tJnmJINywp1fF
 /fhrTKpp689UDLZLwSpp+XZJgc7OJowEQWncaI5m+nzv/EgOSI1GKWIZ2za/9eUCQthL
 jrTAKxlBFre024EAVcXeIFQAfH8L4ey988GlfD7Ze8o2FQxlZ3680a3vePn+4c505AGu
 OXhELXQScpUgFO5OHMHi3k/S3oLkrmucozy0M0Z0VCjv8rKIpqafTyX1HTUcXELNZDhC
 rOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
 b=tnW+fVLWAS0YRbWDS4qHtIlk1VTQyFcCtaR3+8ZEJONm01N9vE5bSg2ltrQAIVgL+V
 EDi/mXx6AsuzhMiXd0P1kyTm1GeBgh0qgHiuKSk6eLdTLn1I3floLEF7SLzq7xGX9w9n
 DeLdHLNarLE3w6/YxpUPem5z5MeTmtPtKJPh/qYxeC6UHksqhw1D3/2fTfZj5jl/QAWo
 NrbqQWouFLZB3hpoT0Grw5BZ+7+Y2wZL6ErfkmlCbMdMC0u/iqU8Io3l6xhpkJqbG3g2
 8dJK1/AWHQPpoOHcbRP3mNIrW2CvKAMG5ZNlm2Krm0SPzV3Tayi7BFurmI1DfNfqhU4c
 Z+jA==
X-Gm-Message-State: APjAAAV4NAMhJbftULw2DzPlBJcNHXlZptDCasQ9AUWveevEOV5+Y3dv
 6SZU2ydy99vjqRl2CfJEK0jKiw==
X-Google-Smtp-Source: APXvYqy1wdwN6UVZDfIDYZvOAXqF7PasI/1MfUnTkfGHdroPNXzwZ1cLMEwwK7qQbtPMHGjW6nfkaw==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr286910wrn.29.1557476612615;
 Fri, 10 May 2019 01:23:32 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 01:23:32 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v5 6/6] pinctrl: meson: g12a: add DS bank value
Date: Fri, 10 May 2019 10:23:24 +0200
Message-Id: <20190510082324.21181-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_012334_342219_B6E3E8FD 
X-CRM114-Status: GOOD (  10.38  )
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
