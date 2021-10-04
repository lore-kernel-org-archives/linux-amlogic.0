Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E419CC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 09:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DF16128A
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 09:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53DF16128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5V0HJhJ1TjT6MOt6RQMSu6mEpiVWEVGSeA1sG6muxo=; b=HeKoXsNRdpPn2g
	v5cgJx+P8U/5pbU6Try6Eok40ktbCaUhKLt0foSGwwumJVNGWVDC09Oo/5GEz9tX0xHbYwd+2V8i2
	Ic/+TRJLFL0aZ8qUYnbwmEqLsrTZsRbhOLKl9rki1DbOmdCeT9dba7/XqTFEi6VItCidrs7SqT4V2
	7pdFY/WLxwPCPyaaHbW0taCrXnj69QWhc8sZZmoCghqUMIDkYU7vmRqe2oaARoyWXH6s+tHDI1gIb
	JxnhHhb2cXtqIw1bNwsrTO3sg7KkU/BhftroNQ8T2oDe3vgrWVZ7YGgpeUBZin4mSGLAYiMKriOhu
	KFXXkC21ebdHw9FKYxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXJrj-005hx6-SX; Mon, 04 Oct 2021 09:02:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJrV-005hvl-V1
 for linux-amlogic@lists.infradead.org; Mon, 04 Oct 2021 09:02:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 a11-20020a7bc1cb000000b0030d6aae48b5so2412062wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Oct 2021 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=AeVtfBx2w6aMRfHG6/qXgXtUvbfQ5tnGA7rVFbgp2pg=;
 b=AdHFSQBZy0q83Lfm963N9pUBhL3yXoUSgwGynh1/u/KIgzk9cfzsYT0Y5ERcG8H5PF
 VgU5YzWIMMcoXsMM08o9HXTr92l3+0p6+ZNH+rpYre41tJIHNqb1ERSh/loL1yC0UF5C
 Qqx/x5+bTQmT9U5gzQ4kezbRa6gR2bCymqWcgHSaXQGLN3rBy2DFpn/1V5SwNpsAaF+/
 eD/lIv12ZWYMF60s0Dul5/ZDS4cBoGRfGOHZLhPpFfA4PWa6OBc3Fgp4NxPI3ecVrfaO
 dJpM1psFRH38BFh45zSWggVhZURuMptJja+KwHoExvenNDneeZ2ZkQDE8R4XSphg4fDA
 d74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=AeVtfBx2w6aMRfHG6/qXgXtUvbfQ5tnGA7rVFbgp2pg=;
 b=j0ZLbuUa0tDl6wX4Pxh359zBxsBtpIHRYfR+vM46V9MI6TDkBhNxcK7Nrd2ahNJixJ
 bW554tdqfqKColQAMrPA/SlJHHDsl4XTY8Py/EOL6k5nYP8T3fCe2gELghahqsuj0lqc
 LuM7zzrTip4KP/YRtAo5lbE65udRneE9pTnuatSq0cC41j+yfJWTxj2llr9Ushq00ZDX
 MJHqVzgczjk12hVBplfnuz6Z1RgHNwzWnm88a29VRk7is5GAcrNYMgMkavgenV34W4ap
 atgXGELXoZOQV/WogFWAm0Kcex4fhHbSM/B8vns33tRXh1nwFFd40wfKnmkc8wtvrnuE
 xhog==
X-Gm-Message-State: AOAM533DNFL5jL7x5i3+O+MXL7iT7zqKg0HLgG9UMUKedJRZY/GW7Gpi
 Z4IFtQSsSoRSSXYqfG/jsLNL/Q==
