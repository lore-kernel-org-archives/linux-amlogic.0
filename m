Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD596C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBRmb+VhfRZcpC/2rww6eBsgAHaeVIveBBZw1C+l21I=; b=e1/H8/knoDbHve
	CgsdohUNhHj+uoehZpy1WT0011D+BdbkX8Njk2ftMdssDzBy3D1KuK58s3MAFsX4z+5cUmjWjynNv
	JQMt3ey+m1cMcwdtqvHOOJb3gc2xt8V6Mcf1JhGv5aq5q3Rgy0pJj/s6gNLz3EKdXgYGYA+xVDszq
	lGhHUM06/ZEGqwVBjiWGfL+H/hOTPRub2ihP79LZTSuitJqIG70uKwXvqmtYRYsP2N0vDUPv/GNeX
	vC2giC3443YpKPa3OuTSnREkaWuQrfoqzhwTpdTloB1EWKlzKag2TPJgGn//szWZgA866ED6ahb2b
	ZReFfF2x/wQqgz4P9UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCKp-003bDy-LX; Mon, 06 Dec 2021 11:39:07 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCKm-003bDP-QX
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 11:39:06 +0000
Received: by mail-il1-x135.google.com with SMTP id a11so9864671ilj.6
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 03:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+oCJ+atN0VFdgn7140KXkYPDq4iifagIT5svcAVP1o=;
 b=Ep5qug1EBruv9aDB/9aWQlZDgWqXSUQDFu5Nz94+GEJGr1Kggh+dx8cscNLgZoBh9i
 fLFyJ5tGZSt7ToEBBuECSOSTXY2hnoTL1vTp1/P/tVUyaXBorHCc2w3SFWb5DcvAPEuP
 fywnAkJFu7HtjKlIKaEG0+tvg6X5WlNtEWLxU8PaPAjU92xZXGBzRMhJlVGU4VNU7mkl
 JubDzWc0XYgtErSFPqkl+tgRglAvpQnz1vGiuCRUeWl/9CcIZyz4hVYOxd3fxNpamnX3
 +10Ex1kSlR5arXCsKCqmPCOYI32fYUBwGxJ68j3tN7Bt8zpj8tDGl6y5953a81pQ+Zcx
 KePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+oCJ+atN0VFdgn7140KXkYPDq4iifagIT5svcAVP1o=;
 b=FLJgpivK2cX2D4yEm66PneHzg5zz1NTOCjznAM0AFQLkBKGxggiVu8SnbFp2MjWBNV
 nJ1iZfWRlpR2GqxUNJuvF3eJWmnYF+tmBZXvf5AT/dpHRdfMMpcODfVaDRVQAFuzHtjb
 Aygd2vHykMsFa0e+f8kRqFWw5VwK+Z+Jgo6mypT1FQ4TxtIZwUWojoEs7TOdAFkb4wSz
 pvfeufUk6kM+fBzXyqPyXm2w73q2EG0vtUx3sdJdlnbBlViiOZvAThvvwnnPt2Oa9AXA
 jTRlPZh7isXI2jBhIlp3LJGm2U4L84+36cSSYCXkef1TOpcw615NKx6p0/qnzTZBkuWV
 vv/Q==
X-Gm-Message-State: AOAM530Pc8mltK8KJETmUHF6SDD4cJXK61cBqbfJJFX9Rvc9DQeKn4sn
 baJXoS4dcQenHgo+iGO5pbqBVnF8CgLk8soZ0ow=
X-Google-Smtp-Source: ABdhPJylNo4XQ/898/+DK3rweqRiecQnjMAcb8QFHkeyGGniFxiaue7P6a0YuVngqZNcRlHWUFJhKuipYe5cs3lPE7E=
X-Received: by 2002:a05:6e02:20ca:: with SMTP id
 10mr33113486ilq.246.1638790743290; 
 Mon, 06 Dec 2021 03:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20210315135545.132503808@linuxfoundation.org>
 <61abde5e.1c69fb81.474b3.97fbSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <61abde5e.1c69fb81.474b3.97fbSMTPIN_ADDED_BROKEN@mx.google.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Mon, 6 Dec 2021 19:38:52 +0800
Message-ID: <CAKaHn9JCDNVY+8aua-TsM1Wp8q4Zz87w5WZ4h2yY66kU=ktNhg@mail.gmail.com>
Subject: Re: [PATCH 5.10] Revert "drm: meson_drv add shutdown function"
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Artem Lapkin <art@khadas.com>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_033904_907532_9B50EC2B 
X-CRM114-Status: GOOD (  21.76  )
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

On Sun, Dec 5, 2021 at 5:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> This reverts commit d66083c0d6f5125a4d982aa177dd71ab4cd3d212
> and commit d4ec1ffbdaa8939a208656e9c1440742c457ef16.
>
> On v5.10 stable, reboot gets stuck on gxl and g12a chip family (at least).
> This was tested on the aml-s905x-cc from libretch and the u200 reference
> design.

What about the rate ? it's 100% stuck for any reboot try !

>
> Bisecting on the v5.10 stable branch lead to
> commit d4ec1ffbdaa8 ("drm: meson_drv add shutdown function").
>
> Reverting it (and a fixes on the it) sloves the problem.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
> Hi Greg,
>
> Things are fine on master but it breaks on v5.10-y.
> I did not check v5.14-y yet. I'll try next week.
>
>
>  drivers/gpu/drm/meson/meson_drv.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 2753067c08e6..3d1de9cbb1c8 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -482,17 +482,6 @@ static int meson_probe_remote(struct platform_device *pdev,
>         return count;
>  }
>
> -static void meson_drv_shutdown(struct platform_device *pdev)
> -{
> -       struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> -
> -       if (!priv)
> -               return;
> -
> -       drm_kms_helper_poll_fini(priv->drm);
> -       drm_atomic_helper_shutdown(priv->drm);
> -}
> -
>  static int meson_drv_probe(struct platform_device *pdev)
>  {
>         struct component_match *match = NULL;
> @@ -564,7 +553,6 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>
>  static struct platform_driver meson_drm_platform_driver = {
>         .probe      = meson_drv_probe,
> -       .shutdown   = meson_drv_shutdown,
>         .driver     = {
>                 .name   = "meson-drm",
>                 .of_match_table = dt_match,
> --
> 2.34.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
