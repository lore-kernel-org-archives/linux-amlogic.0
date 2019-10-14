Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9316DC4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:32:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6406420873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a96O511o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dZWm0bOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6406420873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Kwwr61yyu9esZ0HKWwYvOlt9lfTG9I3kx7Zq4YiscWw=; b=a96O511ot2V+RHYHiOGRsB+rWS
	WClsZLmOzXk8bENuy8xWFepQaa4OUwJEinQOFg1BvAMahWY38UvVLCSPKQTpy7RvrtzsbMPnustUr
	IlUB4T17eZ+vCVUMQ+7QP7nF+MBJzqPLXSdmUoXCi5pPnC7s/Z4EFYu6MvR6jwlpNz5V8x+lu2aHl
	gRihv0UOisFt5hlVRKEJ7BV/Apn2SWWXLEs68cnOixfzVCBreNQ428bNxoLQtK/pA8ejQEGCKwR9i
	Aunt5H1/GvxRdWRI9O0oO3jirmgIKVLkgqhqPmEugB9FdDFtQkBliNoW3q3WkmD1xPHsA+hQNCY3w
	xECf1DwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJsy2-0005H1-6g; Mon, 14 Oct 2019 05:32:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJsxi-0004za-RO
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 05:32:09 +0000
Received: by mail-wr1-x443.google.com with SMTP id y19so18054695wrd.3
 for <linux-amlogic@lists.infradead.org>; Sun, 13 Oct 2019 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aiibnLb4ztqM4McCZf8ivuH47sJDCIoIvUY8u0wjWw8=;
 b=dZWm0bODxvVtd4jc+Sv3HEOR144u2b+ytObS+iiHa0aWE+7M86xnmZ1BQr3dL+y/R5
 I3dg+hkyPrT1CpIWzSYqJpSd2Nma1oDXyroJNgsTMmgMCkg0RNvghA5OatcRKRamhlAR
 ouV7VuiYPwRstXsmzg6/QPxOItKOWp87NucpAz6f83jY+B6Y1eUKdhamcDg77ueQ493/
 0KDj2K41P8eP9KCnV1adMmDtKATMNOaeUgxsv9Jn3QVk63xzvDSADv9g8ZCV1v04pB2p
 XPD1uo4Vb30Uss7PrWno0cArt2kbvguVeN+qqYP/D068ydIxqj7ohAYke5/KQ/WZpbQP
 DImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aiibnLb4ztqM4McCZf8ivuH47sJDCIoIvUY8u0wjWw8=;
 b=qTUlM0/UmvY22I5kGwwkvCZ1K8B9UQiYwZ+yq6kNuavMx3+YPiVoh8XkROb70hfNtF
 rnwPey3C3sRKAzLcGQvZI2J7h0L3gRgUlf8eanhoa37SgbTUJCQLEaD34Jl0gD3BYt/v
 JrydY7p1ZvKUok9FZDJzRfx8DsbHiVQHiSWF8CijH0cymkbxandE5CAKpyjtKOGIq1nr
 p270FZ9jirck0EhcKwoamtYFHhteuOTXwC+28DPv/xC+tdiZWG8Jad3yGkx0TrwjO7o6
 4bJoPWRslqG20sLgzQDRClp5LFXILT3LhPu9cgO7/wbylzeaT+tPl/LlgkeRJn/Es4sp
 wmtA==
X-Gm-Message-State: APjAAAVUNvo4vf0OL4gKMwI5OAVhB3JnFMXX228FnDbN903Ig+Fg8x6u
 ZhTsBZn7vu8JrswBtLx/ZKiITQ==
X-Google-Smtp-Source: APXvYqzwgYyla5i+WdGDH9uV7L7OrlHDKcef3vSlLkS/1w30Ak08EC3dys/X03T3BQUy1jWogl3vYA==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr9280068wru.43.1571031125748;
 Sun, 13 Oct 2019 22:32:05 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id o18sm44238772wrw.90.2019.10.13.22.32.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 13 Oct 2019 22:32:05 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 2/4] MAINTAINERS: Add myself as maintainer of amlogic crypto
Date: Mon, 14 Oct 2019 05:31:42 +0000
Message-Id: <1571031104-6880-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
References: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_223206_879530_A862D782 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I will maintain the amlogic crypto driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36c5d6ee01f9..a8487a0999ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1477,6 +1477,13 @@ F:	drivers/soc/amlogic/
 F:	drivers/rtc/rtc-meson*
 N:	meson
 
+ARM/Amlogic Meson SoC Crypto Drivers
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/amlogic/
+F:	Documentation/devicetree/bindings/crypto/amlogic*
+
 ARM/Amlogic Meson SoC Sound Drivers
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
