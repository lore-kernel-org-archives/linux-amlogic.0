Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38020C46477
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0732184B
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZvdD39L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Btqc98H+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F0732184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9KEn9VWYs+DS6lvGl/HPbDHDiIij7O8fiZ3Q81bZOk=; b=BZvdD39LCLsgNd
	B1rez5GhehIyk436s3tVL8gAIB7AqBkTxCzv27Qx91nH7q+0s6WcP8I78x/u264BSZBO/6ybks6CD
	CteMi5i7QRFgW2Cx4+uJbUIoUQVz+Peepz0QkLdJnTrdIKP3RysYf8P5rNcrVW7L7UgozDZaH2KVv
	o4Pevt1d1I6VvQGCrrnT8NNHZ24Tx7z7IMlTN1ZBQci5GnPeiLkkP2bjoJz19HNUdRAQGknhQQj0B
	USV53C0Q9+TG++Mk6UYFiUFkpcbcMcwQ+w/fuBq83eYJH453LtyWimHMKW4/yQ/oggY5LtzzBfIjl
	cV52fo1tvjPMG910ILMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc65e-0008Ht-IW; Sat, 15 Jun 2019 10:39:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc65b-0008Gc-HZ; Sat, 15 Jun 2019 10:39:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id x15so4747417wmj.3;
 Sat, 15 Jun 2019 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TimQLf28BUhZs7uT+zSn3k4UT1AmjQyz4dSffxOSscE=;
 b=Btqc98H+zDiJhMTSNooCyVZM9aw+pT4W+2uxs0k/OeuS36XxZEW051BU6h7xdaBrUG
 5Uzt2aab/JcjIMwv4AHm4gtCN4Hcq5YvM7+De3x5C3q8PPSat2rMOpsIw9SN2Az7ErjH
 agfpdpnAiV36T1nn8jLuFfeGJ0QMqYPYu0+yKwQ3BnmW9ALpL1Dp0hEW3EbXXqvCyWOa
 vORmOUX82p8xMWAjWhIHe9IkS0ELSg4PPKoCr/GBlXYoZzlbyDR46CU6IAXjarJwPqkK
 Tc9Ifcr4EwB/ORSQoYqwV5crbHealtm8dd9y5YEJod5p2Bk6bVxxNbuuDtSN4QqRPxBi
 0QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TimQLf28BUhZs7uT+zSn3k4UT1AmjQyz4dSffxOSscE=;
 b=abzsmlmR0STtmU6B6T/EzQfDSsrEPPHVL+plQiWOJVGu5geEKxrSzR2kjZMUaE8BAW
 Q/Vl6lSJiJYIXtqPtab2T7yV2F5F/qAOCmp1RkunM/CTjUPKX1E7ZoB7YSkKQRR0DoV8
 X0BR2rqZ2gZH05HusRERtSAo+ITM/NxeU4oenaHJ9ibuhEsNbDUQ75Mm+we91wLsh907
 +0nGOXzZ++1jthCYMiAPetZCfXyVtxlL6AKDBfTpcWJmBnyLv6/Fak1lGEdcxxXtDSPR
 iHPUZd+JFVajRkWLJz5410zJ3qDyoGlXG/oYqm5pfQ/EffZP6EyNKCjfNsFaBN5exCV+
 ffRg==
X-Gm-Message-State: APjAAAV+VgmKkLC74NWjoKeZjFS2OPu5ohphuBpFN8HFlSGhCHa95xmV
 RJq0XKT3fyMt7k61HxrY5Xq2PRLgUbY=
X-Google-Smtp-Source: APXvYqwkD9m2q7CAv0eVVlX2vVh1T0OsigTsOfcpg3MUm3XGrTqG0vi6zVwW39+OYE5y/KWeTyIo9w==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr11776798wmc.62.1560595154046; 
 Sat, 15 Jun 2019 03:39:14 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id
 o126sm12209031wmo.31.2019.06.15.03.39.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:39:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v3 1/4] arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY
 reset line
Date: Sat, 15 Jun 2019 12:38:29 +0200
Message-Id: <20190615103832.5126-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
References: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_033915_608505_5C2B3D98 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: andrew@lunn.ch, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Odroid-N2 schematics show that the following pins are used for the
reset and interrupt lines:
- GPIOZ_14 is the PHY interrupt line
- GPIOZ_15 is the PHY reset line

The GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes that
they are "3.3V input tolerant open drain (OD) output pins". This means
the GPIO controller can drive the output LOW to reset the PHY. To
release the reset it can only switch the pin to input mode. The output
cannot be driven HIGH for these pins.
This requires configuring the reset line as GPIO_OPEN_DRAIN because
otherwise the PHY will be stuck in "reset" state (because driving the
pin HIGH seems to result in the same signal as driving it LOW).

The reset line works together with a pull-up resistor (R143 in the
Odroid-N2 schematics). The SoC can drive GPIOZ_14 LOW to assert the PHY
reset. However, since the SoC can't drive the pin HIGH (to release the
reset) we switch the mode to INPUT and let the pull-up resistor take
care of driving the reset line HIGH.

Switch to GPIOZ_15 for the PHY reset line instead of using GPIOZ_14
(which actually is the interrupt line).
Move from the "snps" specific resets to the MDIO framework's
reset-gpios because only the latter honors the GPIO flags.
Use the GPIO flags (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN) to match with
the pull-up resistor because this will:
- drive the output LOW to reset the PHY (= active low)
- switch the pin to INPUT mode so the pull-up will take the PHY out of
  reset

Fixes: 51d116557b2044 ("arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support")
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index d37868d21114..3f9385553132 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -285,6 +285,10 @@
 		reg = <0>;
 		max-speed = <1000>;
 		eee-broken-1000t;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
+		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 	};
 };
 
@@ -295,9 +299,6 @@
 	phy-mode = "rgmii";
 	phy-handle = <&external_phy>;
 	amlogic,tx-delay-ns = <2>;
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
 };
 
 &pwm_ef {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
