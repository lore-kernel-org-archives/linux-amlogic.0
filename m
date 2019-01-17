Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DB3C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060F9205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+q0zw+K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hNo1rEGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060F9205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Prx8NOiB7ExGwyMhMYmw0LIX4sgQozl7ACu/67lWXdQ=; b=c+q0zw+KchGjgq
	JwK1RjJsq9L9s2dAbY4QVj740LQZ1XbJmZUoNEFsYhtPeHYCYjxE8s1JphILnHLoTloB8GyPwmmdP
	sOaCfpxNLwxJYzKrH4ZBWJvZmB9oZcoAKis+bnf/uBclta+OiWI7Me3andMX9tvNf70QqANZq9fOS
	a4wj/8AHYHEmBWelh7qFzvsO8sYIvHqDtID7F/aZOe01qhbykD3jSn2WTMFZDz3hKHZIyCUBWMCI0
	FAKP/KrHROHrxyt4H+1cv4qY4Oi6c/ycCjbUrU67y8Y2CUbTYSVN1GV3aZJm2Unt1Oj0Y2muhrsod
	Ibyz+viCTGCNc7uTUzzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAqa-0000Qm-S3; Thu, 17 Jan 2019 16:48:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAqX-0000Np-Fe
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:48:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id d15so1785763wmb.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J19q6XdK6LukgFHT/iRLr1xXTdkoFW905MZs5kCf7/Y=;
 b=hNo1rEGVShboS3metNJ44AIwn4nR92zozMUDNX3syV7JN1GZHHmKNPwd/2sVOkb+CR
 /dHN9S8MCTp2MbWkmvFU7Cnhc+349ozgcHJDtGQidFODb14mBWS237FUsUYpCGB63+8y
 ZzZExrfvNqmvMxwjn+Svk8wpl68B73R3gR0HJIy7ztH82vO86eSr5E3w7ZC83q1xij6T
 Xc5Zz+UfLVn8sxMJpllmCcuZ8YfCiHu0qRsQyBo7yQfOPQefh2UTX4pRbEXMniJApArU
 Ug3BVo6RQpnRSthEjD29IE5fGIl94IiL8ECaoUDHtkdoUt0WDy1iGr1htdxqL2FrmsLK
 CliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J19q6XdK6LukgFHT/iRLr1xXTdkoFW905MZs5kCf7/Y=;
 b=B1qn6eePFAdQlV+cmx2gJdDt8dHXaNpJEXpBKA13YpZpSbuyXwMuNhDESXUEleN+ir
 2XIIyZYzFrm+OkVxkCuCE6naC5hgqKUbKi7EsF19DLaQg1WPoQCUhRz5ZJeZBU+g6eqX
 rGMvjvLb/0Dm3Au+RufNp4x3+9l/jv3mmEYHHk+pdGpHwegU0GkpDlPNAtYc1yG6jpsq
 lT2PW+Z70wKZCcDVp+OuRPtIziL8ZLpe8aXELu51xtZp6KiBzTPVPW2vEI1o4DYr1wZe
 ad8s/zpiG/QZZ0y5XKKqyAqYlNsTTMt1xktQlXkhuRXlGo2l/s+M33mq9ZnW5sWdUvUt
 cdyQ==
X-Gm-Message-State: AJcUukeXQ8NG0SlEIIQDjcldGTMubppDkpR47kIYz78dEZVzaGDH4bNF
 r2+iLY0/0eU1rXLt1ve3wguQiQ==
X-Google-Smtp-Source: ALg8bN7kCzRQ9THJH4u6nZLJYqB6+A8uiGnq+CdqgRdEYSULdB6PSAVS2R6usFRmt2+4SpTtOXChkA==
X-Received: by 2002:a1c:8484:: with SMTP id
 g126mr13055931wmd.117.1547743727732; 
 Thu, 17 Jan 2019 08:48:47 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j8sm99263199wmd.0.2019.01.17.08.48.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 08:48:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] dt-bindings: amlogic: add new compatible devices to
 clk_measure
Date: Thu, 17 Jan 2019 17:48:35 +0100
Message-Id: <20190117164838.8008-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117164838.8008-1-jbrunet@baylibre.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_084849_520455_68670E09 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the axg and g12a SoC family compatible to the clock measure bindings

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
index 205a54bcd7c7..6bf6b43f8dd8 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -9,6 +9,8 @@ Required properties:
 			"amlogic,meson-gx-clk-measure" for GX SoCs
 			"amlogic,meson8-clk-measure" for Meson8 SoCs
 			"amlogic,meson8b-clk-measure" for Meson8b SoCs
+			"amlogic,meson-axg-clk-measure" for AXG SoCs
+			"amlogic,meson-g12a-clk-measure" for G12a SoCs
 - reg: base address and size of the Clock Measurer register space.
 
 Example:
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
