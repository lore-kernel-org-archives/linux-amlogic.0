Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72483C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D99D224B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D99D224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=er/0qSUtG2gt9qtyxsXexkhGY5ihYClcRFP7PQy0PI4=; b=kp8sZ30CEFwh0FyBSUiXo6Sa8
	gLgqle2EwoBMX6m05fZUlhjG7WI4YL3WM8mH4qLdY/4/PuLnR/iVTqIssucj5WoT9B0T/X0qsFc8T
	rV890IiaeOXtqrWYEjPwpwolX99Qkg57A+bWNE79plTdyBe5Yk2Mp2SRIldqV4uG0GNYenYCiHnNG
	WUzQeM4j/W+l5bwuR9mKXWcM9SlayHrQ8tCEWkLf568Roum/XdLqvHBsDdfhZhMYlUMe4ztM4LJDe
	u2CBVuRJE0sijd/6pl4AjvaYxRVm/pCOa3Itp1Nmb9HLVj4B11TRQlSlzJFqh5k+FIVmYF+oG88BO
	fLBh85LyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDas-0002kD-JP; Wed, 23 Dec 2020 23:30:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDad-0002fd-Bd; Wed, 23 Dec 2020 23:30:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id r4so259941wmh.5;
 Wed, 23 Dec 2020 15:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0ndzokyweROc+1+J72pYZnLkVJUHj/9rLRl9lmhXAM=;
 b=aVjgPZg44fBmUtM/n1tXl5BjwycXTr85OlZeWOeTYBjSrDuPfOjDaMiBSlW22IkGL2
 RRJuNLufji3FLz6vpOSzmbFiVepP3ZndqPgPRDtwKrJ8nurJXhEOJ2KNQ10VNA0f89x7
 5t6xcdFK9sf0vI/FTYoYAI81SkwMX6adJT2MzW/wmDqf1E7uEGtM6MazTJOq5s4p8KHq
 FfKptQRd4vClm39VPV2i0XvsxFOKJjuYardGH+TXp77QGoVOpPAnHkFpD6vrWiVxFciM
 cde/TAuQKxfWpJzdlWuZYSbEMPr/OThJVuPS65g586zg5Tx7+5AU3agH2vDUpG/3RZAE
 uAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0ndzokyweROc+1+J72pYZnLkVJUHj/9rLRl9lmhXAM=;
 b=f3c3dQU5wqAzn/mPQHYAI3+foeRPik33NFxF+mnILMvJPAui5JteggrEnxiVGPUIB0
 uWxSPfgh8aLrnePeIyrwoJK4auadoLfsTo8bQazgCVHM9GV+kGnOnL52ZFdnOQasqRf8
 rDb8UgwX4hMVi2uoRsms303P7iy+OXm+B4p2BwVTTEv2ldPd8FoPpz0RviQdFOOFMj4Z
 +QlHVzgZk5//iMt8eP1oDwgJGL2jVkZoxLp2aJP5gu/BB8WDDARUOZJWXaA8gGBLeEes
 gJYiCvv/tht1dl9dBpkDpF1HTbCPXa8NMEN/7CkkqlvUmI1x29iHBhnVsM6J28F+XUp6
 vSUQ==
X-Gm-Message-State: AOAM5302WAMcuXDLDPm2ZB3WAHuDAaXduOgeRRoqUlGooThBdcp2L0BG
 neZZ6ezI3nHDCUTguH/NetEAdd52JDo=
X-Google-Smtp-Source: ABdhPJw80ydPE2q0jtj/nk7tg5lGhT3vPnadHtbZP5NDS3hsaBkJ0NAJ7DCwCWGiXCIAlpNHXDOWSQ==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr1760579wml.155.1608766240943; 
 Wed, 23 Dec 2020 15:30:40 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 3/5] net: stmmac: dwmac-meson8b: use picoseconds for the
 RGMII RX delay
Date: Thu, 24 Dec 2020 00:29:03 +0100
Message-Id: <20201223232905.2958651-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183043_438221_FF503C8F 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
delay register which allows picoseconds precision. Parse the new
"rx-internal-delay-ps" property or fall back to the value from the old
"amlogic,rx-delay-ns" property.

No upstream DTB uses the old "amlogic,rx-delay-ns" property (yet).
Only include minimalistic logic to fall back to the old property,
without any special validation (for example if the old and new
property are given at the same time).

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 5f500141567d..d2be3a7bd8fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -82,7 +82,7 @@ struct meson8b_dwmac {
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
-	u32				rx_delay_ns;
+	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
 };
 
@@ -276,7 +276,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
 				   dwmac->tx_delay_ns >> 1);
 
-	if (dwmac->rx_delay_ns == 2)
+	if (dwmac->rx_delay_ps == 2000)
 		rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
 	else
 		rx_dly_config = 0;
@@ -406,14 +406,19 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 				 &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
-	/* use 0ns as fallback since this is what most boards actually use */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,rx-delay-ns",
-				 &dwmac->rx_delay_ns))
-		dwmac->rx_delay_ns = 0;
+	/* RX delay defaults to 0ps since this is what many boards use */
+	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+				 &dwmac->rx_delay_ps)) {
+		if (!of_property_read_u32(pdev->dev.of_node,
+					  "amlogic,rx-delay-ns",
+					  &dwmac->rx_delay_ps))
+			/* convert ns to ps */
+			dwmac->rx_delay_ps *= 1000;
+	}
 
-	if (dwmac->rx_delay_ns != 0 && dwmac->rx_delay_ns != 2) {
+	if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
 		dev_err(&pdev->dev,
-			"The only allowed RX delays values are: 0ns, 2ns");
+			"The only allowed RX delays values are: 0ps, 2000ps");
 		ret = -EINVAL;
 		goto err_remove_config_dt;
 	}
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
