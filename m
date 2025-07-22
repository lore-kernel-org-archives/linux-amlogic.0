Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F95C83F34
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qX3+RlqUPjL/wroN6cn+ZX/HNfV0/nRp8aJ3uwLPCA=; b=rdNcf0flO6pKV8
	Qd3WFokG540I7wONhmHHLHlQXYBKjQ+AG32TDclKnP1j1MWR74asWENM4afqkR+87lLfVDzHV3nPf
	+e3KUQ2VxMCNIXHEtd6u/EUkk09JU8IEyZPB9vzGG3t+SBrgHE5BeWBr7dSyI09FzE0U3nZA/g52M
	/xNl9/B3+aQGzn5GZhKsUgBhQ76sdZvVs7Q1qxNgcbdTtaRUC7J09uwT7r8URsrSSJqldy9sO1QVs
	N+RAkq0FW6rGMXG+90NKjY9wSMLb3tDH31PtQAML19d19g8mX0bEOXpaOJAU/7nCHcSSqXPK2XnAL
	uqAPjefKgsW2DZyoIt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBJn-00000002J5g-1htW;
	Tue, 22 Jul 2025 11:37:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB8h-00000002HNp-0PM6;
	Tue, 22 Jul 2025 11:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01828A55F35;
	Tue, 22 Jul 2025 11:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9351AC4CEF4;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183589;
	bh=YRA1hYrEORFOB7GQuzTQX4VTQhnY9esTD7J0wHpqIjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fMDuRiiDGlEukblcq+Qoss2+dwTvSbp68Ai0QD2ZMx3d1k2uH2NHhoSkCaJWWD+Ys
	 EDw1L90A9QfaunFIXb+LlTd3f/Q3sXWgopqjgu4IngkLeV1L0WNnttQaymjzRheil0
	 6n5MU2Xb80XxVzC/G+ZswxE1eWP+GvrkBiJG4i1L/m2JRREGkQEsac6Q3XuPRzRXSU
	 xNgsmfXYR/tIyV9q47W1rH/HVsiA505r6uULUM9hZUr2oF6sxgOBcfeba8dH48/MeA
	 1ikiJgNdQuHiYYVzy/krJu8gFKFnXW/o19jR8pESpv7YYCZEhOiZFDmOoymAYWn7z2
	 /eEJ8r8m/rSVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843D7C83F27;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 19:26:27 +0800
Subject: [PATCH v2 1/3] dt-bindings: thermal: amlogic: Add compatible
 string for C3
MIME-Version: 1.0
Message-Id: <20250722-c3-thermal-v2-1-b2231b4be79e@amlogic.com>
References: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
In-Reply-To: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183587; l=1117;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=F245QN28IAzyYVKe5LdflpfqaXIiAZXvhwVaz2WE8mk=;
 b=q+REDs12RZEfw/hMQsKiHAKbppF7thzkQndT/LP7EhRcH5t87fMSM1iDpgzs5MsZeD8FmYgmc
 K4d+gMdl/vnDxBp1OybqgW5ji0qQu7ttbckZPAsqLorPzjHq0G3M111
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042631_273785_239CA5A9 
X-CRM114-Status: UNSURE (   9.17  )
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

Add the compatible properties for Amlogic C3 SoC family.
C3 family supports only one thermal node - CPU thermal
sensor.

Signed-off-by: Liming Xue <liming.xue@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 70b273271754..27ddb67c7743 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -16,12 +16,14 @@ $ref: thermal-sensor.yaml#
 properties:
   compatible:
     oneOf:
+      - enum:
+          - amlogic,a1-cpu-thermal
+          - amlogic,c3-cpu-thermal
       - items:
           - enum:
               - amlogic,g12a-cpu-thermal
               - amlogic,g12a-ddr-thermal
           - const: amlogic,g12a-thermal
-      - const: amlogic,a1-cpu-thermal
 
   reg:
     maxItems: 1

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
