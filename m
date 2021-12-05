Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E434BC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 01:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92dH+R71Ega3KZYaXBGCmxvmebn89GpaNeE+UdFzOF0=; b=zPgGw9YneXqi0V
	kqpkdRyBYUFIg4PsBwSTNSudtfDzzCFSHQVJpWVmhr8bu8nsNMkvAyQzV0sJVhSYty3vu6lA+Kfi9
	3905ix/D0jEA2zN4jW9mZ3T8lBbagJ194O76Gbd/qbQ3abKfcYFHr7YKxxKpr/806p8CQFmml91uo
	ai8w1LnJLHH2m0gmkgYI7XrzDv+G9hR/oN4ZO7AOCiZ3oV8bcEyOM3AmoceQeHpsbkJ6sraNVfTXh
	zpqcQNhl1eMzAsCZX4Gi/OuH3JmECcQKO4AvKI7yUpI6RDD31MFN0wMc6Px/ax3alCwLy8Bq0M7Z+
	vUmZlzEQ0CPxE05C8gLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtgVv-0017Ml-9b; Sun, 05 Dec 2021 01:40:27 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtgVs-0017ML-PU
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 01:40:26 +0000
Received: by mail-il1-x12b.google.com with SMTP id j21so6664078ila.5
 for <linux-amlogic@lists.infradead.org>; Sat, 04 Dec 2021 17:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3P6ZX2WPGBZUGrwX1sNIx6IAkSPjFdUxOLTdoRj9Dmo=;
 b=kfGd0Jpzo6Fd7lE7mHGoL11lT6QSFySbtiGKp3riIN2EwI1KDN8I8URMvZsNASeEVn
 FesP98muuzb4GTtjN2HP5iiigpRTjSnKwr3VfM9T+DsLDBl0X09/VcZZ99PwLtCVv1ds
 Nprnmk3qobq1fP9ggJBMWqKTmm8dewLPyNhe1B4u+o2LOV/nuYE/87BscIELHVI8/AdR
 r48d35LHznOn9QCJ7aqQNYTS26NtHf2QlcFoo5mcsYkE/QZ33Gh+aKhNLjGNFemf9TKk
 H7j4CjE0WBzUQrvKW6UdnYReKIewM2hQHHWu7tv1NmJiPsh/EN44CawWtpDb0FqvuUk5
 iDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3P6ZX2WPGBZUGrwX1sNIx6IAkSPjFdUxOLTdoRj9Dmo=;
 b=sVfM2v5LEmjhIWHviMJMOYSJFtLZXpyFtN2aD2Wcg7TYKWdRUd/AyY4oNpYYfUCvN/
 W6NR1F7PJQ39jeOmYo94RjV4FVK0ZiL8gNDJW82IsP+LLYwqIfDSY7wE2AyiTgm2L9pB
 VOqiFoQGgc3fkVXXwsTD6qPrdVf13jyNIqqFGBQvpa566AxUvAHIufX3c3J10vsf8wWq
 0/CuZp4ueYSTUQmkn0hfi+rwyp6egVz4NQMt8CZ2g14/qgBCTFzpKHZb84hw09PwLhGX
 8FnIW/E3Ai4KziVVG7xoiDOoK4yxUV47n1ZnxheuhyhBeiAB8mwVqB5gzIBQ0GmZQuql
 DnAA==
X-Gm-Message-State: AOAM5335BhEjTdADrIkrOd7ihz+HICyhJIkNsWvUfjkj8O556XrKJA7P
 /stQiiokUMjzgVE8K7hdmI+gps5mEd0wBig91P4=
X-Google-Smtp-Source: ABdhPJywRHsvboNCZFXyNJZ6yyLHwQxzUnZwqly9zRIXu+bOfV0AQOfJ+rvWiU5wcJhNhOg2w1OLr46aH1KeiPasVxs=
X-Received: by 2002:a05:6e02:20ca:: with SMTP id
 10mr26576405ilq.246.1638668423547; 
 Sat, 04 Dec 2021 17:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20210315135545.132503808@linuxfoundation.org>
 <61abde5e.1c69fb81.474b3.97fbSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <61abde5e.1c69fb81.474b3.97fbSMTPIN_ADDED_BROKEN@mx.google.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Sun, 5 Dec 2021 09:40:13 +0800
Message-ID: <CAKaHn9J+vhMcxwYxV0L2edZ9sFT11LEokDCvM6j_ccMuqo-__Q@mail.gmail.com>
Subject: Re: [PATCH 5.10] Revert "drm: meson_drv add shutdown function"
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Artem Lapkin <art@khadas.com>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_174024_859150_A759865B 
X-CRM114-Status: GOOD (  22.18  )
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

hi all

i have test it on (VIM1 VIM2 VIM3 VIM3L) its works on my side
+ 5.10.11
+ 5.11.x
+ 5.13.x
+ 5.14.x
+ 5.15.x
+ 5.16.x

can u share your kernel config (i know for some kernel configuration
drivers still have problem with reboot )


On Sun, Dec 5, 2021 at 5:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> This reverts commit d66083c0d6f5125a4d982aa177dd71ab4cd3d212
> and commit d4ec1ffbdaa8939a208656e9c1440742c457ef16.
>
> On v5.10 stable, reboot gets stuck on gxl and g12a chip family (at least).
> This was tested on the aml-s905x-cc from libretch and the u200 reference
> design.
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
