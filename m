Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E258CCFA18
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJGibPrWjcLBlqq3MRPbK2+30LoSgowDbv/xwpk7Zfw=; b=v8F9XzvGLNE3Zg
	HJ/omJXhiJ6h2F0QwdEZ6WsTqfz41BEzRaVyEHgLCM9sswJE37v35t+7hhSKA6Gd+okwEYTAYlzCq
	t4h/2c8s2hJlLYaaAuwtNT7qJMSLn7RYaIf7hXAEjjvcekma1paZ7QgcsO6azRKK3KqEjeIMR4d1v
	Go8gYcQmdmATEDgld3cCgaEJXT/5GeThNCul1V7MlThDLZlzPbhnmnuivNE3pkD1dvNb4NtkvXn9e
	HX0J3CGDIXJe2sdP30gwHFhSzQpTqKKizBKQBcegaVouoD5PvfYVBnujm8gsYORn60FIcCsSqGMJ9
	2+QOElYoDWlOGmFu7ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqHS-00000003THd-2Idj;
	Sat, 08 Nov 2025 21:15:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqHP-00000003TGj-3ahq
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 21:15:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b729f239b39so395456166b.0
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 13:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762636526; x=1763241326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZgY2Y5BzkIraCasJSMFe50CTMRyvNR5i+L9TZ55dRQ=;
        b=QNc4JCEBmScy9HCepcpwRykw/HOnW7vvIbi1/UU28wuPilOElFHNeImJgfhpC6pIVY
         RF5xg/NfhAm+Bx5AJqc1sP8TlCUeTCblCo5rLM2GdZ4WRumYIc7wZOq2H1EUecVHTQjb
         MIORYZ33TupcNAd+JucIR/qROm6TD3E/xzM1asKkg0ExjszbaW9vIH3kdLpf8ER1VrDf
         kSgKz02sC0LKepwUPIuiq/V0fPeH9S20a60qnlpL2BY+Y9goVyt3+x+JLXK6Vind1kTe
         GXLFiKdQGwGZgARTenPrxO34+gGkzCGp+IbJWJ9ITynRnkfcfLyFzKtDuetXawB/rPSt
         5KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762636526; x=1763241326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZgY2Y5BzkIraCasJSMFe50CTMRyvNR5i+L9TZ55dRQ=;
        b=WtZg3C6QY549W0alHcgLaOiNRWQSzq64BGd9s3KZj6asyP5uk7jcP+Oa3J+xH6Y79i
         LQ64DP55a22/LAgmyp12WibOGycwaDGh80hbi/Ljl0BmTB74Q9HbIepHkRuElhBr+XvG
         gDE+uNdkCdYu2FhX2J4J9o6V0hDfZkWZH6HpbF22ozuXh9983oV3daSKj9WimnqVyQqS
         AtjGWQqAq03tRyClVGOnCS2jB9ekeqx9RE/K77dWQhOW1ZxSAOfQRNtbQYcBdQz4djQY
         EipHyV5UAauAHCYcUPlzhLhlYp3lKCogU1+ITSDAFf8CdetPcwNga8ZKoaXpKi+69wid
         7z9A==
X-Gm-Message-State: AOJu0YzYRUdcfQPNtGAGeunADPP3fGwmvs0D9jYW6tzr1qQTlTyjuIN1
	a4PZsqBCle4y4+DlMTspFBWqFF+bNmWWgIqc9OC8/yprZBRj3IrD/FQatDCyRA==
X-Gm-Gg: ASbGnctLpqwfQ9od8VXpYUfbr9TlJ6Shx4c2BvI/veVX9yoWOkqvflsOJ/QFFMYqZPC
	OFy3wpbL+65nViAQkVc2DJd1QYU4gzqo6QHc2235v+T8kct4Jk1+wotF1tWiNqmN6lRC975kkyG
	UiQeGgqljtvzoaevv3tWDgtnHmSZXDiKAmSnnnTVEoIrEWZbu/axQSeEB6DadJ1pILuUFP9LcpA
	bNQdyLCVoaBKtR6QELpMyb0RsH+mkgh5XB44MPBW+uPpgjPK1zvnW5/IXN9ZOqacvJzeKaUv4ii
	3yuCEiStwA1t2lX75fUgeipIocUYZgNj7SZgLLoDoSRZprJ7oX/RGj0b6uKJdgafVpu+14fJ4zI
	om6gNnp1VmtleeHLdFtyIAv6eP+x0ICX5T2BqlTBgsSjG6RKTNCmQz3FhZF5hEW/Mn/EqaHCM4X
	F+7KeGsi7xLivVy63dTAEN3F38l7VWnaX8X0n1SM2zpiPvuzBDVSS+TfhO57CBHXL9Cvkmg2dSS
	5kj10d6YtmbGuKXEcNlgNXQz7nN0lcRuKqmKB/DoFA=
X-Google-Smtp-Source: AGHT+IFDQ1XE4DMnxHGoDNAOKOn2R9RCApPoGixxW18C4L6aTC8U7/yf3/RbX4oWw9F4XY3sUBF55g==
X-Received: by 2002:a17:907:728f:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b72df9055camr438123966b.4.1762636525488;
        Sat, 08 Nov 2025 13:15:25 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm625110666b.22.2025.11.08.13.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 13:15:23 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1] ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
Date: Sat,  8 Nov 2025 22:15:03 +0100
Message-ID: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131527_892535_2463E831 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Commit 85b21fdec906e ("thermal/drivers/generic-adc: Register thermal
zones as hwmon sensors") made "generic-adc-thermal" also register hwmon
attributes. That means we now have the temperature sensor shown twice:
- once from iio-hwmon
- and another time from generic-adc-thermal

We need the latter for SoC temperature control, so simply drop the
former so userspace doesn't see duplicate sensors. Also
generic-adc-thermal provides a better name to userspace
("soc_thermal-virtual-0") than iio_hwmon.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
index 28ec2c821cdc..6792377b2841 100644
--- a/arch/arm/boot/dts/amlogic/meson.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson.dtsi
@@ -12,11 +12,6 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
