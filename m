Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D568606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FV+C7AQc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nJqdR8jA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzfCh0qs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vhe3GztRfP2jlZI5TOnFFLeax9bx0WtFnT5YlWQFBsE=; b=FV+C7AQcz1ACT2FyLn8IvgMFc6
	oblbKO9xIUJuylCxCRKyO7YxY7vD4Anzp3o4gR9wUbU1rU81QrkuxruiTAYMHs3sG7UuLoKyvxD4s
	+npfplYp4teVF2H8MXqBiIFu7ZDQxEJguuMSizTkcs8tt6aHZuuettMgFO37rA0m4C4ixLKSt+sbn
	QOy8BDGWItwh0SvSiHnui34mS2vkG5rRm0uHwWVk2TJhoRr0KOGTVIr0PSduN+KYWkUCm/gcPoFJc
	Qb8FMC8KuJaXy62lGGcIEe9w/0Ac+5oF9v3+gk2z4jox5qOOzvANdw3QhtnS1+q8hv3DO07Oc3iNY
	hwfc5Vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufe-0000000FyEg-2mDH;
	Fri, 27 Nov 2026 12:03:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx84-2tfn
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=; b=nJqdR8jARCmdvYCDx9WbGWR/fz
	XmpT1nkKgAKWf35uSUgtAgBWkX78JtNpV8x4OoYu0OVBvAnU4n6C/GRe/d0Aqvi/o3CjDZ2I6m0xF
	U+DyrtWv7+25oG3Fdyq0JU6Nz60FCqJR1WEjF0e9rRV36DGbaWvHyAhQnwOvfzqwmwWEPbYsh7lVp
	dhShiYS8WMA7lgOO1onV3LIVPDxF3NSXdtHicSzCm4sQCXcy8K5uRr4IZ2NOaLGFBJlbOmZJM9SdZ
	2bv/Iq1xwa/yVFDUGOVo/Lxno5XrpwUplsgmytnbN/PjU7KkFleO5BPHzMlaEvtECsx1iJN9lQKHd
	8TBPobPw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fke-2Pfk
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-49465892f7bso5873263f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780926; x=1796385726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=uzfCh0qs5lDx38rG2+C3oHtDNIS4x8FJEMhZVkBBZiiAG/cayVhMz5pNlclQ3x7M/n
         un7DAqNf/WdQkEPRzmrs3pvw1EjKqcrYLUJhu64pqx+oimRgmeAU15NMM2DYACmh/R+K
         y60+HNM7sW080WsYZtVqyoD8xgcw3qMWnnptcmSg3OTXiEmYNdPVn/5SmTAIg9AcyJEv
         ei4CqQKDgqvNCZqW1nUhoxt+MfaQlDHNV+kDTGiFF4I/re745+WGmWZjBfcGvd0Ez1B+
         pc8H7Iv8h/8bLOPQQ3DuAJAHB7pvlvFIKkQZU/MX5cnbTSCEthboqA4RFsLt6vowQvim
         DXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780926; x=1796385726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=1BT3Bfrj17ImOvS1e78pp785mN6XiO6cGKP5RUV/J30ZIg9xqzRG3nlHAphce6gH36
         s7j/BVLwqFBfseglQyV5mcSNR8fVlIPDmZuUm3zTLf/6mMhBcfqKefSKZIjPdFAXuA5q
         0tcI1E8f7bl3Rdoi5AI3sSjpuhCCN8BsfD1qYO7WFgV8ufIeTV1FjkCb2WvEyk8IZspl
         Lxg18YA/tS9RRdfxqhNR2DguJhIjP/4/Q7ctVUTRKTDzFwFKGHI5ZEiMoenEnLFLLo+W
         Jrz4gBknDO1v8uVLPEzy1pvwnsJoX8bcfS++LmWzYjdz25UzXNeC56jhSbYQTMKSay8b
         v+lw==
X-Forwarded-Encrypted: i=1; AL+hErEQJcE6Uc3LRdTrLFtZxXlXnUBimRx93/wEBfVdMwvz1d4v9tmzVwWdVPO7oWTF+cGd6XU1tcioiKV/Bm5U@lists.infradead.org
X-Gm-Message-State: APuU4Z8UbyxcvKuHkQ0Njpm7ZhI7phHOUdZGZUN1agGIU8FIg8HgH3M+
	vtwfZbPySapzF7IqbVSQ96W2GZgG2iysJ285qZs7PQMfrLPu3CaDECqN
X-Gm-Gg: AZFdTZetjfRx4dZ3Lfrqc/ek+zOzFM9jdLDlUmkAoh568ggkNdw1kVU73w+4c01zlVH
	SrnaVDFvoS9MECXWWFnzM4D4zT9iZeeciasVXPn/8fCTkAz4VTKaelJg7oBq+MzlnwMrOCWgQ0f
	JunB5IoqS6RqpRoiYWOFAU3R5YpV5SpMtiBVKi+T1djL5m1UHI5mU1jRUzoI6IaIP6hrXW1q/6H
	miKoFhu7K8Ke7AeF/oIwcRGauJR5vDxqOmeFF/DjN0QSevDWh3AgLop2f1vSbkgYLLaymnPxlWJ
	1SyWsvw7VO5IzGEoGSUqomgWusPOxPHHmJdMqsSxpXAwWiXT+MAGy71vODwENb5le/qeTvFpng1
	pPscw9nKwrEPut8ffhXqMUj82MnfO/FX+dMQUhcx5sjGRLN6qPed7swSTmCo6qYdeE0yX7JAKFk
	sSshMf+foIJ7axhiMGRix30a29OaQM60sfc8twKGI/EyAKLzGq+0SJzLd3eihBTSq/bISQRoT1O
	3exMbtEMNEdSW9OttUy5XSiM3g+gsCGxbuP5akns3XC1/uP7dUx3cWHRPNLIptt6pws9u8xo8YU
	qRWFMW4HJe1S4FfUDHtA2CnRZyFYgLc+
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr492027085e9.19.1795780926108;
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:05 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 26/30] dt-bindings: crypto: amlogic,gxl-crypto: keep standard property order
Date: Fri, 27 Nov 2026 13:00:59 +0100
Message-ID: <20261127120103.1532882-27-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_547991_BCE5F298 
X-CRM114-Status: GOOD (  10.82  )
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

List clocks before interrupts, following the usual ordering of the crypto
bindings.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 106a9d1fed69..6f19e790ec0c 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -25,21 +25,21 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   interrupts:
     items:
       - description: Interrupt for flow 0
 
-  clocks:
-    maxItems: 1
-
   power-domains:
     maxItems: 1
 
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
+  - interrupts
 
 allOf:
   - if:
@@ -61,6 +61,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
         clocks = <&clkc CLKID_CLK81>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
     };
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
