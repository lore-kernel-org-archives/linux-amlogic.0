Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D02C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B98E60C3E
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B98E60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+O1RW/VYxW7x+9TDXHfq9H3XtOdIu5Ebrb/f0/KCnE=; b=gM1yrbWgwLrG97
	gHUxDcCx2pHC7cf7U3VwHXnLqLufymwbFqEZD0Ue77ju7bHRCsWpz06nnjeTgBqa7NV6AuSeMVdb0
	QJTJ05/hhAedDLwlcucSx9tZuuy0IrnhkI9jxrsI+0GnAYKBHbrgOs4ygill8L2wI7cihTv7znjWI
	8vr0cz7Hnf/dXTbHwmYubrXvvsDI5q+LqmGNsSNjSPRguzkk84JC9P9OqWnpYVU6d8tH1IsO1Ezbe
	YjqhuXezCTiSSKDtgLggd1ZZv+bl/d/AtJ1Xf+yS93QKuGpiLMtYMUNNdCTE3rjI+QbfNqOHwutKh
	Gr88vAyn+PT7jRQlQVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmPw-009dxt-HF; Thu, 02 Sep 2021 13:06:08 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmPZ-009dr6-BT; Thu, 02 Sep 2021 13:05:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 672B5D3647; Thu,  2 Sep 2021 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630587943; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xcwigKA/TswIEJuTg408Jja4+VnovgJK0WnN/XEuLU8=;
 b=L6qwZAOCZhoEB+u2fFGneE+taf8Qt5CnnaTiGpw/dskthLVYgafWqUX6UQ0HWgCofDTPtG
 wetOSZlzE7SkwmwzwFeSMC8szZMxFTKLilJmINy7RYuF3MtJcIC0AwfbwDMV2lbaTSXgQx
 yGqB/Fkkc3lCrHaKTz9vQVkVCcY7/iQc2swEN0VjqJQNsZnD8uStydbXeKASUeJh+siTch
 53qAlpAf1/NbtSyW4ZH7CaWAfEUO0r1Q/56rTXklt5uQzWR8B9QKw829XrGe6U7636CX9j
 Ia6VvMmdApz0Ok5G4FRX+7T4UFMy7V85LNwMJj5hrseKPph/YExHscCYQkGCGA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vyacheslav Bocharov <devel@lexina.in>
Subject: [PATCH 3/3] dt-bindings: arm: amlogic: add bindings for JetHub D1/H1
Date: Thu,  2 Sep 2021 16:05:16 +0300
Message-Id: <20210902130516.3892452-4-adeep@lexina.in>
In-Reply-To: <20210902130516.3892452-1-adeep@lexina.in>
References: <20210902130516.3892452-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_060545_597471_9D8428CC 
X-CRM114-Status: UNSURE (   7.85  )
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

From: Vyacheslav Bocharov <devel@lexina.in>

Add bindings for JetHome JetHub D1/H1

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..b223d7829c3d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -86,6 +86,7 @@ properties:
           - enum:
               - amlogic,p281
               - oranth,tx3-mini
+              - jethome,jethub-j80
           - const: amlogic,s905w
           - const: amlogic,meson-gxl
 
@@ -133,6 +134,7 @@ properties:
         items:
           - enum:
               - amlogic,s400
+              - jethome,jethub-j100
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
