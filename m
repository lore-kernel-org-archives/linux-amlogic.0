Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA41FC4167D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PX7ETNInpp93jknmuURxl9Dt6IJNf0QOA9Aho3M5iow=; b=Lmva10pgzxlHyP
	TcM5YGClrKb1NS/qquDdwTTuuAhelK3alrqqLZSiqO0Cqc2iCi5+uzO/K1mKHxA7x7ySDBKIx0o1I
	QSxKthSnjIFTa2yTdXTJhqWX6YVxRHvnwKrbdiHdCGFgRT0l7GnvRqcSubA+mQO2rn0R7ZyQm4I7h
	9CNlIONkajOXbld5qLwPFTNzb+sKxEu9RJA40UCrXdTJ14uF4qqReTEZm1FhYqzYmtMXV20ltSUHs
	k5ts2riTg280t3zYZJc5ZpylnY6QCm1IV3lIx54llcS+LAi0xoBD78WcU+XS2hHs95B4MkBAGTH/d
	1zxTPeNuCh5/uLFmMOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRe-00FYjU-0C;
	Tue, 14 Nov 2023 10:14:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRY-00FYgJ-2g
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:14:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso3314406f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699956891; x=1700561691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usa3VquYxAPDycVqQKpd67nWp9ekHUYyeEdbo8Ek7jY=;
        b=YON+Bk3IY/Xl0Ii9ZOSLpA//eBcLLOOFLQUaCg7QWzJsVsJP7Tw38lvpASZFCA7IvH
         QNbzidQIUyrYGLU+P6pfEilvD6HiCTcOxVt4GJWLEgM+d8bnpmxS7qjL1X1e3XtwF3PI
         3S2HWk1wuGwq3gPnnhGh6gb/Wffb+qt+aT70ruy3sLDu7LsAB4Cm+8h3jpHlNOZNBn+r
         U8rDmXsHsKpSQs01yAQGQotkXLaNSTGAM867S92j/3zULmCtUYL7CQn5aSUCs+0hEAqB
         sp3hy0m1cEX45h8A6OClJNbU7JnP7ToksRSF0mB3hu7B2moxndoyL7Te4doXdd3zIml+
         NPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956891; x=1700561691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Usa3VquYxAPDycVqQKpd67nWp9ekHUYyeEdbo8Ek7jY=;
        b=gCrcxSKBN+d9Bo6HYvX097+Gs2tZqWsgwNlSodipcqGrmYmndB2Q2dePeqz5fI9+li
         TedGgnhcHzJSmh572r2q9wb9szNsoYOKPerGKM1NovYP+BXDzISPZ3Rvk52eaPfli192
         IlTUFHOq1F/g/Jr+djvtjJDBAqtgu/lieZTMM/ZkdOqMqes5EkY9Mj2jhVBjoZQBxvy9
         gBDqXR+7cAcCJXgVPNxFLTLx+UBp5+wONcR7MdgwMgNoOstp4xgmu2FqVmY+JmVX1nMX
         wYEMYWXwIEpmJLx/IXyjfmLtItu77L3D3JVuacRAXH5I4KK6MaCuG6g2posN1OcpLWM+
         TqFA==
X-Gm-Message-State: AOJu0YwKteBZJ8lkJN1XGp+VYZqBZlAUy9v5lEWPodJcMzo/ZAopdVpj
	gBDuvECrps/VXp56wH//S0n64g==
X-Google-Smtp-Source: AGHT+IEzVZMK67kMUGREpJZSlwqk/XFJZSzmj5Cu4UNpZkY1pqqaaiRElgez6kW52TTfdqVYtkAZjg==
X-Received: by 2002:a05:6000:1565:b0:32f:7ebe:3e5a with SMTP id 5-20020a056000156500b0032f7ebe3e5amr7525048wrz.50.1699956891208;
        Tue, 14 Nov 2023 02:14:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm7335585wrq.14.2023.11.14.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:14:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:14:44 +0100
