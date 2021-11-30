Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276BC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=94w8/z1dk7ECBUfYUsbiVYWQJGQYcNZTbgZ6yjHRBpg=; b=TDNWlfueFHU9dofW46zGNrbzik
	i9NxRO31okfnoFyLMWsYHdSO4U/4X3s5z0Y+wNObqiWR2EsPL+Q6IZyfJ2SLltsI4ykQ3fkSlH9yx
	BIxd84P3CxsvOX//6wrzL7CxoDDvcmmmo1ktToEzNU8xsPjk4HyUDGWVvWJSjrrv4x2Vx/iEUVKa9
	AIN153UDMxhJkd1tJiYCeizTg/SKWBAZuOJaxjFQpaQ6anKyVKBzk0SUl5QVhBMIgmg0PqMTAO/c0
	Kf50n0wUo9k3PcWSauaKUaC94BDmcUhqfrwvjW5AKWRZgZoOLotQ9E0mfTQgOCE0nw6FJjcYCQMpA
	KsYQgLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0Yk-004g93-AM; Tue, 30 Nov 2021 10:40:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0Yg-004g6s-SY
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:40:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso19131620wms.3
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KuuIZB6GSfIhq8d/S1rOlrCT876l8ZYGmC+dyBOaWSM=;
 b=gG8bbXR1gjo/GWKLcJD/G1WmgLEN7P8cvntZS8OXh1AIOwY2VvPPaNVcK07RUAZ7Nx
 jbTouJBphatTHAJQKICUG2INC1UoX3aunpbdPiw5JxJ27H8qHDpAh3yY1jAPfr2F7AGf
 J90MWh2DzsWlIykshXJS2Hlw8c6j42ENadg/2ztszoOkkljiyMV69EhQwtSnPMSyDKqd
 5Ez4FXccp0ydSgDRDQp8/tccgsYoOXOGOJanT5O+LklE9n4MWktQXzGAhv4p06cQNh6e
 v3Nb6CEW8jH9iXHbKr2Hds99BUPyByZL0HzVBr651E93pMT1ePXpEbnshBpH/thEr4fA
 ESvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KuuIZB6GSfIhq8d/S1rOlrCT876l8ZYGmC+dyBOaWSM=;
 b=6numRd80oiZcjVyJauvaKEUGbudqX8Avr7dvt9kOqvSd3O5403RhVK5TkVY0FA2lDu
 SrZ7Wu5nwNGjoIL+jYaY7R1bEVP83qa8HJuHdz81vllSS8G2yCRhWrmxZ8f0fv3A4kNe
 C3ZiTOxyQZNJXfoAQYyDdR3NKj1RwjBoMl8hJxBE3pnhBxgoUzpY+EecyogcvxZCoyH9
 oltljdZMX62l+6d6ffe2s+omT895QAL5SF6/UcMg49OXZcUSXfad1f4xbu3HvpYE2fV4
 uiL4PEUA5J6kveT0uJBgngr2eJl+a1YWSjlRXzY/jA1su5p9ADA9nGcSjNnHRJ6ngrEe
 rxCw==
X-Gm-Message-State: AOAM533GSJ+OYeOdzfna57M1dJKAgMSZ/d0PgyQk++Piu820xZ045QTS
 ceeHqLICwDYU2z0YISDiXKQEog==
X-Google-Smtp-Source: ABdhPJzESvA8YknWbL6MSpRi5ucQJGO7g/kGd+X6Z3Q9PVMe+l/veR2GB86m8EV5sxWuy54Jd5hvPA==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr4009020wmq.68.1638268820980; 
 Tue, 30 Nov 2021 02:40:20 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a?
 ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id y7sm15868082wrw.55.2021.11.30.02.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:40:20 -0800 (PST)
Subject: Re: [RFC PATCH 0/9] arm64: dts: meson: add support for aac2xx devices
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Benoit Masson <yahoo@perenite.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <51fb0be9-9186-3d79-38fa-b8a5151ccba9@baylibre.com>
Date: Tue, 30 Nov 2021 11:40:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024022_977004_0D9CF4DB 
X-CRM114-Status: GOOD (  25.01  )
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

Hi,

On 30/11/2021 07:05, Christian Hewitt wrote:
> This series adds support for several popular Amlogic S905X3 (SM1) Android
> Set-Top Box devices. Like most Android box devices, they ship in variants
> with multiple RAM, eMMC, WiFi and BT configurations. RAM and eMMC are not
> something we need to consider to get a working boot, but we do need to get
> the correct connectivity spec. Broadly speaking we see boxes with Higher
> and Lower spec connectivity; High spec is Gigabit Ethernet and Faster dual
> antennna WiFi, and Lower spec is Megabit Ethernet and a single antenna. In
> some low-end boxes BT is ommitted.
> 
> The main reason for the RFC tag is to solicit feedback on the choice of
> the -100 and -1000 suffixes which are used to distinguish between devices
> with 10/100 Mbit (Internal PHY) or 10/100/1000 Gbit (External PHY) NIC
> configurations; which is important to get correct else the box will have
> no connectivity. I'm not a big fan of the suffixes, but earlier versions
> where I used -int/-ext and -mbit/-gbit resulted in users having no idea
> what the difference was. I'd like to informally establish a convention for
> this naming before doing similar things with some S905X2 devices.

I have no opinion for -100/-1000, -int/-ext, -mbit/-gbit or <nothing>/-gigabit or whatever.

I'll wait for further comments from other reviewers here !

Neil

> 
> NB: At the current time the Realtek 8822CS and MT7668 WiFi/BT chips we
> have seen on 'AIR' devices are not supported in the kernel so these are
> deliberately ommitted. The H96-Max uses a conventional Broadcom module
> so has more complete support. I'm also still exploring / learning about
> alsa userspace configuration so for now the boxes have simple HDMI audio
> support; wiring up the Headphone socket will be done at a later date.
> 
> Christian Hewitt (9):
>   arm64: dts: meson: add common SM1 ac2xx dtsi
>   dt-bindings: arm: amlogic: add X96-AIR bindings
>   arm64: dts: meson: add initial device-trees for X96-AIR
>   dt-bindings: vendor-prefixes: add cyx prefix
>   dt-bindings: arm: amlogic: add A95XF3-AIR bindings
>   arm64: dts: meson: add initial device-trees for A95XF3-AIR
>   dt-bindings: vendor-prefixes: add haochuangyi prefix
>   dt-bindings: arm: amlogic: add H96-Max bindings
>   arm64: dts: meson: add initial device-tree for H96-Max
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   5 +
>  .../dts/amlogic/meson-sm1-a95xf3-air-100.dts  | 108 +++++++
>  .../dts/amlogic/meson-sm1-a95xf3-air-1000.dts | 129 ++++++++
>  .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 300 ++++++++++++++++++
>  .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 145 +++++++++
>  .../dts/amlogic/meson-sm1-x96-air-100.dts     | 112 +++++++
>  .../dts/amlogic/meson-sm1-x96-air-1000.dts    | 133 ++++++++
>  9 files changed, 941 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-100.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-1000.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-100.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-1000.dts
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
