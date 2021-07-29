Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD38C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396B4600D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 396B4600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15Hs69xoL6eFcK2NqIgMyX6MMa7t+xEhX7DJiRnulHo=; b=VioSabFkokWAVF
	3mC1kejMNccx0UpckjIUfQuarNZ0aisrkFHVUv9yzJkTh2I5dDjrfBwU87+YscJ/0omijPHojxL93
	geAzxXNXbe4OLVuxAYBBDCGqbChneloDYQc5qoDC8u6C72fPU12BUjBKnpIJo7ASl9Pb63dWba2eI
	CyCalT84lo3WJrjcEanxcT4pjtpo3idKN3Q7PGEjEFUNjUFWHWlL8uII5hPuaEDDli9o3DlVq71tR
	83+4epRJC9IjMJJ9bFlek26uqIwAnd4kz5qnScMrLIRrVeeMFX3sz0/WZoKyFGmIcEffQtyelQymw
	Gp0gkN8Rbwbiq+ngXlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9CNv-005nuJ-3G; Thu, 29 Jul 2021 20:12:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CNa-005nn1-I3; Thu, 29 Jul 2021 20:11:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso17420731pjq.2; 
 Thu, 29 Jul 2021 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1DcINwqfJqO0dtPIz+bu4Dg7uAJTjlEluLn5n1AaFQ=;
 b=igb01awKOgcbEbBWdptZNnPS3aA2621O4Rz8/Uw3mYCgfIlIp/mFJXb+zFB57GL7vM
 WRqgSTr74HoTswSPtoQqs+Nz6JC6g3uUiw0q0sBYGP9lMztqCB05vl5FNYxyRavi8YM6
 IqidDVLUbNk2dIzYSj8wni04030cr+3fRwUanN1ikHAMCJnsyZf4AA3Qw7SF/rn+ovfj
 ZHmcm6omslE0MFq+2Kh4GFgj111d9vEnZ4JT9hLvrYVfLYIrSS9lkX6WE5c0TXZmqVsu
 mPRiKekh3FGxZvSZ3aOYbWVdIt2jH9tK/vPkr5/HpcAdBDeqJJ9/LtGajwxyaJjDhPRy
 KN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1DcINwqfJqO0dtPIz+bu4Dg7uAJTjlEluLn5n1AaFQ=;
 b=A84UUc9h5mIzrekGspXKIHT5TSdL+JeYWiNcD8/JGqA2Wotmuwseuc0w5MJdj4izh2
 24YgcjAQ8s9A8Q92T5ng3CGiT1j7eAFzPvimADqo2ivugPDprTO+OqJRgUI44aDN1H6u
 3+eumOUueEa4R/rM8H/80djaFovnGk9hpLSlq1Tbw3uyjLkC4hv3anX1PK4Nw6CnWdTW
 QAQGctgoyNEUeNOInnKZLeUE/F4vt00Bg13j47Q20fqXMcI6q0yoqNThyDUM9mHAM4tK
 jxGBN6bKn4bY509PO7fB+v1etkbodq+jhUrvOabxtx254yWej1nvta62sB7xuJPtu5nR
 BGvQ==
X-Gm-Message-State: AOAM5305oZanpr3sRjOSN5KERDSWGggsY3nrs71lBxE+oS0LXyjAsV6L
 3ILWiQzrdQpFAddCeQrJd/k=
X-Google-Smtp-Source: ABdhPJwGKpnTbv+C5Cd9r3idwiLy7WXCCr7A9uP9HatThZRm4SpBVI1ma+PGoaVlCJygldBP6r8vLA==
X-Received: by 2002:a63:1359:: with SMTP id 25mr5265930pgt.79.1627589501459;
 Thu, 29 Jul 2021 13:11:41 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:41 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: [PATCHv1 2/3] ARM: dts: meson: Use new reset id for reset controller
Date: Fri, 30 Jul 2021 01:40:51 +0530
Message-Id: <20210729201100.3994-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_131142_646428_697C1E71 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Used new reset id for reset controller as it conflict
with the core reset id.

Fixes: b96446541d83 ("ARM: dts: meson8b: extend ethernet controller description")

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/meson8b.dtsi  | 2 +-
 arch/arm/boot/dts/meson8m2.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index c02b03cbcdf4..cb3a579d09ef 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -511,7 +511,7 @@ &ethmac {
 	tx-fifo-depth = <2048>;
 
 	resets = <&reset RESET_ETHERNET>;
-	reset-names = "stmmaceth";
+	reset-names = "ethreset";
 
 	power-domains = <&pwrc PWRC_MESON8_ETHERNET_MEM_ID>;
 };
diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 6725dd9fd825..cfaf60c4ba5f 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -34,7 +34,7 @@ &ethmac {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	resets = <&reset RESET_ETHERNET>;
-	reset-names = "stmmaceth";
+	reset-names = "ethreset";
 };
 
 &pinctrl_aobus {
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
