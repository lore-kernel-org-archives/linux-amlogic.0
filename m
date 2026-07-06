Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D1C44500
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 02:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6QkFA0rOy+974t3PbrTB52WmO1rlMy9ayjU7j9IaW4=; b=nfX4NkARP8OFN+
	p7r60x1VPKR9RE1mFavR+iUuEesGv9o9eIKeHARRGqtVlP/5BZPp6k2ZJBomPZNVR3DUYIrCi8XMn
	CQVJdjrz2m+zHYEX15qcRnxs32fdN8ePjvxY1AsWgIbzLxnnFZ7S6VSlY9mjOZdUaTWT+jR+1DNRl
	mmbzZ7PD2yH3KuG3fGuMdcoHSCC+xU8KwZHqQ3SXIkkTeK8/+eSDUU0vp28oz73pinQ0ZLvqb4Q8h
	B2nw2Y8oG22w4XtULz0M/kZNNU8KRFBt0nMgJKpwnGJBdTmdnty3vVwzMGOnoY9juZr5sNeN4NOc6
	Hvp6BRfQBkdXuaGYze0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIz-0000000BPnO-2y9L;
	Mon, 06 Jul 2026 02:43:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIy-0000000BPmH-0i72;
	Mon, 06 Jul 2026 02:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E730260018;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93682C2BCF5;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=RdHJ5I75Tcbgivqf+f/sQIrZyTTONH3eIvRriKAVuhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OIrdOyn++q3OekiH1zDQY4tqQ750ZnIn66/vXdQv8Re0k+xQFZA9VZc3w2FthjsXj
	 BeZBXZ5Uoc/tcFRnELL7ZbuqrEQrU+nC7+tgMzpP/21zpDace43pp9JX8FynOK5dCf
	 ya0h4dakRTpBTcO4ntA9CGvjxwTFWwkG2pTklBsRnrVR+NzevYoSOeHOjBsPdd/fWW
	 +mBQ9XhI8hROno7oc/IacKGYyhMQznEyFUQqhMBxdOjWpnhlnddtTn6PZ2H7PFRrJ5
	 yX+Gn87z80xe+Nfa7mv2eZr8cdrhl9NQC6b8vl648OkSQU7osNDEwSU5BnJlZp6Wpm
	 +u3hj/RpGwCFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FECC44500;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 02:43:27 +0000
Subject: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
MIME-Version: 1.0
Message-Id: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=1001;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=zbm1gpme/ld1wK4sUZ5JpKgpU+xuYVReKQPeHKlYNSc=;
 b=HW66s1CZtmd6uNLpNkxRqmusfq/dDOVZlGpW/vZYF/lQfw1W9ziZFq4h6okqg13y93in2GZA3
 DStB+h1BUCKA2+Us+plj3yL28IDY8ygsKhsljLbuxRcyv2XfNe4+4V3
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

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
