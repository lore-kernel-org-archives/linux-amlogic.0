Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4107DC04E88
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x71SRsNWxKOtV3GIneNKGtJcsHCQGtyDGvcXxjyEsOU=; b=PXoguYguNRIRdQ
	Q5VB3JLCUovRzHkKv6egmfE/XySDNCq1EGx5WWg6deedzF6e6WFlJSQfKDTiPESPGOsjBQsa6BgRW
	W/rdm3jv+Axv2YBmb59n7meO+CBFM8TyXI66h49S8E2r+4fI8e5dcKuVVryCKKuTlStVs4xI7dJGd
	Jj0P/eeUpkIu6k94XmZvHxnJJiw6YSVJOxGBrSRkEaN7CVnbYBMLxoZoj431GNVM6wrd4Qhl7sh2w
	RAFuVhtUKwMERhcrGEKU3aB3a+pYWI9bEJmLkqrTz8Vpbm15EMbvPL5e9uwlHyhWx01Aoof0IhNPD
	xCQdTwfPxmVW5e06UWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tz-005gyS-1J;
	Thu, 09 Nov 2023 09:00:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tk-005ggX-0A
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40806e4106dso3414405e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520421; x=1700125221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
        b=liwerDfgATmwnBGy4QCCswq+WPHmrIgWq53eqOCj2Q3eEHVAiL21ptEbIRGFTopXaz
         2HVpKRGlmiwzDKC131x1uQ1++Kap0it2sZbGJ8aeiwVL4qcsvQUw19+RlCGHRilYRaxi
         zcdON19oH7Z1OVLnFqKIy0GKOtokXyAHEYSzU3obFMjLdruit23UKETCDF5sD7nWtd5w
         y+FuSBri3BefwQWOgnqfqF1QpX4W4W5xc9aYNs+/RYLqvypLBRiRLih0/KkmvAN8acLw
         AgK9zXa8pR0J0rrQMBAR++H/DaTjFeHMHvsLkOPFLbaY5subN1SRqNfD5TXHVR7qePyK
         lVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520421; x=1700125221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
        b=JAgY1b8ahnsq6IqwZMp3SEYRdHqRGo8oHCHav0N7TsoKLD5+Gm731K1kAmNJGRg+ie
         qoIfbObSWYPQLAxpXoAJ1WAtT2fHosAYCKB5wfnaizJhUWSHGcIMNNEOiIiMFnsSDuik
         5rj7co1YBcZ87E/jG1KlpF7wPBEJ8BBHM/Ydm7fkrqM0F8M4aIB31piO+99c1AnwdKkq
         q9innvgh+ZntF1PTmsLzb87oc6epuhj7x1W0Dq542JI895m6JdCYcfxz0Z1SeyvdC4gn
         Yaplbt1Q4pFJacAEvEc2iTX5zh9Is1HbjTY9MSXvUPQLNw3XaRguJZEL75gPXiSw59Hn
         ZERA==
X-Gm-Message-State: AOJu0Yx7+a4spQk5STgH9QPYJZwcSUmAi7mqsMxJMbLkazRttZMIteJz
	FmmG9h5cbf7DvQ21H4sgowAlTw==
X-Google-Smtp-Source: AGHT+IGxSg1mr5xDwzqGjpnOTb8EnhbM3pbNiRU5Y/NFrQeBwQ2mIGRMQXdWeExekl2i8P6EQzzQLg==
X-Received: by 2002:a05:600c:c0c:b0:401:b425:2414 with SMTP id fm12-20020a05600c0c0c00b00401b4252414mr9733730wmb.18.1699520420735;
        Thu, 09 Nov 2023 01:00:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:07 +0100
Subject: [PATCH v8 06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-6-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zJsrzxQnYGg+gnkYOtONfQmErbGuCQDfLn/cHrjnMZI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XAu9aFd+uhj7htL8zXg0s1UYgLC9HzlrM/vb4
 7lZkuhuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0U3HEA
 CdCArUDEZEXlIJe4yS07vvou6fhXSMQ4+VKD50M2Cpocdho1yVp9ljgu+juoADLrWaxgggx0GB0HTH
 HUVdkEg3LXGMIi3A2TfFN+c7PuG/XbssgQs2uT3CobUB0iXYxs4N5mIoUuXGv7npd++vHnUgcBHajb
 kr3OfFXiyizbVmwTUVnh385tnaxA6nuqml63JKc4Dji79cj7Rfm5qYwtAaiTYAFAajctkmFzZA4wBm
 eHhzLTTFm7/L64tSi0pLWFtNlHFkmJdQsBv73F2E6sLrnlh3y82CEYgyGs3a7juDZQz2tHr13ldPfp
 K0ZQn1m3i3O84j6ESpDbg2ACUXdj8VjOlTVCxgIuDLSU7et7KrRMkthobvNZldMj88dJG9aBWrDp1l
 29U/gqY/2IkEjzYb6ShdvDYxmCuiJDi9TKFV0HB+UWqno8dRILizN+Uz9Fc5k+kXkczn2Y20p70/r3
 qy1OX52Zvv6PX2m52IKcHUzBJxAfNLKbrkh75p9RBULC2R07t0FqgkUzaIbJuCanVjLhho/WBjep1u
 AIgEtL21blXgV3rvovIRyFwtioa1KL/Ft4iCq9xlNOBNZJBH311LTTPoxzPryMZIOa/JNtewQ3R0BS
 7/6UYmNTEGu2LYBw1znMHPDco9mcFduu9KVdb23siKUtffeZict4FLLxVfwA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010024_146111_DDF4593D 
X-CRM114-Status: GOOD (  10.59  )
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

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index f373a8d48b1d..cadd824336ad 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3549,6 +3549,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_cts_sel,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_cts_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -3628,6 +3644,22 @@ static struct clk_regmap g12a_cts_encp = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL2,
@@ -4407,10 +4439,12 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4632,10 +4666,12 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4892,10 +4928,12 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -5123,10 +5161,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vclk2_div12_en,
 	&g12a_cts_enci_sel,
 	&g12a_cts_encp_sel,
+	&g12a_cts_encl_sel,
 	&g12a_cts_vdac_sel,
 	&g12a_hdmi_tx_sel,
 	&g12a_cts_enci,
 	&g12a_cts_encp,
+	&g12a_cts_encl,
 	&g12a_cts_vdac,
 	&g12a_hdmi_tx,
 	&g12a_hdmi_sel,

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
