Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B980C5AE5E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 22:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B3620823
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 22:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8Dd0jIL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d4hHNgAZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B3620823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvQqbpXT4LC0hVGFtlh65Rf0AefwtKuISo67EG9nDZY=; b=p8Dd0jILRAk3zP
	0jwPCcCJL1csppmC+BDLKSnhEsQmOGNyb23k55egwePmiyvA88BFcpOCb8e4WugKNaugBMPoQee7q
	HFJUSFGC+wtBb+9hRSvnWn+yxaUBkiNVcNfxQ9ixTyUii2vNlCs1vIDvJhywqoPduvEdtl60XRSWN
	EER6LMOQSPGRqyj1t0jMRmjOC7hjuu+d8n7rVkaLamProndg/UlTAdWUxHTUmh/cl8OUhnXpW14V0
	gltDRpWD5n2KXuYJN0R9Y/Y1XF49JcxZ6EUhvNOFwW+2WkMb1qIuAMtF9syhpnLr4tgPyqxtINrsb
	xlb4LleLJet6xHVKxFHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkd1W-0001iE-6d; Fri, 18 Jan 2019 22:54:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkd0Y-0000ob-UX; Fri, 18 Jan 2019 22:53:06 +0000
Received: by mail-wm1-x343.google.com with SMTP id t200so5986384wmt.0;
 Fri, 18 Jan 2019 14:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSoJoNiVuuVYiLJVgbPvy3JD62Wplt9eEYD0+F3PTB0=;
 b=d4hHNgAZyvzae5v2zh1Ll3Qi9XUIEaKUAV3RErLVrvkQWpIYQtBn6hKWmTEpLplmNL
 4w4pnsPsysvOvnhkwIzFqHOIMbw7TOGn23yNkbkL3CbmlPQ7eYM3H0JpilwItaEi829c
 TjYjB9wOyqSZpDYgHHar6xhympJVy2iuZyEBysDZvdBKwKPny81Pu57S1JzDQWSi6MPG
 6EP4z/QfoVbQ1QRJbmL+IRKY84MACWn/qdGfU+SsTBg5pf12E121TrRXUHVzh7JG/ec1
 x2j4CslpkxBdi/I8E4nJV0JCIBb20GeDJlE/sin2tvsKfy2c6oQOhIX2QU2zgfn9IqpZ
 /Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSoJoNiVuuVYiLJVgbPvy3JD62Wplt9eEYD0+F3PTB0=;
 b=Q1NyXGT81e1626etnYDJmaYO5YJZBkmzSiDfuSUJzAIptBythCa1o4P4pqCfYAYRF+
 HK7JmsNdMzqK9f/qOLd8xksWvpjMEZRNgz7Y7bfk5K1xqt3onkkviBtjjGT6VbZXdnQD
 fc3OD/Pf6D26a7kVG6BJctkuc0J3PuRwUXIGIhEQCdYVPKYV+ZYNPa2iV9GwzXPQ4US4
 obrQvoIB+la124eyE/mdseo14w4rg69S2xwItXgU91EEAe2moq6WIpPqOcH9X9TtzIZT
 N/9V6WSjzb8MfneDY3DrGlSZj2HCCPvPPy9V9yVv5df2VqYBfKG6zdCAxKUtpS1rmKl9
 NQ5Q==
X-Gm-Message-State: AJcUukdrHMIviXfYlJ4xawNoF8xwQMP9KJkRxpGEe+G9ttjlzYWoafPd
 VcU7ao+/vfDI9Ol7lSPvxohLz/6Y
X-Google-Smtp-Source: ALg8bN6C/8JdRdDYCyPGTGtx64w9j+HpICtJLSzkshKHLMeOqSnHkbGQSUxc+Hs2Z9SRvrhEbDM77A==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr16568023wmc.129.1547851980879; 
 Fri, 18 Jan 2019 14:53:00 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73A810039E290CB771389D7.dip0.t-ipconnect.de.
 [2003:dc:d73a:8100:39e2:90cb:7713:89d7])
 by smtp.googlemail.com with ESMTPSA id
 x186sm51197352wmg.41.2019.01.18.14.52.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 14:53:00 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 4/7] ARM: dts: meson8b: add the temperature calibration
 data for the SAR ADC
Date: Fri, 18 Jan 2019 23:52:24 +0100
Message-Id: <20190118225227.6516-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118225227.6516-1-martin.blumenstingl@googlemail.com>
References: <20190118225227.6516-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_145303_200426_C94CC509 
X-CRM114-Status: GOOD (  11.58  )
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
index aa798259bf88..7cec76158856 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -407,6 +407,11 @@
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
@@ -505,6 +510,9 @@
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
