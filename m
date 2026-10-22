Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7444606A336
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IToyvAj+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m/HJr3gI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W9rMyy5S1g56VcD+8bICUgn7XgZ3/weIyGw1UsluYy4=; b=IToyvAj+Fr0X9aBTdy8/sS3lcr
	H8+TfUdd9O6um7WrQ10Sfc2PmRy2MCu+YJnNdFlIi5TVqHsIbQffmy4hCr+MbNDyO+NJa7ql5Anw7
	xBT3cr6LCkC+uOWzaFT4367ewJODTUwZPZM6DgYdLl9rvIO3aeRwTYsn8DgaPIe3oMMf5HX1qKzY+
	ClmvHytWMF0b/qVcVo6WSHVj/dJKN5pBKHfkcLgTtiXEcSAV1rBLHhNWvH2UajFLPNPQfCvvxJfQf
	aToDQlO1pebh5mqxHDCQ2TkgeESns/4H0BkYyD9Rc6JsgIREK2As5XDVK2heN2yki4V7dUI9XfDUS
	3Ue34WAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZZ-0000000EhzM-1m7T;
	Thu, 22 Oct 2026 18:31:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZP-0000000EhoV-2K0K
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso588505e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693878; x=1793298678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=m/HJr3gI7mfxjaotONL/uyip/QBriWN8RfvChqfxBYGj/nCQLrgUDS1QPCDl4Zq4PZ
         sP9xCupj4tE4zHfIy3ky7DpLL8Ad+W3e1B+bSHdtacF5PH7TYJ+lnpOuLMCPU3ClsHVP
         LsqiTaUUlN4u5inDcYM8kjM8ZOvNyYhKmP9Rmqen8dTlgY+ow3QBRE6dYHN0Fd21syhW
         p5sWp3JVaJ69o+piLiKsaB/7/RbfDcpeIOMUUacWHEdBKE9GUyOdxHWIbxy3f8wVR+Jd
         lU9aL8Mw9+hBqtq5fSYvLM+0IXGhN6Bho6Sw/Sk3MiiKQk2ESYmJIcDv7ALzWUHwuV3a
         IH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693878; x=1793298678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=tGRkuL3QPs2FhkmkRTDQBq7ROkgfQoHbB91GIwGLEIGJ3RwSTfUGqxO1nrR1dn1AHc
         wB649fUXbLRJk5UIl7pfd4jl7XlxkX53G2x5r61LBkLhahC5tPvJlLOQNRv7MlHZ9JvY
         tZLUsDKdAuSWka0caUNEssysPfseMRmV2lDiWsVp1BpvPonKxbDv5/UP2Lq1N0wiDrVh
         grBEKwhr1FCFlY2+Y3NoQt+4X0tAntQsiZRHiIFIPzZ5X1y/mJy7VjpBBsO1BZ1WdeY9
         jfoeJYltgSnP8NYzoyJpapLMlPl8j9D6CqclKTc5Xh5OfUm65XyhBa3agtHfyg9QkhAv
         Q98w==
X-Forwarded-Encrypted: i=1; AKwUvByRJ7NhPy4bNT6ZUr6z4gopvqn3MaZ+Ek0LLE6Dz1rnS6VEPVAK/BDOZSxfksSI/xZVgnZvCECf4bIavIhu@lists.infradead.org
X-Gm-Message-State: AFq9FYLo1jvbntKpOmUZoluVtUlQ+A1YDSItAtO2eq/B5wzSI+bCijNs
	ow00GhsofkOdDZ+DYR/PiTiFmg+vWV2eYUa9nWNxtXGt2/fu0Qi1D8N9SBMq5LqX/BQ=
X-Gm-Gg: AYBFou11jslMdluhuPfAZtxHwQ5uCdSZzHohcip3KU25rf6HGX25ZYxVF6quW/yPv00
	d9IRXWVBoBSm/NaxdwSfZ+U8rU27D3qMqZbNegdDtEIbvLhCSjFwujaqz7z73hVSPdQB/tDMyWv
	AGHd/1Bnlun5/NKMZU7SA3KJFx6CECTq6aclUKwYMDtLHnr5Wmlfk5ui4lJzntKUAYAjYPeUn2/
	h6QtHphy2Ak+vv9YvFJsQqaC4gqcRcMGWEXjo8wfrTyeYPJDc7zPNWy7jJYcJ8aOo/hVlHiwkFP
	pxgnp8BeWbB7TBruxp7ZL5z5+N4+bCuKALyJvyfUJp8QKAksYCCkBW7vlPIOQWxaJUJzrJeL2gK
	9VqNqWh1zWehzsFPY+VHD13wbf/8+avtLBiL4GsXy2xfBvjAfiQev9tIjYKO3hc7VIqY2ZH4feY
	3pXsXI3WWbeb0K6E3ZoJ+x8TqYpIK4fLKVfn6zIhGJ/28yZP9+l6ovOQbNuYnt2F8nzqbkPQI6+
	1p0hXoqdE/1SSaoJiqxuk1Lk3dBKcEe439a3cylqU800TVimmqcFie+wnIoLJs2y1vqrFMuUUqU
	BInJe7s18rwX+mOj2lv47vH2W2y9IVOXO+FS0hqzKPo=
X-Received: by 2002:a05:600c:8b8c:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1fdafd5d1mr136430265e9.13.1792693877622;
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:27 +0200
Subject: [PATCH 1/4] arm64: dts: amlogic: s7: fix the GIC CPU interface
 region size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-1-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113119_869550_10A26AB4 
X-CRM114-Status: GOOD (  11.91  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CPU interface of the GIC-400 spans 8 KiB, but the S7 device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot:

  [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1b753fcfcff8 ("arm64: dts: add support for S7 based Amlogic BP201")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..89b75bec40f0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
