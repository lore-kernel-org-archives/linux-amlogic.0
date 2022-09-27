Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF68C6FA83
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Sep 2022 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOm00X3yJ2YXSrrpMdmoZyOTN1V9MS7342s1khzvrno=; b=WzXq8WFKHhdrR+
	61IpOkMdI0sFP+crKA2Rj6FgFvnpB9m6IFDZft8XP9ajtoW9GEDzxCi3h8pSIsyOR7QR+Z02+yTzb
	GkTL1myNF5iRv29XxQ/l66DbHs7i93pEHLVmwe8h9TtbrhdTxFwk2p6HSGtehGJXL7xuGNBt4DQYX
	mE2btTo+uzKns5t+K8zCEv1WRaYLx9Ct1KUBxncMOaDEcTtCn4gWHT1fPi+SSxmwPG5Jr4th1deyW
	G8P5f91uSAtKThWuTt4ZOCVRE9juIpG/u5sSouvl92yhHoIKxrQ5qWTJDMWM8aA48HbqD4FSUTc3+
	RztGrVqJUyBhFYeWaCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od61e-009BP9-Mi; Tue, 27 Sep 2022 08:33:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od5yj-009A4E-D5
	for linux-amlogic@lists.infradead.org; Tue, 27 Sep 2022 08:30:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t4so6027482wmj.5
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Sep 2022 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=dbuQOe3pFZvmT6+HOPkDlXjOm8BeB2xsU1eHBI9Ld4g=;
        b=xNpdmvdRiP0RtD/67ppEEA9lEnlpKlwNwlNmbN53x6nSe0K3L2VOQuO2LIqJiaEdIY
         eWBZ+38MHIXV+6QJQXnqc1m23qxXlLss4pysqhxb7LhzKJLi9BjXeT1sZPyx7tTSLhr5
         cZqjqAcSPlHeLcXfX3USZn3BqeNvzagI7B4dsAjc4aAYxuDxsUkGlFmJi+PyI7TdhuWn
         ICRKmrAOHsj4i55jA6LQ1SeaGiaFMi28h1KqF+mqmquKFYW7m4TFA/jL/amzaNqp+NEp
         F4H0DSrVPy8U2iDHEmq8+iIUEsTmS/Fl6H961VvLoD9zEWDo41s4sOg0u9RqKGqvKFBv
         JM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=dbuQOe3pFZvmT6+HOPkDlXjOm8BeB2xsU1eHBI9Ld4g=;
        b=rcBTzT+cWTsO9GBus5PfzPIlf51YOJevxLTA2tpDxYLfyEEejfugQu+OqLdJ/uJa4Y
         BrJuluj7Ub7VqQlGRGVvctQnnvCn79+fM2Dvxi4n+o3wxJZY1Ovj5X2P0HBH+zaOdsJe
         HJd/6anZ4/VToX8Y75o07v+R9sGRn7ygbOFsXeKvbh8UHdNtRZ3aYzJwOCJHh9VGusKM
         IA8Afi24LvWPIPK2duG01c1dIxMWEIcRXEzkfzEHM6XBIuAqdfE/tR36rL7xiGnxbN8e
         LiDhFuLxkqodTVMn88f2hrtU847AxjWruWVE6JDLhAHy7XoyhOL7x2mwFceaJIbx48OB
         cw8Q==
X-Gm-Message-State: ACrzQf2JP3xqR4fJ6h5dYFunFgh/vfGrWzZiZmWMucx++QQAzBjPnnLT
	lZkZohAG8O5vC3EyYClzqM/6nQ==
X-Google-Smtp-Source: AMsMyM5RGTznKVMVuAGcUTRiYQAR8un7aByG5CUNLtCf41KydJUjFyeUP4h8pc+wje1HYy6CFe/GMQ==
X-Received: by 2002:a05:600c:211a:b0:3b4:75ee:c63e with SMTP id u26-20020a05600c211a00b003b475eec63emr1786727wml.44.1664267407748;
        Tue, 27 Sep 2022 01:30:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b771:c77b:f889:9833? ([2a01:e0a:982:cbb0:b771:c77b:f889:9833])
        by smtp.gmail.com with ESMTPSA id p14-20020adfce0e000000b0022af6c93340sm1199236wrn.17.2022.09.27.01.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 01:30:06 -0700 (PDT)
Message-ID: <09081275-be9c-9d0c-856b-ed2df8fc0b13@linaro.org>
Date: Tue, 27 Sep 2022 10:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] spi: amlogic: meson-spicc: Use pinctrl to drive CLK
 line when idle
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 narmstrong@baylibre.com
References: <20220809172017.215412-1-aouledameur@baylibre.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220809172017.215412-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_013009_587899_80E4BBB4 
X-CRM114-Status: GOOD (  16.19  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Amjad,

On 09/08/2022 19:20, Amjad Ouled-Ameur wrote:
> Between SPI transactions, all SPI pins are in HiZ state. When using the SS
> signal from the SPICC controller it's not an issue because when the
> transaction resumes all pins come back to the right state at the same time
> as SS.
> 
> The problem is when we use CS as a GPIO. In fact, between the GPIO CS
> state change and SPI pins state change from idle, you can have a missing or
> spurious clock transition.
> 
> Set a bias on the clock depending on the clock polarity requested before CS
> goes active, by passing a special "idle-low" and "idle-high" pinctrl state
> and setting the right state at a start of a message.
> 
> Amjad Ouled-Ameur (2):
>    spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI
>      signal states
>    spi: meson-spicc: Use pinctrl to drive CLK line when idle
> 
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 15 +++++++
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 14 +++++++
>   drivers/spi/spi-meson-spicc.c                 | 39 ++++++++++++++++++-
>   3 files changed, 67 insertions(+), 1 deletion(-)
> 

Will you send a v2 with comments adresses ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
