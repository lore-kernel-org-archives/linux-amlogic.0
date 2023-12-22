Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D592C46CD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fsAwURBsy/8JRWllZRTVfcog/Fl6B+EyPXlf8VQMkk=; b=3B8sBGy64186j7
	Q9L9ltiGtYYwCwM1AYuYT+xG8W58D4nVfh8SLOYARoGHr5pw7xyn3zILPbuHK+7JHvmthx0EtOcfI
	/ss02urL/p1YDwHL90caXM9vfygw7Ku6CaHNjBKEAe+G0QraE44fl7lVLvIOrOXOXppEbSib6cfI6
	Y4jpuqxzS5VNv9smUw6bb9MDhOxSs/tCfC5N2GgkVDuvLUjLiXX5HZW5oPnxoIBUZXsqGrqaaSWXR
	FVc/GVZKEMhRpd34iYqSATHA5rOWXrqB1T32xR/kUY2+gWOOscX/Tx/ndZ+lElgetKzNSdQmInzZe
	zjVp7QND7ln5Cdfgh33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdX4-005eJP-0U;
	Fri, 22 Dec 2023 11:17:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWz-005eFo-0H
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33687627ad0so1386237f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243846; x=1703848646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uCw/+6SV9XRUaerzvd3Y9nkib6uwp0dhEr/geBlgA0=;
        b=WgBfU1TfEih5dVMQhzuhgNivjAlJVEh2+G9MwtZJUIg3Eg6GsXgJu+YgTj71BZpz0u
         nB5pdafc7xr5k4FDbG6PNByxkGw2S37EB+zN3dvL2eoNAtUXE2XCBrIdioAWECl64o1j
         vnVW34fJ+tn8u151wab+cB2ap5qt2yORo4OuhGSaR0Mww0EvkrMZkdWsX+WyN6n29Nv9
         LxaSq0ZRJWLZFznfBkUeMDljGNBd9qXFsjLwVJjwQL7EQo56VfEC5JOZbJg7UfWex0Vm
         2rRFlsVzqbSKP930TEvSqs/Pifp+IpGorGZFwxnq1kWeMGcm4E/qCcEe6Bb6ARPlwCly
         J+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243846; x=1703848646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uCw/+6SV9XRUaerzvd3Y9nkib6uwp0dhEr/geBlgA0=;
        b=dpdzfHP7sENGoWjnSpt+8gIB7qgW60Ueae1bY8Tc7mxGpsL5I/z/AjQavYvelPzQ6V
         m7pJEc7YZPvoRp/BSQ6wnuK7BA4nkaBEThAFcO2Sm7Y3dw91x9SPVTx9buEf1TthlQSj
         p4L5c9Q9gMr8sLlpoOfzQ7FiV/MT/yiM6pYQU5f4SpOSwl0PlC/7hF10WlsTh45ohaf1
         FO7SOiSNDlTg5Y639iKLp4tjH4UANtWQ9AJriFYsVO6ynwhrhzlvMxngHO2MsG10HRHS
         MaB/q8yKsvAPd9OqpvE6oEtv4ysgJlkub3x3JlB8/UaYX0BBFViETKvk/lGvudjxNu9j
         kC/w==
X-Gm-Message-State: AOJu0YzII0HxEfs5IpTIHm4KY9WslzMWeI+09/G46eoMRRvRncmMTsgF
	5t8pE75S2VLTnCoS6EPBh3r2I66D4fZmsw==
X-Google-Smtp-Source: AGHT+IH/FkJeyB+QCBAK3KIexNgspcRHvmbo2VnQSOJL1p8eFeedvMBI24HYDGNtfxSdKKFgMUDsTg==
X-Received: by 2002:a5d:6d8b:0:b0:336:95d2:c64b with SMTP id l11-20020a5d6d8b000000b0033695d2c64bmr421842wrs.134.1703243845983;
        Fri, 22 Dec 2023 03:17:25 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
Subject: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements around
Date: Fri, 22 Dec 2023 12:16:53 +0100
Message-ID: <20231222111658.832167-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222111658.832167-1-jbrunet@baylibre.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031729_132030_122C6032 
X-CRM114-Status: GOOD (  12.44  )
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
data. Just let devres deal with it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 67 ++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 15c44185d784..fb113bc8da29 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -90,9 +90,6 @@ struct meson_pwm_channel {
 	unsigned int hi;
 	unsigned int lo;
 
-	struct clk_mux mux;
-	struct clk_divider div;
-	struct clk_gate gate;
 	struct clk *clk;
 };
 
