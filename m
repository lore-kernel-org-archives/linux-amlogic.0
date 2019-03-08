Return-Path: <SRS0=K/5x=RL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A1C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Mar 2019 14:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E227D2087C
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Mar 2019 14:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eb3taHti";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrtZS4hJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E227D2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7JHaavhdF1e9nsBNqax7MAC0TEMgsHCNYw3/VL0AU4=; b=Eb3taHtiwvQXRX
	3/iSw88h4oGL7oM16v6/nsxYesXR/9j21f7WRUSIbhdYbWb+wNB1bEXqv4HAb6xcgvc+F6bjvXZOt
	lM5zRYLeSl/+PThAa4YZ1u1pOXuL+w3NlsBzUWS9/HXF0y2SMwcbx0M6RHftpUx9thBoE2dMEKR0p
	G0gmm6kuDzJio+RaQmGsY+Ergj0Gh+BZMoEmHicjtw0eBQKfojeh4B2eLzbLQLfHZgmrk7EmfJqwO
	BQ8ubhyrGAVWVOKlzmCo0QglGFP+gNOSu3oQLqhz4FpF3Jhv6A98ZoeScd8ggvoJbaMYLUJ2AgXN7
	aWq5/L7zzf1hAtRCkcUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2GtT-0003pq-Ah; Fri, 08 Mar 2019 14:54:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2GtP-0003pS-IR
 for linux-amlogic@lists.infradead.org; Fri, 08 Mar 2019 14:54:37 +0000
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA0542171F
 for <linux-amlogic@lists.infradead.org>; Fri,  8 Mar 2019 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552056875;
 bh=4aboBRavMPzk24ub+4zG7EAt7vahfO4a4nnF/qW4njE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JrtZS4hJE9qP/CD1btG871lfsSxoOqdTnJLVwTcj3iYSb34kivRoz1tcAijpUDBNB
 kAuUfYBggounFFCQciRAb9MK+5llIEWMIobrFK7z0DC9VpRutF2YPwO7HvIlSvOU4C
 equays8Z3r2zyhvLxvBOV6mIKt9dweyGPBowMrcs=
Received: by mail-qt1-f171.google.com with SMTP id v10so21455446qtp.8
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Mar 2019 06:54:34 -0800 (PST)
X-Gm-Message-State: APjAAAUQsAlHvz1LKW/tNnN8IjOqjjBKPFdiZu/uSpxBdpOB/xK1hDU/
 4RwN+Z+7L3UG6q4zLHAh83XlvGHwOWDe3LIlYw==
X-Google-Smtp-Source: APXvYqwHBa9l0tLCztQbL2/xiRTLGHfjE2CpSkVzPplCHB3+Uo7iEpRpw28U6Z1Kc3Dvv2m3LdDzYjMWLwz5sxUeMqw=
X-Received: by 2002:ac8:3015:: with SMTP id f21mr2248856qte.144.1552056874013; 
 Fri, 08 Mar 2019 06:54:34 -0800 (PST)
MIME-Version: 1.0
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
 <1549022873-40549-2-git-send-email-narmstrong@baylibre.com>
 <CAL_JsqLa1QNYTo+Yj-5fC4k8C1bd+V8qi5LiHgLA_qZY+Gy5cg@mail.gmail.com>
 <36800d4e-0bb7-378c-e512-5ae02406865b@baylibre.com>
In-Reply-To: <36800d4e-0bb7-378c-e512-5ae02406865b@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Mar 2019 08:54:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-q3+PtU6zS-dLSy3Gx+xOzquLyuW3n3ey6iRT3tw9KA@mail.gmail.com>
Message-ID: <CAL_Jsq+-q3+PtU6zS-dLSy3Gx+xOzquLyuW3n3ey6iRT3tw9KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_065435_640634_B19E0B22 
X-CRM114-Status: GOOD (  17.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Huicong Xu <xhc@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Mar 8, 2019 at 2:05 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Rob,
>
> On 08/03/2019 00:13, Rob Herring wrote:
> > On Fri, Feb 1, 2019 at 6:08 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Add support for SCDC Setup for TMDS Clock > 3.4GHz and enable TMDS
> >> Scrambling when supported or mandatory.
> >>
> >> This patch also adds an helper to setup the control bit to support
> >> the high TMDS Bit Period/TMDS Clock-Period Ratio as required with
> >> TMDS Clock > 3.4GHz for HDMI2.0 3840x2160@60/50 modes.
> >>
> >> These changes were based on work done by Huicong Xu <xhc@rock-chips.com>
> >> and Nickey Yang <nickey.yang@rock-chips.com> to support HDMI2.0 modes
> >> on the Rockchip 4.4 BSP kernel at [1]
> >>
> >> [1] https://github.com/rockchip-linux/kernel/tree/release-4.4
> >>
> >> Cc: Nickey Yang <nickey.yang@rock-chips.com>
> >> Cc: Huicong Xu <xhc@rock-chips.com>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 85 ++++++++++++++++++++++++++++++-
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  1 +
> >>  include/drm/bridge/dw_hdmi.h              |  1 +
> >>  3 files changed, 85 insertions(+), 2 deletions(-)
> >
> > This commit in drm-misc-next is breaking booting on the Rock960. I
> > have FB and fbcon enabled. The boot hangs after this message:
> >
> > [    3.012334] [drm:rockchip_drm_fbdev_create] FB [1920x1080]-24
> > kvaddr=(____ptrval____) offset=0 size=8294400
>
> Could you give more details on the tree used ? did you bisect to find this commit ?

As I said above, drm-misc-next (from drm-misc tree) is the branch. I
bisected between it and v5.0. Reverting it fixes booting.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
