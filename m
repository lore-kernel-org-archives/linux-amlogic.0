Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EFAC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:19:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6412561A11
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6412561A11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nlWyTtHxRJjfGUlj5CWZ8ICjPcPkv7PCyIcHC7O1eUA=; b=K8kKAYPNlSVQ+T0qD8eeIUlKQ
	gcg3M0xguTfMR4KOMT5KKdH5KgmwsqBY+Sr49NgYR0smcODqnuFArL7bSdtT8wwlfLfY5jHfJ4Zwx
	zsvlNbhfLbGgp0gTfX1AgyFE9gZHBxcieWP3lBsK6ZMWPqjoNdWGDvYNg6wd0P29uIbS6RFHetmNu
	tvNzemyzA7wU1OoSsHYpeggmy+g9wghLd48oq3lmIAJtTMe6zfQESQdEdmbL9KSEfVbfXTqdr6Rv3
	3kabXvtQHwRmv3HpgCD41rhLYvH6MuL9DMzkgzV4i/5PsZehqOqxl3liUzeRhuDfAj7uU/jPWSJa2
	C+tHH4iOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPti-001W3K-FT; Thu, 25 Mar 2021 13:19:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPtc-001W2k-89; Thu, 25 Mar 2021 13:19:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c8so2233448wrq.11;
 Thu, 25 Mar 2021 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yM+7txaY3YaPXxI4ZrWQxkRlDAfwRXr5c8eBWKInYrQ=;
 b=Y/6H+C9Ccxwfb26nyliwjTZ6wUHcKjA6cY1a3ELSQhduNGnkbMLX/s4ClGf9azMDvM
 6w6eVC2vqUKf4I3eQ6rzw9UWM2mi+t4bjUcyLA19m/UJNNXsumxyi8hNGJBzs43yybMd
 Fdcmu6BgPrv0gxs7sEeUGbTYibJnISr0doSjtzLX+0Z1BsXwuWZPP2epdzG/herOodI+
 D5lotveJ9EBPGljf/Hujdzg1m8S9pEEZYKmJSwNWKySB8WiDR+gD+2Obk9J6aXZUHipA
 ePBprKPtmEooD/mf4l8Rjh4kerm70pFEfQGRxkeZO1PuSAEo+SHxEUKYv/n1ZZ/HqWme
 VpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yM+7txaY3YaPXxI4ZrWQxkRlDAfwRXr5c8eBWKInYrQ=;
 b=JbpyKv5Vg5FiHzC3BRE7r/3c+6A3ck0ibQw6bz3FQ7oT6pvYDnCgq/wdShs9C1xK5/
 QspANXyZYIkVhOSGhigKpFxyQaY4nNPCN0be9bR+kPQA/nqXZpa+9EN/Lje/Dk6zwn5r
 vGaGcFtRrU+LGGRJIrXjnME0ntJcoGV+2QoS1UmHCZfbY9A7zbReSdZMDQr46ZiG+ObJ
 i6LsSvSslA9A0Tccj3plQaKwhsxlA7G+CdTeHEWkY3ZxNiaLEGc4X0vhZpnLaHlolND2
 saCemlJxMN/xgpUd7oBuHF+95laIcLyQ66kj7M4A79O6JMbbK/jWyWzijskbyWDROMSb
 r5KA==
X-Gm-Message-State: AOAM531zPndWFCZrtqWIu2IZX0U3D2ZvttQU9X/QAxYTEox/h+x8r6lG
 ldENFeDnii7nJXPjzY2WWiJ1OMsGh/C0Ig==
X-Google-Smtp-Source: ABdhPJxgNiEwF1vncF6OavhaphzdsDVLGyJbTMXInPwidHzU7AfICxxIUG2+OLej1IihRS+1fGzRUQ==
X-Received: by 2002:adf:f743:: with SMTP id z3mr9037377wrp.304.1616678370546; 
 Thu, 25 Mar 2021 06:19:30 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f1f:bb00:ec1d:f023:8a26:fc6b?
 (p200300ea8f1fbb00ec1df0238a26fc6b.dip0.t-ipconnect.de.
 [2003:ea:8f1f:bb00:ec1d:f023:8a26:fc6b])
 by smtp.googlemail.com with ESMTPSA id q19sm6298427wmc.44.2021.03.25.06.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 06:19:30 -0700 (PDT)
To: Anand Moon <linux.amoon@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20210325124225.2760-1-linux.amoon@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCHv1 0/6] Amlogic Soc - Add missing ethernet mdio compatible
 string
Message-ID: <4ce8997b-9f20-2c77-2d75-93e038eec6d8@gmail.com>
Date: Thu, 25 Mar 2021 14:19:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_131932_413226_6BA11304 
X-CRM114-Status: GOOD (  22.54  )
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

On 25.03.2021 13:42, Anand Moon wrote:
> On most of the Amlogic SoC I observed that Ethernet would not get
> initialize when try to deploy the mainline kernel, earlier I tried to
> fix this issue with by setting ethernet reset but it did not resolve
> the issue see below.
> 	resets = <&reset RESET_ETHERNET>;
> 	reset-names = "stmmaceth";
> 
> After checking what was the missing with Rockchip SoC dts
> I tried to add this missing compatible string and then it
> started to working on my setup.
> 
> Also I tried to fix the device tree binding to validate the changes.
> 
> Tested this on my Odroid-N2 and Odroid-C2 (64 bit) setup.
> I do not have ready Odroid C1 (32 bit) setup so please somebody test.
> 

When working on the Odroid-C2 I did not have such a problem.
And if you look at of_mdiobus_child_is_phy() and
of_mdiobus_register_phy() you'll see that your change shouldn't be
needed.

Could you please elaborate on:
- What is the exact problem you're facing? Best add a dmesg log.
- Which kernel version are you using?


> Best Regards
> -Anand
> 
> Anand Moon (6):
>   dt-bindings: net: ethernet-phy: Fix the parsing of ethernet-phy
>     compatible string
>   arm: dts: meson: Add missing ethernet phy mdio compatible string
>   arm64: dts: meson-gxbb: Add missing ethernet phy mimo compatible
>     string
>   arm64: dts: meson-gxl: Add missing ethernet phy mdio compatible string
>   arm64: dts: meson-g12: Add missing ethernet phy mdio compatible string
>   arm64: dts: meson-glx: Fix the ethernet phy mdio compatible string
> 
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
>  arch/arm/boot/dts/meson8b-ec100.dts                     | 1 +
>  arch/arm/boot/dts/meson8b-mxq.dts                       | 1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts                  | 1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts               | 1 +
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts          | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts      | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi   | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi        | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts      | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts    | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts     | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts         | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi    | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi       | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts    | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi              | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts   | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts     | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts          | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts      | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts      | 1 +
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi      | 1 +
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi       | 1 +
>  26 files changed, 29 insertions(+), 5 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
