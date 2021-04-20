Return-Path: <SRS0=nS3V=JR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EEBC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 22:50:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE09613E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 22:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE09613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMsOzTuj2IwQH39kcCC3eBemDgfr97Xcy3ET2nddxAY=; b=nkwRggGhGPwzUZH7P0AfT9Wt9
	oYNS6vIb8ZQMF92Zo7h55k6+nQtUyj3655Yz416jvXFBt0Ed8BEW/QI5omtT3QNeO3DVUVQaskthi
	KSbin3tgMjjDn2rsy/sOHECOYZoPVgMk+DiMJxj9YGQ8dYx2fkzN/2mzEEZB70iHvt18/QdJGRmGW
	u4Zp8DEX7UKJy5Za5xajg6EDf8yOVA7FwOhPKEIdoVHhIfj41I4U3pdOfmETGnNHn5mANT0Ovc0J8
	Jk0ME4DPXQcNhAVg6njGdhqB2gQWPtWe2mwIsmCfOXY2uANNJrSnnPNSTilM5VnhzjQASjph1SMjo
	Z3BkQtI1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYzBy-00DEBC-Jy; Tue, 20 Apr 2021 22:50:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYzBv-00DEAk-O2; Tue, 20 Apr 2021 22:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aIKF/H96cUu/MFX0SFVzI9ZCY3/rlmsOvDRPwZqUoSw=; b=EITruR1LiPJxmAK/62mxaQT3hZ
 2nS3WpkW2Ydfr5ltV5JyhMgLFNjW0/hSSleI9SvnOJCmEIl2bLt/F+Z3HaVF7ttGJ44hmhuOLjzPB
 2y+eSjnJuSozMef5lVCYoYeddJBrGg8utc54DWyJtADCIQbG52ycyTOpCzxBYR3vPqdsDw3jf7tg/
 oVh0FGx9Qn97q1lPVyG+hU3ffEUfkgIF+CUMPKIPqjP0vlmj3SxN0g65Tim8ARM1hZHXoUVm5uGnI
 0UXEqzENm8cLVhuXl9vt28HukOQwGuc/LYH/m4jkiT1IxPyAvHZkP4eJ2qS3Ib89JvQyph10m6q8N
 5HbumwnA==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYzBq-00CT2k-Cx; Tue, 20 Apr 2021 22:49:58 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5293345E;
 Wed, 21 Apr 2021 00:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618958980;
 bh=tnPqQylg0M/heoMDy9x5XiXEnGZ70xHfOc6q1pK7LwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeMKknPmyhvE4Lv+KgrktMqxfIhcblSiEh0KPDRygcger3YAT3GSLEBBVqXh7qDG3
 LUCWeoNI6c8vlxZEBDR5b4U2e8itmNqfq+KD8TT6Vjcyoxfawp1ukhGUyh4Uuk+uES
 vWsUrRluJfe99MxGLvGZHiOc3SPvj76DvRnhj3UA=
Date: Wed, 21 Apr 2021 01:49:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Message-ID: <YH9agHwLhEL27TA1@pendragon.ideasonboard.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
 <cbea511c-5d5c-8c59-f91f-fedc8eec1e39@xs4all.nl>
 <0821533b-9e6a-237e-3845-741e82de4ed9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0821533b-9e6a-237e-3845-741e82de4ed9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_154954_618761_AA10B272 
X-CRM114-Status: GOOD (  31.99  )
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

On Tue, Apr 20, 2021 at 05:19:52PM +0200, Neil Armstrong wrote:
> On 20/04/2021 17:13, Hans Verkuil wrote:
> > On 16/04/2021 13:38, Neil Armstrong wrote:
> >> On 16/04/2021 11:58, Laurent Pinchart wrote:
> >>> Hi Neil,
> >>>
> >>> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> >>>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
> >>>>
> >>>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
> >>>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
> >>>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
> >>>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
> >>>
> >>> If we can't trust the CEC config bit, would it be better to not use it
> >>> at all, and instead let each platform glue logic tell whether to enable
> >>> CEC or not ?
> >>
> >> Actually, the CEC config bit is right, the HW exists and should be functional, but
> >> this bit doesn't tell if the CEC signal is connected to something.
> >>
> >> This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
> >> umbrella.
> >>
> >> The first attempt was by Hans using DT, but adding a property in DT for a vendor
> >> specific compatible doesn't make sense. Another idea would be to describe the
> >> CEC signal endpoint like we do for video signal, but I think this is out of scope and
> >> this solution is much simpler and straightforward, and it's more an exception than
> >> a general use case to solve.
> > 
> > While a DT property might not make sense in this particular case, I still
> > believe that it is a perfectly valid approach in general: whether or not
> > the CEC pin is connected is at the hardware level decision, it is not
> > something that software can detect. If the designer of the board didn't
> > connect it, then the only place you can define that is in the device tree.
> 
> Agreed, we need to define a smart way to declare CEC bus relationship in DT, the side
> effect would be to handle this particular case.

I wonder if it would make sense to use the OF graph bindings to describe
the connection between the CEC controller and the CEC "device" (which I
assume in most cases will be a DT node for a physical connector). Or is
this overkill ?

> > Anyway, for meson I am fine with this solution. At least it prevents creating
> > a non-functioning cec device. So for this series:
> > 
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Thanks,
> 
> Applying this serie to drm-misc-next
> 
> >>>> Jernej Skrabec (1):
> >>>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
> >>>>     driver
> >>>>
> >>>> Neil Armstrong (1):
> >>>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> >>>>
> >>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
> >>>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
> >>>>  include/drm/bridge/dw_hdmi.h              | 2 ++
> >>>>  3 files changed, 4 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
