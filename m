Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9473C43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 03:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC9224676
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 03:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnLOgjVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC9224676
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg5duAwog8n8iy1B0oCXYs9WDSal0nMYBCeJSeVfzP4=; b=JnLOgjVZ1S850B
	7m8Vf6vEIRUE9f5Oi4awBxHF90hYnFQorEANmetO9z8YXBs49U+ecARUovn1bWrcgTJK2sVmZosWD
	8nixewNUDse/fBr1NA9EVDKuuWGK5izgDCFqo0CZhPrhdkjbQXTqf8btaTYQZRcS+aZMgYIl/fMP1
	k/rJGrnyvft05V0f5F3BHgroOjekRaVEJ4MhAYJ+7ydXgEvuUdFy5XTUscBUnR/twd9U3v+Q0sXfX
	k1ET4lzZwaWr9119OFjrhwSNOQjRYcWc5R5ZpBMHrJ1ykctiRP71P6C9uA/oJKUgg1pEV6JzAKQXS
	oFLIlLDgB6HXz/lj7BDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iggff-0000FD-8e; Mon, 16 Dec 2019 03:03:43 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iggfc-0000Eo-Bx; Mon, 16 Dec 2019 03:03:41 +0000
Received: by mail-ed1-f65.google.com with SMTP id dc19so3761810edb.10;
 Sun, 15 Dec 2019 19:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FENccwgG3uhDFjFer/TFmu057ClxmW4CVGbxtoIFMB4=;
 b=OKiw/3vViTRUmmw7TrQv4lMqLd9UxJeKXh3GEnO630OAucAdF+4hJLBXdIWsTM200V
 LmWw7waEwdG+/FueEPUemcl86OdPAF/tkIweFftbzKFxoMbE5B+t+H37tGr9qObxWopm
 afaKbVjxpUCVHDCELffEsKxyaWhvZLUTIWkcwgsY6D7DbvbTnslJOCwU66MY1bYk0B4H
 YVIkY0CaXxe/uLJSKgjGsxIwbW5w49S2ilmjluY/SrJGMsNlQLCJLsEslEYxaK7GuUR/
 6Bvco00pehyddrxJPW5WhxB5/jViFBShx69sN+Q/iM6RMDy6679P/ik6O5RUzHOD4trB
 QbJQ==
X-Gm-Message-State: APjAAAUH8GfuI0Xo49n48VHgETln2WFUVSs7scmLCa6CqhLD5N6lYpMM
 2PJzqQ8RUVooSi95K9DM+Wc8J/MKNaA=
X-Google-Smtp-Source: APXvYqyu9q3VZXqysBLPVvk7Ai93wo73NvjY1PVPNz3BJIqe/LaBRzrxtjXUO0Wvvz+us7eQXNPpYg==
X-Received: by 2002:a17:906:5808:: with SMTP id
 m8mr23898628ejq.1.1576465417737; 
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id x20sm1067599ejo.36.2019.12.15.19.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id p17so5080721wma.1;
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr29527605wmg.66.1576465416941; 
 Sun, 15 Dec 2019 19:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 16 Dec 2019 11:03:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
Message-ID: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_190340_409012_CA4EA219 
X-CRM114-Status: GOOD (  19.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 yuq825@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This is my attempt at adding devfreq (and cooling device) support to
> the lima driver.
> I didn't have much time to do in-depth testing. However, I'm sending
> this out early because there are many SoCs with Mali-400/450 GPU so
> I want to avoid duplicating the work with somebody else.
>
> The code is derived from panfrost_devfreq.c which is why I kept the
> Collabora copyright in lima_devfreq.c. Please let me know if I should
> drop this or how I can make it more clear that I "borrowed" the code
> from panfrost.

I think it's more common to have separate copyright notices. First you
have yours, then a second paragraph stating the code is derived from
foo, and then attach the copyright statements for foo.

ChenYu

> I am seeking comments in two general areas:
> - regarding the integration into the existing lima code
> - for the actual devfreq code (I had to adapt the panfrost code
>   slightly, because lima uses a bus and a GPU/core clock)
>
> My own TODO list includes "more" testing on various Amlogic SoCs.
> So far I have tested this on Meson8b and Meson8m2 (which both have a
> GPU OPP table defined). However, I still need to test this on a GXL
> board (which is currently missing the GPU OPP table).
>
>
> Martin Blumenstingl (1):
>   drm/lima: Add optional devfreq support
>
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  11 ++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 217 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>
> --
> 2.24.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
