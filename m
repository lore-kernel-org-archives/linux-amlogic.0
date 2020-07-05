Return-Path: <SRS0=0hhE=AQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47E6C433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 10:07:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7192620771
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 10:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3bbcCi9B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilGMCJ4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7192620771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3AOE47zjY13PJu4oECvL6xY7TYhANoxCJZs8u8U0FZo=; b=3bbcCi9B8bxTMrdNbZ7wgAnPW
	dPGdmBkHr8RUE4Drv7exrhfJc+7gfIyXRmGHu9/ZI2s0VteTQN3K+o2fLNcU/kPsrmJCz7yFE/Mem
	U6mZXRm26SZyUAkKHHMiMkV9oO1Sin3fgUSeFzVJdhiHxxlyBDsZv7g0e5T62qlV5dKiYheworJua
	iFj9J9/EYXLZdLWbtpRdjSssivfKvxqmfb7DSFqBfI/Oum1soQC2ujcuH89sqqcgh4FDayePpJ6Wn
	+SdcvTY+oNRkcISsAs42a3Jfa6kAQVe0VO6Sp1/5nfv/o8Tfmp+2YYu3W+txhAVDq8g/Tqi5PAFiO
	kKK3m4TNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js1Yh-0006pT-DX; Sun, 05 Jul 2020 10:07:39 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js1Yf-0006oN-3b
 for linux-amlogic@lists.infradead.org; Sun, 05 Jul 2020 10:07:38 +0000
Received: by mail-pl1-x641.google.com with SMTP id x11so14212763plo.7
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Jul 2020 03:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AjWtuhASvQz4/9O5AuUktdFCzgZ5baafsc2h9IOgUhU=;
 b=ilGMCJ4OEbjAqkUkfO9wJUDww3eA+plnp5o6CMwT+drE0vBsX0K9Rn99ZQ5Wa8CF3u
 KqTaIrzlq2UVsdZGLnC/Vx9eKAf9dGz7psBYrKBqYbUYXkfSho27rE+uxZ7LZhqVLDSK
 ljreP2q07rvuI7PKvBjCycsvkaigPbWA+mqHJnBBj1N5MpgkyXyto907qlJXNb9+IMJe
 XMelf0POfRSQBtF+Kwe3CtwqbAQMbUiXXbvXdxRum0XolDjjiyoRsm9BWbJ20YIzq0mB
 m635ccLpwxwoPggmetxG9mbZ3aRQB7qjKJBn/lbG75rBEUAzLaiBLPoInog7UT8D3oLG
 qOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjWtuhASvQz4/9O5AuUktdFCzgZ5baafsc2h9IOgUhU=;
 b=eDnM3SNsZEGL4hNAoqSKDTrCWYbJb8qE+T3ZPVsRBpFOOJVNbkYvLxf3hd7gWcWCQN
 fiQh1PC8G/t7jR+hwcyg7vivIW7YNhipex+pplbPyzmw9MZy2Rg9AwDgAV8yBisrBgKS
 YWciQXzzg0FwrXdKq0kfcPEB6FvADTaLgpFdM8u5msuvNOtOJ11OQAJvx3hbvvu3K/K4
 rO90L+sZhtoftrW5dKxsQ7+aC2Ddlyr+agenylg2bQ33QEFdat/0eoqsbuD9U4awLmT9
 DHK2/MO5zqB+SGpSsPE0hc7Ne5lLZBIIArzmYaQ13d76+TovUCLC2iPhvLXhhDVpjAwH
 a7Fw==
X-Gm-Message-State: AOAM531IlzymtZ039HqEKv85Qz8zgyc0wr0bhkqLVir6b4p0mugYp66A
 SGH8Up/iR/ZW63uzgkbPY/etK6c0cLsB2vnSU18=
X-Google-Smtp-Source: ABdhPJw6Cm73j7dskOrTyfxjjqhqU6eXkTo6ceG9dOgr6boF/oD6TZ8fP6Rg1h35WWDdOgnV20P7nST13efQg+gDqQg=
X-Received: by 2002:a17:90b:3547:: with SMTP id
 lt7mr20691981pjb.181.1593943654465; 
 Sun, 05 Jul 2020 03:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200705092736.1030598-1-maz@kernel.org>
In-Reply-To: <20200705092736.1030598-1-maz@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 5 Jul 2020 13:07:18 +0300
Message-ID: <CAHp75VfFNO=oqHX9EeNdVgcQUfu7RBr6SDTWi3XF4gSQNjqzUw@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: meson_uart: Init port lock early
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_060737_180297_FDFA1AD5 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jul 5, 2020 at 12:32 PM Marc Zyngier <maz@kernel.org> wrote:
>
> The meson UART driver triggers a lockdep splat at boot time, due
> to the new expectation that the driver has to initialize the
> per-port spinlock itself.
>
> It remains unclear why a double initialization of the port
> spinlock is a desirable outcome, but in the meantime let's
> fix the splat.
>

Thanks!

Can you test patch from [1] if it helps and doesn't break anything in your case?

[1]: https://lore.kernel.org/linux-serial/20200217114016.49856-1-andriy.shevchenko@linux.intel.com/T/#m9255e2a7474b160e66c7060fca5323ca3df49cfd

> Fixes: a3cb39d258ef ("serial: core: Allow detach and attach serial device for console")
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/tty/serial/meson_uart.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index d2c08b760f83..386e39c90628 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -759,6 +759,9 @@ static int meson_uart_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       /* Init the spinlock early in case this is the console */
> +       spin_lock_init(&port->lock);
> +
>         port->iotype = UPIO_MEM;
>         port->mapbase = res_mem->start;
>         port->mapsize = resource_size(res_mem);
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
