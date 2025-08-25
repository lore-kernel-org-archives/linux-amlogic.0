Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748BACA0FE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km+SGHXJ83/kLqeTxvhbTvwq1iF6DLKPfABztsdRnRM=; b=JkOWs+/USEDzVs
	SufCd7LxgwryLTXpKE9c0hosURnwIyWwEIVNOE3F2InsANQQvUy1ZNEWtBUfIfiNkY0cZaVAxs/nb
	7jPz6vCDlgrjiEBDaQ5rk4r9RvAHuW8YSZT9AqGogHs8XpAjvF+I2p1cznUpUF+dt57KhAW0ICavL
	TREeGX3Gl9QXPDcaah3M9k8A1dFJ/n0Sf3v76b8ElCVpZsfIRBaOEEB2cISxqzrH9s5B3xfCxlmt/
	41ZYLltijXY8XQfYFDTHF6y+71AfkAfq1vTzIDcSUuWxuS/OVT5ojR+uhBG0iJ7tsUyFIkJyixgRn
	abYR7SZklyWdWllFRpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9R-00000008WFk-1CXZ;
	Mon, 25 Aug 2025 15:30:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAE-00000008FkW-3Q2R
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c854b6459fso984107f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132033; x=1756736833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=CjUxmM9LMxR5MRGe1Xc3Qirh8FOYE/Y3IhcXVSHFNzzDdbGUelKuWYd/+v+BDCUUBS
         I8BaWimPfidSJ4J5ij5OExrryRT/Ey5C8UT9yro/KCIpJau7+RUSVjVvqRBND3OpgBcQ
         Q/E5mK04fPP+0Axl1YdpGNQd5dQ38mUxuhPlP7Rfi7aemhlJlLHFDiH7n8y8PA2b0489
         wHPLzNjeK+UJ9bF0GvIT/ruYbe9MJu+DJJhKqPqZY5wuTYd1TxsHUxM3SwZvEuJhLc9z
         Er3lO0ujzhXdxSOu3jG+FAzJp9mC+SjV5dMIKjdhdFC43w1pfbSqV3/BJFIfBTJLAJeU
         AtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132033; x=1756736833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=i+Af2euyXnifR9R9HkhVOsoChH9dZmCjSjpENE9WDUsVBL4CZhQe+bzvZ5JAthSW5u
         Bw5RKQq52IFhpBTN2Szjv5kx4J2jPFMqXCFa8vNIiwBlhk8JmgKkXCfqenwhMe/z6fTV
         5M+gur1DjDXY2XT3uWuassRo+eQsCismGhMwVvC/PUiQOLIFdqCDcHX/WP/Z5lCSn017
         9Ne+mhABq420XLVzVtokKEp5MbyP8ed552N4hX5KhnZVGmlcHBLDpORvI4/5E05z2YEO
         iy3OmauiirCHGzasjXoki0teZEpZkNx9XocmwFXo2WWHFtiYFeWigm4XGLRjvdoG742C
         dCrA==
X-Gm-Message-State: AOJu0YwF7mKMrN1nG+bL97cZwi6SNAyN4jgGTJ/2zLaG63Q1fgRiv7aL
	ScQYqIAsIId/R7jVe3VrAb7rDwDiDL1PMBdqJ82RN1Q5vnJ1qnnTw2e18HyQ6V5sr+M=
X-Gm-Gg: ASbGnctzP0clnQtjaAaWvL7+bt7XOMFJUf1RvCLXsUs5OFJ6lJiq/wtwwNm/prfYDcn
	AangenLWFNlE10QaheEJyI3AmVQUSFUyJl1DoU3ef+wP7CRhV/kls9Jb0+TSRvCKxMugq+0R54Z
	dEfoxWmYoVrFQoqfNaaiA5XnL0Ny04G0ZK7hXZFbtlJ3kY3L3ydLWYYR0pLMiM7NLz8I6gjBZVi
	kjPwpD/UUCDDEot39TPJE3GQMCQZnTe8aaECEzea/PJOveGCOt0nnEfkW9xCGbV8nR1MoOHaQNP
	a9Pi4Be3au1Awy+LxU1/2eKr/C9zGU0cu06mwa0gaDacXqqfHAuBsXN5234ACj3f48evAEdIKqH
	mKX6CQuiVsNNUt+5mkIIRJYLPGM0K/2uX8tau
X-Google-Smtp-Source: AGHT+IGnZNd0TF8B+2qH0v2ERRAcEJzB1LmVzNbD2rj+M2fJbkxWf2Ryny9Bv8Zv7wCD4HSuYBiLDw==
X-Received: by 2002:a5d:6ac7:0:b0:3c6:cb4:e060 with SMTP id ffacd0b85a97d-3c60cb4e54amr5981665f8f.34.1756132033426;
        Mon, 25 Aug 2025 07:27:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:35 +0200
Subject: [PATCH v2 10/12] clk: amlogic: add composite clock helpers
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-10-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHK2LR9cAulu/Dg7wzveWSkLYkNJ9hi4wbYHo
 pFJxTH5+cWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxytgAKCRDm/A8cN/La
 hSDrD/9Qb0PyVOZn3hszgeqgrG8upaAQ55iBmu/kHai53eku7dMNLCgo/GSxS12i1nnj8NSriLW
 ErB6hHemrtB7p9fYVUslxB/hZ9MISdi7tRa1yZjB6FuxI8XE+mZUICX5tmrea/cNAxFLAGcnQlN
 63CIJ7+aYY6X0vM9nQIrY4D0gluWYwi85q2rxa4VaD0z7DzmhXUjKIF6XaztRJxp4rl4Zz54u+g
 P0Px1NL0pQdh3m1V4ADCp0hlht2Mnzvxneei7m4Mu8jAdo8K1TjrabWY8mAWheTSZ0JCSyg6KJi
 WvlFlQcKiK6nsgepnfrp+MXo2+/dpljD8J+K3zwkmA65txvZMac3NcBacKTG2ToB0oNKzFqOiRO
 TijnFU8ByjWNQOhGlD/H3vfpxvxIV5Rglm8Ds6CBqTLTFPEPc1iFTE9E41mrWxLok/nvH8ov6vQ
 hPfIhHKuIgFGlxtEZsqxcY9WiPpqIMqaQyzueRkUhy+j7LTEhT8+kSduPZUUsKYRwFnZFxcTMYk
 XyKrwLv4GAN4/x6tEqqXKSPmolH2SND4jkjse858xq0S+3Y05806RQL0270Q4/6IOLKcstu4hZE
 5VHDw8Ltk2K0/Psd8SrPWGv2XkA703A+IqUiQuQ0kc7LPsCvpD3crNQrMt3bDU+csrYlXJ1V78w
 eaM64tYtmmBuiWw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072714_892258_CDB1FB4F 
X-CRM114-Status: GOOD (  10.33  )
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
