Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1634ECE577
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/VZsi6oGbzRs37IjlOJRAT54PMuvUD4nFQX4trcD0U=; b=hTCtJVjvHI9Hln
	fxrTLzxFQJ2eRSMx5Qwbs8LtAQLO67U8VccJGo1GyyLqOiREG9v35BMM5FcC5GG4z3774GCW1l3tG
	axhFatjW44mw4n7y36YVZw6CyMIshWnq4t+ub4cCyVKBvk4OfgL9TMxoac8FOgso8q62GGIFTN6hI
	cIBxA4tux4oCQw3atc183QysFrl2wcXPDfR4VjcHCqleGAPP4Lqc8l4qkd6GchUvcwbMWgaVwSdaB
	4yVdSgnbWWAQEI8L+T+leberXO7gjtWkuvvQsDobArwTPMXQ+GAKk/bJ8eARAllHd6U9dsIYtzRi4
	sgCnLSpx7ThahV41wSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni7a-00000002oFG-2z41;
	Mon, 09 Sep 2024 17:24:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni7W-00000002oEC-45sL;
	Mon, 09 Sep 2024 17:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B44945C0317;
	Mon,  9 Sep 2024 17:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67EEC4CEC5;
	Mon,  9 Sep 2024 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725902649;
	bh=RA3HARXHwHsFdKkowqZX2MlM4vFFTmpEgk6U7rVwfvA=;
	h=From:To:Cc:Subject:Date:From;
	b=B2+G+/XHBZUQnA4GoEUqhzdJtSoIn9iFniWw6bSrO83ULbPR+6DGn13YuxJuiV26k
	 Xdz/85WtITZgwac+hBhrs23UBqrDkkUarfdaXFQhw6hDzIpmHYvr9934Lv2+YnWjWo
	 KzxRYd10k8JhZ9xSj5wc/rSLmUCfR8iO7KOc/lcWrm5cjBH7Qk2F021/9nv1iwP3zU
	 nSPC6ZwHElhYQMjeOcmyiklcMps7lz6hSA6vAgUReZbU2VdTviETXFeDs4s2Ar04Ns
	 aTRKHe2gYG1pB4G6jsyfh5tLHNHs0OxhyZnzHrVtCSD8tdnHzcF/5Q3F5U9jRk9ogq
	 9T2GVybY02J6g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: amlogic,meson-dwmac: Fix "amlogic,tx-delay-ns" schema
Date: Mon,  9 Sep 2024 12:23:42 -0500
Message-ID: <20240909172342.487675-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_102411_142199_0CE5703D 
X-CRM114-Status: GOOD (  14.42  )
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

The "amlogic,tx-delay-ns" property schema has unnecessary type reference
as it's a standard unit suffix, and the constraints are in freeform
text rather than schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index ee7a65b528cd..d1e2bca3c503 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -58,18 +58,18 @@ allOf:
             - const: timing-adjustment
 
         amlogic,tx-delay-ns:
-          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 2, 4, 6]
+          default: 2
           description:
-            The internal RGMII TX clock delay (provided by this driver) in
-            nanoseconds. Allowed values are 0ns, 2ns, 4ns, 6ns.
-            When phy-mode is set to "rgmii" then the TX delay should be
-            explicitly configured. When not configured a fallback of 2ns is
-            used. When the phy-mode is set to either "rgmii-id" or "rgmii-txid"
-            the TX clock delay is already provided by the PHY. In that case
-            this property should be set to 0ns (which disables the TX clock
-            delay in the MAC to prevent the clock from going off because both
-            PHY and MAC are adding a delay).
-            Any configuration is ignored when the phy-mode is set to "rmii".
+            The internal RGMII TX clock delay (provided by this driver)
+            in nanoseconds. When phy-mode is set to "rgmii" then the TX
+            delay should be explicitly configured. When the phy-mode is
+            set to either "rgmii-id" or "rgmii-txid" the TX clock delay
+            is already provided by the PHY. In that case this property
+            should be set to 0ns (which disables the TX clock delay in
+            the MAC to prevent the clock from going off because both
+            PHY and MAC are adding a delay). Any configuration is
+            ignored when the phy-mode is set to "rmii".
 
         amlogic,rx-delay-ns:
           deprecated: true
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
