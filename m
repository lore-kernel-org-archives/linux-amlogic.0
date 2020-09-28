Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3372C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6784B20809
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPY4f/Ny";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F4IiLxRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6784B20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OmSgn9edBSESkzVoC2Rzps5Q9LvNVcWNUWQNDp8OwKM=; b=QPY4f/NyAR6C7yCft8ltHGjHX
	IvtW7mxEo0bQZPLpol7h+Q8VZNlWDBppTle3BwXamhSVvhURYIoE64Fs7CUw/oHoqp4HCqK63PmBC
	5kCmCsg+K1/owfa4lAbIrea2Jf5cAPeZdGcqUstch7eB9YviHvEsDj4TsfoGtN0RuA+ct2tGx/VZp
	xxMZw3i9ieAN4SP2GWNAdQQSWIcaNiLRGpxOSGQJMtdRIt5EaAWzfzR0fqvXr6CQ/CyR3sC9FfToo
	3nzhoJOqv/WX1rzaaTmJlzNcBaon3MbLG8cXdN47QOZvNQozUpKJHF73mjTQBcA0m6lKTRzVRdTNY
	pLWD79chA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvnZ-0004dc-8N; Mon, 28 Sep 2020 16:14:45 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvnB-0004VO-Ry
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 16:14:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id x14so1956855wrl.12
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQ50YOdSxMFM9m16k7oX3RqYQsmb0wGwdxhkB/xdkZI=;
 b=F4IiLxRU+38SOWM2Zo9DyrYhODuHKkgzNLU5wXreYzrGzIdPmA7/WfsbOQHc6YbwMl
 RkvBkODb07+6jrRlUqfEK5EBGI+dovMXPu3n84tKt/j/5cqKhFyZONXKTeoEgp/zm46k
 HXkGNy2Y0F6sPzuqBf1KHZ/i0mOEWifr+ebJiD2wAI4jm+yqujOrCrMzWsol9nKGkS02
 DgqkDaqftN9XMwJsDwwTu+vnqKn/PP773r4ljEQPy2791DMnsVqkDTs/vj56KxFKeRX2
 vA7JomF7ZpldQNR0Sk3MXZugpBi2g6w6dz4j5inTVxAPi4Z8YwoSPIbC/Z9QrsvQxOv8
 BcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQ50YOdSxMFM9m16k7oX3RqYQsmb0wGwdxhkB/xdkZI=;
 b=b1e7cd45cgfeLZ1DDI5ZUeH1pUXhD5yN4iTKECW6rwPTFHGhW/yCiT0tF1SihZ2C7l
 oYIdsn/LcpmZHjezIJcQgOnSC0k7tJyV4TugtInrXW2vzIr/BOAnLmfhKpnyPc2ViRcU
 hut26kLbRHfRCtv7xP+GWpNu6JkQcl42WTMzMijhb/58hExcgDfrUD8ETaR4CDXeUEHb
 A0rHVCUJUhfYgjmyCAvMklIoLoD0lwIq1u9tWWRCI64wlmzdCG3nZxpLk8O3xVq+SBfQ
 sQPfeQSUPWTrD+rlGCRQ/z3xEA4MJ0ap0ma7VchPFsAvOqw+HYomxl43Eb6hCuUbVT5a
 USow==
X-Gm-Message-State: AOAM532vtl5OWzmT5QZRg+8RkkWnlKMQhU9mt2ckVfp465Bo1VxRSFBh
 wkoRjk8Q39PEs2TRInFRhWrHMA==
X-Google-Smtp-Source: ABdhPJwW//5crbFbhjbyCg9NFbGj5IXDQR2SsEenMHBN4x/XWgT8Axtu5L8N0fsFYSu+U/4svi5Rfw==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr2470824wrg.131.1601309660731; 
 Mon, 28 Sep 2020 09:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
 by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:14:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl
Subject: [PATCH 3/4] MAINTAINERS: Add myself as maintainer of the Amlogic GE2D
 driver
Date: Mon, 28 Sep 2020 18:14:10 +0200
Message-Id: <20200928161411.323581-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161411.323581-1-narmstrong@baylibre.com>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_121421_965238_C1A34352 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01fb9ee6b951..400887118b47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11302,6 +11302,15 @@ F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/platform/meson/ao-cec-g12a.c
 F:	drivers/media/platform/meson/ao-cec.c
 
+MESON GE2D DRIVER FOR AMLOGIC SOCS
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-media@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+F:	drivers/media/meson/ge2d/
+
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
