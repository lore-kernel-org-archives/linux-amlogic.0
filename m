Return-Path: <SRS0=5laz=NP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18424C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 07:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3528610D0
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 07:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3528610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8cWfveLaRRwa0fjC3h3U+W9mn6XbDC7v4uHzyP7apw=; b=zypqZbti7aVDwy
	nUFoNNXwbqJfAJFQ49XftRsSY79EEJfPbCx/l+mXGliefdMGzaWZ9EPpUfJJMCpu7z5TSWe3NNpes
	2O2TJab6qsR7uzSKhKKXQUwM1hKjhqeJ4kMvrSmkrtsUI6XYDhhG/oAp5ZguYfzVKf6hRqigM4gDH
	R5K+8LX42ez8ODRojSzrqwyBx2OnsGAcs2t25/NMcLXbUv3zKMSF8aWv7EJkHpd75tr7a6PV1yJf9
	BDqEvIIKEr1Os5ZUYwzAfjGgYtuRr2t1ZEp8hj/jQesY4avoe0ywE7qEWeSPmzeN5vdVB7NAXo7bF
	TvAPQ47SYuoS4a+eFNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQua-0023Mw-EC; Tue, 24 Aug 2021 07:31:56 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQuX-0023Lf-CC
 for linux-amlogic@lists.infradead.org; Tue, 24 Aug 2021 07:31:54 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id x140so4860663ybe.0
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Aug 2021 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nAbhJg9KzDnSNui0yJFPZ9VTbEY+6KHkXkiM9wTMo7U=;
 b=nw4GMUAkEusgHcP8d+XatSp56K8mVrgcAEDxlvnhk5nj3gCmkWNUhunL8PbtN2+Su2
 aAE8EeODCWz5wgPJtYsnyCsiaBlaonNAUyXmi49vtlFPWD+bIzy9D9MtWMGtg2UddqPY
 frTZm0fjszj+0N3xpRKkIhJT8Hvl1lpr4Dt+Lf//YDmw+FID7xex/zLoXT76jJ0ohc7F
 2E62YNsI9hbs4mxQncZc6hIvbELPWQhroUCkJLB5QuCJ/WmKemulF0GYj63+xCG4dQFq
 UjDRMt2JEPyRRu7U0qIMdJpC/puZIpFCl2Z71FWFkrC5UnIFWGpK1nImA0Oy4nhku4CO
 acUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nAbhJg9KzDnSNui0yJFPZ9VTbEY+6KHkXkiM9wTMo7U=;
 b=a8F7HT5sNU74yNH8wy/XmBT9HWeYbyt3e8YunVERcP40+HYDtbiNkUPWvwaL6GgI9n
 sXQtC/Hiay4L04tRJFCsdmwMN0409Rk0wjLsSgQzMfjUSKJB/c4DBKWMuvk28vH+VLvz
 o9o55zx99vHaf+oqVWjxD4nQl432ytbqq8Omok+6luIGAsRvZGJ6LJe+5MmGxkGnuqxa
 LhItJthiKB8KL8AkcoIjS+C+MPY8z73K7M62Fj/WEmYthOrs0S/cxC7G3RwUpiscqXRH
 kG4+uc9Q7eTeH9negvcs/+q2fjLsXX76w+4pa/LSw5KSPE6XlIdhhRxbAmIZaBZMbHwx
 GC8A==
X-Gm-Message-State: AOAM530bO3E6DfR87IIcb1r71Uny5nJ2rd+U0vg46tuZ92xjjJSVh/wi
 DUMCf5OrUcq+VxuoPr4zAexNAJEnq3Y1p5Jqcxwq2Q==
X-Google-Smtp-Source: ABdhPJymfsqgvR+b9ZJBIHgV7DoRSEBfuTSnP4UhGjvYXCirnQKW+aO1kLAlKKbxF8PIZ0jHatdmxdXWNg621TxPflU=
X-Received: by 2002:a25:da50:: with SMTP id n77mr19168506ybf.96.1629790302026; 
 Tue, 24 Aug 2021 00:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
 <427ce8cd-977b-03ae-2020-f5ddc7439390@samsung.com>
