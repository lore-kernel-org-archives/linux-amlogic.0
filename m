Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED81BC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE53C20848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBUJlgzi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bH7QAdHA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE53C20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JClF9wy4btyDWdoOFPeWkoZg1FJZ6gySBTIBp6rcg0=; b=TBUJlgziqB/1HA
	mpLKIMoZOxN53C7hf6G+mhSMIKLd0jYgcrOew6Q6STbRMQ3MME6N2HYk33s4oajv2x6SpMtglX53Y
	3ns18cJcd2LSD1dw/L6E4AT4/iCGI6byek17mj+6mTqPGptomXmNC9dQDFXGzkZvToQm1/fTigWSQ
	kq0evhcU7yu8MKAiGkZtv0VErzKjdrWAJNPC+8dDcz8xDSUaAAEbeWhhwmpABBRlAtJoTJ0hZTY6R
	5KPKXKFdtK5eeuDQfEhYTSShY0e+sOuXTuUL5SLhKaMROF+hPmhUa++Hyc0lb4JAnxgYrhEEPnqEw
	Yt0+smvfuRMt4arESvxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTk6n-0003ur-LU; Mon, 03 Dec 2018 09:01:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTk6i-0003t6-3s
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 09:01:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id 96so11249690wrb.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 01:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J8HAC4m9QJ7qId2wfVHJZTANnrFF67ITasl16JJDGXU=;
 b=bH7QAdHAuFdlYI6j+0/gD9IcAw8SWAyT28GM8KX6nbHC+Utr7rkEXKQyT5SHNOjZLd
 AenU+Yb5BXpNAdJW0HlPJ6MFM2kI99bzeEveiCnf6GjlmEVy0GiUvtu6HiRBsbh7bICh
 Cse0m7Z2Dn4HITWu88q+j2pdgJd89mwhH8K0Dm/2cXW5ZMTQ3asB38xon95h2TqmtZlk
 LZuf7AIUzRYfcB+M1P3xG2O/R8UmDMJclTHDWWwtx5TD2HjuabgL5GL4mWaKrlpclryN
 +YoVkpQGzrfYxKdg4Heu1N0+LrSd9retkbdtbzu4/F2/7Z34q4v1dLqBptWf8EN2Xf9U
 BCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J8HAC4m9QJ7qId2wfVHJZTANnrFF67ITasl16JJDGXU=;
 b=AmZC8F5iA/3JNS3H4VTTD9l1qMWT5GBcs68qN+zSPh7yMtdTnJn/dsXjrT6FJlHxjz
 thUCeylB3qoefw8t4qFrN+VFAGQUiS0T2vxgm3Vlv4rFmDqOuile2qwi+pw8TrrAOhqO
 sOwdGQv604X/Xgyvmn7yfYU95sUfIBmvzoht8f0XCBdXeUbjeFTz2XixbeUMAdgHhEfn
 aQjCzd/YBUmvPbn68febrZh+4In8TW+WX2KITMIbRU2kQd+GvJgD2m6aia279A47Tbvs
 ftWid5mM7a06cUZa6+r1du5G4tlNF61FvLXPFcLoO04RYWzuf840JvBPzOwtP1b+wqXZ
 gD7w==
X-Gm-Message-State: AA+aEWYtrGbNOvltoktGdLDafNcRPB4smIGS/sWOspWbM4K9OoMSffme
 V52MFx+BBwlxrLd3iBcW/c5x/g==
X-Google-Smtp-Source: AFSGD/UE3ELeO64WcDxvjlFHAocIzTf2mPEQlAq8Px66jEJwZT0stMUsJr7n1RlA11r8VaHWpfQbnQ==
X-Received: by 2002:adf:9467:: with SMTP id 94mr13049830wrq.305.1543827683620; 
 Mon, 03 Dec 2018 01:01:23 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t9sm15276137wrr.17.2018.12.03.01.01.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 01:01:22 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