@@ -442,6 +439,13 @@ static int meson_pwm_init_channels(struct device *dev)
 		struct meson_pwm_channel *channel = &meson->channels[i];
 		struct clk_parent_data div_parent = {}, gate_parent = {};
 		struct clk_init_data init = {};
+		struct clk_divider *div;
+		struct clk_gate *gate;
+		struct clk_mux *mux;
+
+		mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+		if (!mux)
+			return -ENOMEM;
 
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
@@ -451,63 +455,70 @@ static int meson_pwm_init_channels(struct device *dev)
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
+		mux->reg = meson->base + REG_MISC_AB;
+		mux->shift = meson_pwm_per_channel_data[i].clk_sel_shift;
+		mux->mask = MISC_CLK_SEL_MASK;
+		mux->flags = 0;
+		mux->lock = &meson->lock;
+		mux->table = NULL;
+		mux->hw.init = &init;
 
-		err = devm_clk_hw_register(dev, &channel->mux.hw);
+		err = devm_clk_hw_register(dev, &mux->hw);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "failed to register %s\n", name);
 
+		div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+		if (!div)
+			return -ENOMEM;
+
 		snprintf(name, sizeof(name), "%s#div%u", dev_name(dev), i);
 
 		init.name = name;
 		init.ops = &clk_divider_ops;
 		init.flags = CLK_SET_RATE_PARENT;
 		div_parent.index = -1;
-		div_parent.hw = &channel->mux.hw;
+		div_parent.hw = &mux->hw;
 		init.parent_data = &div_parent;
 		init.num_parents = 1;
 
-		channel->div.reg = meson->base + REG_MISC_AB;
-		channel->div.shift = meson_pwm_per_channel_data[i].clk_div_shift;
-		channel->div.width = MISC_CLK_DIV_WIDTH;
-		channel->div.hw.init = &init;
-		channel->div.flags = 0;
-		channel->div.lock = &meson->lock;
+		div->reg = meson->base + REG_MISC_AB;
+		div->shift = meson_pwm_per_channel_data[i].clk_div_shift;
+		div->width = MISC_CLK_DIV_WIDTH;
+		div->hw.init = &init;
+		div->flags = 0;
+		div->lock = &meson->lock;
 
-		err = devm_clk_hw_register(dev, &channel->div.hw);
+		err = devm_clk_hw_register(dev, &div->hw);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "failed to register %s\n", name);
 
+		gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
+		if (!gate)
+			return -ENOMEM;
+
 		snprintf(name, sizeof(name), "%s#gate%u", dev_name(dev), i);
 
 		init.name = name;
 		init.ops = &clk_gate_ops;
 		init.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
 		gate_parent.index = -1;
-		gate_parent.hw = &channel->div.hw;
+		gate_parent.hw = &div->hw;
 		init.parent_data = &gate_parent;
 		init.num_parents = 1;
 
-		channel->gate.reg = meson->base + REG_MISC_AB;
-		channel->gate.bit_idx = meson_pwm_per_channel_data[i].clk_en_shift;
-		channel->gate.hw.init = &init;
-		channel->gate.flags = 0;
-		channel->gate.lock = &meson->lock;
+		gate->reg = meson->base + REG_MISC_AB;
+		gate->bit_idx = meson_pwm_per_channel_data[i].clk_en_shift;
+		gate->hw.init = &init;
+		gate->flags = 0;
+		gate->lock = &meson->lock;
 
-		err = devm_clk_hw_register(dev, &channel->gate.hw);
+		err = devm_clk_hw_register(dev, &gate->hw);
 		if (err)
 			return dev_err_probe(dev, err, "failed to register %s\n", name);
 
-		channel->clk = devm_clk_hw_get_clk(dev, &channel->gate.hw, NULL);
+		channel->clk = devm_clk_hw_get_clk(dev, &gate->hw, NULL);
 		if (IS_ERR(channel->clk))
 			return dev_err_probe(dev, PTR_ERR(channel->clk),
 					     "failed to register %s\n", name);
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
