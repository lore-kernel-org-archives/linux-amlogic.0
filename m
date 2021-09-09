Return-Path: <SRS0=iK0Q=N7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846B8C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287E2611B0
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 287E2611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkUw5E1V3AKxT03LvWjdd+C3BCaSGGsDyWN2as7JOss=; b=WX9hrFA4lRvSu9
	EuEYjzW2xy1/Tj3VEYoL0b6l/Bza3V8Jftr3oKlQ9VPMehNkZL2BTCZz7EQW+vHGHZJJb2R5c7evI
	Fgip+vJlBH3xXLN1ZaNQ9VATZELWFwEaIJnOxBXsMdve63Qf+vyuv/Eww8XNUE5gqcplhBtTmry1w
	ikyRT0G4rAod5L/ixHCYpPbohlMNFi6MShxEHco+SBlk4pJXV+GOja2+10GIagIagJDLO6Wk8MR+a
	uOTMhw1pvjIVA1a3Fk3NGGMQ2qGXY/XmNNKZxz6Mh69Wr2gAtJdOjE5ha4cK2C0zrnI4rM2NlbVDU
	HBrqew9fatCZoPYtf/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOH31-008rDk-J4; Thu, 09 Sep 2021 10:12:47 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOH2z-008rBu-0J; Thu, 09 Sep 2021 10:12:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CFA7E380B; Thu,  9 Sep 2021 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631182358; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=rYcxstF7M6GvEU4BC2Fn3rACJTfIsjKUu2jpC7WXlQs=;
 b=DDDwvohDTp0F4Z+dsZTEkO5/GRP18FE6KJEMbssKTSru2uRnJw0Au3uEP7WiayHD6b2Q2Z
 Hb4cccTh7ZsUTnozPnZo5XuUym8BC7TiQsX5zspqxpzgE8BoWXAqrSV/UX934aS9K0pGcp
 vyh6GamTHKLqXRvCTzqVrBGW2QWW7c1UMm455j8ZbdDDck00bsZhJ7AruSf+sp7Vgh96kz
 NLuY2Mnh5Rv3+fprKJ16FWNH+6cQfPi2kLCdlZLuDXGKT3KrE6apbczvrAtqsf6J7oA/6p
 0cMLujmZv8VXopN41/o3gS/qEzDgm6qlfnhbbaN1p2Prp9sgQfXnss32zLjDSA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Shawn Guo <shawnguo@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vyacheslav Bocharov <devel@lexina.in>
Subject: Resend: [PATCH v4 2/4] dt-bindings: vendor-prefixes: add jethome
 prefix
Date: Thu,  9 Sep 2021 13:11:57 +0300
Message-Id: <20210909101158.362075-2-adeep@lexina.in>
In-Reply-To: <20210907095603.1520109-1-adeep@lexina.in>
References: <20210907095603.1520109-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_031245_266606_B7B22361 
X-CRM114-Status: UNSURE (   7.06  )
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
