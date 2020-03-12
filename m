Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEC8C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 04:39:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC8120737
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 04:39:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gHZnxaQN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwGzluP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC8120737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LHwGrL8HzPYRPfoboKQXUcg7WkI9FubgRLfGVpPk3zg=; b=gHZnxaQNaVy71u+Gl7tJrj3z9Q
	ZwIqC4iLXQcvf4lftgj/3HfGzZxtdLr/LbJBccb6OOQR0g1oFs0ZAu7vt16Bw+2H/lQd6gJYUBLKo
	ylv4IN4K5wnALKWNbfw2bjsncJqLnIkhMY6gqkwDtEFl0HEh2w75nWsB/gqJq3Fgc6yhyz/EJpppx
	yKL210+vlD4Ljt716F1NzGDXyV2zKnCOPFKq5yrZAIQ5Y8bOaBrCtxzIajbhLzs7KmxIdrgPYeeB6
	bhAi3F9JJurTeYEa3Bq02JBjhTrbQaWJPJ9m1bp2WxoW3zfjiNNw2ssfz1e6BokvMqf9AavzWn/pr
	KckcxkOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCFd6-0004ND-3P; Thu, 12 Mar 2020 04:39:32 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCFcd-0003l2-0W; Thu, 12 Mar 2020 04:39:04 +0000
Received: by mail-lj1-x235.google.com with SMTP id g12so4852792ljj.3;
 Wed, 11 Mar 2020 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CQ5GKeXvkGqParOGBbk3REWEzXGx6iRtxkKUwPdofu8=;
 b=PwGzluP0WgYEtjxd6slxjBTCQ2MCXElCaw1aAJM7OdeBX9Y62hglyUeK1LszMY+bD1
 v7uFtw5T76pg40v3E9xj0x9MZlUalHZGlqKUyw/JbUpi8Z7/7+9OWbWe6GbFZMkFvjxx
 FUYU2516f9coJD1EzSC46OepIfcp95Ziqde7sxBCCxiwj4lQAfyRiVcb7Cwo5f/ia0gC
 7vrmllqUbZEpF81R+ugmFFUwM+Ty4hu4T0wGckJtMOa/2Oc4NgSBFWEIhkjcHoomO9Qf
 4iHz2tXzPdjPffg1XuIOilgBTfA7pFtEcaq7KttUX7KuNr/zCOowaAcMyDT5Wwu60TiC
 B2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CQ5GKeXvkGqParOGBbk3REWEzXGx6iRtxkKUwPdofu8=;
 b=E34O0w3WADwmfYKNOR8OauPk0KsIQsKxwv7HJSOS04c76uTvqFZssb7Xb8bqaVPvil
 TlWr6S3cUmDuXF8j2BZyjdBgfRlQEusCI/amj18Q2Vlghrbf5e6yKx8INCQJoqCdhDKC
 2ktgG3dF3khsayvlu6IHKOwMxgXFai6szAt9PxXYKybtWTtPyIemNDm8kho0+SXvZmK9
 lG291R3pUnNAGMnnKee7RDQ41XGwll/GTkZucEq2MS1Vgh1wswkaNleY4pehOS7WLvLw
 WrKBDVI/a1IOhyYyU+oJxbVDUtvp/aUvbGNsYpRx/7iqZSyfCWmIkwK+zLf5S1oZsM6p
 HOKA==
X-Gm-Message-State: ANhLgQ05/TbggZ7nWCo9LA1MJE1/4U4htMndAfnGhZ0TECk1aIdpuRTI
 NCes6BNIyicIv23BV3VfgyM=
X-Google-Smtp-Source: ADFU+vsFSBXwiw010EUlpXZARd0uRs7BApQJI23fC7SCtptQOH7Z11vbSZqTSLxTOovEFUo57s0srA==
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr4054714lji.254.1583987940236; 
 Wed, 11 Mar 2020 21:39:00 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u2sm8872866lfu.3.2020.03.11.21.38.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Mar 2020 21:38:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] dt-bindings: add vendor prefix for SmartLabs LLC
Date: Thu, 12 Mar 2020 08:38:04 +0400
Message-Id: <1583987886-6288-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com>
References: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_213903_049278_3F55702F 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SmartLabs LLC are a professional integrator of Interactive TV solutions
and IPTV/VOD devices [1].

[1] https://www.smartlabs.tv/en/about/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944..a34ed82 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -901,6 +901,8 @@ patternProperties:
     description: Sitronix Technology Corporation
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartlabs,.*":
+    description: SmartLabs LLC
   "^smsc,.*":
     description: Standard Microsystems Corporation
   "^snps,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
