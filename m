Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD31C83F04
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km+SGHXJ83/kLqeTxvhbTvwq1iF6DLKPfABztsdRnRM=; b=BNGqqpGiQFg0cf
	yn+3LVts37y0KlwyvPkc7G4ZQ+9CmEzXOtB0HHmyJVrg8SCKNRnyicqR/WuisqaEquLOTZveCcJHB
	XmXtBNEEuh8dSXtenpSHSGaeBmsK5nmVil6VV1yiTmL2z09dzV2z6xw4FI3L12XuU6Cib2vD5PyBc
	dPObOO3ikUriioMg9tFE4deYbqCHNBDe1FbB0p9a4FNPxg8oQxlR2QqWWmjerL5YwQD8oqj7raBBQ
	xUUjr08mTLYSw4WpO5qOi+5Sz+iD0hR9QIDAwjU7boiMWBCT69fIS3W7JtfI4xKyOD7b13pAkshvP
	vMbkRNkoStXIHAbT1+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VJ-00000008zUX-3DG6;
	Wed, 02 Jul 2025 16:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN7-00000008n09-1u5a
	for linux-amlogic@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=; b=TKHIdqUhJ9h5Yz13XDmgw/A6iN
	lVW68SwDxtkiFJtbuBXvO+cRQnHaOhC3IqosnP0H/qmRH7P7D7vpY41cPuNdlsGBxXiniHeomIY1A
	XRb3rtejnczH7/VIgZBDtV4jWsU9p54n3S2wpRTT66wgN7w0cYVpNIET8jahkIiY1TpG2sx19kYIu
	aiA3M5g642yXGTYb9Fkj8+ihd8y4hGaWOedKKik+RPOFFr4zZrFCarfmyNvzV3Xr4OKKoBtJ74LCB
	f/BQQjC3HUtYlxR8I48BPG6Z81iSPThdoecj9obFoDdP0okiXrUf1HUglSiEpSmxlohK71pjNNtkQ
	HbSICPKQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN4-00000007TqO-2m1u
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45363645a8eso49320715e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470057; x=1752074857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=islC3RIQvzLXTdbHOZbqGeRIg4rJQJRr5zAvbs84jemLFOl6rhgMPv0XSdClcgoQUT
         zBQjqr7J2ZnKSavNLudQfcWz9DbDdeoNkmWT7MzFe2kNxT291kOxD1DJJH9k4o9lf3im
         mVbEQjLcYlV6eBnO3hjHoU7nD0x7SmD9qIGWy8su58st55/aoieLHIvwtsdt+j9iZgK1
         16xFwLb5jCWDPOPgm9HoLpb3JiAr25jtTmaKKbf3f09joegW7LHxRGifErqQsfz19KJz
         I+21MXvtaz+C/SoLn4shiONZFZHQ33tvGgvbw7qfv4Fvlk+FTnsgfsXm/O8lNdaqm0WZ
         /4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470057; x=1752074857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=NM0c8PT/xKzijUMYkPWYbvg9VyH8QO8ah13QgcpyLXNdlao5ff4H4ZeWV4xkBRHhjs
         zbYUuARb6MTlqdz51wvPCVf3KDEcezbK8aBVcXdtEgXISCFFp43B88/1K6EkDMuWYQ7A
         4IE3yLvPbiAcZAMK9K0KS69kbkt8N/BmCv2tDsQGVVkUVpDlPolBzvU0bNjfWwCyWv5R
         VGeSOj/u4FZdvhGpwrKuCbxCPhV2bSVWbJ0qCqfjMqwMgwbkSeSVoE/xTIsd9Qf6ouo8
         31cLXeZy64bNAuhLKQgXmeWhY662jtHkMr2VIA1vA70QNntKOxn9VAreV7Z5WQ3FOwRW
         y+hA==
X-Gm-Message-State: AOJu0YwTFxilBMl/DJaMOalKfdNu1bZtUQRCFZ5eeBVv2hojSPDLqGHE
	fxOFTCf3B8n3hby0iilpWhoGZyUtQPYo7A6JTiBhhTDqeQwuJBdYjTKUYULz8XKv9Ys=
