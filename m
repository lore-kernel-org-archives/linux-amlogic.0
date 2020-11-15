Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4551C63697
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:53:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DE82225B
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sdy9E3If";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gpxkUd9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56DE82225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OBJO3XleBel2drUcE3+4QOAI0/zr5Sho39EBcBRIX+g=; b=sdy9E3IfYeTObQQK/R2v6MdOX
	m7NHiPxHswyvFEBpqQ83KEMwvbyyDk+u6EeXznjrDzXQ/WkMWzGEvS8wtKrIMrZQ4TSrWPoqsNRip
	7Hjewr4NbIZRUgd8qvyR7vZAiHbyQB9GztmJqF3DwJHGDtCzeefI8I1vjPG34KE5eHYbEcl7capUD
	17Z5YZZu96+JpjdKUHEXX2eNO77J6B/0g3FnfNX0yV+NYsgU8IQE3TzbsCAdAia1ZC7Hlv1h1Lg50
	QF0HxLD6efIfAAkGkuCeED5EwWutWUvcgmXIYUGIbmhN9IRsVR+ICElJE/w50XgmYFE//TuWcCUJ2
	ObFPZM7pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keN9C-00048x-LW; Sun, 15 Nov 2020 18:53:10 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keN8p-00041f-I1; Sun, 15 Nov 2020 18:52:48 +0000
Received: by mail-ej1-x642.google.com with SMTP id za3so21326819ejb.5;
 Sun, 15 Nov 2020 10:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHdUr6fpSlLoSsUqR0Zir33G0bTUJp5jRkYS8g8PmZ4=;
 b=gpxkUd9/dkkmdPKleMJPJB7kz4sRjVV2Kbrn5gknEKHMn5AUENOqWfDyjgSVW8Znyc
 nXym0OOIPPzhN+2yD13xZml484CFC78x3EUny6jl/158IHyggecUVTPEtAwQ2WQJmL9a
 XmeLMZaU05WLhq7T0Eom23BgZVFiHc5gceEI9bivE+NG8mMFC73VDZJjKh3NLO/bNhyV
 XEY9SKuMwQ+uNGrb7pZunyOqsx2c0dWM6Va3N999+t7ydLkiT1hUSoI0KcEiKPXPc0Yx
 VvNhq4ZW9kVFAzfbSBx5xQPsZUCaWxWANma6xEdGXcNzPwKJErf0JhhGh6mUZQXFj1pg
 ImZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHdUr6fpSlLoSsUqR0Zir33G0bTUJp5jRkYS8g8PmZ4=;
 b=NckfIr9EkXzO4Z5eoggCd8jvII1I3jebhH23Dz35Awz4U2e4K2mhY2LqwnAmUzAFri
 0AtDOe+qFJEuE1f3KcNJk/d2RV3OXKVSXvFn8r9SEFHfkdrBYaO51NQZmJDq2APYM+ac
 8vfdUdxjmLzWL8FII5hY/g1bO9HvbV7RbIEMxPZvXazuSRDqEFqTktlNYEgeygFuWVev
 Ltsu+o4Jn4PvDzlpgRVNA1hK+7LyIumuZy0ZBfQzHMspZQnVgU7HEBHvLwZKjs3Rh2ia
 3JRE6/F6aEawdI/z7v/ZDCk1QqXe5ozh1Na3YRKBX4W/1TMZBFw7GJQJUqqJjiqDmhgL
 SDUg==
X-Gm-Message-State: AOAM532LF0edYY72mYrtNTzEsGnr+SVcvs2iL41jJqUzm3Bxagvixvnc
 GmHgXcCAR670Z/4yPqEMJ2OsCDiOntfEeQ==
X-Google-Smtp-Source: ABdhPJyHIgNVBDu5Qb0c7Vx73M2CSe28Ex8GelfAj7Js4a86q4b4sH62ljU4CgOTkE62qWh8l/p3oA==
X-Received: by 2002:a17:906:a88:: with SMTP id
 y8mr12421672ejf.469.1605466366301; 
 Sun, 15 Nov 2020 10:52:46 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id i13sm9233520ejv.84.2020.11.15.10.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:52:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC v2 4/5] net: stmmac: dwmac-meson8b: move RGMII delays into
 a separate function
Date: Sun, 15 Nov 2020 19:52:09 +0100
Message-Id: <20201115185210.573739-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_135247_711587_EEA94F5C 
X-CRM114-Status: GOOD (  15.66  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Newer SoCs starting with the Amlogic Meson G12A have more a precise
RGMII RX delay configuration register. This means more complexity in the
code. Extract the existing RGMII delay configuration code into a
separate function to make it easier to read/understand even when adding
more logic in the future.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 03fce678b9f5..353fe0f53620 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -268,7 +268,7 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 	return 0;
 }
 
-static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
+static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_dly_config, delay_config;
 	int ret;
@@ -323,6 +323,13 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
 				delay_config);
 
+	return 0;
+}
+
+static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
+{
+	int ret;
+
 	if (phy_interface_mode_is_rgmii(dwmac->phy_mode)) {
 		/* only relevant for RMII mode -> disable in RGMII mode */
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
@@ -431,6 +438,10 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
+	ret = meson8b_init_rgmii_delays(dwmac);
+	if (ret)
+		goto err_remove_config_dt;
+
 	ret = meson8b_init_rgmii_tx_clk(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
