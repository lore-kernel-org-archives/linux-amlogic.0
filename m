Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C2C02192
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2025 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T5lfLav9rkgNnm6s6uXUu76TViEUIR5i85gf5Hz5sw=; b=HHljwPEaM0LFrt
	aeCd9mENGFLpcvfHWeurUMNAF03vBWMbTF31UNalTacdWV6y0UsQYxJSYDJSyKN3awgb1vlscJhS/
	LxG1oto9TFRv6nT4CFDUj2BeWEIeG3j3+qv3vaIvvvKJyIxObPHPcsnLzWm+bfBnpQa8cAMRhWoF7
	HtN8g2oC6leZvZdgkrceOPPdvoRyTyXsuX3PkLyEclO9KnOmloAEscLCkYxKpRCb5uTT9xK1xdjap
	hf6Vny1cHYr2P9U3NUcRqbL+ZkgxNnidaIoxVbn2iajw+SH0PZmUdjiwv0wQjDCNT4RxrKdsYQQub
	yU4eXgAJHZn+JQKMsRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesce-0000000EyHo-27Z7;
	Mon, 03 Feb 2025 09:20:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesYt-0000000Exgr-2lSH
	for linux-amlogic@bombadil.infradead.org;
	Mon, 03 Feb 2025 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=; b=qFbJsF3EVdLWaDoiwV4uDZBmM4
	GTXisLPx+RhfdcT6jP+4yiuE16D2srqy5EMr2wrOKYm1hJR/rPjZqZXufvmBZZE3S5vMCrzG4IkBl
	2Ca3RlWb64c83y99O2N0/ku1KL0zaGgpTmhkCnpjt+nNl6kQCbIgTpV4I7RdMifxeTkw2btu81eUs
	e9/kWkxmrrgoI1LAqriNklbhWpz8mnpIeEfPGvpyx68wmU0Hu3DyIH8w6OfOeZ3vG74GtITbyW4CM
	rQ7U26M7DU9BGnSRaDh6j+B8bd3BhCLVpise3ptnc3ti6DDZzoDD28gVgtjYcUJPHKTGND06cT/4H
	Rrd2YBcQ==;
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesYp-0000000G2Hv-2nZm
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Feb 2025 09:16:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=;
	b=peRwc725+ZmRWNy7SYQ3ZOXQJPF5KwBLb6LFIQ4vY9Ok0YZ5/Vy/flKJqtq4xv9hVPn5mH
	7p1qE2k3oMjoa6+Uq9zO1P2jZdrsZbMyn5pvrJnzxAxWfqauNhFfdsMnGCHbvjVvUe+mSG
	kOT+cRg5S0y54Pi9LFf3tyybk9NmmQMgbrXXVxUimy5qAwRllOWsqqcUVuwcBVsdkRTTfb
	uJwLpdRJIrzAK7jPxcx31lU8lq3w5xD1+Obdk52V466qNx577INMpPQnrZ/5WmzFnBIyIp
	niFeT2LFqLG3Dy5rgLduEpQnLw50d1Yy0Cz/eiou8g6lTVL7jubCdhHe87B3ow==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Mon,  3 Feb 2025 09:14:52 +0000
Message-ID: <20250203091453.15751-2-funderscore@postmarketos.org>
In-Reply-To: <20250203091453.15751-1-funderscore@postmarketos.org>
References: <20250203091453.15751-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_091608_736621_6DE80DAD 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
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
