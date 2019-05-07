Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD8AC04AAB
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F649206BF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nu6R0wRY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZWz8Ne1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F649206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+57I34qO6yGo9Sn0f65fMUmFVLO8tG/77yKNv+tq2R4=; b=Nu6R0wRY8r67vFLZDDFooYVJgW
	mBc9YgASH2Ik7pI8CafSRrUFa9cheBHQGQ+Xs9482WVvAkZbMIpUpGO/YQLiuriieVBYGkVQWQ29L
	czzu5zw0oXwUmlNnEUurLbpMHIcd2aNEDlHRmOqfieG7XzmfuXCXdo7JgZp8DE4fZ+QkFhhQgCEF8
	NrpW5pga2bo/0ZNZI1e2z2kwbG/lWVWLssItI4o5F/xu+gAeUPt5Z3BOkgz4HM2Y3mWP2FV6QUYQ5
	jG2jy9W3/4RVDF1qdTXz9TeBCUNzc6zgKwRQQAcMCBUioPIBAOyaQ7NKyY23H7f8bYWkZxmbSRxkp
	BNAOOYsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNyj7-0002rK-QT; Tue, 07 May 2019 11:57:41 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNyj2-0002hs-1Y
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 11:57:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id e11so8891322wrs.0
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1rHCx6L3GXgpLSY85OBaF3yHPOjpl8Cwfh6FO8D2O4I=;
 b=ZWz8Ne1bpYs9dwxkTuB7UuqVVop0CvuA6m7QtVT8rMJydQmuiN0iEFu30bYGtnRZgb
 OxZ4kIt8i2PKuPs97ocwBqQ8mVNGjIeGHXBa26X2PmmNBwAb2nNldL2uigf76+mGp/YG
 JG5I10GW7ZDutGdJxdpPyrKdtUu7/j30CY0DOJANXkwvWuXHY2IxNuMDfbx3YHZqos61
 GqtHRvNESm0D1M7y6CxMxZAvz+Sa1eoHoRNrJ2GvXw2XFETwLM8mDBM5JdHPptLe3MfJ
 ah9zKSzhIlaybeaXTlWJOSf89aZpRVftDNiLERlgJzO91gkEloeXdZiydTfoC5PNVEtQ
 TM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1rHCx6L3GXgpLSY85OBaF3yHPOjpl8Cwfh6FO8D2O4I=;
 b=rqeOuuLqXsvFpbBQ9hVrjnvDLqS7pbok/kTSh0MyhatdS4yQSlqRb/pKFWKzvF32js
 Mk9OP6Wh5zyyot+hurRv8VecZ+bIrXW3nqppefNNmbYpmN1DqlSOoq23297zVK//9dVF
 4aVJTOtR/ObQQwhIalmMSxVxG1PaZLfNyZIWS9OW8VYRkZk2m7XugIImPjaAr1faF2/J
 UpsFSinhuha/zl5Rl3d5sryGejjAOAg2meXGMLK04OR0gGZe872I6PuzzT8XoOC4HHIH
 /zn4E59T9mQXyBPmZBbX7tx9YLvChjrqcvHfd8bgfrVwuRPHiDsqyN4tn8KPBwrKEzMK
 bSJg==
X-Gm-Message-State: APjAAAUiL+zq9H4zLrL9ufQeg/zvzOmdAXAQlyeZuwoDi5yUs6cCAszk
 BBvHpZHauaZmAF94S/7Np8k0tw==
X-Google-Smtp-Source: APXvYqxtuwhQYKKyA7f4ToySm0WEeeU5OY1VRRVJPndZ8+M+fJBt3j4+IzmJcv5g2FbvKSe8xYt5VQ==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr8778721wrw.152.1557230254753; 
 Tue, 07 May 2019 04:57:34 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:57:34 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v3 6/6] pinctrl: meson: g12a: add DS bank value
Date: Tue,  7 May 2019 13:57:26 +0200
Message-Id: <20190507115726.23714-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_045736_534572_9D493B75 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add drive-strength bank register and bit value for G12A SoC

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
