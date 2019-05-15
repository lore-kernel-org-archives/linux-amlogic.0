Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500B3C04E53
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FDCB20881
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTpSYTgS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZJh22fk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FDCB20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oeq50+cEaYgv8Q2RMG+oUgOMTfrZCorsOEMxoePfgqY=; b=WTpSYTgSzSBXG5
	Kc6YUb5Xt4IfmUl8gvFCOHyJjoadioIzCJYoywkQcDRfS+HVhpyfEYBGE+FssUufb5FrCBQD58kms
	GZw5RwfBHMr6SbDDFWWs21iE5v+6bb293ox4to9huQUozLg/Hi+80QVDu/yLk6gJFt1+CHVrBVKDO
	T1bouIMiHQF6995zTvA6NYzshlkwsTsDocTClttYgCOPl5Z3bj6e0e2Fi7LHPvlnQpTpHIlt2rbXe
	kIcfkmK2bmqF7MxBhrRAqLdfGk29m3r6Rflqotb9HKAd/OGruTjjpMGO2JHkqk8Memy8aJD01cGVM
	rRIXFL81GZ/q/84ILH8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQtoX-0004Ku-PW; Wed, 15 May 2019 13:19:21 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQtoH-00043z-2l
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 13:19:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id r7so2621927wrr.13
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JG2kah723rKt+6zVIVINToTJ1x5sX35cOTL/TkyEYK4=;
 b=vZJh22fkqgxxzQYvoRgM2gvXtNWcFHA4w/ZhpXhg3KcO5ZYtjNKkseZoctyABSvJYM
 JNXexdB8b7YXqUh/5OWvK48RZeoIDCCWPoWronkJubu2sqLNjPQOW88bdogK8PEQiGMc
 zo18n9fcq58uSAzG5iop6qietQv3MER71K3ppvb1yVZfJU6VdcoOQw+MQJ5O8306Lvma
 zamrxMsrIEPwYPooRGHEPa8l06Q2BaP/8XZRivdDkyAdSFUNR7NzuEmlMhamIM5YXg0N
 xZpBDhwzk3jHq7UNVDBVdogplW0YEikZzTMBBfQpXXSVQWmKU8oFYxHSHbA6GbytzTEi
 Eqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JG2kah723rKt+6zVIVINToTJ1x5sX35cOTL/TkyEYK4=;
 b=tJy9WJSzYEGrZQ27zlQieZz34YkRy8+c2adrYGhFg6AZ3sXZkDmU4NR+ZcCrmfXk2P
 fTjdmuOkhqfQsxhyxFjzauZeap65Kxt0Qc8FTYp/vqxO2xMypbdRyIpNHkaglOwyKgDE
 lAYArLp1YRPqLR1ECJhjmq1TfzDkAU09X2ofHRpZTE00tAvRaN6tZoqAV7t6iRoT/g4l
 68MTc/uKmUa6xr2RE360sX7exQAWL24Bt5xFHzrylVWQ+Hhq3aeIJX6ChSs8y9erPf8L
 ROq2avjki9qu9DbioJOcPL5KN32QWwQ7gRBmqx4dqFKUkOkpJteLcZ238JCUywBPVrTZ
 QE/A==
X-Gm-Message-State: APjAAAW5+o8c9pQAv0nWdyfLBkqmoS4RNT7yER97cowWaBYa7muMBf5t
 vowJ79ZQWrvboOoiTpZnoEXf4Q==
X-Google-Smtp-Source: APXvYqwBEr5yG88UvIos7c0fJnIW12gLKqi73L00zTVXIyfiLBv41bjumlNMgrgZkorOKeNy3+7XIw==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr189913wrt.197.1557926342964; 
 Wed, 15 May 2019 06:19:02 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/5] ASoC: meson: add hdmitx glue support
Date: Wed, 15 May 2019 15:18:53 +0200
Message-Id: <20190515131858.32130-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_061905_737598_841AC428 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic SoC, there is a glue between the SoC audio outputs and the
input of the embedded Synopsys HDMI controller.

On the g12a, this glue is mostly a couple of muxes to select the i2s and
spdif inputs of the hdmi controller. Each of these inputs may have
different hw_params and fmt which makes our life a little bit more
interesting, especially when switching between to active inputs.

This glue is modeled as codec driver and uses codec-to-codec links to
connect to the Synopsys controller. This allows to use the regular
hdmi-codec driver (used by dw-hdmi i2s).

To avoid glitches while switching input, the trick is to temporarily
force a disconnection of the mux output, which shutdowns the output dai
link. This also ensure that the stream parameters and fmt are updated
when the output is connected back.

Jerome Brunet (5):
  ASoC: meson: axg-card: set link name based on link node name
  ASoC: dapm: allow muxes to force a disconnect
  ASoC: meson: add tohdmitx DT bindings
  ASoC: meson: axg-card: add basic codec-to-codec link support
  ASoC: meson: add g12a tohdmitx control

 .../bindings/sound/amlogic,g12a-tohdmitx.txt  |  55 +++
 .../dt-bindings/sound/meson-g12a-tohdmitx.h   |  13 +
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/axg-card.c                    |  31 +-
 sound/soc/meson/g12a-tohdmitx.c               | 413 ++++++++++++++++++
 sound/soc/soc-dapm.c                          |   2 +-
 7 files changed, 518 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 include/dt-bindings/sound/meson-g12a-tohdmitx.h
 create mode 100644 sound/soc/meson/g12a-tohdmitx.c

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
