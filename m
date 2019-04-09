Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ED5C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819DC20663
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GK0GeGLQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Qo6xgz7s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819DC20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhYyGXGoGY+J578SUNqdQYXlYks+WD0TPYC7gc5AEK4=; b=GK0GeGLQPBRTo1
	xxLyGhNryjF35Wl3PbdZfScKfTTLZtUvqdqCdPC0rzO8OC/OKEA9a2U6jnlhxtT3L+nBkoSnvy1X6
	OdFQ/SlfCiSmv++WjPE/tlFGsbGeK+8ToNPibZnOgNRAeloApXRhuLfmTTPevJ+D79bD4FpVpv9Hf
	FruclrisuoNHm81bBnvs7oHQ8VOsihCdSr1WLHt0QJlYaNetO7+Fhab+JoHvEIGkSMhKGSPpzYTHQ
	ijPmn+uSAtILJ0VQ0xZTRlBZ/Yt1c191T7bdBzHLk8NbEXIjI88OALo0jIPI9rcZyJV1+5jj1zG/j
	1G3EOw95lWVRJS0EaWyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmL8-00075z-Cg; Tue, 09 Apr 2019 08:42:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmL4-00075g-50
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:42:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id a184so2430369wma.2
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=JOnz41YeiiwGNUNF/rubyOkNKVgAf6MWK9CiwaNBXWU=;
 b=Qo6xgz7smkAwnlrKsgmO/SjKyf18u7zpGG3sxVmoSYnlhFpR+XGNpfn3Anb16N9Ton
 082wItw55Xkpw52NacEMESHAPQvyGqTJJqyNBXC7ww7OUSFCEunbDb24CJCSIJTWBkI+
 ItOtX+Ri50Oc8qh8jkJprn9zDp7twC5YcXo7xFlpIuMrZFzNNYH0y/O5dSGS/0Go2YOK
 fD0h2sGX4YJJy8zgfQX474rG9XgQDUUgrAj7KwZQcg0wvLhAp6ZxPXahOf8z/R8P79UT
 wJeXAU+w0epL3nGT4+bmp9p6PLb/GkulodnlRzjMZfwlnWg6lwePz7UUrql179o8b4ru
 /zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=JOnz41YeiiwGNUNF/rubyOkNKVgAf6MWK9CiwaNBXWU=;
 b=d/+xQA8gZX3bt9MTJyikJObd1ez6jorMcC8H6OPkY84E3LXVqU/KDdaKO3GlfJDQxJ
 xA9+eBhCFe9VQVSR8A5rdginGMIR/tFThI9ofyXoR3MbVP9WvL/pZlBNIccnnpDjPmfJ
 c7r4fKUf28oDNpQ0u8BFe5cFRXr/WQr5Wdut3Hk8KSaelNdYyy5SmwbsG12nsg9oul8C
 QMaDOzfGC517rN8j62vGKMJfaw8RPZw6QIH2riVk5XRxiFXtpx0H8PGHskOswBacl+1T
 E4zoofu8py1d56kf20j/iKT0hdTsbQKID6L7Xy8FOFztBvMTWzdWU010Xu/IJjZT9roD
 LmbQ==
X-Gm-Message-State: APjAAAWWcLJKQialxdTELa96DtqiNHmN+h92vCA4u4RYXC4werl4kZTL
 w8f5LifjUp2zwVPLzd6WtQYuzQ==
X-Google-Smtp-Source: APXvYqyUYLoNvi0tN6IXmGKk3doOyGYa/RBrilvZmg9iBxSmTIFOeBteobyAjVVNeFWPX4ZCgu2M9Q==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr11002750wmc.137.1554799360129; 
 Tue, 09 Apr 2019 01:42:40 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 h84sm16963940wmf.15.2019.04.09.01.42.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 01:42:39 -0700 (PDT)
Message-ID: <84e8a61db1be6e83e7dcd9630fde17cfc59eb8a3.camel@baylibre.com>
Subject: Re: [PATCH 00/11] drm/meson: Add G12A Support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Date: Tue, 09 Apr 2019 10:42:37 +0200
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_014242_335603_6B764B6F 
X-CRM114-Status: GOOD (  19.64  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
> The Amlogic G12A SoC offers very close Video Display
> functionnalities with it's older GXBB, GXL & GXM predecessors.
> 
> The main differences are :
> - G12A Support now 3 "real" OSD planes with a new Blender module
> - Instead of having a single Scaler for OSD1, G12A has two scaler
>   that can be applied to 2 out of the 3 OSD planes or on the outputs
>   of the blender module.
> - The HDMI PHY now support RX-SENSE, Dynamic HDR and it's registers are
>   now memory mapped instead of using an internal bus.
> - The VPU now support a DSI interface to connect a display, using
>   the Synopsys DSI controller and a custom PHY
> 
> The complex Blender routing, HDMI RX-SENSE, Dynamic HDR and DSI support
> are not handled in this patchset.
> 
> This patchset implements on-par support with the currently support
> GXBB, GXL and GXM SoCs. There is no support delta with this patchset.
> 
> patch 10 & 11 implements the bindings found at [1].
> 
> [1] https://lkml.kernel.org/r/20190313141030.5958-1-narmstrong@baylibre.com
> 
> Neil Armstrong (11):
>   drm/meson: Switch PLL to 5.94GHz base for 297Mhz pixel clock
>   drm/meson: Add registers for G12A SoC
>   drm/meson: Add G12A Support for VPP setup
>   drm/meson: Add G12A Support for VIU setup
>   drm/meson: Add G12A support for OSD1 Plane
>   drm/meson: Add G12A Support for the Overlay video plane
>   drm/meson: Add G12A support for plane handling in CRTC driver
>   drm/meson: Add G12A support for CVBS Encoer
>   drm/meson: Add G12A Video Clock setup
>   drm/meson: Add G12A compatible
>   drm/meson: Add G12A support for the DW-HDMI Glue
> 
>  drivers/gpu/drm/meson/meson_crtc.c      | 269 +++++++++++++++++++-----
>  drivers/gpu/drm/meson/meson_drv.c       |   1 +
>  drivers/gpu/drm/meson/meson_drv.h       |   4 +
>  drivers/gpu/drm/meson/meson_dw_hdmi.c   | 163 +++++++++++---
>  drivers/gpu/drm/meson/meson_dw_hdmi.h   |  32 ++-
>  drivers/gpu/drm/meson/meson_overlay.c   |  10 +-
>  drivers/gpu/drm/meson/meson_plane.c     |  15 +-
>  drivers/gpu/drm/meson/meson_registers.h | 247 ++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_vclk.c      | 123 +++++++++--
>  drivers/gpu/drm/meson/meson_venc.c      |  11 +-
>  drivers/gpu/drm/meson/meson_venc_cvbs.c |  25 ++-
>  drivers/gpu/drm/meson/meson_viu.c       |  72 ++++++-
>  drivers/gpu/drm/meson/meson_vpp.c       |  51 +++--
>  13 files changed, 880 insertions(+), 143 deletions(-)
> 

on the u200 and sei510
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

I can't pretend to have a deep understanding of this subsystem, but as far as
I can tell, there is nothing crazy in there. With the comments around the use
of constants and defines fixed, you can add

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

As a possible future enhancement, it would be nice if you could trim the use
of *_is_compatible() functions. I think it would make the code easier to
follow and review.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
