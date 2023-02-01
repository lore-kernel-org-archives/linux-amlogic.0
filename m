Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006F9C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=namNCWXM9YVgHu5UMc2a0j9QuNh7RFsrZxcCwwSoynE=; b=mb6q7e9KDzqN0a
	de2SLqXSAuGciu31PWYjnS/k+43DPP2a6PNxakqWix2DK/4S427HJC+W5+omXVn1ROf1n8GyuE8gC
	1fO4cGF/VVD3Dt5TZ0zgw7vcBxTx2oNlUDYtW+48sSIV8Km0PxgoqBcDV2hew4ILsx3U0bgTAZlRO
	ojYc3wn4VVhfab5UW193ShBTvs7xCcYYcK4H9YESlXcuB4aOaqOOTv8u0s7KyNf+BTCh9ScvYcWDf
	jXmVyrXure6wWAKGpDD6VLfG9ASQIAK/GvBfSJsZPYXqiYFNRF9ZDnwnxX+epurcxWt93s0U7aUB/
	3kCXM/RkY72UkxvRg0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEr1-00CcH2-3Y; Wed, 01 Feb 2023 15:16:55 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEqp-00CcBc-Bb; Wed, 01 Feb 2023 15:16:44 +0000
Received: by mail-qt1-x831.google.com with SMTP id f10so3571652qtv.1;
        Wed, 01 Feb 2023 07:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=koIfQU/IlXrNYeN5rsjpnJ64SDYl1SUTYEJnhhNEjXE=;
        b=Mybxe/FN1h+WqvZM0/4hPqE4yMhkASAFg+6qIZ2ur+kf52i808WVrdbZREBcP2n6sR
         MA6gljSRHTQYno/1trZ5srkJhxhwV6Ph9iV2kJeibdEl9N40Zl3hEKCwHXfn6oTb9RL1
         EOEmzmfx3ZZ92tH+X6rvKVekvikTmzPZNoiBDsJ5PotpBDHa5dEJqer0roVpQTTu+vaQ
         9KRZl5UK0Y19Ls8RMs1zoB3psFWgdeGnh561TP8oTQGAbXePm77ZuPpynDtR8R+AgbNg
         RR/BfPHJpcjCufNBJw7OIyqwDzqkjVvvQ84HZZgy1SQTDacjw8iRRyCQPw0ZGAGPF6Fx
         8j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koIfQU/IlXrNYeN5rsjpnJ64SDYl1SUTYEJnhhNEjXE=;
        b=JQmt2aPydCgGJPqUQ5JK1UpawASzQs07U8RIdvEvijkf9Ndz0cAiUU1kIVm33HqDfc
         pPFPqPjS71NvofKcDvUG1WhS0H1JVPMMt/pjRj0MEJ4qLSzR8PeCJQro/Xv8tAu/zpkP
         CSDyPi7QP/QRwM3MtRyNVgorMcFR0YI4hHE9PKlcehl8sEEm7M/XNJYwLnZSwokvxmH+
         hAkA5thuT0UOOE2uFes7BqIb0fot+GIiueHgCoK/y+LObOQWhC4l+XDh1u620kzP9GV9
         EppJ6HYhHlgHFpRPchkwKmNj1GMC/VzkQRW7d4IdM9r/XbMd5eohgGmDalFd/97cfKJ0
         pZ2Q==
X-Gm-Message-State: AO0yUKUKpuW+n5nzbTZTdxMkRmb3SVLd8A+kl4iWTu5KxUDYIU9tmyzW
	iWsP5DQ87Lf7UVtqojq8807u1MyjWKNIaBmD8Ls=
X-Google-Smtp-Source: AK7set8wK/uMIz2cun5XrxHIic3/RQKaVU4LpEGu/mhZlfgxgz/rTWrjOgtESqmTkwSRFaBRWCsiEasYMuu1wVdS7hE=
X-Received: by 2002:ac8:57c8:0:b0:3a9:7ff2:3b85 with SMTP id
 w8-20020ac857c8000000b003a97ff23b85mr283061qta.102.1675264601885; Wed, 01 Feb
 2023 07:16:41 -0800 (PST)
MIME-Version: 1.0
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com> <20230131215528.7a791a54@kernel.org>
In-Reply-To: <20230131215528.7a791a54@kernel.org>
From: Chris Healy <cphealy@gmail.com>
Date: Wed, 1 Feb 2023 07:16:30 -0800
Message-ID: <CAFXsbZqPx-YWY9CAavoyR9YyA=uZTCYny8+4_zDqxwi3Gy0GXA@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hao <haokexin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_071643_423654_FFB51350 
X-CRM114-Status: GOOD (  11.14  )
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

On Tue, Jan 31, 2023 at 9:55 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 31 Jan 2023 22:03:21 +0100 Heiner Kallweit wrote:
> > Jerome provided the information that also the GXL internal PHY doesn't
> > support MMD register access and EEE. MMD reads return 0xffff, what
> > results in e.g. completely wrong ethtool --show-eee output.
> > Therefore use the MMD dummy stubs.
> >
> > Note: The Fixes tag references the commit that added the MMD dummy
> > access stubs.
> >
> > Fixes: 5df7af85ecd8 ("net: phy: Add general dummy stubs for MMD register access")
>
> Please make sure to CC the author. Adding Kevin Hao <haokexin@gmail.com>

Good point, I'll do that next time.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
