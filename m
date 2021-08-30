Return-Path: <SRS0=wk+L=NV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814F7C432BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CDBE61002
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CDBE61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XwSXFNEmwbXOuG+bim1iUTVFeMckOBiJc7C+Cen/xu4=; b=kqpF/w1bNdzj9fU/v1CyFdWLD6
	sV4Sh5oL/BlAFC1T1V+AKhBW4xEchl5HEHMzBmfLy2/evhlN/RaSra0rtpluMH4hrdCHsO9MySfTa
	O62c+hRYlNUXK+8ZbF6nvpc2x+d+MJZDSKGklFNodfWZddzbjF5lgV4f9kXzAz1nPBThN++cBiGaj
	u2+4W5Gtt2Pbzr6f00xhzVIyhwdN54ELhCzzM/kwZb1CUjb67wgkLrqKgqYoJUj1WWOvCqIL+tvww
	Uoy2mVnS3u3DeuLhev/cq+7C8TK6HvnTziD5Wu7Kkt17W3OPrYIY9TuR5Y9egCetY98L0hqh32nVa
	ub7op+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKc8J-00GfMT-MP; Mon, 30 Aug 2021 07:55:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKc8G-00GfMA-Tt
 for linux-amlogic@lists.infradead.org; Mon, 30 Aug 2021 07:55:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id i6so21155468wrv.2
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Aug 2021 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ihqat5eH1ui12ytw3o9f1yD8UgfpycEVbQo3mkJQlgA=;
 b=aVh9GU1N3OaMC5hM+h6H9draGQT5S9VyF6cy0MxDuPb7MvvgxgFMimRy9rf3VHIVvJ
 O7HECOPndFSqHrF6JVx13XaA1UyYrptj53FF5olxIXBfUwxgJuZxE/FmxYcZ68XKCOdd
 IK/cuOBJDGGgodW0D4sZA7WWiW/tSNKFBwyvM63q/9/foj0FXP7TxBDSlCp5v8nHXQs7
 hl2EsZ1VruX68cYWdnzW8RAA5OpfdT6PghFWJTCyZy6cwh+8Dl0zarKawSXaPtDQ0d4v
 lLOiVq54Nd6pRvWIebkmDE6+282819MFJriACGh/y1dOL8wTqQ2HD3dqM/4I6bU/N+V6
 /GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ihqat5eH1ui12ytw3o9f1yD8UgfpycEVbQo3mkJQlgA=;
 b=Ozykh1SfdBX/Bjyoyab0EU1Xgjj5kiMAFOB2wCsDvzQzK/6ArPMdwAcWp4fF6icYHt
 Rr2OdcIJ5rd2sQ6+n+9GAj4M2xbnXK6npGlq6fFynn7SzOWkNoMFjCco0xACOFsOr9GN
 Ra7zFq4BNUY7mSHz66rSJFhUeKYdzbpzSZ81Qv0ulV1+MINarZDmgB9Xb/ExXLTiejuO
 F+RLft8EQrH6suWGcL4sMaQlL0A6A6/EmTPRZ2BOAdSz7dr7EMRJdc3qK+wuTEQ6EONa
 zyHIZ/M2eagqW0LHpTcSKMa2io36vws0o6tIn5b4wKLCO+GDRT6y9okXG/FFeKh2xCDF
 yVjA==
X-Gm-Message-State: AOAM5307kbcD8HIfshqWY6xDgsa4A1prwkR4mWK2J1KDX8D9R2MKSL5Q
 6jM1T2Hmk6Q0Woy/yr9LZlg0/ZnXuoNTsdqA
X-Google-Smtp-Source: ABdhPJyk0Oz/KuU0F8jQ9c2T/WZq89p9T3xOftPuw8xsSFC/FxpCzg5A7+RegJ+zlqRqOPOWOWuUHg==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr24283026wrx.293.1630310101861; 
 Mon, 30 Aug 2021 00:55:01 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2ecd:4eac:486d:7a1?
 ([2001:861:44c0:66c0:2ecd:4eac:486d:7a1])
 by smtp.gmail.com with ESMTPSA id p5sm16310592wrd.25.2021.08.30.00.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 00:55:01 -0700 (PDT)
Subject: Re: [PATCH] ARM: meson: Add S905Y2 SOC ID
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20210820021836.1024-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c8e6a514-b0ac-7a2c-eef7-0939c2121eb2@baylibre.com>
Date: Mon, 30 Aug 2021 09:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820021836.1024-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_005505_022618_AA9B73DC 
X-CRM114-Status: GOOD (  15.77  )
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

On 20/08/2021 04:18, Christian Hewitt wrote:
> Add the SOC ID for the S905Y2 to board info, see below for before/after
> tested with a Radxa Zero board:
> 
> SoC:   Amlogic Meson G12A (Unknown) Revision 28:b (30:2)
> SoC:   Amlogic Meson G12A (S905Y2) Revision 28:b (30:2)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm/mach-meson/board-info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-meson/board-info.c b/arch/arm/mach-meson/board-info.c
> index d16d3f194d..2421acd817 100644
> --- a/arch/arm/mach-meson/board-info.c
> +++ b/arch/arm/mach-meson/board-info.c
> @@ -64,6 +64,7 @@ static const struct meson_gx_package_id {
>  	{ "A113X",  0x25, 0x37, 0xff },
>  	{ "A113D",  0x25, 0x22, 0xff },
>  	{ "S905D2", 0x28, 0x10, 0xf0 },
> +	{ "S905Y2", 0x28, 0x30, 0xf0 },
>  	{ "S905X2", 0x28, 0x40, 0xf0 },
>  	{ "A311D",  0x29, 0x10, 0xf0 },
>  	{ "S922X",  0x29, 0x40, 0xf0 },
> 

Applied to u-boot-amlogic

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
