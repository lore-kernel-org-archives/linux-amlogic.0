Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC45606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cnFwHzGa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoW2Zrc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yawqtm1JAPXroMvCxl3pHk4v5+h8DripJ8KUjetDuvs=; b=cnFwHzGawoFPVTtD4kNSIWVSEs
	3O8BFjxAaIhjXnucvgoTF1dOYl1lTNgngHp8BvQPlPWVPom83Quh/lglb+svgZKhSka5Ylsmf7Hv4
	zZk9vHe5PJab2Dkht015ig2KNtuQcXXrQbSSPJY+bz3gbwMn29eeTg5B+goEzVqB19ue3GQnEAAIA
	DyE7he3eBnbxpFF7kKwo1zv6eNb41H/BToB2xsZ2/yOtl1cm/Gc5LtJISopAWBEqEbXm1CNgTxOrg
	VZjtxapc2gLxHx4xME1d7gj9ofh5TzsLExMbHyBQAZ8F0fqzcsVOgE1F+g6DXzWd1Rh3hRPyTPZpc
	pXweTRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudx-0000000FwBz-2XpO;
	Fri, 27 Nov 2026 12:01:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudh-0000000Fvzd-0QAQ
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491971ac844so7093347f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780875; x=1796385675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=EoW2Zrc2+Xv+1fO5xPFJHGE3swLVJzJHf613svESVKGim21DH5sdFnZNj7lKtIMFjP
         mNLRY3iYLaoSmN19iktrBMnGX99tIlfiJ0S2Y/7L350+HAMlLTlX6reisGIt3LwzglhB
         QHojDhMJxmj+bbwrIxhkWlFxmZJbsjd5HCCNOQ5PQKw1NyuFh+GFxqX3jowPE43eQtft
         Pbbsrro6emdJmOkrB7CGBwX02VIJrHn/Cijnx2JtkTmgZuEvlYXiAYKMCH3N6vg5rA/E
         KCdFk3qM75wgcmghKzaLrCL/G3XJ4vCF7N2PiKn6ILRxfsrK3YNco/U8FJfctre+gJW1
         9izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780875; x=1796385675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=p98GU58UB2LczsmHEhoeoMuSWdP/s4Fq1BCv1SqhB4WhuvQSU5c0BqgOSzJn4KS9DO
         WnW9dXVKHVXWGICpOIZNqcjOje03KeOcNp6O7jZIlTRf2L+mbQqN5wetHzTew3SJkhAn
         sA4NlgpZY8bQH0998a74atcu+47GgIl4Bq1ATfm75/lWf0BusNp2j6bHxpURcKpzYp0n
         8t2neBR/npqGUwTpiExANrH2B/sYl3QD99a6uWhF+OWGquueVygy/IUnKNBc5nnyFwYR
         pobx2YlJXBD91v1OkqvR3BLjnXz2rvnLrMEIdsTWyfST0n96HId8vORAkJ0UDh1fSop4
         tAPQ==
X-Forwarded-Encrypted: i=1; AL+hErGzxiV1sTRGsLrs7XjwGOEdtxE/R2nFsbZlsx8xnyVmsCVL4vUKGE9FVaxlh/ny9g7625afSrcFAYDAHL09@lists.infradead.org
X-Gm-Message-State: APuU4Z+BbL0cRSaI3+Dm1v/EfXg/zLsY6gjWAlQC/yv1I2pbW+36eLrp
	bArjTRDJ9/+DnSrqoqaqx6BUYFbodb52z17QOjyKivsq3vImS8KcKHFr
X-Gm-Gg: AZFdTZdh2uzsuZ9OnF8OYxHeVUPaXIU4rCNfOYWiUcJMsJIfJMrL+KecYWGkfWJgKyg
	P2iOs8m/B1Jgacl9HPYeJk8qpVKXMob4BR9b6NK7MWAmcpbr7gUVTzln9P9hWS2hjNhK5OOu22i
	Aj5C1+hsN/xhtt+YvZuJhjihycqn43SbH02Urmrn65wysjVP73gSZhOAdxyBe8uvzYX/wu4OtHW
	4Rf/twSzoJWTqMrdvGUUlbqftdeW4XZ56Nba5ECOJ5k89DRzr4Oxo9EdlIlH1HkxVwo6m5qQAKw
	lgob+6N2gLnrwrvxNesYGWDS9/wyvGarOJqrxuQ+4mPWnZmUfwKq3csNWkgdq0jQWoWqX1eNLQe
	m1w8IFLHJAvWnb4VWkWhZg0KFdlTEYgrv/ia1NcBbqhmCTUjb6QTLkJEmuAoJWSvbY/s1aCiShl
	KzlEY+xD0fvdSkoCtU7Ov0IYgOaKgFZu8IHMUy68W4XlCpqh1fwTg5nAl2MfuqS4fp7wLCOq46/
	EKRw0RqrE8erTvVlHy0H1xV60RDRkfWLAaf+jX+qkHWNyy9/cVCWXZR3FcmFLjt1z+/X6u4/Ja+
	XBsLvQu1xtnjBZKK1EtOfZLwtSaQpx8HcZETw1COELkm2nk=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr490184945e9.26.1795780874947;
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
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
Subject: [PATCH v14 02/30] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Fri, 27 Nov 2026 13:00:35 +0100
Message-ID: <20261127120103.1532882-3-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040117_152599_D9F9EE3E 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.

1. Add new compatibles:
  - amlogic,g12a-crypto
  - amlogic,axg-crypto
  - amlogic,a1-crypto
  - amlogic,s4-crypto (uses a1-crypto as fallback)

Difference between this compatibles:
 * Different registers offset and the number of setup descriptors.
 * GXL doesn't support hashing like the others.
 * G12A/B and A1/S4 crypto HW don't support 192 AES key.
 * GXL, G12A/B and AXG require a reverse IV key before processing.

2. Add power-domains in schema, which is required only for A1.
This is specific vendor design: in old SoC's power domain for
crypto HW was not configurable, but in A1-series it is configurable.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index fdc39797a2a9..106a9d1fed69 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -11,8 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,gxl-crypto
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,s4-crypto
+          - const: amlogic,a1-crypto
+      - enum:
+          - amlogic,gxl-crypto
+          - amlogic,axg-crypto
+          - amlogic,g12a-crypto
+          - amlogic,a1-crypto
 
   reg:
     maxItems: 1
@@ -24,12 +32,24 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: amlogic,a1-crypto
+    then:
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
