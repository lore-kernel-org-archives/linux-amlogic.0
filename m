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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD5BC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB1A224B1
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB1A224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mq9geMm9LKfm1qZyEifAgG1riMo3+T+/zXHbW0Txb0c=; b=IMkI2UMVXil3TE6Q9/xTI3jBA
	a/mdjguzjjUntPMJILTy0AoAPa254xsS4Krk56KxUNj6ng1uP3HuiUNYxYmgoZoBErBSH/jkKlxLM
	Upy5L/uUG8dG9+qXnnQxe3GV8/sTODPP53tIY73guIqxA5yt+3XMb9m/XDBf7h4uDwGI6ENpSNPAM
	xEYZiJrYMYzAHLHJt6ORx8NPtGubzhJqcNifjO8Wt9A74v/bBVKFeNZ+H9W0KSQ8CoplIDV7I0Cnn
	kYkwTGR785rsdCyGuVkPDqFJdWiJKrlIakQKQqgzNLl5tWCrFKpT6doUNH1UqGMW9eMSnLQIeH5Kw
	5Xwh9VeFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDal-0002if-Qv; Wed, 23 Dec 2020 23:30:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDac-0002fa-VG; Wed, 23 Dec 2020 23:30:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id n16so2190119wmc.0;
 Wed, 23 Dec 2020 15:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/IDOsxj1FkZFtUZQ+5yS2bWitABPuLIIASx9mGd33kI=;
 b=VuJreDFTBk+1siGVQ+QRRhstiDMGPyx1JVqRSg0H3GSmQsrV9VVhi41vxE8YzrGwDT
 CKyuVPRVdBireX++b4ixYWp6/9NpnExbP4PeXoz5WCBA94ymcUZ9AeIxrgGDwyyJ1Sm6
 hPrTKx+BubGOz8LCXhq2Exl0/76wi0E57oA4UtxnVpdqltQUi68njhqLkKO26zKeHKkA
 Q5bifJzR9uzX/IruDbyBTbo26rg+wkRP9VnzDtYjyZpC/8hkbBKFbVaBt4Cg9B+Ajzsj
 cL7dYuIn/BBiXCUipudEkc9c9iWcngVBVAt0U2AEBSyj5Cg394BuXpxZ7AgHciaMCdoe
 EhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/IDOsxj1FkZFtUZQ+5yS2bWitABPuLIIASx9mGd33kI=;
 b=EEXc+if1uj6ggNq8qL3mJYRtinVZ9vJsdY+nbbjySWTJy72A6j1NQAq7QaGgkWh1MU
 I5SQ0IAv9gqtd2dbJx18Q+9ZjOzAEuYEQJtJLxsGIJKMPlHud8brVpPMmGyTvJclYH53
 /mWWaiC9T/uH5TN/3rjH14sJnPzD7VuclGRLeGvgItFxY7hQnMT+gBhV+J0LgkpKqAbT
 r88TIlQ4CHpR2YB+lOQgIInf0KSZHKEs55VzpvdDTEk7BU/oNTvBAk7kYmpCb0PGsC7R
 zjwIAyd1p9oj6halCzI3QxhhhRS+49f7zDAVyryylyXcMWWur+otGc3erUJH5f2XXn9m
 D8Iw==
X-Gm-Message-State: AOAM532qJb7A8Mq3fRyPFrggxcnw48uKnwLol/val3MbLp4+ixVkjhsh
 2Zb9neF+T27t+kf1aLgYUwAf8WOcDRo=
X-Google-Smtp-Source: ABdhPJxfDnawgge8i9/tFQIhr6IWYLXwiiT4tq6T8h5vUGsTJI+w9PHPHpL4xlT+G3MUACp0RmJbhw==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr1717943wmg.37.1608766239904; 
 Wed, 23 Dec 2020 15:30:39 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 2/5] net: stmmac: dwmac-meson8b: fix enabling the
 timing-adjustment clock
Date: Thu, 24 Dec 2020 00:29:02 +0100
Message-Id: <20201223232905.2958651-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183043_036106_0C068B16 
X-CRM114-Status: GOOD (  15.96  )
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

The timing-adjustment clock only has to be enabled when a) there is a
2ns RX delay configured using device-tree and b) the phy-mode indicates
that the RX delay should be enabled.

Only enable the RX delay if both are true, instead of (by accident) also
enabling it when there's the 2ns RX delay configured but the phy-mode
incicates that the RX delay is not used.

Fixes: 9308c47640d515 ("net: stmmac: dwmac-meson8b: add support for the RX delay configuration")
Reported-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index f184b00f5116..5f500141567d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -301,7 +301,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		return -EINVAL;
 	}
 
-	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
+	if (delay_config & PRG_ETH0_ADJ_ENABLE) {
 		if (!dwmac->timing_adj_clk) {
 			dev_err(dwmac->dev,
 				"The timing-adjustment clock is mandatory for the RX delay re-timing\n");
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
