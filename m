Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B362C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DDF2071B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2qv9B/od";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTu6o2U3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7DDF2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Hn0q/IwWtFUABh84BqXAQ22+LeeHh5gLqqr5vy0XqI=; b=2qv9B/odHp3M2exCYUmrFF5qr
	P2ynE71cNw+3Xpk/SON25FaGLv2fTai071C/LCiStJhFtF66Y9bB3cG0Aq/4/TnKEobN8Th6a+1DA
	SMmONTDHkJ7XiVoc7qjY3RUH7RimjprvU2AaDT4yjXydmXlaEUxIXCdyErlOHD0aBL9d31xeqh0pr
	k+LUBwxJwWQ90OxiyHuFo/dNPVdbyRnmlW0EPnYcLtNu9MWSJwpJkUAFR8ICD3ULooDIpo3oI3MIp
	BXiHdR5YGdDr4V0exGsA3p+QEABFfK59WvEH8eXBbYi4aGAJ+/O0neLY/cHYbSGcgSlstmSY+rCGT
	uItHR3J3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO6V-00039e-1z; Thu, 27 Aug 2020 20:02:35 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO6N-00035c-16; Thu, 27 Aug 2020 20:02:27 +0000
Received: by mail-pg1-x541.google.com with SMTP id o13so4142220pgf.0;
 Thu, 27 Aug 2020 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZGo/LXMWA743P+olH7TRkE+L3lrjbqKbRZ3LxAQjPo=;
 b=dTu6o2U3wIn+j1v+r3MXNSN35FUN+T2Ga+C6IEZhOqyDDBfBE3A597INaQykc/zK5N
 e29lSW8oIy3von1EDSHzrXAVeRMAvW1ed+lYOELqagYL5sR2inJeqwfBbqXV4FK6sCMk
 Hfm42l4h/LTOWilsOGK7JOMAPAdmKuTI7ri15EU81fGomSsgujOEykmO3j5u3b8d00JT
 y6G7L3ZjYiblAjxovxtPZnHCI16Md4+vLhzEs1tK7lNien1ry4pAHrXAiN3tLj6C5xlc
 yK8rJWblvVYrsonzu63yJ/EgonbAcYBoDqsF2KrONQ8csAQTA+38zWBBwcTvD1DPUifV
 GLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZGo/LXMWA743P+olH7TRkE+L3lrjbqKbRZ3LxAQjPo=;
 b=eOO+FwzAs31dfUkn8T4B/tBd6zg+l4/0XW5mku+ZOmXIbfJ63415mel0wF94/uaoP3
 DeJAt/5lSlbzOe/x+TPT+0Tr9v1DfRp8tFysvq4qP1/Gm8jinrIavn1syO89IqRKr3tQ
 6sW2RWa4AXZLnOVtzpD6foSMg30Q/jEkSpkl3RkQ9xdDetPlQ81CAWEnP3XFsXuEB6go
 1ujdvIDYunA7zoui8BLX6ntTwTGiNLqZxXzJu63Dr+j1RvWPdZf2M5ctAjJEH0bBePeH
 npXxKNKbpRT58O6WM4g3SmtA7ZJsTtyTb9BoANngazXZ9BOqr+y6vlgsXZMEc1u4dzG7
 FrYA==
X-Gm-Message-State: AOAM532s5xFmM07DE3LpSpZG13Dvu11R1DkwcvB40LWt1eiBFw0T2aN6
 50/KPQHgSBoaVzA1IKRrNBGwr3Qcyz3SizCiZuk=
X-Google-Smtp-Source: ABdhPJyrJVOQaAjVOgzTH9Ia08ZxKIpsXNc3Mfx5rESAlYI8qMYgqJ1+s8Yh5E+7TlXUKU+iWqHjdU0n6g2EX6jm0oE=
X-Received: by 2002:aa7:95b8:: with SMTP id a24mr17478277pfk.219.1598558545190; 
 Thu, 27 Aug 2020 13:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-18-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-18-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:02:08 +0300
Message-ID: <CAHp75Vc4R_PkVSYFGNr0UO5yJ+dLGhVV-G7vznGnNu_aCVoTVQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] iio: magnetometer: iio-mux: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_160227_156028_E1E428BA 
X-CRM114-Status: GOOD (  19.69  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/multiplexer/iio-mux.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/multiplexer/iio-mux.c b/drivers/iio/multiplexer/iio-mux.c
> index 6910218fdb00..d219d4a86657 100644
> --- a/drivers/iio/multiplexer/iio-mux.c
> +++ b/drivers/iio/multiplexer/iio-mux.c
> @@ -354,11 +354,8 @@ static int mux_probe(struct platform_device *pdev)
>                 return -ENODEV;
>
>         parent = devm_iio_channel_get(dev, "parent");
> -       if (IS_ERR(parent)) {
> -               if (PTR_ERR(parent) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get parent channel\n");
> -               return PTR_ERR(parent);
> -       }
> +       if (IS_ERR(parent))
> +               return dev_err_probe(dev, PTR_ERR(parent), "failed to get parent channel\n");
>
>         sizeof_ext_info = iio_get_channel_ext_info_count(parent);
>         if (sizeof_ext_info) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
