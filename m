Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0ADC30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/jm6riFCD/8jzt7cqy87ZqS0yq77/ceEXzYBNMpYD4=; b=gR9nNjraabwK3h
	GGf3nTVTfB8AYpNNGeegChrctpWoj9YgsAFC4sOTEAVSJyMpJTEnOHMTVs41zVLrmC8MYh34lE8RV
	3C7bxboGTPtruOVhDMqWQHt8Gtgk3o5zNIJIUwliL60BtFr+wCVRg+Ber5/76UrGCgzJ2KvhlWAMy
	Q1w/Gbb4eT7cizP5xqyZv5E5vkEE+lE4fYfeNu2ZHYNm4e6nN87LLH8CF712ggzqMxnqqYF84Dbq7
	SExz1/Xz0/gkWHqMqM+H3XHMPgiZ2vEYusm2vScHUhHP422rqZO2YONhfFacdOrqW5pIBt46Oy2VQ
	n5od/oLRmMOnsJofN9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdx-00000009cIb-1u4f;
	Wed, 03 Jul 2024 09:51:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdG-00000009btw-1SjK;
	Wed, 03 Jul 2024 09:50:35 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57cc30eaf0aso1639852a12.2;
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000232; x=1720605032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=Zit7Ftu2++79NmHaL/Gj7IaYbixhDs8Qk6HXstAf2vgeA9YRxxKNKS81atu79h7kuT
         eXO3sK7ZKLE7xTO8GAO4b7PEVLrg/enlTNUVoFqed2excftdSgvN+mHWB/47gHKtjipu
         YLj8i1sHY83yOdgZWzMFu0S1om9suMc72gxdeTLPpwEW7e94SDVFkl4fv//k1wJLpWYW
         a8UhTkUY5bDzk6FYQ/prx84knF4R3inIZxXpzXFndY6ZEmT3oXaDxFOOSExoZdMmNtSj
         gH0SBpwjVhL984uAAC1lRRlHL/lCHLWSwnwPQXbUwF4pxSe3je6DmbyFC2YUtvJSOd3U
         kawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000232; x=1720605032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=BGRptz4d74h7mTR52ULvv/mHdSd0SCoKv7TLHGT48wg6uBdHUHF1CGU2KaIXq5iZrb
         2yxLocQ9yNW0oWnVmJTQ/g/FbNbAmNo3aEn0gOtjFkQ3nf0pzRgqyYbLrkRsSuFmK80p
         LjP/WJJ1dAP8E0DpWVJgKvnt9DRadK64iL9eAmxvrFu6PN0WiM6LwrIr6LmBRk+MTTrZ
         U0rqRl7lyfKI979MG2U2quVdbA0HCcTQ+S9GCSltfQYKGZ2bxlt2EzAK18jWqxd3RAi4
         M1RIzndU0tlZbkB1h6rst/EI/reZQ++/D9YEtjXvqqM2YVtaH59nmv55gbQd5BmG8wa/
         jaIg==
X-Forwarded-Encrypted: i=1; AJvYcCWiF2vEqtY6jYtE+IMCP9uyXM/oZ2DnUC9HslRB1INxGs/ah+/SOMZv2yrdFxKPAin0FfjHlGmXNwL15Jmg5eP4dIw6EGLj0jLdAAuzxZU7iNxuiio=
X-Gm-Message-State: AOJu0YxVBdVptOSc8XxwbB8uQ3TiEG6RnhsMuvGW2eJG5qqTWn2McIFw
	UxTGfi20BGlxNelGqWq4FUPuFSzz7pQrPJA2/vJpvh7duVciMtVLzN6ncNEs
X-Google-Smtp-Source: AGHT+IGs/WDtbZIXTR4T3vygKaznx3++FpGKeIUBPGN/fnT9vd+Uc+Jd45wPLlvNWdhc0V3hB+BFGQ==
X-Received: by 2002:a05:6402:1cc1:b0:57c:7c44:74df with SMTP id 4fb4d7f45d1cf-587a0822c1dmr7791768a12.29.1720000232375;
        Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:17 +0200
Subject: [PATCH 04/10] clk: meson: c3: pll: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-4-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=87EEyGDhqMM4XSc2dnrLtfdRuLpnYLj4dPXzZjLB2bE=;
 b=RRDOpnPm8XSIvDMG7UScdHDXqikzkMcrNLmY1ueozOmyEoM6oRCDBKdS0sxGWYXstfh9vXJrP
 yRZGKhFD/fLAt32CCD3d5+xukZJvqb/EN1KQc39Rdh40+W9lXA4SAtY
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025034_431763_238FE107 
X-CRM114-Status: GOOD (  11.74  )
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

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 6d5271c61d14..f09f4f7b46fe 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -678,7 +678,7 @@ static struct clk_regmap *const c3_pll_clk_regmaps[] = {
 	&mclk1,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
