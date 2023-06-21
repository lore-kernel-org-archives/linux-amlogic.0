Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED89EB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vfbLhosnY+STJjYARenNDTxkDBnvHjwilpS7YQPUieM=; b=rUXuU0uDqof/ej
	q/YDTQ4BsiCrnFkfkj27KR8Etqx2zhJrjZpae3KOCyl/eJeRiQ79g9djBK2Q/aMiQc/eQ6aczuJNC
	Y550LNLH26IPFa307YvQYLTFmwj4atWfMpagyW5MrKHcHrlpoNshcraQRvWhA4su7zd0GvYfNSxCA
	APFLKzdpPuuVeH2tuX10FKC6LbYAD3tsyKajzySiMoeZwIlCGoMuukt4tQr52ash3HUvj/5jt3wJD
	PMBKMmZ2o8Z6XlnZnx0/ys5qBGP7QivQZvqZXZtjLL3qMTHflJyXOCbhQb8ybVyZmn6T479GNWDHW
	uir6ITyNqb0rnKGm8Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrZf-00DSMS-1t;
	Wed, 21 Jun 2023 06:44:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrZb-00DSIO-2W
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 06:44:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso7559425a12.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 23:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687329847; x=1689921847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLhuYBOrCGZ9ZaT1QeXqsJlpupUNcxV0EG+wQuDPKQw=;
        b=sHahl3Ns/0u4RvUhMZoO82Sf8PQLmLQRcnsEw+UnGJ2UXm9Itr81iLndou4in0y4yL
         B7Fnl6luepVR3ZkaljBUUHpTlBoIgMYAm2ZXukNuS4UsT2/ZzIEN5YbqgzqnEIw7rQdB
         KVSbIbiVS6sje9wsJwa7clEYk6aRNb9AImCrMgbSh7o9+ARkCft1Q6GIL7wIkDSAd+3t
         MKJRlyKYkAKh9cizvZxFXRgwf7enoYMkWUxwE2mqVsiP6jWbTKmtlhiP6BkHDkR1FUBJ
         cpLfI1EKC+A1fys2icQILjAMTha+qpo2tzcEuuv/LYSOYXjtjY5QCRjBHJH9a+FSR/1S
         yuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687329847; x=1689921847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLhuYBOrCGZ9ZaT1QeXqsJlpupUNcxV0EG+wQuDPKQw=;
        b=lkA2mqbbJEOMZl/FoPfilHb2cZXDKTLSP1WLeSdjy5O5HEPrs7O+SG3eXZsYcxnN3N
         FqFOVhRlO5a5LRafarXwngPrcPyykukNnUdjviJ448JtAljBUkCSdJJKrzXFxZerLKeA
         JOhDif+95tOk+VbIo/6h5qAqYRQNynQvc2VDiQfv7EPFR8JqWuraN0Z86bhB3YDvh0WB
         8lBrasTUdq9HANrfYTgW/1R1f3jCDg6FS9DzenJ/fKeWeKaCFIgB0hcaSe9QxY3tRLVq
         rtVP1pGlkbbkz/UWr+1i792sE+L7XqwFeU9dvLjwtpXbZPy9PQJd2wj92vZhYI+GGNM8
         xy7Q==
X-Gm-Message-State: AC+VfDwptVjvkoN2W9KJfeP6O1IlBY9IcK2PxF2jvPeVpqkkpqs0VJXN
	PJ0ZBt19eTp5GsdmsxlYP5Z5UA==
X-Google-Smtp-Source: ACHHUZ5HMbDgNgoWNS0rYY+M0Ya51PmC/vKM8zoehNU+Uj/SEm8quQRkfO01i2Q/6Mlmvdclu4xmcA==
X-Received: by 2002:a05:6402:517:b0:51a:53e0:843e with SMTP id m23-20020a056402051700b0051a53e0843emr6666844edv.23.1687329847026;
        Tue, 20 Jun 2023 23:44:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l9-20020aa7c309000000b005187a57fba1sm2109428edq.77.2023.06.20.23.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 23:44:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: crypto: drop unneeded quotes
Date: Wed, 21 Jun 2023 08:44:03 +0200
Message-Id: <20230621064403.9221-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_234411_822176_E773A970 
X-CRM114-Status: GOOD (  11.20  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---

Changes in v3:
1. Adjust subject perfix (drop ixp4xx)

Changes in v2:
1. Drop more quotes (also amlogic)
2. Add Linus' tag
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml      | 4 ++--
 .../devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index ecf98a9e72b2..948e11ebe4ee 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -19,8 +19,8 @@ properties:
 
   interrupts:
     items:
-      - description: "Interrupt for flow 0"
-      - description: "Interrupt for flow 1"
+      - description: Interrupt for flow 0
+      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml b/Documentation/devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml
index e0fe63957888..a4006237aa89 100644
--- a/Documentation/devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml
@@ -2,8 +2,8 @@
 # Copyright 2018 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/crypto/intel,ixp4xx-crypto.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/crypto/intel,ixp4xx-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel IXP4xx cryptographic engine
 
@@ -21,7 +21,7 @@ properties:
     const: intel,ixp4xx-crypto
 
   intel,npe-handle:
-    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: phandle to the NPE this crypto engine
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
