Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B32C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A029F20731
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QEQivkv2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sqqdAXK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A029F20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOEtNDASR2LE/ZvOqRZ6irTSNelA7KlDV+cXKxHptK0=; b=QEQivkv2oVUl2g
	R9U0q0rkI3I85ckYtE/G3xruXUZi7X1bNidRsTelpcpd+A3cT75igyeQo57oXbMJsHdJBl9qI3CBY
	86CVtmHedUkNSwRwDXGxkIR8bllXZLrQDMDbJByWDagGsKGwPU0NvVOmL1K93WEnM7vsClCJea0yX
	2AczbU9n/8ey+rFwvGg6AcLvh/LOUEvuWfwYWb78FfCbaOwyA/cXTvBtHBbd80VmFvXfvBWTDhrH6
	/EaCWTtlVv6d3VGI7THg7dQ+f3DEEO3bq6Wv4Sd/++SKVyuzBshohAB4kW0uCJxdE4aDivH8wITxJ
	ei3lw2kS33MMIgnaHUAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcoj-0007PA-Ri; Tue, 12 May 2020 21:52:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcog-0007Ng-Ge; Tue, 12 May 2020 21:52:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id g12so25714200wmh.3;
 Tue, 12 May 2020 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML06J9nAXnrGfb8Sw/sNjsFqqfba47oOWTFdhQokhaE=;
 b=sqqdAXK6AKL3cbZ99XKBs8vbhtAITOFn3FP5urm5A9+m+E3vBxCyHzDePpPHKg5vjj
 LKHfYxs290ihRp1p84MmSSxnUVV+ubgjKVy09HRPONVXw0pyP2WdpBV9fuMZJQ6eh4Nb
 LNH67EVYxVFhj36nWZNsIAr4MZUM4VCo45Ypo+0r/hjTilR1SzePTzQQ+oG9lLx+Bxyj
 7A8pjPfgVM/UuTmXTFVyqFug0Fsz7pvFsKcr766wVUk2+i3mCLqXYuCxyFH8CKCdJ+Xg
 CVDq61GKy/MdOLe54IBiKfX/yfXceGudA3Bmz2MbI7+HQk7Dz1MSCMhukgmoc1n6zJ/e
 A/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML06J9nAXnrGfb8Sw/sNjsFqqfba47oOWTFdhQokhaE=;
 b=om9dTEoEedO9PL8fhlaFp0H7Lsu1qczc6k1uzqgQIWLGwNfV28nE4FWtsMUVeZYZUS
 aNJSJtmrPVhG2Qya8z1sr5v61LEUv+6KF/n/s80yu/F84cziEnNTDzI4FelzAj6+AaLW
 LODSH/I6G26qw/g74XzxI9XqNdIKRdXhzldHLOxwFPQGfagrbBTh9aMWFO1/BgtIM2BI
 cK0IuoxJgZnKcPBGFznZn2QUOdlk8+TNoCwcgNr3PL2jsgWgW/PtJpXW6JnYhD9o0S7A
 QIc5J4QFqH7PL9pSMTFyyU7o+3qkFL98fLA/SvsCMdipZJJS0dbc92WcA49wThuDOHBW
 Q5VQ==
X-Gm-Message-State: AGi0PuaNyQe7rh2njJlREeA7Chdm9vwC3rcc/yglT7+SE4ZQlJMAGhf3
 k3owhTPMRYuBvAspNx6YyBxxCtZv
X-Google-Smtp-Source: APiQypKHylusgy6f8u/ZP6adCO9GAkIUbJCRnspiKCYLMh1Hp4j9DPjXr8tdjOS9U6uh8sjsjGYg1A==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr37244079wmh.141.1589320316956; 
 Tue, 12 May 2020 14:51:56 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id d9sm9154234wmd.10.2020.05.12.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:51:56 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/2] ARM: dts: meson: Add the Ethernet "timing-adjustment"
 clock
Date: Tue, 12 May 2020 23:51:47 +0200
Message-Id: <20200512215148.540322-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512215148.540322-1-martin.blumenstingl@googlemail.com>
References: <20200512215148.540322-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_145159_182813_20C159FC 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "timing-adjusment" clock now that we now that this is connected
to the PRG_ETHERNET registers. It is used internally to generate the
RGMII RX delay no the MAC side (if needed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi  | 5 +++--
 arch/arm/boot/dts/meson8m2.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index e34b039b9357..ba36168b9c1b 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -425,8 +425,9 @@ &ethmac {
 
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	rx-fifo-depth = <4096>;
 	tx-fifo-depth = <2048>;
 
diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 5bde7f502007..96b37d5e9afd 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -30,8 +30,9 @@ &ethmac {
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	resets = <&reset RESET_ETHERNET>;
 	reset-names = "stmmaceth";
 };
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
