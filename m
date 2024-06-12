Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B4C27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFyuBPQUL+KvrzFerCYlJtAz2+2lxZnFAgOw2xav8w0=; b=0TVMHgc+GSe1Jd
	0VJ5Ximvdj5wYZCatPIx9ep9/Un5loJKcsvjTltyZi/q8T4E40gBIarGGeCRWUmdeDQiOzby+wjuR
	x8r62TzuG9ynu6gWgX/+IsdYW+PZNI3NwIFQ6l21sG2AnhUfFZSStfHhkXUdYub3a4Y3sNZs1JPW3
	bWcjszXxrlCBnUTOl6M8ecs0qAm/FqczqywfUvUTeXWZ78GrycXg4zd6tU6inXQj0hztobWPrSOLn
	5Jopv8qkNoqWk3b/DNdJXSnTqFem6Pdzbc5FxJA7WUgiFjBJauiTiZ//WR8/MyL86x2oK5woG8Fx3
	e2tFmBE+CIAMhgEyUmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPeU-0000000D7bE-0e9f;
	Wed, 12 Jun 2024 15:12:42 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPeP-0000000D7YB-26SH
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jun 2024 15:12:39 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dfde5ae0aaeso1580260276.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2024 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718205156; x=1718809956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui0asLPnRQrSAoLGngUgtvhcpdpuHV+OvoZ2KNM3Fig=;
        b=oQlrlN+iX2iQsTHw+l82Ezw9E1udM6UhPGeOiSCMZWCjj9B53Mgk86ukJET0q1ha6B
         Qqrs50rOYxLMj5bj/SqxYzRc+b+daWIw8IVNSJIYllFmkltV5ck8YyUEK5O9sruQROva
         nEFruoRKYcI36LOsp8NMoossvyT3wKabh5AjkmGT5H8i8Z3euia2pU4eucVO385r6mkB
         b0tRpRJp9FyqjmCu14CK5Ul3N17iUorGJlYuQDd0JGegoeEOAM+kcWlRh/eWQU8uJTRa
         5RYsDUIVfwR2YPxHmQlMPUE0YFBfWsQtICd6kCVTQZCI/R4fnnNlH4KcItEXL6PpooBa
         +e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205156; x=1718809956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui0asLPnRQrSAoLGngUgtvhcpdpuHV+OvoZ2KNM3Fig=;
        b=sDS5VywnQ1b/keAMPCE3N7yR8PcI3AEdoPSzPSnE8hOSlz3Y49REiLgOaG/h7kjwYb
         iilnVJBapo/rtZvOVEunrjVXeJu0IMFnb1qq8MdT0cn5Vprfp+zw3JvZyxsJaMYulcAV
         7PMvpbuwhYMzKX8oqCoRI3urvhyCR1qEHTapNovvct6PZX0Pb+2vlWFAi9BRAXKBPNIU
         lUirSpjWr0U0QSFvZRfy+g3WeE9cWPhWUIfk4oKPuFt+gf1BTxMgNCvkzhKsBn7n3plV
         drDi8kK3pxmj5YH7DCw/seQZnsd1mshVnYJeRu2V02Zx/Qa+Heqtp0LSoh9NtSf9ZlBb
         N4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvIVItWrH+qwzgOA9z/egJ+r1O0Ol7E5CxyejrXaaqrgW1JjrrOTvR2JStotEfJhB99+oBVPT6zSs58bi+e3PftzJi15/cbyYqsbG8Ive6nBI=
X-Gm-Message-State: AOJu0YyRE0zv0OPftr+zzQvkhiNyqocPlMz/JsLuNixBJwiLKx2nBRW5
	ETkBmAe9/lCgtOiTai+Yy1Pk8NlVfw1Yy0sdMSwOi8nRkFASWNYVCLa5iBXAyPuQR46ZfgHDXKT
	s/HW8RS3cCl0WInBodfS3npvbXpBnaTWuFZj3R0zXXEt9nfgR
X-Google-Smtp-Source: AGHT+IFWoi12CdmKen6XCavHsYiaGeZ6uNOT7Y113dWDJBAN7YMJe+nUPHOOTDfX1o7vHsPrrRKwh1FWKxulzT69BGo=
X-Received: by 2002:a25:6a45:0:b0:dfb:538:df1d with SMTP id
 3f1490d57ef6-dfe6852d794mr1893187276.43.1718205155725; Wed, 12 Jun 2024
 08:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
In-Reply-To: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Jun 2024 17:11:59 +0200
Message-ID: <CAPDyKFpJdOGq7VneJfaodo2Jc1jc8pfnoNxCdRW5+T0ofdabtg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_081237_577279_C074BAAB 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, 11 Jun 2024 at 01:13, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes meson-secure-pwrc.c which, although it did not produce a
> warning with the x86 allmodconfig configuration, may cause this
> warning with other configurations where CONFIG_MESON_SM is enabled.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c     | 1 +
>  drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c | 1 +
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fcec6eb610e4..fbb2b4103930 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -648,4 +648,5 @@ static struct platform_driver meson_ee_pwrc_driver = {
>         },
>  };
>  module_platform_driver(meson_ee_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Everything-Else Power Domains driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> index 33df520eab95..6028e91664a4 100644
> --- a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> @@ -376,4 +376,5 @@ static struct platform_driver meson_gx_pwrc_vpu_driver = {
>         },
>  };
>  module_platform_driver(meson_gx_pwrc_vpu_driver);
> +MODULE_DESCRIPTION("Amlogic Meson GX Power Domains driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 4d5bda0d60fc..b50e5678abe3 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -355,4 +355,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
>         },
>  };
>  module_platform_driver(meson_secure_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Secure Power Domains driver");
>  MODULE_LICENSE("Dual MIT/GPL");
>
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-pmdomain-amlogic-f117930600ea
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
