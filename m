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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054F6C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D4322B40
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D4322B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hmgqppbPgO4P0t0E5q3U2NTVlKurchz/cJudn0u4nXs=; b=dSF7vZvPVE4Rmf7D3uHXnqyVL
	r38pt4LwwBY4tGJBXl+1645PvoNqBCpHiNfJdUhLeElo1b3AceTjzoEtm3zmgFnavauu6xa9Ur1H5
	wiqiRRx+ubvszuS0q+qCxlX42B0mNSSueCUmc7r0iiCtCTqyiRdPd8sTyv0f7pr/SqG07DDRDNsXi
	GLcK82UPA+YQ42kUgUVzac17r/B8wsSKDTh2PSjJjP3sIk+Gu3ZcwmSjlth5o6ERnbrqNF/v/AgRL
	XkyQHzUuhMuuxZVzXefmyV/swr8IoEO+I320y4KIzdCsfWIPpJ1nPBIfcLpjPkvwmd2Wgg7wugntv
	DrkfmQb8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx96r-0008EP-2N; Wed, 06 Jan 2021 13:44:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx96i-0008Aj-TY; Wed, 06 Jan 2021 13:44:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r4so2659877wmh.5;
 Wed, 06 Jan 2021 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxZLTc7rIJqLiJdfqS1xtEvX/QdxfbBjIy6J1+OLQNE=;
 b=IM3iZ4sPhKgYRgmLXkyxqO3lbGRcEzCB35idFQMDqIGzIkLMgyMe34WRg0uz6B0D0X
 RfDlRfrHmm5RSt/EfDpfapTTxq8qiqxmBbtT+kMGRk+2BIo2kMU6NxoEQ2znALmQRaCj
 ZnU+6Az6+diszOdSiS0SkWxBAiHPPMB5dlcKR2qlkRmhCsfhcvQa/tIhpWWOIMAF7bij
 KerJJ1KM1FUWtRyGa/W60M1CrZ48lMzhNkXOcIhLFkbFDqXlNkqIlWClykAECCtZ3hS4
 lau4tY66z5RXP8LIZ3WQ3Z3e0CpK0JivxJt5bpQbr3fJl5EYS6Rm4DnZ6pN6HBRP6Qrc
 AW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxZLTc7rIJqLiJdfqS1xtEvX/QdxfbBjIy6J1+OLQNE=;
 b=i19FOwoSin1QcKg4MtX2jyNqXlYgTxN/nUsK3a8TWAsdgJ6Xt2uTHg64x1yIDmNy2w
 nkCOEDG7NGpCtvKGdfpMDprOIAAjKB5AVM/P4ODxs3Me0r32zk2421JA1IgN0GFRzCzH
 2G1qOUtnhaAt70r+G/yxxrLEuas5ZJhZYO3CquxFkeX5eaDyI8Wht0+cGT0HcHM+djb8
 YkibFSk3Vf3466R1L/qWXxXs2B9Dd+mdBdPtDKL4AkEhsK4qQ1VLuiowI48Tip+2ziJq
 IqFa5qXofaLmBqQxuIa34QcyZWhVmE6wP3aFA416usPEiogZI0rQJYbeB1t4YxLjQqTq
 RaCQ==
X-Gm-Message-State: AOAM5304QUmHI69Ev3oAfYUkgA2sLUUonQlftIFmS0VtN//AwYPgQrg6
 V4nvAej051oIrjGW7pmJ/RSZKGrmc1w=
X-Google-Smtp-Source: ABdhPJwfCUpDM2zedZ6Ij/scp6mHXprurYB1xW+w1ei+iiMBq/uFUOVnbjd+JJvVnjYc+FsdkE12eQ==
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr3714963wmk.103.1609940651943; 
 Wed, 06 Jan 2021 05:44:11 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f14sm3085351wme.14.2021.01.06.05.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:44:11 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v4 2/5] net: stmmac: dwmac-meson8b: fix enabling the
 timing-adjustment clock
Date: Wed,  6 Jan 2021 14:42:48 +0100
Message-Id: <20210106134251.45264-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
References: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_084412_981353_9603D8EC 
X-CRM114-Status: GOOD (  15.33  )
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
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
