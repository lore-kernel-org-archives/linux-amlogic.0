Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC75C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXXFkubPsMmqvdYX8Mnb1kTQ5PzpgbE5CWFTDM11/2k=; b=sH86dlSQ3hzkz9
	DCmE+iw0xfanCsoFKU+GedK1fMpUY7dohEg46sncXRuJB6F/6PN88SqIc6f7Ydc8TJdo4hN7Md3kD
	rSh636oCSkO/gRT+dwiMmA0ixazax8lcfEu7p+EOVjUoJGZji1kUwLZgQ9LC0zqv+mFZdv8n0cmYg
	a/KCLz0TMNIbmKRC71JpS+tbNU7oIMdjDTiDU+3w6cEDEbl+K8htxclLxk+eMXBXzuA5/n2ESNv0i
	qenEZxYJsK5JyqRxPUIs71xqEaBljkralMpKbMVevX6gl9fiiHEQU+cNZR29s8JW4pTeQ1874ldor
	JwWWKBWvYkbSlr/xj+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muANg-003BI5-Jp; Mon, 06 Dec 2021 09:33:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muANW-003BE1-AR
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 09:33:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id c4so21013885wrd.9
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=r9zDudZHRWc49tEGECpf4ZvP6KcUsKNYm4+ZqytPGy8=;
 b=kGNzku0/gn5Dx7uydZoQvNU3Xc6Ig25OfAF/vlQkOkKgPrFvMFg16U8rcTu27+XaH8
 QApDcbMAR5F37JSDEjbJ5RRyx4CSXg2+IS3LcSo8CkmJNLzjiKNWfsmeXf0oB1Uvbs2l
 pTwo9OL7UviBqK10epC8vezhMA216rEjhSKN4Zc+QmSFFqytaq2aH+XVsCYYTekiK0DT
 us9/Pn7Z5D54Tq9321chufj12ak/qrU71yWoxMDjAZz87xAiZUwAY/QvQFHj9HZAEtqg
 1EVhL5eQ4JiDguuAnzHETWV7iardGGMBOv1pUroT0hDoRSX1ATTkArYHwZyqHuZ9diGN
 DaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=r9zDudZHRWc49tEGECpf4ZvP6KcUsKNYm4+ZqytPGy8=;
 b=YdV69PkTMFEMKIAJzzxSPhg0YJugIEJUGy+guadfMgIpRghRiXQ9Rkmn4Vz/hrWc9F
 6ZX+0SJ6PP2elb1ypBlH17iqKCXLi+vWTzoJaoSzZWnBjXn3Jr10Ck0AS+t7hZU6sLCS
 GumFlltwqDjcKJFkQOXh6FRna1JwWVBT6VeiNm+C2g9fdyHSU/0lMK+hnNPyoRSqeiL7
 KMTTBrw35Sr4JAh8FmStC2rmvdoxAjea5zl34HZeiBJ2AQD2hjOUS8CuxD876bqz5e0m
 P3ED+8+ukDnOxawZfcVGreyQI3uE1SvIfgkvmCuyD6jO91M4fAdi62eQq40Y7xf/JQkc
 HG3A==
X-Gm-Message-State: AOAM530FK+a8NAjXP2lnY9NxpPHLWwxsj1vUsr5+/0wWcE5fqYJM9XtQ
 ly/Wgtej84VBJRfmzNDNuYZf1A==
X-Google-Smtp-Source: ABdhPJx5PdCfnKTYp21ys81MqXkxKAEDCeDVThwvz/X/Znp3hAawAgzTmuiSX+0cLUf3uf6Imo8OnA==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr44001940wrf.15.1638783224385; 
 Mon, 06 Dec 2021 01:33:44 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h27sm14379246wmc.43.2021.12.06.01.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 01:33:44 -0800 (PST)
References: <20210315135545.132503808@linuxfoundation.org>
 <61abde5e.1c69fb81.474b3.97fbSMTPIN_ADDED_BROKEN@mx.google.com>
 <CAKaHn9J+vhMcxwYxV0L2edZ9sFT11LEokDCvM6j_ccMuqo-__Q@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Art Nikpal <email2tema@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Artem Lapkin <art@khadas.com>, Kevin Hilman <khilman@baylibre.com>, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 5.10] Revert "drm: meson_drv add shutdown function"
Date: Mon, 06 Dec 2021 10:32:49 +0100
In-reply-to: <CAKaHn9J+vhMcxwYxV0L2edZ9sFT11LEokDCvM6j_ccMuqo-__Q@mail.gmail.com>
Message-ID: <1jk0gi5b7q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_013346_429776_503D1E89 
X-CRM114-Status: GOOD (  18.37  )
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


On Sun 05 Dec 2021 at 09:40, Art Nikpal <email2tema@gmail.com> wrote:

> hi all
>
> i have test it on (VIM1 VIM2 VIM3 VIM3L) its works on my side
> + 5.10.11
> + 5.11.x
> + 5.13.x
> + 5.14.x
> + 5.15.x
> + 5.16.x
>
> can u share your kernel config (i know for some kernel configuration
> drivers still have problem with reboot )

The kernel configuration is the default arm64 defconfig

>
>
> On Sun, Dec 5, 2021 at 5:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> This reverts commit d66083c0d6f5125a4d982aa177dd71ab4cd3d212
>> and commit d4ec1ffbdaa8939a208656e9c1440742c457ef16.
>>
>> On v5.10 stable, reboot gets stuck on gxl and g12a chip family (at least).
>> This was tested on the aml-s905x-cc from libretch and the u200 reference
>> design.
>>
>> Bisecting on the v5.10 stable branch lead to
>> commit d4ec1ffbdaa8 ("drm: meson_drv add shutdown function").
>>
>> Reverting it (and a fixes on the it) sloves the problem.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>
>> Hi Greg,
>>
>> Things are fine on master but it breaks on v5.10-y.
>> I did not check v5.14-y yet. I'll try next week.
>>
>>
>>  drivers/gpu/drm/meson/meson_drv.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 2753067c08e6..3d1de9cbb1c8 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -482,17 +482,6 @@ static int meson_probe_remote(struct platform_device *pdev,
>>         return count;
>>  }
>>
>> -static void meson_drv_shutdown(struct platform_device *pdev)
>> -{
>> -       struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>> -
>> -       if (!priv)
>> -               return;
>> -
>> -       drm_kms_helper_poll_fini(priv->drm);
>> -       drm_atomic_helper_shutdown(priv->drm);
>> -}
>> -
>>  static int meson_drv_probe(struct platform_device *pdev)
>>  {
>>         struct component_match *match = NULL;
>> @@ -564,7 +553,6 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>
>>  static struct platform_driver meson_drm_platform_driver = {
>>         .probe      = meson_drv_probe,
>> -       .shutdown   = meson_drv_shutdown,
>>         .driver     = {
>>                 .name   = "meson-drm",
>>                 .of_match_table = dt_match,
>> --
>> 2.34.0
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
