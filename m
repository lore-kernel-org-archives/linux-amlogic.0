Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63407C30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J38Ip9h/d9vS5OhtXAINvJRZP43Vk2d2TiS/yjiJ6+g=; b=GOaQbXTJBFqA2M
	4ii+ZRGPF66LDDITYbVh/ZifjtCCTGODOchAAxJTD7WDQPqOJyYMLJuiNKgMkESGjOfkmjAaxliDV
	8kNYHJ3PbChOH2/tscWv3HhFGxGt7/2nPmA3YbubsfaQy4E0N1GKGgS7mSY3jxPmm/5jfqjZHtPTH
	gzyrlGKOZT2U8vVHK1DIbarAS3s5EA1nwUcapM3kYYUgMG7l+glpI46PI4i4wMkJdJyTWll/30ujZ
	/TNg2n34EHvCF2O8v7WDpy2lcTvgDPITvDW/lEx5J+/p0Itu9tVH6gJguW5IZNFucRR7bkfc5iyjf
	inWcAP8aeYmFkiDXW8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOweg-00000009ckd-40R1;
	Wed, 03 Jul 2024 09:52:02 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdL-00000009bxW-44qp;
	Wed, 03 Jul 2024 09:50:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso3158203a12.2;
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000238; x=1720605038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=Ui7k/LtoK+52wYmXJt7E4BRXj97gJ97pFAUy4BzNQXXd8Pj9czp21T+yaVOttnJVME
         TLYVGIGnFgChSJvifX045IaNGIIX+34+gcrMuu2a2fI9esAl1MnyAEFbxUsQa/0Icy8I
         rNAqG7kzZjsWdUvJWcTnuXZzzOGIr2Ktc8lypny/Aq/aFV1FZkkcW8+Q0EfhhW5oOwFL
         /n3bFPGAtEhL7q4pqRtQduxZiDv+xIXJurZ6b+PoqE4XFFekf/E3ZcNbm4XV+6sASaK8
         YXD+DGfZrwDKUMMphM6evqfMg99dVu2NxIdY8Dc3ZrdGoWC3/CEdQgtPbtr78Bzm5//2
         rAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000238; x=1720605038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=gv06PhB3ijFlzgSsZy5QUX4EDgLNhZOjn8uWFn7baR+Txfwn1CbWM/4zjl8Ow0qATc
         5ohxY8xh680qbFLgDIgfnXadtec8ltxoF0o6wesqPofIBdpWZbDifmvOYrcYcPnP43FQ
         5PQ3XLKQwjyHWxcphJ4TUVgVAOrk+RS3r+cacsgm9xZ5P37AadcQkcXsgXcECb8z5Dcf
         e3H8GexOVzGuZDxCUETK+vva/eHEQ5TsUmau156bQPWIKBggOwY4WNRMy2Z4SAkxm87l
         aHUmAtxaqsODNbVXyTejOZ02fmiJkmDvNqEpvdPYi0uQBpznYDx/4nuvsPgAKlWHcl5M
         R7zw==
X-Forwarded-Encrypted: i=1; AJvYcCUXGLKANVtJ/SpN59RWbu/sH3cdJcP3VWPDTsUI2lwNk5mdwMX7RjOD7m5JIsbzegUxVDJVFphLUuJe9WxPBL7ei0NQP4xUnbko2qVsc6XSzObVN+8=
X-Gm-Message-State: AOJu0YwBMOjOmbgRsnv+k2TwafW2rt4VjipcbUMxaxhQnOChaLjSSd9Y
	4zfoSonCnTX65CXOBoG5meMRPPfYY+Ay/OZxvRu5+lDI4pH70Hto
X-Google-Smtp-Source: AGHT+IHDBJT3Q4Laj/q87YJoetkDqI5ofUOXbXiuW/rDGosGYXbLBVOAupqJHnTVnz6rBOrgARQkAQ==
X-Received: by 2002:a05:6402:27ce:b0:572:4fc3:3a28 with SMTP id 4fb4d7f45d1cf-5879f982ffamr8309648a12.23.1720000238458;
        Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:21 +0200
Subject: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=1251;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=r9UG0iaRfl1edz0iDrKl1TCA7udEuIQIOzcFOl/X/K4=;
 b=B7jdNvHm/5Mt3ktcfDeM9c8KninOBlgFk8K0PVOq+LB2WsKsc0vbO7U/7APUKe4yiJSNoyh1i
 HlwYoMOYWxNBOUay+b6kvtC6NNAQ4xpzKMHyksGClZZg3Nd+T/kDVWb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025040_188973_42529644 
X-CRM114-Status: GOOD (  11.27  )
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

`lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
are not modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 3693e47d548e..9fd9498d7dc8 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -23,7 +23,7 @@ static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
 };
 
-static struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
+static const struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -41,7 +41,7 @@ static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
 
-static struct regmap_config lpasscc_sc8280xp_regmap_config = {
+static const struct regmap_config lpasscc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
