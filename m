Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC60CC3ABBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 May 2025 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nj63WzfvxpURBvSh7xJvZLgEvoxl/y/7tcycJGQhF4g=; b=kN9AWyMxRb6Emt
	eqJYI76MDFIPaJFjFM7oSjfz2w3yPm92/+XA3KyxADLNhNhYcm3wE85JxdD3tzgSYigOqygjWU/Hf
	HBIWBEwvkh3kQidF9Q64qp2W+ZQVCBNi3YQL7rpMTW8HC0TI3ro8CprzouGb5bffF/URibnuAh9xa
	JTNTrhORHa943AedT5Hjv+P7o3p6mtxiPIhxvQxYE/DTg0/xoA6gxJNilsfJMPj1Ju7uo6Lbe9YzX
	+dZzCB+clo7ipsuWw9KGbxGyOsepNRpSZty+E6uooboDN/Azhh1Rzp50/FASkqYkVH2n3+ovApyqg
	9scZgYlc9pobGlIrEdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmn7-0000000Gpyy-3lSu;
	Wed, 07 May 2025 21:59:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmn5-0000000GpyX-3E3Z
	for linux-amlogic@lists.infradead.org;
	Wed, 07 May 2025 21:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2E9BA4B928;
	Wed,  7 May 2025 21:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B519DC4CEE2;
	Wed,  7 May 2025 21:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655136;
	bh=lfb0UqWejUoC/acLLAL6bG7BFI3fRZXPCnfpHVL17UU=;
	h=From:To:Cc:Subject:Date:From;
	b=o5mianO4mCqaDmHz2fE8wPgB7XaE5F21BK5N2FJz1l0hQ02fr6+kxDSnkDuv3OvjM
	 EwDajHQPPBEX3qdofHvhZ5qzce+T2rQWQT3Usi1j9mUbsPTiMohSg6ngjZ18500Wnw
	 2Qfgj8Cmr36dpvePl4qFUI6ItHvAQFP41SUNyNS9V+NyAb+oDYjBPuWdTOOEXjL8Cm
	 YkmcGIL51A4uPyL2STSUu7E0Zs5FYb96IlNysUDVPbXPzk2V2SR6Zes6pvY2aZkGln
	 o09GYrCrjLdTpCKDugWGW6on7IltVjqo1Kiod0WAj2JMZ2H7D1TocozJEEFDbdmYqI
	 ut/qhnuG2OcrA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing constraint on allowed 'group' node properties
Date: Wed,  7 May 2025 16:58:51 -0500
Message-ID: <20250507215852.2748420-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_145859_871368_E0CBB3E4 
X-CRM114-Status: UNSURE (   6.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
properties as the referenced common schemas don't have constraints.
Add the missing "unevaluatedProperties" constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..78279b9fb737 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -65,6 +65,7 @@ patternProperties:
     patternProperties:
       "^group-[0-9a-z-]+$":
         type: object
+        unevaluatedProperties: false
         allOf:
           - $ref: /schemas/pinctrl/pincfg-node.yaml
           - $ref: /schemas/pinctrl/pinmux-node.yaml
-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
