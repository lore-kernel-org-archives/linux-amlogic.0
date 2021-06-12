Return-Path: <SRS0=bUyK=LG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C2AC48BE5
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29AB061164
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29AB061164
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51lVfI+VlDRw3/W2kTqXXXgu+MmMrTQWjkYjinuHBfE=; b=eGy5/Phzj4U+pC
	73yQT0IZ2s3X1ZQytDRGW7pDU5Xdsiq3JYDyVUFcNztFje+iqjq92aTJCKHB6S8KwEWYK8AOG3E3z
	wCDS3xUmLqjOH7dirlE1/PPZI6QHycdVF9Gjf8tXU1ga+IqpAxWHznoy4x0/PX6FMe8xfiZQSwmWb
	u50aCMVH7/yQh/1H/FWaHuzlN4jgGTRzmaeqS2nSNLkQbpu5NkdawCi3A6zUX2kD/Zg/D2ubri61E
	bZqzBcMCIIUGS6B1nQ8ym/5RrxS65zT8EMOzJo79hoVzU2ZBNoev5Uik/KdfqNCnnnb9BilVMnu79
	q8+Dafkg9rYD3WLaxrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls9l1-0095Ko-SP; Sat, 12 Jun 2021 19:57:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls9kp-0095JF-Nx; Sat, 12 Jun 2021 19:57:17 +0000
Received: by mail-ed1-x531.google.com with SMTP id u24so41141566edy.11;
 Sat, 12 Jun 2021 12:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSj8sdVPyKuxqNwS3c3vPrlyByndx0A90jNoxNm4rgo=;
 b=GC1hmd8ySwPKOkt4hn5tx3fLwsrr9R3+Qm4G6sv4gGygeg+0Dhg6af8fICb1ZmQP1k
 uTXPQK7dKx58Wp5ggJFZqrCvUUdCyqS4QyakTML8TPaEDTlGkraKktC6FGgllLJ3SR8I
 E/OUnJ9zyPYOZlUmzgFfOUq/5X5eVeFLWrKIc3CNDxjVXvF3MtqgfK3GDOaZXbfx6QJw
 Ar0RCIwrIEF0msoF5VxfqeK/kWdk6krcirVHox8gM77HkdMPxslAA6TyQZmk25a0gL/P
 HqOJLDuOvRAnBQQ6VvXE1zR1u3Z1OW3Lgl+KAI30fv2xwPinvJQHx19H4Nh5hBON9lUr
 Bs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSj8sdVPyKuxqNwS3c3vPrlyByndx0A90jNoxNm4rgo=;
 b=psLKrff3gK/Ez08N+qRWuesJoFTfQSld8GzgQc4HJ2LFlck1jKplj1HJV4Tf2PdjcU
 pAjn74bnLkQBuVzbcB3z84My7N7zAqq9sZIGYNm93I+i9CAFiAaOe+IZDhkKTerUq9Kb
 b7+M8OqVjpQOfiD71Yp6yVN2oOBoJbW/NdMbUJ+5Gl4ElhCOFu/4gOA6JLSkmns38MFa
 42k3L6S1kE7x8Vbk5tjewO1y2QOK4BEonDAQ+OlGstyjw7Aid3r6c25N0uOB33BFXkws
 uU4JQWlnNr3trxJIauPscLMCk3ztm1VhmRQX0cLyQhw8t+Dt13Nw30DaysMrBkcobVd6
 Po3A==
X-Gm-Message-State: AOAM533FT+XP/RBqr0XigwC3AA4b+YIQHsswQ3/yr3bTn+8bRJ1AEgS7
 BInWHQVSRQoNgRs+sprx27Uirr9IcqK49H5Kmxg=
X-Google-Smtp-Source: ABdhPJyQ1rVkc5IS67yf2pkZ/ig/vjDgV0kX82JL4WLFRGOyGy3xYGgZburqRcQ4ka6TN5yZTv0fO+gybh2vO9+/3K4=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr1655691edb.52.1623527834127; 
 Sat, 12 Jun 2021 12:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <1623248538-4352-1-git-send-email-zpershuai@gmail.com>
In-Reply-To: <1623248538-4352-1-git-send-email-zpershuai@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 12 Jun 2021 21:57:03 +0200
Message-ID: <CAFBinCD+9asM9-+kGEa3PhurxGqP9UwmP4aNCN9gNQPeMUyhiQ@mail.gmail.com>
Subject: Re: [PATCH] Fix some wrong goto jumps for avoiding memory leak.
To: zpershuai <zpershuai@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_125715_823465_AAD2DA46 
X-CRM114-Status: GOOD (  18.36  )
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

Hello,

On Wed, Jun 9, 2021 at 4:22 PM zpershuai <zpershuai@gmail.com> wrote:
>
> In meson_spifc_probe function, when  enable the device pclk clock is
> error, it should use clk_disable_unprepare to release the core clock.
>
> And when meson_spicc_clk_init returns failed,  it should goto the
> out_clk label.
After reviewing your patch I agree with your findings!
So thank you very much for bringing this up and sending a fix

The subject of this patch does not match what we usually have
Can you please make it start with "spi: meson-spicc:" (see git log
drivers/spi/spi-meson-spicc.c)

[...]
>         device_reset_optional(&pdev->dev);
> @@ -752,7 +752,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
>         ret = meson_spicc_clk_init(spicc);
>         if (ret) {
>                 dev_err(&pdev->dev, "clock registration failed\n");
> -               goto out_master;
> +               goto out_clk;
>         }
I'd prefer this part to go into a separate patch so that separate
patch can get the following Fixes tag (which should then be added
above your Signed-off-by):
Fixes: 3e0cf4d3fc29 ("spi: meson-spicc: add a linear clock divider support")

The remaining changes (to my understanding) should get:
Fixes: 454fa271bc4e ("spi: Add Meson SPICC driver")

The "Fixes" tag is relevant so bug-fixes can be backported to older
kernel versions automatically.

So it would be great if you could send a second version with the above
changes considered.


Thank you and best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
