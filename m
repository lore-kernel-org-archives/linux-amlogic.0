Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B10CCF9E3
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Nov 2025 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WJJe0+j1MJ+S5HZ+PeGm4mGnoI9BsgxYCIxLYofkcc=; b=139UgP9Tbs6/lj
	VLUbXd6DEdimjNYdOKNxoUHMC2kHPfGmrOnTsISLvboT/qH2Xh6yKGAPJpUxpazT+oXdIZbuWFsue
	yaRRHVERIbOwSgRDM6WPj8Rp9aECZDGTeSDjeJec4bh90cyUoIJ2OB8MT7FmfZaIfTFTwItlDX0Rd
	fXaBS737cjIbv0xspByQh8tA3vu0OX7HDyA0wq8ZTJBZxZJqeV+d1mwuY6RNk95Znrc4x4Y53gpp8
	g42Y0Eqick6sZFz9cNqcHDUeAooOb2gTHLB3VvUmxLLezns0Zb5qmQ6Gj6nodjEaxqnNDpctg+kfe
	V9N0EjpZAzJiCG4nRnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGn4-0000000Bqh4-0FNn;
	Tue, 04 Nov 2025 13:09:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGn1-0000000Bqby-1SiU
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Nov 2025 13:09:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47755de027eso4606905e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Nov 2025 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261773; x=1762866573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=xEGeyPkcSgHrmXw8zLHW8XzfZMl2u/q1PFmDwWspu6ZB3g9bpB+g0MtEnw0rp3c6RU
         VHcQn5gZTzqIX9dE04P5Zz1PtFphLlqISJdijkVaBVBgDIlafjjcHlPBDRN1gJ2cna14
         +4NTI6zSbhKcaKuWy9t3D0NKvxHQgEMceYGG4UjKPlqlBJX+3ZNpnQKOrD3q8PO8auXr
         oWTTA7UTyYqH4ngEI4wbToQWngiR1TRZSso0l68GI3WRlAeVCVpy4vYKmWWA5EuSpgqy
         8yxB5bTeC04Ne8bEyRdRHoQFDbol//6uXZrYtEZm37pVpKnXuAn4rEPJ8ECme1rUkJXh
         7Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261773; x=1762866573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=OpyNmjcrJBddE0g/m945XufPaGke7MnURbY3Fyj4X5VAHLaxeCGbYL8MLK8ACGrf0u
         FNK77xNBKjAHb9zA4l+1YUiaVmtzTj45aqwgQYHBDF5x4HBtG5aiCnmMLmTVaFdlaaPO
         FAD+JBrhu8xpzCWr+KRNyT47YsGLOO4G4nCQMbUJ4P4uSaRK1JM+/xEPKOyFIGM2NK3k
         LdV6dSugzaCJhB41/4rFjYUXuSY92ap3KwSEHK7T82A3eIwiIZxkS208ryrU8TVFC+K/
         kBaXSF8AwgL5+qdQqN2jGf4l3+sNJHEfV3gbgW543f/nLKEE6MppuBpKCLlXuuyhhGyb
         XFiA==
X-Forwarded-Encrypted: i=1; AJvYcCUnw0cXfXuQnOI5hUKA1fnaD0yQg12hyVINKhag4bqc7uFHQJPOV+m1tyCzipUl8LcfU5UvG3wY58oxIwiH@lists.infradead.org
X-Gm-Message-State: AOJu0YwUeq10+cSextBiUqUdFVkg8LzIxFtg80DDJbhdCra7u1ld3QJX
	YsfMwa72VyZwXN9MM3M8mxhOsHeaJxX6/haby+P+1LM6w3IQ6cjD0latvX+/yhg1rQ4=
X-Gm-Gg: ASbGncu8GjlBfxMZTw5U+CzlT0UXfu96DUyG9q/9vwJvbqJ9orLnrrqvGOfIWKoCzm/
	32ceB4aFKZGjIWe/CMhPQ9I5p1GKmDXNg+lfZcU4VHXkvJk8WBFHuBjVfUddewUUL9GrLIWdc55
	VG+hiRkFVCf4RJS0arkzYsTPdbT1pqF45QyI/HlQQX7hxOPEy+kzIUzIierD+uN+uB851SWoxAG
	g01qeha2Qyg90ZQFJTEFo4e/FSNXwJjPShUFh42acugMw5D3AgfzXgrFxwQ3/jwptREYnJk3KoP
	SzdHsRNZRCZ+Jlhx0gxarIJ8w5/QRLhV6gv7QsXcjzSvjWGzWeqhCI5tsqv9RnMPTVkldGNJFx+
	mlngwEK509qQUlflFUS4hZDJDdU9HUv167Q4bwerOfY4zOtcddedOmj9AwCuN1S0woH2tSA==
X-Google-Smtp-Source: AGHT+IHLeJTkz3Z9JUhRNQIdfiIz3zju/KKqwii1AcstjAWBhNyTLGOcii2tELicylV8dY7OWKqeQQ==
X-Received: by 2002:a05:600c:3485:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4773bfb51f8mr122528535e9.30.1762261773214;
        Tue, 04 Nov 2025 05:09:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:56 +0100
Subject: [PATCH v4 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-5-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrt1PXYHKJt2IulJ2CyvGw0mRwafmetNOR2Y
 5zJmQ+uGwGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 crVLEADE2sKmE+cnYe6vd8MrSPmBXpfZ48+xv9duA0AFvw0Jl0TIVags+e1ih+VNlrPKVQkDN1E
 4hvIVk5690c3a7nxPof8XwbSvHgwyqCuAu9+rR2qjl3J010XvLAjdjJQBWKUQXOhLWDomWEEHNG
 mgCVEHSsM8vWjKT7puhWaGverUX8oMQ1aMQt8wHHcbw0YpWz7QEI8oAduybvItGU0SS2C3tLaH7
 Jd3Eab4GHdc1anBVlXj9a71lYduzL4icKt6e2gR3cn7pTAfGEeDU8K3aXwXYyiUKaMHlDPO3AsK
 Fr+ivt8c63rfdqbPTHNjeQLAf64hx+XfXcg4DvlUImNOjGESEoJiE0fxuMaz2citgMG246tCSYU
 C5uLvQbjLqchzLfNPDaA2QihiKOQmHRRkGKcqFqk5Xhw46XlYCItAnlkMKm71+2tkb+xswW9NAN
 iwi2Tba4S6v9um/tsCcXu4R2gRT46lYwFGNHj3ndHgtdafKm3jGsLmiEDYuX6n5HPZkxm/1qQCr
 HjlYxUxuRoFDhUZ7MxewBMebBxObzXfWGg01dynSHvIzFBogam2kDjrtSCOYxEiXq7ZdTExPbzK
 z+l9sZSchK0d1c8tZffhQ/6KlCSXT79aF5UfiQJj6KCvGC5x8i7+YLETdMQ//TKcwS11rR7IXeL
 MYJ/8y8lkrz6tPA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_050935_517674_2B7FE9EE 
X-CRM114-Status: GOOD (  15.27  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9cafe101049d5412d649b3beaca350c497ffc981..1f00556bbad997e2ec76b521cffe2eb14fabb79e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -292,7 +296,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -313,8 +316,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -771,11 +779,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -823,6 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -830,7 +843,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.51.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
