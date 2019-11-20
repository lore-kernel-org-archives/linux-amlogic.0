Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B0FC432C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6F12088F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUzpPi/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRN5xFCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6F12088F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FqHOtFaBlIghdAdCIHBBUDItmny07nUr5Z6qf67Miw=; b=RUzpPi/BVedbgu
	OTLA5Q052P088DKuJJkEWir0XKDTohw7TomNqbPQ7wkmnqSa7k6CCS8LI8sYeNvMXIfihvs3Xu5gd
	drvXm1+ZR9zgWqTynCqWW8Edif3tNt/tzbUzMYLgQnjbh7LJcObKvH39uRTTTe0ulZT5EgCr6/pr7
	WI2SgHj3yVARdDdVA8JIyEfJMzF//gfVt8xNhnyn5t5/Fn6SfFflUCpg6JnRpgcetkxbaa/fbOIsK
	H6wxQN8QI6bcPjkH4hMJQ5eIi5w984sX+OT4qS1FYDd2BSvRMNLpz+Gc2JCjhqA4vIK+XWYut+WBZ
	qZc0zrYyV4er/wZQzz0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXTAW-0006Ur-78; Wed, 20 Nov 2019 16:49:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXTAT-0006SQ-ME
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 16:49:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id s5so668004wrw.2
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tfNmuMMwyQORb9MmSyqJxqNXHVoAVkzV3jsy1XM7mo=;
 b=BRN5xFCTeldhvhmzSobTZawZRCXwUl4SMRKouHm315jXJg8aoic4Qfwp8AjzhvLKv0
 VuAUzil2nDpggMs2JfXZYFDd++7BH9kHGsbdCK4uaZiBCMCVQWxbS/D7KkRI18v6v45s
 iBuQ7IMZhu0n9MRxDSMopj3G5PG/z+4fItQYxK8HfG3XuecDm4PeCI8PqJ7IbhVEieqt
 Ir548yW1xvP6sxTXEiCU/UZ00/OVzJtFqpLGFsTrbY2P2Tse6uTMujTIih87TI3nYZqS
 AVqg3UzKMaK5pCuO0yjYY1RWc7c8CbET6aMlPGElb0Ob1Jjf1j+M3et2DxTsX4SJJISC
 jjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tfNmuMMwyQORb9MmSyqJxqNXHVoAVkzV3jsy1XM7mo=;
 b=E6u2gMpyH3IgVUjRuQvN8WRQ8oASDOf9F8L+DV9/5+JpZ2c9StapyoWcoXFnTBCh07
 0cVMgExINCljt4tGwMXGA/TGz4vW7SCh3IX3ShOuk5N40+CHyqbsLUcoIyFQEyOQAU7S
 N6hmKtj4uEseyZSQswZ4n4yZM5M+eaVCGCrpYfQsMe6MVbkCF6BxoEmmtajb4Y+jS6vG
 BPvjDnC5ctWuMsG5dy9OfGGACDKHiIffJ8LM2FfJJOpufEEjxV/Asb/DoruLXg8zFKd9
 Un2Lkm2NlFStRMRiOWgp7QQL5npNNeQplNEUzvjnc4R6D8k7r+pAxPftyDBr7fyVFjUF
 dsgw==
X-Gm-Message-State: APjAAAUK9sVJebSugH2xeW3OmDYBYbfHcEm5qaeMWEfzWt2axLuUhC8H
 SNjHuBGpEdJ9nlo8FKQF5+ggaCoKWrgVFg==
X-Google-Smtp-Source: APXvYqwU5OvZpuB8HO7URS5VALwX3xIgNC29r6N4jPORB+576yjnLXrwHXsRbOBUUYFhNm+t3sW84A==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr4415174wrr.368.1574268562949; 
 Wed, 20 Nov 2019 08:49:22 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id h15sm34858641wrb.44.2019.11.20.08.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:49:22 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix for Videostrong
Date: Wed, 20 Nov 2019 19:49:15 +0300
Message-Id: <20191120164916.31698-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
References: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_084925_724607_DF601D3C 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
(Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..e4bd0a9fd4e5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1006,6 +1006,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
