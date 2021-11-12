Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DA8C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 13:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97A260EBC
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 13:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D97A260EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rWL0nYPYSvNIZGqCSyPjO1cLTK/YVLFjr306uEauNm4=; b=RZJptm3LeM6kbhIYupyv4Xramc
	FQhLdabTev7iT36wjpNJfFcacw6SPcip7uxoF84RDNIeCPupfv42RfFOLm1elPSElyPvHLuLDkK+Y
	LE8vnrvaDqBxEYo4lF/JknCfSvSptTb6jcaz86D5yLDY+LizPtcBp6wIJsr28+koW2FgXQjYOSzwm
	vuJzSTdm83LEW3PTLgC2jdVBG7p5xLzkZm8RSRR8/GtJP4NRkw3j1PUrAQw0t2CFniyJTePXuNYc1
	DMweFPLPrfk2f9c9mGjcJZH24xtRwINAm/fImSfLTOvgk8b1betEUbf3n3dQwETnGgtR4ouiUyCDP
	krFWWHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlWgA-00AZbs-6Y; Fri, 12 Nov 2021 13:33:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlWXd-00AXFF-1s
 for linux-amlogic@lists.infradead.org; Fri, 12 Nov 2021 13:24:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id y196so7686166wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Nov 2021 05:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pvQoleAGM9Zrph+RM13dsCV9NkoY/kMYM5P43VaVlns=;
 b=qaVKsAW0Aq9EIXUGVOdi0/rsBJ+wQM59iVEqQzmRET3Igj3lB4KgSF4gV1PHP/2oil
 0gn+LQAap+LbA3zly0Dz0cBAY7Ea6r0dPr4O6+ryKnwDP2MXTdtNyQUFjnhalEQVYGUb
 Mfum9u0hKUt7/TspQcmZE8SFI3SE6J1AeXuJWPjzLDKCunSDyDTShULfmXf6CdKzXYc5
 eRy2yPr1k+CsvDcr5rgKWSpCrQ6sZ/4nPGyPCOJ7qKf8qUkFZuiYA+mpGw3ZaVLEi42x
 9T6Hncf4kQPbuy6MPRtuEFvNn1TeY5fQyderi57bb7C83Ob6XVnQDrBjfD2aX/kB/rgG
 KQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pvQoleAGM9Zrph+RM13dsCV9NkoY/kMYM5P43VaVlns=;
 b=OkPMAj/WiWYjKk7i7k5KJPhqW+ZLh8nA3JMmO5FGX4r4L6hvZm0+K0Fpkj55mtHboN
 MmiePEqzfZxsskXT06wz9fmQr379h6f7IqFO4uJU8bJ2DG2UPkI6ukDpN7sKCU9/7JKN
 XnQc3oWgDcEEFsr7PcgsV6OdE2prIrF367oW5RlhCLl2LhVtleCO5Zhy3hmKcuqoiEzP
 +wp1AG3Ox62cbMdfSA+pPHaSNX4JE8oSeDJRXYUwjIHpWnHscbAl34Y+B8EO8wZGXK2r
 +8f/FNhRMQWxIapmwYwXDT1n63ilSDP+XdsPiGkRTPGZJIqIF9EPS7xhBly1yAciIxUD
 OyOQ==
X-Gm-Message-State: AOAM531BUa5vPvRpB2tyGR7j+vM7b0nt2788j3DZSP0DHpyePb+rgkIX
 VWWC8CuurrammMA1Hjkslc076OK3iDocFoT4
X-Google-Smtp-Source: ABdhPJypVrEMaaFxG9GsLct4xeTHd0tGCt2OsXltLtPd9pGRzvEezB5JSb8+HTfZRNCYd5lod1o2EQ==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr33442835wmi.107.1636723466539; 
 Fri, 12 Nov 2021 05:24:26 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:15c5:4746:b404:ed78?
 ([2001:861:44c0:66c0:15c5:4746:b404:ed78])
 by smtp.gmail.com with ESMTPSA id h204sm5979057wmh.33.2021.11.12.05.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 05:24:26 -0800 (PST)
Subject: Re: [PATCH v3 0/6] drm/meson: rework encoders to pass
 ATTACH_NO_CONNECTOR
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3e0e5a2f-a81b-dcba-e379-4786c4a5de7b@baylibre.com>
Date: Fri, 12 Nov 2021 14:24:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_052429_130714_20EB3D45 
X-CRM114-Status: GOOD (  17.03  )
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

On 20/10/2021 14:39, Neil Armstrong wrote:
> This serie finnally reworks the drm/meson driver by extracting the encoders
> in their own file and moves to bridge-only callbacks.
> 
> This permits passing the ATTACH_NO_CONNECTOR bridge attach flag and finally
> use the CVBS & HDMI display-connector driver.
> 
> This will ease Martin Blumenstingl writing the HDMI transceiver driver for
> the older Meson8/8b SoCs, and sets the proper architecture for the work in
> progress MIPI-DSI support.
> 
> Finally, this serie will path the way to a removal of the device component
> and use the drmm memory management.
> 
> Changes since v2 at [2]:
>  - patch 1: no changes
>  - patch 2: added martin's ack
>  - patch 3: moved ->enable & ->disable to atomic, added sam's & martin's acks
>  - patch 4: added martin's ack
>  - patch 5: added martin's ack
>  - patch 6: moved ->enable & ->disable to atomic, added martin's ack
> 
> Changes since v1 at [1];
>  - patch 1: added sam's review tag, fixed include order, fixed doc wording
>  - patch 2: added sam's ack tag, switched to dev_dbg()
>  - patch 3: moved mode_set to atomic_enable, removed DRM_DEBUG, fixed include order
>  - patch 4: added sam's ack tag & applied to drm-misc-next
>  - patch 5 & 6: added sam's ack tag
>  - patch 7: added sam's review tag, stopped saving connector, moved mode_set to atomic_enable,
>  	added missing atomic state callbacks, fixed include order, switched to dev_dbg/dev_err
> 
> [1] https://lore.kernel.org/r/20211014152606.2289528-1-narmstrong@baylibre.com
> [2] https://lore.kernel.org/r/20211015141107.2430800-1-narmstrong@baylibre.com
> 
> Neil Armstrong (6):
>   drm/bridge: display-connector: implement bus fmts callbacks
>   drm/meson: remove useless recursive components matching
>   drm/meson: split out encoder from meson_dw_hdmi
>   drm/meson: encoder_hdmi: switch to bridge
>     DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   drm/meson: rename venc_cvbs to encoder_cvbs
>   drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR
> 
>  drivers/gpu/drm/bridge/display-connector.c    |  86 ++++
>  drivers/gpu/drm/meson/Kconfig                 |   2 +
>  drivers/gpu/drm/meson/Makefile                |   3 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +-------------
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c    | 284 +++++++++++
>  ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 446 ++++++++++++++++++
>  drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
>  drivers/gpu/drm/meson/meson_venc_cvbs.c       | 293 ------------
>  10 files changed, 881 insertions(+), 660 deletions(-)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
>  rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
>  delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
> 
> 
> base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
> 

Applied to drm-misc-next

Now https://lore.kernel.org/all/20211029135947.3022875-1-narmstrong@baylibre.com/ has been applied, we should have no regression.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
