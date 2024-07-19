Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19833C3DA64
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlXYWy6800QzvBQ3XyaxKxYLu0FjcoNsurSJaNw6zqU=; b=dj26YIl6W0wEL0
	pyA9TBlouIm+HkdKm1Kc1GvCudIRCVNc0wx8IciuDTCerc2uTnw1sKA/65T1/6la87RpTmzbjHk4f
	r2Uju81RWQLyu57zuC148cJcir1jARoDCdzFDOOzDLiRZHQnKO3sypB9bXJKy/LMyVI5uvcXmW0zd
	BJTTqXxpo6jKjChlmsQWXnS/LkqyzXfPICewjnOnj/RkzjUgv1+ej3ES8mQc42RWigWGJrDFWzHMt
	rtXiQgz79egm7+F+UDWIVUkQuzRqpoJWamv/85fPOl/LedvQnGwq8IK77QbH/PucGA5oZnZrkUEO9
	apaL7784dKyL9mTluJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUl7a-00000002QWA-2gBG;
	Fri, 19 Jul 2024 10:45:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5c-00000002Gc1-3H2t
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:39:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so380787f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381987; x=1721986787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jh83wOtVueGX1PE60SDgHxPA51mTtiJu8dK1JiG1H8=;
        b=NqOKgKD/qJFlWoxvsAZG0ATW472fC5GQsJ35dYztiBu5P1Id1UJm+VZmpzliNhuUVg
         YZwJlVyD84JDqPHhByTMyD3ashH4z1SSNqykXKuDPr0xmFqUIm5aUOU2c2Pc6TsbiuLd
         RaMYQ5QA4RG8sLn7n9cBaZ9T3A/5Aj27EDthkI9yk73dQCTfyivJhRjX3p4rWzztKJl5
         gt4ibbah9gpAKehkTP7pM8zYkg0PbhHTUSJCc9hYZ3SrhY2UjhD+XLfRSb4RZL6EJ8YW
         ToK2wZ29ozLJBSwn9IvwV/wwP92hzmQiHs7jboR2VaMj+2cUMLyR1MNhUmT1YAD2FBYs
         xexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381987; x=1721986787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jh83wOtVueGX1PE60SDgHxPA51mTtiJu8dK1JiG1H8=;
        b=L5MAEPPy2ev+D59Y/oUG5gTvuoAavZvX76Jj/DbZH935R0qt3AutZEJ2zWeXSA13Go
         SaXodusEHlkoL4kF9vKLTm2aSKGS4kYSemPfDM7kTWakIJ1tt/jt/WJ7Jl10dkYbWzna
         rFswjj5KlC4WbB1fBVLO9nq8o6Gvbr0iaEJy4ncHYGyD6Lyofkqab5hoFj7ZekJSvLgj
         gggKJavtfsNrdEm0PR0/sigjTqX4JcF3semUO2zL3gYsdp6Z0lzRlDZHGsKNZDDlrQdD
         HRDKee87srgiw0MhZCI1F2cE6pCSOmw5lXIAB1l9z2gg3Q1rN0w6k/rfm7v/MIT23NUL
         +Jyw==
X-Forwarded-Encrypted: i=1; AJvYcCXjlpq/PJ9gUMfBzQlT3gpBRy+KNUGRYLUEZNHi+r+TJBfHPEQQAp600DBjA1JJTpyYpN6uLdIAL+Nzk1/LD9UZACm9jjn2jEnBZdXJ4c7I+co=
X-Gm-Message-State: AOJu0Yx/Gjz5bpvWmS/FqLhGhuCWyRxjhoH/4nJxkRtY/opmOwIgtlSs
	X7zbaO6UIAl8PnZUcdcbKBkBRIEIMnh6mzG3wRsE+nkRx0/hQVWB0teS35cRcwNygvNktjR21yF
	wugc=
X-Google-Smtp-Source: AGHT+IGoIHykh7qghcwtZ6qPH84GebsqiBiwyg8/MutBl/iiTMSTkOqe8DvSeJARQHPKgBnAI06U+w==
X-Received: by 2002:a5d:6485:0:b0:368:31c7:19dd with SMTP id ffacd0b85a97d-36831c72ab3mr5458249f8f.5.1721381987400;
        Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] clk: meson: axg-audio: setup regmap max_register based on the SoC
Date: Fri, 19 Jul 2024 11:39:31 +0200
Message-ID: <20240719093934.3985139-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_023948_842096_4BFEF26A 
X-CRM114-Status: GOOD (  14.07  )
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

The register region of axg-audio tends to grow with the addition of
new supported SoC. Mapping slightly more has not been causing problem
so far but it is not viable to continue like this long term.

Setup the max register based on what is necessary on the related SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..2426f3dbb7a2 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1726,11 +1726,10 @@ static const struct reset_control_ops axg_audio_rstc_ops = {
 	.status = axg_audio_reset_status,
 };
 
-static const struct regmap_config axg_audio_regmap_cfg = {
+static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 struct audioclk_data {
@@ -1739,6 +1738,7 @@ struct audioclk_data {
 	struct meson_clk_hw_data hw_clks;
 	unsigned int reset_offset;
 	unsigned int reset_num;
+	unsigned int max_register;
 };
 
 static int axg_audio_clkc_probe(struct platform_device *pdev)
@@ -1760,6 +1760,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
+	axg_audio_regmap_cfg.max_register = data->max_register;
 	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
 	if (IS_ERR(map)) {
 		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
@@ -1828,6 +1829,7 @@ static const struct audioclk_data axg_audioclk_data = {
 		.hws = axg_audio_hw_clks,
 		.num = ARRAY_SIZE(axg_audio_hw_clks),
 	},
+	.max_register = AUDIO_CLK_PDMIN_CTRL1,
 };
 
 static const struct audioclk_data g12a_audioclk_data = {
@@ -1839,6 +1841,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 	},
 	.reset_offset = AUDIO_SW_RESET,
 	.reset_num = 26,
+	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1850,6 +1853,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 	},
 	.reset_offset = AUDIO_SM1_SW_RESET0,
 	.reset_num = 39,
+	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