To: Rob Herring <robh@kernel.org>, arm@kernel.org
References: <20181130170634.9467-1-robh@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <95299838-4954-4cb8-d026-82a33eb941a3@baylibre.com>
Date: Mon, 3 Dec 2018 10:01:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_010136_208967_CC9A63D0 
X-CRM114-Status: GOOD (  21.64  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>,
 David Brown <david.brown@linaro.org>, Jamie Iles <jamie@jamieiles.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Andy Gross <andy.gross@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, linux-oxnas@groups.io,
 Eric Miao <eric.y.miao@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30/11/2018 18:06, Rob Herring wrote:
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
> 
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Yes, I'm being lazy and not splitting this up into dozens of sub-arch 
> patches. I don't think this should conflict nor should we be getting new 
> dependencies on skeleton.dtsi. So please apply directly to arm-soc.
> 
> Rob
> 
>  arch/arm/boot/dts/alphascale-asm9260.dtsi      |  3 ++-
>  arch/arm/boot/dts/alpine.dtsi                  |  8 +++++++-
>  arch/arm/boot/dts/arm-realview-eb.dtsi         |  4 +++-
>  arch/arm/boot/dts/arm-realview-pb1176.dts      |  4 +++-
>  arch/arm/boot/dts/arm-realview-pb11mp.dts      |  4 +++-
>  arch/arm/boot/dts/arm-realview-pbx.dtsi        |  4 +++-
>  arch/arm/boot/dts/armada-38x.dtsi              |  4 +++-
>  arch/arm/boot/dts/armada-39x.dtsi              |  3 ++-
>  arch/arm/boot/dts/artpec6.dtsi                 |  3 ++-
>  arch/arm/boot/dts/at91rm9200.dtsi              |  4 +++-
>  arch/arm/boot/dts/at91sam9260.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9261.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9263.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9g45.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9n12.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9rl.dtsi              |  4 +++-
>  arch/arm/boot/dts/at91sam9x5.dtsi              |  4 +++-
>  arch/arm/boot/dts/atlas6-evb.dts               |  1 +
>  arch/arm/boot/dts/atlas6.dtsi                  |  1 -
>  arch/arm/boot/dts/atlas7.dtsi                  |  1 -
>  arch/arm/boot/dts/axm55xx.dtsi                 |  4 ++--
>  arch/arm/boot/dts/bcm-cygnus.dtsi              |  9 +++++++--
>  arch/arm/boot/dts/bcm-nsp.dtsi                 |  4 ++--
>  arch/arm/boot/dts/bcm11351.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm21664-garnet.dts          |  1 +
>  arch/arm/boot/dts/bcm21664.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm23550-sparrow.dts         |  1 +
>  arch/arm/boot/dts/bcm23550.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm28155-ap.dts              |  1 +
>  arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts    |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-600dhp2.dts  |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-900dhp.dts   |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts  |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts  |  1 +
>  .../boot/dts/bcm47081-tplink-archer-c5-v2.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts  |  1 +
>  .../arm/boot/dts/bcm47094-linksys-panamera.dts |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts  |  1 +
>  .../boot/dts/bcm47094-luxul-xwr-3150-v1.dts    |  1 +
>  arch/arm/boot/dts/bcm47094-netgear-r8500.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts  |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-810.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-tenda-ac9.dts       |  1 +
>  arch/arm/boot/dts/bcm5301x.dtsi                |  3 ++-
>  .../boot/dts/bcm53340-ubnt-unifi-switch8.dts   |  1 +
>  arch/arm/boot/dts/bcm53573.dtsi                |  3 ++-
>  arch/arm/boot/dts/bcm63138.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm7445.dtsi                 |  2 --
>  arch/arm/boot/dts/bcm947189acdbmr.dts          |  1 +
>  arch/arm/boot/dts/bcm953012er.dts              |  1 +
>  arch/arm/boot/dts/bcm953012hr.dts              |  1 +
>  arch/arm/boot/dts/bcm953012k.dts               |  1 +
>  arch/arm/boot/dts/cx92755.dtsi                 |  4 ++--
>  arch/arm/boot/dts/dove.dtsi                    |  4 ++--
>  arch/arm/boot/dts/ep7209.dtsi                  |  4 ++--
>  arch/arm/boot/dts/ep7211-edb7211.dts           |  1 +
>  arch/arm/boot/dts/integrator.dtsi              | 10 ++++++++--
>  arch/arm/boot/dts/kirkwood.dtsi                |  3 ++-
>  arch/arm/boot/dts/lpc32xx.dtsi                 |  4 ++--
>  arch/arm/boot/dts/ls1021a.dtsi                 |  8 +++++++-
>  arch/arm/boot/dts/meson.dtsi                   |  3 ++-
>  arch/arm/boot/dts/meson6-atv1200.dts           |  1 +
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts      |  1 +
>  arch/arm/boot/dts/meson8b-ec100.dts            |  1 +
>  arch/arm/boot/dts/meson8b-mxq.dts              |  1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts         |  1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts      |  1 +
>  arch/arm/boot/dts/mmp2-brownstone.dts          |  1 +
>  arch/arm/boot/dts/mmp2.dtsi                    |  4 +++-
>  arch/arm/boot/dts/moxart.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt2701-evb.dts               |  1 +
>  arch/arm/boot/dts/mt2701.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt6580-evbp1.dts             |  1 +
>  arch/arm/boot/dts/mt6580.dtsi                  |  1 -
>  arch/arm/boot/dts/mt6589-aquaris5.dts          |  1 +
>  arch/arm/boot/dts/mt6589.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt6592-evb.dts               |  2 +-
>  arch/arm/boot/dts/mt6592.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt8127-moose.dts             |  1 +
>  arch/arm/boot/dts/mt8127.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt8135-evbp1.dts             |  1 +
>  arch/arm/boot/dts/mt8135.dtsi                  |  3 ++-
>  arch/arm/boot/dts/nspire.dtsi                  |  4 ++--
>  arch/arm/boot/dts/orion5x-lacie-d2-network.dts |  1 +
>  .../orion5x-lacie-ethernet-disk-mini-v2.dts    |  1 +
>  arch/arm/boot/dts/orion5x-lswsgl.dts           |  1 +
>  .../dts/orion5x-maxtor-shared-storage-2.dts    |  1 +
>  arch/arm/boot/dts/orion5x-netgear-wnr854t.dts  |  1 +
>  arch/arm/boot/dts/orion5x-rd88f5182-nas.dts    |  1 +
>  arch/arm/boot/dts/orion5x.dtsi                 |  4 ++--
>  arch/arm/boot/dts/ox810se.dtsi                 |  4 +++-
>  arch/arm/boot/dts/ox820.dtsi                   |  4 +++-
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi         |  1 -
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi         |  1 -
>  arch/arm/boot/dts/prima2-evb.dts               |  1 +
>  arch/arm/boot/dts/prima2.dtsi                  |  1 -
>  arch/arm/boot/dts/pxa168.dtsi                  |  4 +++-
>  arch/arm/boot/dts/pxa2xx.dtsi                  |  3 ++-
>  arch/arm/boot/dts/pxa910.dtsi                  |  4 +++-
>  arch/arm/boot/dts/qcom-apq8064.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-apq8084.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-ipq4019.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-ipq8064.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi     |  1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi            |  4 ++--
>  arch/arm/boot/dts/qcom-msm8660.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-msm8960.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-msm8974.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/sama5d2.dtsi                 |  4 +++-
>  arch/arm/boot/dts/sama5d3.dtsi                 |  4 +++-
>  arch/arm/boot/dts/sama5d4.dtsi                 |  4 +++-
>  arch/arm/boot/dts/skeleton.dtsi                | 18 ------------------
>  arch/arm/boot/dts/skeleton64.dtsi              | 14 --------------
>  arch/arm/boot/dts/spear13xx.dtsi               |  4 ++--
>  arch/arm/boot/dts/spear3xx.dtsi                |  4 ++--
>  arch/arm/boot/dts/spear600.dtsi                |  4 ++--
>  arch/arm/boot/dts/ste-nomadik-stn8815.dtsi     |  2 +-
>  arch/arm/boot/dts/ste-u300.dts                 |  2 +-
>  arch/arm/boot/dts/stm32429i-eval.dts           |  1 +
>  arch/arm/boot/dts/stm32746g-eval.dts           |  1 +
>  arch/arm/boot/dts/stm32f429-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f429.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32f469-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f746-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f746.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32f769-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32h743.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32h743i-disco.dts         |  1 +
>  arch/arm/boot/dts/stm32h743i-eval.dts          |  1 +
>  arch/arm/boot/dts/stm32mp157c-ed1.dts          |  1 +
>  arch/arm/boot/dts/sun5i-a10s.dtsi              |  4 ++--
>  arch/arm/boot/dts/sun5i-a13.dtsi               |  4 ++--
>  arch/arm/boot/dts/sun5i.dtsi                   |  9 +++++++--
>  arch/arm/boot/dts/sun6i-a31.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun7i-a20.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi           |  4 ++--
>  arch/arm/boot/dts/sun8i-a23.dtsi               |  1 +
>  arch/arm/boot/dts/sun8i-a33.dtsi               |  1 +
>  arch/arm/boot/dts/versatile-ab.dts             |  2 +-
>  arch/arm/boot/dts/vt8500.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8505.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8650.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8750.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8850.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/zx296702-ad1.dts             |  1 +
>  arch/arm/boot/dts/zx296702.dtsi                |  4 +++-
>  149 files changed, 330 insertions(+), 153 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/skeleton.dtsi
>  delete mode 100644 arch/arm/boot/dts/skeleton64.dtsi
> 

[...]

> diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
> index c2b48a1838eb..3a26650de4eb 100644
> --- a/arch/arm/boot/dts/ox810se.dtsi
> +++ b/arch/arm/boot/dts/ox810se.dtsi
> @@ -6,11 +6,12 @@
>   * Licensed under GPLv2 or later
>   */
>  
> -/include/ "skeleton.dtsi"
>  #include <dt-bindings/clock/oxsemi,ox810se.h>
>  #include <dt-bindings/reset/oxsemi,ox810se.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  	compatible = "oxsemi,ox810se";
>  
>  	cpus {
> @@ -25,6 +26,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		/* Max 256MB @ 0x48000000 */
>  		reg = <0x48000000 0x10000000>;
>  	};
> diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
> index 085bbd33eadc..f3239586f38d 100644
> --- a/arch/arm/boot/dts/ox820.dtsi
> +++ b/arch/arm/boot/dts/ox820.dtsi
> @@ -6,12 +6,13 @@
>   * Licensed under GPLv2 or later
>   */
>  
> -/include/ "skeleton.dtsi"
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/oxsemi,ox820.h>
>  #include <dt-bindings/reset/oxsemi,ox820.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  	compatible = "oxsemi,ox820";
>  
>  	cpus {
> @@ -35,6 +36,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		/* Max 512MB @ 0x60000000 */
>  		reg = <0x60000000 0x20000000>;
>  	};

[...]

For Oxnas,

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
