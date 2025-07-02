Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D307C83F09
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPlY55re+jiCDdwK0BT3TpPWnhVJGv1oUcFGu1YAn0E=; b=4gCzl1QX70XZl/
	MCvcKtZ2/df4WH3bJLft7sgCsfBJJGPZcb1bqknGXpG2IEUgYw3A2HhcnV3ZJEbMErtgPxhMhojtl
	uzxotTGEcHTEvh1n7yidkO1sc7f3Ms1WlgV7HdFa74sAdIuVzLT+uQRwpcPjier3htow6S5+2iku0
	c9W3NVDAPGV76WXBaeO4by6wFfhigvdBd+B6PLSaK3B2gHHc4JM6h9gIo8xOkn6R6VA0SfqyoMJve
	gQN8p5HptQSdQYMC7M7902sbW9DTQBN57Y87stjMS+2VmjEDzpAGcUZxCwrqKf/5/TK00wvyi2j/y
	EqNiMnBViUaBWBqhHYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VK-00000008zWI-3a9A;
	Wed, 02 Jul 2025 16:40:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN9-00000008n16-0m5O
	for linux-amlogic@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=U5S+iEa8IdsVyvXDRXqAUiD8piNfUvjAGL8/4g6Co+g=; b=oWiDuLS+nwARMVIh+xWSBblpj5
	7GEf3iqIeR7ku/x7vNrZ02f4PsSjwv9ah39BhpYKVoNNBbakDocxTy/nCI5HinRzNrIQ5v8/+JE+u
	kiW+P8dgVWt6DtGkAfcUnQmPVHLE5vBECxBwVYdJDvDXeAPKeRmLNiJTqIuNCYhb/19mE4pKZxF8P
	N004ho357g8O+Jbudwe+AvAFxM/r21RFhzLpYO2d0gxNtizxGKCxmCFzsbiViRzIbl2hxHWzqGkTc
	r4Ka4uRei5L0KIiTUfXTInA3sk3t8dSmTHSDItlYF4qOjN6eU1o4Pg1+eH1WoOxnhUH6wSl9hXPQN
	Fkrjds+A==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN6-00000007Tqd-15hz
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2925606f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470059; x=1752074859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5S+iEa8IdsVyvXDRXqAUiD8piNfUvjAGL8/4g6Co+g=;
        b=JJYec5iPi+ILF+3+a2oJfoSYkMEvSbQCmpKCTG2ePWKBVG8r8r+3BMHRKxnrRnXFTl
         /bnXOkhJ0wKg53F+KDYH7Umm5WIpqFMByuLNe5uKHkRLyOovPZeAYZ7sDM8aB1jWwWLX
         qt8F4f4kNXhU7+X/lZbvojTbPLXDrAavegq610DpQYYkeRXq1SUQhDUdwNV4rVUdV4af
         I/RcL+/p0KCcWBzzqV7H3vNLvZjKzHUHfbpGJxLMU33cvTJW/gtHThbMzzBjXm9eYPO6
         19dt0VeyKgiaIslFCBMfD01XEtVtj6A2vuA1qjyLWkjVUq+cUJM0pcCk79qTZXvPLtwx
         Y3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470059; x=1752074859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5S+iEa8IdsVyvXDRXqAUiD8piNfUvjAGL8/4g6Co+g=;
        b=NIpCC7Y9Hyc/FJE6veHWofd0F4Wq/lgBHTVUTVW7Sa8ogTTIMPxJsmbK10PsWSukXD
         MflJEX3JetcNrwAZDYgkLPw/SOdmLxu4UuGENgtrN1ZPJjqmnUcxLkVZ0EmfMGp4QwoH
         fJhIJEYzowZ+7ZEmN3NygqEryKgGydhixvo14bkBv8s++4+YF5WlhQMFUfErj3y03kHM
         edIZL2omU9rrF2jncKPtMCbS/SUVvH7S/pHFp3uoBCEWmQMXazezxxaSLuK5NftXacdJ
         2nE193D0PzPZOjwPNCUUG7LdxbehmvdusHMJZTKOAR4Pq/UZg+m2aGbOrMhEy9pTojYm
         xNlA==
