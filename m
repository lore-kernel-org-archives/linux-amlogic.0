Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF745C3600C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Apr 2025 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHBszmExw8JeKBjwzvtSIWo/XP5NbL29w5Lhzcit3bQ=; b=hAe6yA9BVSzXSX
	SV9Ucjj/pLadAc81qiYDntoR6bU17+L4wY9Q2+xrPafeNraPwXzNWknP+R9OJOpqSj5C0VB1rQmLA
	zjhy5NvCoRj5CG3x+KLCzzSZ9YpN0QJQRtHLiBRCQ5Mg5ip4hrFB45Xoltm8W1pO2pHi9y6+AeQGB
	nfUt7sWJ9+AiSxfjHbIpFHdbOEWjaerLYOXWNBBbOmkHuRyld9zw7DXRzEt/VGIPUsN/8EhgBAbMu
	3VoRgowEPYludo6Rj+Y1eKqZ3prbLSDCyLyNwfjwNORQZpPFh7B6AR/ToIwla+gNEzBGJUbL0YYhI
	Hot8/w8UpNmY05gcW4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0G2b-00000008HVD-1hq8;
	Thu, 03 Apr 2025 08:35:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0G0n-00000008H62-2NVX;
	Thu, 03 Apr 2025 08:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48F16A46661;
	Thu,  3 Apr 2025 08:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C6AC4CEE8;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669199;
	bh=8/FN1zqyHe1w6YEiI4W7vdYpA+b+1N7dG+zmuQASP1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kqP437Gelc3cAzRDInSrIIfnOLSrjIMy3cL0ZCF3i3he9Tmtt0iNxvMsVCqmWYzWe
	 TDS1GtGByFfCgsXD8TYaV4850qhxXCtkC354RTYYsmRc8HaiyIhcpIv6xEnell6gKn
	 csOLJwDLu+h5NZIL1uskUvQx0Akrv/ZFKmShmbpN7vVWcmGinZvBdMx0sAhxNoYJmD
	 a1woOzMEAZwZCtxr2uzyaeIuLCB+jtOPvCQ2m1cv/EbiG5SDOgtRx6NX0x0PuiFBcc
	 2gXkXXDF5DwIdY0VEgUMmEq6DNP5P2iUWFXH0QS05h84pmF7GeoRQR8VYFkwHfqBEp
	 t+4EMwIHM1zSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0432C3601E;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Apr 2025 16:33:14 +0800
Subject: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
MIME-Version: 1.0
Message-Id: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743669198; l=1062;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BWo0VhjwdkuWVuu93AEWJoUlmI8svtytfB8s9yS/fWs=;
 b=Y8iZKQNrlQXT7t3bfaAv792FEp3deYm8sjOkAjlKZFKSWkoCOfS/em4OtxlGve4hrA4NkVjzK
 qk8ECFovX8dBtiWuBI1RUFKU5gekhm+5gaSJcJ2vLkNXo30awxePjF8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_013321_721665_AD8052D5 
X-CRM114-Status: UNSURE (   9.08  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
no need for an extra compatible line in the driver, but add A5
compatible line for documentation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..c36b6fe377ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
+    oneOf:
+      - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
 
   "#address-cells":
     const: 2

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
