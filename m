Return-Path: <SRS0=Hahh=N5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F55DC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43CC6108E
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D43CC6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEJi+QrVnAIKNIW4nKTavmUCKH0DAkWz0/StoN27NYk=; b=DTkAtkeIr12G0u
	EVJ8/H0Lf8y08zddaP5Phh/d/epJ3wgjnGnbfReCi+ow3snldHf7IIUtrwsyBteuQgYfYsCSV3qxa
	0l3l6g6DCEUiPYlM2u08fMMic8K8XlVqXPW6DBQG9FXu1FXs7UNMbtp++6vf2KEFqUjSMTGHE1lDK
	KiUjueQGzGSBe9/fl7z+sR3UxbQWbvHuvwYzJ941F/ZsOlbiq6iO7ytKQ94gyjhofwPd0lxJNSNql
	aoQOoxW8eaPYJxz8CrsX+J1oDj+eMsH8QCL9AYPn9NXIInTG1gsVsia8Ur2fsiFt5jiu7oxTDLPav
	wgWw/1T5mIo0IEuQBuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNY2X-003HES-6J; Tue, 07 Sep 2021 10:09:17 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNXrW-003DSJ-EA; Tue, 07 Sep 2021 09:57:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EE96DDADC; Tue,  7 Sep 2021 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631008671; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=riBzg7yfs/WKceqbRh7CnMdVZOOQ2QoEgRJlHcvkjSY=;
 b=Z3goJXcr3/+/pQ4+YeJ/XtcNiz4VP2WsvidPZTWNAn0yKuxXWZFON5AIREmCUsueRdWS+W
 Ld4EMqzCJCkAD8JeP8/BUPjf2CpqFAwJAedjsS9fJGePMO8IIvWMeKRH1Cm2HEfwhMnPat
 xD6GryTFeFXkHLEler5EGdEBzLPY79uq3T+GAcULoQsK/0N6S1aczZ1kNlQ/mWdrxIA1U2
 Q2rAyY4yMlqFJwzck0TdHx0sHATAdbbPKiCDL9PKQZCf87uLjfCN5ATZQjHNAT8M4/1tBb
 SyvoBAA3He5NPXli4MfiAd9of8MnhbYP60rSdYV3DwD/GjvbGAPa9iiN4n6g3Q==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: vendor-prefixes: add jethome prefix
Date: Tue,  7 Sep 2021 12:56:04 +0300
Message-Id: <20210907095603.1520109-3-adeep@lexina.in>
In-Reply-To: <20210907095603.1520109-1-adeep@lexina.in>
References: <20210907095603.1520109-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_025754_861747_30505ED0 
X-CRM114-Status: UNSURE (   6.82  )
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
