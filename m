Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF0BC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF33360527
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF33360527
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEJi+QrVnAIKNIW4nKTavmUCKH0DAkWz0/StoN27NYk=; b=AO9H46Hcsqj2Tq
	v74mFx/fHWm7gpyC4CR527QzX6nVJVPUoIyw42pY9kPnlsF9yR/07eQCPF6eT/huEuxvDaExww60G
	rZiFS6sKCrHiWMX1uUPbvt1NLtyq7oH79alyaeXy1U1IMFppc4bM/wFtP+51GWB4lC2dOQwgd2lu2
	yjmhMt6RUupG+AK8jf8TPLNReDcnaW0j4flkF6v1kBy3DSchY0Zy3j4LfTI7VmfYgfLzNETezea5U
	j+qrQbr8syqNnIhRKZRHQ3HrNYmBqFbqibpTa8b5KzofunlKJjais/nRHa4sfUATTTBmZSO+UGspO
	bnnd8axHvnaas613K+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQkE-008XwC-Ld; Wed, 15 Sep 2021 08:58:18 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQk0-008Xoo-1m; Wed, 15 Sep 2021 08:58:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACE13F6294; Wed, 15 Sep 2021 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631696282; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=riBzg7yfs/WKceqbRh7CnMdVZOOQ2QoEgRJlHcvkjSY=;
 b=JgTVbSVFBu4BpdB/IflXWld7UiT+Wnm2siehcXJ55MMksHUXAYJcedxSsrhJfo2RyQ1f4Y
 Hl0Jxl6juv5JKZQtvtZoSQxBc8gr3Q3MxYxkb4f1gfQSwaPYg5pDLsWjhl15J861+X8e9I
 qsjqlwsgxoHH0muFS2gDNW6H2aLZvmIcybb6gnSAMh7HgLhYICCG2YKhO5XQ7VlG1ZqLle
 J4IiWHKM0RnmGFkGf8JCjPmp0Pr42hvmQBKufkB5WP8riZ646uyEoxkMLhZszZq7LAKEJ0
 BoKM7w4kb3FB0ZQJ0QAom8kGQkVEP8UnKKrwQmGyI0hWBg75nMHgGMEs3T6pHg==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Shawn Guo <shawnguo@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: vendor-prefixes: add jethome prefix
Date: Wed, 15 Sep 2021 11:57:15 +0300
Message-Id: <20210915085715.1134940-3-adeep@lexina.in>
In-Reply-To: <20210915085715.1134940-1-adeep@lexina.in>
References: <20210915085715.1134940-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_015804_342860_43B4F6D8 
X-CRM114-Status: UNSURE (   7.09  )
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

JetHome is trademark of IP Sokolov P.A., manufacturer of home automation
devices.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..c52f0d3261bb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -577,6 +577,8 @@ patternProperties:
     description: JEDEC Solid State Technology Association
   "^jesurun,.*":
     description: Shenzhen Jesurun Electronics Business Dept.
+  "^jethome,.*":
+    description: JetHome (IP Sokolov P.A.)
   "^jianda,.*":
     description: Jiandangjing Technology Co., Ltd.
   "^kam,.*":
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
