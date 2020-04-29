Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F34C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931B02082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VS4t//R4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QveB36T9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931B02082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLGeByjfkZDHC27+bAULyJoOjTmbxImatkzY8F3423o=; b=VS4t//R4fluIn0
	pMpDGJOKbWzem5E2bsXDbhg1sZMm5SteLwqihCf0o8uOiQn9KxtH4ShXkqGI4lQZqBCZYkEUv4idR
	ZNfm1L4fnfyhDpZgst3MP5gNbDHn+QuYaOrUXwx3yBYfW4RnSwHRM7dhow9Z6qYrYaNpSchJtHnhA
	o64FtNnu6BCPzOTVWdpkXtmj7DyyzhvQkI8gc1+cs2aIRxOBU+SLXyUCMAYBPOqrpZEskQ+8z5xMr
	RaPcAdexouyPiixSCgIyHgKBCE2QQ3JimNfdlMtfuFrq4m47cJsYQ+yjVJRvfoiYnPDDiANldvNxq
	DB0u7F/NFcnBN5qnYGPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtBu-0003cX-6v; Wed, 29 Apr 2020 20:20:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt94-000765-5j; Wed, 29 Apr 2020 20:17:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id s10so4152347wrr.0;
 Wed, 29 Apr 2020 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0knvu8zyqVx4y2NkIr8lOmrEgshGQH0lpKJi3cjk2SI=;
 b=QveB36T9cQfiMiI9HNOdZ7yQwlct6qNuNxJikrgRPBAt+IVOZQpzYY64/wICgNjMEE
 hGkVzt4CRM/9icHJ7hoBYLj/RfsYzQr5i9OTVlJc328Utkbe6rku9I2AZD33/SCOwxdd
 LvBWWSfiFVZszv6UUklwzPO0/bCoZ+IboL/FMLCIRy8ZBki4UlQWoszUwRM5B2qDj2jm
 GD/sfTOz9Xz0ZYrdPkCpPJAsR2YJHJpdfSlWFV77DeMeuV4Si8xVTszKN9Ibf+rfxVkB
 azePNdVax5XNLpUgEktsaqVBqJBI/lsZNEq7ARgbx9DCrbLcPxpuO+wxQpjrpSq6570r
 EwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0knvu8zyqVx4y2NkIr8lOmrEgshGQH0lpKJi3cjk2SI=;
 b=Wtef5ivQ2lP4YZRd0evwj/HxX7wnH8NG+2t0vqOd8JcP4bEtDlVZBjXaQPT2aEr78Z
 vXTm1E3fk+7OemQVCEygHoPoLLfscUEK3lz40lmQA5iDF1PE0n74Qw/9vSF+fYRbAo0O
 eogqxI3vkhew6XdOE5pmcKU9WlWF42yFqwcnz5Gs4orE/JfpWetBP3pKZAaR7NrLvXCb
 Kv85I1fKAaBVY9MVaZQqmHUQs23yHg3ol9IJShTF8RYDFgCwX/zrJnWAKGjz9l3Y5pRk
 aCNUl9a4rmjW/Eu0GtHZ7bIQhj/yM8wd4/hm5cRZkCQ/2/NBri3i7y7yQBnbsGZP2tmY
 /YYw==
X-Gm-Message-State: AGi0Pubg7+oZ5A40ORq67gAb9LIUPW9RDjzhKDC1/cGOMnIrYJthMozR
 2LNvGyGhlRSNPoo6occ1zc0=
X-Google-Smtp-Source: APiQypI7/tFm351D0aZQ+OFBTov0tzQC4j8sVuoaGKjl8wXkEwEwydb01p0/bZVora7GdZbF0ZPmWA==
X-Received: by 2002:adf:fe44:: with SMTP id m4mr43579867wrs.188.1588191444705; 
 Wed, 29 Apr 2020 13:17:24 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:24 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH DO NOT MERGE v2 11/11] ARM: dts: meson: Switch existing boards
 with RGMII PHY to "rgmii-id"
Date: Wed, 29 Apr 2020 22:16:44 +0200
Message-Id: <20200429201644.1144546-12-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131726_809656_64D9FC6B 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Let the PHY generate the RX and TX delay on the Odroid-C1 and MXIII
Plus.

Previously we did not know that these boards used an RX delay. We
assumed that setting the TX delay on the MAC side It turns out that
these boards also require an RX delay of 2ns (verified on Odroid-C1,
but the u-boot code uses the same setup on both boards). Ethernet only
worked because u-boot added this RX delay on the MAC side.

The 4ns TX delay was also wrong and the result of using an unsupported
RGMII TX clock divider setting. This has been fixed in the driver with
commit bd6f48546b9cb7 ("net: stmmac: dwmac-meson8b: Fix the RGMII TX
delay on Meson8b/8m2 SoCs").

Switch to phy-mode "rgmii-id" to let the PHY side handle all the delays,
(as recommended by the Ethernet maintainers anyways) to correctly
describe the need for a 2ns RX as well as 2ns TX delay on these boards.
This fixes the Ethernet performance on Odroid-C1 where there was a huge
amount of packet loss when transmitting data due to the incorrect TX
delay.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 3 +--
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index a2a47804fc4a..cb21ac9f517c 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -202,9 +202,8 @@ &ethmac {
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 
-	phy-mode = "rgmii";
 	phy-handle = <&eth_phy>;
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	nvmem-cells = <&ethernet_mac_address>;
 	nvmem-cell-names = "mac-address";
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index d54477b1001c..cc498191ddd1 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -69,9 +69,7 @@ &ethmac {
 	pinctrl-names = "default";
 
 	phy-handle = <&eth_phy0>;
-	phy-mode = "rgmii";
-
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
