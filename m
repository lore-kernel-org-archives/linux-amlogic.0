Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30076CE7B03
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHnpzjhI/S16+8oPWIlDgDja/G4BJ9K5UL/AOmOx+3E=; b=fBXhQgSnzjK1bZ
	XaDppalSvLziQehnZi9p4EhSntmDQ5wS2NVaxGXdUmZx38XljW5KDuml+pvzNvCrGBVkAHPRJzvCG
	cTIOhMZ0vE4jDxCfnrsjv+nOVquOzUO673BEWcORJ/dZ+zC3/PZQu0lHxTXdWWrSCFmkMwAD8+H5P
	7vNFsnQ81g87pgiLy2RtR+uFI7FO8CTzRkdpbBg71ZUx3H4zbinCaRfsLKMOSmDiGuqRtkFsJbeVG
	X++R3Q03TD6gNjJiW3R3V6Fb6zRNM+mz5RdbzytWEG7JYQ6dUhUaM71piBUQcZ2lS4m9PHaIvOV7O
	FZ6A3Q49JuSCCuWEpAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYNI-0000000CDbK-2WFf;
	Fri, 06 Sep 2024 12:47:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYM9-0000000CD5n-1Ng4;
	Fri, 06 Sep 2024 12:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD2A1A44F7F;
	Fri,  6 Sep 2024 12:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4206C4CEC8;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725626787;
	bh=BnPFHWuU9ITav6gZzvi15hJTlIdPoiLYGWVSlobaA9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VLNo9AEJgunAHOrC4eMHBfi8ictN6e8ftTcynwLnpRn78fZ2TA99CnhQcQVMbkJCn
	 bB6cMSF8Xsod/gc2BbMKD5uSe1Yi8+2X/elkBnROE607KG5ubyq/Jzc46+FepVK/oU
	 fQyMPxp1uanwUX+pz9T3NSE6FizrCqybg38+wJcM9Sfr2uLoCctek41le+1QakYCsp
	 gD4QEtewI+cNgCvPxHl8Qx7GocYy51sM+caPqJs6/rA1P0CBafY8Fz3E/9xu55aEml
	 BM1yht0nKd0MEaf8VT7B9Vin4kMV0Ddi5KABaV1T2bZBr7nLbWvl9E+5vFKDDSPtO5
	 /zxUKX4LyCdXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43E1CE7B09;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 20:46:12 +0800
Subject: [PATCH 1/2] dt-bindings: pwm: amlogic: Document C3 PWM
MIME-Version: 1.0
Message-Id: <20240906-c3-pwm-v1-1-acaf17fad247@amlogic.com>
References: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
In-Reply-To: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725626786; l=856;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=IKxQCbqCymKpXimBeJjfJfj63RpeX53D3eg20nkQmNk=;
 b=zqPcIqkIxj3orOtAbzHPmrmAGEPra58zMaXLyWATX9mRAm6IjFmYHGUNAd25JsmKjUHvjgUiI
 viXPz7Wg/OPCNrukKifurjyz913UP/iVe3RzlrQOXnIGlSYLC/SNEqZ
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_054629_573871_95F4D704 
X-CRM114-Status: UNSURE (   7.62  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kelvin Zhang <kelvin.zhang@amlogic.com>

Document amlogic,c3-pwm compatible, which falls back to the meson-s4-pwm
group.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 1d71d4f8f328..356371164acd 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -44,6 +44,10 @@ properties:
               - amlogic,meson-axg-pwm-v2
               - amlogic,meson-g12-pwm-v2
           - const: amlogic,meson8-pwm-v2
+      - items:
+          - enum:
+              - amlogic,c3-pwm
+          - const: amlogic,meson-s4-pwm
 
   reg:
     maxItems: 1

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
