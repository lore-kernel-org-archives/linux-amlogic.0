Return-Path: <SRS0=DmFH=4E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3B7C33FA1
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 20:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1612086A
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 20:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MjW9eSl+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfX3pzUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1612086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eznOVkqRT+OIiHHcLuSpU/rA84mLB1QThI8iJFoF4iw=; b=MjW9eSl+ba918X
	AHZ//fSFUI1Ixy+VQiQVHRJX/aDNUyLjiOCv6100doc/L0eQyHMbOENzaOR0u5+kpRc5EiQvpd41B
	3dJY3sWY2p9NPxHv2y67P8p/JS7WTxhMblrSdzjum53JDqfWq9B80tfWoZhxzr38HL78Gk2MJxtWA
	/jRY+DepbPGx3T8qWH5KJvsqwgHr0QuHsYz91xPGtuzwZs1cryTJJ3/YIkvTuNs2hYW8l1on2D1ME
	tZw6vlpWcv1DCKjEYaugotHwDYM7c7JkSqzfmDkP8f/aVHZgGpI8YSGmVK6VIRcUYs+ZmZdKSIt2j
	POQOQYlovCktw+7pOCTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3QQ5-00089y-IF; Sun, 16 Feb 2020 20:21:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3QPv-00081H-5S; Sun, 16 Feb 2020 20:21:28 +0000
Received: by mail-pf1-x442.google.com with SMTP id 4so7721015pfz.9;
 Sun, 16 Feb 2020 12:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3zfUADPk/oUyuzJ7VgI1Juwrp+2x57KXXaZ+inluLQ=;
 b=FfX3pzUBHrAj8jkxvad38rERLbzrfN6+fcK0HplUj8CLnl7DtX87kPUDbcoasbyS82
 pQ9uEpb/xIrz/MpMfylFu9z6L8g6whgnCiUxq23GL/a6EihKQsLBTMhTmqA3SR80+h3C
 TOvZGwwM3Ko2e3npVE/d9dI4cNkAaL7Qxbt8OrLFDQIX/f+OmLSd0W5/RWKSV4VcC9Wv
 vXPCJGyEPhvzo8tY6cuI+5EwhTPJxkYVb0HlES2oO/AUQ9Y5ytzRHlLfZX8frnnwgg1N
 gYKdezI67yJAV59FQoRuM3NVQtL6Fp6/jKR2Wuin3KONqeeE4YATVM6KqbQBaSRCOdJQ
 hb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3zfUADPk/oUyuzJ7VgI1Juwrp+2x57KXXaZ+inluLQ=;
 b=IdlxL7btW8AZrAzHzRDiPpTL+pGq8/zZbWplT30eBGxYNqrezGnUTgxHXrGROUhpKs
 2ZxS+W+9FHujD3sdWCL6CzZofCrAV2WWj57OTW1WBQxTOa9vofXWBtzr0RFn5HOOtLZF
 dPnto+1OI+fB1ogbIFMifn7N8vEm53zHvMFGo632NlvhARDJxO9pmPZvq1OCg+W20Tds
 +b8bI2pGTs9FDvQIcRLUe4aziOOtG18EOvIFAFjjVtVEAsH/g2142NBN/FQK1ThjWujV
 b6yjVHiXa6sUPXja7yZ96Qu1yWnac9q4S/puYSlkgD3X8h8qIpeQjlGHhiPYnL+0mBHQ
 /CEw==
X-Gm-Message-State: APjAAAUgtj8fq38RIq9BejnNG6EPYkYdL5Cej0tzglDM8yQ4I084orTa
 g6CUVIt4BcFOgBCptzhWn6Y=
X-Google-Smtp-Source: APXvYqyt1ki5Ed6SRzWgLcOn7teb9PcdZLafsaTmcNNnAg3NTxCIsHfcmSjKmDh3o1T8Dzjfc5dRxA==
X-Received: by 2002:a63:9dcd:: with SMTP id i196mr14159101pgd.93.1581884485869; 
 Sun, 16 Feb 2020 12:21:25 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.127])
 by smtp.gmail.com with ESMTPSA id l69sm14424750pgd.1.2020.02.16.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 12:21:25 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] arm64: dts: amlogic: odroid-n2: set usb-pwr-en regulator
 always on
Date: Sun, 16 Feb 2020 20:21:01 +0000
Message-Id: <20200216202101.2810-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_122127_235563_8A74BB4B 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

usb-pwr-en regulator is getting disable after booting, setting
regulator-alway-on help enable the regulator after booting.

[   31.766097] USB_PWR_EN: disabling

Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Patch generated on top of my earier patch.
[0] https://patchwork.kernel.org/patch/11384531/
[1] https://patchwork.kernel.org/patch/11384533/

Before
[root@alarm ~]# cat /sys/kernel/debug/regulator/regulator_summary | grep USB
       USB_PWR_EN                 0    1      0 unknown  5000mV     0mA  5000mV  5000mV
After
[root@alarm ~]# cat /sys/kernel/debug/regulator/regulator_summary | grep USB
       USB_PWR_EN                 1    1      0 unknown  5000mV     0mA  5000mV  5000mV
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 23eddff85fe5..938a9e15adfc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -177,6 +177,7 @@ usb_pwr_en: regulator-usb_pwr_en {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v>;
+		regulator-always-on;
 
 		/* Connected to the microUSB port power enable */
 		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
