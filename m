Return-Path: <SRS0=0OJt=PU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8742C43387
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jan 2019 13:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A56C20854
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jan 2019 13:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5rtk7iY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e9qp4v43"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A56C20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAwMAkngDj+1Zg2oRotcFgORlOyBKD1lKoXjLOu5uXg=; b=l5rtk7iYeRpeVb
	MuG2WJ65peElyI0TG5CQnP6PnjdJu3exxeP28IjEn7+xmnk+eJ1x6hhgIrs3V6FrdOaK6sjQ/oRBN
	vV14dLskkY2w0ZWEO623ZQUFC+pkLCOoADVq/BC3tlQQcLjDpaLZut8thRLGeOfCZhL9AhFSNLPFd
	dtfsxUn5Jn75qN5pvKbmspl7SJ8F03hr5pA38KTO0hkPITUsKNkgryTY2YR0S01nvxShLxYWOEToi
	1xT+Aq48sh5HfLBaAdCVy4afKmBOujPojlqfby5C9L7RdYPWbS2rSiQpkrD0ZFuFhfci+72PvnpLk
	JHH0aUTzfHkOc31fklbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1giJ0M-00085V-2T; Sat, 12 Jan 2019 13:07:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1giJ09-0007qk-MG; Sat, 12 Jan 2019 13:07:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id u4so18056532wrp.3;
 Sat, 12 Jan 2019 05:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VArxWMqn4+gFNKzFAJAbEq9HiG68ruiYOWpS8j58A8k=;
 b=e9qp4v43Avmo8hv1EHr5xbOru1HZCHoJCt5nzMrIOCwwDRB+oqnOA5s1SlIHYZKAxD
 3yfZnN4ruhSv6hTsi0YpG5HCG1en9z6gC0k16uImyYUxew1YR19SsRVwHktn6N4aZhsj
 7HHX4hsKDpIudhWqhu7MD+HuMrc6pBjpIN5HFs5qzAdusCwx1finklUTgwv2MmH3Fhfa
 QLPi7oGQtjT9HfdMKLQ6yYUoTQsALPow5rXUUEBIUwd+tmJV2ZP/9vj2S1DWoXbtvang
 2/hqQBpMAEq4zwHqJmi4ut7KMiSQYxWjwPQ72gcuqE61j1i9Ej/xCmw9XDfNQMHjJBWj
 hKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VArxWMqn4+gFNKzFAJAbEq9HiG68ruiYOWpS8j58A8k=;
 b=mL5tK2mSZqHfkuapN6rJ66mQ7cNSgth5sq1KAlO83NllD7bVSGVLOATrvhoui2YLR3
 ZBi0WbT5yTG9k53rnWuH+/OnYdrfp33qhsRVA9kOHrFJKrP3CR5e0HvP2uP3Uy9Kw/PO
 t9dkHkmEPFjcRlH6wirzzXq4Bb4CJH+/8cX9s1SPZd5Tsq+ptCJUd+f5ZQkxobs9OpMd
 nAnFvH6GB/IX5qjwma4DH1PNd7UAnXzrwsPkCk1ZulrNltceBOTc9m5rK2Ndko8mQgMo
 NCXdNYjXT7gr1P8gUA3I95MJllqXgrh081lTnxDJsf8q0uTfs3JL42GTJFpSLgoxubIC
 2wXg==
X-Gm-Message-State: AJcUukdInJqth5irA7rvkFq7YA5fw2GpqgrDfwrAMULrYbaITghXtvV2
 cGBPND4/dLvvX/N4rhc5N6TDDT2f
X-Google-Smtp-Source: ALg8bN5GFtaKBvE+BM/WiC1dO/9Gl3A1/mpfnM2PjFwHQrQBS4uyt64H3vYdhpb4TjKokQBaHTJ5Tw==
X-Received: by 2002:a5d:64c7:: with SMTP id y7mr17041556wrv.207.1547298417878; 
 Sat, 12 Jan 2019 05:06:57 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7329F008D685E3E728ED25E.dip0.t-ipconnect.de.
 [2003:dc:d732:9f00:8d68:5e3e:728e:d25e])
 by smtp.googlemail.com with ESMTPSA id o5sm37804630wmg.25.2019.01.12.05.06.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Jan 2019 05:06:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/6] ARM: dts: meson8b: add the temperature calibration data
 for the SAR ADC
Date: Sat, 12 Jan 2019 14:06:46 +0100
Message-Id: <20190112130649.23838-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
References: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190112_050702_044856_B4333A4B 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SAR ADC can measure the chip temperature of the SoC. This only
works if the chip is calibrated and if the calibration data is written
to the correct registers. The calibration data is stored in the upper
two bytes of eFuse offset 0x1f4.

This adds the eFuse cell for the temperature calibration data and
passes it to the SAR ADC. We also need to pass the HHI sysctrl node to
the SAR ADC because the 4th TSC (temperature sensor calibration
coefficient) bit is stored in the HHI region (unlike bits [3:0] which
are stored directly inside the SAR ADC's register area).

On boards that have the SAR ADC enabled channel 8 can be used to
measure the chip temperature.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 57c2a3678110..3bd68cf8f6c0 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -414,6 +414,11 @@
 	compatible = "amlogic,meson8b-efuse";
 	clocks = <&clkc CLKID_EFUSE>;
 	clock-names = "core";
+
+	temperature_calib: calib@1f4 {
+		/* only the upper two bytes are relevant */
+		reg = <0x1f4 0x4>;
+	};
 };
 
 &ethmac {
@@ -504,6 +509,9 @@
 	clocks = <&clkc CLKID_XTAL>,
 		<&clkc CLKID_SAR_ADC>;
 	clock-names = "clkin", "core";
+	amlogic,hhi-sysctrl = <&hhi>;
+	nvmem-cells = <&temperature_calib>;
+	nvmem-cell-names = "temperature_calib";
 };
 
 &sdio {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
