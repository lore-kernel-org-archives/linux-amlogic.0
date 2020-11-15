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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57221C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D262225B
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sIDTwV2b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="f587MDHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D262225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P0w3K430oOmAyZ78EfDLS1A74s2KYpEjbUXjJwHxwaE=; b=sIDTwV2b5MpS/GSm49GvrnUUl
	BuRHL1V0f1TRBF/7SaGUB24e5v6DjuzXLVLYpbgK1Eply4Vgr4mMRHuteimdjwnXLiEuF6T42fa50
	hSzkr/t+vzcky6AVU0jHWpfRwmrVCVwz9Lx1MWa7RnDysia7G6ceBiJh9z9Ad1bSKghITl0F0oRkL
	ZW5rarV1/A4BSrPE4NPK+beXCyIEW+QcfnXZ0YDTB0QQcG2R1rfus4pHQX6nIqcY08MjrKZ5vWbly
	pKYECfCm3hUJ5I0BReqMB4+xkOYmbdrGyLAj7IZfWtC3J1b2AXeb06WPb+/muYx/U33OiitS3o77/
	ApJ7pKk9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keN8v-00043p-DW; Sun, 15 Nov 2020 18:52:53 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keN8n-00040Z-1g; Sun, 15 Nov 2020 18:52:45 +0000
Received: by mail-ej1-x641.google.com with SMTP id f20so21333444ejz.4;
 Sun, 15 Nov 2020 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRS8GQW7oFuDCzXfRsoeq3MgyVfqDxglzJm0FE7yRX0=;
 b=f587MDHdn7XtFw7QnkvRKTUkPbw+llLKwDIbrFERtxe484uRd/l27TdG3G6uBPv2sQ
 oe3ztZVMs/+xreCw6LiWtw/VnOM67joIc+S1ng+Gfz9qLbmkAPxXYPQ2m61eAkF9tOW4
 CLtCU18t99U78UWd9h9Lwwqp+Vu4hQswFwJQq5Xi9ZjnsOdTsfhO1CPg119xhPQ98ziE
 u+2YHT6i/C9OUQA+LOAdpftr4mHUuzbCb70q9nR2oO3T3u6CIuZZZMNTezzMb2SNCrq7
 S9r5afOkT/s0YpIgt6oCkQ02F71M2sP1tBkVX5IFWCWaWFLseWYRaZVHLdjf7vSkYaX+
 LnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRS8GQW7oFuDCzXfRsoeq3MgyVfqDxglzJm0FE7yRX0=;
 b=X1IEBOPYhqQQCzb/+N/wkrmBeu1hvemH3+2xN/fjlxoRcO34ncoqLoUHfyU+yKcOM6
 Sh1JpUb+atjYRwfADgh0LiYbHpJfSXOugECjNtVtIphqU7dGNU3vSEcuSyQ31piciu7y
 yLYHNimNTzLrYBb1+Wm6nhj/kLoB9oQVo1PHh9X4mY3i9rXKtvy97bFYxOwIbhfOubO0
 sGedU8TC+H7GdGV8RD9J1zTDZ14saZq+lESGOaVNk4QQo55ISw3r8VDjxxPK2hA4RZj6
 1fIdPQT6G3HTqIIK6TEtf0HxAtOp5Sv2ZjJOG/GkSOB+CVS50zuu2feQkc54HO+hR0bp
 yC4Q==
X-Gm-Message-State: AOAM531ww+dQ2AaFkkynaF6bZ+xwl6agBeeY1NhRVlMPkWMnnTVmoiUu
 mzdZE7WhknaOD8/8HrrC2Qg=
X-Google-Smtp-Source: ABdhPJxtZ9gYOz1qZtZ2rnw8Jpwnq+Ma1c4Bn4rMhkOiBvWsBsEMVZ7OK911BkbmC7F7XIqmkRPS2Q==
X-Received: by 2002:a17:906:cc4f:: with SMTP id
 mm15mr11356813ejb.267.1605466364252; 
 Sun, 15 Nov 2020 10:52:44 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id i13sm9233520ejv.84.2020.11.15.10.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:52:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC v2 2/5] net: stmmac: dwmac-meson8b: fix enabling the
 timing-adjustment clock
Date: Sun, 15 Nov 2020 19:52:07 +0100
Message-Id: <20201115185210.573739-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_135245_115849_7C5F9B73 
X-CRM114-Status: GOOD (  16.05  )
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

The timing-adjustment clock only has to be enabled when a) there is a
2ns RX delay configured using device-tree and b) the phy-mode indicates
that the RX delay should be enabled.

Only enable the RX delay if both are true, instead of (by accident) also
enabling it when there's the 2ns RX delay configured but the phy-mode
incicates that the RX delay is not used.

Fixes: 9308c47640d515 ("net: stmmac: dwmac-meson8b: add support for the RX delay configuration")
Reported-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index dc0b8b6d180d..e27e2e7a53fd 100644
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
