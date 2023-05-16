Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98ABC77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tks1Hxh+BOJt0Kel77R20ujZvhTUwvNQ+pQDbwCeSo=; b=fyhavPb2FmIha7CxoJwHfLNwz3
	BpR2m+zKItiEWzd/zaNj0NT0M29zbiazmv9XNdrIFIRHQtoTkeVO7lakkgKQdcSlUJIfnRbWP/LhS
	dxDr+PS5kbmqeGZmrUGnwoA7ocqVazgNnOl5Wx6NThqbeFChpBuH8TKO6b3XKvSZP80bbggPuIaie
	mkLvvzWVFwfFAZ+blhgM0gB/N6FY5AcYs6ii2mECskiIXiihM65GXY/QiXD85wV6lMQSDylwK4zpL
	Gj2yEu+IgfPt68tQydwu6VjNdgnfUF5lLKQXK2R+01UyI+vsEPyDNgmqJUF8P8lJ68KQTrK7htI/V
	qtLfWvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqXZ-004xpG-0w;
	Tue, 16 May 2023 09:00:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqXX-004xmc-06
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 09:00:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30771c68a9eso13029941f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684227612; x=1686819612;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wrFkte/bezt1PlNhFCGqqPcTWG4E53z6ADYV3K7fF3g=;
        b=sjp+lL/oyBSGysWhOvH+HyKbaqlOkgM4gPDAx6wEodMzeHJ7CIwWV/D6Czgf7g5b4y
         3pq0iP4PbZbdtl8nXHy5xEuKwlzOhXlby6wZroKbsZnYXMmr6DQMnSKyM9IHVwYeLosI
         jzIxHuQExAJ6cdYicbzRPbpf7WMkkR2x9chwjgwmPU2lkF8Fu83tw5V6qQrDhhyB8kHF
         IoWtbsPD1K3bFtjyChL9/r2atKzi9e9kn9FPjoT1lWrWrBBDbxYKieGQWaiyYI2fqkVv
         om0/lULQwVmA5ddQZOJTYP0du+5eivl6xsSLSUcY8vxUUwHlPYdzqj3Py8lnvOcrE9jL
         v2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684227612; x=1686819612;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrFkte/bezt1PlNhFCGqqPcTWG4E53z6ADYV3K7fF3g=;
        b=MO1ca4wxB40HCnlgq30T+otU5OEVUS5hjHZNi9loJWnCFD2Ve1APZVvxvLpp7IStNX
         //lxdMvRX7RkraxwYUwwtYj2puaw3hbGJcPCeo4/bkY+rKQX+WnMNFsChyBQUWIghVQ7
         mHqfiXmzKdLENyqk+kU4Pf+PJmEFouXjE3RhsvjNDwJ67MzPE9ORJ7ghsWL4tczqqskf
         Z0HoLq+PF0uc0m6cFpHW1ieC6jWlQvU4+/jkDWEFbtbGSTB2MqHZg5GqJ2BLND03LM8u
         PBGVIGtI2134leXm2495Q9n1nTaT+g2qORiLN6ozc8OHqhfGvBp38CZNXga/fbAbSSua
         hzDw==
X-Gm-Message-State: AC+VfDxnuCk7ImftE2hmH6TuFRvOp2zJUei4Hii9I00gM2axofHvQiEN
	KG8lifSxKS8Ey1NWDYnlaiZ4fw==
X-Google-Smtp-Source: ACHHUZ5bSlYDSBtrIk3ZZo2GUz0L3bCKdlDXlaw/wT8THT4atVNx1A2nmPcmuGErziRjmwMbrF+ZaQ==
X-Received: by 2002:a5d:42ca:0:b0:306:3b78:fe31 with SMTP id t10-20020a5d42ca000000b003063b78fe31mr23654611wrr.69.1684227611789;
        Tue, 16 May 2023 02:00:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8? ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
        by smtp.gmail.com with ESMTPSA id s14-20020a1cf20e000000b003f4285629casm1532562wmc.42.2023.05.16.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:00:11 -0700 (PDT)
Message-ID: <aa22c05d-9db7-eff1-d203-cb795359252b@linaro.org>
Date: Tue, 16 May 2023 11:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
 <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
 <2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_020015_072486_F551D2AF 
X-CRM114-Status: GOOD (  21.65  )
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

On 16/05/2023 10:44, Arnd Bergmann wrote:
> On Mon, May 15, 2023, at 18:22, neil.armstrong@linaro.org wrote:
>> On 15/05/2023 18:15, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 18:13, Krzysztof Kozlowski wrote:
>>>
>>> Also one more argument maybe not relevant here but for other cases -
>>> this makes literally impossible to include the clock ID in DTS in the
>>> same kernel revision, because you must not merge driver branch to DTS
>>> branch. SoC folks were complaining about this many times.
>>
>> Actually we handle this very simply by having such patches merged in a immutable
>> branch merged in the clock and DT pull-requests, it worked perfectly so far
>> and neither Stephen or Arnd complained about that.
> 
> It's usually benign if you just add a new clk at the end of the binding
> header, as that doesn't touch the internal header file in the same
> commit. I'm certainly happier about drivers that just use numbers from
> a datasheet instead of having to come up with numbers to stick in a binding
> because the hardware is entirely irregular, but there is usually no point
> trying to complain about bad hardware to the driver authors -- I unsterstand
> you are just trying to make things work.
> 
> I agree with Krzysztof that using the same identifiers in the local
> header and in the binding is just making your life harder for no
> reason, and if you are the only ones doing it this way, it would
> help to change it. Maybe just add a namespace prefix to all the internal
> macros so the next time you move one into the documented bindings you
> can do it with the same immutable branch hack but not include the
> driver changes in the dt branch.

Ack, I'll try to find a simple intermediate solution to avoid this situation.

Thanks,
Neil

> 
>      Arnd


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