Subject: [PATCH 2/3] clk: meson: g12a: add MIPI ISP clocks
MIME-Version: 1.0
Message-Id: <20231114-topic-amlogic-upstream-isp-clocks-v1-2-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dZke1iq4FAITvgVMIUDhLoZap1P+Z6ah4DJyhujVIds=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0iXlwUukpCz/mpc05k9GDypuFrhFLdOZG5tKQ+r
 wnMvS0yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNIlwAKCRB33NvayMhJ0cx7D/
 9z5wa9btnYn9c2UrV+P9UhiZazbpjGG9COykZ17lwepwf4InMJLNjO+5SpCbzT9BV8I+Gr6RdoUozQ
 P2EbVQKscHgusKvlYKyNza3n/6DZ2VnW33BP40nGIs0Ji1cDCUqSQjKdUKWXgniTL++Mc70l0fM9Ar
 LfDQ0VJCEVRUaIMU5mCIu7vc0J67V7ebMuM//zvkGkeq3dGGq22yC/1/r3LJuaRBOQXF4Nm7+tKCc9
 YB/jttKphPf0lHvaeJoKdidTON6c7okJUOLTPTWHqTnkTsYHtosGPJ0R3SJsG8GhZ2CH/KFlJgsjdN
 gTQ8eJJ7aUwYoh2lVlU8QgNr/urUXcsgrR9e1hgVuneNdkFtrprpwI7/S3Vpfg0jQ5J4SNAtgaohr1
 vIUw/7WDyctSoRFZF1FSOQHFLEzzTwVQDILOBAAfZTIKs4ISy/RXXk3FL7y09nYDAO2Q1LKJ9Yzn7h
 YMHIpVnTcyQ9RiB2SsCvCb09SmQ52nF263gMdC6nX/fDyIHqZmHziALJSfaoLME98At8AK2LzaKiKO
 0zyHJCHYBgYxqJPuBW8oyoJO4nRU8+UaUo03HQa+dlVVUkSx8oI/nnib35TcwImCuuLUtfxTzDc5Vo
 VP2M+eyZKiVPxhPysDcyqh3ie419ejLZuJvW5FDAbt37/md2GLj+0cDa+xdw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021452_879167_65B20275 
X-CRM114-Status: GOOD (  11.89  )
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

Add the MIPI ISP gate, divider and mux used to feed the MIPI CSI ISP
(Image Signal Processor) IP on the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  1 +
 2 files changed, 67 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index f373a8d48b1d..a8312f29d1cc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3722,6 +3722,66 @@ static struct clk_regmap g12a_mipi_dsi_pxclk = {
 	},
 };
 
+/* MIPI ISP Clocks */
+
+static const struct clk_parent_data g12b_mipi_isp_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &g12a_gp0_pll.hw },
+	{ .hw = &g12a_hifi_pll.hw },
+	{ .hw = &g12a_fclk_div2p5.hw },
+	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div4.hw },
+	{ .hw = &g12a_fclk_div5.hw },
+	{ .hw = &g12a_fclk_div7.hw },
+};
+
+static struct clk_regmap g12b_mipi_isp_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.mask = 7,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_isp_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = g12b_mipi_isp_parent_data,
+		.num_parents = ARRAY_SIZE(g12b_mipi_isp_parent_data),
+	},
+};
+
+static struct clk_regmap g12b_mipi_isp_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_isp_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_mipi_isp_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12b_mipi_isp = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mipi_isp",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_mipi_isp_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4729,6 +4789,9 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
 	[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
 	[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
+	[CLKID_MIPI_ISP_SEL]		= &g12b_mipi_isp_sel.hw,
+	[CLKID_MIPI_ISP_DIV]		= &g12b_mipi_isp_div.hw,
+	[CLKID_MIPI_ISP]		= &g12b_mipi_isp.hw,
 };
 
 static struct clk_hw *sm1_hw_clks[] = {
@@ -5221,6 +5284,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_mipi_dsi_pxclk_sel,
 	&g12a_mipi_dsi_pxclk_div,
 	&g12a_mipi_dsi_pxclk,
+	&g12b_mipi_isp_sel,
+	&g12b_mipi_isp_div,
+	&g12b_mipi_isp,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index f11ee3c59849..27df99c4565a 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -70,6 +70,7 @@
 #define HHI_MALI_CLK_CNTL		0x1b0
 #define HHI_VPU_CLKC_CNTL		0x1b4
 #define HHI_VPU_CLK_CNTL		0x1bC
+#define HHI_ISP_CLK_CNTL		0x1C0
 #define HHI_NNA_CLK_CNTL		0x1C8
 #define HHI_HDMI_CLK_CNTL		0x1CC
 #define HHI_VDEC_CLK_CNTL		0x1E0

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
