Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DECC47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB2161208
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB2161208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QsX3hyG4NeCwt5qViI8eo2pnb9r2eKgj8wWVa0Ym8k=; b=LfbzbDbcaW7Gr2
	7ffIJoCpY+f74ZzCWC2GmS0apaIGwUEPnBLHDxoCCpJrL8JMt45gaCQAlxZfr/eA6makh4NuyL910
	s3CijItWpWTlp6Yi4PrPC+tDTfV3MhOPNmZ/yArXsgEi/tNE3OHIWiyy29K+yFUPq+ZV7MR92NPDd
	XhaJiXwAfMafT0pwtwiRQyU2kId66+2iArteqBK/oDPNtCC9FKUW5mRwF4QiuZ+KL/078yZSY4jtS
	nABl60qZh+sEIbWuc1GNLIcnJlQx0WilpBITIDTiOywP4jhrX34dZrNV9bkrEJbrBZC8xF3ouLmiF
	Sz69mFTndNdGHJye+T+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9DV-001r18-KT; Mon, 07 Jun 2021 06:58:33 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9As-001pmc-PB
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:52 +0000
Received: by mail-wr1-f45.google.com with SMTP id q5so16277263wrm.1
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YnYvPcoGmh1x+bRXjFzR3j6yadbIjw2NQdavqi41Frw=;
 b=0ve2iPV/GEXdppG/8w2iFruZBCsCl5LkhTyocMD93Gm44seqkqnZUi3XqZTSw77HRL
 wzDKXDW61KXe6tsvOj6HlNj3+aWXPfqtIKS8aZPiz/DtRWf+zGTuJxN+h+dI4KXMQe1B
 LG+TDydwTkBD8QaHIEW3JOOT6t6R1gobcT4rrfJtIyWPlTHcUxy22ROPHRZzXgbAaxr5
 RWI+RVdd/OYZgkIjmBEamnnDjhYbnTsux3Pp+dItrhWwljuaLdw+h/KIEGh3aIdcRAh3
 Jcc2/da06Nx0XY9gMl096+6otGaXrRa1aIanQnw2LJFYG0dBIYvkj5VRcLchH5Y4qj+o
 vKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YnYvPcoGmh1x+bRXjFzR3j6yadbIjw2NQdavqi41Frw=;
 b=UFD56hF1SIyx5aw/UvdXD00NTig5cltUxgj3K9viHeoOBwm9Bjjhry5YgZA1zTjm+D
 65ooOVHMUc2v0vzIxAmQWrdyaXMhWB2iEKdlERMhfcJL7OA+/pCUTLBdOQzNO3HXfwxR
 TBiaLGH+BPYPyZff8P+axLcqOGYK0aD2MjvAFqugym+x+O/rd9XQqIjb1GzPetNCMsS/
 4TK0NFIqduDqRs85hfX/FdukRb06gUOi+WLIsMZYiImPIOzJSCauAIuh1a/9HAAys2C/
 b/FRkR/VwKboPyWcPRLn3RihvgVXMaG7+kU11JLRtryjnwDEZxC0RUVeik6jn5ftU/O+
 IEOA==
X-Gm-Message-State: AOAM532F1/mOntwM6hbs4TEoBYsJ5Vpd5bbK1fVybjKH6k+48HqJQsSo
 Cbu0J4Sx3WMfm31zkkhqrRsJrA==
X-Google-Smtp-Source: ABdhPJxZ8GEWr9oR5HqAKmDh4IrHUjwqYcLbCYlZiWvVsE20rgffNmDmPCFLypSz7Faqz1C9gDcw6A==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr3256505wri.288.1623048888828; 
 Sun, 06 Jun 2021 23:54:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 5/7] arm64: dts: meson-sm1-odroid-hc4: add regulators
 controlled by GPIOH_8
Date: Mon,  7 Jun 2021 08:54:33 +0200
Message-Id: <20210607065435.577334-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; h=from:subject;
 bh=zKRtjcLOeeX9+hCk3h3mjBgv0kuOByy0JZuBpPeUfWw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJAstNBuRgJ0A9ZYSycpVFUfXMLurRV3WRjfftU
 hls1Cl6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQAAKCRB33NvayMhJ0XfED/
 0ZA8MpWzNMpc1FTJJIORx9/fYkKAEUluxky5sfkNSsN/okqoQCyKj4ry5ZtZb5D91sP+lsClwUAYnL
 +/7GqJB2zHEmalLi/Gq96WcA6UKPHe9dbEdTBS/VoPnvGpYzvHeTd+X0tCJbSmBsgkGcKZW7AeJeYn
 hPZXsth5Wruxj04BoIkL38t8nOdtgYFsWhx8iNW+6YzaltCekCE4CniYEpj0ED+sZ3pPCRbBOm6FTt
 /dWBwH99B+X2FpVmmASmzK6HyKbREG1uSW3/XriIYI/776zzVDGblr4X0OAaaQCZ2myW/iGebl+1v8
 Qzj0Ym1QvLCttFlTjEIru7eSwMDKDQj2xH0K5qFD1Drm/gAPAJmlvqfa4q6GGQH50STdm/GX77ZB24
 4tERlcA59RowQB3NQW7Q9rM8pG+DOIWtGxp9niTlJXKZBmZH3nIyBFD2cmCJyuwtxjIWm5w7dIjBLz
 Y5QASl7nO3+W2uzkjStR9lVyj2MlY6bzJ22RgchQmIf6HaKfcfeNyn7ppe3f55eY3k2tnpEWJbPp5x
 gIC2MxpwDgnDvWQprbpcjW6/uBAbvV3Qjcus8NamdKw8eVKCHgcCtIW3UlxFGQEyzPPmzc1kt9FPTW
 xgvPw3mH4bpZnFixUW8KeHbkGQlWBts581Qx6K6uTwnesT1+Fzh6/kfD+qzw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235550_848818_8E6098A3 
X-CRM114-Status: GOOD (  11.45  )
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

As described in the HC4 schematics, GPIOH_8 controls the USB 5V and 12V
regulators used to power the SATA drives.

And is set as Open Drain since this GPIO doesn't support Push-Pull.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 0a34b658f994..fdad6b994c88 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -44,6 +44,32 @@ led-red {
 		};
 	};
 
+	/* Powers the SATA Disk 0 regulator, which is enabled when a disk load is detected */
+	p12v_0: regulator-p12v_0 {
+		compatible = "regulator-fixed";
+		regulator-name = "P12V_0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* Powers the SATA Disk 1 regulator, which is enabled when a disk load is detected */
+	p12v_1: regulator-p12v_1 {
+		compatible = "regulator-fixed";
+		regulator-name = "P12V_1";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	sound {
 		model = "ODROID-HC4";
 	};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
