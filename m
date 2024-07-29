Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314F3C3DA61
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBcv8IaERu37w1Lzp75H22ty4WaIFc5iztGqXlGGkoQ=; b=TiItTov+OPQqYx
	E5yNa6DjOCvHPb5BRXYj3YU+BlJBfE+N6gsdwLOT6vkHKd2qW/I8/VcNABBAVQ3gjWqKgCfGgIhbD
	ayRb6vbVJSdOeuPpRvaGUSbc2n5svD4r9NshqIqoildRLnQUTPDe9sir1eMhGazDTGEu3TN+BHU4j
	xlqF3/CfDACJDtosjP4NWj3SGSbgX2/Qq3VR1MEJWejQqPlNK3RDjs/B0LCIj5EUB4ykOUFhmeiGX
	cZD+hYWK54d5Yyw201ujMZmV2JwOntVAz67XlKHXAd6PmoSXxlA+Ig4cEJRv1i3X1LtHGJDJIufG9
	j4nDp0SrSmHhGEb0Exow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRAd-0000000BWwQ-0Blz;
	Mon, 29 Jul 2024 14:16:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYR9z-0000000BWld-2tsm
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jul 2024 14:15:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so14173625e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2024 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722262533; x=1722867333; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=w1ciX5952tDofJYyF2Y8FQBMVnYTKKH0SZEnM8/IosbKQtBL1zmB5MEq9dTk+9GV7u
         2wThT6lufEL0H56YbNI1ukPM/+cwhe1hlls5JrhIjfj4j+llJM31jWsMEvZ6zOYtQhfi
         /RvhkaifAsuPlgTVQRK3CVfcaMm69LOZ7n7c0wdPQEjhkbU9FZQ8+lJGm1uLAhKn6H71
         AQCq7Q6zpUcqrQYDZ6gLXCkquqN+vlFgKAHX7/3BwineHnlpbpF2VnOPZ7RaTOThe5wx
         GfnO6KgeSvkzR0od+aKJyKOrMQaAUIDyvIF1LukZ03Pey7vppRsgDOod8hPhqKwpxEMX
         fVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262533; x=1722867333;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=GwUQ36URbbHPHfvHqUDhtEcPxl/SIuW48O8j95tYIy4HflV5G1ii+LswDSINR/GoHD
         hLY4uYNGyG9u8xL72V4nabqJXx0ISuK4aaKo3DujntBT2YhS9EKzTQ8+Jl/cqCxBSsgl
         euGLpl0u3yXGlAhAjFowsHhdzELm+46S5V+fPbaIub5izXM6fsgsw9AQQYQSR7RG6BAU
         9cHRZHXybKw24OypMBMasyZmf9oMI6EXQD0/yF9ozvUlRXZoF8zhj7E31HV37OYYV1ff
         ZkzOkJ94u0m5JpEuNouYqmM1Q05Z8x16PjrjAOKyku9BmkHEr6l75s5s4Y/q1Sf4CPfM
         bdhw==
X-Forwarded-Encrypted: i=1; AJvYcCXsQcL58NDZklL44J1R/tpXafAY1qZL2fsQvqgAWH+AXx/jbw1Ut2gI639YWUb0yeykvKPiU3hopONyTbBqqLF1DuReOjHgR3mEGhank/58F8U=
X-Gm-Message-State: AOJu0YwfGqUVNtvJwhDGJVke5zPdXZQ6f58DUGzkB7M0Lt3P7xebCEig
	kIvWbKPkGgu7O3Y9CTxpQpQ3JjEZf6+Nmf+1Ys87dgW2SC0dMcNTWbkbyfsi6Xw=
X-Google-Smtp-Source: AGHT+IGvhW6W5lhj8wCPR9kGfAvnftNlZn/nJWbDUFlhvd5DqspfoHe3v4BYeRLrWpFDIhKz3FbMyw==
X-Received: by 2002:a5d:5184:0:b0:368:6596:c60c with SMTP id ffacd0b85a97d-36b5cefdef5mr5201083f8f.30.1722262532993;
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm12284340f8f.59.2024.07.29.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>, Mark Brown
 <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  <alsa-devel@alsa-project.org>,  <linux-sound@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240729131652.3012327-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Mon, 29 Jul 2024 16:16:52 +0300")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
Date: Mon, 29 Jul 2024 16:15:31 +0200
Message-ID: <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_071535_767732_A038B7E5 
X-CRM114-Status: GOOD (  18.05  )
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

On Mon 29 Jul 2024 at 16:16, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Raw spinlock is needed here, because with enabled PREEMPT_RT,
> spinlock_t become preemptible, but this regmap lock could be
> acquired in IRQ handler. Found by lockdep:

Assuming I understand the problem correctly, any driver with an IRQ and
using mmio regmaps would be subject to this problem, isn't it ?

That does not seems particularily specific to this driver, so changing
just this one like that does not make a lot of sense to me.

Maybe mmio regmap should '.use_raw_spinlock = true' by default when
'.fast_io' is set ?

Mark, what is your opinion on this ? I guess it is not the first time
this occurs ?

>
> [ ] =============================
> [ ] [ BUG: Invalid wait context ]
> [ ] 6.9.9-sdkernel #1 Tainted: G O
> [ ] -----------------------------
> [ ] aplay/413 is trying to lock:
> [ ] ffff000003930018 (axg_fifo:356:(&axg_fifo_regmap_cfg)->lock){....}-{3:3},c
> [ ] other info that might help us debug this:
> [ ] context-{2:2}
> [ ] no locks held by aplay/413.
> [ ] stack backtrace:
> [ ] CPU: 0 PID: 413 Comm: aplay Tainted: G           O       6.9.9-kernel #1
> [ ] Hardware name: SberDevices SberBoom Mini (DT)
> [ ] Call trace:
> [ ]  dump_backtrace+0x98/0xf0
> [ ]  show_stack+0x18/0x24
> [ ]  dump_stack_lvl+0x90/0xd0
> [ ]  dump_stack+0x18/0x24
> [ ]  __lock_acquire+0x9dc/0x1f10
> [ ]  lock_acquire.part.0+0xe8/0x228
> [ ]  lock_acquire+0x68/0x84
> [ ]  _raw_spin_lock_irqsave+0x60/0x88
> [ ]  regmap_lock_spinlock+0x18/0x2c
> [ ]  regmap_read+0x3c/0x78
> [ ]  axg_fifo_pcm_irq_block+0x4c/0xc8
> [ ]  __handle_irq_event_percpu+0xa4/0x2f8
> [ ]  handle_irq_event+0x4c/0xbc
> [ ]  handle_fasteoi_irq+0xa4/0x23c
> [ ]  generic_handle_domain_irq+0x2c/0x44
> [ ]  gic_handle_irq+0x40/0xc4
> [ ]  call_on_irq_stack+0x24/0x4c
> [ ]  do_interrupt_handler+0x80/0x84
> [ ]  el0_interrupt+0x5c/0x124
> [ ]  __el0_irq_handler_common+0x18/0x24
> [ ]  el0t_32_irq_handler+0x10/0x1c
> [ ]  el0t_32_irq+0x194/0x198
>
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  sound/soc/meson/axg-fifo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index ecb3eb7a9723d..a22298f74b35a 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -328,6 +328,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
>  	.val_bits	= 32,
>  	.reg_stride	= 4,
>  	.max_register	= FIFO_CTRL2,
> +	.use_raw_spinlock = true,
>  };
>  
>  int axg_fifo_probe(struct platform_device *pdev)

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
