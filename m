Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC7DC2BCA1
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4456F20652
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgNDmNne";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SdWX2T5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4456F20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+k9J45ZjhHLENQG18tyCkJ2l9iFV+AGRCOIObR2egk=; b=rgNDmNneLiMNdS
	uawuK8uZO42KBJIcBZ2/BYbjNmBsBhFsgFFvDCmTpOpOs6rr7aKXPG+DzBf3HKjoo3F3B1u3vIQwJ
	Uz57q4XZL/ZreW2thCU9z/oqJwGZsYxkXxhSpmKfj0ohXS32P6FtR2kk/qrhnX6l9585bEepFOKrk
	o5S1L2CWwl6vNHZTidWGKQY4Rkg20o3yAgFdUzC5+jM4VIAwWVPcrdqt4KWKWa6JOO2dbrsJ8eUy1
	wPrK9AeE2oW5DX0q1UWi2b2U5a35lVi2bWAC52nfTwhY6g3Syxb+r4cbAk5woZIIzKmp0s+W8+HGP
	NRJQy2we8nhDrx9wkJeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha2EW-0004sM-9I; Sun, 09 Jun 2019 18:07:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha2DM-0003eB-U9; Sun, 09 Jun 2019 18:06:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id x17so6864723wrl.9;
 Sun, 09 Jun 2019 11:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o6l+94PYyR5Sk//+/Av+qY/UlCTL0ZemTkfdZsKsuI8=;
 b=SdWX2T5SmsidfZY0juvRr2RV/3P4zrsZFer61k+iFahxhK3NUrLNV7vJqaiiediw4R
 rcD5gjK4F36aGP9zl93OjqUlTqKa+yOuFb1zRg53a0+wk8GFvnBaH8M8tYUWFnkcMhES
 z6g3IjTPw7r0iQvIRiH4U10mEqwsFgh48Epr6t8L1JT2H0LP+CQmVdEwJdC9x/2+GFfe
 ovcWvCt7k9lSwAFW8Ms2DOuzngbf6sdjnjZzkBh4CFHgf+kYTWgHWQ8Lg8qcWOqPJ8R/
 CDsDEoFU29qpw66hFva8GSiCmvLelz82KUglM9YxxtwJTYRITd8hm+1Gx2C1LtklqYtl
 dWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6l+94PYyR5Sk//+/Av+qY/UlCTL0ZemTkfdZsKsuI8=;
 b=gCJNgA6nFRIwLcEE9Yj5sWSEHDtS4htNPwfvRMdfrPXvHOFk+YQ5Cv50HKsnRliB44
 mpouV1DNIxJ2OBN4khueh48hjrqlhWXjjD8n/U2VMJ/okFfzbPvhIXUaKSg4t88odanF
 EETxIiddfYxyEVTdcckUXRamgvxnDQH4LFMHu03ZYNPMj7X2PrahrIKws24BOdfjSNZj
 K2Nv8xw2IkhIm09ih1iWwnq3QG9MHsgLPcXnGGja8rMhNimu3dRaTf22RM5zdDA2jkCf
 DknYQF24Upjbb57eVuE24uWsfjhan4HO00759A8+8lxmTTKmf6XNk7DIkxm8YbgHuIZT
 AfwQ==
X-Gm-Message-State: APjAAAUv47ynXp/9uelhlAvdq2x0738l8fL/EvL1ooXLudGL6k3/CA8g
 +O4DmaxksYkFmSF6uBIf3tQ=
X-Google-Smtp-Source: APXvYqwvHItbEUzIdxb67KT8Bn7m2rjiaeTPe7nvO5ksWV2HWlyxwGJBfFo9q42FP5gCm25H0bJ3Yg==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr7811983wrr.8.1560103602460;
 Sun, 09 Jun 2019 11:06:42 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400B42D8EB9D711C35E.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:b42d:8eb9:d711:c35e])
 by smtp.googlemail.com with ESMTPSA id h14sm2007731wrs.66.2019.06.09.11.06.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 11:06:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com
Subject: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the Ethernet
 PHY reset line
Date: Sun,  9 Jun 2019 20:06:21 +0200
Message-Id: <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_110644_999334_EEFE2AAA 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PHY reset line and interrupt line are swapped on the X96 Max
compared to the Odroid-N2 schematics. This means:
- GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
- GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)

Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
that they are "3.3V input tolerant open drain (OD) output pins". This
means the GPIO controller can drive the output LOW to reset the PHY. To
release the reset it can only switch the pin to input mode. The output
cannot be driven HIGH for these pins.
This requires configuring the reset line as GPIO_OPEN_SOURCE because
otherwise the PHY will be stuck in "reset" state (because driving the
pin HIGH seeems to result in the same signal as driving it LOW).

Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
the "snps,reset-active-low" property as this is now encoded in the
GPIO_OPEN_SOURCE flag.

Fixes: 51d116557b2044 ("arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 98bc56e650a0..c93b639679c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -186,9 +186,8 @@
 	phy-mode = "rgmii";
 	phy-handle = <&external_phy>;
 	amlogic,tx-delay-ns = <2>;
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-gpio = <&gpio GPIOZ_15 GPIO_OPEN_SOURCE>;
 	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
 };
 
 &pwm_ef {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
