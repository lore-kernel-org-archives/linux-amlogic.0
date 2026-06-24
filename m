Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B56DCDB481
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g+A/dNOnzfkvQTRmhNNA7r49FqYcA4XtaS9kqqwwFvs=; b=A5h8kd1s38A+T4
	lzje3jntkYKDoaChNeumK1zUm2zrtGEYuWewhugSZse5aBTdPnfzzhircqCREiSLX9+EbNFvV2KWB
	fPYOkQf3acLi8n+6VPg46Drp82toLisf2qEJU48zsYewCDdvD5VOSmczcTcg4R7ELlkGx867tcrMB
	T15RiVXAp7w9+KTuLWP6mxpmhEdh0aFMljUA1EqpfCBpZOKzBOxFP6B1SABiqqkjECPSvRNPuTi9f
	64kS39iLjXnP6kSSIgXC2KaxUmKdd6MjX7i/hPVCW0c7Kwj3bfe/OgoiOBKu5yU0sKto8ZCd9GI0D
	n7HjqaFXDNQ8xMSxOdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNmp-00000007pja-0yzv;
	Wed, 24 Jun 2026 13:37:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNmo-00000007pjU-1MEn
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:37:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACFD860211;
	Wed, 24 Jun 2026 13:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5001F000E9;
	Wed, 24 Jun 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782308221;
	bh=CV0B6fPgP7Nr8Stw6KChmVD4qZfsxnWZMz7t7ypTqzw=;
	h=From:To:Cc:Subject:Date;
	b=FHQTxJel3r2tHMLco7N4iZNJ/4aycGp7Tw9Y+30NtTW+N+gI5a1HQfoJpZgCSf6Sr
	 Uz4D+/1jjNO60BhOA2AcIdakPwUgR93/tCDLZJGODK1j3fg/JsMkXFBDXcDj9gWQHL
	 g2aqGoa6f2aycHM62FLMi6uW0T+dqUofkpQQEha92krZMvSiyUMkw0CRDhZFEXR9d3
	 doqZMx/gXPMXJWEBN3jw+iAj5bcKdeRiV9y7q/aQIMuIohL+itZYRmHKFJiniO3dfO
	 Q0pmPkzR7JykDhCljUeJSUth+d5xMmMYaM6cwt0/j47l1XQO6BwkIN+jHEcO6ni6hb
	 ygHRcTiojhZcA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: khadas,mcu: Drop type reference from "fan-supply"
Date: Wed, 24 Jun 2026 08:36:42 -0500
Message-ID: <20260624133643.4146351-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

"fan-supply" already has a type and shouldn't have a type $ref. Drop the
$ref to fix the warning.

Fixes: 39dd85d9246e ("dt-bindings: mfd: khadas: Add new compatible for Khadas VIM4 MCU")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Applying this to my tree and sending to Linus for rc1.
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 1f135618e3b6..c6f91e7bc8aa 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -28,7 +28,6 @@ properties:
 
   fan-supply:
     description: Phandle to the regulator that powers the fan.
-    $ref: /schemas/types.yaml#/definitions/phandle
 
 required:
   - compatible
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
