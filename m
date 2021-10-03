Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164DDC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 19:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACD5611C1
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 19:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BACD5611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4oKTJfLImGuKZQuuOIMDm0tkqzyUrTkPW3aGnVI3B8=; b=BNcX8SSYQY+imH
	CvVoZ47KhwuJJ8N4JXYKGw+B72Ov2LiuGcBvCJloQw+i88HbFuEKCoaYNoqxIxsSompml4HiyVQMw
	72ZUyDcNBUCd6+Df/hXwobmrAeJ/7XFh29WqYh32SdjnwOpOEULNd0WEYVInEjmDe+71LpR/f9EHB
	7ykPoTdxUHUguysZiygb5/Xp1NE0PrjFxTFOapKnVYhGjaZbw3q40W5ymMH5J0m71flRpWE6acodG
	OwYETDuDcu7o7a76Ok5lO4bj9GhAg9WIrVmHbUaV35LEWNuZiUtsFTLGhd4omBJy0Z5skl+4M7AbS
	ZShKJMPC7zXfn60FrGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX6zj-004JIZ-SI; Sun, 03 Oct 2021 19:17:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX6zh-004JI4-6r; Sun, 03 Oct 2021 19:17:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id ba1so56263913edb.4;
 Sun, 03 Oct 2021 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1AuAoJ09w7rZx0LoqvNgfkj4bYHfW7F7rrWOMcjHMc=;
 b=XaEsVqDFSTa6962TijyFZ2fyq5Z9ZALuDegRoy6NJaL62ZvH7MrEG97rCkN1c4rwFS
 X8Nm8/3Kwq2rsVN/lDXFgtSoSuKQVZ35Jplej1d0ZwYUe7WLVfK1Ay1dUu0pziOcv4LB
 VaCYEFjqL+J8InFuse2jRCxQHIIdqeFpz5oAUnp9K6ybngH+UpYFMdo5ZnxGugaJAFHV
 axKFlII72Vw+3bYl28bBu1u+6PRz4fipoqjhOr1cAFf5ntLSN4ynmgn7dpAZ5gkDJ6Gy
 LIh5othJHJ5PpJW63/mKqDCybEuAzkgPpta/0qfhgb8Wu/Xf515DJnPaxJa2GIdEy476
 Jukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1AuAoJ09w7rZx0LoqvNgfkj4bYHfW7F7rrWOMcjHMc=;
 b=rAN4p7wJn5iLvQfijIt7dBUCz/3NyDyLz9YOQmHsPc9q3hu0GzRqyjvJexIg+Dkd3a
 mhcG3Kf+E7ob3zq8xDtMwLwM1FYgMQuaZk/JHlB4cj22vYLd0fgfejhEkZhzxec85fVg
 47RvMOoH+AAuiCXg9m4ipZNVRVFNJjg/5bu6BmEOyhydqy647nAaX8DnMnlpbLJ++993
 6A5UA8BducEjUDfihTEx4XVoV7NjzApHJahtznZJ9oVRall/wppzteKycICxrJhu2x6v
 ilzNPVlcPBYgHo/yK1IK7oXAPc557aTrVVzzu3UOicxTxxXWd39Q24qJ0mqxU8m0CBCN
 gxdA==
X-Gm-Message-State: AOAM533KmBR38LYT8RGCG16YOuGDqKEEi1dgPybXrMrSd9x/rPDUvsWj
 Ytjgi8KrmG2Dklv2Jq0OHKMctGtvqpOMKv4qphU=
X-Google-Smtp-Source: ABdhPJxPn4IPMXuFMIIxl4e3Ysa4zn0K9LciYHf8mg3INPpCBfcDQdHxG1bp6bHR2mDopq2L8Cgvn2yvAsshbCzaORg=
X-Received: by 2002:a17:906:1405:: with SMTP id
 p5mr12382183ejc.197.1633288670478; 
 Sun, 03 Oct 2021 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 3 Oct 2021 21:17:39 +0200
Message-ID: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, 
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_121753_315714_9ED09B09 
X-CRM114-Status: GOOD (  42.21  )
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

Hi Jerome,

first of all: thanks for taking the time to go through all of this!

On Sun, Oct 3, 2021 at 6:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Hello Jerome et al.,
> >
> > on Amlogic Meson SoCs which use the AIU audio controller we have the
> > so-called "machine gun noise" (MGN) issue, reproducible for example in
> > Kodi. So far nobody was able to identify the cause of this issue. My
> > idea was to at least narrow down the issue so we can categorize it. For
> > that I wanted to get the SPDIF output from AIU to the HDMI controller
> > working.
>
> Ok, I'll clarify (again) about this issue.
>
> This issue is on AIU only (not the AXG series), on the i2s encoder
> regardless of the output (HDMI, internal and external codec)
Thanks for repeating this. It was clear to me that only AIU is
affected but I didn't know that it only affects I2S

