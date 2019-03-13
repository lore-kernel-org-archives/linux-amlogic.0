Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF44C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269412147C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAAWafrn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gPh/b2mA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269412147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex0ujKmCulP/7YGq52rWoiaypZ1Jy8EB/jsbIzgRN84=; b=nAAWafrn7xO1u8
	AQvRg0ob4Q7kSZ2MNIHMI/MQPnxG04To8e4MKTdFhVIQWmpbkkoA4K1b0fS74DKVyCSYY5/1YnaLC
	GB9mLV5CpOJOGBDl6yleI9o0tbQfzt3AjYnZ9LkDxfwfHGLDuurpI4t/vhOv4aYksdbum/wjOusoI
	UlN2ITtjvhrODynuIdl2Unj0ztEKbyov1h4NJ1GjQE6iB5AV13IpRc0hkw7SwqIdfeHDwCqy9Xdvp
	xiZZuLQ8ZDBbwhYkT8qzze0qWd5/+ffj/TZLPqi9SV/f8x9GxkMM6nvJdNJoCuIIZEFN0ISg7KtqP
	FzvhKRHm7kWL3/5VQJag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44bL-0005qa-2Z; Wed, 13 Mar 2019 14:11:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44ad-0004pH-Ks
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 14:10:46 +0000
Received: by mail-wr1-x443.google.com with SMTP id g18so2182184wru.3
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dFltVTTIBZgf7EPxKhmfyxB1paniCagV+jr7vZ0xeU=;
 b=gPh/b2mAyu9iIO8e5FmSEEeNsZU+k4ABUhcz6taosG+W/43FzjuesTbT/xbF8LG0N3
 +d4b+8EwFQYpBAXYQhd+v0QqLYUZVxyyynrM2WGQC60Uc8OYYs/Za6hBBodbfC4eqwat
 MbJU2u0rPmFEHGonKqXvvD40Xf8LkqGU8xMI73ZIpS3Z21LjzQwpcSkP2whiU8FcrUPV
 0hNU4lMTzxaO4V1nxI2+PHdz4jB7E9TAmv7MN/hi9beLMDl98VNCYNcdVoEXM8b2Kdm5
 rNRUu6zwkLi2niw5TmPaxzOXbKlWPguJarqxiL/mNKR2zEdXpKMIQs3FUN/yRctSJNCA
 hDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dFltVTTIBZgf7EPxKhmfyxB1paniCagV+jr7vZ0xeU=;
 b=LGC3HZX+/wDjK7Kk40LR4XBBiz1mfsCQNJSk8n6+lOGnJ3B2mWA2FiRRgciVsPuWHj
 SJtmTjy3djxByDImh1F4t+3az8vkslsQrj6Lc4e+KCm21KfvwOtdi1L1Gfs+cPNK+eEE
 LjyiLiJr2zXY6dA+1WKjy7WTKokDavHoeK8leOuWTBBITWM7A5jQCJ9l6MdMCveIows5
 2YJz/Q9yp7dPJoLlFlE/jAIOAk9+NJC249TWFSm8h9R7WEUZnhOZwtgRvUwXGWWxUPRs
 BO1aln+HSJN4AIve4vgCWQXaCSu++OHutN1FprWNSHS55xA3s0Ky4rr1hvx/5mxH86vT
 MwSA==
X-Gm-Message-State: APjAAAXtzV+AJ8SM02bOHpvpjuMkJCd1qIOgcE+yFx6mXM+7mmPm2umT
 UCnSLJb7rIhsSuaGp1WAcIC/+g==
X-Google-Smtp-Source: APXvYqzZZRuTFtwlSlR1qsDLjb0r8Rqez2To1LrA4h6BhkSGzv/axIEFgfSG439pWnhQot8ngreNSg==
X-Received: by 2002:adf:9cc3:: with SMTP id h3mr26711989wre.47.1552486238169; 
 Wed, 13 Mar 2019 07:10:38 -0700 (PDT)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u17sm37300087wrg.71.2019.03.13.07.10.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Mar 2019 07:10:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: power: amlogic,
 meson-gx-pwrc: Add G12A compatible
Date: Wed, 13 Mar 2019 15:10:30 +0100
Message-Id: <20190313141030.5958-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190313141030.5958-1-narmstrong@baylibre.com>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_071039_991397_01732A93 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A has a slighly different Power Control, but uses the
same address space and sysctrl registers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
index 1cd050b4054c..0fdc3dd1125e 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
@@ -16,7 +16,9 @@ Device Tree Bindings:
 ---------------------
 
 Required properties:
-- compatible: should be "amlogic,meson-gx-pwrc-vpu" for the Meson GX SoCs
+- compatible: should be one of the following :
+	- "amlogic,meson-gx-pwrc-vpu" for the Meson GX SoCs
+	- "amlogic,meson-g12a-pwrc-vpu" for the Meson G12A SoCs
 - #power-domain-cells: should be 0
 - amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
 - resets: phandles to the reset lines needed for this power demain sequence
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