X-Gm-Gg: ASbGncv8Ze7LT2cT5zYhw1kam0ef4XWzQSCzjreVwRo4HG2mRjQxFNhmZiDG/o6CAb0
	eKdrIPHFnwg49G0ilr224EKrQhDQXCinJe92BNlJ6z8s9RmJqH22osWk1Z/E5JhhVUl1M8Gkhsu
	h7hE+8ZXR1pJn0UaUryGH1d0wCcUt5SdZ9rXi94sADVMXKoQj9f8dcRjl4sBcXuYdotjxC9ncm1
	I1mEXbHjS1RQ3ywf1G2dQSizlN+HJ7CEfNQZDxaTrir3ZZnCOtj/nXVtDsF1QPnrgreLX/tJWd/
	gr0E+9isZpnSV5672IVeVftf37jr1ltWKV9FvJmsCmikXhH4EFaBYSBCxkRrrGDBfi9M+YtmdH9
	r
X-Google-Smtp-Source: AGHT+IG5Nvg+4XJUXbEmvNpTdwBa6VKhe/U9qpL2tS5X8/kLxbQUPadTzNBqGqY2Pp9MJ0NtvGPYvQ==
X-Received: by 2002:a05:600c:c4a5:b0:453:6150:de50 with SMTP id 5b1f17b1804b1-454a9cd94e6mr346715e9.28.1751470057461;
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:22 +0200
Subject: [PATCH 24/26] clk: amlogic: add composite clock helpers
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/M8MpgauqMch296c/UgbjKdCbz6RmqaG7+f
 uOBnQ9nC0yJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzAAKCRDm/A8cN/La
 hWnsEACSnG22dz/mQvVC16u619+gXbE7D/A+OD2TuY4CL7XBrH7HphO3oVze0AeyGJ9+rVtJiVX
 ssivYxqO2B7DNqkWcJovuYcX8hyDwe8UYGhQQeD5mVekxQZR7I4wRvydAqCm1BSxYzP8P3vjCk+
 lBF95dmWTj0knQsem7xahxacMQMvGJDZFQ2LgXv1pz4Q4S+8H4xkSJYRIbtugP3eHNID+Y2amyi
 XvNA04JFI0bOG0FkToEcxsLHHn99qTf7Dle566H2NHgOneBNZWVCvCaaYAW0lIRn7ZoFYN1R7qs
 3UEQL9IoK2qtEGynnokTneFzeD6z8U/KcJBk48osJBcAT+asMQQmREI0bYt/jq3DcNQY1Cm2cHT
 /T9DItBlCT3FVsTMib1JVK7RgHRvg8tZInVzXQoY2yCWM2s6i+KvFDT6doqHLuyh9Hr3Gj/6CjP
 waFGuO6dxHv5dB3vEtKtiQ5tyKkagvQ6c3ha900qhiGD/Kle2ZWK52DDairL3wXJb6d0+phn1Uf
 7T4l8gXupb1X08JGdOrqZ1xYjV9uKUNECM9K4TYjF7yn7QD24AjllGAPIx5eTECYmEzTHZG8zEE
 1YPty6nC3eOBIsatncgY27yluN5J+LVZprK7yvi40UNAtlMSsYrTkkr8cWVKD6a9SI6IqSMVwEA
 HZkuxOWcI66bCVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_162738_902405_A60B54A6 
X-CRM114-Status: GOOD (  10.11  )
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

Device composite clocks tend to reproduce the usual sel/div/gate
arrangement.

Add macros to help define simple composite clocks in the system.

The idea is _not_ to replace all instances of mux, div or gate with those
macros. It is rather to use it for recurring and/or simple composite
clocks, reducing controller verbosity where it makes sense. This should
help reviews focus on the tricky parts.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -48,4 +48,61 @@ struct clk_regmap _name = {						\
 #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)		\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
 
+/* Helpers for the usual sel/div/gate composite clocks */
+#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,	\
+		       _table, _dflags, _iflags)			\
+struct clk_regmap _prefix##_name##_sel = {				\
+	.data = &(struct clk_regmap_mux_data) {				\
+		.offset = (_reg),					\
+		.mask = (_mask),					\
+		.shift = (_shift),					\
+		.flags = (_dflags),					\
+		.table = (_table),					\
+	},								\
+	.hw.init = &(struct clk_init_data){				\
+		.name = #_name "_sel",					\
+		.ops = &clk_regmap_mux_ops,				\
+		.parent_data = _pdata,					\
+		.num_parents = ARRAY_SIZE(_pdata),			\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,		\
+		       _dflags, _iflags)				\
+struct clk_regmap _prefix##_name##_div = {				\
+	.data = &(struct clk_regmap_div_data) {				\
+		.offset = (_reg),					\
+		.shift = (_shift),					\
+		.width = (_width),					\
+		.flags = (_dflags),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_regmap_divider_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_sel.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)		\
+struct clk_regmap _prefix##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_div.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
 #endif

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
