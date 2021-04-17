Return-Path: <SRS0=WhSF=JO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC66C433ED
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Apr 2021 06:32:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8A0611AB
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Apr 2021 06:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E8A0611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siol.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BdQ6S2DX7mYW+Yg/GnAtJnV1KsoBNhZ0Pv9ljvkoy5o=; b=cz5lJMdaKxpeJkljFU1+igyRu
	HM4V3cELYnbBPTy6l3HVawjnoIYEWjRPR9eRI00pQ7wp/OlAbpbPD4FkX9xFLATuu6xsF02JFIgPP
	IYQSCJWDaXvhT5kjKrIMxweQO/cFAK1f4SJOih3jzX9p0em4sutmdbjhQNUHsFsItOMMA0OPprXjd
	u4mNXa9QZ0gRMZ1RSWH6GdFGuEKkF5H8xfeeqOlasTJGjpXJ6Vy5IiL3go/zQVY7Zy1eGn+fyq4so
	4Cg3Ku0ej9g8lfP07Jku7qnLP3tkLnOVho7r+BvZHz77godTSTUd9gdL27jckptVyDyuB3niHVCYV
	8CvoIAwOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXeUi-004XJ7-Pn; Sat, 17 Apr 2021 06:31:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeUf-004XId-GO; Sat, 17 Apr 2021 06:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=BZlhHa+7neoDecDw00XrHolb9duSifoov0OFUcCeFVI=; b=F6KX8wK/fFdkVWdwLjanwfqzqH
 s3WTEi3SS/ypc4kQjRUgfTdSVur36X/0BWZa50l3brP5SAcRgFXMOJwNJNwBYYvuegZwuTnPnvR/y
 X2DL8DlRnmLrdwBhQrXrlSLVZvIm65KcB0BH1McUqqPcBZjGxID1Vt6gdg0A6HA0IP+tbsH0Ab3NA
 wVGOhsO2vrwzQhKlSFWl7uAVAay7hbBx3psYY9Pr4ghjhjfbkZJQb/kQDDNQ9VAXhJVNLvBPEkyFN
 NlUIbJHoh4W/QEf8xLg2qPyb526zJcmwLNWa/Emz3Gb/WHfb2XYILFBP2RyhRJmshmZtPU9nLERNl
 5xetzzkQ==;
Received: from mailoutvs14.siol.net ([185.57.226.205] helo=mail.siol.net)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeUZ-009tnX-JF; Sat, 17 Apr 2021 06:31:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id BF64B523653;
 Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id n-saAgAigrm7; Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 749A95238C1;
 Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id E0502523653;
 Sat, 17 Apr 2021 08:31:39 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: jonas@kwiboo.se, robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Date: Sat, 17 Apr 2021 08:31:39 +0200
Message-ID: <9525152.Q8VVBrNj5Z@jernej-laptop>
In-Reply-To: <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_233143_826808_5771312A 
X-CRM114-Status: GOOD (  25.15  )
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

CC Hans Verkuil

Dne petek, 16. april 2021 ob 13:38:59 CEST je Neil Armstrong napisal(a):
> On 16/04/2021 11:58, Laurent Pinchart wrote:
> > Hi Neil,
> > 
> > On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> >> This adds DW-HDMI driver a glue option to disable loading of the CEC
> >> sub-driver.
> >> 
> >> On some SoCs, the CEC functionality is enabled in the IP config bits, but
> >> the CEC bus is non-functional like on Amlogic SoCs, where the CEC config
> >> bit is set but the DW-HDMI CEC signal is not connected to a physical
> >> pin, leading to some confusion when the DW-HDMI CEC controller can't
> >> communicate on the bus.> 
> > If we can't trust the CEC config bit, would it be better to not use it
> > at all, and instead let each platform glue logic tell whether to enable
> > CEC or not ?
> 
> Actually, the CEC config bit is right, the HW exists and should be
> functional, but this bit doesn't tell if the CEC signal is connected to
> something.

I'm in favour of Neil's solution. Currently we have only one exception.

> 
> This lies in the IP integration, like other bits under the
> "amlogic,meson-*-dw-hdmi" umbrella.
> 
> The first attempt was by Hans using DT, but adding a property in DT for a
> vendor specific compatible doesn't make sense. Another idea would be to
> describe the CEC signal endpoint like we do for video signal, but I think
> this is out of scope and this solution is much simpler and straightforward,
> and it's more an exception than a general use case to solve.

Note that we still need DT property for disabling CEC. I have one Allwinner H3 
board where board designer decided to use GPIO CEC implementation instead of 
DW HDMI one (vendor Linux doesn't implement DW HDMI CEC driver). Other H3 
boards happily use DW HDMI CEC.

Best regards,
Jernej

> 
> Neil
> 
> >> Jernej Skrabec (1):
> >>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
> >>   
> >>     driver
> >> 
> >> Neil Armstrong (1):
> >>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> >>  
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
> >>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
> >>  include/drm/bridge/dw_hdmi.h              | 2 ++
> >>  3 files changed, 4 insertions(+), 1 deletion(-)





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