> This encoder support either 2ch or 8ch mode, nothing else.
> As long as only 2ch was supported, there was no problem.
> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
> aiu-encoder-i2c.c). Without this, the switch is not done.
>
> What these do, how and when it should be done is unclear. I tried
> several combination. At the time I found something stable-ish but it was
> not perfect.
old 32-bit u-boot sources from the Endless Mini do have some
documentation on AIU_I2S_SYNC [0]:
// 8'b0_000_1_1_10
// A write to this register will cause the interface to repeat the current
// sample. Can be used to regain synchronization.
// A read from this register indicates that the next sample to be sent
// out of the interface should go into the _left_ channel of the dac.

There's also a note about AIU_I2S_MISC stating:
// Bit 4 if true, force each audio data to left or right according to
the bit attached with the audio data
// This bit should be used with Register AIU_i2s_sync(0x511) together

To be honest: to me this is not helpful since I don't understand
how/why the left channel is of importance.

> At the time, It was completely new driver. Even if was not rock solid,
> it was still progress and I opted to upstream it with an imperfect 8ch
> support so people could help debug it. This was mentioned in the
> original submission.
>
> The other solution is to restrict to 2ch mode and remove
> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> anymore.
I think Christian (Hewitt) agrees on this point as he mentioned that
your earlier versions of the AIU code (before it got upstream) were
not affected by the "machine gun noise" issue.
Does the documentation from above give you any new ideas (assuming
that it's correct since it's the best we have)? Should I try playing
with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
difference?

[...]
> Here you describe a DAI link (think of it as wires) between the SPDIF
> encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
> it is not possible.
>
> Let's start from the HDMI controller.
> The designware (on amlogic SoC) has 2 interface for audio input.
> 1) PCM/I2S: a classic interface 2 clocks and N data line
> 2) SPDIF: The Sony Philips 1 wire interface
The Transwitch HDMI TX controller supports these two inputs so even
though the IP is different the basic functionality (which we'll
discuss below) is the same.

> Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
> won't fly there.
I agree with this

> AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
> implemented as an ASoC codec which allows to seleted one of 2 audio
> sources:
> A) the i2s output implemented as part of the AIU
> B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
> is not implemented ATM.
This is some interesting information, I thought that PCM was used
because PCM audio can be transmitted over SPDIF.

For A) my understanding is different though:
- for AIU_HDMI_CLK_DATA_CTRL[5:4] (HDMI_DATA_SEL) your description
matches my understanding. For me it makes sense that SPDIF data cannot
be selected with this register since it's a one-wire protocol (and
doesn't have separate data/clock lines). Value 0x2 selects the I2S
data interface
- for AIU_HDMI_CLK_DATA_CTRL[1:0] (HDMI_DATA_CLK_SEL) however I have a
different understanding: 0x0 disables the clock signal to the HDMI TX
controller, 0x1 selects the PCM clock (which now I have learned is
related to the AUDIN block) and 0x2 selects the "AIU clock" (see
below)
- my understanding is that "AIU clock" comes from AIU_CLK_CTRL_MORE[6]
(HDMITX_SEL_AOCLKX2) where 0x0 selects "cts_i958 as AIU clk to
hdmi_tx_audio_master_clk" (SPDIF clock) and 0x1 selects
"cts_aoclkx2_int as AIU clk to hdmi_tx_audio_master_clk" (I2S clock)

So to me this means that there's three different muxes:
- data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
- clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
(hdmi_tx_audio_master_clk)
- hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
and 0x1 (cts_aoclkx2_int)

Based on that I think that it's not possible to have AIU output the
I2S and SPDIF signals at the same time to the HDMI TX controller and
then letting the HDMI TX controller choose which one to use.
Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
need to configure AIU accordingly (data and clock).

[...]
> It is not meant to. The dai_link and the endpoint are i2s.
> Your HDMI controller should have 2 inputs and should have a way to
> select one or the other. The format at each of the (internal) input does
> not change
ah, that makes sense.
Let's say AIU has some internal muxing for the HDMI output then AIU
would have two outputs as well (let's call them HDMI_OUT_I2S and
HDMI_OUT_SPDIF).
Then I'd wire up each of these to their corresponding inputs on the
HDMI TX controller.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
