Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAB2C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0RCqlK/juE9OCh4W+j2viJGgyDhE2Ure/b5NslqqqM=; b=ebQJs3R4SDPOZf
	p5grGSdHbT3wJM6Pq7JKl9/ll71u9h7VTtp0lx893+Wv2jN4lPtO+REC5q6P/VMwGrsOUlWXIcj1x
	Wvvx/hF/nRLK8mJ4B3NdjW/ld5LpN8v6rA5+w71oky9KEcu+MC3gUkCGqfSvBPEmfikHH6z9mPNQ2
	4le1GuGlfUke6iXm0T9OYDb2pHd7QdPsaSgsB1k5A7cmWj1X+m4OjzkumBx7RATW5cfe+jHARBwCg
	bkeMoXBFPw2NP7gMmcqNnUFd6YSkZpORkWOk6sdY5ny3rl2xnVxOSnbLKlJXzx4Zu5WpnznMwd9Cy
	C9ZA4ovdkJsDJU10l9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np85W-00BqbI-2Z; Thu, 12 May 2022 12:38:38 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np85T-00BqZb-HT; Thu, 12 May 2022 12:38:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id gh6so10052153ejb.0;
 Thu, 12 May 2022 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoGfAeZQWxmcbzhHC6mTnSs1oZv+JtjPmO1ajlNx7xY=;
 b=b1wUoho9j1rQF9AgKvIZh6E7b3xVmeysOq+HQQYVvd1mbqPZRM87eyHi+uDOfsuWFA
 Mpyt973hsn3vGm6/EpFYegwcoNln/LUONWa03KjfvpKldjDxI+UU9mOPrwi0nR4plq3u
 wTANUhx4kd/3V9fr+XP8lgU3bkOwvHoYI+HHXaY9WlcFlZkdRSfWENzM73CHIrdXREYO
 8PMte1L5SN2hDAVN9snogABa67l+slqwBVTEXlAp2Jh00G5ytO/E6mgsbjfthkyPTc6k
 x38hbD7Sykg/XiiX4r4chB7OA8dMuwot6RnIGRQbgP7Fuhfb7s9GrJoWhjEUOa68rh5K
 Likw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoGfAeZQWxmcbzhHC6mTnSs1oZv+JtjPmO1ajlNx7xY=;
 b=gKewsd/1peWp6sqR3Dk6NrFcjWYpKCcFmnSO5hrrrWtYqn1RqEkUoRxe8JDw+518EL
 xDlIKE91qosCiva7RMEMKeRB5W6WNpKEMm4v24xoTtqLuNiGnm39y1JJ02rrAunn4ilz
 SUmYAJukGDCRtjpSy7PmJI/7spSWs9wk7wxCWrUthk74vrjrfwUyUY/aEBW2tWrPR1W1
 hsxBTySm9NIRPNc+q/tEktJD7EAclhQamOMT+QN/xXO9QI3jNaOJFXbAPQhF8yBWDOL3
 kdkvE3Nl4m+Sw/BZ8U7MxfOKsF1Eb7twry+ryiCjG6BCAaNWOU6e7v2xNG2lKIejmcQY
 CmEw==
X-Gm-Message-State: AOAM531d93JbmXYXXDfHDqKSY7qEUUE+3/QHznwEJ+5qFKrNMc+4eztt
 eO3qUmUbXQzg/sVXb46QK14KADogELkHb9PSn/Y=
X-Google-Smtp-Source: ABdhPJxyZQsOCxEgrJZ2NAiC1Xo6LDdCxh8GoYT6et8Ll4kjTZqtuvt2+XhFH0OByYZ9Rnqwnsq2/IAW528XPmAKjhM=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr30637029ejc.13.1652359110183; Thu, 12
 May 2022 05:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220511054052.51981-1-linmq006@gmail.com>
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 May 2022 14:38:19 +0200
Message-ID: <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053835_600573_CD93B07A 
X-CRM114-Status: GOOD (  11.96  )
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

On Wed, May 11, 2022 at 7:41 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
>
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for sending this patch!

Neil, while reviewing this I noticed that on module unload we're also
not calling put_device().
This note doesn't affect this patch - but I am wondering if we need to
put that put_device() during module unload on our TODO-list?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
