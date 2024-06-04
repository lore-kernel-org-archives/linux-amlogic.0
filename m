Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F8FC25B7E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wLDKO66KDtarI3EZB02va6NzJTdnFN93OqjwY99V2yQ=; b=WePu9BEXn6QP87
	lEbdfRdskoUoBA/v9BA1WirBoa7bYKBabM6MZRbDmfxnZTk/hrjrxsIc9XA2zaEtHXVRDzOYkIpci
	hVPWleI0t9ryRe5Tj4i0GUR/it1mojLhv27S18yVqSdnA9fQnKXq6vFNIJ0FYqoj3zh4NnsUV7Yah
	IErGXIVfX1vt0XX0YWTajPRfm2wV6oF+7UM4p4pFAIwSZheJwu/1ahT1UaJcVyClAqpuHTYD3H7QE
	MO4E4sCR73yEKmzXDv6KXy9D8q4qe4zjOh3KZPp0qqVolTokZHMlqZanOoCtaZLTQCzjTK3ogOqDj
	aghh3a+Qj5exuS6esY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPjl-00000001hTc-1Cuq;
	Tue, 04 Jun 2024 08:41:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPjh-00000001hSq-22qq;
	Tue, 04 Jun 2024 08:41:43 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a66e9eac48fso80307866b.2;
        Tue, 04 Jun 2024 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717490499; x=1718095299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIbgxo8w7f6oWPnCFgBUedyRxj+AKespS1CLChhNsro=;
        b=UyajBbHwZ4Rmiw+RQna6N4Q13dH42o8Q8sQC+fokWEWRUMwu0cKMHOm4odlZg5tV2X
         GZ00FU2aFy0ra7wSfiSrVdCdeqqwcIyAz/KwKdd1t437lVOWGdl0dm57DKxAOw4wWKLP
         MutYvEb/EOsHQ8u48wMvsUuufn049Qk7+JZ8bxypYBl6zYwlRn1/Dsr01f7dzZFg+7JS
         m+vVdSt6MaRbA8UqsIL/SJozxf4+Ji4t1blNTfh0bji1ZtGggMsT6wAgCV6jIdKNny2M
         Ht50dmnBytm3oKT5HfvWH9NOFuA1JKugNVeBxiFkpVlqA/mmC1Uw19o/6cgqc5PoTH6b
         ZBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717490499; x=1718095299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIbgxo8w7f6oWPnCFgBUedyRxj+AKespS1CLChhNsro=;
        b=jxM2jIIDNp+e9kGmBBnHjrKHBgbpXSQmhkEhNhUFEIenfs1C5ONnomiG1ghQ1XkbpT
         VnkWTIJGlEOJSrGVLxlIXHoLh4r7jKu3TMg4PYZ5+9/RtUaXL258Cid/cockKNIT4wZ8
         iV3O6SSL63oabGU1Myox2dGk+PZvZLOMlFh2Nng65Ao3z0BcFY7fKthqK9oXLMFYrTM2
         H0m5cJix+oXxDyrUgoDVNsDR1cA6zf/2OnDACK1Ad35bX+hpw9UlItFJ3s+3XS6ttCfe
         VPdKMTZNFjQLXlMNH+LIh2REPQovj29fDnba4qaAzqMNU4OdzSJoMlgI/2/TGV+L9zhF
         v6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBaVFWogSm2mtaBQORsmi1G0XqIWFFQI75LCanjoSR3p4zmMqXqCIKQD+f7uMXvsrIG2178bhQ4tTsCQxWFThQ1sh0D/6l4gYKMwFWLERsh0ovRLqTKBoJBL9/nSjSlsPaOGfAChqno/KaBp9T/ziadfI5CdxHeg==
X-Gm-Message-State: AOJu0YwkYLinN4nP7WKibHY8/h6sNXdcBGpu8iF6HtS5pL6+mP3LO22R
	Y3PhwBMHl1RjK8VydZvKAGm+mHkULw+VfwdzCCEBraxw4owbpC1E
X-Google-Smtp-Source: AGHT+IFc7LrIp3GF7dBgax5xTVe8AqOREA7ZsZQYpQQk2NNJRopNP3qtprZKTr/gzCcH/0pJj712GA==
X-Received: by 2002:a17:907:26ca:b0:a65:7643:3849 with SMTP id a640c23a62f3a-a68224493ffmr936923866b.73.1717490498724;
        Tue, 04 Jun 2024 01:41:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a692ad28816sm166550966b.31.2024.06.04.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:41:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add GXLX/S905L/p271 reference board
Date: Tue,  4 Jun 2024 08:41:33 +0000
Message-Id: <20240604084134.3315841-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_014141_650400_77BF6C94 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Add support for an Amlogic GXLX based S905L SoC and P271 reference
design board. The S905L is a low-cost design similar to the P281
(S905W) and is similarly derived from P212 (S905X). However S905L
omits support for the VP9 codec and uses Mali 450-MP2 (not MP3).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a374b98080fe..77f8dfa86e6a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -107,6 +107,13 @@ properties:
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXLX S905L SoC
+        items:
+          - enum:
+              - amlogic,p271
+          - const: amlogic,s905l
+          - const: amlogic,meson-gxlx
+
       - description: Boards with the Amlogic Meson GXM S912 SoC
         items:
           - enum:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
