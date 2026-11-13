Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91195606A88F
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0/sml4yi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lpJ3ettu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dxK7UZcVB9Kr59AvYqDQvTMc0/UnKF3lj63IdKE/ne4=; b=0/sml4yiNzPx++4Z1XyA+sH2or
	IQTLN04h+I5iI1LjLPdcK5LUqKlVZ8ZLOXNpjrOG2jBFZCF5xRT5e1kwnJU67DLHCF8DzzxONRZak
	iddYubdVIbaT8xVlk41lhWZC7qYY0P64K1xM/JKLKRkiM63kYPxTOxP54LYk4kJayL2uLhcuVlOCq
	8/W2HX0tSDDfI1fm9bEKdqFIyqN7lXD6gU8nSwzBkV16dJMrBL4Yr02KAeVzn4Ve2Y/pvea0asYo2
	jPJ0fwpleoo0D7zxU1Jc5fFcdSlMf9fCLJ4clvNeK2YhfLfi9N8n9x8ufI5GtqOwTcR0XaEQvSDHq
	qWgbE7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFO-0000000ChGg-0v1b;
	Fri, 13 Nov 2026 12:19:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFD-0000000Ch9K-1pDS
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=; b=lpJ3ettuO5ab92FcedmbrEFw92
	6FQ008mOPJqaga0anNllPO6dXotDjcxInZw+tLkGh4KoV8w3Xe5PrOT1ver3tAP5byHE7z/tbGnZg
	3T+VN10hcQ7+9O5w2JxlCzCt5Z3YdE77HFwzUIszdyNDmjc89uvhpnUsRSEu2hO3GHOyCD0x1jrKY
	jiTgNHjmcjO+vRbjksHTTywKkmVscv+lrfDtt/AygPDvrclMCoB197teGuGyKIl8NPCcMglV+612k
	SFrrGEh6yLrmc8i2dIyaQNtC1K44QZmW9xjkzpuRVSRuMxmcTWkr2v3CKpzF4xXXWqlJ9mirs1AVv
	eJXQlvzg==;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF7-0000000BEIw-3Q4a
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:02 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so10835795e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572336; x=1795177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
        b=WU7LtPOOevq8MxczY11aGG/Fzn3V4V2lzftpWqDfUwx6TDFnioLKb877i5jzwVRjPv
         LLkEjY+2dbpnyuLQWdEuOv26bjWTSNizvSwodVYk66BxW4BFnqAFCiviY6Kabhk3lMBN
         ZCITzl/TX+nokymVMdfwQ+bWtFQ7Zgp4YpJRNrUe47ZNcXbueVFBN4eDALjZNFcGAzZg
         K5ObnApyou4MAh7BnhbGqVPcNoAeIgmW8kAO8PrQu/x4KSH9+eJ4wJG30lzRAHUYD1iw
         /whOjOe6LOAmbVMzHmd57rWzv3qbox6kdgGO3MNCheskD0HhWTRqnifP5Kx47bweaSdt
         BOyg==
X-Forwarded-Encrypted: i=1; AL+hErGWbenOhJpHM2bhRrE6YLlErWJzfloA23B01TnB3uQlWQxLGBW2yzE9iQHeyiePzYf06NXeFBM8+rORVD0B@lists.infradead.org
X-Gm-Message-State: APuU4Z9D1Figwy4cUcZOOMdmR7jP7wGG2xYy3OUcBbnrO6nmhRR5sFlT
	8VaHvAk1HoU3gjP6iojx31V6mmHzmBNAUlHGHj6x8ZJT9fmLQ+YOmLkP
X-Gm-Gg: AYBFou0rYRlgScGza1DAes+ZrP1RBII/GtqKiT1uKEsbQLpdEaA9zS1PJB3io6ONDmq
	J/FlgbJu9sDCGM81beEvbq75M3nfC/wkmPMbq5pEoKbaaX9ffW7o+yk/CBIZBCJgb2S59Ekm6jS
	6eyXFr4ecc8FrXn5kkmD5ipDf3cQj1zs9IUpcYWo5T9TsHXT0CS962UG58gqYWKF8ig0WRFJg3S
	5IN2Ko9COozCw9pSebSY7oH621shxoT8iECuJ/UALc40F+gQMhKW3wKyI9aWGn3915PedmGgpDO
	4W/yho13OZ2NVtVScy1n49iS572L2vY6tq4RWUpLD8oWh6n3w2zaIutL3DNKZzWO9fxVluxv9E3
	IpZJ1878WJ2JitO5h++eU4q8LUCn0fp3J/8uEl9cwoYfLSI+2dR+yuAPVlE494hYoJ+3JvvG7wl
	JUF4l42nRa92K4Ow196wEu4LhNcSo9VvmOvl1R+IiQ0sc8IXSUjjKMKGbdg6O5qgOrZgaLtN9kU
	U/j/+dh4kfAOrIXKGeeqpk1Zq+J5vup+6qw6rMmPao05b/OnncymZTqx727mF/RjPyOQ+c9Nsys
	NDXn4xOTdAQ7cviK43ulgwo8bhIoSrIfCXgkbLs/HqT5FQmI4nAtT21Mn9t2dpTC+X7/gWI6X8B
	qNyQRWbLuGJLnPvq32byuuwjJ
X-Received: by 2002:a7b:cc16:0:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb4e2fc5eamr105768935e9.16.1794572336252;
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
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
Subject: [PATCH v7 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:48 +0000
Message-ID: <20261113121852.334604-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121857_754380_38AFC07A 
X-CRM114-Status: GOOD (  15.23  )
X-Spam-Score: 1.1 (+)
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 2ad70f0dc4a3..ad30730db57f 100644
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
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
