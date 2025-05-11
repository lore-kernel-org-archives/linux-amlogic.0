Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5784C3ABCB
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 May 2025 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAa5crjRrLp9s74A3xXdLTvZY/7WxQcTsjvkAE/ilaM=; b=uN1uEgx8qPoJTD
	4NHaQmxbjA7WKY6vkWXXOJyCNodONr9Hp0zJXQJUE4QJZeR3a2gPJrrOhm3GAyCOKUVtQUhdabX92
	x1X7JoyMWmEanwtS92L/orS9RvTzhUqiHNSZNP56kSQFopa0DqOrn8rnOtXalS4HGqHDr2KpRHQ7z
	lLUz/aGG6BC24GvxlP6dOet6dpTiAv/tRV67w31cpkhaTwH32NyV5JpzvLWWkQRj1X/amJe+YrQIQ
	ix2C3IUkCELR+M+eaa9lXCq/fieT4bugwoWgl1uwj6U+nzNzDUnH0XqUXX9MwleAzE7XVn4uLS6Gd
	9DKxCLmLe4+ofphoBPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAT5-00000007b3R-0RoO;
	Sun, 11 May 2025 17:28:03 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAT1-00000007b2d-3gpd
	for linux-amlogic@lists.infradead.org;
	Sun, 11 May 2025 17:28:02 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so56348686d6.0
        for <linux-amlogic@lists.infradead.org>; Sun, 11 May 2025 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746984478; x=1747589278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=GhtOfjjug0E/FwAwMtQp8xK8k8+EUn1Z8t2mFHac1pAS+lzBzcqASO4vFZW12s8o1b
         ZireJ/qTxw6TR0/KHS3kFaaX1+5il366KhSmTNPcdW8s1yO6Jr3VU25cikAUYwHZ73mM
         jzmuwu0qnTIJZafE5Iji596hls3PD6ky1NH+Ax+nHKeqWHuBkm67ae+hSQcwMsLPd/cG
         eAPlvMuvwosjp9+Hhzsplj5GIp80tTft5wW4rGZL55r3aO8cFaXQQBYtXQLidXVCgfTA
         U6fOdr3dneON+n8B7swcZQvPKcuI/yoooB1lZxFBu7tv8d2wTpiAJh3RqDD1AiSqhXS+
         K5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746984478; x=1747589278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=j/bXNxM2s9s9vUFGkmjl8bwUsR88HzP5UtK+uZ8kwxBbt9e2e+6GPCYA3z7ccK254P
         q/QrwpaKnnqEYPGwW4o+xyBOud5wLaXS5hx6KoQTsmNVY/oVreYCCBpui+Jpoc7tSAO2
         PrerBevyJ/JLhEFDQMpUkXm5m2wQQMykfpLoAbw5rTgVZRgwSpZCPLZPmuha1J/AKVAf
         cHwGvFBT3Kpeiph8BLyNPYorcEfO61KBclMEf9naySLGqTxOfozJJ1EeP3pnD5qTdaU+
         uqZM0RjDky8R67arI/gburgrHFwg2YXEqGwRbeylJ/GLAKFM5i5xKMZpCoSoxUZfnIM3
         eSZw==
X-Forwarded-Encrypted: i=1; AJvYcCXs/ejwgMRfbIjzayepw6PfT7CyjQaM+/uiWM1Gs6GWhA1lgFrTGix9HGJVYdW7cz/9Q3yw46VTluKqZaLz@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwK4Qc5jlhKwPcGRTlC9UgUKENSS1ncmNliNOfY7IpNzWIlKa
	xjqbscnhTFcMBRMs0i+JBOpfO/N8TTyJzEcJn3r2CKeeVWyLpeMharqPRaZl3S2PlNy3G8Ds3Fu
	xqJRY
X-Gm-Gg: ASbGncsA7Gs6ZsHhuNgyiCCRIjawm6j+H8Fqw1+dG3L/YZgttPJw50lCtfXp6gg5d4Y
	fFd/CMZp9nK9KeqLvMo2+gN5nHFTrlCjs8QgawVfiQg5V+qV7knd86ejEAnmCqfB+CRHCzMLQX4
	D7VVCOuiHm76E6GqbA8rnpAeMZ650wvMKlNtmKA9PyNOFYghiLERBFzddfph6B5t0ZimYfZDfqT
	vNlPWfhJLUenM4OXDj377avFKOgCX5B8/3oY9U8jzc22+T9VPTwENyURt+SMOoMHplwUycSuyM7
	XHT5TtXP4d2YgM0DCWi+bdlpPdXSk038Bji+SYtDwLcSzyM=
X-Google-Smtp-Source: AGHT+IFlP5l0H31XlZsHA+W4Q93wZy0iO7ylnNI0g0kBW6+BKRL+6jyRI5gTxis2QFwWchN0XCtGaQ==
X-Received: by 2002:a05:6214:224a:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f6e4801da4mr189887276d6.28.1746984478330;
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f47basm39766846d6.42.2025.05.11.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:27:32 -0400
Message-Id: <20250511172732.1467671-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_102759_995450_1685EB31 
X-CRM114-Status: UNSURE (   8.97  )
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

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
