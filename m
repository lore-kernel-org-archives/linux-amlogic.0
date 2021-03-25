Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B84EC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:43:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF5461A1E
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF5461A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtve1QOE/SSpgf1K3u+S7eLO0EfkQDTwpTUoy4LHq3c=; b=ouZPnppzwHeDX8oa96xfUUPF8
	MIIn9uwpZ/gnVLokgJ0jEOhYp/1wdq6+6UIhGhHAjrjTMYXy+ck3+PH9bRaP7/jd/GKGzku39WcXt
	5mpBb4Tf9Sxdo/l+294R+z8hmdyMCRC9oo1U1mewNaqGqPuHuePTN739vXuRHHg6AKvt1itWH1wZ7
	+XUE5YzzTWSGSKvl0DlkzPUT7ysQ3qmXpsaymO3iE41dov9CorQlkJyVQCPJsAqa9bhIagql4IrgJ
	enxFysg1OHEcFY9sGC8g3Xl/wa66jJRt5s9UYvgqJQOWYzXwaiG5K8g7+G3MVOZrWxUWyWsTlwt/I
	o8pp+gP8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPQGL-001Y34-PE; Thu, 25 Mar 2021 13:43:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPQGF-001Y2I-Pz; Thu, 25 Mar 2021 13:42:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id v11so2324707wro.7;
 Thu, 25 Mar 2021 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r8VujCEl1M2jspW4zhAHvPpPLFXt2mPappg2/9V9Kdk=;
 b=I1Wd/Nb3x6i2s9ghMxJ2C3bRIG9M4RYMKVpSP3HSeNxNnnZc4CkIwDaSD+RrCKclC4
 ItWmB/SFnpmSOnDes8A+HUOjMHCdiPKmiK2orql4DeRXACaErSictst6XA4tRMDsDgCG
 zLKqteNOktNVQM0JaTFKFrMxzN+wMG4Pe76U7d6siwl0b2YpPcnmmvLWidGzztqzpnAB
 m4yHpg65N/0XFLx341byW9muUdNw+xmzdvZTXvVpyVTVlqNJL2MVCLHswz7FMFR/7fYr
 o5aDQa9T5sJV/VBh11PD4itKyBmBre0f7kBTLaoDMWPthlxC63UG6qiaIalisnv0GgET
 thiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8VujCEl1M2jspW4zhAHvPpPLFXt2mPappg2/9V9Kdk=;
 b=l7++9Q44iG6N6UfjsIJ9LjxHgTuqbLILrR9xX5559TUpaD90VKPp4+AXPCT5lU5K0y
 hhxCxwdKyLNH0DsCQDbI+L6BmQeCn4jA3LOgX2nJYUXphRvHPM1zvZlAIeG9sXNxHcLd
 DOIpqM+/eL4lwh0l6NGAGAZqMKOBYgQxudSzDnS/QPmqdIKifqZ0dL09897xoWyu9CpL
 Vvryk7/n7qqCPdA1M98Tip/kB3V0Eo/qP/E+KN2TXG4Kj39mPr63RIVV+Oz7A/x92Svj
 b0BqwhFoJEOoWVOYojRmjCK1SH2tyD0EUOqt3J4hT+/OuIg2F0/BddJMuNzb86AfJuFu
 GtzQ==
X-Gm-Message-State: AOAM533wWD8jujFE647hq/XCnoCIGB91l4z+tTXNOlCfdxGNX4xl+zYv
 MBmUYWUiHHEA+2pUCnMbWX8=
X-Google-Smtp-Source: ABdhPJy7eF3+00qnRsn9jcb+jRT1qpgWOl4NqrO/iftOAJ30pEX0ydIf/4rSj9pMIR853F4NdGejfw==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr9218484wrs.229.1616679774308; 
 Thu, 25 Mar 2021 06:42:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f1f:bb00:88ed:8e49:4b12:e7de?
 (p200300ea8f1fbb0088ed8e494b12e7de.dip0.t-ipconnect.de.
 [2003:ea:8f1f:bb00:88ed:8e49:4b12:e7de])
 by smtp.googlemail.com with ESMTPSA id r1sm8420757wrj.63.2021.03.25.06.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 06:42:53 -0700 (PDT)
Subject: Re: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
To: Anand Moon <linux.amoon@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <20210325124225.2760-2-linux.amoon@gmail.com> <YFyIvxOHwIs3R/IT@lunn.ch>
 <CANAwSgRHHwOtWb87aeqF=kio53xCO0_c_ZkF+9hKohWoyji6dg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <9c06a3f6-e2c4-e30a-977c-1f50a8aab328@gmail.com>
Date: Thu, 25 Mar 2021 14:42:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANAwSgRHHwOtWb87aeqF=kio53xCO0_c_ZkF+9hKohWoyji6dg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_134256_092459_C7B3E7A5 
X-CRM114-Status: GOOD (  22.13  )
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

On 25.03.2021 14:33, Anand Moon wrote:
> Hi Andrew,
> 
> On Thu, 25 Mar 2021 at 18:27, Andrew Lunn <andrew@lunn.ch> wrote:
>>
>> On Thu, Mar 25, 2021 at 12:42:20PM +0000, Anand Moon wrote:
>>> Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
>>> by the device tree to initialize the mdio phy.
>>>
>>> As per the of_mdio below 2 are valid compatible string
>>>       "ethernet-phy-ieee802.3-c22"
>>>       "ethernet-phy-ieee802.3-c45"
>>
>> Nope, this is not the full story. Yes, you can have these compatible
>> strings. But you can also use the PHY ID,
>> e.g. ethernet-phy-idAAAA.BBBB, where AAAA and BBBB are what you find in
>> registers 2 and 3 of the PHY.
>>
> 
> Oops I did not read the drivers/net/mdio/of_mdio.c completely.
> Thanks for letting me know so in the next series,
> I will try to add the below compatible string as per the description in the dts.

That's not needed, typically the PHY ID is auto-detected.
Before sending a new series, please describe in detail what
your problem is. Simply there shouldn't be a need for such a
series. As I said: e.g. Odroid-C2 worked fine for me with
a mainline kernel.

> 
>                compatible = "ethernet-phy-id001c.c916",
>                             "ethernet-phy-ieee802.3-c22";
> 
>>> Cc: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>> index 2766fe45bb98..cfc7909d3e56 100644
>>> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>> @@ -33,7 +33,7 @@ properties:
>>>          description: PHYs that implement IEEE802.3 clause 22
>>>        - const: ethernet-phy-ieee802.3-c45
>>>          description: PHYs that implement IEEE802.3 clause 45
>>> -      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
>>> +      - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"
>>
>> So here you need, in addition to, not instead of.
>>
>> Please test you change on for example imx6ul-14x14-evk.dtsi
>>
> 
> Yes I have gone through the test case.
> 
>>    Andrew
> 
> - Anand
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