X-Gm-Message-State: AOJu0Ywmy68qaG6njGYO0tYHqpN9rxGcmRk2NDgPe87hykpx6c7VWStP
	9Jv85/zdXHourZ9Qxuv+hJDC7Cvr6kuJEYf8ZwC+L44icqOGm3PlVtE589twGMe1ZbE=
X-Gm-Gg: ASbGnctU6UkP6yk07jn7CT4tYUoQPcThhN2PkL8/cv0JYDt1borDjr/dY75YV7oY1cP
	ehjROgyBJMYwaBuxysS1QMgJAxGXuVI6qpRmn5QWNMFPYAu6OV3iTXeO47xgaIJP/f2u4L3NI0Q
	6nKUWqBoYoquHYLPdlTUORDKJ69hQpoCN0HTrorDoXG36htvQot9exTyCAw8vOsEPpwtSldlqy8
	Gw400DXI1/3PgFQSJ+tt9GgBHSXxz9zm6SPiDrsL31BZ//8Fr0HLR5PJYoNBSKO3SMjAtH1IMEX
	QJCbjRg72L6IYPWK3KtiDp1ty6WHIJoZe0mKe6Z5p44tswlj+JWLjDS4u4WDPFAemjUNM47CkVl
	h
X-Google-Smtp-Source: AGHT+IFzpF57eta57Xgw+2HTRnLf235Ya6f87nGG+nlvfqjZNxIWnB/0q/88pGWrsxwwrZqhdy02pw==
X-Received: by 2002:a05:6000:26c2:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b2019b80bcmr2882664f8f.35.1751470058520;
        Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:23 +0200
Subject: [PATCH 25/26] clk: amlogic: align s4 and c3 pwm clock descriptions
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-25-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23797; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0XolTSN9OEuc3oqxZff5/9uDdWtVO1N6nfCdJuJ8PzE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/N3en7Oc/O38sMsx2hNRLUUGOX1T7ReZLnf
 uwsaFyRd1CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzQAKCRDm/A8cN/La
 hYGrEACHTf4xN/DA8h7vS15XupFyMIp1q9fdcBeoKHtfzn3qICLzUdhIBzq+3Tj6AHEBMvudmI/
 H1x0c0cjzh/iu2TD0p+JQeaF/RZhlwQRSmi/YZXrL8jKmwC4+OzrUfWRAgNL9kv45MZKrtBMpt8
 gNI5hHEW46XFuyYY0qjcnTYqn0Vu5ha3Ill4pGjDVpgaNXMYmqNuXwfGD3HrDndkjrlDzP9rkMA
 86+2iEAssPmjgAA23WW4xlK/NTMzNXRAQFRjzVhmu9IFsunjY/ZNjsToFOETU2NP/XBARPNm4Hn
 IeWBdNHlmbGWozc+VPpr58ykEtEb32Xy9lUa/RRMtZwWODNGgKCF1WkDsScuZ41B6Hr+QPmuM9B
 Mp5xymNXwNge+G4LURTLSjvV6NVxNw0Ail1T0cy+djTwuTM9j2QEOtjGzIhNTEdqS9kNXZvgqDe
 EmRMQZkJ2kYAPuXjKg/hn0Wq4FsxZnzFCo6ek7XRXkEc+sRM/ySQIwNKleHM1ZWu9PVAKDGMQcd
 iImhYGQ6vlWqroQqfElWzytyfzFgf5JYiW2FlPZgalyXjOr3AeW1NhAnoBLe3XUqzmWEbxULtKi
 O+y+mES7i2EcMMt1xNXis6qjmEq66Bcef3WOJZf+gLbG/VZO6tLgoNThiS5vkoD6Bm61UMGdc2p
 2K9FT5XnwZspk5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_162740_585846_322DA131 
