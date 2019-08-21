Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1870FC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 18:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DECC4216F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 18:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNFBGsgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DECC4216F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNe49c5+NrF4m8m7cWt06/4w7MU1QJ+IM9lwsXCrEhI=; b=PNFBGsgUbfKPfy
	yHHbCYZ4KOVok7oX0dPdyTGkDwpXnN9moAlfO5pnAGz/Y5EQd2R8YDFKI48J0F2wLFGJLEiz8qeUp
	2G9vPbc6v3jJSSQ9GmJLSFAmxZSYYMC5Eh5ZWRjeSNg2iv77tbwXMtiP60meQIjrqFjC+w2vBYqRk
	Rxtv28GD9HqyDl2vDaM6dG7bpFg5fXnW0WE5SDNVkiuLkYtgungCSAy4L4eJFyIA98QX6s9XwfMRr
	zj2N0K8JGGfZvvfPI7ZGfrOcf3yjY3H1oHPOEU0V7AXek337ziW5570MwUMSXNdvo5db3gzPAYeYm
	e8Uq2w1ci/+sAFN/RyvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0VNr-0003rj-St; Wed, 21 Aug 2019 18:30:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0VNo-0003qz-Kz
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 18:30:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AD3C2699FC;
 Wed, 21 Aug 2019 19:30:51 +0100 (BST)
Date: Wed, 21 Aug 2019 20:30:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 00/11] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Message-ID: <20190821203047.06730da4@collabora.com>
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_113056_821672_1E8DB019 
X-CRM114-Status: GOOD (  16.11  )
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Aug 2019 10:40:58 +0200
Neil Armstrong <narmstrong@baylibre.com> wrote:

> This patchset is based on Boris's "drm: Add support for bus-format negotiation" RFC at [1]

Small clarification. Neil's work in based on a slightly different
version of my RFC [4] (I plan to post a v2 very soon).

> patchset to implement :
> - basic bus-format negotiation for DW-HDMI
> - advanced HDMI2.0 YUV420 bus-format negotiation for DW-HDMI
> 
> And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
> - basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
> - YUV420 support when HDMI2.0 YUV420 modeset
> 
> This is a follow-up from the previous attempts :
> - "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
> - "drm/meson: Add support for HDMI2.0 4k60" at [3]
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20190808151150.16336-1-boris.brezillon@collabora.com
> [2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
> [3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com

[4]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-2

> 
> Neil Armstrong (11):
>   fixup! drm/bridge: Add the necessary bits to support bus format
>     negotiation
>   drm/meson: venc: make drm_display_mode const
>   drm/meson: meson_dw_hdmi: switch to drm_bridge_funcs
>   drm/bridge: synopsys: dw-hdmi: add basic bridge_atomic_check
>   drm/bridge: synopsys: dw-hdmi: use negociated bus formats
>   drm/meson: dw-hdmi: stop enforcing input_bus_format
>   drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
>   drm/bridge: synopsys: dw-hdmi: add 420 mode format negociation
>   drm/meson: venc: add support for YUV420 setup
>   drm/meson: vclk: add support for YUV420 setup
>   drm/meson: Add YUV420 output support
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  97 +++++++++++++++-
>  drivers/gpu/drm/drm_bridge.c              |   6 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 135 +++++++++++++++++-----
>  drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++++++++----
>  drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
>  drivers/gpu/drm/meson/meson_venc.c        |   8 +-
>  drivers/gpu/drm/meson/meson_venc.h        |  13 ++-
>  drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
>  include/drm/bridge/dw_hdmi.h              |   1 +
>  9 files changed, 295 insertions(+), 68 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
