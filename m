Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA39C54E58
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2024 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Mal10AmtCo2gHqiiVT4C9nNsE4oKYlCfdnmGPXqHYM=; b=wEq5yyVIi0G5zj
	9AM9ii0ZI9woYVnyPLsn10Wm1eCfqyPEg1W7BcRxQIt0280npN7ITl7mw/h+GatFQ+r6HS/p57fdy
	/PgGC2p15TmdPWpKeYFO/X5EjgI1tDNKAd29SC14xN5zRCxs0O0VQPHdM1ur07CAaOu6iybNoumhH
	V04ZXhf2F2v9K8JKbCqOOU4c7HRhdXeIrmRI3qPV4YxeVF5cx4rBj4zAfm1FnTEGxSdRbWaQuC+2j
	HbhA0xiZW9N+H+W4169MfHbZurnQELCabKUmh2MnXlUCz3aK5vwL+upHSB1dbWo2BvJyg/c+To3s4
	MlpKqN3DpsWyjRQLOnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUs-0000000GXzO-3FzG;
	Wed, 20 Mar 2024 09:44:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUo-0000000GXwQ-043b;
	Wed, 20 Mar 2024 09:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71AF561006;
	Wed, 20 Mar 2024 09:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A62AFC433B2;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710927868;
	bh=QO0LZCtSW8apYYXm/bnhc9+79zlXJs+onlGEOcYTAEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YgxinzTyd6ZofH2Y0OdXgs27eeV26pdVZCt+CwZon4Z+lvTQRL5MLAJDPS9xPsh4d
	 XVQQbDg5cEhP+LLtsNxo5AjnkU1hkjB7eOuz2KbICB4Uhsi3dn2qVoMzSkkTNAMxKp
	 h3KrX2Dv0rfZTxSrH79W+2aHscqYtPJlTzTVp8Dotn8jC10sDAF55CNH3gJtgxQjf6
	 L9lfxDnseIfmnM9S69UFdjhbRbZM2vOkYWqhoJSkXngvrP26ab61bc8YJZNWUn79AB
	 d52hASYr55Ow9QH3cWWWhf1+406m3IULw3xiFwSF9PmUCsCtqCu94XF+M4VFknwTRA
	 Q2IHOPahi811w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1C3C54E58;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 20 Mar 2024 17:44:15 +0800
Subject: [PATCH v2 3/5] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A4
MIME-Version: 1.0
Message-Id: <20240320-basic_dt-v2-3-681ecfb23baf@amlogic.com>
References: <20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com>
In-Reply-To: <20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-serial@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710927866; l=1045;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=UJBOI4szfDVcoXnl7lw01lakzjuj2KmlihYXzmVHsfw=;
 b=8pu+V1R6pp5VQ+slxCMO6g68EDljBjihstf8hEg2+4Whq2atJPLqkR9bOPCaPMXyQFShC+vkD
 gtm1ft8HeXyA9/EvkLIi+Rxh5hsRPh2jF9/IO0jA4BLReHJtoAbIhRh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_024430_844644_C7B1EB6A 
X-CRM114-Status: UNSURE (   9.62  )
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

Amlogic A4 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add A4 compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 2e189e548327..d05c45815dc2 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -54,7 +54,9 @@ properties:
           - const: amlogic,meson-gx-uart
       - description: UART controller on S4 compatible SoCs
         items:
-          - const: amlogic,t7-uart
+          - enum:
+              - amlogic,t7-uart
+              - amlogic,a4-uart
           - const: amlogic,meson-s4-uart
 
   reg:

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
