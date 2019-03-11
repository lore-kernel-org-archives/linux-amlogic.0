Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C520206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4cZWkWk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GktK0i8w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C520206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dFV6UdK+FT3q+qFFhF9lhcf30jEhlYV3Haf+3ZYM5c=; b=H4cZWkWkhaVdjh
	Bv2KWPcCGMQN9gGymclnzNOQ2gWmqgFiI4Rk7NT4fHzOEAZ3iMAlKjvzilKRc78lDrXOjuoUix3/3
	lEo/ZGXdgmyrXNSupxLN4bTnQEYue2OCFg6NQU7NqZTARFGxJEk5mjZciBRraujS47avklfCQ273P
	SkMfK3oSYGG7VXFFc2nvhFgE3XijL9WlRdQydFaUGAvhQdYwWCvEVTbmZkUsOR/ZCgSSCnUjOu2XI
	TyVwkAdQ1RQyDlNKvvxFies3ndI+dQ8z9LiLUHeFSu03CPnbzcWrFS41xcw5qMtebiZdbnqZJJ1HZ
	KEDRp431aYX9f5F2nUBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HgE-0001Pe-0n; Mon, 11 Mar 2019 09:57:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfR-0000E9-7d
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id q187so3720491wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VvcECapshJ7XfO9MuKZr8qEVioYerHM8ByTg5+dctvY=;
 b=GktK0i8wbAW4DFjvk1wG9azjHTowgPf2vdP2xIJ/VuYOFzNOAokVyJcAeOf3zHUdtC
 XiPKPgvsDT/ue2DbdmmA3ydOk3w4Bwj3TZ2rpXcjRpVcX9P+4wMLkxOLzHsqcoLiMUHm
 QfVo24ubM3N9HEN249VCCWgK5x1CyiiFabyineQ2Pz1Gxg7MTmccHbbBbghL7TZFF8dT
 9+S4f46TRy12qr+RFSXjFcom9eRUAN2dJ+DuT3o0Fv4WKFC6EiPZPEzrDacLOESwla1X
 iaW8hjKr4Tq7/+/0+WV50QjgIQGd0pvCdkoQA1bUPVslU/wErQK57I11oGvJGMRO78Cf
 CJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvcECapshJ7XfO9MuKZr8qEVioYerHM8ByTg5+dctvY=;
 b=bDNn2+Rp060BX/RjD5kGpI9bxVjEmgPvxnGpW658N4oOkaLk9VQ2cTbTY3H7mUNjmZ
 gWhnjQYcf67PivhLf2Mv9lOlwbY2w4QDQ9aeMYL5gSLlCZ8wwypd+oNklDFH0p5wylcU
 mId7K/m3DEeCUXR/fJny5cNG29psfmoq5j+olnumbKmSBE1HLM9dyIhUtaUt3TTz7wf6
 HbZjkmzvjR/LZj/JXpwr/lk9eifSgFDeIuXPnf+gOzFWJgI/HAe8Rlc+utSEuQiQPENw
 hOwXcotvUhOVWDBSIYrmCR4RONRnIw4Y/9Nc3rj4j5wBqbplFZsrQEjJJ45Nr3m8Xaue
 w8Sg==
X-Gm-Message-State: APjAAAUGKh3m6x4BOLBSAkCUoveh9kZuXNlr9h0/JsfCfdxy6UXolqWQ
 MO/zwhSZBY73Ve/9tcPYVR9IlNEGkxb21Q==
X-Google-Smtp-Source: APXvYqxf7aMtO5JIx6vKMnx+gAwJjrEEuGxq/7YCEe/N0eLVwYPxzoOL8RaY1nJaq8VvOYBejFmgpg==
X-Received: by 2002:a1c:9e97:: with SMTP id
 h145mr16184974wme.147.1552298179415; 
 Mon, 11 Mar 2019 02:56:19 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 03/11] arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
Date: Mon, 11 Mar 2019 10:56:05 +0100
Message-Id: <20190311095613.11371-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025621_415500_F0513DE7 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add pinctrl on the always-enabled debug UART AO.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index c62d3d5706ff..0edbd00b358f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -25,4 +25,6 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
