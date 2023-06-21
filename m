Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA6AEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v51H5KsrxQ+yUxBx44seGOWWQdI3+0tkAeCD6Nxe6EY=; b=FtrQ+GS7FYgruu
	LvTqFcSzFobejxVfuXyRwq2mQ0S50xCIQeDA7242FaULlBs/3dmv5di1AxsCc22h1DYQ/h7u3Gmtb
	FDW2uRoI0qkJx1xm6CdZRdAnBC3B7Z2QfarLMlMy4MJugsw26j9nOOwsidf8f1EnT2/wM3PcKWMkT
	yVx9K4NzjDiaURpDH0Sp8Vt1xJUNyb3ulhKq7D11cM2oahdIL9YTwIhE/lYT50BqhTF7AdgTjIUv+
	LRTSrZpLTO/w4KU0Kr5V4g/GhwKj1CGRQ1vFvjaQ87qSD/imGx5vrGQOnMslajYL1d+sLObhG3EwH
	lDY7VA4mjTetKkZLC71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrYJ-00DRth-0D;
	Wed, 21 Jun 2023 06:42:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrYF-00DRsr-2x
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 06:42:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-982a0232bdcso857174666b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687329766; x=1689921766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoN7Ok0SKP6e+nvIGPL/uYRmtK4NznFFx8jgBVW/pBE=;
        b=AbD59zvH1tTgwvomAGUGfyLAWF3DAthn6QVcEsI+AByRTknJ9nIVZyjFobgZOsCVW7
         cVLERghOduu+RFbvXBlN7r9wHr1/i9+4hJ7M1SczfyrHO23otQxTmGX9D5Z98iVan28P
         EdIG2XOGZ7RxmbVwwGdYIAl4cQiJuqeNLYnltZkn3dgIOmz7vR+RxdUkoog0i4/RSxmZ
         AjywleZgvHZOj0+oUzDc0f2ssSug4MIzqPTXUzS06ZGjJlJg2G5F/D6AROqSZvxiwKnc
         m9rEaSDFV8+Z5ymev4EIeMIw8GP8QoRjqZ0nlRtx8I2Z9y7AlbDh2TleJclYlRawcNa7
         Kb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687329766; x=1689921766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoN7Ok0SKP6e+nvIGPL/uYRmtK4NznFFx8jgBVW/pBE=;
        b=FKtB7ZthTBiCFhs/OZkIaUWcHilu0L98xRwf/vH6OSTZf5zbDMoRtCvE6era47+DGq
         6tPer2Q0JBBfP+getoKvymzFNKcWIjE2HZI0pjmY9GHO2HLy/OrmIONIiOROSEKB/tJf
         xUGk5ftp8ZKY0ZLvLzqVoHxwvE8C0W8afBn9C/4SJuow0P4m6aYjjrQ+VGFUeejYLlRo
         6bCtQS0uxBL27oD4YIAklpvpSsV04KDimIMG3ipntaPKIz3Fk1wnNDiAcBZkH/bMITdG
         4GIqqRmpgX3vCrhE/oBedhE7Ow5a1Mr+gX6J+tTjCjFB/X55zPNPdKa6dWbc8EqOLS2u
         gCWw==
X-Gm-Message-State: AC+VfDxbmKa1QMjplU9vm8/lNsJiO3vDeOAtLfMSh1pLpdt5YpQrWVXK
	DJsMSNlBmXgKdSdqwr76CK3BSnbZvU+7Am0uR98=
X-Google-Smtp-Source: ACHHUZ7/YRtI6xTdzg7eKWCRpduuZtiAGjXikYaa0aAlnnfaWsyaDbSoYbh0y2HyCIQ8aMTBS9rOtw==
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id hp10-20020a1709073e0a00b008b17de3cfaamr14522289ejc.3.1687329766084;
        Tue, 20 Jun 2023 23:42:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z17-20020a1709063ad100b009821ce1ea33sm2549254ejd.7.2023.06.20.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 23:42:45 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: crypto: intel,ixp4xx: drop unneeded quotes
Date: Wed, 21 Jun 2023 08:42:42 +0200
Message-Id: <20230621064242.9038-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_234247_961664_E9059DBF 
X-CRM114-Status: GOOD (  11.32  )
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
