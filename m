Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD11C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 22:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB98461076
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 22:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB98461076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrjYjy2JUb2A124Mzaq9qqQVy62FhBq4q7cNVvXyCCo=; b=C/hGoWIP2zopo0
	7YHc1Wg++C98rRgtgIXVqGqybFBN/w0aQxNG+kru2fR/KHYzyndcCYfJ1zbB76GFBFXeCV8EsCQ1g
	wkg7+ebQ3JCZuMLM0lIcP/6zEORXVK41L+H3lDm/VA5EjrgI2o4GnJP3PtwzkpgNm/TuUdLZwU7sF
	8zBgcL3JYVPRlt6JjGChHFLKox3IUVCjKZxHxpWH2Q0WMDyhARU7yEK8fYg5Df0THfh7g1eaNr0fs
	yWgNc7DRo0W9aZkabwPcA325TwU2r6QcOvfQxG+S+9NRvbt60p4p2qvaeGRnNphcrvEYwNtIvj3q1
	ryc+hR+0BBCw9qf7fA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mII7V-000oOQ-QE; Mon, 23 Aug 2021 22:08:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mII7T-000oNi-8o
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 22:08:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 364516113B
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629756518;
 bh=/UczgWwigc1TOQ0MtIShvCxZpfCTa18aq1rdTT2fNyg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jLW5BSFNUEyvl25xy68xdaRmbDWuPAz7zNzdB6Nygeqqz/iaK8wWhust/rWdROcXI
 Iou/RGWfAhtFVSVwsav/vZlqsVxgH4bMtP68fTAkBp6WwfRggsqm9DxAHqn/EP1T8u
 Bw8PTvjZ3qPtmVYu23EvCqz1HNMzmRsreO0EP1ZMYyP47/Ole9x/VXNmD+pmrjkThg
 RF5Je730VIJfzv3CIfbPELn/o5CtBRi8S+MJ/SgNRfTJj+g2b/u4/DISHpoaFO9246
 KUxVeNuxIsCJ6lG60NUnHaZmp5CVhjTGFVshw9k8ohcLGhCwzqKfJswG02lbcAkNYT
 ZEIrXmH6tOyJA==
Received: by mail-ed1-f44.google.com with SMTP id r19so28431767eds.13
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 15:08:38 -0700 (PDT)
X-Gm-Message-State: AOAM533eGND2Ddy2o2QZrFFL4NvYd6itnnmP6MYD9ADXAFBboV1DAcMF
 Z70w1blJvxZaiQUXiH8wiClRIHJlWLXUnXO5Og==
X-Google-Smtp-Source: ABdhPJy5+meB7jw8V1qyuzca3p+iwjIy9KKZwNe2E7gMCzT2w3EAMENGdDsXcVPOwbQQyVGQB//EYd6Vr/FSexqiARU=
X-Received: by 2002:a05:6402:1215:: with SMTP id
 c21mr39845422edw.137.1629756516853; 
 Mon, 23 Aug 2021 15:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
 <YSP91FfbzUHKiv+L@lunn.ch>
 <CAGETcx8j+bOPL_-qFzHHJkX41Ljzq8HBkbBqtd4E0-2u6a3_Hg@mail.gmail.com>
In-Reply-To: <CAGETcx8j+bOPL_-qFzHHJkX41Ljzq8HBkbBqtd4E0-2u6a3_Hg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 23 Aug 2021 17:08:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKXR=Kkx+yKcYv7R3uAeff_HLKSPGr5Y2RBC_=VJmypJQ@mail.gmail.com>
Message-ID: <CAL_JsqKXR=Kkx+yKcYv7R3uAeff_HLKSPGr5Y2RBC_=VJmypJQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Saravana Kannan <saravanak@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Frank Rowand <frowand.list@gmail.com>, netdev <netdev@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_150839_371155_D36DEC62 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, Aug 23, 2021 at 3:49 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Aug 23, 2021 at 12:58 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > PHY seems to be one of those cases where it's okay to have the
> > > compatible property but also okay to not have it.
> >
> > Correct. They are like PCI or USB devices. You can ask it, what are
> > you? There are two registers in standard locations which give you a
> > vendor and product ID. We use that to find the correct driver.
>
> For all the cases of PHYs that currently don't need any compatible
> string, requiring a compatible string of type "ethernet-phy-standard"
> would have been nice. That would have made PHYs consistent with the
> general DT norm of "you need a compatible string to be matched with
> the device". Anyway, it's too late to do that now. So I'll have to
> deal with this some other way (I have a bunch of ideas, so it's not
> the end of the world).

This is not the first time the need for compatible strings for MDIO
devices has come up, but MDIO devices are special (evidently). I
should have taken a harder stance on this which should be simply, if
your device requires having a node in DT, then it requires a
compatible string.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
