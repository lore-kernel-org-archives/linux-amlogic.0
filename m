Return-Path: <SRS0=06Fz=QH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDE6C169C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 13:25:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F521218FC
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 13:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DK7o7A+K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QTAOD0Kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F521218FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8502ESJ2bFImO5ybNy5uLG7OFulUgkQWhNAlfAwQeGg=; b=DK7o7A+K7Tu6De
	1sPAFGp9X+e5DexsCI7MUFfTNGKniMpFKsCqFp/gCA4EIlfUaLo29QNtviDx9gVLng6W9tBmEdSD+
	ugchwODvPlwCnnw+TImi3GnGOpKFnAMV045LHTUfzMzcV4Uk0xI0REC7MT0g5dsFRImke62lyiECp
	PrCu4yqlPuVfuEn/yYsb6rP6W973NzYnmW4rfGNQXMtTw/BkaE+W7WcVxiTy6BF7fHW08Sz0LzAUY
	dsCfPxPl9AUf2Fxtlo2QCkk5kA6fR2p8rfSKLxN0VbysMfbX4OQo8jayHkZ4NbJziaMvYTPT94J70
	AjCTrJg2nIaWeq1ZFadg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpCLf-0007XM-QE; Thu, 31 Jan 2019 13:25:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpCLW-0007N7-77
 for linux-amlogic@lists.infradead.org; Thu, 31 Jan 2019 13:25:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id p7so3327174wru.0
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Jan 2019 05:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pLAtAN+e/h8++qzE4Yo24wu8yzuSyaPk74yzaWLGtKg=;
 b=QTAOD0Kq3x1ABUbUvvQeDYzlWXRDJ8oslketHVfwJl3e4Iy+7KcTQ5au+sTG/JEGCf
 DM8w6Hw9SGST4I1mrZPrpAeVMMI5oWSJyh3TILJ1WmuoEwmA0RkWlmnEFPdhmDtpd3D2
 ANWF/6YyjRPHxe3n1JhEGD/8t2+h7umTey8oZeROBmhIlf4wS1Yd0Ghj57CmBG/GqpWr
 v/+T9xMVHmEVUPGMFMJwkcEA4oydG6sZWt2EiGapKnO3MG4msyaCnSLiQAWP93ngT6an
 K7n/Zoz9AHuq55k5ebE9VgzRKi0MsC3h2kFGiCg3YGBu2xzjsOgxKbEsU1kx5/j15ijp
 vCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pLAtAN+e/h8++qzE4Yo24wu8yzuSyaPk74yzaWLGtKg=;
 b=WuMD+FB74tRbspRxKv9PZQ+sNOG4MI2BUdFGvJgwIODEROKlsOZJQKsIDlq3zRhbl1
 HOoulAyqqCX6jpaAZYd0dSFPUSu/xwSMmHgIx3/mCWqwPhFsEZCqeVpvDIQbCt8GKTvP
 j5yh6+F5gdYwWWbxutyQpcg1FvXKBA6Z0AdjK2Ap/M0/S5CmnctcZyOCw7v4HcGtyKst
 WgdtelDXzcihscRC3E5+3uSC40fOtHKBK40rYW5mUyStmx/Zcfl8tzB0wb0OZO2lMeVP
 6GonVc5nlKVxQIQQIPenrTS7Y4ptdeikVx04dlHWmPxffLtiU2nwtvHa/otZCSMsWQGp
 Dnsg==
X-Gm-Message-State: AJcUukeBr7vkDGtdjcqMqbiv8EKq+SYyUrr3Mpns4x8vWQhsKX4+jfGs
 j1kFo412EUg6MsReQkwd1fhf5w==
X-Google-Smtp-Source: ALg8bN7UrZJ2ztid03LXi1Ur+gJHSDe8wHRc7Z6ZsV94hr115J/vSi7p789x1zl81piWwonn7EJC8g==
X-Received: by 2002:adf:f785:: with SMTP id q5mr36158725wrp.9.1548941131419;
 Thu, 31 Jan 2019 05:25:31 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d4sm6834217wrp.89.2019.01.31.05.25.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Jan 2019 05:25:30 -0800 (PST)
