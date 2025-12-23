Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91FE6ADF9
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9jrxbKic8tUjw09gzeDhmp/xl3neaJnh8CCGz6+ltM=; b=CC0GdKqoj1nH/L
	+y0XnVNMQSvnRWiEapL/UzJWcL0gX0PteS/WY1S+luq+d2faTQXHgbSFHBPqJ7U3P34ycP/mPATFc
	Ex/ficoa5PoS6oL3sRxFIqtoQO/Q7SQiPE1rp5LYjHGZU5o7RmJCb6MAPZH7CXD6jaDO1rdOw6VBv
	Kp8cT3tCotxxrYEusTGG4nWQGaxM62PsF7s5PSg9tT0whK5RVabeUZyZGXNCzS4X8gRkQw7Im3ch0
	5ZYu/ch7HZU6NT2dbbNm72wTSbScwc8Uy4yt27tXpa34wseAHiidrgabR7yiO9zvHnGgdTdQJyxI/
	6xf44kKomTq3sHzA2C9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv59-0000000EXyU-2r3r;
	Tue, 23 Dec 2025 05:37:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv57-0000000EXwy-26gq;
	Tue, 23 Dec 2025 05:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2AA360125;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4F9C16AAE;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766468232;
	bh=WxJJFen5/BNykLZjzRHR5SEZX7I2OwnxkdPma3fvoP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OclN8YV+Kar2z9CqRrvLp4Zb4OvnxwRaztk4qtHFC8nKUnrBaMrqrvx2cWVQwgfwe
	 0qNqosInLrNSja8tY6VDEfFb7WewgVUFzGYL/X4NsqsSHCIe31htgZb7e2zehV4Xu2
	 q5fpThUgmsSqCizgP2GEd0cnPLFmahs79EbtzNEV7wS58ss1L0rlBWCacZPQGXwQWQ
	 zN/Uwz9CTyE4ojTXO/D9QeAo9aJA6pe9o5KjtZ6WSs3mGun4UqQvrkJ+GemE2jrXM5
	 Vc0mtCjqGYfjQWmY5tvRbD9IIa4j65bSb44/0OOWZ5BSEXqWOFJVvfXPSeMUiLNWDP
	 Lwq5QbNdUKnJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B07BE6B276;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 23 Dec 2025 05:37:09 +0000
Subject: [PATCH v2 1/4] dt-bindings: reset: Add compatible for Amlogic
 S6/S7/S7D
MIME-Version: 1.0
Message-Id: <20251223-reset-s6-s7-s7d-v2-1-958f341449f1@amlogic.com>
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766468230; l=960;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=OPKNBEAA93oJxEN9YQR01t2G5xxbtopLZ/gI/8FlQX8=;
 b=BuJJE4eqH6uLF6XL22fsrl5fTLznYj4N/boPR/Il2wrYfbf5cTgQ1wY1merRSggna0ijywdRF
 z4DSseEtgPrDzhx1cCRIvxOytq2yYVeiBL+Lbn2wrAEo4qVaWNcFq+Z
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add compatibles for Amlogic S6/S7/S7D reset controllers,
which fall back to 'amlogic,meson-s4-reset'.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 150e95c0d9be..ab0239cf16e5 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -25,6 +25,9 @@ properties:
           - enum:
               - amlogic,a4-reset
               - amlogic,a5-reset
+              - amlogic,s6-reset
+              - amlogic,s7-reset
+              - amlogic,s7d-reset
           - const: amlogic,meson-s4-reset
 
   reg:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
