Return-Path: <SRS0=HsQz=GJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A3CC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1577E22B40
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1577E22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6LhjC2YBFrL2kjlO3rKpK6xWToU0rId6Z0paeG4S/1w=; b=hphaEIyhR58cYwGgACXYu7GuQ
	Gem/DEQBPHk93S8JXEqZcwRVCjJkYI76FKEYphCya6I0PSvoB4NTtLNabQaOSdkraULOeF0wVCgTf
	36PFfrCEROofPgHTpEAc3ozXBR290MJjnXz2qZSNEWhICvDruxxTaEUf2HUDQUbU3uF1XxHjpX1io
	1vNNnv4K+0TriM4B5P3RYFG7hDtNGFYQh3ifHatU7lggq3ycmszQYVrQNv8V5H/LBfDlKWQ5l/rBA
	Koi+1gNPRguFfqhPqr7G5OV3hBmQrFnjv3Lc7awIFRIuO2dAyuChpZCiL6BRXJjMQghDtnYSD4ofQ
	IpDEoqRsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx96x-0008GR-Bq; Wed, 06 Jan 2021 13:44:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx96k-0008BK-Kr; Wed, 06 Jan 2021 13:44:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id n16so3167259wmc.0;
 Wed, 06 Jan 2021 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTb+k2pRqhgJlqYGQ9koQKDY3V9IU7jTeMtH7IVE2Bk=;
 b=n2TlifdC0IdbJLoIs4dTjj0jRQ4cbC30Lz+YEpD5BRktRZBozXm0LR77dT7ETmJKo3
 qgrqFWVsLJwrt3JFkUX95BKbMMhhZpY8sopzP4ioWUN7FdQ/vhTHgyBeihI9Li2zVcZO
 zeSojbY7pDoiMFsAN347TmT6jMwT74EaN4O2VZq9pmJjUOPfkShdmijvoh1F/YwbjNQE
 LHggTy8bCIrOpaS+p7lBByPYcTRnNRkLdIE5vlJ+LEpq2WG+a2vBRvmofNrlVbS9B001
 sXMRrJlKsFUqd84ZAjcEpyaGx+Tq/uTokFpZiGQ/5/QkcsvJeixcCFpG9x4Ny7xGkD9r
 EPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTb+k2pRqhgJlqYGQ9koQKDY3V9IU7jTeMtH7IVE2Bk=;
 b=ugWTSCqk9KUNqpFqgS9lmtHIWALPOlLNi8gkPiyoGYVIQz0Jn4+85LvrXl4hzOzXq8
 oOlRtCuZg7uxJRJhhaxZkZLZ9uPAx9tJLyxceVsbuzCazi2T9oTB0nwwDtw6LZJkFUqQ
 IvttSvyPaRLd1l7I4t8ELW4H5gVKp2O2ZpxAK1LDvS+8W4V/oLvDNlyla+Uu25MFceQb
 ++LwdcWi04fTEgH5S69rtQc2L84GIacSaxhWJJPhvDCsbuSgliJSaooolpkvHM+NIgv9
 0oF41FOFQfRU1UVMWwy8CoZ9R73olGAl2B3AeMxKa8K8bCJCTYQAb9Fpl4SYNJaa59P7
 AL+g==
X-Gm-Message-State: AOAM533vVvlGwQiPP9fRUn3eK6F0uK9OprYpc7KN59nPLJUKry/Fjhh9
 bHfN7yVLraiq0LaoJcenkT4l+3yTMuY=
X-Google-Smtp-Source: ABdhPJwsoNEaPfjZGRdpC54PCzOi6QGvWRIaR6aeXW2oARQpd1ka443VCGJkklLWft9gGAxSNQ9+1A==
X-Received: by 2002:a1c:3d55:: with SMTP id k82mr3683525wma.57.1609940653005; 
 Wed, 06 Jan 2021 05:44:13 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f14sm3085351wme.14.2021.01.06.05.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:44:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v4 3/5] net: stmmac: dwmac-meson8b: use picoseconds for the
 RGMII RX delay
Date: Wed,  6 Jan 2021 14:42:49 +0100
Message-Id: <20210106134251.45264-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
References: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_084414_768983_B599BE88 
X-CRM114-Status: GOOD (  14.53  )
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
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
