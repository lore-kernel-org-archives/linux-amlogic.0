Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFEBC5478B
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX//zPR8a3W+U0O9lEHo6yqATp4i8UtU9cvd5Q+U7x8=; b=XAVQmVsC+YNKxR
	FIewEv4wVNWQuWJeCdyFVsOLQF8c913aoPchw8J+dcoheQJ+0lFSq/ydcUes015GAG1kaGETBBRw3
	SczvKoT1TSM0kdJvyV6saxl8ng6FcCIlgZCXnUGzukfwiHpGJ1GUgwRTPOYoI6/4E34cg+RRL6s++
	a9vK3Lo6YKmT6qdsw+/LCeW5nK2KH2wOp7jLJkKjGdyzAnI01ItpaI8uHrbLOJq3YNKEyJW/wIpFr
	/qYcwrWnUxuRYrIMEeOAa0HpKi9wbkzvXqEWfNMOaZujao8JfbanufnV+RRc7UrYpC99QTRUvreBT
	0D+LDoFwWbH5GwOzsvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGe-00000001QSS-2cet;
	Wed, 21 Feb 2024 15:12:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGa-00000001QQF-3mhd
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4127190ad83so11074295e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528331; x=1709133131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDzlDzZQlyRp4tHPz70HDG/j2aqF8PDbUcJLYunNGlE=;
        b=PfYwXGLuIYDtd67JxUgglrszSk0mqF/wnPnKOz7UsHQj6T190BOzBebq8JysJLbbBX
         XwioyVKt+XxfdLl1xf+WFeuNctRwGXJoBfqp++xT2EQA3FHMFptQayKIHKfU3N+fG+BV
         CP3wJfG2Lq6ISePYt3m8Epvs5FzwlXYVtlLhq9GIfnNmTFgvlo56freQCgf5gW2uak5M
         3JIYAsABEl7kR9jBWxi+IfbPIdUp5/FtG6VOaEpF6O2lU0ZOBI6DZbqV9I2gH9voJ95x
         cCB/r4iCZy/jWiTdLp/wj/Z7H8JzG2qBB0mF8+gZ2wmJPl26hw1vVHAlaEL/OIfgCC4j
         DgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528331; x=1709133131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDzlDzZQlyRp4tHPz70HDG/j2aqF8PDbUcJLYunNGlE=;
        b=icA3PCwNDyENdLERA590JmKKzliDdMUDNGMVZgENtvA6d+RjqZuaCBAooF1SNS3iVM
         9kzxiic17rNR9FoRViF+og4B8/KuseuzzIsGutuWS0zu6/7QMTZzrR7rcpPassUnuoCQ
         HMMg1BDk3+qSA3szi63hurVvIhrvemBmLnzfgF9LgWC9IkzV01efz/36Prnr4zISBQ2t
         OK56QKPhtiqToNGv9V7Dz3xDZ/yUzQDpMg3HlpEEIqxYINNuuBiGjxbFSGL8SuAbQN3Y
         S0LZmiW+tDi2v3Tw41vu1e9QtlGzJxkWyg7Y+vOCx7uwzejpOZ0rl3PQ2Gfrru2a5i9m
         mlTg==
X-Forwarded-Encrypted: i=1; AJvYcCXlkOvcvYimkcbrFA1khjBeyieEjC4u/T/EVG1ClOAif1cIECPCdTZvat/pzmTtO0QIzTgQcivRyFC/rSU67VZpTc6vMMpIiesIOON4mq1LwMw=
X-Gm-Message-State: AOJu0YwuHhoKUhRXTKf2WVmTu78sH23EJ4S7c0vlwuSJ1jtcEXZPwfiu
	2pVo2s92RWSlqiocldNPGlztX+87a2bb1+G8B2nfq8dDrHwIChDNktOhqG6fyYU=
X-Google-Smtp-Source: AGHT+IFVjoug76sKUiM3bxfin/b2jHTnn52j44PDi+C4u8iMcyLosuU5W9Kxm6Kr7b2Go6+sQkLLSQ==
X-Received: by 2002:a05:600c:45d3:b0:410:2d72:63b3 with SMTP id s19-20020a05600c45d300b004102d7263b3mr13477876wmo.23.1708528331144;
        Wed, 21 Feb 2024 07:12:11 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v5 4/5] pwm: meson: don't carry internal clock elements around
Date: Wed, 21 Feb 2024 16:11:50 +0100
Message-ID: <20240221151154.26452-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071212_964666_A3EA258F 
X-CRM114-Status: GOOD (  13.36  )
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

Pointers to the internal clock elements of the PWM are useless
after probe. There is no need to carry this around in the device
data.

Rework the clock registration to let devres deal with it

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 73 ++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index a02fdbc61256..fe61335d87d0 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -85,14 +85,17 @@ static struct meson_pwm_channel_data {
 	}
 };
 
