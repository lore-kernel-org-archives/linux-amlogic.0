Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E3C11D0C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 19:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C7A208C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 19:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgZRhwWT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nOW1dJSz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C7A208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCaEwSKMfE/7qHF4TgbGq4utMVRa5Ey99CtIu+KCJvY=; b=tgZRhwWTAdE14G
	z+cIiT7i9N+8iw3gKLwCppQWlJTA8pfuxQFisdD7sa2y3XQ3W+fEsbu8cmvzH82V81bOHTzqHZ6JO
	Gdiw4TlgSZW1Ir2LQrFPLkdh4RjM8eeqVL045RAJMDbjwPqkSH0VNChzM2cbbUxjGz+Ml+iVPLns+
	25WLnPkqF1EhYOvTQVOgpMgL9pSRZvFssJkJPu5BzNCVDsvwl92zSuxUEnvCZUlW8Vp7qELHNFuue
	z2EgBV4ChqYhcorEu7bNZcsIZR+YhB7aLq5zCtbPltNuQjC5kB0NT9HF2VHoSWIEDB/ndXZ7glNQo
	Ih9el7WkW6IkWNfSiQUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4raC-0007u2-NV; Thu, 20 Feb 2020 19:34:00 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4raA-0007t7-HA
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 19:34:00 +0000
Received: by mail-wm1-x341.google.com with SMTP id p9so3262224wmc.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E5S9aNFqrzMweT/fLedmBehI6zV6DT/E9arXjx8LiL0=;
 b=nOW1dJSzVFvP0XctGEk9bOJKCW15bXfIREw5h2tgDjQ7/Hy8IEAJb5xaKyMhtkXjx1
 zf6LOVFL1PjyR7nlfG8EuK4rtTnOanIvbqjgbBwBrAx4mjbJ2JEJjs7uehAUoeK7tB95
 fDZ4tbWQqoy4/TpwsJQMQiV/kE5TMUjp3ze8Yia7KWyx070YH2eGHlts6U9lccd7ct/B
 5Ullq95LMHp9mv1E73Yo8t5A1A8jZb66djGqxV4gy2dF/w7u4ycUdO2FiuSz7/dkbw4I
 eSzjvIHL1p/ecO+ONVa928EumIhfe/+oaG5d2PBDNKCf9V35Q50WJzrsr4maUjBrbwCA
 qRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=E5S9aNFqrzMweT/fLedmBehI6zV6DT/E9arXjx8LiL0=;
 b=WHrJpaj2Gxr8vKhjeTpyzW17aZX+yX2Qx2CEM13oyB+X2efD77ZLUwLOUN090CZMmA
 LpqMjvwvmswO9kTk8N/mrW4wGcT8a2Gx5ZLqoBUtzSjk+S7hXdclOUQI9Z8YDYQWs6EY
 61re+CCgjb9Da4FVzvQCvcyFHbDdav5rJkS+QEHW2l9gnNjP/eam23gpyrzA5+7kQITP
 x/cD+nlgN4uVfUgcfHJZykrN0+Ozs9gd3FY/P4dS2WaLeN8sbTJhuX4TlBGoLXBq9WVL
 Xw39d6ROwiYqvzJvjLmvw3BYpxcu3AQ9CXigsaGNFLl8qFATjFnomV0rLjghaGS+vZOt
 37Iw==
X-Gm-Message-State: APjAAAWMELb2AMdWS+yJBaK63IdnSPp6EZlBrXMi2Nodv8onQLr7V6th
 7ZrcHKmFr3lxW94KHGA+4YLkOQ==
X-Google-Smtp-Source: APXvYqxe0BOqNhTYK0A0EeE+usRWZgwZqrZrRH7ay8qcw1krcOJVLuutSOD8sd+Ax/AYw3YPnyYC2g==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr6081797wmg.103.1582227236703; 
 Thu, 20 Feb 2020 11:33:56 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:3115:825f:fd46:f0e9])
 by smtp.gmail.com with ESMTPSA id q1sm694991wrw.5.2020.02.20.11.33.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 11:33:56 -0800 (PST)
Subject: Re: [PATCH 2/4] drm/meson: add Amlogic Video FBC registers
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20200220162758.13524-1-narmstrong@baylibre.com>
 <20200220162758.13524-3-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <85b7dab4-0941-d31b-bcd7-3589d5040064@baylibre.com>
Date: Thu, 20 Feb 2020 20:33:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200220162758.13524-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_113358_601212_18CBBAD1 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 20/02/2020 =E0 17:27, Neil Armstrong a =E9crit :
> Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
> register.
> =

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_registers.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/me=
son/meson_registers.h
> index 8ea00546cd4e..f784d7d1fe2e 100644
> --- a/drivers/gpu/drm/meson/meson_registers.h
> +++ b/drivers/gpu/drm/meson/meson_registers.h
> @@ -144,10 +144,15 @@
>  #define		VIU_SW_RESET_OSD1               BIT(0)
>  #define VIU_MISC_CTRL0 0x1a06
>  #define		VIU_CTRL0_VD1_AFBC_MASK         0x170000
> +#define		VIU_CTRL0_AFBC_TO_VD1		BIT(20)
>  #define VIU_MISC_CTRL1 0x1a07
>  #define		MALI_AFBC_MISC			GENMASK(15, 8)
>  #define D2D3_INTF_LENGTH 0x1a08
>  #define D2D3_INTF_CTRL0 0x1a09
> +#define VD1_AFBCD0_MISC_CTRL 0x1a0a
> +#define		VD1_AXI_SEL_AFB			(1 << 12)
---------------------------------------/\
				Missing 'C'

Thanks Christian for reporting.... last minute checkpatch fix gone wrong.

Will fix either in v2 or when applying.

Neil

> +#define		AFBC_VD1_SEL			(1 << 10)
> +#define VD2_AFBCD1_MISC_CTRL 0x1a0b
>  #define VIU_OSD1_CTRL_STAT 0x1a10
>  #define		VIU_OSD1_OSD_BLK_ENABLE         BIT(0)
>  #define		VIU_OSD1_OSD_MEM_MODE_LINEAR	BIT(2)
> @@ -365,6 +370,23 @@
>  #define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
>  #define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
>  #define AFBC_ENABLE 0x1ae0
> +#define AFBC_MODE 0x1ae1
> +#define AFBC_SIZE_IN 0x1ae2
> +#define AFBC_DEC_DEF_COLOR 0x1ae3
> +#define AFBC_CONV_CTRL 0x1ae4
> +#define AFBC_LBUF_DEPTH 0x1ae5
> +#define AFBC_HEAD_BADDR 0x1ae6
> +#define AFBC_BODY_BADDR 0x1ae7
> +#define AFBC_SIZE_OUT 0x1ae8
> +#define AFBC_OUT_YSCOPE 0x1ae9
> +#define AFBC_STAT 0x1aea
> +#define AFBC_VD_CFMT_CTRL 0x1aeb
> +#define AFBC_VD_CFMT_W 0x1aec
> +#define AFBC_MIF_HOR_SCOPE 0x1aed
> +#define AFBC_MIF_VER_SCOPE 0x1aee
> +#define AFBC_PIXEL_HOR_SCOPE 0x1aef
> +#define AFBC_PIXEL_VER_SCOPE 0x1af0
> +#define AFBC_VD_CFMT_H 0x1af1
>  =

>  /* vpp */
>  #define VPP_DUMMY_DATA 0x1d00
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
