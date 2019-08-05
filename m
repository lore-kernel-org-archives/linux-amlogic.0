Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92753C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6644121871
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mGUECfmu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vUJfOghB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6644121871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LweXNunsp9PLDSFctCopeGzQkZZZWKDL7QaRxbH2uso=; b=mGUECfmui1Tkm4
	j+jJDYuk85oHArszrV6bHNvEYRKAJ7C2HPdbWNuvOrRwkCL5OM0xCfgy5hL+KbDyjiTI/VW+8Bvrv
	qBIoR7/nWY7OkHdRSiIbmexdcYWIPpigMvRbmz+7CGRZ6jBK+132t9o/wtkNh/vURNlp3Gnz+nbgX
	sREgnAWkluq2Mf7HjHmUdZN+hG0Ir9nTb1JDUBp3beFlrxvnZDXvBIZ2vq5WvzhUVuuPqe+u6EOhn
	XLd3thh0LRHuwG52uwdT2sCTATuQd9gRgsocyV4ybtZNg9Ztj8Q0B5xcWXzdAJc60CxGqlxOloMAT
	WJI4VVSa+9c2CGHyXG7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudGt-0001tu-1D; Mon, 05 Aug 2019 13:43:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudGp-0001p8-Es
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:43:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so68960547wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhUROw1HvhUxcOE9NaUVqqed4sa60oTqgrJfdf5Zd0w=;
 b=vUJfOghBWCqqLATCC18WkSf+axtMpfn3516CSlWGv8IM33ESEoYS7LgHT/JXThmFV+
 R50C/1ljsKosMRkum31NKzxE5GcDf1+cS4PqPboNZkOM842UqaJBkA6t+fVzr5B7cSw8
 XrDB8nUL6WKJ6Mv3ra5McwOCZvYWzVZDnZVLE8WfPFCysZiJfbQgJUiuCEnGzfFunNoe
 wyO7bkgzybB1vzbiu5vUMKJXNhS0d/6ZypXY2dk8Do5vE1HttC9naKxVdJJ53oPBMZlL
 3WC8lqxQs75xql5XaRGCWP6WetYgx47N/5VY5WQpugIwIDIdpTY4OBGqzyq6IPkpqlYQ
 MNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhUROw1HvhUxcOE9NaUVqqed4sa60oTqgrJfdf5Zd0w=;
 b=fGgyqObGYQULavm37Vqpk3W9wY3IZATFpfBiZXuLmf3G5X4Oobek3xfLx3qSYVKuOH
 3WmHIBrcPUsmIY+Z7+g4DbMtoV9Vw3j7b0LHX1MWJ0M5AcUvLl+41hduZgTslxt6Lzuq
 QK7UkIhRXQA6pMU4Gm6CZXKCT271rHk225TpWci70E9TGUbPKw3l5BoTe3Y86RDKEEcK
 +BYPvqROtaqRSb5R6vAbEyvb9avTmUuEnjnq0cOOAeD6631Kxz6SvHyaA5QUBz8R0Hl1
 pO+SAeEJgFT7LO3hqoXldi2d9vhoswgEQsZctzH3/rjkc8NDpB22t/bx8DA+kUZSL9Ef
 NMFA==
X-Gm-Message-State: APjAAAUDiEmk2Oi+pCkVjRy01o4IkiItf5Bc8BXzWVa1nvpFGbIjKo6y
 fiIf+tVJdeVRtY8mLFdLWttZ/L1LIz7pTw==
X-Google-Smtp-Source: APXvYqwRQ8LTdh+aO2Wutd286Aw3WmG2Oy0ABsRw8fE9gC5QuZErdhrI3Sy/Vj9G8jN3TZSG3y4rYg==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr18523606wmk.92.1565012606039; 
 Mon, 05 Aug 2019 06:43:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t3sm67835842wmi.6.2019.08.05.06.43.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:43:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 0/3] drm/meson: convert bindings to YAML schemas
Date: Mon,  5 Aug 2019 15:43:16 +0200
Message-Id: <20190805134319.737-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064327_612179_B6D3A19C 
X-CRM114-Status: UNSURE (   6.55  )
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

This patchset converts the existing text bindings to YAML schemas.

Those bindings have a lot of texts, thus is interesting to convert.

All have been tested using :
$ make ARCH=arm64 dtbs_check

Issues with the amlogic arm64 DTs has already been identified thanks
to the validation scripts. The DT fixes will be pushed once these yaml
bindings are acked.

Neil Armstrong (3):
  dt-bindings: display: amlogic,meson-dw-hdmi: convert to yaml
  dt-bindings: display: amlogic,meson-vpu: convert to yaml
  MAINTAINERS: Update with Amlogic DRM bindings converted as YAML

 .../display/amlogic,meson-dw-hdmi.txt         | 119 -------------
 .../display/amlogic,meson-dw-hdmi.yaml        | 160 ++++++++++++++++++
 .../bindings/display/amlogic,meson-vpu.txt    | 121 -------------
 .../bindings/display/amlogic,meson-vpu.yaml   | 153 +++++++++++++++++
 MAINTAINERS                                   |   4 +-
 5 files changed, 315 insertions(+), 242 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
