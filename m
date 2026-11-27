Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA423606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZm1AVMX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7HmQUHm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bbueQg4+SDPvtuRmyKT+n553o9b8uBA0D7prR3V64Zw=; b=WZm1AVMX0VxyU+2TUIMWS/FK0t
	Cr/Y6thgEfD1g+njsyA9vEfeHfxSOuQblcKL2iKsHCpSvGoYf/wRFb5aUSWO21uKbQiNwl28Bkhre
	VqpnVptGTZh1XoUvb4ztDlAXj+xULEEFDI0UaknhLBP0xStI0DSG8Xxak1my4ZfTr0W0tJeYC8eCd
	khtvlF4fUvnPCtzvjFzze2MbePKnq8OA93br82b8KG3S87LYd5DYOLN681TUsg9MB0+tS4KYwj9X0
	7nma7aPjXhH3pw+FRcNfV/YpUrC/FVYwzfCUframX7CTxjO6DAaJbslWwHjpp9fb/pLs4blMrytFI
	8Jr3nnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudh-0000000Fw0k-1mST;
	Fri, 27 Nov 2026 12:01:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudf-0000000Fvyj-1qCH
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so24924305e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780874; x=1796385674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=b7HmQUHm1Q4LP4e7cPsKGexxGy2VK2LHfJON53R0l99RciIFozIiE4xpQXNIhmcGIp
         v6v1uvZPk0oxETkJiPxpbl6nRWBAt8gX9vCBLHWsPYdnmfmz61QhwHjnNcdn8uu6nd9I
         nOgfRWNksnY96jCgT8Gt3BuF9hHd97e29zJyfczSKAfEqvpKrc0N+K4LIKdImBQpYT/k
         0C84UxpgUUsqKZkJEqwNXE2HSFVi7z58gCvX7fulbfUUCSwTNCE0mSU87/eEYXYKk9gT
         55zt/UU3xHkYnYNCEsuLIefMdjgvMmAHKD2eL8Zz0BBOKWZ2NYD7tbB8L9ax2FLzyFUv
         rM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780874; x=1796385674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=bOYaguxSPeuKTKlrJo3D2ZivwfUfh2ZSeyvQn1iQlxEpj6A3U219A7mppsj7FL/rqU
         eWxbXd2mcAh78S6XymL3Tb32ufWDyY/MjKkLO+h4nsOFbToYHCl5mQnznRyIV2nuXVgF
         0SWEKI+muDLd3FyjQ5xGmpiDC5Uk+2dgFwIX8yjcgHJc9Kz/3gT7jOwIvqbCFjJ8CHkP
         ATulEinIqbe55Jst8SJZsrYSHCFKh25hijq6ctDfPcr/jRrU4iQLk44DxRMBBTyMsB/h
         WPHpFr77SYH3YY8qo9lQJ5Ruk3eqI5HsE6AJTpkS+AsG95ZW4LywUh2tjfMb7BcBS0t7
         69QQ==
X-Forwarded-Encrypted: i=1; AL+hErHPAzKaOmv9+4ZQ2IwngZAnq6rKwDTLkTq8UsVCrWthRsAX/hCw2E0kcyNqv0svTPJ+YovpW74toYGVwZR6@lists.infradead.org
X-Gm-Message-State: APuU4Z/7Kg24Pszh5Vp9YLM+JrUYlbRF5gpAmIEkR+rVZoKCw9IyBDO4
	SXIne5N7EUrmDLzfwZ9l23nuXgQDRMlDqV6K4u8RISy+5ehGQTRNcO5K
X-Gm-Gg: AZFdTZcCJy5/Fw08U+jKXzp1Gg36zC0jOag1xfn3JRmcCPs5nME4xRb1sRIjnS8Skm2
	MtYXjda8b6/44agSGw5MrmmgPchxFa/6h6B3pDqyLQeRZPaWq2AJzbkVo+v5tzGN/SOQ9rml1U/
	ND04Re27FxBnhfmuu488oXZ1H5OfPa01uffJJOG0Aaw6Obu6QS4X0SMroSoT6WDk8tHuSrTXpV5
	SL4yjGTBVf942d2prNEIJ6ohBSsikguFBd0sugsPH+yvX4p9p2xZHeBhI3Vbqr9DnIt0I6Z74MP
	x4IZb/ewUKhQ58YKh8i2h+fm08n+2jVkdpjNyGkEAIQOEDJBuuflS9RG5gu3FwOWhALlth9zNxs
	c37Iz7zmjjsD4QMd/tnklECxrb8JJt9iilwj/KcBVs1sPqP2Knr6ewhn4F9vVTOMriSgI3KjchL
	v022W2W9sQJgJlLSog9MsnfRrSJMeS+tZvYyDkkTvs8AaHL0htAvwdpFmpumhkIfNKECunQYT43
	yxeMbpZI/nBgWL9QoRLBx5IsVWZgWpoUhDOZrQ6EtPmmMvrR/LfjPXYWfyZgIYRa4PrqnX2NlP9
	GElEtqnQeiemYEeczisRNzom4qmJNHIrCnhLfhXCAamk3v4=
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr497694375e9.12.1795780873562;
        Fri, 27 Nov 2026 04:01:13 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:11 -0800 (PST)
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
Subject: [PATCH v14 01/30] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Fri, 27 Nov 2026 13:00:34 +0100
Message-ID: <20261127120103.1532882-2-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040115_490198_52BDE4F5 
X-CRM114-Status: GOOD (  11.41  )
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
