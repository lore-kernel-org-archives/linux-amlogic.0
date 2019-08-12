Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81388C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503E020820
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DeeVYeXI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JcxaLyGl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 503E020820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zuc01gh3tGUVSazeLQh3mL3W6ETR4IB12HZDGHzdXT4=; b=DeeVYeXI8usaHr
	8jeoS0uG/6FwvWtSimgpv0LZRvIU5Lhs5gfWbvM8l2DicChTvcNaQISTPYuqbAn9ea3o48CeB45SR
	C1IFKRp6O90e0DMV4uFBntM+zLDEnWXrdtKxDBxDuxcytBOr1Z1m5f3MDpQDeGNvqLFmObGg1vMvY
	/lwe+TzGKhLheL94uOE0n6AfYyPykrQROGnohfpk/yk+PSGCPGsKgeTU9j1WfuCWIN/2gQoqc84k7
	PcjcxuxngoM6MM5HJxlCBq7TXGnIwLy2G0Cd98rvqCAo4VVX4DY1msy0MwOfaVuKLXQEMzJIoRawZ
	K94ePuGzn8lgAH3u+Shw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9JL-00077f-Oz; Mon, 12 Aug 2019 12:20:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9IO-0005N6-U6
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:19:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id m125so7515909wmm.3
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QzvoEjhOABUcQi/WNvsqmRMdk9cT0mKET1cKTlCQ0dc=;
 b=JcxaLyGlhbrJy/GUCkgGPoXZpSYYRFffjqp/pR9XdLIqY2KUbDj2WsF661IScFHmQ+
 vKfhxZ6C+yYgT+jh5LnQxPfKZV9AkkNYUOf8KI5/tkWQXUf6pAsiBQW4bBXYDe0T7zUo
 sg5n/+gyhyzNWsjP8r21Ai5Pgdc12Wh5qPZ1h3hMibMWutxnn6sv3EgulHXsJH16lCTM
 OhhTb7T6+0CqIq5nAbwh0zNBASwRY1ZhIZr/YtFXEbsAI7ZAfVUSWE6V0clR3EtFp8KY
 HXIKbFizeGquSSwXV06NBjNZPebO1ZRO1GrO+5gvU3//SkTmoSrAz2BMapTrcoVJUlKD
 VPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QzvoEjhOABUcQi/WNvsqmRMdk9cT0mKET1cKTlCQ0dc=;
 b=RUacs6WSBVQpXFhSQAB4G/kbxjxDePS64pZvb1wfK7d1Ma6oOHqJdE4P7vQlrPc5Fw
 64Up0q24XOamMmjQOsLCgX4S9ds6evQ1zjtSLJGmlOcJrTRrFp12+IgMu6a80V3302xj
 bUyj9OOXWdESShWBsZm9J9FcN6PZHaEUuJcqw0Phn+ojyxXIfFouOIr1YkFjPJg9tXVc
 lQIreCYOZaB2xQcV1ArCQ1Y4QeE7gkdciq3Q6UOS4mdSN574IWJNXunf7+LueOvtnMfM
 H0Xq8vBthq6cgEGD7jYBFchmz4S4PQDucZ1AUuWTNntSy+rJ9kLrUkiu6+QuiEHjilCN
 U0Zw==
X-Gm-Message-State: APjAAAUzDC/g3vwN7kCzArratn71uhI6OQy4jXb019ky+LJozq+CNIXD
 bOfLBQS1eh6RE1lCSzgWtxCiBg==
X-Google-Smtp-Source: APXvYqyVyd2gfXVwbNZaX+jetvnrTPK6nz7U8xSKrv5PXMKt7YJrrxgbiPSG6h1JpLnczJdSR7+Yyg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr27659881wmk.79.1565612366823; 
 Mon, 12 Aug 2019 05:19:26 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n14sm207296511wra.75.2019.08.12.05.19.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 05:19:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
To: Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
Date: Mon, 12 Aug 2019 14:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_051929_025505_14D04E0A 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 12/08/2019 14:07, Jerome Brunet wrote:
> The purpose of this patchset is to improve the support of the i2s
> interface of the synopsys hdmi controller.
> 
> Once applied, the interface should support all the usual i2s bus formats,
> 8 channels playback and properly setup the channel number and allocation
> in the infoframes.
> 
> Also, the dw-hdmi i2s interface will now provide the eld to the generic
> hdmi-codec so it can expose the related controls to user space.
> 
> This work was inspired by Jonas Karlman's work, available here [0].
> 
> This was tested the Amlogic meson-g12a-sei510 platform.
> For this specific platform, which uses codec2codec links, there is a
> runtime dependency for patch 8 on this ASoC series [1].
> 
> Changes since v1 [2]:
>  * Fix copy size in .get_eld()
> 
> [0]: https://github.com/Kwiboo/linux-rockchip/commits/rockchip-5.2-for-libreelec-v5.2.3
> [1]: https://lkml.kernel.org/r/20190725165949.29699-1-jbrunet@baylibre.com
> [2]: https://lkml.kernel.org/r/20190805134102.24173-1-jbrunet@baylibre.com
> 
> Jerome Brunet (8):
>   drm/bridge: dw-hdmi-i2s: support more i2s format
>   drm/bridge: dw-hdmi: move audio channel setup out of ahb
>   drm/bridge: dw-hdmi: set channel count in the infoframes
>   drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
>   drm/bridge: dw-hdmi-i2s: set the channel allocation
>   drm/bridge: dw-hdmi-i2s: reset audio fifo before applying new params
>   drm/bridge: dw-hdmi-i2s: enable only the required i2s lanes
>   drm/bridge: dw-hdmi-i2s: add .get_eld support

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Jonas, is patch 8 ok for you now ? If yes I'll apply them to drm-misc-next.

Neil

> 
>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 20 ++-----
>  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  1 +
>  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 60 +++++++++++++++++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 37 ++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 13 +++-
>  include/drm/bridge/dw_hdmi.h                  |  2 +
>  6 files changed, 108 insertions(+), 25 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
