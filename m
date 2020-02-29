Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5EBC3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA46024677
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xy5WJ4B0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OjKh2HhH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA46024677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHV9HzX2t9bqib1psbF220jyrVv4elSpO5wI17D/Vko=; b=Xy5WJ4B086pvWa
	MiojU825oJsNOw5Nwq9my3UWx4ZA+H/WndBCaixY5peUnrnktMpfjBrwVrY+lWNFb659WmK0Xq5iD
	+ig/Y9VOKHrvu2o5Tp1YtCBTXdaRHRXoXRa8V3fVqdTit/wd7/gBi+f+37TXy7n51MhNwzW5lFj0y
	XWFYsP0sRKbSNXWZsdG1ZTmRTQ+LwBbm6jr1SOf1ZL5CYtLpgjTTMhFw1eF5EQHaMigXR9zfefZCN
	oaoYSSF9LyPTe7Wpv4TnDpiELFgiO2kM+g/zG1b8ZfiWyYd4zT7EeLHtmR7L3/9gVMAg55dVy+GEK
	m7ngBJXjzA8f75ykzS4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j86EW-0005lU-Lz; Sat, 29 Feb 2020 17:49:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j86ET-0005ks-O3
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 17:48:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id e10so5841778wrr.10
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Feb 2020 09:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZayidFagez4Iqa0WdVqRCWWZUtND8cC6eqziUqJZJmc=;
 b=OjKh2HhHMq2rTYWzUbngs+vFkLG8b+mFteGPKRXj2T8+FCtDHOA9t7CIjqNkjDZdeZ
 J07gdZyMgyYsznuhl2xtq/NVdZ+MyiJYAhmSRgna9zX3H3BvHPGBWZ8wXfYycucO0Rfj
 jcpZWPfDNgA90xVKnKhXSZYmyQE/3K3WUFYEEXgxYxnIZ0HlOvnPryPXYGDgCZxNP0Nh
 tczhsu1tS3+nqYUYdVsFO3Oxnrcol4gZHAD2WnVQeqd9KPCkNehArtGUPigj3vF2lP42
 S3w5Ljjrs8HQARR/kpkYS4DwmnV5/9GTV12D9PpvthiFxPp0Z0gPfzfStH5gbS7iSOe7
 5GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZayidFagez4Iqa0WdVqRCWWZUtND8cC6eqziUqJZJmc=;
 b=p6ddgVFv9ZKDj4/xPB8MEb/4tq0eIPmA6sMnZcdx3s3ntVz1QAnRe84831wUUFclbT
 iPCacAmhE8CBWXYLtASKDvL9cptoSheLfFeY+Ygv92p1QorH3rbja+WUntw1i3q8UWka
 lUaSOL108htCA8f/UXY/x4jWwdOoopthkLhlMcl6ToDJsGvkMNZRWDKUMu6tKWtkVrly
 JWaWiK5VHxh0TL5LtdwCl6aUc4lNtzGq7pJzIQxIgTFxj9ONjhCSTJpAAuL9hwSACbkb
 zlM1sO3jJNnWfNixHHfr9ewKsJ4c/P14FejApP2LUFVdUGRKMyXG/Mr6PRtEfl81/9bQ
 xImg==
X-Gm-Message-State: APjAAAXsXsIred1KiCTaYimaMAVxw9Zv+dGbDeRDa/Cm6p++lZ0IQAh/
 5lZrUOpA/chEUbN4PKfgpYHUMxPxnj8VLw==
X-Google-Smtp-Source: APXvYqzwdRDHCo+JK9WoMEpBpcMTaJ8faVAZvaZz5Q4T5r9MrCA1hC6MCXi/+N36SnaRFlbwkEMtXw==
X-Received: by 2002:adf:ed84:: with SMTP id c4mr11380334wro.24.1582998536137; 
 Sat, 29 Feb 2020 09:48:56 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id r19sm2154532wmh.26.2020.02.29.09.48.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:48:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: fix gxm-khadas-vim2 wifi
In-Reply-To: <1582212790-11402-1-git-send-email-christianshewitt@gmail.com>
References: <1582212790-11402-1-git-send-email-christianshewitt@gmail.com>
Date: Sat, 29 Feb 2020 18:48:54 +0100
Message-ID: <7htv399tdl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_094857_785584_B5C037D8 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
Cc: Art Nikpal <email2tema@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Fixes: adc52bf7ef16 ("arm64: dts: meson: fix mmc v2 chips max frequencies")

nit: Fixes tag should go at the end with the other trailers (see "git
interpret-trailers ")

I'll fix thet up when applying.

> before
>
> [6.418252] brcmfmac: F1 signature read @0x18000000=0x17224356
> [6.435663] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
> [6.551259] brcmfmac: brcmf_sdiod_ramrw: membytes transfer failed
> [6.551275] brcmfmac: brcmf_sdio_verifymemory: error -84 on reading 2048 membytes at 0x00184000
> [6.551352] brcmfmac: brcmf_sdio_download_firmware: dongle image file download failed
>
> after
>
> [6.657165] brcmfmac: F1 signature read @0x18000000=0x17224356
> [6.660807] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
> [6.918643] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
> [6.918734] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
> [6.922724] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4356/2 wl0: Jun 16 2015 14:25:06 version 7.35.184.r1 (TOB) (r559293) FWID 01-b22ae69c
>
> Suggested-by: Art Nikpal <email2tema@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Queued as a fix for v5.6,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