X-Google-Smtp-Source: ABdhPJxUorTdwWsM/PU8j/kBYNCGixxqE+ZxZbtlEjlJI8+iw5IA9+4htzWYsfBsBjK+PmAP54nesw==
X-Received: by 2002:a1c:984e:: with SMTP id a75mr17281749wme.63.1633338135781; 
 Mon, 04 Oct 2021 02:02:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z17sm13641838wml.24.2021.10.04.02.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:02:15 -0700 (PDT)
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Date: Mon, 04 Oct 2021 10:13:19 +0200
In-reply-to: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
Message-ID: <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_020218_014315_DE0A11A7 
X-CRM114-Status: GOOD (  59.30  )
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


On Sun 03 Oct 2021 at 21:17, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> first of all: thanks for taking the time to go through all of this!
>
> On Sun, Oct 3, 2021 at 6:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > Hello Jerome et al.,
>> >
>> > on Amlogic Meson SoCs which use the AIU audio controller we have the
>> > so-called "machine gun noise" (MGN) issue, reproducible for example in
>> > Kodi. So far nobody was able to identify the cause of this issue. My
>> > idea was to at least narrow down the issue so we can categorize it. For
>> > that I wanted to get the SPDIF output from AIU to the HDMI controller
>> > working.
>>
>> Ok, I'll clarify (again) about this issue.
>>
>> This issue is on AIU only (not the AXG series), on the i2s encoder
>> regardless of the output (HDMI, internal and external codec)
> Thanks for repeating this. It was clear to me that only AIU is
> affected but I didn't know that it only affects I2S
>
>> This encoder support either 2ch or 8ch mode, nothing else.
>> As long as only 2ch was supported, there was no problem.
>> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
>> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
>> aiu-encoder-i2c.c). Without this, the switch is not done.
>>
>> What these do, how and when it should be done is unclear. I tried
>> several combination. At the time I found something stable-ish but it was
>> not perfect.
> old 32-bit u-boot sources from the Endless Mini do have some
> documentation on AIU_I2S_SYNC [0]:
> // 8'b0_000_1_1_10
> // A write to this register will cause the interface to repeat the current
> // sample. Can be used to regain synchronization.
> // A read from this register indicates that the next sample to be sent
> // out of the interface should go into the _left_ channel of the dac.
>
> There's also a note about AIU_I2S_MISC stating:
> // Bit 4 if true, force each audio data to left or right according to
> the bit attached with the audio data
> // This bit should be used with Register AIU_i2s_sync(0x511) together
>
> To be honest: to me this is not helpful since I don't understand
> how/why the left channel is of importance.

Same here, I already had this description and it is not really that helpful.

>
>> At the time, It was completely new driver. Even if was not rock solid,
>> it was still progress and I opted to upstream it with an imperfect 8ch
>> support so people could help debug it. This was mentioned in the
>> original submission.
>>
>> The other solution is to restrict to 2ch mode and remove
>> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
>> anymore.
> I think Christian (Hewitt) agrees on this point as he mentioned that
> your earlier versions of the AIU code (before it got upstream) were
> not affected by the "machine gun noise" issue.
> Does the documentation from above give you any new ideas (assuming
> that it's correct since it's the best we have)? Should I try playing
> with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
> difference?

Nothing new here.
I suspect that the encoder restart out of sync with the FIFO, picking
mis-aligned samples but I have not confirmed that yet.

