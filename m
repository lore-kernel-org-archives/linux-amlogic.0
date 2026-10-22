Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E660A5BDF
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lP+HZ46t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CFqK9gLP3K55waQ0HnR3WSq+SdOlnhUcr5KnBkfdhuI=; b=lP+HZ46ttYXmt9ttT9NDdn2P0i
	PKmP7eRtBXunX967EDKo0H27kvff9+2DRpOFT8QRkH28dziF+9+nNdfupucHIZTc6tkYeQ93fHBl8
	GtMGFvuLmaoSBb5sXKpEGaBfRerWQw/j0vIht344MR+R81EOaHpWsBQfOUAUqT+3PNxN4FxaOVhcf
	q+fHOZU233E/awC1fFmJWyGxulGl8Da9QvckO9x50dRka6a56lf9dGgbNSbujkn2MorsCPQlTAxnu
	xL7skiL4optrk/55KaIp5dvHOJPpyM6ziZiPS1KVnXt3YJM93WwQqSBml30hMqS7/D1N6Nt3Evl5U
	mcZo3Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3y-0000000EtB2-2jYz;
	Thu, 22 Oct 2026 20:06:58 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3r-0000000Et35-00QM
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:52 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1323765e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699609; x=1793304409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=bpn71+rdv1wpbBOiUyLEF8yv2nREU5vER7HaekPndHPVbhTc/9E0dY1hOGnbfK2yDh
         C9raZMvLcgwJh1Utca30p09oC7F2f8IloJOF383mjLb5+3eTBI5y1d2DiDCxbyiMEEiu
         7IAjWnxJ4Z0FTvik6UfG6QmpvNr7cVGJxZZSqfc+27D+UN2ipaNTSy0Z+/W+i2xQv+V/
         MQEuTtZfFmmfOtKphJiZR3wZabNTl3liyMNYHog51ZYsf4ZSVC8a5WJF7mKPNh5G/YhA
         hW4xzDhd+bRXu7FKekTgOxq137STjAo4cIbii3w6OmPtORP9gmZC5qICMdZJfr4V3z+A
         ZkRA==
X-Forwarded-Encrypted: i=1; AKwUvBzN3GsY/UPiyZ6s2oq9hwxB0O2xP+JzcFN712ODZd0mHPEL/vHBdcZkBPYl3CU48HQhU3ffyhK/G1EtnJwU@lists.infradead.org
X-Gm-Message-State: AFq9FYKjSQ7qnk0Tzh/HKp2Iviq1SNl8OzBlmtVG4wbYJSnD9qJyfYQ7
	gPeV3Xh1mqiXxDdOh/i7moey6o6O7/Od6W5yjx07OcbwkYKxIhucMh7S
X-Gm-Gg: AYBFou1sqpMxsUP1jKCghsdo+o525UMX/owSDW7c9oRMu3nXvjiu/OHEu3mJ/M0/QAM
	ATfTy9Z+yjpRGiP6vmvAUGL1kizHe0fYxCp7wV2AyJgnDoUGe6QaSdmda0yEXcj/q0WcWPC792B
	Uk3sYfLQx0XRXQ/XTP11NRVFVjQu6TjcVSzE7sKKjst4fV5mg+rwtavX2oSg89vsGG7E/aygNjz
	JI5hKHUrp/D8dxMCwZ7RFB48sa7JAogzXSmnfc2W6M1cMuwsfY/+ai/1GmmZ4UBW7lSrvcT3Slm
	eua38Xb9ENVMIAmxrSt2t4eQ6VNbuo1I3/xZ12r04CKqJqjk86VqXwHcpIiUpbfxJWN0wp2Qgsu
	s4yWkwcygRnkpWa/kRmwtX5uDxg17BaNykkpxKECgbQMxdHE52hb62+Fwofy3x+n1gZ4xJl1o32
	anWy07+PMnlXZFQXwZEi++VaeimlIeM+yLa7bE/HfaMPWg1URJIfqR2PN+n3REOCe41vZ+89uZc
	2NMhdtAHsymqz8OhRC/hHjE/Cqc9enrp+kH38jPbEnFxBEbgaM7hvH9nnzDXLTugiowABAREqNi
	2gkFb08NVHtdXis=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr2469675e9.17.1792699609209;
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:36 +0100
Message-ID: <20261022200640.3101932-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130651_212092_94461D16 
X-CRM114-Status: GOOD (  14.87  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