In-Reply-To: <427ce8cd-977b-03ae-2020-f5ddc7439390@samsung.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 24 Aug 2021 00:31:05 -0700
Message-ID: <CAGETcx8cRXDciKiRMSb=ybKo8=SyiNyAv=7oeHU1HUhkZ60qmg@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_003153_487193_3B7D7829 
X-CRM114-Status: GOOD (  34.07  )
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

On Tue, Aug 24, 2021 at 12:03 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 23.08.2021 20:22, Saravana Kannan wrote:
> > On Mon, Aug 23, 2021 at 5:08 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 18.08.2021 04:17, Saravana Kannan wrote:
> >>> Allows tracking dependencies between Ethernet PHYs and their consumers.
> >>>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>
> >>> Cc: netdev@vger.kernel.org
> >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >> This patch landed recently in linux-next as commit cf4b94c8530d ("of:
> >> property: fw_devlink: Add support for "phy-handle" property"). It breaks
> >> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
> >> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
> >> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
> >> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
> >>
> >> In case of OdroidC4 I see the following entries in the
> >> /sys/kernel/debug/devices_deferred:
> >>
> >> ff64c000.mdio-multiplexer
> >> ff3f0000.ethernet
> >>
> >> Let me know if there is anything I can check to help debugging this issue.
> > I'm fairly certain you are hitting this issue because the PHY device
> > doesn't have a compatible property. And so the device link dependency
> > is propagated up to the mdio bus. But busses as suppliers aren't good
> > because busses never "probe".
> >
> > PHY seems to be one of those cases where it's okay to have the
> > compatible property but also okay to not have it. You can confirm my
> > theory by checking for the list of suppliers under
> > ff64c000.mdio-multiplexer. You'd see mdio@0 (ext_mdio) and if you look
> > at the "status" file under the folder it should be "dormant". If you
> > add a compatible property that fits the formats a PHY node can have,
> > that should also fix your issue (not the solution though).
>
> Where should I look for the mentioned device links 'status' file?
>
> # find /sys -name ff64c000.mdio-multiplexer
> /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer
> /sys/bus/platform/devices/ff64c000.mdio-multiplexer
>
> # ls -l /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer
> total 0

This is the folder I wanted you to check.

> lrwxrwxrwx 1 root root    0 Jan  1 00:04
> consumer:platform:ff3f0000.ethernet ->
> ../../../../virtual/devlink/platform:ff64c000.mdio-multiplexer--platform:ff3f0000.ethernet

But I should have asked to look for the consumer list and not the
supplier list. In any case, we can see that the ethernet is marked as
the consumer of the mdio-multiplexer instead of the PHY device. So my
hunch seems to be right.

> -rw-r--r-- 1 root root 4096 Jan  1 00:04 driver_override
> -r--r--r-- 1 root root 4096 Jan  1 00:04 modalias
> lrwxrwxrwx 1 root root    0 Jan  1 00:04 of_node ->
> ../../../../../firmware/devicetree/base/soc/bus@ff600000/mdio-multiplexer@4c000
> drwxr-xr-x 2 root root    0 Jan  1 00:02 power
> lrwxrwxrwx 1 root root    0 Jan  1 00:04 subsystem ->
> ../../../../../bus/platform
> lrwxrwxrwx 1 root root    0 Jan  1 00:04
> supplier:platform:ff63c000.system-controller:clock-controller ->
> ../../../../virtual/devlink/platform:ff63c000.system-controller:clock-controller--platform:ff64c000.mdio-multiplexer
> -rw-r--r-- 1 root root 4096 Jan  1 00:04 uevent
> -r--r--r-- 1 root root 4096 Jan  1 00:04 waiting_for_supplier
>
> # cat
> /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer/waiting_for_supplier
> 0
>
> I'm also not sure what compatible string should I add there.

It should have been added to external_phy: ethernet-phy@0. But don't
worry about it (because you need to use a specific format for the
compatible string).

-Saravana

>
> > I'll send out a fix this week (once you confirm my analysis). Thanks
> > for reporting it.
>
> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