Subject: Re: [PATCH 0/8] drm/meson: Add support for HDMI2.0 4k60
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, maxime.ripard@bootlin.com
References: <20190115123315.11069-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <a3de23a8-3fa4-f8c5-5b2a-33109c09a863@baylibre.com>
Date: Thu, 31 Jan 2019 14:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_052535_517898_BD0D876B 
X-CRM114-Status: GOOD (  26.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrzej, Laurent,

On 15/01/2019 13:33, Neil Armstrong wrote:
> This patchset aims to add support for the following HDMI2.0 4k60 modes:
> - 594Mhz TMDS frequency needing TMDS Scramling and 1/40 rate for RGB/YUV4:4:4
> - 297MHz TMDS frequency with YUV4:2:0 encoding
> 
> The first mode uses the SCDC helpers introduced by intel to :
> - discover where the monitor support SCDC
> - setup the SCDC parameters
> This is implemented in the dw-hdmi bridge driver by handling scrambling
> support during the bridge setup and by exporting an helper for the PHY
> setup to setup the SCDC configuration for the 1/40 TMDS rate.
> This code will only be active if the encoder support a TMDS rate > 340MHz.
> 
> This patch could eventually break support on different SoC when connected
> on a 4k60 monitor with SCDC :
> - i.MX correctly discards pixel clocks > 216MHz
> - R-CAR discards discards pixel clocks > 297MHz since [1]
> - Rockchip discards invalid pixel clocks not in the rockchip_mpll_cfg table
> - sun8i correctly discards pixel clocks > 297MHz on a83t
> - sun8i discards discards pixel clocks > 594Mhz on h6, which is already broken
> 
> First patch should fix support for Allwinner H6.
> 
> The second mode is implemented by added the missing 4:2:0 bypass handling
> in the dw-hdmi bridge driver and adding a "mtmdsclock" separating the
> pixel clock from the tmds clock in the mode setup phase.
> We also enable support for these modes in the connector only if the platform
> glue code explicits the support.

Do you think patches 1-4 could be applied ?

Then we could focus on how we manage the bus format between the encoder
and the bridge ?

Especially patch 5 linked to patch 7.

Will one of you be at FOSDEM 2019 ? we could chat about this.

Following subjects on the table will be :
- HDR metadata transmission aligned with the last patchset sent by intel-gfx
- Colorspace connector property aligned with the last patchset sent by intel-gfx
- HDCP 1.4 and 2.2 handling

Neil

> 
> Only the meson DRM dw_hdmi glue allows ycbcr420 modes, so no breakage
> is expected here.
> 
> The remaining patches adds support for :
> - 1/40 TMDS rate aka DIV40 in the dw-hdmi meson PHY setup
> - 4:2:0 output and clock setup
> 
> The dw-hdmi support re-uses the support done by Rockchip engineers on the
> Linux 4.4 BSP kernel.
> 
> These modes has been validated using a MuxLab HDMI Signal Analyser in
> addition to different UHD TVs supporting full 4k60 or the 4:2:0 variant.
> 
> Changes since RFC v2 at [3]:
> - Collected tested-by and reviewed-by tags
> - Changed if condition in "add HDMI div40 TMDS mode"
> - Updated "Add YUV420 output support" with the same if condition
> 
> Changes since RFC v1 at [2]:
> - Fix all comments from Laurent :
> - Add define for HDMI 1.4 max tmds clock and SCDC supported version
> - Call dw_hdmi_set_high_tmds_clock_ratio() in dw_hdmi_phy_enable_powerdown()
> to unbreak Allwinner H6
> - Pass in_t(u8, bytes, SCDC_MIN_SOURCE_VERSION) as SCDC version
> - Finally add comments for SCDC and Scrambling process
> 
> [1] https://patchwork.freedesktop.org/patch/263616/
> [2] https://patchwork.freedesktop.org/series/52950/#rev1
> [3] https://patchwork.freedesktop.org/series/52950/#rev2
> 
> Neil Armstrong (7):
>   drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support
>   drm/meson: add HDMI div40 TMDS mode
>   drm/meson: add support for HDMI2.0 2160p modes
>   drm/bridge: dw-hdmi: add support for YUV420 output
>   drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
>   drm/meson: Add YUV420 output support
>   drm/meson: Output in YUV444 if sink supports it
> 
> Zheng Yang (1):
>   drm/bridge: dw-hdmi: support dynamically get input/out color info
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 182 +++++++++++++++++++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 128 ++++++++++++---
>  drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++++---
>  drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
>  drivers/gpu/drm/meson/meson_venc.c        |   8 +-
>  drivers/gpu/drm/meson/meson_venc.h        |  11 ++
>  drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
>  include/drm/bridge/dw_hdmi.h              |   7 +
>  9 files changed, 374 insertions(+), 66 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
