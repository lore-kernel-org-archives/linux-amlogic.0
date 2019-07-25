Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD372C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EBE22C7D
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENUHVQyB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vSIN5SQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EBE22C7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8rVLStr8T2QYGkFSfnjB1pMSC/qkpOCTStl2f2WUSUg=; b=ENUHVQyBAe0R+v
	gT0y9VSyIrrah3Wfub7ap57KUWlICKn/ykfJgBoWvg6poleZQyqoEzlunAfVjjjTyDzWGKkqoMwR4
	Uib51lL55KgxJnGi/Yv4mxpox3uiZ0Qa5a+hoKcQ6RlFg6Ts/WUV3C7KVsiFfWB64xQD8i6vcEMoW
	+5rzbtnI4wmyBmx6ZsO0LpFoXE8+31tmvAU0xI0cG+RKw57THKcVnnhuQxdLLbMpvM+B421S42Hn1
	ERZitWMYP1zr1YtpxUQ2xD4yQbWElUDt7hCHMKzN3qicPHiTSSK/bpobi9Lkg5U8NvqQcS0+KmOMA
	hNzKJag12q8sNZzUvkEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqh5x-0005AF-8r; Thu, 25 Jul 2019 16:59:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqh5u-00058j-49
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:59:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id u25so35017849wmc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T1q+s41fPQD7eof6Tqonl1CLLGxvvozknwhIlqSeIY=;
 b=vSIN5SQO0xC2DiwEc0YeIVtaqLm9xmsTf3t4eAWsBsGaCKiGOK2vgJal9mP8efVMko
 b7K7SHaczX6wzGVIJLowJ89Sig8RGT2vQBqW3UKxd6ok4KM/4XfH2Z1u0WaYmzbvgVka
 e5zhJaCjapKNyqA9aVJLo6T6SStoKByttTvZPPWMNKOQvkMLS/Z3tPyJGSLt7jJp/tqc
 ARjufuz5KjsxoP9SlZp+lrMhoet+SUuKk6IN1bJcohCnML3Z5VOZVa+wVErhZyfKF1C/
 NnjdXCeQAzlByQinXhS1sXYZwHRbaQwyN0r7MpBvmz6N3/lNSs62XIwO3PatT85KPyYa
 I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T1q+s41fPQD7eof6Tqonl1CLLGxvvozknwhIlqSeIY=;
 b=bmmHcLFuyOFW02xiiL9GKe3UDqK6a/mhN3bi01vqsQ68SOXTRgnrVcTeCWmfh0852f
 YHkCKEHSysks/Sis6ERM7jEvMXskZmMqVjaR36NuVRzUr/9UBJ6DW2e9JYcCDHBj+jJP
 Vmdwwb0Bl26/6EOLmGPFpvN4Q5whxLKYur30NuRtugYh7PCSWAIOWlxvOvRslp925z9t
 zQqIyJP4BOQKup6LBiB1DZ4N47AcAYE20V8Kf4JdgrUrlqvRdTpXuglKjdVcQx2cqEsl
 /o4Co4zFQK+yBMMezOQxo7IHY6EG6q3MyhDT7+sZMiJMyOL8TDbuACfkGItxgSpoafxB
 rOuw==
X-Gm-Message-State: APjAAAX7mhXemqN4bQ6bLhW3sOTagkBFbO1x4VtJ6+dHnW/YdyTQwBL9
 S0n7qFIF8fV/VcTNmc0Ujh3XnA==
X-Google-Smtp-Source: APXvYqz87XeGxJ4blumupC5s6LoHjrpUGm7ver3gc6XTezwuwOx9Uc66ViyO7ps4q4zmS4zTE9TXGg==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr82951769wme.177.1564073992368; 
 Thu, 25 Jul 2019 09:59:52 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/6] ASoC: improve codec to codec link support
Date: Thu, 25 Jul 2019 18:59:43 +0200
Message-Id: <20190725165949.29699-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_095954_185527_BA71FB9C 
X-CRM114-Status: UNSURE (   8.62  )
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

Changes since v1 [1]:
* Fix rebase on Murimoto-san's patches
* Allocate params dynamically again and refactor the pre_pmu code to
  simplify the error handling and rollback a bit

[0]: https://lkml.kernel.org/r/20190515131858.32130-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20190724162405.6574-1-jbrunet@baylibre.com

Jerome Brunet (6):
  ASoC: codec2codec: run callbacks in order
  ASoC: codec2codec: name link using stream direction
  ASoC: codec2codec: deal with params when necessary
  ASoC: create pcm for codec2codec links as well
  ASoC: codec2codec: remove ephemeral variables
  ASoC: codec2codec: fill some of the runtime stream parameters

 sound/soc/soc-core.c |  42 +++------
 sound/soc/soc-dapm.c | 220 +++++++++++++++++++++++++++----------------
 sound/soc/soc-pcm.c  |  35 ++++++-
 3 files changed, 182 insertions(+), 115 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
