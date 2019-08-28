Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C8C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0922B22CF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eMQd3ZXz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="InyAM+eB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0922B22CF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hI6Jn2TkL1+myj8A1e8ZpkJPH6TLPN4WcI4dzra2+Wc=; b=eMQd3ZXzpb5t0c
	oYVZ0KdnCyvlGwTI+zvpkd66euvuVMI8k7FAgjv9ofLH0Op6aNJLAMu672dAipZnTXmBYgnUV6IoG
	Gyj0eEVWM/MVXR5V7D17CPYaL0ZEytKJgjGEcUuSP0WjnvowEBIzlRPDYlcirTBfn6GazmorvnFh3
	LhN6l4CoqxGDoic0kg8Db6M0d5BOidwXrym0Ekg79ycM+I0FoNJ3ILrCSbfzdPUSbe+x5x9Aear8N
	CmzbW8ohTmq3pEL2pKZ1GLNB5sbSH51Yr/4s3QMDrMtVHYlC2EAVPUoDRHwB/ERrXLPG8FP4zkukv
	jK9C+3QwmT+mwg/DtCWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ymE-0002kf-UY; Wed, 28 Aug 2019 14:18:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2ymC-0002if-Aa
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 14:18:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id t9so222244wmi.5
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UzxOv9a1WpCmhrklx86JwpkfaDfvwrG6kiqiVDTvh8=;
 b=InyAM+eBxP789KoA4ZICBi+cmdeIndVhj47o4LSbHLn4Fbycg6rBCQCRhzjRwisFL2
 pRGD6mbfhSnQYdPQ3gsHGvDSlrVTrgGj8vggeQkCJnDQjQwc1Y3InouJKnMiiZigl1O6
 ohHtZmvF6HKUX5HXz9UCe0b9BI4bkDItjqAa67MUfNCf2JheMOZiKSIsxmKP5nVGFfEO
 HOrBtIlTYLHCwi8akzyAQESIgtLN4ecMEFQJPJQfMlCZRPH+GK4rkniEPKz+nmq6VQqn
 AVRxJfrhyLPpGl2BH7w21znbHR3yYW+qkDPbB6sgToExYp65aI23lB+/0orNQgrk1TF8
 BkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UzxOv9a1WpCmhrklx86JwpkfaDfvwrG6kiqiVDTvh8=;
 b=iYvHtXcYJxxcWBe+VaYlNqDbuxWTF3drT4mJtEbvYdYjjTHpd/Nyob99MF9GJmvaXy
 eIMnVjNB9vGFrjoj1lQTpBxOS5/8JNncpOQzzF5daZsQqNNZMOwx+UtyYtCUsfwriJ/b
 ollEp3CfOlF66eI65fnKDU5xbhu40SNRGMOxUUx65+wtyw0pGil7788BZSMpxWhoTYSB
 vWWgBhc2p2c7QT5XETQm4YF1LvTsRjak/SWiJdbQdFGexniYpD9sCa6CEM/w0uGbmalq
 jxdQn/yrcsO3v6hJBopwmUukXfrU/akqlJg2d69CIFKoSHJVlox611M0cAe8bs104Dsw
 o9oQ==
X-Gm-Message-State: APjAAAXF2YIcCy0jTvcYkOajnR7QeBjVilPXjdwc5bc2A/CMqSvXO1qe
 4PpmJG4sfpgtteKjdcVhC95PNg==
X-Google-Smtp-Source: APXvYqzrySHRNxXc1/MJermkli4siDaCGLmKsgijOLkdZqypQgEKEf3uxKd1T4Y6b6UUSc1TCpEf5w==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr5430764wmh.116.1567001898683; 
 Wed, 28 Aug 2019 07:18:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u8sm3022354wmj.3.2019.08.28.07.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:18:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 0/3] arm64: meson-sm1: add support for the SM1 based VIM3L
Date: Wed, 28 Aug 2019 16:18:13 +0200
Message-Id: <20190828141816.16328-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071820_369883_4E615960 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Amlogic SM1 based Khadas VIM3L variant.

The S903D3 package variant of SM1 is pin-to-pin compatible with the
S922X and A311d, so only internal DT changes are needed :
- DVFS support is different
- Audio support not yet available for SM1

This patchset moved all the non-g12b nodes to meson-khadas-vim3.dtsi
and add the sm1 specific nodes into meson-sm1-khadas-vim3l.dts.

Display has a color conversion bug on SM1 by using a more recent vendor
bootloader on the SM1 based VIM3, this is out of scope of this patchset
and will be fixed in the drm/meson driver.

Dependencies:
- patch 1,2: None
- patch 3: Depends on the "arm64: meson-sm1: add support for DVFS" patchset at [1]

Changes since v2:
- fixed patch 2 subject

Changes since v1:
- renamed compatible to khadas,vim3l
- renamed DT file to meson-sm1-khadas-vim3l.dts

[1] https://patchwork.kernel.org/cover/11109411/

Neil Armstrong (3):
  arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi
  dt-bindings: arm: amlogic: add Amlogic SM1 based Khadas VIM3L bindings
  arm64: dts: khadas-vim3: add support for the SM1 based VIM3L

 .../devicetree/bindings/arm/amlogic.yaml      |   3 +-
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |   1 +
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 355 -----------------
 .../amlogic/meson-g12b-s922x-khadas-vim3.dts  |   1 +
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 360 ++++++++++++++++++
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  70 ++++
 7 files changed, 435 insertions(+), 356 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
