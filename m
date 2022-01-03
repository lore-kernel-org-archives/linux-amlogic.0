Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDDDC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tny41jNlbQb3zPEPhawh+gU20uZU9+/tKHffRgqCdvc=; b=PqaXrIFIeJOr+q
	ODGMExla6Wm1i+e0eP/VuAyLASTug5OOcykQ1qKY5rsn2MczKXqyzQndK9h/okTqah4/syAg60/p1
	5TG6Aflzdpz1S4+itLw92tbb1ax34DEQt107mp7e/lqJdEuUPVdmPDucXQX8u3vODQIxRQijsPCsw
	IYESGj5dzHFNR55vCR0SOH+SBvWV2xk3i17aWwo0zeKE5zBCB92N6WHl8GFnwLq72N3rgewZVg704
	ZjPZJozoD246OAgbaM8tsC+vp6p+JFj67S8J26xwC9vEQJUGE8dDp3ZJ2xC+oNrn0HiGv7SgyMGnz
	WGsJu/lm+MfUY1eS8cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4L8r-008poa-No; Mon, 03 Jan 2022 11:04:41 +0000
Received: from mail1.perex.cz ([77.48.224.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4L8o-008pnj-M0
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 11:04:40 +0000
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8A67DA0040;
 Mon,  3 Jan 2022 12:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8A67DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1641207870; bh=GIn5qlEVCWBIAaoD4oBCR6gQxmLPVO8QWfOiMKhwDDI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e8xrVub84fBtS6Hnng+zBk9JGj3clZn3ZGO56jp1Aw6ICI0aSLXYH9svhh6DUR8bW
 rLlcO4CqA2yMzGG+e8afkq/5CzHPVTicn8r3zTvQFrGPoRi/wJox5qyMFzrOElONql
 4vl6xCWzA2Ud884GOLopYlW6Q8reRNy6Hxu6wCis=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Jan 2022 12:04:25 +0100 (CET)
Message-ID: <125f4abc-a85e-7a8c-594c-4cf7ddee1d78@perex.cz>
Date: Mon, 3 Jan 2022 12:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
 <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_030439_095399_DC6FBF56 
X-CRM114-Status: GOOD (  20.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03. 01. 22 10:57, Jerome Brunet wrote:
> 
> On Sun 26 Dec 2021 at 18:30, Jaroslav Kysela <perex@perex.cz> wrote:
> 
>> On 26. 12. 21 12:43, Christian Hewitt wrote:
>>
>>> **** List of PLAYBACK Hardware Devices ****
>>> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>>>    Subdevices: 1/1
>>>    Subdevice #0: subdevice #0
>>
>>> numid=12,iface=PCM,name='ELD',device=2
>>> numid=11,iface=PCM,name='IEC958 Playback Default',device=2
>>> numid=10,iface=PCM,name='IEC958 Playback Mask',device=2
>>> numid=9,iface=PCM,name='Playback Channel Map',device=2
>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L136-L188
>>
>> Have you tried to reorder the dai-link-# sections in DT? It appears to me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the internal PCM
>> device rather than the exported PCM device for the user space.
>>
>> If the DAI routing cannot be changed, then the hdmi-codec.c should be modified to export the correct device number for the user space:
>>
> 
> The DAI routing is dynamic, especially on the AXG series.
> There is actually two routing stages:
> 
> 1) Between the user interfaces (DMA) and the i2s/TDM encoders/decoders:
>     -> This is using DPCM
> 
> 2) Between the i2s/TDM encoders and the HDMI controller:
>     -> This is using Codec-to-Codec links
> 
> The problem exposed here is
>   - How to get the get the "Playback Channel Map" related to the pcm
>   device of a given playback ?

The PCM device exported to the user space should be able to export this 
information correctly. The kcontrols in hdmi-codec.c refers to an unknown 
(internal) PCM codec2codec device (from the user space view) which is created 
in the SoC layer.

It seems that kcontrols in hdmi-codec.c should not be created for the internal 
SoC PCMs. A new layer which translate the kcontrol handling between the 
exported (user space) PCM device and internal (SoC) PCM device is required.

Problematic code in hdmi_codec_pcm_new() / hdmi-codec.c:

- snd_pcm_add_chmap_ctls()
- kctl->id.device = rtd->pcm->device

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
