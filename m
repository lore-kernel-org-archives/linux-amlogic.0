Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6690C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 05:13:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E932613A0
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 05:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E932613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pO1nM+BbPUAzX4Zv3peypiZ6zF221DkFtn3U87z/MdM=; b=WCGpOBSXC7I9wq
	C682vfYOuKpK/ifcnLK9s1DYC+eS38wF46tLOgh3C9q5JFv5hf7sBjKoOp1CWqw0vBUoR5HJiwkFl
	0uqirXMm1rWq2KkbdsYUxZTQZBbwkbK14q8qFl318SqMIXJhbMa1zFzzOpge2N6w4HAv3IaxTQ9Y0
	+DmenoX0SWluvhmmfBBg3yTo13ZervcyZc1f0YpUf3qbLaFx0yHgOXsYIFYdlWFN5Jr65Mm1BYj+P
	rWlfeolyVJ9BuDela+I14UhzjbRrgoZ+1iXkm1cAGLUF9KyXFD9kM6xxA9ojv1464B3dS+aztbjLC
	Ct6mUJo3kywrMt+Qhs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWtoU-003COo-3Y; Sun, 03 Oct 2021 05:13:26 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWtoQ-003CO6-I2; Sun, 03 Oct 2021 05:13:24 +0000
Received: by mail-qt1-x831.google.com with SMTP id m26so13017423qtn.1;
 Sat, 02 Oct 2021 22:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ulbTVNSJ2iNJZxZK00NR1PC8WsHr0mc+HEMbZmRuv3I=;
 b=IPEybbj+ehfBzk/ZqtSTakokncT+6/v3I9sZ7U/Lq8nq+kmPdjczyC42Pf8HFViAv3
 a/dbCxlfCvCOXsN40cX7ptcPd8/qRfnft22roUwExNnDBs2ACE2aTuNp0fWTqrEvAChF
 5zaeCMNt1Q5WCRy+RNwUoZL7XdZPWfGD8VYvnecINloko/xgVY8WSjjuLWC8GTb/7oer
 GtyoFTT0j/WypuRNfLI8qlHpCmn5DnKPyG57VSCM/sBljNi6ZvtUCQPikyBdRvPMmbig
 V1M0ZnSwB1mH6fc7ipKg/9KS5COMOv/0JRcrDig7oBf6NawBPH8cFN6/2Vbq7qmnog4K
 6Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ulbTVNSJ2iNJZxZK00NR1PC8WsHr0mc+HEMbZmRuv3I=;
 b=MnRvvvFkmrMkmy9CBttkPl1MFHkhYB5bqLOLkz9fdHGvGouhY1mBMtgQq84d+IuewE
 2pU2ry3FpxGfb2HBunTQH0YbCr2LeIOdOnCvEWa99KAsl5tjIoKFvDvmNHrbFLTCuC5V
 JLaFeskD6eiZxO8xk7aF3Ot0ysyeF5TZ37bml+jk06Si2Y4GGBaukfnhzGNBwAsVzjfT
 WbAH7ybIo+vBRfhQN+GvntOGXg6YMezJbII59Lyjxu+lWKzeqpbhPI9bKzzadgu6xlaS
 2orwtbpcLsx6QtIeIeovbzgYuUKW/k0zlcgXu9yy38hI5c/f6JAELtLbnX0J4h+ZOTyx
 qJdw==
X-Gm-Message-State: AOAM531gyYbRCLPkx+7xgT6iNaJx8hbpuNM89ZlncCS6Ye2LsDVDIgOt
 rkqjdQwzlYn61ivBbqLl6oI=
X-Google-Smtp-Source: ABdhPJzioSuGzx0Q7e0kRaQ5WWNQA4BhFy7b5Z30W2SOkuqm96ro8a6xkF6I1iBN61fBfkX7h8zVOg==
X-Received: by 2002:ac8:6b43:: with SMTP id x3mr6815822qts.190.1633238000236; 
 Sat, 02 Oct 2021 22:13:20 -0700 (PDT)
