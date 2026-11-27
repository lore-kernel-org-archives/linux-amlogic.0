Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F07606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tdVoIXZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HcGbX+PV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAjt7EtV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JNCj+cGqasHZ6c/p43/R5nRxZHYWXqxbV5Z7ptBSm6U=; b=0tdVoIXZnLEDYh12DqmeL+uzO1
	v/p6yNsYECQEQ5FuX1sUhqQJ7jSVkzePePUoNKeXP9OdeMyBTYKGnSTV3wcc2pTmuvq28M28d2aaz
	eQ0JUZQSYEVTcwRDsXlaZTbR7Bc2O0sBknPabWjYVH7JWxpue97KkWmKtbRc5MG10UeVCms01m9Pi
	/IB7zsHSYMOeq7um9TI+9UW+Fu5wC6VEnpAOuSIBccvuyRY/hfTZ6v9mro7U3tH2wMAEEesKtPkS/
	wWR0Jk88wdyhAV7kxvKDxlxkKNldEFVDcbuVwhnRqDGoA8qFdd0jiUlrZyaHsjwsrEMDw5z/IkBti
	aIIlBl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufJ-0000000FxyX-2nLU;
	Fri, 27 Nov 2026 12:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueR-0000000FwpR-3VFU
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=; b=HcGbX+PVpw+r1FPiyn/pVOz5+R
	k/1wEIvtJ5jw5nKQhRLJ/K+r294nR/26jZu+A3lADRc0+TQI0s7rGM+6tKoDIXeYhw11XeczQ033X
	++/MXloecgNsJsgMV/TOSHctG+3O5400M7uxHUWVhpLxZVN+2F9ZeBDyGKfibr/LPQewFi5jxgNnn
	NeeWvWUfHaClo/f+d/a26O+a547xOqdom4/3gMWIRhTkCRhsn0clW8du8j4fC/IUviPC0hL/juTW4
	wC8Zufj6WyT4A+9nB1wC+IRfD3RVNnLpQU0KXq9601AI2h5LoR32+53GlBs9BvCjB8aOBbfb1cDV0
	gw17miag==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueO-00000007fgk-1xFW
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so24930405e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780918; x=1796385718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=eAjt7EtVnzDsy5tCNSaaz+wmpAfzu6QmZlQ/btIBhiHnzn3LZ86AxGSsUWqz+SmPKR
         NPZxwaf5ty6WpXGqh20mUTBkAOT1q0psQon3KKPFOnf5U7ayX8qgcu303bOfqatvhDbI
         o9XTOg8N+/HYqt0wkRdHen9ywmB0qm+FfXDXTfjsq8Ot1hYXt7zwHyYAfgycLVNw69z8
         QleulQ+ssw7/xUYrYGL0olEt9Mo4quiaU/e0Cz0njRdcEVI68jHzwP4FPnZ7jnTgd19Q
         p8hJFzpf/BcyAp/Fa80qzn31zyOLRSQHOKMxcft0+hEUqlgXOTNtafkpfn4uHDZ8B7yU
         okiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780918; x=1796385718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=Ch85OJzpKCW6BfTDqovoeKqgw0cSoj0o1Zp4WfOJup0R+/GCY0GUWJa0rmxjjdlE8y
         18YrTtJdQTz2Z9MDkvWfL9xgWfGCAUg6YeSUnnhViVSlcJcwTe0kn8FLYnTTYcGM+Tdn
         reuJjXQPxFw9IDkOVJEY+X666MgSjuRhYNzl/ZFt5NP4y175bhgcGc7mTtNDh79oid5z
         1zZMGaeNSdeH2tGUz8rzmpWLJ62MOSkT7IJJTaLCfugta9mdr9vesqh9rBWLO8BWr5do
         g0ZE6W00k5WEDzdXZVadIiOlKtpM3ApMe0XcQPuXWlpK5IlK4zUWBEsA37/h4ORjrexD
         bk1g==
X-Forwarded-Encrypted: i=1; AL+hErFxYczNRfmPd+QNVeAQ2rTdyVwfgeUudszVq3/tGkzNmujoKo3IpF8W0hYv+O8L3wEcagyy4KTcuqbIOFLI@lists.infradead.org
X-Gm-Message-State: APuU4Z9LZ7Er4wMYYClShbYE3wnQVMmNYD0NNDXHaqZLapdbsr4beWK7
	9KadlwBXp1d61NZ+TlidNgTXJXFodYuf+FNs4ltpjXwGA0qetx8g1rIr
X-Gm-Gg: AZFdTZeA8cu3lNPOuVCQu9CHTpjutNI9fqokn+eHkabccyHgHH7dt/uCPxNWBbt9l/B
	y5I4TMUTDb/6WKciBE6u9YQYzTMYorZaGzbYD/q7A2FC6NgqB374cS772+1yr4bh0UFlY1yfCNP
	AakzFTsE+kIKXAmIQeMqWgVp5KS5x/2bKQAaVqQM2Sp+IZyLG2qHWA3MK3YgpmP2qrFnNWKsjds
	I8f/6M+ZRy1MWJC8UuOrUgQdECyz53qkeKvRfHcSfeYNrCuISi2FbHh3R5d83tGBLMfNDkuCnHu
	//KEXUnUZJkgg2k04a8nLKXorj8T/XqjO5+VzOmn7Q0xYaQJjWcbRx47gT47cajttyRUTyk4kI0
	cW5CLQuuycVMH7aqczPzceHgnm+aJKzg5A+pA3GifOqFD5dlet0YunpRagwRt6hMy71lg+wCR1V
	q9CEeFfVk8YfmwpvwbrJRMO8zNa2Q5sEex5KRMkq/ynRZGDYhLqM7ch9x8OhuzJLwZGt85er/KM
	cwRndpSVQmNxIb3eP9fi5+AfrAQ93Y7OpJ8nKBfkS/Uh3RHPh6RNgl7aMJ7yUcdfBTJbHq2noVA
	+zYvL3eKbStg8EHefDMmIIATINNrCRYp+Pz5MK4xAA/nEUU=
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505147675e9.15.1795780918009;
        Fri, 27 Nov 2026 04:01:58 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:57 -0800 (PST)
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
Subject: [PATCH v14 21/30] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Fri, 27 Nov 2026 13:00:54 +0100
Message-ID: <20261127120103.1532882-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120200_386870_FEA24A0B 
X-CRM114-Status: GOOD (  10.86  )
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

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
