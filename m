Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FDAC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Dec 2021 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ+7YbpvHJjMd7MzfD7CsAigvvpCbAJC0qrJdkSLW30=; b=CPXtX2ELOy6Rqv
	HVbhHqn6Cw0dGokmt8iuwJLscVs13V9u4yyDOumN2h9aTxo7EIkUayRLhqYexezreC75ozM0kJkvK
	Gu/GyOdkhnHhcDhyHVNUEcLVeV5L62/3u+h73BScEoJiyTYzovWhvgzfLs0c1df+XebkrfAcMBxNX
	eX5U8E2ufuzPE8NKnf6tKb09KFQvMN732dOBTNplC/B81QrYQrfhDBdGZ5uxuvsibFG62fA88Om8V
	6+R6TFEGCr/5F18tKQtyf4NCtMCM82F2O4tcMT7pC9/DOY3xgfgILTr88eSu5YPa+nqAEUl/AQvVK
	DQjHCtQCSBC0F4XOYRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1XLs-00FiOU-Cl; Sun, 26 Dec 2021 17:30:32 +0000
Received: from mail1.perex.cz ([77.48.224.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1XLo-00FiOC-Ey
 for linux-amlogic@lists.infradead.org; Sun, 26 Dec 2021 17:30:30 +0000
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 325D4A003F;
 Sun, 26 Dec 2021 18:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 325D4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1640539820; bh=Mz3IOdR6anrqXBSOsewJ/Xsu3u9G4cJ3hC+Mdtyearg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nuqJDESxYM7SLQt7GVNf9T++B8/ZQ6cuPRUJsYFwLT2zbkgJnar32yNweJGll2l/8
 5mf+hq7MuvXErWwEnoiqtVwsaPFXBjIOzPzh6dzW6WGM3acKFjPFZrrgTUg4hT7RWa
 W7dKytj+5/zj9xOTH8gscYqeL31GRkpxnfb5GVUI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 26 Dec 2021 18:30:15 +0100 (CET)
Message-ID: <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
Date: Sun, 26 Dec 2021 18:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_093028_875396_F1434DBE 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 26. 12. 21 12:43, Christian Hewitt wrote:

> **** List of PLAYBACK Hardware Devices ****
> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0

> numid=12,iface=PCM,name='ELD',device=2
> numid=11,iface=PCM,name='IEC958 Playback Default',device=2
> numid=10,iface=PCM,name='IEC958 Playback Mask',device=2
> numid=9,iface=PCM,name='Playback Channel Map',device=2
> 
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L136-L188

Have you tried to reorder the dai-link-# sections in DT? It appears to me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the internal PCM
device rather than the exported PCM device for the user space.

If the DAI routing cannot be changed, then the hdmi-codec.c should be modified to export the correct device number for the user space:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/hdmi-codec.c?h=v5.16-rc6#n805

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
