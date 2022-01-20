Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01072C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0e8c5ItxfWb3rDKCyKnpo+6hYO3pW0Y0CBQ69I7GctE=; b=O/zx0AzhcnTcISkj1Os2f1Ql5P
	LC5ewKaRnlKyBglL65NGt+7oTV3BzhVNHriiyvug68XSn/3dC5MXe1nu4aiurT4A2n01KWPclN1kc
	fO6jl4dnVIsPAWOyYqVgWdyJEeDlDZAm+ozgjk1YfbgM0YuWt2Fdj9uPBXznsmhP4BNaJLqx3llPr
	FASn9fmbYkUGtatYI+7uOyNmLMH78VuEjs9oNhApb+x7Eb1a/cyI4TNQGDJSM0bhpOzUMrOkTeVST
	eujeYnh88aQRnXKNaqEA0vIikmrmkv2aAWA3zKXtP9/zJyeYdTrbqvQvXLLTgmt9+jrs1HxxPRrbT
	Td0P658A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXU9-00BfI9-PG; Thu, 20 Jan 2022 13:28:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXU6-00BfEq-7B
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 13:28:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso21980450wmj.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o79zmIgM+0ygHLPIofxNguMisbIrS5RcmJsJrzjmaPQ=;
 b=Xj7UKsSlDlKrCE2AIAP0jK14mFJPZQ6XVUdmOf0NO2O+eQn8fA69i3yrf2cTGf73nT
 tcLTUQsVkA2upYrCJYN+XWCsLabv4GNy5J0PT7+IiAjbbYwWmUm+O6psOlFWwIIy7u9N
 D1FsHzOf9kVonNk56g+QCtmB3s1imUSTq2blX8TOMy04a0PEmGLL8861MtDtzATA91nF
 3rQg4Nw0c+ZVi6FLmo/NXBeb88AWhERtowV4m56WbiRvMPbexwawbmBEx/31AEHaUejD
 /4BUJ5wGtl8IbmWtscWIxFrfU9hdpOmMdogn8UBHmUSdi0ctF0bJMq0pjPOrk1bqTP8V
 ffUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o79zmIgM+0ygHLPIofxNguMisbIrS5RcmJsJrzjmaPQ=;
 b=QhH5SQ82Vw+sOnrJWSqGrd+ItmjHqzmHTOEJRRceME6AZNm3G3DZGkcbjv8y375JeX
 hoZxOAyNBL012vS6Cv/wSHGdVBA/6ZErGQngqxlrsQ0J69dJafR6JEFPHyg2ETmFgii5
 0n+8NLaZNz/DPcpBWCXXGlqjsf7RgC7aZXi2S4IALF6JIKP9g3CEhSSZLCxw6SYpcmFM
 glE4lOG34yAUELcOjJE14i+IkPZ+uDySPWJaEbdMVG855osf172yllezSgjHywSBuVEJ
 7jAVYavbR9qSSzuN8s2XcGcM3yryyAU1EPJC2RvrzBOQpVj786KfXjr4/+MBq+B9Lk1+
 IO4Q==
X-Gm-Message-State: AOAM531tpWvmDmS3hhTsq7y45GTodI2L6mQ0kCKtUrv2zHgkJpHZEz8M
 GnMg5PjT+QMGPV30hRgklMv+5g==
X-Google-Smtp-Source: ABdhPJwr0AR9fJdYR/gs6Ax3XVyox+sS0VTouqDzQdsMfO6OQs1paqSXdhIUYrUei1KpgkaOylRuRg==
X-Received: by 2002:a05:600c:1c99:: with SMTP id
 k25mr8710099wms.159.1642685292800; 
 Thu, 20 Jan 2022 05:28:12 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id i8sm4537859wry.45.2022.01.20.05.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:28:12 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
 <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
 <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e1fa9887-da2e-3a69-0e2e-3a6d07e13cb5@baylibre.com>
Date: Thu, 20 Jan 2022 14:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_052814_321763_338FC578 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Jagan,

On 20/01/2022 12:03, Jagan Teki wrote:
> On Wed, Jan 12, 2022 at 1:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi,
>>
>> On 12/01/2022 08:24, Jagan Teki wrote:
>>> Hi Neil,
>>>
>>> On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
>>>> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
>>>> Amlogic SoCs.
>>>>
>>>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>>>> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
>>>> Analog PHY in the proper way.
>>>>
>>>> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
>>>> is derived and feeds the ENCL encoder and the VIU pixel reader.
>>>>
>>>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>>>> DW-MIPI-DSI transceiver.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>
>> [..]
>>
>>>> +
>>>> +static const struct component_ops meson_dw_mipi_dsi_ops = {
>>>> +       .bind   = meson_dw_mipi_dsi_bind,
>>>> +       .unbind = meson_dw_mipi_dsi_unbind,
>>>> +};
>>>
>>> Do you thought of non-component based meson DSI like STM DSI? It
>>> require changes from meson drm but just to understand if you have any
>>> such plan.
>>
>> I have no such plans for now, note this serie has been rewritten at [1] but still
>> with based with components.
>>
>> If worth it, the plan is to get it with components and than yes if it's simpler
>> drop components completely.
> 
> Dropping components make the pipeline well suited for bridges as we
> are moving bridge-driven pipelines in other areas.
> 
>>
>> I'll have a look at how ST does
> 
> ST has no components. As I said above, eventually there would be
> common bridge driver for dw-mipi-dsi if meson and rockchip moving away
> from components.

ST driver is much more simpler.

And having a common dw-mipi-dsi is unreal since each HW has a different glue HW
me must handle. Even if we moved all the glue handling under drm/bridge/synopsys,
we would need a different set of callbacks for each HW for each compatible
which is basically the actual situation except components.

Neil

> 
> Thanks,
> Jagan.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
