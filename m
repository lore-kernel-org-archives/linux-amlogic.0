Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DA5C41514
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B322190F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5puVlvi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jITz/uDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B322190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mKAbJlsQaQJ3lSwJUNOBPI1VYeW1aTa9j8Wpvx2hPjQ=; b=V5puVlvij64MIK
	bPypqNgt72C9IwlHvuTvcdw2KbG4CoGroMK0aYs4huIs8F7FCDpivrsmVnL4QRHabBQLIzHFPqRhR
	frHIvIp+ltkDiekgI5WSId9e4LOmy/fsqSoUtfEJfvIHtSOtt/DSnHQQ2R0zIoiYfcbXZixyxclX4
	6NXwcUDEpmco3XRkEntTQ9rbxygLIcD9uV5rxMMT4zm4EwtXSkeT9vmvLR96FcifSlfbZgG+hvezG
	sIfA50IvMX04iWrEkY8n+ZuAb4ueEOVjvXTvO2xm44H+iDCU67pkCRmY0WynjdeOSSqLomNovBHaT
	glnrxXqqn5JCbCm019GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqK3s-0006ty-0h; Wed, 24 Jul 2019 16:24:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqK3n-0006rP-PX
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 16:24:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id p13so47623476wru.10
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rscQz3KUGOpkCDKHMcXdQe7Cl/GoBVV86V2E9kxxK1s=;
 b=jITz/uDE43k3A8NB1nlk3u+xzG/Y0MTElmt4Smge4Q7/p2i4AQP+Ot+lzFSbs47nGs
 nn730d5rJ1NTniNhwvL69qjT1i8otT5IErkH1IiOMTNxW24JI06varqHToVixQg9jubW
 apzUCJPFyUzn7NKyoVzr34ZHbOSBLFFqurZhsZcz1QT5CYE5yCVjRWij5XwCt1SsMLH6
 gO3Jx9ohRvjRTh/gNM246+tC38Ty8u7M+KUP7nIZiB3NUacjKhIFZsBmuWhWZ1skiHep
 HHskYmreyeF6CvNKUjIf88ehFvrMJu1k0LGqCrX+Itgq1xAhb/3oczCVjg1ktXi2w5x3
 +efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rscQz3KUGOpkCDKHMcXdQe7Cl/GoBVV86V2E9kxxK1s=;
 b=aN85rRC5PrhXAP2bxYHxZ3KtVO8lpB46AJiP71zcbYUXCbjwG1VUwJxNrxaRzXlojC
 1a4gJe9W065AXfcxZuoNbwELE/NrQ0EiNbzz7gJcGePQVvbsDvI0zGBiCIBcA2SalBd5
 2fSahZa8qCX1GRRDFj0aFolPkUBA/sFia6xYF+YwK/yMNY9o0U/TJAEj0ITyuD4b/imt
 DOty5vO7WSO0bOpWCeUA2OW0aEC1vLtUtYHI3c+DbtwHv6K+pWtyLRnDlifeRgLHVf2q
 ar5O8IG+Gso8sJ45TSsCDbUUEUNqxPObTJEcZZsf1LZ9zo/ve9gV3dclzS3Pqa54ursP
 OJfw==
X-Gm-Message-State: APjAAAXHJsTSdzVujHic/oRJmOmCSKJVnyz8U4h/su/qh3woB4FWAYVG
 +fynciN2bG8Omx9rlrP1cn0H2w==
X-Google-Smtp-Source: APXvYqwzABCOBCOzXWxksAWXozHEuvx2wpN+ZOBXgno4LlJoOSdi7K6PGndRhEJOhxZWMIuNGujEzw==
X-Received: by 2002:adf:8bc2:: with SMTP id w2mr5964754wra.7.1563985449460;
 Wed, 24 Jul 2019 09:24:09 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/6] ASoC: improve codec to codec link support
Date: Wed, 24 Jul 2019 18:23:59 +0200
Message-Id: <20190724162405.6574-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_092411_975051_2394C3A2 
X-CRM114-Status: UNSURE (   7.49  )
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
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As explained in this previous series [0], on Amlogic, we are using codec to
codec links to deal with the glue which is between the i2s backends and the
synopsys hdmi controller.

This worked well until I tried to .get_eld() support in the dw-hdmi-i2s
driver.  Doing so adds channel mapping controls to the codec. This shown
several problem

1) .pcm_new() is not called on codec to codec links.
   struct snd_soc_pcm_runtime do not even have a valid .pcm
2) struct snd_pcm_substream and struct snd_pcm_runtime are ephemeral
   This is a problem if a control needs to access them

The goal of this patchset is to resolve the above issues and improve the
codec to codec link support enough to correctly handle the hdmi-codec

The support of these codec to codec links could probably be improved in the
future to behave like any other link and use soc_pcm_open(),
soc_pcm_hw_params(), etc...

The challenge lies in the dapm mutex. The soc_pcm call dapm function locking
this mutex but the dapm mutex is already held in snd_soc_dai_link_event()

[0]: https://lkml.kernel.org/r/20190515131858.32130-1-jbrunet@baylibre.com

Jerome Brunet (6):
  ASoC: codec2codec: run callbacks in order
  ASoC: codec2codec: name link using stream direction
  ASoC: codec2codec: deal with params when necessary
  ASoC: create pcm for codec2codec links as well
  ASoC: codec2codec: remove ephemeral variables
  ASoC: codec2codec: fill some of the runtime stream parameters

 sound/soc/soc-core.c |  42 +++-------
 sound/soc/soc-dapm.c | 186 +++++++++++++++++++++++++++----------------
 sound/soc/soc-pcm.c  |  35 +++++++-
 3 files changed, 162 insertions(+), 101 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
