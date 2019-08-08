Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47128C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 191612173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3GlKgS+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PeVELfYv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 191612173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMsv25dmAxMZWuYx1aQwBlrKnt71GOl82aiosRsVRTM=; b=F3GlKgS+aCi+b6
	Au+hKekb5EE5tDIU432BU7geyrXpqzpUHBoh2jzvNuqS5VGyXYYlqiEPE+JoJzZp5XFBFiAutI9sr
	cw6Fiw8p5fS0adVkc1rwX96nR4shETeh4iG9LMBrxtOnR3qNik4L9SRTfmrOg/gZhKmgZSVq1yVbx
	0AH9eiEglceAkhFzSK3Xv2Rs/9xYnjIACviG6NWtyMyI1IUctN0h8VY2/pZBwkqzLXWA2dAGPR58B
	wYStO8JSvMM7upAHSwp36eaR83Z+fnDmWPqBNFBFfM83wdKa2A4rnNok776FUafTJYj65LnBtOpG1
	fSEGqpnOfBeFZfetrRgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveD9-0005E6-Mp; Thu, 08 Aug 2019 08:55:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hveCm-0004sK-GU
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:55:30 +0000
Received: by mail-wr1-x444.google.com with SMTP id x1so44186168wrr.9
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=PeVELfYvvyjsx6clfPeEV6Kyb4FSgsdGONpfUp+mhUWbRbE6lOwzvPOuOzghkx6UY7
 sV7OyXvLbqZR62Qbpmmw4l35xC2kfWcUBQ9+I1cBzj0J6TbruWWxPqzkzawHAzd3dNDq
 LSGhY2wEMrRjIPBV4X3wMMXLBpcdLvif5+dTdz4KVRvyQ7ytn1UF/bgn3kkRGHH7e4T5
 YsHJvm4sGZLQmwtl3c6ZDriwhEv982T5LMZGUnye2w1eT2zjbfINQ/MNb8q8VQ9+jPuP
 epUB01MA29ckMpujdwib4vSG15vWT/tXHrpAh9yXYq7MethOMhpCYaazti6CrRejYT1v
 F2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=cEqlOh1/MmZf68ho9tKwFy6vwP0zjkETSWvG5u8fmAwgGKe78gD9kIAwJKyXDBC3qi
 KzQTHeeW4DIy6gyBWT7Coy4watkHBJ/+91+eQfq/Lv0LZWIjCXNXGoCp7eXXZS32frK5
 rOAUYL8lCwrfvhwsO3Uv8VfIz+Gtu6WH6r+x90Qpp0sfWCVk7wBvVFZVxkwpE9U3F5VM
 L3X9FhxzWyten3efVLTcJJ5baumndDPZZcJLbypzq3210P0gGdp4hCoXzoz4Cel2JZgG
 PhhuRK6s8SYuOrz7ePvrc1ZeW5Xy7xiD+QLcnSvsd2kUQb/VnlNUYRoqWVroKewfxUFM
 Tryw==
X-Gm-Message-State: APjAAAXTxiLQF0gdBflnjjUHhQOix2Anu/hzziDVRdVBmXTSnVr3e4zD
 jfYeGjQksya7jHp8/4rcmw6bYQ==
X-Google-Smtp-Source: APXvYqx4HZQxEVZ8L3lNTFhLUVF9yFAHzskRwJoSI/HZlrCcCvMyPu5yrg2yl0ii5Hl6FetDC3yEvQ==
X-Received: by 2002:adf:a348:: with SMTP id d8mr3321352wrb.235.1565254526837; 
 Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3380649wmi.11.2019.08.08.01.55.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 3/3] MAINTAINERS: Update with Amlogic DRM bindings
 converted as YAML
Date: Thu,  8 Aug 2019 10:55:22 +0200
Message-Id: <20190808085522.21950-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015528_718343_66B475DC 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The amlogic,meson-dw-hdmi.txt and amlogic,meson-vpu.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f0..c55c18531cd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5318,8 +5318,8 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/gpu/drm/meson/
-F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
-F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/gpu/meson.rst
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
