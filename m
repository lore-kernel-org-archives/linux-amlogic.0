Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B3EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 21:17:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3009B613AC
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 21:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3009B613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dG6Q8e8ZCZKarwSENM6OYLGBo6h1IURA1Ey3izpHdu0=; b=PUfJY1dFqklhx7
	bV9gKteqb7te/xdHgTcFuT/KuJXurgayt5Y2iZbwvCghIkv7cdWREWO30rooxtjMhU1WXiL7DDhQE
	Exd0FJAFbKXUFh6aRrbMKPdIAXpslj+4kBIpiN8ylQAekQ+/KIBU13XiGygrNN0fIuy89sd3h+zYC
	xnIzZxVucGQ195yy1XSOLGpQ7M3c5ZJtEjzQlYYwKJ6mz2sbjaZSlXTuVqz5xKmSrHozbMK/7T4c3
	XEY0wLRtfkLJEJGKC7y56Z1zy9E0nf6q4a1KVHAMzT0Y17EmABayDF6+CxANlJcWTkBHd3NY+lshk
	5Dv3lYLiGKfiHmgRJiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXVLA-008BV5-U4; Mon, 04 Oct 2021 21:17:40 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXVL7-008BUK-FR; Mon, 04 Oct 2021 21:17:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id d8so1196155edx.9;
 Mon, 04 Oct 2021 14:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfIbcNy8uRUeT/alGgQC1RAZh4dTZXYv6GLv/0r2a/Y=;
 b=aeY1Mie9I7CmWT72Q2XqRVY2H9Gs5T3E+Qdzz6OUZPf4u5gcrbmnxOe2WqoYU7XGyT
 vTUdzCwGyi1aZroFKjb9fZz4tM0DuYLHAxtv2sqiRdcQVckSsoOPLJ2QVM5Jx5XgLE1u
 lBqT+c9dPmSo58yOKKOxsqF36oDTxj9MoJXEJffUucT5ZRyHm6+Zf+tcsf93J0q1oSog
 R9RMZncqqc5vXMdC/GfVPm7JB5c1B4E1Bj2s/oUJaFzPmjkw99HHEfSKBUUZRLUIw84t
 LUcWc5CtcxQTHHO1tXA+R3aI1Vk2NJGR4PeMCigBh+sS+WNAWUmuUxOC5lIC2qxgsC1K
 LhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfIbcNy8uRUeT/alGgQC1RAZh4dTZXYv6GLv/0r2a/Y=;
 b=Xj/DAUmpSQKK3K9XoAQeXSO1jmwCy87gmrhyLFkm5RCpJuHMRC/qrMRVZcXLOUk+Fi
 JjYeiCL6eslmosvERu4wng1B6FYEjNLEY/aUIJ3immZ4UI6yIxs4AK+niy9EkjC9TZjf
 0MQ7NenlMmrSz+wSxt9jKYqeM5p0qdXQL5jhmTOd+4/UzCQDhD/2Dfs+pZF2VUeIZnVQ
 XG0caB3PKSjVHC0GplHqbFd3xBr12F5rg+cpdjUyMQqq1oht4xdIGZ88uKybhWXVF1bn
 kfWA+TtH8D46ZMi7FvOr4EaYM/18nTut6UW7CiBisOiX8XQNkZkQA/WPb/VjE9vLGQ3o
 laPg==
X-Gm-Message-State: AOAM531oM3RzPBabp6e45Rp58b5x1j5vl5398q9T85LtkQaN8bEXVso3
 q+fq1O1bZZt1epnl4PNeNYS8Wm+ZxWuignNy6DXplnoYSvM=
X-Google-Smtp-Source: ABdhPJy4g68s5xZSNqK01V2f9gaZCfuyvWoUsyjuXX0Nfu/46CALquUFp4do1rs3uFQnOhg1MWmzAZtxT8A61rjJ9DA=
X-Received: by 2002:a05:6402:d52:: with SMTP id
 ec18mr6632042edb.67.1633382255772; 
 Mon, 04 Oct 2021 14:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
 <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Oct 2021 23:17:24 +0200
Message-ID: <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, 
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_141737_584852_EC74B72C 
X-CRM114-Status: GOOD (  50.94  )
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

