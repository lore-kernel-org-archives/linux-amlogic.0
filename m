Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EEC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 13:32:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F8422BF5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 13:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MXwSyDHy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="llWyNpxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F8422BF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OrArxrtvYpLZjYzqw1D/edz7mqa5XNV7Ia8crsgbvO8=; b=MXwSyDHyEFBTAPD0fNftlHB7r
	hTyO1A/NsBl6auYLBYiVmc2cjng5zFmbJKPpg4TfvfWnoAMT4+O2A3it/58MyfpxkVfLxWvj2y2Yc
	jPoR7WRajQmgQXy9PEIcUecER8MOq8pVYm+KuUTO7ek/0txQR7UMEtyw/xwKzjorPE9kmywtfwnMH
	u8AQbAx2zdTRQAQ+/u0UVXWDkezrJvC+futiMhmvq7WzQp88wZD+Izik66mb4FMxpVTMrQCWSnr3T
	ueNfHRZAyKW428FkLHpFv5JJ6b5zmUZWK6tAHO4N/2qmU7duLmtRyiipJfVW45BcLx4yJrfUXH/Qw
	55k2QJJlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBI0k-0003jg-0h; Thu, 27 Aug 2020 13:32:14 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBI0h-0003iz-9V
 for linux-amlogic@lists.infradead.org; Thu, 27 Aug 2020 13:32:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id c19so3755413wmd.1
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2020 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=RzjTTXuW8DoQzMoQkpQltYkMS2hvfG2Wfy3KypxE85c=;
 b=llWyNpxJ3XYx4msjmJiZYlY6gVQe7XWBxESPQWE5O4+p1/7ffuz3Hh+8PKvIOKijtA
 xPjWCpULHdChCIFlNhwXM0bYx4QhMtmMkWALfpAteoa++wRIjBx4elYwR365z7mcimmn
 QzEJsSO9u2Zwd6DQ/83vF0GIYszdYx0fCcmDa/v87iBYf/cggfoNA+iD8VHiv7Qg9CG5
 d4gi9feMHBUGAhGUMqRb78xOKL/6fZtMkY3OBwTH/+LwxSByvYejWSaXvx/8Omr9lLH9
 6C1ipG5Z68JQKmc7vA0fDA8Y07pG9V1XyucEBTsVIWzEqikWY8pKDYIHa4vzfy+4fysd
 mZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=RzjTTXuW8DoQzMoQkpQltYkMS2hvfG2Wfy3KypxE85c=;
 b=gyICHlfwIxn+Pc9j2xx2+oFSashrzBxgq34EIBBgC0X8ilIa95dCI9VRNeijTZgl49
 B8qxHTpkashfTjKv+e2AFvaj3wTp462TpaXF5bzXPtHvhd+iR9Q34VbCviC02MDH2inM
 3LDo3erFqse+b6EkbqeV08gQepyM4gq462vsnmtY4w/uEPwz1ifWmvipL2ICwWfyRoLV
 8yNT6Ts5niXUeQpSYb+oRZVUygITYlGGB+O0SlFPzA7KQT3NOg1Ivc7UEAsMUInEOYOa
 APewARTpygTw1pv0lZTmlG8w4U0e4rjeKOj4uZVp8VIWND6G4vx8bRL8Vz3WXDQMRRww
 YL7w==
X-Gm-Message-State: AOAM531ZmJfnxqaczUjE8B74KogEzIjwWPMSeLJ21DrCNPOxC9Tx00fl
 aoUc9eLGT8ZWcFcE1h+U1fp20w==
X-Google-Smtp-Source: ABdhPJw34SA8WJgrEgzMp2TR1ApIy6v1Wx2UvzK6DpDa87F1baFk/BT77mLLH0QK1paRl37b2MDcRQ==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr12466841wmf.26.1598535129044; 
 Thu, 27 Aug 2020 06:32:09 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 31sm6239269wrp.87.2020.08.27.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 06:32:08 -0700 (PDT)
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
 <CGME20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e@eucas1p2.samsung.com>
 <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
In-reply-to: <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
Date: Thu, 27 Aug 2020 15:32:07 +0200
Message-ID: <1jmu2g6wq0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_093211_463022_8EAE5509 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 27 Aug 2020 at 14:43, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi Jerome,
>
> On 31.07.2020 14:06, Jerome Brunet wrote:
>> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>> changed the meaning of dpcm_playback/dpcm_capture and now requires the
>> CPU DAI BE to aligned with those flags.
>>
>> This broke all Amlogic cards with uni-directional backends (All gx and
>> most axg cards).
>>
>> While I'm still confused as to how this change is an improvement, those
>> cards can't remain broken forever. Hopefully, next time an API change is
>> done like that, all the users will be updated as part of the change, and
>> not left to fend for themselves.
>>
>> Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> This patch landed finally in v5.9-rc1. I've noticed it causes a 
> following warning on Hardkernel's Odroid N2 board 
> (arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb):

