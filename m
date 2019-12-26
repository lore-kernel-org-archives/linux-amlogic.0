Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71496C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C412080D
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOSElIX4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mELOjX4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C412080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKC1rI1StReq8dxSUy4kUmbMzQIpIOjnyLIM+Gpa37c=; b=XOSElIX4OuPnFM
	2oLakiB0H6Tj5gFG1rAntXIWV2RSCjQH69luI5eqoFoIn60RMnWIziiPwsYCn/A/YvfdR8RyPlyM6
	xcQcsMEH3XcXlZlhE3u4lkKp5mVJC5X0eybgLnM/QrQfM7hIgtBSnRUtbyfDYX+2YvHk4Mr6gPRjK
	3twiTL4mJRZ3IU2fFhk7SJErkpoxqKaiZcoeF2jmL4hYOEPq2djLRa1VxwH51pchx7UfPg+07zjRn
	PyvEit5UdDDThCh8DYRSefLryBSf1czFdC50ohwqBexRZMnOEkkj9579el3dk02bWbdUnxtk3D1pb
	wktTQFidnBa9SCPC18sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikYO4-0006bX-Kb; Thu, 26 Dec 2019 19:01:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYNp-0006MW-AA; Thu, 26 Dec 2019 19:01:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id q9so4921403wmj.5;
 Thu, 26 Dec 2019 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3rTKkxQ4jW7k/v9aR/psmRAwE+gN+ZcbP3Syw4+shY=;
 b=mELOjX4SoFXM8AIHXZRIeFnnO9Y9LgnWsu0GIsFn/9o3LYHSDm34OAyN54M0CIE976
 g6x4Mv7Z1xm/KtdgWm+DtHlMDMtdcBlKd8JzOVuyRJn/nTmxS5qnmqGrDdkhnYx1iqqT
 uJeydm1jD+sPIvsAb+IjfYPHOX2Etf2GNbfnuSDMPe6zafIuuvhnTwraW6BBmTsQfNbi
 aUsNny/3WM2NxfQoZuH/JjU8imbxePoXVI+IQvqq5QRlm7W+dwQTtx4g4aLVfhqHKnDm
 M47QUxht+pMbSs35w9DCmZk2F8XJb2CgZaHESFNfgq/tCg2TagCC2tYhLPANuDqrJrnG
 SPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G3rTKkxQ4jW7k/v9aR/psmRAwE+gN+ZcbP3Syw4+shY=;
 b=UlW6fk8Om0neHAQX26WML17m9gpFEW71yEV1HJ8h8sa2ZmL2pbdte1IjwxAql/Z+fT
 dkFgk0YVr97iG8MMhrTBgGIc62Z4rJLRmoWroQPD9JmU87G+Wiq6mSPcXdZp7ZbaKl1A
 n+9L/H75PMko0gzZaETQUS2HVO/sJ7fxIcoeg0X6wO15pRdtmeyTuGdH5077fua9ryKg
 Fb/G6OXM527lmy5cHV/iZ1BHZR7LkPfsogRpmd1mQlvT0y/EZJRoYElsQ5NIUtT0+f0L
 zdEV+h96c09azxhU8kwUIHAgvjPKP/+SKbXo4SSmSpU7m7jQdzy8+lqNnvR5bpMVElTE
 iR5A==
X-Gm-Message-State: APjAAAUTN5sqHyZq1APXNM4ly4XNWYez/ex6G5UJ0us7aIgeUcUFWlkA
 UmxS043crFrThf6+Vpn+MYblEzgB2Jk=
X-Google-Smtp-Source: APXvYqxXejnGcUgKodwQOfW9DCOGrgj2XtI1U1hjLycE2F7TOewPOhFjXUH3LM8ZXUN0XWcwkm3rWw==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr15862281wmj.169.1577386874993; 
 Thu, 26 Dec 2019 11:01:14 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u18sm31777854wrt.26.2019.12.26.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 11:01:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/1] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on
 Meson8b/8m2 SoCs
Date: Thu, 26 Dec 2019 20:01:01 +0100
Message-Id: <20191226190101.3766479-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
References: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_110117_348142_52A80505 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

GXBB and newer SoCs use the fixed FCLK_DIV2 (1GHz) clock as input for
the m250_sel clock. Meson8b and Meson8m2 use MPLL2 instead, whose rate
can be adjusted at runtime.

So far we have been running MPLL2 with ~250MHz (and the internal
m250_div with value 1), which worked enough that we could transfer data
with an TX delay of 4ns. Unfortunately there is high packet loss with
an RGMII PHY when transferring data (receiving data works fine though).
Odroid-C1's u-boot is running with a TX delay of only 2ns as well as
the internal m250_div set to 2 - no lost (TX) packets can be observed
with that setting in u-boot.

Manual testing has shown that the TX packet loss goes away when using
the following settings in Linux (the vendor kernel uses the same
settings):
- MPLL2 clock set to ~500MHz
- m250_div set to 2
- TX delay set to 2ns on the MAC side

Update the m250_div divider settings to only accept dividers greater or
equal 2 to fix the TX delay generated by the MAC.

iperf3 results before the change:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   182 MBytes   153 Mbits/sec  514      sender
[  5]   0.00-10.00  sec   182 MBytes   152 Mbits/sec           receiver

iperf3 results after the change (including an updated TX delay of 2ns):
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-10.00  sec   927 MBytes   778 Mbits/sec    0      sender
[  5]   0.00-10.01  sec   927 MBytes   777 Mbits/sec           receiver

Fixes: 4f6a71b84e1afd ("net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index bd6c01004913..0e2fa14f1423 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -112,6 +112,14 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 	struct device *dev = dwmac->dev;
 	const char *parent_name, *mux_parent_names[MUX_CLK_NUM_PARENTS];
 	struct meson8b_dwmac_clk_configs *clk_configs;
+	static const struct clk_div_table div_table[] = {
+		{ .div = 2, .val = 2, },
+		{ .div = 3, .val = 3, },
+		{ .div = 4, .val = 4, },
+		{ .div = 5, .val = 5, },
+		{ .div = 6, .val = 6, },
+		{ .div = 7, .val = 7, },
+	};
 
 	clk_configs = devm_kzalloc(dev, sizeof(*clk_configs), GFP_KERNEL);
 	if (!clk_configs)
@@ -146,9 +154,9 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 	clk_configs->m250_div.reg = dwmac->regs + PRG_ETH0;
 	clk_configs->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
 	clk_configs->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
-	clk_configs->m250_div.flags = CLK_DIVIDER_ONE_BASED |
-				CLK_DIVIDER_ALLOW_ZERO |
-				CLK_DIVIDER_ROUND_CLOSEST;
+	clk_configs->m250_div.table = div_table;
+	clk_configs->m250_div.flags = CLK_DIVIDER_ALLOW_ZERO |
+				      CLK_DIVIDER_ROUND_CLOSEST;
 	clk = meson8b_dwmac_register_clk(dwmac, "m250_div", &parent_name, 1,
 					 &clk_divider_ops,
 					 &clk_configs->m250_div.hw);
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