On Mon, Oct 4, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > old 32-bit u-boot sources from the Endless Mini do have some
> > documentation on AIU_I2S_SYNC [0]:
> > // 8'b0_000_1_1_10
> > // A write to this register will cause the interface to repeat the current
> > // sample. Can be used to regain synchronization.
> > // A read from this register indicates that the next sample to be sent
> > // out of the interface should go into the _left_ channel of the dac.
> >
> > There's also a note about AIU_I2S_MISC stating:
> > // Bit 4 if true, force each audio data to left or right according to
> > the bit attached with the audio data
> > // This bit should be used with Register AIU_i2s_sync(0x511) together
> >
> > To be honest: to me this is not helpful since I don't understand
> > how/why the left channel is of importance.
>
> Same here, I already had this description and it is not really that helpful.
OK, so I guess this leaves experimenting (which requires luck)... :-(

[...]
> This bit could also be a remain of an older design, not really connected
> to anything meaningful. It would not be the first time.
>
> The AIU looks like an IP that has evolved a lot over the years, not always
> in a coordinated fashion. Some scenario are well supported and easy,
> others seem to require a magic spell.
>
> Last (but not least), in AML vendor kernel, the only time this bit poked
> is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.
The 32-bit SoCs use SPDIF to feed 2-channel audio to the HDMI TX
controller and I2S to feed 8-channel audio to the HDMI TX controller.
It seems that Amlogic stopped this for (at least some) 64-bit SoCs.

My testing results indicate that AIU_CLK_CTRL_MORE[6] is still relevant.
I can do another round of testing with various combinations of
AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL register values.
If you want me to test any specific combinations then please let me know.

> > So to me this means that there's three different muxes:
> > - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> > - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> > (hdmi_tx_audio_master_clk)
> > - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> > and 0x1 (cts_aoclkx2_int)
> >
> > Based on that I think that it's not possible to have AIU output the
> > I2S and SPDIF signals at the same time to the HDMI TX controller and
> > then letting the HDMI TX controller choose which one to use.
>
> i2s and spdif can be 2 independent paths (with different clock sources).
> I have already made them work concurrently. I believe (but have no
> proof) that the same should be possible with the HDMI.
>
> Until the hdmi controller has support for both inputs, we don't need to
> worry about it.
My work-in-progress HDMI TX controller driver for the 32-bit SoCs [0]
does support both (I2S and SPDIF) inputs. That's how I am able to test
all of this.
I wasn't aware of the fact that it's known that the "machine gun
noise" (MGN) issue is related to I2S only. Since I couldn't find a
workaround or fix for the MGN issue I wanted to narrow it down by
adding SPDIF support to the HDMI TX path.

> > Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> > need to configure AIU accordingly (data and clock).
>
> TBH, I'm not really sure what this bit does. From the description, it
> seems it allows to select an HDMI clock (not idea which one actually)
> for either the i2s or the spdif path.
>
> Nothing says it is related to the HDMI_CTRL (codec), maybe it is not.
> Maybe (MAYBE) it defines what will become "the AIU clk" in
> AIU_HDMI_CLK_DATA_CTRL[1:0].
This is what I am thinking

> Until we can feed the i2s encoder from the spdif FIFO, I'm not sure we
> need to play with it.
I think it's also relevant when we feed HDMI TX from the SPDIF (FIFO +
encoder) which is what I am attempting here.

[...]
> >> It is not meant to. The dai_link and the endpoint are i2s.
> >> Your HDMI controller should have 2 inputs and should have a way to
> >> select one or the other. The format at each of the (internal) input does
> >> not change
> > ah, that makes sense.
> > Let's say AIU has some internal muxing for the HDMI output then AIU
> > would have two outputs as well (let's call them HDMI_OUT_I2S and
> > HDMI_OUT_SPDIF).
>
> I don't think there is another output the HDMI_CTRL mux block. If SPDIF to
> HDMITX is supported, I suspect the output of the spdif encoder is
> hardwired to the spdif input of the HDMI controller and it is up to the
> HDMI controller to take it or not.
I think you are correct with this.
My theory is that AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL will
enable one of the outputs (I2S or SPIDF) from AIU to the HDMI TX
controller, meaning that only one signal can be active at a time. The
HDMI TX controller then needs to "select" the correct input based on
the selected output from AIU.

> That being said, I don't see any hard evidence that AML used SPDIF to
> HDMI in their tree, so maybe it does not work at all.
For the 32-bit SoCs the easiest to understand code-snippet is the HDMI
TX audio input configuration [1]
Which basically translates to:
  if (more_than_two_channel_audio) {
    enable_audio_i2s();
  } else {
    enable_audio_spdif();
  }

The code in the AIU driver just assumes that whatever it's configuring
is what the HDMI TX driver expects - without a clear link between
these two.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-mx-integration-5.15-20211003/drivers/gpu/drm/bridge/transwitch/txccq-txc-48352.c
[1] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/hdmi_tx_hw/hdmi_tx_hw.c#L3035:L3038

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
