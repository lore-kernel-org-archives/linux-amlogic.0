Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8471FC6169
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2024 05:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+HRCkCBE0gwQWMdV/432m7e3aIupazI/KT7015Qxho=; b=yPeZtKHlH0aZyN
	cLhjX2SQ3cq/B7cgENlpsLxyigsw+Y95w7GJ2fZyv+MJe43WmUllgb1jbm+2BufnLy3Tx7JJY9izh
	PomTmOGfu5K8s8sd/zAFttd/fSeMOrjJOEsbKhMBhjyfCzNE3Of5ln4aW4NNJKWi8z8Fgr4AYwMeB
	s6/qTqusz5Bq7FbS4/OT/ju1091D6AFWZdEDsk+MB3RDIQ3ykerrH34HKobchTiyY6JWbGXLq5elu
	8G/+X53xrKipzdMaHhl9cvDQNFd5HDHeuKRTysp4b+b4M180wNrEgdhnlnSdbfr3F2pbl8KpQKHJJ
	lbED+JQc2ZXdswk4hbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spLlS-00000000AEx-1lKV;
	Sat, 14 Sep 2024 05:56:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spLfv-000000009Wh-1KcS;
	Sat, 14 Sep 2024 05:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 627B35C5910;
	Sat, 14 Sep 2024 05:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D7DCC4CEC6;
	Sat, 14 Sep 2024 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726293025;
	bh=x84VoDhpUp6vwVHhsjYCPB3VVl/fdTE7vFAsQK0EwTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=irJHXsMdb/0SBC4n8kvDUpxCe8gpdkCzrnKbZCOfBdXwT0F7F9OFqIVul0QOxGh3V
	 R+sZijhp2HKu04y8jKNg6iLqz6uWllkymUrwgFzaF4uw2qxF3u5jcvaac/gr9iimP5
	 MxitkrDKOHusdWTWVi8gRNwmmLKI03OmZ1fo2lBTC58Qm5dTg/v+UrAFMzY0ahn75D
	 DsNn37BZbBiwVJhwHSn8pYO8Uz/AlQc4co/akcC0CVI1/6NLs7mXP1nWVM0qBIYq/g
	 q3eLJ8Gcx/KbVBQKDstZ2eDuWmRJfR2wQa7BnIN+WCM2wuACtPpvwefBUksxBk5/p6
	 48us6ysH0bfYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD61FC6197;
	Sat, 14 Sep 2024 05:50:25 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Sat, 14 Sep 2024 13:48:58 +0800
Subject: [PATCH v2 1/2] dt-bindings: pwm: amlogic: Document C3 PWM
MIME-Version: 1.0
Message-Id: <20240914-c3-pwm-v2-1-ac1f34c68ac2@amlogic.com>
References: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
In-Reply-To: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726293023; l=850;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=jkkwhfD2HY3XpEmv2fppIWZ7XRYKVWP9wFrzIH5jMmg=;
 b=upG6pfE3Oi/FBjPRU+nkf+zdeEhsAdpdeHrLcqCTpPSv3WhaQKJWpzfP3mOP+jyOCt3o8qCmx
 dTJOXhQwUHNCVliqzt/TpaRX7jy9c+xh7Pn3xQKZ04ZLz3US6JflIHn
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_225027_468916_C8BEF458 
X-CRM114-Status: UNSURE (   7.13  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index e021cf59421a..cc3ebd4deeb6 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -39,6 +39,7 @@ properties:
           - amlogic,meson-s4-pwm
       - items:
           - enum:
+              - amlogic,c3-pwm
               - amlogic,meson-a1-pwm
           - const: amlogic,meson-s4-pwm
       - items:

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
