Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B586EC3DA59
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9bw5WMDnx/W+jPu70gUIDbT2127UQ2+xhRaMUxAAFw=; b=Uh7ayQQ3QZw2dU
	SXYcr63eeaXUJ/GLI9GQx5UH0l/JGph0Wdtv/uzocU+ZuqqJpMLGdHKxoP6TJmMY72yxrYxklx4PQ
	eaIKgM4yjB4VarbvJmaQ1dd20vGSrI+21doIAxAHD6G/CI11N31R073rlxM6NlAkxKz38lSFHhAsX
	GQM7KrUDztiKw35Y7o5Em7vUY9j2PoB320gmy3W4XrXtCB78ubXNJP4ICmedLZANSXyKhtjtA26De
	WrwfQWRo+KZKzzntOM78SLR+agRfw6XiIO/QPa0r6vRp1vXJN/gFMYjfQiPSE0oK6ucdR1z1Abbt+
	eIoRyxa04z1aycyHX0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYN-00000006RJE-0PQr;
	Mon, 15 Jul 2024 08:59:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYJ-00000006RGl-0Bo1;
	Mon, 15 Jul 2024 08:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D78C460E03;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D9D6C4AF0F;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033961;
	bh=LDdV5iZmQZqylIgJ/osRTNrvBIzVQCfS1jrSLC+xklo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T0JOZpOS26qka/RgQVUeN73Jeil6A6m+9QScjfmmzkwJR6fmw9xytb6lPYFaCnArm
	 +G9gZwknY9YQzSDjCB/54aIeK6mMOOHLYe7pTeJyh6FusA9+9oVtYDFy7EdSKjA93e
	 MTyFA+c+g3rR5He1z+ckW8gF+ejdR9Ecv/jWZ/GgsQqr6VLXu0Zvm5SeY4EHyhnQQ9
	 erISPYITOGv+JiDdI0mSnKT2acso8OuWd8WMsMoIAydbYk1Cbwz/yxjbLuC+9bRn7C
	 4XKKP8dxTXpZLkDDM5O6wwXEL+6gjam48CHd8ht4l0VB33B11/ViKuERaSVemF/c04
	 OGigfY/5T4ryQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D347C3DA5E;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 15 Jul 2024 16:59:19 +0800
Subject: [PATCH v2 1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs.
MIME-Version: 1.0
Message-Id: <20240715-soc_info-v2-1-3836c8cc27a5@amlogic.com>
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
In-Reply-To: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721033959; l=1215;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=JnJJMZRxCaqyyKyFb5/FDU56hz+XcWAtbQbfxps+Two=;
 b=R7XvE+qSM+fzrD7PJUeJk4zhQ3FJjbtgdSphOmak7wX7g75WfqKiSV9MZNFg9EFKX5uCRppIm
 k6cKatYUS6PA1DkZHCfZ+EKvWAeQOxUI+MH34a3rvaPlTlfEOMzPjfo
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_015923_175152_E993784E 
X-CRM114-Status: UNSURE (   6.92  )
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

Add dt-binding document for ao-secure of Amlogic SoCs(S4,C3,T7,A4).

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index 7dff32f373cb..b4f6695a6015 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -25,10 +25,18 @@ select:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,meson-gx-ao-secure
-      - const: syscon
-
+    oneOf:
+      - items:
+          - const: amlogic,meson-gx-ao-secure
+          - const: syscon
+      - items:
+          - enum:
+              - amlogic,a4-ao-secure
+              - amlogic,c3-ao-secure
+              - amlogic,s4-ao-secure
+              - amlogic,t7-ao-secure
+          - const: amlogic,meson-gx-ao-secure
+          - const: syscon
   reg:
     maxItems: 1
 

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
