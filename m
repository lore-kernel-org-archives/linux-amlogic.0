Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CACFC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 18:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AA561391
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 18:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56AA561391
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYLD7rp8+TCCr2reLeLmaU8Dqko9jJ1peDLF8lj9IyU=; b=rOd3Zrgro7s9NV
	fb6ElpIc24lCU3wI6XPlt7gYytGyadmYkBZ6VztQXFKDZy9WiDW6Y2f4ufy8qtDQB6iMl211CPZza
	SjYNWPKnmzlOe4nGGZWQgf3Um8VpGd4nkkgvoUQqltWUNLtiGMPLkxtj3cUgagYSGMVFEmBRXLW2Y
	XjJXHs8fOoeB2eR0Xfyv5o/gXzp9mc2k+MKG1gFHBM/o7Io5rN1cWD7JS2ZwqY5YnFipTc+mRQW5O
	uLBYrUNXVuKG04UPnOs+qePIpe4onMeiG807lpsVzO23B3m4LIHuYYrD2wbWBE+Dn4NaU8LH+0Lfp
	0G4bBjeeUXsJ9Kvr6OIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIEbI-000IYE-7g; Mon, 23 Aug 2021 18:23:12 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIEbF-000IXn-51
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 18:23:10 +0000
Received: by mail-yb1-xb36.google.com with SMTP id z18so35835731ybg.8
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rukoF0zTAyPgRjsb/qETsAXh6HDn8z2HPuAWUcpMQpw=;
 b=mrRHQszk4xM/P0iqPOgIvzHk9Gi79/0pgATlZnfPGDvzxyVjOuDAzTGWx2032SoaZN
 h0ILJaEukh+Jswu65Fn+bOFsV40J9CeZkSjhLr/C96wRAK+7XGkP7ULhInEZcHuj4/q7
 AQM0+2tatgJ0VZu2EuQR5AcGZn3CIrLSMRq+0Ja4L+8azEnIHTXDNn0kQIWOqJDqQiLI
 QH66OIKdJicFgCoGAWLnzR6JXD6qMjQLOvG/YjctJOrPpywQqldUASRaXoTC8SQsrqpe
 0XkMnm7ujPcD7C0mEu35y2JkjBqw5Pc/Xejsaw6mK6iXWiplXQLe7OSUZqgE/gD+HL7E
 2mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rukoF0zTAyPgRjsb/qETsAXh6HDn8z2HPuAWUcpMQpw=;
 b=ak4EbiihBHDpcP8fviSXqTvQdWY8SfrmcFoD3ErqmOYc2HOD0i8MvXL7yxDD6SmHqB
 YbvPh6huzupE+NbK0mNNADb3BT1odLls7608dnXIqGG1Zk2Neb9z72CuCToi1aRPX5sK
 xV9xlYSA8mxI8/p3YGzpS8kt5jZ+NhBP8OPHXxqUN0CVBIzzmj7z99rKX6WH5VsXkmVL
 D4B2PrDHG/yYhYwuDk3ayNNKYTte3bb8HYxzZuHpz28QyCYdzSU/01trJ+0bEPbQmJd0
 L8budHPVtCmnw0d+hvMQvAydgWAY1QKwfsJehJbNBvEnChQQWXGiMPUDtAWw8hWnJ8dv
 BiGw==
X-Gm-Message-State: AOAM530IWUZ+1fgiuLeugZnwvQ0E4zYQQblbuy764yIZq/3adOlu1j+H
 +Y2CznJE9if1eiWicCnlnhD6/m37L8cKccyslEfzxw==
X-Google-Smtp-Source: ABdhPJz/GExcyseR2MWqjTeotuxEd+SktGcaeLmh0s2UAgoTjDdqIDVWpDLD4AKnPaMocG9V7d1xGoW8yzA5XBnFcjg=
X-Received: by 2002:a25:c64f:: with SMTP id k76mr45962791ybf.412.1629742987747; 
 Mon, 23 Aug 2021 11:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
In-Reply-To: <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 23 Aug 2021 11:22:31 -0700
Message-ID: <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_112309_254583_38C64AEC 
X-CRM114-Status: GOOD (  26.97  )
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

On Mon, Aug 23, 2021 at 5:08 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 18.08.2021 04:17, Saravana Kannan wrote:
> > Allows tracking dependencies between Ethernet PHYs and their consumers.
> >
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This patch landed recently in linux-next as commit cf4b94c8530d ("of:
> property: fw_devlink: Add support for "phy-handle" property"). It breaks
> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
>
> In case of OdroidC4 I see the following entries in the
> /sys/kernel/debug/devices_deferred:
>
> ff64c000.mdio-multiplexer
> ff3f0000.ethernet
>
> Let me know if there is anything I can check to help debugging this issue.

I'm fairly certain you are hitting this issue because the PHY device
doesn't have a compatible property. And so the device link dependency
is propagated up to the mdio bus. But busses as suppliers aren't good
because busses never "probe".

PHY seems to be one of those cases where it's okay to have the
compatible property but also okay to not have it. You can confirm my
theory by checking for the list of suppliers under
ff64c000.mdio-multiplexer. You'd see mdio@0 (ext_mdio) and if you look
at the "status" file under the folder it should be "dormant". If you
add a compatible property that fits the formats a PHY node can have,
that should also fix your issue (not the solution though).

I'll send out a fix this week (once you confirm my analysis). Thanks
for reporting it.

-Saravana

>
> > ---
> > v1 -> v2:
> > - Fixed patch to address my misunderstanding of how PHYs get
> >    initialized.
> >
> >   drivers/of/property.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 931340329414..0c0dc2e369c0 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1291,6 +1291,7 @@ DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
> >   DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
> >   DEFINE_SIMPLE_PROP(leds, "leds", NULL)
> >   DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
> > +DEFINE_SIMPLE_PROP(phy_handle, "phy-handle", NULL)
> >   DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >   DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> >
> > @@ -1379,6 +1380,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_resets, },
> >       { .parse_prop = parse_leds, },
> >       { .parse_prop = parse_backlight, },
> > +     { .parse_prop = parse_phy_handle, },
> >       { .parse_prop = parse_gpio_compat, },
> >       { .parse_prop = parse_interrupts, },
> >       { .parse_prop = parse_regulators, },
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