Received: from geday ([2804:7f2:8280:6c81:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id p9sm5518208qkm.23.2021.10.02.22.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 22:13:19 -0700 (PDT)
Date: Sun, 3 Oct 2021 02:13:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVk77/SIxr8Vt8TQ@geday>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_221322_656460_51D96D6A 
X-CRM114-Status: GOOD (  35.91  )
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

On Sun, Oct 03, 2021 at 01:43:12AM +0200, Martin Blumenstingl wrote:
> Hello Jerome et al.,
> 
> on Amlogic Meson SoCs which use the AIU audio controller we have the
> so-called "machine gun noise" (MGN) issue, reproducible for example in
> Kodi. So far nobody was able to identify the cause of this issue. My
> idea was to at least narrow down the issue so we can categorize it. For
> that I wanted to get the SPDIF output from AIU to the HDMI controller
> working.
>

Hi, Martin,

The MGN issue surely must be that one when using ALSA directly
(no dmix, no JACK, no Pulseaudio, no Pipewire, no nothing) and
when the track changes or we pause it, when it resumes we get 
noise instead of sound, correct?

If so, thanks for trying to track this down!

I bring it up because Googling it seems to head straight to a
Neil Armstrong post to linux-amlogic about what works and what
doesn't on linux-meson currently, and only if you dig deeper
you find a couple of reports apparently by the same person
about the "machine gun noise" thing.

It doesn't sound like a machine gun noise to me :)

More like brown noise, but anyway what I'd like to note to
everyone involved is that this one is a major dealbreaker.
Unless using JACK, Pulseaudio, Pipewire (?) or at least dmix
audio will degrade at the second song or when the user first
pauses and then resumes a stream, completely ruining the
experience.

> On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
> used. This has an SPDIF input but there's currently not driver for it.
> On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the TransSwitch
> HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
> and I2S inputs.
> I decided to add SPDIF support to the latter since the code from the
> vendor driver is much easier.
> 
> It took me a while to figure out why I would not get any audio output
> from AIU SPDIF to the HDMI controller - or from there to the sink.
> The "fix" for this issue is the RFC patch which is part of this series.
> Any feedback would be great as I am still new to the ASoC subsystem.
> 
> Another part I am still struggling with is the audio "routing" (due to
> lack of a better term - please correct me if this is not the right word
> to use for this case). I have the following description in my .dts:
> 	sound {
> 		compatible = "amlogic,gx-sound-card";
> 		model = "M8B-ODROID-C1";
> 
> 		assigned-clocks = <&clkc CLKID_MPLL0>,
> 				  <&clkc CLKID_MPLL1>;
> 		assigned-clock-rates = <294912000>,
> 				       <270950400>;
> 		dai-link-0 {
> 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> 		};
> 
> 		dai-link-1 {
> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> 		};
> 
> 		dai-link-2 {
> 			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> 			dai-format = "i2s";
> 			mclk-fs = <256>;
> 
> 			codec-0 {
> 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> 			};
> 		};
> 
> 		dai-link-3 {
> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> 
> 			codec-0 {
> 				sound-dai = <&aiu AIU_HDMI CTRL_PCM>;
> 			};
> 		};
> 
> 		dai-link-4 {
> 			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> 
> 			codec-0 {
> 				sound-dai = <&hdmi_tx>;
> 			};
> 		};
> 	};
> The driver for &hdmi_tx defines:
> 	struct hdmi_codec_pdata pdata = {
> 		.ops			= &txc_48352_hdmi_codec_ops,
> 		.i2s			= 1,
> 		.spdif			= 1,
> 		.max_i2s_channels	= 8,
> 		.data			= priv,
> 	};
> In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
> remove all I2S references from the .dts snipped above (only then
> HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
> enum in aiu-codec-ctrl I was expecting the format to update as well.
> That unfortunately doesn't happen and I don't know how that can be
> achieved.
> 

Hm, that sounds weird. I hope you get the answers you are looking for.

Thanks,
Geraldo Nascimento

> 
> Best regards,
> Martin
> 
> 
> Martin Blumenstingl (1):
>   ASoC: meson: aiu: Fix HDMI codec control selection
> 
>  sound/soc/meson/aiu-codec-ctrl.c  | 108 ++++++++++++++++++++++--------
>  sound/soc/meson/aiu-encoder-i2s.c |   6 --
>  2 files changed, 80 insertions(+), 34 deletions(-)
> 
> -- 
> 2.33.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
