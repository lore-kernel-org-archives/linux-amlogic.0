Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D8DC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A8D64ED4
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A8D64ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzYeQ7meK3Q5fzDHkQ1o4wPgVbHsO8kA9SmQFVA97Ac=; b=IHhvgRjCaQ0EI/rYZDurbku635
	2KdM9haJEtQ4rNuE8qAHEacsg/SNk1p2S/fOZs3ZmHTAnSP4WQ6UN+SZ69qsnFq+1cCGqbvkc7TWs
	pe2oiadkyCFkfNejW0keOtpWHEYtXbVW1i4CRsAD/PX/Ge81pQFst/dRXpYwL1wGkEaKunhHsXPwy
	eBD7o5og6MZckRZKIFY7tmOFMM5AggSl8/PwZGYoi8ubDp8bwSpjfc/f7P6XR75S2c+Yogyqp0lpl
	KuGrJJaCcZntNpuLIjCW1/z6yohArm5Q2ZgFA86p40oceEpQwFLRsxQwWTHVbX9ZwCqVJNgfV5ur0
	E2aeNOQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6l9R-0004Pt-Jm; Tue, 02 Feb 2021 02:10:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6l9I-0004LM-3g; Tue, 02 Feb 2021 02:10:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id e15so964288wme.0;
 Mon, 01 Feb 2021 18:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=Phk0EcvRvk4HHkCx+hRegfZmcZPsNNZo/rjwwMEOjNxmqevE2sqjsr+rbtCV2rNLtO
 L7FkZiN04tkLd+UpmaSNwkONP5SBX23WrgfrkiptxFRevfAUfKKGPCkcAATIFzM1z4Qs
 QvB8ZnjXtfJnVX6hzt31treG6xj/vxO+lgHFLOf2c/5qDLe8ASFmm+ZCQUFQ7K+06dhn
 4ylDQ55wTTn/5ze9Q3R2nkde2FZnyVGvmRSal4UR6tkvBI865QgWLt66Gx16Ibm44RDC
 UXu8OpkHLFnywhqxvg2gFGQSrrDWCvap4W5i4yKEDZOjog5+CRtpc9B/ZXbdNi0Unb9K
 n7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=U118NxG7vSivcYCcOcDCxOWgCpwOZZocowztGGfSKo4gVYDkubtcRFFPcfNeCUzw8l
 ZTjrkQ3iGiHpUNh+eAyYMcDkx6aBTE4pt8YqH4IVpAT4eKYxEbgKc6G8Z4cBBsuyViY2
 qKFYfQXeKGm/+ciKGKRTX8uT8uvjpqtM2fCCZTGFwUW+zisTQG6EW5cX+oUUk+bN/iWG
 CGS35xCT94Ns3hd1TbssJ79PpgCC2nLRbI6Jd6XIobILsiKTj7ObHmIUm+irzEIaiFhM
 5l8bKF1WtblgNfnd5SsP6S6yTsctCiym1tuX3PaFITS+V0UUyVTaBKUrdcNJFwYisRi6
 3QFQ==
X-Gm-Message-State: AOAM53134PMJYvtCNdneC2kfiYAuL0Gvvcm0VZoe5gMVUoQfZUjWUzYM
 EUGW49/pnxR+vpZyqwQcOYM=
X-Google-Smtp-Source: ABdhPJyuhxu1+0MHl3LKp5TEBg8XFBK2divUN/udYoC5kG6bOObvYEfl5y2gmuUd7LHcvp9Dx+R/TA==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr1372051wma.86.1612231834881; 
 Mon, 01 Feb 2021 18:10:34 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u14sm990570wmq.45.2021.02.01.18.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 18:10:34 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: arm: amlogic: add ODROID-HC4 bindings
Date: Tue,  2 Feb 2021 02:10:20 +0000
Message-Id: <20210202021021.11068-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202021021.11068-1-christianshewitt@gmail.com>
References: <20210202021021.11068-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_211036_201845_F77739EA 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the ODROID-HC4 device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b21ba8ba23dd..5f6769bf45bd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -165,6 +165,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-c4
+              - hardkernel,odroid-hc4
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
