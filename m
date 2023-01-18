Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C9C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V25nbk8yIuOA5OOms5I2Zxhz/iI66pkW5HMi2R2Ho2U=; b=iddNhMyHCXmFzmGEz966uzXZvR
	w7QNKwxTC2X8S4xa1MCt5uwuL1k8O9v4Mtd94eIFg4jZpi51RTA2BVYDqe6ThJxF5Nkn9PIU+BBQd
	2seP9XEGuscTF8QwLUgjTvpJ6DqqFewQYutpyI6CMISB+eQNNdHy7zZsafdR0uXWiHWAGInemaqys
	phI8jLIVkQ1tzIycXDq84MLTaxoPfLpOh5ASBd9hV8Ukp5ZFZKZOxNxYt57NLoB0fhO+39hXUvS9Q
	MiU7GkiUb/lHL7zglReP5ziF4xiUyJfrov7NLjHnFdlXWuHLQP0N1CWaPcawcEUrFjaxdC68I4T/c
	Nx269omA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8QO-0017gf-QP; Wed, 18 Jan 2023 13:24:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8QF-0017d7-8V
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 13:24:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h16so33903726wrz.12
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aGtX6Xomvv0Zvw2ChFFYcesiMxlqQe3xiNuEHsKpSTI=;
        b=aYMOE6r2RwGDo2+O3pCFAAAp4eGo7OmMUWFbRB3a77/fVjwokTqPn9kXh30jyVeMox
         Hzmcc4N81HICUURefsIZFdfr6BFiYFGIxA3ij0PboFjTieLvkrWfzSb0h0ArvWRlvTk6
         K0AagclJyek/0P62wwX5dxm1g8SDWefXV85XdUTC4ZDFBQ/ZkLdALrSJJHQEPqNGAwst
         6BQwR4Y235nywAmhdYqBK51yE3NQzkHe2Eudk3ODs2xXc6N7znk2rHPD/zTBsJN7YBVJ
         axnmE9tuSNVrjXUn0Q0euvj3Hr01NfVrIPvF/uyCo474SVyfPqZPNEzt8XLuhS0dKJP7
         p2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGtX6Xomvv0Zvw2ChFFYcesiMxlqQe3xiNuEHsKpSTI=;
        b=RI/2uyHo2qVQm3cmScYuinlW5GZo0Us7ehT4XoRY9Wh8yJVnFEHufp22Jd43ukJx2b
         HMfY25+orv0MaWkZVqEKRK2tU4MOh4abwPTqOONgJ0yS38bHVjiFmJR01gDF3ZH/U3n6
         PsFpYPx8vhsdahQcrT+7lJROcXei1BGGGgbN+TTP5d5OX8b3EkhUCuxLrEZ/n9QXvJgc
         igTyzclABCvNrdZzzVr9rg+Bo9weH9hHi6OQm5WT/RbAmXQtg+2HyalrigL/ZFYygEJs
         NS4pGylgkIFD6fLGhAYIju1wXj5DdouzTKKyykIimrS7vgQvjjWiyW6lZOF8VcbBkVki
         QA3A==
X-Gm-Message-State: AFqh2krdb+IrH2TVXe7S7CAjuDGQ7NxSTEivqz9vfv0O194CkUpTVe6d
	GdfkTbX+4tA4/eJWR3NWn6lW/Q==
X-Google-Smtp-Source: AMrXdXsdPNHbsnLa957TyAPdquE49R/mFl4FzMmguPl+EyrKQ+vdLmzBBsVjlm87ZzA5gtRrAd6iEA==
X-Received: by 2002:a5d:6952:0:b0:242:1415:ab02 with SMTP id r18-20020a5d6952000000b002421415ab02mr5805169wrw.9.1674048245943;
        Wed, 18 Jan 2023 05:24:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4? ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
        by smtp.gmail.com with ESMTPSA id b16-20020adff910000000b002bdf8dd6a8bsm9289920wrr.80.2023.01.18.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:24:05 -0800 (PST)
Message-ID: <0dbefaec-e1de-fc3f-54f2-c5fe75a28c7c@linaro.org>
Date: Wed, 18 Jan 2023 14:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c4
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-8-linux.amoon@gmail.com>
 <b112ee8e-93ab-2c30-ced3-82ff858884b4@linaro.org>
 <CANAwSgQ1b8vj+HCBS0ARnNqOwKHU8VzzsB7htL3L4Sr_v6Y=VQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgQ1b8vj+HCBS0ARnNqOwKHU8VzzsB7htL3L4Sr_v6Y=VQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_052411_308995_9CD17FFB 
X-CRM114-Status: GOOD (  24.21  )
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

On 18/01/2023 12:55, Anand Moon wrote:
> Hi Neil,
> 
> Thanks for your review comments.
> 
> On Wed, 18 Jan 2023 at 13:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 18/01/2023 05:44, Anand Moon wrote:
>>> On Odroid c4 previously use gpio-hog to reset the usb hub,
>>> switch to used on-board usb hub reset to enable the usb hub
>>> and enable power to hub.
>>>
>>> USB hub is combination of USB 2.0 and USB 3.0 root hub so
>>> use peer-hub node to link then.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> v2: - fix the compatible string.
>>>       - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
>>> ---
>>>    .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++++++++-------
>>>    1 file changed, 23 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
>>> index 8c30ce63686e..d04768a66bfe 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
>>> @@ -26,20 +26,30 @@ led-blue {
>>>        sound {
>>>                model = "ODROID-C4";
>>>        };
>>> -};
>>>
>>> -&gpio {
>>> -     /*
>>> -      * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
>>> -      * to be turned high in order to be detected by the USB Controller
>>> -      * This signal should be handled by a USB specific power sequence
>>> -      * in order to reset the Hub when USB bus is powered down.
>>> -      */
>>> -     hog-0 {
>>> -             gpio-hog;
>>> -             gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
>>> -             output-high;
>>> -             line-name = "usb-hub-reset";
>>> +     /* USB hub supports both USB 2.0 and USB 3.0 root hub */
>>> +     usb-hub {
>>> +             dr_mode = "host";
>>
>> Is this really needed ?
>>
> I got carried forward from the other device tree binding,
> If not needed I will drop this.
> 
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +
>>> +             /* 2.0 hub on port 1 */
>>> +             hub_2_0: hub@1 {
>>> +                     compatible = "usb2109,2817";
>>> +                     reg = <1>;
>>> +                     peer-hub = <&hub_3_0>;
>>> +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>> +                     vdd-supply = <&vcc_5v>;
>>> +             };
>>> +
>>> +             /* 3.1 hub on port 4 */
>>> +             hub_3_0: hub@2 {
>>> +                     compatible = "usb2109,817";
>>> +                     reg = <2>;
>>> +                     peer-hub = <&hub_2_0>;
>>> +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>> +                     vdd-supply = <&vcc_5v>;
>>> +             };
>>
>> The final discussion in v1 was to drop this /usb-hub node and move the
>> hub_2_0 & hub_3_0 node under the dwc3 node.
>>
> 
> Yes, but It did not work back then, since these are two different events
> USB node will try to bring the PHY and dwc2 and dwc2 nodes up.
> USB hub supports the reset of the USB hub and links the power supply
> to the ports.
> This works on this board.

Forget the dwc2 node, the dwc2 since GXL is device mode only, so you need to put both
nodes in the dwc3 node which is host-only.

Neil

> 
>> Neil
>>
> Thanks
> 
> -Anand


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
