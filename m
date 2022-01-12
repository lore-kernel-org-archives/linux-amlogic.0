Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3924DC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mHaFeHaoEiUPZMF1o+4GOmtVN0D66lux74QcNE0GN/M=; b=EnBLRqgvh6TpGNX+/Dwwatou8Z
	4Pu/q7XvFoqZ4UHAmoRLyufLmE/hPzhR+ZtrUcVq3nCnfGuUt9G6rs/EGFMcjQhrpGbptOxs+g1Jn
	5ai1PDvH4AmevcEhwsycSPxaLIj2DdJPgNpsN3Kuy/chBuBnxUgereJOnO37HIKrZdSF3VuVNK0cS
	cQmIPyymjyRR7iwcQvayMr7ct1+EPl+V8Qb+U+GbDDQtfDPP90TU/8yWNHxd33wY/HyMLRNuKTIRE
	p+68SPGAlYcoNMoxe1TZ9/YxbaHPBk85aPL3wqdTwad6ncSx9SdM4VYF0J0GXKV29zYkB9PgN9Mlb
	pPzcFrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7YrD-001ViU-JD; Wed, 12 Jan 2022 08:19:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yr9-001Vgp-FW
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:19:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l25so2638113wrb.13
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N65x+okBqwUwEt3rIQ+NIW+LytKbN9dsX1fy1vfrCfI=;
 b=SW98+bEGXg9kLnzJ/Wwc1NHVh8cpZxfiyWuV2nGuJ74fgv45ymJw6JemuQAKIArNtE
 5DG1Lvl/4pk6ePJLHplSmtJIGixksULeN7oycvXq0sRHaw/4lS/qVfJAvoc8aJzPYJrI
 bu99OyB1WGiRnjZ8R698wf4TY0nB6PSdMvu0I0WVoj9h9PvxXwNW4SXrQXAaDcFLOauK
 oksO6kEvCFpQXgxhIYdwL8HhuTJcxAZwjAnsbsKzbGn6ZPbWputKpy32zfY0Dc8P8gcT
 5Y4Kkf1SoAroY0F0bMlIoGFd5/EqnI63psov11WvPWXEj0TAeGUeO2GO9FaqWwlkQb/C
 ltAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N65x+okBqwUwEt3rIQ+NIW+LytKbN9dsX1fy1vfrCfI=;
 b=bEEO7Zdmep8dLcMZMM8LjpT4pbPXdke1Sd8BnQdB2xUJyFX3XcvesrwgodJ6WBCxDs
 /BXDxdbnZIGapm0VgZhLHheehvLzEKvh4nHUZw1/Uj4zTjW5XY37kSEdeC6HMa9QcqOy
 DGjympDABydUcY5X/wkDMhfsqOA7D6yt0wTYRboyhGdVt5YGMjZRR72mdZhN9O1gjV6l
 7boL+ZuFN3XIfyRLNhCG1PBH03pt4nZ9xLBspEl5gjh+XGoSr0odwaSFI8iaAYBm1DLV
 KR2wfQHbcLrSDR9SPcT+niNJsQutenhcgkx36RBRXqT5bCPHqoki8Zq6+X3QCxlEZx1t
 s2EA==
X-Gm-Message-State: AOAM531PiF/SvBB0I4nVXVa6LgubY+PODh8FFR9xmg0Gxh5BX0piKv2t
 o/ArTpW95QSershtSwWX0qPDCg==
X-Google-Smtp-Source: ABdhPJyuElpnJODcDGKEk++EbHO+Un+WeepU7Q/OryifjLA3PhxRGHAWWF2yBRHvGTJDk1mAUoD/sA==
X-Received: by 2002:a5d:584b:: with SMTP id i11mr6667217wrf.433.1641975576862; 
 Wed, 12 Jan 2022 00:19:36 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id i8sm14694212wry.108.2022.01.12.00.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:19:35 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
Date: Wed, 12 Jan 2022 09:19:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_001943_559884_7AB493F7 
X-CRM114-Status: GOOD (  20.42  )
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

On 12/01/2022 08:24, Jagan Teki wrote:
> Hi Neil,
> 
> On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
>> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
>> Amlogic SoCs.
>>
>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
>> Analog PHY in the proper way.
>>
>> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
>> is derived and feeds the ENCL encoder and the VIU pixel reader.
>>
>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>> DW-MIPI-DSI transceiver.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---

[..]

>> +
>> +static const struct component_ops meson_dw_mipi_dsi_ops = {
>> +       .bind   = meson_dw_mipi_dsi_bind,
>> +       .unbind = meson_dw_mipi_dsi_unbind,
>> +};
> 
> Do you thought of non-component based meson DSI like STM DSI? It
> require changes from meson drm but just to understand if you have any
> such plan.

I have no such plans for now, note this serie has been rewritten at [1] but still
with based with components.

If worth it, the plan is to get it with components and than yes if it's simpler
drop components completely.

I'll have a look at how ST does

Neil

[1] https://lore.kernel.org/r/20220107145515.613009-1-narmstrong@baylibre.com

> 
> Thanks,
> Jagan.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
