Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565A3ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw090QbO0ds7NtzdHkxTef/tqD449s/00daE1V2Zwi0=; b=iCA/2LNZ4Jn9dI
	sYUGfkUmjU/A4rUKnF4PKaIQ7owGZdN44/h0dKQYhzunkmBHJd6onK2oCOJhcKcQZwQMCPV6ZAPBE
	zOpzvhypcbKt8Hae2F5gv6cFuXj6yN/j4veojbN6zyRDLp8M8v81ZvSf75Bn+sKMwJzOL1dksd/HX
	DQ1wE6rYrPEkg98KDo9qOBx2A6DDdzCuqqo91pRx+aCUJ7/3m7tocWjTITkuRgc3H3AR0nVRksj5o
	E4fGkueetU8nQ0Bo53ccNg13Bep6YRwbr9A2kUV6418aTpbOAivWM7t+pMMSW24kxPO0kBvmskwMj
	PpVY532qwew7fkjUETXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdZ1-008iXe-S2; Mon, 29 Aug 2022 12:08:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdYv-008iM2-MP
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 12:08:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x10so7817318ljq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qKsvNRH86aHNC8UItEtemRj4TbqiQ2+V87OtP5n+W9U=;
        b=zHPi+7sXaz5JENCfXEQx7Yq5zfDdqNY45Hwj6On/9m+zjWpB2m8QoWkm+ufzkCCCF6
         ZEA3TgJaIgwANSD3EOLByZLh50uz4gHUQFwyoadJsqSurnFETVhnIZTHUUqxHuArYOd3
         pgP2kxhXR2CV0EUjm+Mz7zERQzUYfPbn6XXMBL1l/m7htLHT1Rb02q4ksHGwwSANgg9p
         T+MhFyHldMWegzdUYRFbfG/H5wy5sN3xWbYOqGpEV8kkvRc88PiEukiGFeDz/tWSOtCz
         scAmXLL2Q4K51pG3BBUys8tmbzvrl5fEMHD9dzuzQsl5IY31ZwM0Gzj+Td28LoCkjha6
         tM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qKsvNRH86aHNC8UItEtemRj4TbqiQ2+V87OtP5n+W9U=;
        b=rcpsJuVhvKOZk47K0gEovESj3dQpaPAObHGO9c5b9YnODQ/8ewnJ9ganvY4hgc+yfy
         N51tbs+Q17qHpXJNzvIVJ0oV97ELngcgzIhiElzjUEWFX10qJIOsTYvDWA4XSydymJBo
         EQEZ06EFMrctFQmLnRaClMDjYT8oDZz2maZoV+71Z+o9153Omi7lbL/K9QeLZACiLwOb
         qlZE4DpiyOTeRIuO58DdpGEZaKjsH9+C4SinT1vNMDs/kjltX2z0zWW4EoAl+yGp+07t
         gKGW2wnH3MYc2kpv80YdMVBXyJSs+GkzRf+Hf6E3p30/sulapm028MSaNGHA8Cw3F5x5
         LYPw==
X-Gm-Message-State: ACgBeo0UqSDB83Ql9Al+qPO4Kq1WRskARxGzXgeq5Gx9gHLCD0R/FV06
	huIYxtQQoxBIIZPUd0bRTYcVVKduorR6k5jGQbZKfw==
X-Google-Smtp-Source: AA6agR58Pd3QqgEFFfCQUNOIxS3mN6JInRUCJqFY4oKIWBp+p0J+d610owS1EoNj+kbjCQKDNsXeZfGpuE2gjrwhsWQ=
X-Received: by 2002:a2e:9799:0:b0:261:e51d:8576 with SMTP id
 y25-20020a2e9799000000b00261e51d8576mr6068713lji.367.1661774891703; Mon, 29
 Aug 2022 05:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
 <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com> <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com>
In-Reply-To: <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Aug 2022 14:07:35 +0200
Message-ID: <CAPDyKFqRm=RVn__3HJDk_0bBemudh_y7YEYPZe3W7iJCfP50fg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_050817_822573_FFD3371F 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, 29 Aug 2022 at 09:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Uffe, Heiner,
>
> On 26/08/2022 11:16, Ulf Hansson wrote:
> > On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>
> >> Add SDIO interrupt support. Successfully tested on a S905X4-based
> >> system (V3 register layout) with a BRCM4334 SDIO wifi module
> >> (brcmfmac driver).
> >>
> >> v2:
> >> - use new SDIO interrupt API
> >> v3:
> >> - don't duplicate checking mmc->sdio_irq_pending
> >>
> >> Heiner Kallweit (2):
> >>    mmc: meson: adjust and re-use constant IRQ_EN_MASK
> >>    mmc: meson-gx: add SDIO interrupt support
> >>
> >>   drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
> >>   1 file changed, 65 insertions(+), 19 deletions(-)
> >>
> >
> > Applied for next, thanks!
>
> Thanks for applying, but I was off (like many of reviewers) and I would have like
> this patchset to be tested on earlier SoCs aswell, or only enabled on S4 for now.

To actually make use of the new code, an update to the corresponding
DTS files are needed to set the cap-sdio-irq property.

If that isn't sufficient, I prefer if we make a patch on top of the
$subject series.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
