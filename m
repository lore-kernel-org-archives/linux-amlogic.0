Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D10C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVdQnbPrj4e9fR5wirHjt7cxErlWmwAhCs/Gp7UZTmQ=; b=kjpzvYOkSEEepW
	QaMQs7dY15AEVpYLfLBmCZCmuvd+860uRw1oE4+9vWEMPzQlLRZPpNMzZDKBA80dQhfBa2Wm9kUxn
	1ewZn7KcTAqcxXeQ6rvluOgIBviqJxJyi3ZUrRv+9fdiGYl4MOyucnx4+9b8itTl+Es+EuAS9Ek09
	FCRUcs/wVU1bliRuz0FaFLwhtlTcK61nsb4zpvJPCEOUiaEukK4q4S0ZrlRSlpUvM823XmOv5I2Yf
	NDhKo6+1PRMzvGjZbGYDSp78F59l8rKXDUZo/nMGsU1J1xTc4TWPHCcU0rz0XxYg6/aLkDt+ivb8Y
	N1MkhKfSnmH8NFLFxsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuylv-00000009uhe-3WYK;
	Wed, 19 Mar 2025 19:08:11 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyh1-00000009u1y-3Gbr
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Mar 2025 19:03:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742410974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOquvHq7vUiDA9+btgFRSbLwtUiOZgg8rxZoyn8ZjIs=;
	b=AP8bLxhBgvV1qmOPOpfrUpzeHR7mfTT5HGIeikyXN1xs0k3+evd8tTTEkPIm6KXZeezU4c
	Ybx9U4iFUH1I5w8G5Ii2RimRY5KeP2T0kB0IOvAZ/ORCF8E9RWNDBxi+xAqGEy/Bxfa6Lp
	PpX+glmiI9P3ZkEXxrhazcw8mQqDZZKHJfHdxN0QifdmkpCeczId1zFzOTjeknu2ND0YQh
	Ra+arKkSKUo/YkqjK+nq2YJRZ4J0nSNaGxXOG+cMxksiSoDujlPX8LHdyKEvkJYtNQSnCo
	VSRJ1uRIXxkrQY5wl7d7CYD2lJr/waGSJQ4iU2biOP9AtnixNgJrWy151JlYEg==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Wed, 19 Mar 2025 19:01:49 +0000
Message-ID: <20250319190150.31529-3-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-2-funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_120307_945399_A8E7E5DA 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..3403362e0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
