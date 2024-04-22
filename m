Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5561C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfnnaGriEfzzS3whBMSIFaUmXBAn9O7S78SLleqTnEg=; b=3rTxdoBWbWWLno
	M+bLHKX1/bWx8tJI6c530hsW6VnE65AKEv7RLXmhVzUFcXU3kiyrBhjiN429zEsWAFmk185TPRk1n
	JDTNxCTpDj/ML44QJq5rL+y0AKPg3nkzaAi7IBiurCdfz16uhjBwKBGLTSJ0lXJ/3ZARIRYyPJQeo
	Mr/bHEo0lr32S0wWjN7azUCT/7J4r+KVwoptM8RQqbN+ku9a7u13KRxy45WSnNwwal/Fgqf3/IzEn
	pOGpxf1JKjTFrhOja/KOgp5hXa909i8GaobGgmzO33bTayyGJSvfTD5cZV6lbNSmNXgWxkqn/aqEB
	jf0eSAlmImDS6JDX4pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrat-0000000DIob-3sHK;
	Mon, 22 Apr 2024 11:12:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrar-0000000DIlL-0EzL;
	Mon, 22 Apr 2024 11:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A047360E83;
	Mon, 22 Apr 2024 11:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42AB0C3277B;
	Mon, 22 Apr 2024 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713784333;
	bh=2hP9Wr46k20/hqo2zftH4vkjOu/C8jNY4dsEV4q3rdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B2MD1ZN7k0Oz211U8eFTKiRwf57BNBBI37UTzWlHjISgw9fEV59mTxyXK59bRlZ8A
	 CZsRA4yDQy/Hi3tcGLPQaIUGEV4woXTlH5nLPGLPLjYCcNIBi9ujNc2yMU1+tRlXWj
	 J9cS6qlebiOMweLIX8cvV7OoFUn5nLEH4JXB1CVX1dFeoDeR0F1FwrZFjbXVA38ZXk
	 UdarBgM8A7+F0oVYhpiJkAEm5NjIHpvyL2l8XowRQdiCiKToP8mjnsQs5ah/EJIKXa
	 LWmG+Bx4E1lOaCieVKYLJ7Ig0D/Qhhgstpk7p9IsTTYviOfL6sBObZOHcgW9ONZpSS
	 8ZMmZqPROHmoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F05C07C79;
	Mon, 22 Apr 2024 11:12:13 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Mon, 22 Apr 2024 19:11:43 +0800
Subject: [PATCH v2 1/3] dt-bindings: reset: Add Amlogic T7 reset controller
MIME-Version: 1.0
Message-Id: <20240422-t7-reset-v2-1-cb82271d3296@amlogic.com>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
In-Reply-To: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713784331; l=942;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=CyHJlDrpjIAL79VP7HKiQbjHBUBNChERmthFTOisS7k=;
 b=No+L3Aq5VEv4hqOixwhyza7FgSRJ0OGNj0kF4mf0d14MAeHGUGA8GyfSxN0wnQE4etPev/vEx
 DugVtyb6BUtBHREtlEd+d4JICkCSHNL7yqFZ3tdyyzszIH+hd0f7qXG
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_041217_316623_60022250 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add a new compatible for Amlogic T7 reset controller.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index f0c6c0df0ce3..695ef38a7bb3 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -19,6 +19,7 @@ properties:
       - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
       - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
       - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+      - amlogic,t7-reset
 
   reg:
     maxItems: 1

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
