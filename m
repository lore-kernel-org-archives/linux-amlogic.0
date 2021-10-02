Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0620C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 23:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFEC619E9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 23:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BFEC619E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8QUXbflIlm/rg9537mLoM5jWDhHpVvexPMpqZSrIpI=; b=JfNAzKgV2aGcnn
	kbh6BPZOJCIgfWv2g7/wbT4htyMjML+Bo498aYYlQ9cBF894WtcpURz5S4PAMVNbgXHkLyWIjiCVD
	/I6bHto1NnCneD1K9j27bEiW5E4aPmH8oJicWfaDeXiFDuQK5GEiETtQCJG4anPMrD0PwvEw7GvTh
	cv1sIxKNPfcF2vtYcR0htysyq60jf8MtjBvrCNWU4/REK6F6TAwJntRIQ1LGD+llzTGqTWt+cSdUN
	KL55laGcZKr5gXChMokP1C4863DF4cTt2kWN6UsKbkFkZ0dNd3NOU4nb7c5ljCS58tG6YDAkk0UaS
	QbWVNpLlquIItkVlafbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWofJ-002u5X-IW; Sat, 02 Oct 2021 23:43:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWofG-002u4D-JA; Sat, 02 Oct 2021 23:43:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so14656582wmi.5; 
 Sat, 02 Oct 2021 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T6wA479aMjXiGVQMPU8TC7VB5tEcMArPpG5ub2OJHk=;
 b=EUhZfVpGDD6qg834LaUvUxb9ZhDqAco06iXtwjwHY0t+P8zjiqQea4m2vej+OHxL/l
 Y9mM1kUwszAQ25fM1xo1dLgXBC/nFzrAFFqUEvI/5eVVKy5RL8SSeenVB5i7Nv6dYGl9
 BZFV9xkLNKKFml88jtYV9xgbx0khTQug76YELXAQeCyWcQHfeaU1f4scvMlhAGKsj3b3
 C+Q+XSD1TRfSItSDklV22WZKxvf6Jw2radWrncD7geXukbtzwAjmq+4s9ZrXFRmbvXEU
 WPboa8oE9uQd9eDA39TWhg9PjdTjpW3EGvdA56dQFQ6vdJpr+EUtgqBoVvgxImd/mWDY
 b1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T6wA479aMjXiGVQMPU8TC7VB5tEcMArPpG5ub2OJHk=;
 b=uLg6bXUNoo6T0Mq1vg/1v1rbM4bUNOsj+PXyNQB2g17pyWkoSzVvIDU3Kvd3j/NjH3
 IEmVR7OmpWMvTUYHqLygHXla4JoZJWRavXpHt2tB8pJmP9glxXeok0i6+6UaaZAd/HAw
 dHHxGNXIp5+Hq3nkRHrWtz0pYgDT4P67uqYMc36Z/YfpzRgBtM74v0ugubeINPlxL0QP
 EzE+BhtjZEJKnYCEZbqaHix+XUd0DrefxGggr+y5aUCUgpSgUwtYDM1CRtd4eXzqIXqt
 LneWv+au3W5nXv11qb/zx2G06QKdnz8EOsXcZ1mROQ2Bon6gzqlLAE/Gaacp4RzwbXuD
 Cz2w==
X-Gm-Message-State: AOAM531yRmxki21/jF7IxyMFqJbnLmC+RwGtsMjePC+l7+JsCH2dWbpc
 3fpuJLcUt+woBbiJ7CSbu4Q=
X-Google-Smtp-Source: ABdhPJz/j7AnQVPkNfWnlxPyZBz5ITWoO6U2bBx+6+JZMWi8y1ZoDmE4l6z7g9WKHWWnom6z6VtlwA==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr11197754wmc.14.1633218211603; 
 Sat, 02 Oct 2021 16:43:31 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7bbe-df00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7bbe:df00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id z6sm13999463wmp.1.2021.10.02.16.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:43:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions and
 issues
Date: Sun,  3 Oct 2021 01:43:12 +0200
Message-Id: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_164334_676993_BF2AD7BA 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jerome et al.,

on Amlogic Meson SoCs which use the AIU audio controller we have the
so-called "machine gun noise" (MGN) issue, reproducible for example in
Kodi. So far nobody was able to identify the cause of this issue. My
idea was to at least narrow down the issue so we can categorize it. For
that I wanted to get the SPDIF output from AIU to the HDMI controller
working.

On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
used. This has an SPDIF input but there's currently not driver for it.
On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the TransSwitch
HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
and I2S inputs.
I decided to add SPDIF support to the latter since the code from the
vendor driver is much easier.

It took me a while to figure out why I would not get any audio output
from AIU SPDIF to the HDMI controller - or from there to the sink.
The "fix" for this issue is the RFC patch which is part of this series.
Any feedback would be great as I am still new to the ASoC subsystem.

Another part I am still struggling with is the audio "routing" (due to
lack of a better term - please correct me if this is not the right word
to use for this case). I have the following description in my .dts:
	sound {
		compatible = "amlogic,gx-sound-card";
		model = "M8B-ODROID-C1";

		assigned-clocks = <&clkc CLKID_MPLL0>,
				  <&clkc CLKID_MPLL1>;
		assigned-clock-rates = <294912000>,
				       <270950400>;
		dai-link-0 {
			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
		};

		dai-link-1 {
			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
		};

		dai-link-2 {
			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
			dai-format = "i2s";
			mclk-fs = <256>;

			codec-0 {
				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
			};
		};

		dai-link-3 {
			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;

			codec-0 {
				sound-dai = <&aiu AIU_HDMI CTRL_PCM>;
			};
		};

		dai-link-4 {
			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;

			codec-0 {
				sound-dai = <&hdmi_tx>;
			};
		};
	};
The driver for &hdmi_tx defines:
	struct hdmi_codec_pdata pdata = {
		.ops			= &txc_48352_hdmi_codec_ops,
		.i2s			= 1,
		.spdif			= 1,
		.max_i2s_channels	= 8,
		.data			= priv,
	};
In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
remove all I2S references from the .dts snipped above (only then
HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
enum in aiu-codec-ctrl I was expecting the format to update as well.
That unfortunately doesn't happen and I don't know how that can be
achieved.


Best regards,
Martin


Martin Blumenstingl (1):
  ASoC: meson: aiu: Fix HDMI codec control selection

 sound/soc/meson/aiu-codec-ctrl.c  | 108 ++++++++++++++++++++++--------
 sound/soc/meson/aiu-encoder-i2s.c |   6 --
 2 files changed, 80 insertions(+), 34 deletions(-)

-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
