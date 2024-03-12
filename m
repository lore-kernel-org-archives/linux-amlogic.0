Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D3BC54E58
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGDk4qTxNhxESSymC4zN8pw4702mS3Qlo4Bb+JDJQYs=; b=N0RzAuXZwkiNWJ
	c8ebFbvxx0QqB5jtxP4yLDF/4pIKXPX4aeNGKNXPKA3YDCZC9YBhAfrRMcFB5O/f+AKCSSF7Lf1ha
	3mOLBBcIi8oUDP6yMI65F2xzgY4l9tENOedbDVbP5EzJYL/5IE9xdOCGeKo4rEiBuw2+LMG9j1BIV
	JIQHy+BcXyAcFa7XtDSxiwLGYfjFhApSwgFs13WJELDRzBcWmE1rr/AM34415n8jZqscJm66w/VCA
	9Jbh8nakn9zBw0A5M7W2fLj4hLcqLpA2DBhHrR8sL+aVo6szEddzaU67REcGZy5gqxRpZuvec29sf
	1mBXd8J05Q47WBsCLyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHo-000000054rI-3LMO;
	Tue, 12 Mar 2024 09:19:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHl-000000054p6-3sGb;
	Tue, 12 Mar 2024 09:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 105766105A;
	Tue, 12 Mar 2024 09:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2FD5C433C7;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710235140;
	bh=GY1Y3YgslgI5nfRHL9M2c1UwLc2CcvyuUQy+xFniYMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zl8o0WctTI41LRkGlWN2Yims8ZWoHOizQZIP8JQtDLArypYakxc9Ze/wE02ZIA/NA
	 H2PRsZONK6+ZCvRXy4IOHW7l/NsoPNIbTlSCp77DGnMAm7EuwgChpPQnkyTAgX/4Zl
	 9VXvCqTAdR9YCNtUZK9LHKmiEj4MIacGlUsaQXOxvny7deycNYjHnbi2tljR57fcOt
	 Ukr2g2UJ5sNOyd4xh+B51zL0WnKvd3meLpG2s/2QGlR6vBkDFwvzwgWakBrRny8auT
	 Ly5/sFaJpIKnv3TlGcd1fUprOU3U63wiEyW7SeTDhSMAKHzFwsMxPT7I2resg6ATBd
	 GZiTfSKKfnl9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D28EC54E67;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Mar 2024 17:18:57 +0800
Subject: [PATCH 1/4] dt-bindings: arm: amlogic: add A4 support
MIME-Version: 1.0
Message-Id: <20240312-basic_dt-v1-1-7f11df3a0896@amlogic.com>
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
In-Reply-To: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710235139; l=1031;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=7CB3caeULILonhq2akOBlXwuATMVWXMmUGpiqCh9RIo=;
 b=dp75MXR6HO7WQiTAAb/cIulbes0mAbyUf01Ax8fSgIxPPQeaaCRltOJb7yIkRUSzWLltdnK8W
 wvZEfuMIwJFDfCeKSjWlC5YD9dm6E1evNOW6Luv+0ymGX/47VIzEvhl
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_021902_093975_8D9B41AC 
X-CRM114-Status: UNSURE (   8.62  )
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

Document the new A4 SoC/board device tree bindings.

Amlogic A4 is an application processor designed for smart audio
and IoT applications.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..9a135fe1c862 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -201,6 +201,14 @@ properties:
               - amlogic,ad402
           - const: amlogic,a1
 
+      - description: Boards with the Amlogic A4 A113L2 SoC
+        items:
+          - enum:
+              - amlogic,ba400
+              - amlogic,ba401
+              - amlogic,ba409
+          - const: amlogic,a4
+
       - description: Boards with the Amlogic C3 C302X/C308L SoC
         items:
           - enum:

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
