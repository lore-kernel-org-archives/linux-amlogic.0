Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A8DC04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B35216F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6ABShm2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a1B4CJaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B35216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nj9fAdy+RL7XRjops3LQYvCDVeFXB7MTEO4/LuyHhpc=; b=Y6ABShm2ODJNnY
	XVCPVxJyVHVRvUUjvNkplY9rmq/4SCN2mE2ySHAAkM6c8F6uyY027slbpaHUcf+RFo53U4MR+i2j1
	G1cXyoL6JpPkteElA5ZB2M1HLpYaLnHHgPUADeDAijcKis9ChQyMUXzqCCNSUBvEI1vq8tih4FBok
	qKJWxB4YeM/KEgk09yatvi+lAx7v7IVe6cxx5X69M9Gp3XZ7FmIkfTHIyPM6uK9v7tNZxH/Lr9Jb4
	i/8FYGd12Zy18gm4EqfK7ribVnugmtKgWL3ahlQUNeUcCrhWy/l6xTsuWAqchFZZr9f/NTBkWCB/b
	PB6OAvejHsOlNmzvv/ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQYOT-0005DE-Ux; Tue, 14 May 2019 14:27:02 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQYOP-0005B7-Op
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 14:26:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id q15so3061554wmj.0
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xo30xwvbJA7vC66mclDC+YHAOBu9mjboSFr2MJ8sIkM=;
 b=a1B4CJazlurgVaQLDCYH/QOGHp+/p5etIFGptl1W62ONAx6U3RDXJXTKd2M2P39Gek
 aFEKW4XmW9mBars8x0oQfyOljHLaWGC3IDMQxIe51gkJ9nBLU524QESKxwDuoeKdmPd0
 i1wzZnfEtllMr7ZKgIgeJRk7jgAv01EIsOjwPZiQ9+D9kEpqdtjQO/crlDsp39WkskPF
 ybRAUTiYNNsHQLl6Mi6TKidPWJnX0yRwg93HPaiwF6raYh22p0LpMN/rQa3/o6tg8BTK
 VS8uNVsuXMvp7E5B9EOV9QHGUEnAwI2DuN7nqHRFovcdQrsJZwTAnu3mJJoY/PEFqUEh
 W/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xo30xwvbJA7vC66mclDC+YHAOBu9mjboSFr2MJ8sIkM=;
 b=riSQxmKyvHEPaBkZPFxgUTgkuZaSiTIal+OTe4PNFAi6y8Aq8PF0R+nHMJOkx5lzuc
 50VjokD63tDL70mcTjndk/m5Mg9PDR/VDl5diazEzyb5G3XGc+BwooYjwp0hhberjPa3
 HEe43YYGEDLvKx71A7iuAPOvKFeyj+e/I6lSF1E9k8LTxxAfPHwniJY9lDX+3AmbvBM6
 sEldiyZz8H2cStFLGygt30ZQtRp9yrupnrxjnvWdQBOFPdON+Jbk2oKA5Y1D1wLSZrxn
 1PcxBrbNqa82+ktjWWGQEB+PTPL8sp7jruAUw1RTFxGwEL6Rupysr4MyHmekoVRnKTGj
 cJdQ==
X-Gm-Message-State: APjAAAWIwOGVo+uW/Mtc1i+zETSBBEcHWMPS69qb3zxHfFIMoWe2pv4B
 VsBkxmCi1cnLpQt6BqUkLyA1Vg==
X-Google-Smtp-Source: APXvYqyxM8SBZKfuvPU5hDHnz2X0CskNKmcHoNnyDsUoWSQq5AQWOIwbyW+/3fdboHLdg35Qv7soLw==
X-Received: by 2002:a1c:7a12:: with SMTP id v18mr4071578wmc.69.1557844015433; 
 Tue, 14 May 2019 07:26:55 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm12343642wru.52.2019.05.14.07.26.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 07:26:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/8] arm64: dts: meson: g12a: add audio devices
Date: Tue, 14 May 2019 16:26:41 +0200
Message-Id: <20190514142649.1127-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_072657_817229_82786274 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds audio related devices to g12a SoC family.
It adds the clock controller as well as the memory, tdm, spdif
and pdm interfaces.

At this stage, the HDMI and internal audio DAC are still missing.

Notice the use of the pinconf DT property 'drive-strength-microamp'.
Support for this property is not yet merged in meson pinctrl driver but
the DT part as been acked by the DT maintainer [0] so it should be safe
to use.

Changes since v1: [1]
 * Had missing axg compatibles for the fifos (one last harmless change ...)
 * Fix a few underscores in node names

[0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus
[1]: https://lkml.kernel.org/r/20190514111510.23299-1-jbrunet@baylibre.com

Jerome Brunet (8):
  arm64: dts: meson: g12a: add audio clock controller
  arm64: dts: meson: g12a: add audio memory arbitrer
  arm64: dts: meson: g12a: add audio fifos
  arm64: dts: meson: g12a: add tdm
  arm64: dts: meson: g12a: add spdifouts
  arm64: dts: meson: g12a: add pdm
  arm64: dts: meson: g12a: add spdifin
  arm64: dts: meson: g12a: enable hdmi_tx sound dai provider

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1233 +++++++++++++++++--
 1 file changed, 1142 insertions(+), 91 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