X-CRM114-Status: GOOD (  11.61  )
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

s4 and c3 follow exactly the same structure when it comes to PWM clocks but
differ in the way these clocks are described, for no obvious reason.

Align the description of the pwm clocks of these SoCs with the composite
clock helpers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/c3-peripherals.c | 204 +++++----------
 drivers/clk/meson/s4-peripherals.c | 508 +++----------------------------------
 2 files changed, 103 insertions(+), 609 deletions(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 02c9820cd98655e57a290859b595cf09d39e5fe3..fd35f9b7994720d069c5f72142d6064790d40b60 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -48,6 +48,15 @@
 #define SPIFC_CLK_CTRL				0x1a0
 #define NNA_CLK_CTRL				0x220
 
+#define C3_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
+	MESON_COMP_SEL(c3_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
+
+#define C3_COMP_DIV(_name, _reg, _shift, _width) \
+	MESON_COMP_DIV(c3_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
+
+#define C3_COMP_GATE(_name, _reg, _bit) \
+	MESON_COMP_GATE(c3_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
+
 static struct clk_regmap c3_rtc_xtal_clkin = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = RTC_BY_OSCIN_CTRL0,
@@ -512,146 +521,61 @@ static const struct clk_parent_data c3_pwm_parents[] = {
 	{ .fw_name = "fdiv3" }
 };
 
-#define C3_PWM_CLK_MUX(_name, _reg, _shift) {			\
-	.data = &(struct clk_regmap_mux_data) {			\
-		.offset = _reg,					\
-		.mask = 0x3,					\
-		.shift = _shift,				\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name "_sel",				\
-		.ops = &clk_regmap_mux_ops,			\
-		.parent_data = c3_pwm_parents,			\
-		.num_parents = ARRAY_SIZE(c3_pwm_parents),	\
-	},							\
-}
-
-#define C3_PWM_CLK_DIV(_name, _reg, _shift) {			\
-	.data = &(struct clk_regmap_div_data) {			\
-		.offset = _reg,					\
-		.shift = _shift,				\
-		.width = 8,					\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name "_div",				\
-		.ops = &clk_regmap_divider_ops,			\
-		.parent_names = (const char *[]) { #_name "_sel" },\
-		.num_parents = 1,				\
-		.flags = CLK_SET_RATE_PARENT,			\
-	},							\
-}
-
-#define C3_PWM_CLK_GATE(_name, _reg, _bit) {			\
-	.data = &(struct clk_regmap_gate_data) {		\
-		.offset = _reg,					\
-		.bit_idx = _bit,				\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name,					\
-		.ops = &clk_regmap_gate_ops,			\
-		.parent_names = (const char *[]) { #_name "_div" },\
-		.num_parents = 1,				\
-		.flags = CLK_SET_RATE_PARENT,			\
-	},							\
-}
-
-static struct clk_regmap c3_pwm_a_sel =
-	C3_PWM_CLK_MUX(pwm_a, PWM_CLK_AB_CTRL, 9);
-static struct clk_regmap c3_pwm_a_div =
-	C3_PWM_CLK_DIV(pwm_a, PWM_CLK_AB_CTRL, 0);
-static struct clk_regmap c3_pwm_a =
-	C3_PWM_CLK_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
-
-static struct clk_regmap c3_pwm_b_sel =
-	C3_PWM_CLK_MUX(pwm_b, PWM_CLK_AB_CTRL, 25);
-static struct clk_regmap c3_pwm_b_div =
-	C3_PWM_CLK_DIV(pwm_b, PWM_CLK_AB_CTRL, 16);
-static struct clk_regmap c3_pwm_b =
-	C3_PWM_CLK_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
-
-static struct clk_regmap c3_pwm_c_sel =
-	C3_PWM_CLK_MUX(pwm_c, PWM_CLK_CD_CTRL, 9);
-static struct clk_regmap c3_pwm_c_div =
-	C3_PWM_CLK_DIV(pwm_c, PWM_CLK_CD_CTRL, 0);
-static struct clk_regmap c3_pwm_c =
-	C3_PWM_CLK_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
-
-static struct clk_regmap c3_pwm_d_sel =
-	C3_PWM_CLK_MUX(pwm_d, PWM_CLK_CD_CTRL, 25);
-static struct clk_regmap c3_pwm_d_div =
-	C3_PWM_CLK_DIV(pwm_d, PWM_CLK_CD_CTRL, 16);
-static struct clk_regmap c3_pwm_d =
-	C3_PWM_CLK_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
-
-static struct clk_regmap c3_pwm_e_sel =
-	C3_PWM_CLK_MUX(pwm_e, PWM_CLK_EF_CTRL, 9);
-static struct clk_regmap c3_pwm_e_div =
-	C3_PWM_CLK_DIV(pwm_e, PWM_CLK_EF_CTRL, 0);
-static struct clk_regmap c3_pwm_e =
-	C3_PWM_CLK_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
-
-static struct clk_regmap c3_pwm_f_sel =
-	C3_PWM_CLK_MUX(pwm_f, PWM_CLK_EF_CTRL, 25);
-static struct clk_regmap c3_pwm_f_div =
-	C3_PWM_CLK_DIV(pwm_f, PWM_CLK_EF_CTRL, 16);
-static struct clk_regmap c3_pwm_f =
-	C3_PWM_CLK_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
-
-static struct clk_regmap c3_pwm_g_sel =
-	C3_PWM_CLK_MUX(pwm_g, PWM_CLK_GH_CTRL, 9);
-static struct clk_regmap c3_pwm_g_div =
-	C3_PWM_CLK_DIV(pwm_g, PWM_CLK_GH_CTRL, 0);
-static struct clk_regmap c3_pwm_g =
-	C3_PWM_CLK_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
-
-static struct clk_regmap c3_pwm_h_sel =
-	C3_PWM_CLK_MUX(pwm_h, PWM_CLK_GH_CTRL, 25);
-static struct clk_regmap c3_pwm_h_div =
-	C3_PWM_CLK_DIV(pwm_h, PWM_CLK_GH_CTRL, 16);
-static struct clk_regmap c3_pwm_h =
-	C3_PWM_CLK_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
-
-static struct clk_regmap c3_pwm_i_sel =
-	C3_PWM_CLK_MUX(pwm_i, PWM_CLK_IJ_CTRL, 9);
-static struct clk_regmap c3_pwm_i_div =
-	C3_PWM_CLK_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0);
-static struct clk_regmap c3_pwm_i =
-	C3_PWM_CLK_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
-
-static struct clk_regmap c3_pwm_j_sel =
-	C3_PWM_CLK_MUX(pwm_j, PWM_CLK_IJ_CTRL, 25);
-static struct clk_regmap c3_pwm_j_div =
-	C3_PWM_CLK_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16);
-static struct clk_regmap c3_pwm_j =
-	C3_PWM_CLK_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
-
-static struct clk_regmap c3_pwm_k_sel =
-	C3_PWM_CLK_MUX(pwm_k, PWM_CLK_KL_CTRL, 9);
-static struct clk_regmap c3_pwm_k_div =
-	C3_PWM_CLK_DIV(pwm_k, PWM_CLK_KL_CTRL, 0);
-static struct clk_regmap c3_pwm_k =
-	C3_PWM_CLK_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
-
-static struct clk_regmap c3_pwm_l_sel =
-	C3_PWM_CLK_MUX(pwm_l, PWM_CLK_KL_CTRL, 25);
-static struct clk_regmap c3_pwm_l_div =
-	C3_PWM_CLK_DIV(pwm_l, PWM_CLK_KL_CTRL, 16);
-static struct clk_regmap c3_pwm_l =
-	C3_PWM_CLK_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
-
-static struct clk_regmap c3_pwm_m_sel =
-	C3_PWM_CLK_MUX(pwm_m, PWM_CLK_MN_CTRL, 9);
-static struct clk_regmap c3_pwm_m_div =
-	C3_PWM_CLK_DIV(pwm_m, PWM_CLK_MN_CTRL, 0);
-static struct clk_regmap c3_pwm_m =
-	C3_PWM_CLK_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
-
-static struct clk_regmap c3_pwm_n_sel =
-	C3_PWM_CLK_MUX(pwm_n, PWM_CLK_MN_CTRL, 25);
-static struct clk_regmap c3_pwm_n_div =
-	C3_PWM_CLK_DIV(pwm_n, PWM_CLK_MN_CTRL, 16);
-static struct clk_regmap c3_pwm_n =
-	C3_PWM_CLK_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
+static C3_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
+
+static C3_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
+
+static C3_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
+
+static C3_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
+
+static C3_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
+
+static C3_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
+
+static C3_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
+
+static C3_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
+
+static C3_COMP_SEL(pwm_i, PWM_CLK_IJ_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
+
+static C3_COMP_SEL(pwm_j, PWM_CLK_IJ_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
+
+static C3_COMP_SEL(pwm_k, PWM_CLK_KL_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_k, PWM_CLK_KL_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
+
+static C3_COMP_SEL(pwm_l, PWM_CLK_KL_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_l, PWM_CLK_KL_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
+
+static C3_COMP_SEL(pwm_m, PWM_CLK_MN_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_m, PWM_CLK_MN_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
+
+static C3_COMP_SEL(pwm_n, PWM_CLK_MN_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_n, PWM_CLK_MN_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
 
 static const struct clk_parent_data c3_spicc_parents[] = {
 	{ .fw_name = "oscin" },
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 3e048e645b080f9e5982ef908e3f9c43578a0b5f..6d69b132d1e1f5950d73757c45b920c9c9052344 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -62,6 +62,15 @@
 #define CLKCTRL_PWM_CLK_IJ_CTRL                    0x190
 #define CLKCTRL_DEMOD_CLK_CTRL                     0x200
 
+#define S4_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
+	MESON_COMP_SEL(s4_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
+
+#define S4_COMP_DIV(_name, _reg, _shift, _width) \
+	MESON_COMP_DIV(s4_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
+
+#define S4_COMP_GATE(_name, _reg, _bit) \
+	MESON_COMP_GATE(s4_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
+
 static struct clk_regmap s4_rtc_32k_by_oscin_clkin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_RTC_BY_OSCIN_CTRL0,
@@ -2559,484 +2568,45 @@ static const struct clk_parent_data s4_pwm_parents[] = {
 	{ .fw_name = "fclk_div3", },
 };
 
-static struct clk_regmap s4_pwm_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_gate",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_c_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_c_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_c_sel.hw
-		},
-		.num_parents = 1,
-	},
-};
-
-static struct clk_regmap s4_pwm_c = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_c_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_d_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_d_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_d_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_d = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_d_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_e_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_e_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_e_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_e = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_e_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_f_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
 
-static struct clk_regmap s4_pwm_f_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_f_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
 
-static struct clk_regmap s4_pwm_f = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_f_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
 
-static struct clk_regmap s4_pwm_g_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
 
-static struct clk_regmap s4_pwm_g_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_g_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
 
-static struct clk_regmap s4_pwm_g = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_g_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
 
-static struct clk_regmap s4_pwm_h_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
 
-static struct clk_regmap s4_pwm_h_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_h_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
 
-static struct clk_regmap s4_pwm_h = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_h_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
 
-static struct clk_regmap s4_pwm_i_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_i_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_i_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_i = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_i_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_j_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_j_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_j_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_j = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_j_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
 
 static struct clk_regmap s4_saradc_sel = {
 	.data = &(struct clk_regmap_mux_data) {

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
