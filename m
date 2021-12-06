Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7910DC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCHxe8Mc3vK03urIFTzTxmABaRhtm1E3NpCf/sCvFMs=; b=ousc64zESDF+Hh
	gvOUIKAO6X/4Kaz0LeOYc7X30lZCu/u/kQDKhafyaMFNoHEZ2sPzl2l4mU/sNQW6I0zOMvwsgIHV6
	TBnFCwKRqTcFQkCcotaXLPQqA+CTi/fV0AddlTG0FqioWVNMHHd2MpmM17A1DHdG9UX+f1sXKNvis
	gOacv67CEXAOyZ9Ic+S6/IJYxCQsqG5Vd0hKMNbNHfICyNUA+DAwVRDCEWbOMes5GzDQ5X1gM59rN
	Ds1GcXFD+9X/mNPHxfo5hXLWc9hd2IizHoLpovSpd7i58+hZeMXaYhJbGxoQ01nUJTjSqaop2OuSR
	XbK8TrWq6VrMQM7IBa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muJsL-005Wea-6z; Mon, 06 Dec 2021 19:42:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muJsF-005WdQ-O2
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 19:42:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id t9so24659810wrx.7
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=XoyDxWHFfkkShprB5fi0ZtCpkIroCq2M/CcUOnfbOhA=;
 b=w8sZ41kEdX4SRoPkzKCBKIOpzSsDrjyDTmuhgrbbcp5zpmFSvfGY7gNpZK0p0dMxAa
 uWrDVGdLjErc8kI0vHKRLdvR+xas3quAw8WLQmicLbCVcrujBGlSxKW5v4tNRzh5Rsld
 PbPH7ba+Ou0DcR+MLaSif954Gu9KWrAzQrbAJ9dnM20t0XW2ozYroSORAQOs3yEGfsWc
 0b8NifhWMgxwmzcAJ8vTR/83pq61hWtl1y1Me57+Y0zioTVaZzNksWyql3KdwajCCzjI
 pEOgp1cAfmONXrGWtiC6RzGuyMrHDMhZRencZZIde+pIeMZPjzNdS45FL5neth6TXFke
 HUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=XoyDxWHFfkkShprB5fi0ZtCpkIroCq2M/CcUOnfbOhA=;
 b=u9E7BFBt4MB0B5MurD56EOK/xE9gRqLvYIPstRjOqVGDmuUzmuLu9q5DMngBNwa3Jr
 R4oPOsx2uMmOrI/41lZKM3px3g59UaWaXfNdQ0TiUXn67qQOY3CNgF6a6hMCvmMJpxgH
 S11cW6NNPr+Hf+2HxcAJwQPkSryXR/v1PYqro//jw6/aGfgkmhjFfmXhjzTcJkiiNBP+
 6J8Ku9xkgAsPBn10ENRyqjkMP6CvGtzSjTv9TrozLkYS/BlUre4wKK3hvm3XmbP4GWVa
 RC2r+3f9oYibcYyvYd0QC8lvvEIhVSnZeNPt+WWIvHUaYAZdCArQ5n90oPmcE5rV3/hu
 qYIA==
X-Gm-Message-State: AOAM5339n4LkUrGx6GCmG3SfpNOKGOxsGlkXhLFg8MjeUxogw4vAtbb2
 2VmKZp6TBLcWAVlg04gzA+PWzw==
X-Google-Smtp-Source: ABdhPJx8pLA553HMWI1HuMsyxL4boJMISHN0MO4UL5wXFAniqnUsOICkxQ/hPb/2AWWD4Mll3NrfjA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr44894938wrq.44.1638819726062; 
 Mon, 06 Dec 2021 11:42:06 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o9sm12332737wrs.4.2021.12.06.11.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:42:05 -0800 (PST)
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
 <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>, Geraldo Nascimento
 <geraldogabriel@gmail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
Date: Mon, 06 Dec 2021 20:36:45 +0100
In-reply-to: <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
Message-ID: <1jpmq9ed0z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_114207_863911_8F2D381A 
X-CRM114-Status: GOOD (  32.96  )
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


On Mon 06 Dec 2021 at 18:28, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Mon, Dec 6, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Sun 05 Dec 2021 at 19:08, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > The out-of-tree vendor driver uses the following approach to set the
>> > AIU_I2S_MISC register:
>> > 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
>> > 2) configure AIU_I2S_MUTE_SWAP[15:0]
>> > 3) write AIU_MEM_I2S_END_PTR
>> > 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
>> >    mode")
>> > 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
>> >    stays at 1 while for older drivers this bit is unset in step 4)
>> > 6) set AIU_I2S_MISC[2] to 0
>> > 7) write AIU_MEM_I2S_MASKS
>> > 8) toggle AIU_MEM_I2S_CONTROL[0]
>> > 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
>> >
>> > Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
>> > interrupts are generated anymore. The way this bit is managed by the
>> > vendor driver as well as not getting any interrupts can mean that it's
>> > related to the FIFO and not the encoder.
>>
>> Not necessarily. If the encoder stops pulling data, the FIFO will going
>> over the DDR. Since it generates an IRQ after reading N bytes, IRQ would
>> stop too. AFAIK, if the pipeline is stalled, the IRQ stops anyway
> ah, right. so I think you're right: it can be either way
>
>> ... but this is not really important
> I'll remove that section from the description in v2
>
>> >
>> > Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
>> > closer resembles the flow in the vendor kernel. While here also
>> > configure AIU_I2S_MISC[4] (documented as: "force each audio data to
>> > left or right according to the bit attached with the audio data")
>> > similar to how the vendor driver does this.
>>
>> I understand the part of HOLD, not about FORCE_LR.
>> Is it necessary to fix the problem ? Have you tested without this change
>> ?
> On my Le Potato board (GXL / S905X) FORCE_LR is either enabled by the
> bootloader or being enabled is the default value.
> All versions of the vendor driver are also setting it in some way,

+1
Would you mind adding a comment in the code saying just that - so we
know why it's there ?

> including the latest one that I have access to [0].
> I prefer to keep this explicit write in for two reasons:
> - we're not hit by surprise if some SoC/bootloaders don't set this bit
> by default
> - the code in the mainline does not skip anything that the vendor
> driver does

You can bet I've skipped a fair share of what the vendor driver does, on
purpose.
>
> To specifically answer your question: I have not tried whether this
> bit needs to be set and if unsetting it manually breaks anything.
>
>> > This fixes the infamous and
>> > long-standing "machine gun noise" issue (a buffer underrun issue).
>>
>> Well done ! It took us a while to nail it, Thanks a lot !!
> Thanks - this took a while to figure out but it's great to finally
> have it solved!
>
>
> Best regards,
> Martin
>
>
> [0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/sound/soc/amlogic/meson/audio_hw.c#L194:L202

With this, feel free to repost without the RFC tag and with my

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
