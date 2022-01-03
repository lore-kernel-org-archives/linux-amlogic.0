Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C536BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQQuJYC7CmBnTdxcrjNTLex6J91EbmTN3yvpMc3nBZo=; b=VHxc/FMyjDeVtZ
	sTs9/ZLRn6vIXDPJ6yUmlJzwXzDW2udVYINRwc9ZrgJjUAmFgIbuvrxFCj5UFX1polozmTQ+44Hy1
	q9IpVKnYmqjctFiJidva9zxfZ6cCFy1E10S9tjN6UQ8J85fK2AAGrksKyAWfEXvOhgXys7EzbQElS
	jddE/Zwmwcj9bGZ+P7qIWr7svUxFKQ/Ehygo/wwGCmKx41Zf5j3vwbal3LRs7eedjs/dcITaRAjI3
	ZIFGWABIU9vZ71Qkky6+P2feSA8w6CjOAQyDWCB7DlqgkavghBsOtwX/o7mWeCwJ18sa92rF6GwA9
	7m0N6PWarCyJ1qZCapow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KJJ-008kOR-7C; Mon, 03 Jan 2022 10:11:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KJF-008kNh-0z
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 10:11:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e5so68924500wrc.5
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=d4U06QtxKLvpS3QwhJk/To0yMhx1a1d3B47g5ui1Y04=;
 b=N73pqWLKMdYBN+pI9KTb20m5dxZSEgGZZvVAFMAHmWsQ8Hfda9VmQtsEBnWSLEgu+c
 P+m1o7k3pOJu5kxb+Pm2cFWtu+fCS93F1P7jrTqbW2ewfTHsG1IcSABPAR9yfhy1gw6J
 ObWUOIHaV5sLU5O8PwurnR65PPUe4qJcCxpDPjiJQdGHBawifdlTV3k0HkMqx0Z91TEW
 0E5PTxU9/sdSQ5n4dRVgiMqs0ssbGlwIizRCT47tEiDzF41JX/X6jqbSBIdIci8j0qIq
 MjHDq3c9S/Qw9VJqBahq5+75DGbc/7v6mHV0qLrANZiAjhnLlqsbOohfjm4UMdwdhXHl
 y4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=d4U06QtxKLvpS3QwhJk/To0yMhx1a1d3B47g5ui1Y04=;
 b=qiRAwdb3/gRTi9/CNOUccEZX+JChL+umUBPoqcnyC/Q+HJnifmfXF8ShOncBt2PIV1
 oRkVRreG0m8cPtx+CQEyuEXAjUwUq6IrUCxzJmOZNx5BVATqkPruic2ASn9P5a0SGbJ5
 pEYybmRr0L+Wn3syh5XWkCd33j7q+5rmyT1k4bAq7n1E1URDEPTg3qQcY3/wqhFWvRo3
 5X3H4x9wLFacA2eS/oRd1gmlLUoTh3muBvjH+vmmW2K6lsQX/gYuvpatC1hkcIkBOn46
 /e5JRxiVlENd8wrfa/ko2Ny/aLHd1vfoOQ26wpuZJXOE+XH2T6IWXPUz90RcHWmVQ+rc
 EQ5g==
X-Gm-Message-State: AOAM531XoAZUhuLFze2AS181FlSPS+00LF0dxDq340A5m4mqAUsIWYFs
 id6OkgcT+nF/oV9agUwIFYhF1bZN3SLgkun3
X-Google-Smtp-Source: ABdhPJwBsSg18zloX8QHWVynGr6SCd20lAOIcyUGf8cgq+SDNIimM752PDm8+HOIssQHmVIn8nb6jw==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr22919440wrz.520.1641204678700; 
 Mon, 03 Jan 2022 02:11:18 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm32816239wrb.2.2022.01.03.02.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:11:18 -0800 (PST)
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Christian Hewitt
 <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Date: Mon, 03 Jan 2022 10:57:00 +0100
In-reply-to: <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
Message-ID: <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_021121_141241_D2ED6045 
X-CRM114-Status: GOOD (  12.55  )
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


On Sun 26 Dec 2021 at 18:30, Jaroslav Kysela <perex@perex.cz> wrote:

> On 26. 12. 21 12:43, Christian Hewitt wrote:
>
>> **** List of PLAYBACK Hardware Devices ****
>> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>
>> numid=12,iface=PCM,name='ELD',device=2
>> numid=11,iface=PCM,name='IEC958 Playback Default',device=2
>> numid=10,iface=PCM,name='IEC958 Playback Mask',device=2
>> numid=9,iface=PCM,name='Playback Channel Map',device=2
>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L136-L188
>
> Have you tried to reorder the dai-link-# sections in DT? It appears to me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the internal PCM
> device rather than the exported PCM device for the user space.
>
> If the DAI routing cannot be changed, then the hdmi-codec.c should be modified to export the correct device number for the user space:
>

The DAI routing is dynamic, especially on the AXG series.
There is actually two routing stages:

1) Between the user interfaces (DMA) and the i2s/TDM encoders/decoders:
   -> This is using DPCM

2) Between the i2s/TDM encoders and the HDMI controller:
   -> This is using Codec-to-Codec links

The problem exposed here is
 - How to get the get the "Playback Channel Map" related to the pcm
 device of a given playback ?

I don't really know how to answer this.
As you noted above, given the routing is dynamic, I don't think the
problem can be solved with a specific link ordering

However, on these platforms, there will only be one such control
AFAIK. The one you get is the one you are looking for. It's not ideal
but it's a start.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/hdmi-codec.c?h=v5.16-rc6#n805
>
> 						Jaroslav


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
