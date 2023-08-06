Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53EEC0015E
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Aug 2023 04:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nW3UMGGL3qSxSHncLIwicYndrMgZ9XALao/sH7d0wNg=; b=4Hxp98bMeOIVIH
	OrLC9Sh80Me9HSvGLK1yfs5/aE6j1B0XV2byNvemUQD0SI+orLM1A/f+Lfub0R8mFCOm2QA28DXXV
	AZzkdVV8am2i0IYPvt2tS2f3ReEZIBQfBcC2mceZc25hIFyNw0P0hPOSrqoftKtkp6Fz6F/uD/0kp
	8yk7PKOocxtrQVB11I9xbqt3pLA4rT9bVdOHqJLRzpTX6i8IrQXUubnaxVOkAqndx2epDAnhSqMam
	hABnxsiUserZOEu6lLzlagZT1/gixRrhEZd580TDklPIaWIMogFM9MxU+e/aspnXdEsC3jh1HyyRc
	snxjw32o6h/0Yj2WRXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSUzO-00ErCg-1W;
	Sun, 06 Aug 2023 04:03:34 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSUzL-00ErCB-1H;
	Sun, 06 Aug 2023 04:03:32 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56ce936f7c0so2451391eaf.3;
        Sat, 05 Aug 2023 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691294610; x=1691899410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g3j2Il2f+kymqampd6+H1xMyg5wmaHaMj6WUzsK3M24=;
        b=JeHD3rbz6Oa3vJtggpCJGbPAUaa5WPbgNJSNa2QzindNcq3yrWxpqyTiFq0lrKKjHk
         JXGqv4+k8OonkhPy7wV2/W84fNNEQELf5ISsQW+EayWrJcXT2ePvGNz/HQw/ZuaxeVxB
         0hWD8Ml4fP5fBKGU2N1iBd3qB21YnvPHg1KVFFhyjNfeefReRb5UmnUMQOLxxY9i38iK
         kl11E7pd6HUdF5dvgNxSi0mCIW54KFjzw2vnu5niD6kXyXNnMZs4M4q/9arrdMyp1uYP
         6fCg2DHeHUJM65sIWR2bGOlWReVlIPCeAnCAeAZkYie9NzNLFlnOPyTuExsMqZS+NtvC
         8kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691294610; x=1691899410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3j2Il2f+kymqampd6+H1xMyg5wmaHaMj6WUzsK3M24=;
        b=Nv1dtlG2njbdzoKlzrw7TdyNncS1LufNwKRzZTI+0VPUhm0n9/JHzunfWC5s49H8AC
         f4SOEDhqtawTLETMdJSy8uYTT4Pj/O7CN98Leqap6wnilOsAyZ5Ll6+FWob3qvIdBKdP
         QKHS4EdXMXr+8Asf6+JBOdkO3O4Nl9KzrWXeyrBpgo/sk3r0xUbD9su78jd9oSj7fTrc
         2DSpKW+JTsz7ZQQWq7v6Hj1b+GFwO6U2O9mXq5FOWHS9XTmGvBlaGV11I1+ClfQVokQI
         gvt36LCJb2fcwdwyY4EJCCr8pCzN1cCpyMARILp04BQXCo6ILP3L3wgCmMh/wBVfhdwv
         bBXg==
X-Gm-Message-State: AOJu0YwcUPzK8hk6+r76r8QbPb0MZRXMNwNXaDGKkd1rq5uutL+KN42X
	DN9bhekZB1N/NU1nYtVZC3kxNkpvf9cvBQtlfBcYApklYew=
X-Google-Smtp-Source: AGHT+IGiHomALBXL4paQosZXpHIeqNpPWBixXgzTFr0eejKLBQRLuS2hAHGiVGp8UJuxnua+vIQV/H+JkQIcbIgmp28=
X-Received: by 2002:a4a:2557:0:b0:565:9e41:85d8 with SMTP id
 v23-20020a4a2557000000b005659e4185d8mr5539528ooe.6.1691294609752; Sat, 05 Aug
 2023 21:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230121175639.12818-1-linux.amoon@gmail.com> <20230121175639.12818-4-linux.amoon@gmail.com>
 <ZMrFb7H1ynwwBSCA@Dell-Inspiron-15> <45d25fd5-465f-347b-448b-ce171626f34e@linaro.org>
 <ZM7jtD2rniWAexVZ@Dell-Inspiron-15>
In-Reply-To: <ZM7jtD2rniWAexVZ@Dell-Inspiron-15>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 6 Aug 2023 09:33:14 +0530
Message-ID: <CANAwSgTBmLKknkWDUyZ2Byr15Oy6jbNxEYYjKGNr=2cOn5Wowg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c2
To: Ben Wolsieffer <benwolsieffer@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_210331_443031_BAA1D221 
X-CRM114-Status: GOOD (  25.91  )
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

Hi Ben,

On Sun, 6 Aug 2023 at 05:35, Ben Wolsieffer <benwolsieffer@gmail.com> wrote:
>
> On Sat, Aug 05, 2023 at 11:30:21PM +0200, Krzysztof Kozlowski wrote:
> > On 02/08/2023 23:06, Ben Wolsieffer wrote:
> > >
> > > Hello,
> > >
> > > This patch breaks USB support on the ODROID-C2. As soon as the
> > > onboard_usb_hub module is loaded, all USB devices disconnect.
> > > Blacklisting onboard_usb_hub makes USB work as expected.
> > >
> > > I tried to reproduce the problem by manually toggling the reset line,
> > > but the problem seems to be specific to this driver. When reset is
> > > asserted manually, the devices disconnect, but they all enumerate again
> > > as soon as reset is released.
> > >
> > > Also, I have been unable to make USB work again (until the next reboot)
> > > even after unloading onboard_usb_hub.
> >
> > Wasn't this patch made exactly to fix USB support, not break it? I might
> > be missing something but maybe this was not tested at all?
> >
> > Best regards,
> > Krzysztof
> >
>
> I have been using USB on the ODROID-C2 for several years without issues.
> It looks to me that this patch was designed to make reset control for
> the hub more elegant, rather than fix a specific issue. The same change
> was applied to several devices, so it seems plausible that it was not
> tested on all of them.
>

We tried to fix quite a few issues in the past but still, we could not
resolve core issues.
Will try to resolve these issues in the future.
I have tested these changes at my end on Odroid C1+, Odroid C2, and Odroid C4,

> Thanks, Ben

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
