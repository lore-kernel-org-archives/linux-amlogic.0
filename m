Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24BAC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20EC2183F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrbVooXn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z/DkybaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20EC2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q18Nanpy51HnIn83QVdI3KMZs4kF5DHKG/XPGMpSvv4=; b=MrbVooXn4mnHjp
	WR7ZlGPpF2F06xNRzVUEe4oOuPDR6XtXUuWZU0gJwlyPI80s8U84x5f2RSqfKT+TvME2c9I2zv9bA
	1/AaMlUlRkfcZIh/VJWV1q0FiLwQsY4p2GxrZRebzQT400dtxov1BDBfVAPgFOYPmmEMoDMymXzlx
	VEwwmeTlOsUs11hVVD9zVnoC1S+eyvd6vz0aTfz+3hFY1i76uazL22ESEl0yJmVGoTdlkQaQBa4Hj
	9kupuC35Asx0ZyQ9wYPxT1f8hoyKp02XwUBLO2KsH4y9iE2leJtiAFuWPxlXz5u73aPaDGDXzl02f
	sNoYems6VmR8/mSr76+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH69m-0001zy-Ln; Thu, 18 Apr 2019 12:28:46 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68a-0000T8-8T
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so2709680wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eaKPE/g0y6iUlWbfT4skrkOkZEE1ERPb5jvRgG6sZk=;
 b=z/DkybaEpi41ZxHh4W0TpCqea7mEf0swv+NpRbClwbiGpMH3QFtsVF4vmgGZoxs9Up
 mHfANPWk1cQn8o3jImRFvSNlZRJp1scCEp/s9usXZnKupsthdPuAxn3c6DzCLCaQEV3E
 DsMW/royy7O1+Tkve1ag8ddiMm30jqOD8Tv3PxnTfvNce1McukJArZj1yc6tCl4/P/xE
 q3acyIv6zFqNLpzlp2clVGxh3x/poTx5/aJsaVBh/JDT9E/E/iisELIRLac/RBZgaNom
 FPhqJ7TzG1YIgo9d77OKjJqT7l69hCv2KSHCdM2GRIpUlsHo1A2/n8wQWRxvuWRyafze
 H/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eaKPE/g0y6iUlWbfT4skrkOkZEE1ERPb5jvRgG6sZk=;
 b=BiEsDV9OntMDxofiq2VG/JwCgidLyBusO9/S4r11nf7T1kiWuJ38sHJy03s/xT6Z5N
 rp/pK/Dld7KmlEQt3I1lnVNFqCSBPq1GWDDNVJ3H1llwvcB8d3CyQwDZ+ruz/4qYZDTD
 J8WeQudj7GAvaNtqrIDk0FsO6aTmAZVs5lSRj23MxHglVw5U48e3TvtaduSA3YWXQD6E
 mhVgXDlWgyZXQaJF1iZHt+MjeV3xvpmVFrMn8vLBIcXotwyie3VBy2KWuCv8105WsbSx
 KUtXKpN7c66rHfGU3tLy7gNSmF4Z46pjYyhfsXzEWcO+7/CHU3Nyj1II3zzukKQmNEkh
 fpVw==
X-Gm-Message-State: APjAAAUgMzsk58ruB/ETsPj4XDYtWdZCa8oe19aF0i1GN8cFAWAxu+PF
 HU5KcAl17HpG95ki15FZMyE0JA==
X-Google-Smtp-Source: APXvYqxusOzwcmCqRLArpuFoJt81dp91tzHecWlc12b0XclIzBDHyBDD2Izdb885lEWoPwg/XddMQQ==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr2903203wml.34.1555590450923;
 Thu, 18 Apr 2019 05:27:30 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 6/6] arm64: dts: meson: vim2: remove sd hs and hs400 modes
 from emmc
Date: Thu, 18 Apr 2019 14:27:14 +0200
Message-Id: <20190418122714.30805-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052732_507127_C16AC6B0 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

sd highspeed mode make no sense for an eMMC and HS400 is not working
at the moment.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 766194ab0aa8..c5f3f90a42ae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -372,14 +372,12 @@
 	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	cap-sd-highspeed;
 	cap-mmc-highspeed;
 	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
 	vmmc-supply = <&vcc_3v3>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
