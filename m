Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C53C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh3Roei+5+pXfMiCrWjcrbEojBKvFlO5EFkcB0TryOE=; b=BB/rm/U8Yzv4Gb
	ONtVpp+iQrDGlR9baD2t/JpPKTjQ4IxUplSoQYh3F3ILJI7/Gb835Iexi59DtiOaHloOeRAn6oGdm
	Kmkg5lAh96BTjhRmr1SwTK4D0rc1EUGT+enWvVS8F0VBui6GrkPAwRP548osjIV8Xaxpy1KEI2COV
	gLNyZESGgbRFsXlepTQ/4JM7Pte/XsB/YQJPRpDv7hKqzoJvK+h/fd0gXb/tF7yjIXn+AW3/6C9sZ
	I3xKGoqtio0amVGSWu/tY4hrIpcpXcfnEuMI4AQBz4BReEw0XhMCaM2E0U/vj6khFC+X6r2l58Mov
	/VeSh+1j6evikodaI6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muHnI-0053fM-U4; Mon, 06 Dec 2021 17:28:52 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muHnB-0053ck-Cm; Mon, 06 Dec 2021 17:28:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id y12so45819325eda.12;
 Mon, 06 Dec 2021 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Iwam9ntoKrXXFMW9GBBg/CP2/SJeMa2eol8Tt6Y/4w=;
 b=Sd+DbBx50iRRQDCEahfK/6JoYwkIW3PdLQoaN+VzpC2SB0+lVKLqv+7X5TPeOQDjX4
 xXZb28UYQhfHSN1ztNpmV+MKnyjh5R5gaRAfaWnuTWUUwOaH0h3dkVzroeVXtlgTmXgs
 pxcCogtoYtZgkBfFk4k7L2Y4Kh5AuakypT5UR4DQEzhlp/fTVxC9wKdgffqhEYiKY/GQ
 gYQWTcrf7tski3w4QdbRc3hPIb81CxU41+byZ2jHxSCfVgT6G/jOa7Aw+v5+pKwGOfGl
 ZiOr0pnqHwXYQRVtOv1X20hbypEhzSgiFXoQw6+zwh91goEhayT+AW/fu57OBK4XSXby
 R7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Iwam9ntoKrXXFMW9GBBg/CP2/SJeMa2eol8Tt6Y/4w=;
 b=IFC5aPxI5TMehHFqsLlMZYz/u1wE31ZA+a/uvbGnn0eqKipXa1DcG6Ii+0MkZ/p5G8
 //W3ESxu2ukpbk+RYT/GAqO0jQddkEZMi4z93Fay0d0zNuwJG4boB90ctOA8Y01LRhAL
 1/z8bHhTyIn8bztWaQJwQ5/ogP0oOuv3rtJc6RcsqzE6hVp0w0xLIvAGftO2xsTyDG5F
 whksnr1gYML16Yp8RI+zN4AtGyRcKVf1ohW14HW3ETdlgMZeeFZaTsz9Y/RILSTqnep9
 VQ5OT7dEk+cn3c3zMHDAzOw6OwtaWUFpdYQbQf3SMKZp9NJ1qA4/zJVRdR7DXzteZb6I
 N9HQ==
X-Gm-Message-State: AOAM531tFGkR2dO9ewsS7KkGZVECCmCQZ/8gbJMbuJkp07u4op+7BZIY
 lrizm3ZCrlKswORgwRI5PqWLrFyxI2lz/rcifqADSN0A
X-Google-Smtp-Source: ABdhPJx9/dmmMIp0k2nEWYLkPyQHjbt6A++ofLwsYD9nTGyKv6qQM4UpeYPChbhnOnPF9AqF77qtzNTlFRyRQ7ZtUy4=
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr602667eds.386.1638811723308;
 Mon, 06 Dec 2021 09:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
 <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 18:28:32 +0100
Message-ID: <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_092845_480601_22331B7E 
X-CRM114-Status: GOOD (  26.50  )
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

On Mon, Dec 6, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 05 Dec 2021 at 19:08, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The out-of-tree vendor driver uses the following approach to set the
> > AIU_I2S_MISC register:
> > 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
> > 2) configure AIU_I2S_MUTE_SWAP[15:0]
> > 3) write AIU_MEM_I2S_END_PTR
> > 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
> >    mode")
> > 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
> >    stays at 1 while for older drivers this bit is unset in step 4)
> > 6) set AIU_I2S_MISC[2] to 0
> > 7) write AIU_MEM_I2S_MASKS
> > 8) toggle AIU_MEM_I2S_CONTROL[0]
> > 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
> >
> > Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
> > interrupts are generated anymore. The way this bit is managed by the
> > vendor driver as well as not getting any interrupts can mean that it's
> > related to the FIFO and not the encoder.
>
> Not necessarily. If the encoder stops pulling data, the FIFO will going
> over the DDR. Since it generates an IRQ after reading N bytes, IRQ would
> stop too. AFAIK, if the pipeline is stalled, the IRQ stops anyway
ah, right. so I think you're right: it can be either way

> ... but this is not really important
I'll remove that section from the description in v2

> >
> > Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
> > closer resembles the flow in the vendor kernel. While here also
> > configure AIU_I2S_MISC[4] (documented as: "force each audio data to
> > left or right according to the bit attached with the audio data")
> > similar to how the vendor driver does this.
>
> I understand the part of HOLD, not about FORCE_LR.
> Is it necessary to fix the problem ? Have you tested without this change
> ?
On my Le Potato board (GXL / S905X) FORCE_LR is either enabled by the
bootloader or being enabled is the default value.
All versions of the vendor driver are also setting it in some way,
including the latest one that I have access to [0].
I prefer to keep this explicit write in for two reasons:
- we're not hit by surprise if some SoC/bootloaders don't set this bit
by default
- the code in the mainline does not skip anything that the vendor driver does

To specifically answer your question: I have not tried whether this
bit needs to be set and if unsetting it manually breaks anything.

> > This fixes the infamous and
> > long-standing "machine gun noise" issue (a buffer underrun issue).
>
> Well done ! It took us a while to nail it, Thanks a lot !!
Thanks - this took a while to figure out but it's great to finally
have it solved!


Best regards,
Martin


[0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/sound/soc/amlogic/meson/audio_hw.c#L194:L202

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
