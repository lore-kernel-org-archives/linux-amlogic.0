Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0F4C83F03
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jul 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mq2qMcctHysE2IVuM1XZVrI9qP7Zrl/Asaz3WManaSM=; b=kiBHeoGkO+ELCt
	uxFslH0FJ8tTCQZNXxjrg/Gz0RDHr17kP8jvFmCw4N1hBKFotTCRLslbXghL1H8WdeAavZYb53XO3
	psRhZrdHtbIa7fqeIK98dy4BL6LBhloZuKaFNOouW+iW03aXOh2833z+/38gFKR5t0QPVVLvIUHUb
	tMHJO5I4p7viZAiMRb4wEh+NkM9ojJvTJKQPsiSUWgWrOHzaUDqep/Yq6bPF9ZHiaLhH9WN4neVCI
	fO+XKigILPTYw48145Is2sZGi2W3nynN1HexcSsIJ8G0iSfmGdS9qdOxyVnHfmqEeC8DAb2Jn9Hgc
	uX6ALCKSR11mjHEBdERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVxs-000000090op-40qI;
	Wed, 09 Jul 2025 14:40:04 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT1J-00000008VXH-2xnz
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Jul 2025 11:31:27 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso4574591276.1
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Jul 2025 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060685; x=1752665485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=Y+EsLCdJHhkhTKOx+yu6oD+JXJFtkKMQA7kOEJrBwEWvbTtiUo8+y+/c6JBg2WubWC
         PZSd9Pme5rw7JHyaD8j/79KuXrXGGT17NYVTPDnek4/h1RyaXqinvgIAF6B02m72V9Vu
         t9URX2/ovFwBMWmKukyuHd8bfD5uYbR3SJxyJgzSV+nrsu9eVM7K24JilxlahIiBGfLF
         g5BYFX/yCuofmCirslYpD+zv4AH4n+wWfSSv+P4qPYcDNyydq3/XqsBhh3Cay/eD7Eso
         B8UUzG7MpF6fNhWH+NLYJqcut2okPp8B+1utTbCMBhaf8dDob7xr3cWGQZPvhe3v6Vd7
         LJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060685; x=1752665485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=bgLp0Pa+b+qUqvV/ffce2nEVdpK9F14zX9z71yH1X362IJR6fiBFAHx0UR8ji8KwBF
         FOKjTgeS1GS/pTH0tAQCUV24mDM1rz6zQ12ulRoZ3PmcLi7Fo22UO99GppQF//hBNPDa
         K9cBpZNzX1Il0+IMLmgBN70v7L9ULRbqvQfHjGeF6/A6cm+Cu8NJFnH+jAoI+7N+N7SM
         l6j3xMSnC616n6V0J/42XBHUa9Dj5n4SdHnl829JI8BXs2IwIkO/RUjgNE6i9phsI6kD
         36pofcsuDGwLV+X8nsB4smhiWauKccYjlkPJBgJvjW7J3nSeQWUn8NVJbEEj0Swf4yUe
         Aguw==
X-Forwarded-Encrypted: i=1; AJvYcCVQmJpbYWjd/PwcBTqQb5s9rPKpw0+manL3kGXHnq4vZZSrx1CritWsRZhOxnf4QFliyfqF63x+xVGSdB1Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10NxI06yMhpkEeuJkB9Wd9CxozYv0k3j9ACGntPNL2+7TW6Xr
	4g7DJpxpzY8gIepxhex/0YVKXWzECEAzzC4E3bX/3Q/q/TaElSEAQm0RfpOJzqJ9h21eM5pl0Y4
	+Gn/CG8084MugHjOv5saZVlc/pdNy0K67/LZA9mp7AQ==
X-Gm-Gg: ASbGncsY9sX9uCWBCg5Qohe0ed3FeGJOvdEIlw2OR2J1RWHBcwfhWAnkFyDaAoym2wz
	OKuRDidTgEe7Ly3uZpaOM0IcBKHBtKhrp7aY1UEOoJlI/jOoMYifLtGf4F9AWSODr9dklyaOfeV
	tVWCwoxwV5VJiX/K8yxYkgm48eLXUxlIBpN5h5omZj42zcNWLAJqxBsr0=
X-Google-Smtp-Source: AGHT+IGU+pji3u6/G/drrXD9f6hzZ57lAuY7UQylTxtmRHqJxsYBUBEDT5Y4GQThZIBDfvEDAxWsUuXsGoMFEvARnXI=
X-Received: by 2002:a05:690c:6901:b0:70e:2c7f:2ed4 with SMTP id
 00721157ae682-717b13c163fmr32649447b3.0.1752060684637; Wed, 09 Jul 2025
 04:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:48 +0200
X-Gm-Features: Ac12FXwjFFHXtdaaUqyy9FfmUbPYblM-fvRv4hnhCWqr-KyPAgwmhH4mdvxEDsE
Message-ID: <CAPDyKFr2VPbQRRx6hYp4e6by1O4LvpD=WwwP2gb2KCMTB8uQGQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_data
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_043125_749332_03FF8977 
X-CRM114-Status: GOOD (  15.70  )
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

On Sun, 6 Jul 2025 at 17:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct meson_secure_pwrc_domain_data' are not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
>
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    9248     408       0    9656    25b8 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>    9344     304       0    9648    25b0 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested only
> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index ff76ea36835e..e8bda60078c4 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -342,32 +342,32 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>         return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
>  }
>
> -static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
>         .domains = a1_pwrc_domains,
>         .count = ARRAY_SIZE(a1_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
>         .domains = a4_pwrc_domains,
>         .count = ARRAY_SIZE(a4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
>         .domains = a5_pwrc_domains,
>         .count = ARRAY_SIZE(a5_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>         .domains = c3_pwrc_domains,
>         .count = ARRAY_SIZE(c3_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
>         .domains = s4_pwrc_domains,
>         .count = ARRAY_SIZE(s4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
>         .domains = t7_pwrc_domains,
>         .count = ARRAY_SIZE(t7_pwrc_domains),
>  };
> --
> 2.50.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
