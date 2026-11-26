Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF821606A32C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ij3t6IQY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTyye8hF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bbueQg4+SDPvtuRmyKT+n553o9b8uBA0D7prR3V64Zw=; b=Ij3t6IQYplN2U0U/EVfR3e6xT+
	dDDZyDYb1zQjTzvYCRkUg5Dtr0Di3kqfsjcmnWVLKupHKCp5Dt7qFxnwtwpYvDcfBxheAVb2ATqFb
	tkradH+B13+GXZGx4FndJgPjdFmil8p8wrqzGzOVjdfOgVUIdw4q1Z5jZonD6S14J1v6tVDAmpEnz
	ShuC/vHZQJpqJoXFF6oXkDoCZSW49lvlUxlifWNvkN+VOl5+ZxVBZY51qydUTKwrQg4PxNjhUV/Ym
	c48DgrtOR3z4B+sqA46PQcdvW+bbW9wt8ulFwGzIofy0zT5Ckvk/0ukoUTSjgiGk3BOI0DzEWU1n+
	RlAja0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDX-0000000EJWU-1t3X;
	Thu, 26 Nov 2026 19:33:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDK-0000000EJNu-49hj
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso68523345e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721581; x=1796326381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=fTyye8hFFGoI0LQBHn2O8PIkdQgj2THEAdHahnY15y8f9Uf3x76Chsykj+hJi2tDdW
         P9Kjhg1LrpMU0oJmxi7etIYSc09dGitbrbKhfj1MGKLUYjZSOViuzcLYkIe66oQUhqEt
         IH9+YASws2LyYHxqTwY+0JsUva3FaCs5zYoO44EMbFFj591ktAzzTXE8txf766TALBLU
         0fKDfsv+ZxY16gnUzGZ0pQnj64Lsus12d87Uvn8DJfsflXwckdzq9iiYxOKMbGieSJzj
         TgMrPxQu+jNazfY4hvq6LVBbA1x2/ayi9LN8NpuBkNEdGs10HNxG4phJP3eAnEXPYU6u
         /imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721581; x=1796326381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=ePCrXzJyVrfMvBhpudzNQ4almnPJtbmOaJzvSztdE3KsT3jT0lUEIDrFWVGVElGKUK
         sWzR0HvZ4r3LtXNr+aBDBsGinNumc0KQPXXj+NhKsrb/UJjnElQuTdMgrNDVAoCu//Zi
         OWVDTggumHZpcZ0oANqGNNbI+3jbbv7au3XUULRXo7YGXDa6a2YR3M4SK41O7u5Lh5hd
         0F8/HCZER6jnX01EHmk2nRKQHZ7SEA5S6NUvoHEf084LllupKDRuq2DgQkbaP4cJfq/W
         OdE6xPTGyd2ualN1s38dw4mLwuGUY0s90hL8mMW3Xvglada/WQuavs9jaSbWYqSOI0H8
         kMng==
X-Forwarded-Encrypted: i=1; AL+hErF19/bfak3SFkBJ3FAmySP8aTBuQTFClEQJEQMRXfQGRvpqGG07JNgfyYJNpcD32jXDgSgs8TCmTb8eAQ5s@lists.infradead.org
X-Gm-Message-State: APuU4Z/FIe+Hi/XA3YlCleA+m1HNuC89QbxIFPbM7ozJBoOCeDdjnIsP
	sfFc9EsJELSKGgSfETI295PLIMUP/gW/IqIaDZUgn37Uye3+5X1Md9HkVoRBLRRDH04=
X-Gm-Gg: AZFdTZdCV28mXsln+foapQ6CJcO3TRXUof45EppOOm4dxxoBjjnTTRQUTA1xOx0VQ8l
	G2gekXrsTifV7s6BXbhx0Ww261wqQM9ykQ2iSvmOZDxCMPES9P2+iU+6Z39pOn5+dcuPDSPEcMn
	YGb5CALJaaZTIhf1FLqrf7zLMkH24tN8fTLT1APmplNuaYEGdYUdtN9cTUh/cYAe9+Qx8tpQox7
	khZVXUZ/PT0QAemxKdS0enaD1+3hiPD4SRjseUZUZwnuVlPWThqCwYxd+8iqiKi33aj/aX00r2F
	PVrhBgajSx68Z54gwBrNLHWLKFGfBBkxje5RVWyoTUE5bZsi9KCxtwthjCL+1WH/Vx1GN0ljUEM
	u+XiBTIuPG5zHZPrAsEQxdMZp6eAikpXEBOdYIUYFsR9HdPSPNRk70NmTeCwT4njhJYfabXVhq6
	TEQd56zmdqGxIY2bzmcMOPGcp+MQKWKmT7UBEEdXtKRA4Sf5/1GV+ssC+k4oGWF1h1kCi4fEgXN
	NYxZpQNB79cJy7eXZB0eJn3YUCLit+TyH5/0+zGx7Dv6zTMDj6vRylR0IzS9KBCmKMuJgAY7Aud
	g5aMt2Pc+8VvXcWT0sWEtkLnnAJiMGJ1kDvyfl3rInKEFw==
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr475541865e9.5.1795721580895;
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
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
Subject: [PATCH v13 01/25] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Thu, 26 Nov 2026 20:32:17 +0100
Message-ID: <20261126193241.1471372-2-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113303_057841_B7379BD2 
X-CRM114-Status: GOOD (  11.73  )
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
engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
field from schema: name "blkmv" is invalid and "clk81" is confusing
and sounds like something global.

Also, GXL crypto IP isn't connected to the second interrupt line.
This binding is useless, there are no users of this line.
We must remove it from dt-bindings.

Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..fdc39797a2a9 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,15 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
 
-  clock-names:
-    const: blkmv
-
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +41,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_CLK81>;
     };
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
