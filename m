Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F776C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 12:44:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F55420B1F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 12:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="djJhwPKc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JrZ6jaH1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F55420B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jIckQn0IuzwLPkq7URodJObb27Rdfo8UuRUU0ax16s0=; b=djJhwPKctKBQ4R
	TarsZ2p5zSYD8C7G70ypB4Yyne2Jts9VUjFnPeIDLNFGAJpqUWRcQbmL4yz6fjO4p5HNBT6o6eE6d
	fMCjL+/fEWQ9Tijx19mgDe4+V8cm4Z2JkSSd2JvLtQkjZE/8LA2hczTPHsmtGvHmMPlC+9WVOberD
	5L2fiek/VERmGVQUehC+DTHrAfzNeP4BFbsjHDnMJC0iYXRLnzCKE3mLjAnC5Enbruwn+chAjw3S0
	zoJhMD3evh56lMMTacwoiVulP2KEnY94KwwjFyDssZ8Ybrd0dhvJg4Fkb2mrBAanQb8gnGySiqUnP
	hH8UDD0D0FqOLfynmSaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huypG-0006IV-Hm; Tue, 06 Aug 2019 12:44:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huypC-0006Cs-PA
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 12:44:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id k2so1900831wrq.2
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KO3I9isK829bDAzoIYhMJ5BHP8qWfbUOhOqwyY1Ue8Q=;
 b=JrZ6jaH1U8FIHz6Bc8fph0FiiWO6K+omU5EUJU4jjF30+ys1KQU3SZdTkQa3jdLrn0
 E7L1bTIc93b/aDcBr4funyN2HbaOOQUAE267YVC5GaaLCnjz+RM+FVzJYaATJfGImyc4
 r6Z/odJIDA5rFceLBE0XAZqZejXuLitKd5blVAf8H3urYm7jwPHgHTODfcZ95TA+PDaC
 cMRx3zSX1Q9811UjLuu4eddHynsPD0T53VLfp1zJFwHCtjukZZVpw8UERDQBYTmkMekx
 iEKyihqFLrtNAD0AeVEQsc4DtgbJxve5flvT1gYQRYBfikrDEVDcFYH4/Ghsmm6sJuJc
 OtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KO3I9isK829bDAzoIYhMJ5BHP8qWfbUOhOqwyY1Ue8Q=;
 b=ohRsk4/DaCVoUGMZq/3sIuSkMooPUYNnXV0oew53rwl/PLlWMMlDiAx3L25TgZiL2c
 46onXMPGk9sgjUaEtl+6UClxiEFhPPsLpv0tvOwf6nRDOnpwB4wqndYAPajMZGDKZlvd
 O+8m6k2lPTvvUE8g74RltPSZW7uuuhKiUgQw26w3FUXVGu2YZ1nf3+YO5MNVLOIrUgK2
 DhgZC5bwfOsIxteCzhzPfuUjfMqYT1PjxF72mL6UuZFoGbX9Ex3ClKB191/nlSr7Ce+t
 ue523Z7+D75rOjB81hZIRuDO40RMdnsrviGKSCSNUwimFbrPaf0j++IA5DKzoMn3gRy9
 HxMw==
X-Gm-Message-State: APjAAAXab6dCzsbe12jL/vYf8f/T03IFS/UtiA5j6EFxRwZTeTu4ZH82
 lIb9jn5MKGKqhBgRtPWvuhM32aaJWmDdBQ==
X-Google-Smtp-Source: APXvYqxzWD1+g+8j3XMze7/L/Id/Sa6g7GtYPAKutoXeGaVKKMV2UxVERxWGXrSeGKhdH+ieqhGhpQ==
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr4724737wrw.255.1565095458656; 
 Tue, 06 Aug 2019 05:44:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q20sm3842135wrc.79.2019.08.06.05.44.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 05:44:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v2 0/3] drm/meson: convert bindings to YAML schemas
Date: Tue,  6 Aug 2019 14:44:13 +0200
Message-Id: <20190806124416.15561-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_054422_996508_884311F2 
X-CRM114-Status: UNSURE (   6.40  )
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

 .../display/amlogic,meson-dw-hdmi.txt         | 119 --------------
 .../display/amlogic,meson-dw-hdmi.yaml        | 150 ++++++++++++++++++
 .../bindings/display/amlogic,meson-vpu.txt    | 121 --------------
 .../bindings/display/amlogic,meson-vpu.yaml   | 138 ++++++++++++++++
 MAINTAINERS                                   |   4 +-
 5 files changed, 290 insertions(+), 242 deletions(-)
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
