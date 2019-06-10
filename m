Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6062AC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33864206C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J228EDP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U0Lfv6xX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33864206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjBuKt0CuOZT4PdX2J1Re+KEMSGvD57oWSrXz6McDeg=; b=J228EDP4CU1Tx2
	QBpulO4kFkfef6Ur5HHkFD4W6G1By85e5sXXb1B85sckv5hRrgOo7Dpy7G8/wWIFRZBL73m9/70sl
	RmI9yEU+tZ5Vm2zhgyl82bXjVrOwk99Ii8m2/Pg2O7nur3/pQkt2xLKwDRy7BMZ2ddjvZdLp2Lupq
	uY4GicC5et8ob7ioeFwy3QvdDEZFHS0lcA/XAw7B53kx6gm/LBGIV6+LoURkS4V4QK8DESJDy96JL
	jrFG+sc7hJsW5upArMxS/YlCJLN4XAfhkRxk8sHBpnc/X/T7DWRIUHvBF24fXYmh8cfOrPLfi39Fp
	hVgiJqAQQZWO0y00TRYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNR3-0004Cl-CX; Mon, 10 Jun 2019 16:46:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNQV-0003Yq-5o; Mon, 10 Jun 2019 16:45:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id w9so6401wmd.1;
 Mon, 10 Jun 2019 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TRyxaZQqHMNp0VVnMd4WRE8MXewDkxrqm+3YLYJjv8=;
 b=U0Lfv6xXQYdjJ9AgDOt86SKfYMLsJQiyA5CZzXpWlUfZsOebroGH3J2iwGCoBlZogl
 JsITdGn/8hrBGCJ3m/gl2mtfQp6Q48lSxvMQHvMLw/bT7lfWKwtuOfK31psyKoFErMA+
 s7SWvkgEh8SjNUaOAzjjQPN2LtMweF5XGdbjkD/2oFbbVTBHVSGJySbObwimxsSDu4Uq
 lNHR3t1+RJLtvpJLvb2pUeDyOrLD4M5CSwRqmNEk8TzGUNHMNizbb48Qxb0zt7hUwar5
 aq1M3q8xmXjK+SzHcSlTm57EOdtjj0+qM/seZQr6JAd55HCdoWd2rSpjHlC9FhrsJGFS
 0xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TRyxaZQqHMNp0VVnMd4WRE8MXewDkxrqm+3YLYJjv8=;
 b=fmnjNxcCYGTybOshslMjjuNlumHLSaSE58DmAkUFYBPZ5rE6zuS5FsR25789FTmpdm
 lIe/RLx3RAtbLB3x1Qsu7sRdbpzYsLxTvYl1MjO+C9E046hSTogqYMa0BNSaVCNs2Zq3
 9z92ES9lSqUQnapNHRXPEugutX4bJ+fwLhWiaVsEEb9FvzviMM+XiQd9cXR5pczVaHxe
 ZRLUcSbNnAGjiSle0MANpMOs5ByNF5RPIP+VGarGbcI4b+9vjQNoj3pfVcVJRmsU5/fp
 dNs2AypyStXm7nxiK2G+pwe3mCWCybfIUfO6mSA9doilOp9tsedUf15XRDWwguvAsy9K
 g4TQ==
X-Gm-Message-State: APjAAAV3nGU9frRBkcaXrjJuurVRM+DOpFThaXGsZmqNLoQUGp35HpPk
 YoO6pNKnvB8d8YIVPZcYeqnpl7Zm
X-Google-Smtp-Source: APXvYqxwFt6ucPkTrpCTORtB7RuLEUEPbP7g2R5tiuGO9jw9qHOMEFz8FvX1gbPD3Iij4Xz4lXedRw==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr13887680wmc.163.1560185141527; 
 Mon, 10 Jun 2019 09:45:41 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g17sm11441158wrm.7.2019.06.10.09.45.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:45:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/2] arm64: dts: meson: g12a: x96-max: add the Ethernet PHY
 interrupt line
Date: Mon, 10 Jun 2019 18:45:31 +0200
Message-Id: <20190610164531.8303-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190610164531.8303-1-martin.blumenstingl@googlemail.com>
References: <20190610164531.8303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_094543_211611_FC397C9D 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

X96 Max has the PHY reset and interrupt lines are identical to the
Odroid-N2:
- GPIOZ_14 is the interrupt on X96 Max
- GPIOZ_15 is the reset line on X96 Max

Add GPIOZ_14 as PHY interrupt line on the X96 Max so we don't have to
poll for the PHY status.

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 24956edaf8e2..e3f3f37d3081 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -180,6 +180,10 @@
 		reset-assert-us = <10000>;
 		reset-deassert-us = <10000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