Looks like the after match of the flag change again ...

>
> meson-drm ff900000.vpu: [drm] fb0: mesondrmfb frame buffer device
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 66 at sound/soc/soc-core.c:817

Marek, is it possible that you have CONFIG_LOCKDEP enabled in your
configuration ?

snd_soc_find_dai() is called by snd_soc_dai_link_set_capabilities().
Indeed, the client_mutex will not be help by any of the user of 
snd_soc_dai_link_set_capabilities() when called.

So I believe simple card and qcom will be impacted as well.

> snd_soc_find_dai+0xe4/0xf0
> Modules linked in: dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl realtek 
> dwmac_generic crct10dif_ce snd_soc_meson_axg_sound_card 
> snd_soc_meson_card_utils rc_odroid pwm_meson meson_ir 
> snd_soc_meson_g12a_toacodec snd_soc_meson_axg_tdmout rtc_meson_vrtc 
> snd_soc_meson_g12a_tohdmitx snd_soc_meson_codec_glue mdio_mux_meson_g12a 
> snd_soc_meson_axg_tdmin dwmac_meson8b stmmac_platform 
> reset_meson_audio_arb snd_soc_meson_axg_frddr axg_audio 
> snd_soc_meson_axg_toddr sclk_div clk_phase meson_rng stmmac rng_core 
> meson_dw_hdmi snd_soc_meson_axg_fifo meson_drm meson_canvas mdio_xpcs 
> dw_hdmi snd_soc_meson_t9015 display_connector nvmem_meson_efuse 
> snd_soc_meson_axg_tdm_interface snd_soc_meson_axg_tdm_formatter 
> snd_soc_simple_amplifier
> CPU: 3 PID: 66 Comm: kworker/3:1 Not tainted 5.9.0-rc1 #1527
> Hardware name: Hardkernel ODROID-N2 (DT)
> Workqueue: events deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
> pc : snd_soc_find_dai+0xe4/0xf0
> lr : snd_soc_find_dai+0xe0/0xf0
> ...
> Call trace:
>   snd_soc_find_dai+0xe4/0xf0
>   snd_soc_dai_link_set_capabilities+0x68/0x160
>   axg_card_add_link+0x188/0x5c4 [snd_soc_meson_axg_sound_card]
>   meson_card_probe+0x1e0/0x960 [snd_soc_meson_card_utils]
>   platform_drv_probe+0x50/0xa8
>   really_probe+0x110/0x400
>   driver_probe_device+0x54/0xb8
>   __device_attach_driver+0x90/0xc0
>   bus_for_each_drv+0x70/0xc8
>   __device_attach+0xec/0x150
>   device_initial_probe+0x10/0x18
>   bus_probe_device+0x94/0xa0
>   deferred_probe_work_func+0x70/0xa8
>   process_one_work+0x2a8/0x718
>   worker_thread+0x48/0x460
>   kthread+0x134/0x160
>   ret_from_fork+0x10/0x1c
> irq event stamp: 269690
> hardirqs last  enabled at (269689): [<ffff800010f6048c>] 
> _raw_spin_unlock_irqrestore+0x7c/0x98
> hardirqs last disabled at (269690): [<ffff800010025a68>] 
> do_debug_exception+0x140/0x26c
> softirqs last  enabled at (269318): [<ffff800010001654>] 
> efi_header_end+0x654/0x6d4
> softirqs last disabled at (269313): [<ffff80001008929c>] 
> irq_exit+0x16c/0x178
> ---[ end trace 56a3ea4fa00c37c8 ]---
> ...
> axg-sound-card sound: ASoC: no DMI vendor name!
>
> The warning is repeated 10 times.

That's the probe defferal mechanism causing the repeat

>
> The bisect between v5.8-rc1 and v5.9-rc1 points to the commit 
> c8f7dbdbaa15 ("Merge remote-tracking branch 'asoc/for-5.8' into 
> asoc-linus"), which introduced a branch with this patch.
>
> The commit with this patch is applied on the earlier kernel release 
> (da3f23fde9d7 "ASoC: meson: cards: deal dpcm flag change" on top of 
> v5.7-rc1) worked fine, so it looks that there is an interference with 
> something merged later.
>
> If I revert this patch on top of v5.9-rc1 or current linux-next, the 
> warning is gone.

... but any aml platform with uni-directional backend (not the N2, lucky
you) would be broken.

> Let me know how I can help debugging this issue.

If you have CONFIG_LOCKDEP enabled, try disabling see how it goes and
report. It is not a fix but at least you'll be unblocked.

>
> Best regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