>
> [...]
>> Here you describe a DAI link (think of it as wires) between the SPDIF
>> encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
>> it is not possible.
>>
>> Let's start from the HDMI controller.
>> The designware (on amlogic SoC) has 2 interface for audio input.
>> 1) PCM/I2S: a classic interface 2 clocks and N data line
>> 2) SPDIF: The Sony Philips 1 wire interface
> The Transwitch HDMI TX controller supports these two inputs so even
> though the IP is different the basic functionality (which we'll
> discuss below) is the same.
>
>> Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
>> won't fly there.
> I agree with this
>
>> AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
>> implemented as an ASoC codec which allows to seleted one of 2 audio
>> sources:
>> A) the i2s output implemented as part of the AIU
>> B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
>> is not implemented ATM.
> This is some interesting information, I thought that PCM was used
> because PCM audio can be transmitted over SPDIF.
>
> For A) my understanding is different though:
> - for AIU_HDMI_CLK_DATA_CTRL[5:4] (HDMI_DATA_SEL) your description
> matches my understanding. For me it makes sense that SPDIF data cannot
> be selected with this register since it's a one-wire protocol (and
> doesn't have separate data/clock lines). Value 0x2 selects the I2S
> data interface
> - for AIU_HDMI_CLK_DATA_CTRL[1:0] (HDMI_DATA_CLK_SEL) however I have a
> different understanding: 0x0 disables the clock signal to the HDMI TX
> controller, 0x1 selects the PCM clock (which now I have learned is
> related to the AUDIN block) and 0x2 selects the "AIU clock" (see
> below)
> - my understanding is that "AIU clock" comes from AIU_CLK_CTRL_MORE[6]
> (HDMITX_SEL_AOCLKX2) where 0x0 selects "cts_i958 as AIU clk to
> hdmi_tx_audio_master_clk" (SPDIF clock) and 0x1 selects
> "cts_aoclkx2_int as AIU clk to hdmi_tx_audio_master_clk" (I2S clock)

Not quite sure it works that way.
Each FIFO (i2s and spdif) is mainly target at the related encoder BUT
there is way to feed to both encoder from a single FIFO. In such case,
the proper must selected for the encoder and the downstream element to
keep things in sync

This at least with i2s FIFO feeding both the i2s and spdif encoders.
I suspect the same is possible with the spdif FIFO. Maybe the bit is
needed to also switch HDMI part to the spdif clock in this case.

This bit could also be a remain of an older design, not really connected
to anything meaningful. It would not be the first time.

The AIU looks like an IP that has evolved a lot over the years, not always
in a coordinated fashion. Some scenario are well supported and easy,
others seem to require a magic spell.

Last (but not least), in AML vendor kernel, the only time this bit poked
is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.

>
> So to me this means that there's three different muxes:
> - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> (hdmi_tx_audio_master_clk)
> - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> and 0x1 (cts_aoclkx2_int)
>
> Based on that I think that it's not possible to have AIU output the
> I2S and SPDIF signals at the same time to the HDMI TX controller and
> then letting the HDMI TX controller choose which one to use.

i2s and spdif can be 2 independent paths (with different clock sources).
I have already made them work concurrently. I believe (but have no
proof) that the same should be possible with the HDMI.

Until the hdmi controller has support for both inputs, we don't need to
worry about it.

> Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> need to configure AIU accordingly (data and clock).

TBH, I'm not really sure what this bit does. From the description, it
seems it allows to select an HDMI clock (not idea which one actually)
for either the i2s or the spdif path.

Nothing says it is related to the HDMI_CTRL (codec), maybe it is not.
Maybe (MAYBE) it defines what will become "the AIU clk" in
AIU_HDMI_CLK_DATA_CTRL[1:0]. Until we can feed the i2s encoder from the
spdif FIFO, I'm not sure we need to play with it.

>
> [...]
>> It is not meant to. The dai_link and the endpoint are i2s.
>> Your HDMI controller should have 2 inputs and should have a way to
>> select one or the other. The format at each of the (internal) input does
>> not change
> ah, that makes sense.
> Let's say AIU has some internal muxing for the HDMI output then AIU
> would have two outputs as well (let's call them HDMI_OUT_I2S and
> HDMI_OUT_SPDIF).

I don't think there is another output the HDMI_CTRL mux block. If SPDIF to
HDMITX is supported, I suspect the output of the spdif encoder is
hardwired to the spdif input of the HDMI controller and it is up to the
HDMI controller to take it or not.

That being said, I don't see any hard evidence that AML used SPDIF to
HDMI in their tree, so maybe it does not work at all. 

> Then I'd wire up each of these to their corresponding inputs on the
> HDMI TX controller.
>
>
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
