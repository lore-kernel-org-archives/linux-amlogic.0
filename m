Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAADC61DA2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyUDa2MgPTpQNOPpjf2LJt/h2Tip/IjLoHXWSQRGBN8=; b=xaH/8Hlb2IwUr4
	jG1spu07n4C34UmaOlpYHl7wI1VvuS3kyTFmFJg3650piUtef6IwjRb4VJHjE5qLE6ui/OE6GdPN3
	+4jGMS0KEahq9JZJibkH0t4oFx2avy0r2f1FRMC8JY2xqy253Y/kr/4I/avhWqf986US9ZeH8vt+V
	/LORS7ppZNAbsDhTLCMZTMN+6bIgOL7GZXT8wwmvBdLG9jSLEEebNI/YGo49vlsSlhAPg92ywGAHN
	a6spFEWEjKllYOdD1xxjJmk6tLQEr29f4M1alGYsaye88Zak290aUSNQpBsY0q+HpaGd6Vn1kmq7K
	j/utNWkt/IjxCjHorZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKazZ-006MvU-9M; Wed, 25 Jan 2023 08:18:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKazV-006MsW-0f
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 08:18:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id y1so11706462wru.2
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6VVFU09DGdJDicHdzWRUuahuR5if5nGv94bTkwuVxM=;
        b=P0VzQ57fyl0c8tLyOhp4Tras38f23cWMvWTATg+oiau6eTMWWEPGCA+Ip6qziFE/Ue
         dRa4xa80kyYbNHsk2Gzi9wNYU32cuxSRitUlLE47/ESbRtFmShSKXMi5PFMsfUh/7ZXB
         usprM3J9Aej8UCtAO0eMN60Rc+P9ON3mPgXmNtmWKmOsLDiYvbGfGqePmZgw8ypqe9rZ
         m7rQ1OxXNjBG1bLmw76elyl3LMb759AtoWlvwZ6THjSljdYHAPegqIRCOcrX3NpsRwvh
         GiBB8nv1iRCk37Matw+sKX2p2nepxNixvQ+1ussSC0/XZkuMcw3R2KJAUqI2bQmFStF+
         eonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6VVFU09DGdJDicHdzWRUuahuR5if5nGv94bTkwuVxM=;
        b=eLmxvZVxn5oezKJmFRzZrwA5iReniuDyjlBv/8av5e4BKchvLiq5LIscdC+0nlPFpw
         7RCuicuDpvshXrZBvyu/WZqjJNmRk+4Iq06QMqHTNUURhNEik09cEgiehmqI+bduF6/h
         LWRYY0xmnkn4pUzVVEM6Y84g9jjkT09qIcUQr9WWlY3qMzo8nxHVfYlC5BXRZD3KmpIT
         oNhvI/ZgKxTauTEk5zk0Q+lhrDXyDaND4ey3k4g944gr1JcI6j7N62CFKoVuBgkMZX1I
         axitnTIJw2A7QglO7jrj89ZEijcD4AMMTxd8zXrBaUWSkK1LoINBx+ve7AoGuPLHhKM8
         fbmg==
X-Gm-Message-State: AFqh2kpcuXLOF9LYI50jDl06Rxi447vBuBgO85/vTeAiC1Kp9RwfCcXq
	AOawTYbuHreSvwgqRUAwU2a/OQ==
X-Google-Smtp-Source: AMrXdXuoe0lryGNmnQF8GyRl/+DOCT9Q6ttaCZBC8O3SpAo41mjOEQ2F0Bxc4YCb4VIuL6PdhXo1NQ==
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id n8-20020a056000170800b002bddaf19e4cmr29965267wrc.43.1674634723477;
        Wed, 25 Jan 2023 00:18:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p7-20020adff207000000b002bdff778d87sm3770343wro.34.2023.01.25.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:18:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Jan 2023 09:18:37 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: amlogic: document Odroid-N2L
MIME-Version: 1.0
Message-Id: <20230122-topic-odroid-n2l-upstream-initial-v2-1-8d3fea6d403d@linaro.org>
References: <20230122-topic-odroid-n2l-upstream-initial-v2-0-8d3fea6d403d@linaro.org>
In-Reply-To: <20230122-topic-odroid-n2l-upstream-initial-v2-0-8d3fea6d403d@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Dongjin Kim <tobetter@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001845_090983_70404228 
X-CRM114-Status: GOOD (  10.30  )
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

ODROID-N2L is a variant SBC in small form factor and some peripherals
are removed from ODROID-N2PLUS based on S922X SoC.

- On-board ethernet is removed
- On-board RTC is removed
- USB 3.0 hub is removed, so one USB 2.0 and one USB 3.0 host ports
are available
- Huge heatsink is replaced with 40x40mm heatsink, 5V active heatsink
is recommended or a tall passive sink is optional
- 3.5mm earjack is removed
- IR remote receiver is removed
- MIPI DSI port is added

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index e16b5fa55847..8aa6b6a92c29 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -165,6 +165,7 @@ properties:
               - azw,gtking-pro
               - hardkernel,odroid-go-ultra
               - hardkernel,odroid-n2
+              - hardkernel,odroid-n2l
               - hardkernel,odroid-n2-plus
               - khadas,vim3
               - ugoos,am6

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
