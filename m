Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE3606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fio1egU7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dI94ZFLZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaHkarng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fUtTu6fpDE4CC6Ii1mV56UAF0HTqWdmYj38rehcAqTE=; b=Fio1egU7VLRqIHGfjfAu8rJNY4
	uWczWRsL12qw922UeJ/UVAD5vUjVCld3qH6W9AJMYAsevMzsjYpOq314NiP1LPsEUxuc/mVqpfdMd
	wpHwColewwa+570/g/C/3nrnQYgGEbTYUn7gyon51v4ts4wzzywyw6DjviejjqEc34jsL1bkUOOn/
	VQ/WRM7x9SlLqfQNa+OQljrPmlT+HLNV5FltHlKfYx8AUcyJfDW6zTQ8ibivIJvk0ro6HA0LAE1Ag
	f4K0gyYOo5MRmj1jJrJgkJJmPOXtv57PkDIjduuk2stuaDLenKryQwdKl/QDK7ePHipUsuUbyWLdv
	g0q4kjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuge-0000000FylB-3Ej3;
	Fri, 27 Nov 2026 12:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-0000000Fwx4-0MnD
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=; b=dI94ZFLZBsD0O6tn5J+obDkVVg
	gLKP75mjlREAI4IG5dEyrQ0ByU2F/nCX10h8jycCJEUoWOS1BcHrQWEd9UP9IPpbDjC5jIW2zfa4E
	wQBa2TSzaFcPeg01JCd/Z7yl3hLA/2OjyqnoL3Jl+C42U5PA3ms/qQLAo6CkreMTHYISEe+ykbBRc
	F7crPTX5TDuW00iu7T/oiyqxfVLAZbrGSl+BN/mekbeinSQ9XzPF1kGKapypEczQJBchHg+is66GL
	X2JjntOkUZyL93GSpzgD3Y6BIa/WFkvGt1SC61NIIm/HZAGIFs9CbZWy+JoRxSko+64ymATxEObxn
	u8DXIZIA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueQ-00000007fhX-3OE6
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so39043695e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780921; x=1796385721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=eaHkarngT6kjEistvt2MjRxvLtpiE/k2BhnbZpGhNpnMn3jfoUujhk2xDtPRh6rmy7
         5kDOcVLSxIZsuplmkvApBTv/VoPyDe0aMd9+RYsYkag4Qy1YKg07wXTUH6XrA8XycVtT
         QqPRgUR3ayLh8NATW1QwfHXjmcY84JOwSu9TtMLUZPTW4rhusNf2XDOnD9Y11knG2Jli
         bbTZit/FOE71XmAkgwWG0rGLw2C2aFP2liBLT6mCZAkUnbqPwPriBSKBZ5yfgwIC3+vI
         pR9oDZjs0e1/wv+kHGlZ+71E8DqxdyNjmEshUKz7x6zigF7gWUoNQJlYvXBF6O7ifgAP
         K3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780921; x=1796385721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=GrPMSIyKaZCGZEQTdmp4BpvcP1XE1ogXIywLDBRusaTXQfhlJsvVcACpO4TdusN396
         oz1WltdCffgM4j7k9hKh3mFpRZK6a8ISdqgsXMjZA6F5CgiUjNBqCw5R1nPHpKOoBxOO
         LqBwZpM4cdPeDr6S6IcZGWj7Qs94qXw4rT5YF03KH6UheJQmFcm0ginvpbVLusZgPJIO
         GRDSqJ1sDTGIQvzPDDuRV9XT8jAUisXXeH3MUTOt4ARA88ckX0rEuOWmAfKGdZ+5HIfV
         1IG1+c1/G0nzrv+/0PGYxGWwcBVuMVOmWHToKEzZ3SnSLv+LDtY9mTccPvdyicKW9z0e
         Cxpw==
X-Forwarded-Encrypted: i=1; AL+hErG+Jh+pe+vTEKRbFbL2FDNncCf9ceEAbjID0tAKwkQvSzaCC9zL+oPDRiR+V4PxPfCMriu5/BxEiQlkhkkM@lists.infradead.org
X-Gm-Message-State: APuU4Z+LqNsURV7ts40QTyVL1UHN2YC2faB5sciZrYwjwqKiGktKzoqW
	dxMcWU5sGEZDM7jr4o29WvXTtqJE1YplSnyBwDsDyCPQCWKaJYBKrDAm
X-Gm-Gg: AZFdTZeN5yb7T1z4BUJQeL1Y5euw7m8+tXHGwQJN2eopk0Xy3cImCO99p87AYiKnUs0
	h5IYESrraWuAseNGy/hSC13t31Kga9qONB9d3TgJgiqmQoG+eM3PCnB6kMtmyNziaCVdL3YikrI
	VYk9i4hKL7tusbHCaOf355/sf9M2Cl02uHhS7iMEvirMll5MpEBD5l6IsYNSjb/lPCVmXn7XLCV
	5aZ/tvZkeTeWvNeJrV3X4++LGaioijFyi/mFrAfH/wh2PEy+emPnTZWBekvzNhR38cm+fTeY0pv
	mWqWX3Hy7h8Jwstg4V1C0BEVXt++5dzj8hER81VnMfqfdYC98VI2lOEC5g5pLMnVrEXP8QA3tHA
	csgCuIEDCU+k7aqlDGorKFx24w9W/ZnlXfAjbH2+JqkVvgIWdqO6wPMeeNeb/5Gf8/ock8cxmjr
	1v2pDeNcKB3RSXYYnTA+HcbR211l6m9VwxL/uqJfPz/yptlz6V6zD+ew6a71Wbk4eqh+mPQm0ju
	0kvK0OuNnSqe5er6BMHScP8GjpJ33IUjsJ9ArdsiacTp5qW/Cii1K3JeZKiL+6JZUDcMJn6Auei
	lBQom+gRLJawFpplmjUxBKfWC5ONcSj4uP8hCba6j9A/zB8=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353987715e9.10.1795780920450;
        Fri, 27 Nov 2026 04:02:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 22/30] arm64: dts: amlogic: a1: add crypto node
Date: Fri, 27 Nov 2026 13:00:55 +0100
Message-ID: <20261127120103.1532882-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120202_868631_3B6C21FF 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..396260b7b398 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -686,6 +686,14 @@ sd_emmc: mmc@10000 {
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
 				assigned-clock-rates = <24000000>;
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -767,4 +775,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
