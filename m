Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E160CC11D2F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2E7C20836
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E30DJJX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kCBMljJD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2E7C20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W8e9QdwpVcr9jxzTq4dMJ1QXsme5rL+Lamz9BNDOv5k=; b=E30DJJX7hN+9zj
	hp85mmjLevprj20YdOYRMCF6xWLGbklOG+2zpwGcEFz23LNDd4g5sY3o8zd2jVLhZv4t0pW4/bw8c
	eMcSqUWOUuWhRtLAhoeHa27Au7Pv1uyOUCtcnCRQ1JORnf+M9T0j2q1g4Yeq7H66/I2srN2sQ4V17
	mXrNq66pIpzlOlSYoL3WnQzVW7FFGAKUD9wr+eUfTIN5aDxfCxoUVMp+2+//duoIPOwS1nA3IJ3r9
	1h5fPHxC3vxFVkypBIAaYfdKizDm2g2+DHNmWFefGDE52j9RHSmlrmdFmJS0UM4pkuXPx6wuAkDLA
	vaDgWYqbM5hZi3ndVg4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FBl-0003t5-FC; Mon, 24 Feb 2020 14:58:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBh-0003sB-U5
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id r11so10725554wrq.10
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7uc4ZyvgI1jMGXCbWtx41AYJ+mfMjeXR72GJNbpY18=;
 b=kCBMljJDgEXgQJtO36JYtqdY47PYaeQkiZClS+0usrj9Ixr8jvPES+3Tw1jnf6PdD6
 gwtvcqGKHWH33/s0vQLib0EDKaT5CHV/OjJIteuVTGT4KTEOqw3LM0DiJ/p2f/yGr+RQ
 VYtjCQA7tt6yi300wdDWYyCJhxRYeBtXGKfgmMn4eJoAtnMBgQnXuGyT4lXBRO6aZ7rD
 BR4ND1x2j7TL0Qx91QSTWUHXexmtfFfjwfok5+myttcA7hmC36G+3Zkuwk0JOkv4FwGf
 00bm0cc7zRkFA3kyAr2J0Xoz/XgKb8Y2ukc8jM0Z5pNSgmTJNRidIK2ixISCUYdRXfQm
 CwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7uc4ZyvgI1jMGXCbWtx41AYJ+mfMjeXR72GJNbpY18=;
 b=LOAQJvAPjZrz3k5OVvfdrNgaT5Goz2dUYJwzZmlLAJ8pzSUj0tafOtsA6i/iTqSTPq
 O39XU1Nkgj3zsFPF1jYH0dwbKc1e/nHB8UA+lqxUfEhtJKoz8IJV8nnyuyrXefZKV3ig
 4UJyppqw7jPPJaRaKB2+lCCKEDbYew3bYBYvvi1mx4dq/OjypJ68O1jojr91jP+kDTCb
 NBIUb14RBVFI1x6ipOCpTmDDIrM/rOmtBX3zW395ZaZjm4Cjfk29hfAZeAK0Lg/AmSYO
 LAqr+uI/gAWxOvp2HZS88hM36sDUk02hWzj1iQqjljEVGvzYsqNtZFcIrMtB7swXR/pk
 3Wxw==
X-Gm-Message-State: APjAAAUPFY7BzovRatwBvTK78K0gugP/UC1PMdxviEBCUMDgKiggKW1P
 jdfdn4jaCoajY0OmyxVBlNKKMg==
X-Google-Smtp-Source: APXvYqzC5ORHBrCQFw6rGDHx95H9wgru83TXeezmJtNlw/dwPrwN5bmrRu/47VMppijs6JSo1frU1Q==
X-Received: by 2002:a5d:6a07:: with SMTP id m7mr38410390wru.332.1582556304185; 
 Mon, 24 Feb 2020 06:58:24 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/9] ASoC: meson: convert dt-bindings to schema
Date: Mon, 24 Feb 2020 15:58:12 +0100
Message-Id: <20200224145821.262873-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065825_972918_BE38ACC8 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset converts the amlogic sound devices to schema.

Jerome Brunet (9):
  ASoC: meson: gx-card: fix sound-dai dt schema
  ASoC: meson: convert axg tdm interface to schema
  ASoC: meson: convert axg tdm formatters to schema
  ASoC: meson: convert axg pdm to schema
  ASoC: meson: convert axg fifo to schema
  ASoC: meson: convert axg spdif input to schema
  ASoC: meson: convert axg spdif output to schema
  ASoC: meson: convert g12a tohdmitx control to schema
  ASoC: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 111 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  79 ++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 181 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  84 ++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  77 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  92 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  57 ++++++
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  |  58 ------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml |  53 +++++
 .../bindings/sound/amlogic,gx-sound-card.yaml |   4 +-
 17 files changed, 736 insertions(+), 357 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