+struct meson8b_pwm_clocks {
+	struct clk_divider div;
+	struct clk_gate gate;
+	struct clk_mux mux;
+};
+
 struct meson_pwm_channel {
 	unsigned long rate;
 	unsigned int hi;
 	unsigned int lo;
 
-	struct clk_mux mux;
-	struct clk_divider div;
-	struct clk_gate gate;
 	struct clk *clk;
 };
 
@@ -419,9 +422,14 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 
 	for (i = 0; i < chip->npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
-		struct clk_parent_data div_parent = {}, gate_parent = {};
+		struct clk_parent_data pdata = {};
+		struct meson8b_pwm_clocks *clks;
 		struct clk_init_data init = {};
 
+		clks = devm_kzalloc(dev, sizeof(*clks), GFP_KERNEL);
+		if (!clks)
+			return -ENOMEM;
+
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
 		init.name = name;
@@ -430,16 +438,15 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 		init.parent_data = mux_parent_data;
 		init.num_parents = MESON_NUM_MUX_PARENTS;
 
-		channel->mux.reg = meson->base + REG_MISC_AB;
-		channel->mux.shift =
-				meson_pwm_per_channel_data[i].clk_sel_shift;
-		channel->mux.mask = MISC_CLK_SEL_MASK;
-		channel->mux.flags = 0;
-		channel->mux.lock = &meson->lock;
-		channel->mux.table = NULL;
-		channel->mux.hw.init = &init;
+		clks->mux.reg = meson->base + REG_MISC_AB;
+		clks->mux.shift = meson_pwm_per_channel_data[i].clk_sel_shift;
+		clks->mux.mask = MISC_CLK_SEL_MASK;
+		clks->mux.flags = 0;
+		clks->mux.lock = &meson->lock;
+		clks->mux.table = NULL;
+		clks->mux.hw.init = &init;
 
-		err = devm_clk_hw_register(dev, &channel->mux.hw);
+		err = devm_clk_hw_register(dev, &clks->mux.hw);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "failed to register %s\n", name);
@@ -449,19 +456,19 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 		init.name = name;
 		init.ops = &clk_divider_ops;
 		init.flags = CLK_SET_RATE_PARENT;
-		div_parent.index = -1;
-		div_parent.hw = &channel->mux.hw;
-		init.parent_data = &div_parent;
+		pdata.index = -1;
+		pdata.hw = &clks->mux.hw;
+		init.parent_data = &pdata;
 		init.num_parents = 1;
 
-		channel->div.reg = meson->base + REG_MISC_AB;
-		channel->div.shift = meson_pwm_per_channel_data[i].clk_div_shift;
-		channel->div.width = MISC_CLK_DIV_WIDTH;
-		channel->div.hw.init = &init;
-		channel->div.flags = 0;
-		channel->div.lock = &meson->lock;
+		clks->div.reg = meson->base + REG_MISC_AB;
+		clks->div.shift = meson_pwm_per_channel_data[i].clk_div_shift;
+		clks->div.width = MISC_CLK_DIV_WIDTH;
+		clks->div.hw.init = &init;
+		clks->div.flags = 0;
+		clks->div.lock = &meson->lock;
 
-		err = devm_clk_hw_register(dev, &channel->div.hw);
+		err = devm_clk_hw_register(dev, &clks->div.hw);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "failed to register %s\n", name);
@@ -471,22 +478,22 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 		init.name = name;
 		init.ops = &clk_gate_ops;
 		init.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
-		gate_parent.index = -1;
-		gate_parent.hw = &channel->div.hw;
-		init.parent_data = &gate_parent;
+		pdata.index = -1;
+		pdata.hw = &clks->div.hw;
+		init.parent_data = &pdata;
 		init.num_parents = 1;
 
-		channel->gate.reg = meson->base + REG_MISC_AB;
-		channel->gate.bit_idx = meson_pwm_per_channel_data[i].clk_en_shift;
-		channel->gate.hw.init = &init;
-		channel->gate.flags = 0;
-		channel->gate.lock = &meson->lock;
+		clks->gate.reg = meson->base + REG_MISC_AB;
+		clks->gate.bit_idx = meson_pwm_per_channel_data[i].clk_en_shift;
+		clks->gate.hw.init = &init;
+		clks->gate.flags = 0;
+		clks->gate.lock = &meson->lock;
 
-		err = devm_clk_hw_register(dev, &channel->gate.hw);
+		err = devm_clk_hw_register(dev, &clks->gate.hw);
 		if (err)
 			return dev_err_probe(dev, err, "failed to register %s\n", name);
 
-		channel->clk = devm_clk_hw_get_clk(dev, &channel->gate.hw, NULL);
+		channel->clk = devm_clk_hw_get_clk(dev, &clks->gate.hw, NULL);
 		if (IS_ERR(channel->clk))
 			return dev_err_probe(dev, PTR_ERR(channel->clk),
 					     "failed to register %s\n", name);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
