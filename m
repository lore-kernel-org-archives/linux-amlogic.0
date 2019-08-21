Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCB0C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425C222D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ow4VkgkS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lnoj50t8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425C222D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5JJmc2BEOBAy+tNiEO2W9e0WcizTt3GETt4eo8Zyao=; b=ow4VkgkSGd+6Aa
	KgzjWE3oJKhreQVJHkiSkQYoil1xgmG0+U1bdpnU1Z7k0bORKlv1PFYkjhn3PxiXOV5SG58i2pID3
	S5Ps07h9tdVjkAABfZVhzFexC/fwwmHQA0/sXfHkMa3LVYdvoj9/1FcpntJ4cQwNdIEKqEz3nKKVZ
	PXA6Ry5L5LjBFrs/2O8KwlVeNm63dOlk7CQwny+8ChyJj3VzQE6nTqwC4RtvZ6KUgrXpwPL3nF04x
	e0UFkoa5DgQupd3HxlN4s3EPtpbC/iLrqj+E27VCwKi/377QxnNAmt7lHTu9PYzm/Pxev5luVY4Z7
	l76/PjsLfWcgbH8DiaZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RXM-00023n-VF; Wed, 21 Aug 2019 14:24:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RU4-0006ts-DE
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id p77so4891778wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BE56XeKlPm5JVcX8n3q5JNmJvyUhg1qETHFabaUvyfE=;
 b=Lnoj50t8bQ9bDRMRR2IVG3gDVVz+yPL5PUmwgYkRrDAf0BGZeBREwDCBPfdtWm9kBP
 tEDTpaYnE0C4mUW0R9BIBlTErQRUZ8IrJD7PcDvt4AlcV9EgfqSbelBCYHeEuFpUauqe
 OYlhTKrQLsz0bJBai3GlKXpR5/+kvGBQkw0mdQ0192//87LcnM2VaXxhPK5JzM4RxKcB
 O4oYr6/w1yguRxm96R0vxzXmCytT6V1e6eolbuH5KC7HvX6CybmVRKNzz0ZhfoXhQJfc
 FW1kCS3hd55lfc81CQv9KTtvkpS20Fu6j4qrhlMDGtBECabUJPAQ67+mboPQqUA2tqcn
 QL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BE56XeKlPm5JVcX8n3q5JNmJvyUhg1qETHFabaUvyfE=;
 b=laA+lf862vKstSkXQhM6BhBHTKjP/biSyP3xmUKs+xFafPSgu1WN2z2PwRM/4C9ssu
 z0KsME0n2GG32TTJ8O6FHZhUrZoLaQNGY0QcGM93ln4nZrfasmbuz76KZKO2f7r/d2EQ
 N17IWQc2DEW3u3zZksXl1JbxvVeQtwRUWiijzL7hqZMD9Cho/tTmfWDJ8vn+fZMx+bHf
 oGAIErCQVTiQwYUB4kmtwnkSEl/f9DknlejrrESLrbChMiXTHLV0fWVjqMXtXimGk1RS
 9U6OXotQmjFo+Rc1vGlgXR2X74uQIe7lNcr43pS7K+CKRC4VazBxi9MRcJKgVxyBInP3
 7Ayw==
X-Gm-Message-State: APjAAAUy5hysIHdOIA2I8/veDuUpkMi4yWPtlomQzJBu4PM0d0wbIwT1
 ZJNeNk0I5KKUO+rlVE9bguGcdA==
X-Google-Smtp-Source: APXvYqzuHs2peSetC63p+jjntS+Mxj6i8Ywj33/Z22DI61wK6k8o4lDfUFeda2o6zo5i32KR9FA1Qw==
X-Received: by 2002:a1c:6087:: with SMTP id u129mr313661wmb.108.1566397266758; 
 Wed, 21 Aug 2019 07:21:06 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:21:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing model
Date: Wed, 21 Aug 2019 16:20:41 +0200
Message-Id: <20190821142043.14649-13-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072108_612281_B9748E5A 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index c34c1c90ccb6..233eb1cd7967 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -10,6 +10,7 @@
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
+	model = "FriendlyARM NanoPi K2";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
