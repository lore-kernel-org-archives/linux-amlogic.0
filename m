Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92984C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlL9tCrqRF36Zb7V9tGQkEgMdSk1ungMwrtLxT51/Ss=; b=e1w7KTMsy5leFH
	Xqa6wXhfEiv8i9voOgz3mFBU8zohcWOTlXmniAbtIX4G89AJ35bOvNgsU74yWPx76102XmlR6JZKd
	d6OsOWfK2u/YtjVZIj7uLzm4nSFdEHog8FZFK3jnzM6ENDlzhCFasVBDjbStn1CZCcGqnfA9iAV35
	/hKDt5FxKBSjd164txM3WJv44FBiIXrVKywx6CUfZEKYbk0DF0wftJzm72t6H+BoRF3KEGAceqWjw
	5is6fqdMyZVWaembU03TDmzmZY1NepS5YOjV5QXIf4FaG8Bb1SXXyN78lCOlL1FK/Eu1kWOdEIEv/
	0lD24ZN877eoznsvUItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQNM-0000000AsOK-1Sjz;
	Tue, 03 Jun 2025 12:04:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGo-0000000ArTS-3ui2
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450d15e2d25so1114435e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951849; x=1749556649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=ZsYrLQOBZAOnCFUkkHwCOD618ExaOS/5hApijfVpFmU1ks0L+Qw5ZJG/TJwgifTdEx
         Evr76x+XMY39ZZF8xj5uCZeErbXrDSOzfdQIGN0spRVQgg5nQKHop3I67CcRKWLADUqD
         gX+jiXepHERGli4sYXF/HMJeE20yk9tkXCJUJFPBvSV/aA4g5iM+ySizxJom0mQmG4iG
         oXFuzaDq68h7t0x+AeT1xVazu3Gnf/+oN+mvZJlKQ5xgzRMg0Acch7qMqL3ZiBDPwEZI
         KXb2jXxHR1wYnmHrBR0uNOdacNvz5Ku0M9Y7rE4WFnvEdrI0o7yPh9ADIAAB2EFfGEx9
         05Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951849; x=1749556649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=ifwe1pF1vca1fvXos/CjdZCb3/dDfRxgif9Mrw06K8odX0KH2s+tAFeBrOZ4ncYzOx
         4Hmd+KX20iuju5NLkJkSU1F/Ut4LsXCVc5ziobzD0yWyFYNqqrKzZrKGukE4lUmZX5KE
         5eOnGkeHeBNWRUCWB3WExSN+RG1cSkEVeLRqBO1aR/ds/haPixeh3uZZRnKzBV4uyMK8
         3OIlnjR1Lmw3tk2PgH62oraABIEl8KhuLl1Hqx7gtAnDttknNqfJRfTRIn1GCaMsxisB
         ifsIqSIHIE5hjswCfQYAnOcCCMfcxJEDrQY+lk7nGRPTj73X/1nmJq0IgN6P58bPPlta
         Vq6g==
X-Forwarded-Encrypted: i=1; AJvYcCX7xUXTCJdq06sKIls0nw+3Z02HiUz7l87KFgpwuFWVb9nUT6/zrT2DjZF1qIVj7aMxX/5CfvdzbqqaFRJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YyVJaB/Vjyc+cgwbp9bziBtkCy08XwbMF4sA/Ods6kQ/IbrdSOi
	pd91TuXwNzEfM5oc8OyME8BM2B+eC2wbyK+qLzKVJ+p6rJk44v9td/h0l3kQHWL0jcw=
X-Gm-Gg: ASbGncvall/Ic7eQ4NvH2AZM9T2PX8479sGQCSSd5A0UxeE1gvoOicaBJ4+djFQ1yTE
	znMccKaX4zCc2RkBtGml1GC0jjl/0kmtrH6rJU5MQoTMjxxoXWKO6x0S8MAEs28/PUSjgV+SvwX
	jSuTN0azL/fhyiCEM8VPLqVOQaccrQGKfw/JcTUFifWFKggtvb45J3LydX+wWM9U1mKwr+3Isj7
	CzhxBny1xiUeSKotnHGhRz5n51T+i6G/dDKZoipnMy2qaq2NG7MM+zyjXX6TY+oUSIYHJyfZDom
	mKpWrbKFHZU7f4wUJKCvSmHShIZVjUU2t+GAs2iMo59sUr8QiWpsEWt3stmYw2erU2Td+78ffh9
	p1el8MKT87axZjk/2+g2/lA==
X-Google-Smtp-Source: AGHT+IG6CmWM3RslzVJ9Zs6x2OnxvGd9okADIrUTxvkVwVY0rJS07w9DnVo5m/6fQdGbvnL2BjUAIg==
X-Received: by 2002:a05:6000:2886:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a4f897bc88mr4781768f8f.10.1748951849223;
        Tue, 03 Jun 2025 04:57:29 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:09 +0200
Subject: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing reg
 maxItems
MIME-Version: 1.0
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMb6qbPyHvmIRIrN/4NfNvZ2r6JN2VnhQ/rt
 P/6fx1bFIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGwAKCRDBN2bmhouD
 11okD/9H8uQVKm6Fba6vs1oJEhpW2E6WDVf76MJKju/FQ59Kihwd3IlRjqvGcI3JVd0sghwfs5E
 dVHRZW7lejfKzozTRGlzYKm8jWya/bma153cjRkvzpDQ4dCBvIRrkIYg1uIO2KFYZbF+V1iRT3b
 g7UmqkWQqU2Xb3Vf2CVYNjeCKU7YQMZfAM2zsm2XqrHunsByEHhmiuPvSN4lljzOe//vWePZRWG
 oO8322aArQSfeBI4C52Yg3eKV9fHdvXpB6DijXi8YYx1Wb7SNfaj4LhVu8ODa/+DU8SGRNlxNP1
 Z9PDMuPCdkOOHza9p/Gzg96ZEX6jiKXZKNLNsZ+MjGfjP+789AdQqGGgMgnuGAk8XzT9GFl8lwQ
 fiu3PECrJ9h2dK0zIrh7fps9SVMjmuxVr4ap/yatDj2cnoKj1Ecc3/++X50tuN4BcbhEcrwOBNX
 KhkMPb8L/I7QgZ5Au5q7TpxMhDVfJXNqe+Iy+pY/JEE4GthRQjtzicDApK+RT8f+pceNlH4Ic/c
 Z1yMhvvNcKbEQkmwRPFyFCJHuv4iX9VNx0nZOxzJnR5Lc+ILPanys9dW3fr6NbwJo5ZlEyyJujQ
 JAyTMfMPK7r9ETJN711C9Myj4NJ76EYYBkR/8yBzgRKUIZmx+mA4WHhJApZvSUkhlTtOCzwMCuu
 LpLpbn5wLmTgrQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045730_966411_0AD6C09F 
X-CRM114-Status: GOOD (  11.10  )
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

Lists should have fixed constraint, so add missing maxItems to the "reg"
property.  Since minItems=maxItems, the minItems is implied by dtschema
so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -36,7 +36,7 @@ properties:
       - const: scfg
 
   reg:
-    minItems: 3
+    maxItems: 3
 
   interrupt-names:
     minItems: 1

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
