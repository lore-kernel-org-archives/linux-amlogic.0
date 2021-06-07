Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A8CC47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6891061208
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6891061208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAsly+UazxYutggXbwl6g/Bm2u0EsVu/V4Qg+AEORxw=; b=P1Q24d0rVUlHPZ
	ZJ8UJ1U5L2zfJ424cD0oVIdhOGwf8WWSsmeAnhjkfxpXT/O8Fq6mcL02FJOddZem8u0Ew5rMlv+NW
	o7eFTWG4M7QH5ra0XeZXDE4ppWQu+/STVzAONrvpJ94siB90kUA7azAbF3ZowNs1nUhMzU95Z6wVf
	woS3lFaItsj1FrROWT76vFgpJXZT3r7LxS2cnsQ/clyWeD0kLSOkV3P0lObqsBmmKsqa8T0i0FnrT
	VFZCyACqEm9ILu+f3XP2Y9aDVUsC/UEpDxl2W5EfIWcxOlHvokZ3wp6FP0ppcLF7iBc0Y4LVb1vsk
	XqEeCqrXikd8NgLnUQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9Da-001r3y-BK; Mon, 07 Jun 2021 06:58:38 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9At-001pnG-QD
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:53 +0000
Received: by mail-wr1-f49.google.com with SMTP id c9so7568418wrt.5
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIlB5c20gqFSN8miPlr6OBIolKCtK/FrKxK6KrMtZFc=;
 b=QmbOSoRyMsOmc1piiQDmIiHZ0GJEGbCUbdA92vpZzVkJttm2mb8PYz8Paj/6sCxss/
 eICnwBab8T3ChcLAOwp/QaOCFE1jntMgWirHRcYmrfuBOhiP6yNpuceDxCAGtE7btQdM
 RshRdLdAkc8CAopV6V0cOTZtSn/YWwJzi2wvpMTH8gM/TzeTmCruSwoQRCioUHgk7TE1
 5fRX/sDcGF0mtaOI6/KsGEnrt8+xNwbJ9bpWBi1HRAG9UPTg7QKysyassn4VJWfFRXLJ
 zmGdmUHgjynzZU3X6W5SoDVgpVAx4t9I4kFKvoZ4YBq2hJ1YCKJCAmsO5mBgV9xxoYPn
 B7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIlB5c20gqFSN8miPlr6OBIolKCtK/FrKxK6KrMtZFc=;
 b=r3AC7F4I6iGKnEyDfCnZtG+m1uxe/BumVLKwxLeuDabLyXOnnu/Q2XCDHNzfyCC/tY
 DoNrRPTAqZlZAm93En9yWDeIssV0uKSoX+VFTCDYvEOTZVX9BaJxBymOlcm9Ceb0pini
 zO4vs9zvyAcsbWqhHXoytq+pl0C8LwINSTFbbERJfhL8OmlgcoBp/ul5q9ZhGWPWwUyb
 xfHZ+EdDYYvzDvIDO9njIdj44N44QPNq0JI8JP2GzUX9UEfEZI7OrXPQ/nZCDLnFu4B6
 Lvci0beHJ2PpF7JD5SWK3Js8dDCQsi+UMvZOV7ctjDMs/LT6PUdLsjutKT3Yq7KTVrvg
 yYOA==
X-Gm-Message-State: AOAM530Ye21JuZ4xT721rA/JyH3Oq5kbAHPzrPXrZF8BROhjG8IRo+Tz
 EsRtjdiBVVap6xcMIqZTY0w3CA==
X-Google-Smtp-Source: ABdhPJw6Ffv5UPslCEk2it78Gaw0CLg46uUpxiJ0GayCQTgvvU9NMm5NWtVE/xQiV1YXXAZpoJaOlA==
X-Received: by 2002:a5d:4dc4:: with SMTP id f4mr15534235wru.181.1623048889928; 
 Sun, 06 Jun 2021 23:54:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 6/7] arm64: dts: meson-sm1-odroid-hc4: add spifc node to
 ODROID-HC4
Date: Mon,  7 Jun 2021 08:54:34 +0200
Message-Id: <20210607065435.577334-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=narmstrong@baylibre.com;
 h=from:subject; bh=McuXd6E6+YhsD8miQqNEtHLBIPy7689EyQJs3nQPN4Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJBhmciZpnVSN2b7nGLZuLfoM10SKSggv5DmO7Z
 eAP0dyaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQQAKCRB33NvayMhJ0WRqEA
 CeO/zWIwy0I4ft5zgjMmsR7wZybM7ImCtnoyt/GZhBG22pICfV0g2kP7nQ5D5aWAjKx6DJlmIQjPRp
 DYsVh+3/nGJZxouATOo4n1sD4niPZRQXzLtSe/PvMr+I6ea+XrHy91aEO8H94R56AI/BoG/o5su6aS
 wsJ61GMyf5ww062B6K+4ENbiy5ffywV9be3v/JRY9HB3dxIHa2GDyROMShABwVopbr55y9PNBS3SiX
 Z3fFn34JUT1w1euSoEzpHogemXRiUUZFm6/+Q9VDHwXBTs83k8aYVaa8QFVDH5tsKEDcZwKQQcXXNQ
 r4F/Nwz3VZ7BKnftxaR1FJHSVdSvbrJXanSXlfnWmPCMvsTV8isNZXJPY8wGtvz+4jxrB7SUxWEFLs
 5HLrqG3nzFZ8sm026TN6vXQEFNxREfJ3rXO3Qc16MaCSaDuXg93zRGKwa14qLL4p+ty2GvA8/PdcEE
 1SXOzJiBhkarbKJ6x8oi4lK8z55Qy+bbJDdbtaaiKUrfKS2dS49A+0540SK9FlTZDkDhwkJdGTDs5z
 dKFCGkBRRgjcTkmkN6PSzBeAPO5CSSbe81np6jxovBUgpLXQxUqBKpuMbeQDmymtmTag1yj1Od6qjX
 l8igKM/NMS5MGOH/Xt7x7z9DhNwleFMFlH8mFhXHiSb5Ntz1K3L3z0Y9r21Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235551_929600_7C58369E 
X-CRM114-Status: GOOD (  10.51  )
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

From: Christian Hewitt <christianshewitt@gmail.com>

Add a node for the XT25F128B SPI-NOR flash to make it accessible
from Linux.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index fdad6b994c88..f3f953225bf5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -116,6 +116,20 @@ &sd_emmc_c {
 	status = "disabled";
 };
 
+&spifc {
+	status = "okay";
+	pinctrl-0 = <&nor_pins>;
+	pinctrl-names = "default";
+
+	spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+	};
+};
+
 &usb {
 	phys = <&usb2_phy1>;
 	phy-names = "usb2-phy1";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
