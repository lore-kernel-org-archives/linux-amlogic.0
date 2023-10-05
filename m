Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA06E8FDC3
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Oct 2023 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dslPH1uo9ict88mRj0F55P7t1tPBPnzxnTWPjwwE+c=; b=JGOUhbs04Sko9c
	NYVOXQ/gW8cmTclb6PiEdid0GqXbYg7Ayb1mSD+Vl8MKZWVwOR7rMmI5ut9G1DW9rVrEUNCKvePpZ
	K1/pLD0WYHOPxdIxmQ1eOqiUgFX4FUrqtvfFPgap/PZFviSQCv4GwMdW3t5zsmS4WRc0ZrV9WW28X
	hYG9QwZe2u8fvy0W4O46dssuqwvseYBlGqCKrl7X+KIMFhIpHiiZEzbcAQd0FBSbKmgG2lzm08X3s
	5JLFtvUFhq3x+6jU1MG3vKmAUtGhz7HpTg25m9qxG3NlQaEM7/kW9M/OQq0J+Mftv6CZWHZJTpO91
	N4VRbO5m6EDvcWdyRl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKzI-001nL7-0G;
	Thu, 05 Oct 2023 09:49:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKzE-001nJa-0z
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Oct 2023 09:49:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3248ac76acbso709849f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Oct 2023 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696499376; x=1697104176; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=pYqPT1GJs9o/oEYc7vUihYo+IdyN6oSJaJhVpn+wyNQ=;
        b=dIpWV+d1qQKml6pUdnNLPABXpec/RdGUQ5S20GjdZ8g/X/zL1LQGwIg8lupT5uYAiN
         KDyGErDIv3+aihNnFvDM+2G9i5rEO6t6PvyIFiuio28JBDsXcg86NRj7P3I5Zm4iauty
         13UgUNb4kgHE7l5Q0fzY2Km0APvkKw6X8SD82wxywKEWCNR4KoM9cY6aZsd/xYHGT7ZW
         AGfBWh/kwOg/5804s2cHusCzF5iKyA38orZSHgydXtxBmM6a1+l7dRLNlbLR44QjeIA2
         IRBpzpX0d7VUWJMridbZlFIQJhDqBGZes9NYnwbGbzuZkY+GsY1MTc4dvQ53uBlDTNaw
         PxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696499376; x=1697104176;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYqPT1GJs9o/oEYc7vUihYo+IdyN6oSJaJhVpn+wyNQ=;
        b=dY/ySgOpO5V38Ugiu1Pt1sc5iNW1+aAeFzqW22SdPLtxje2FT3SOGvoiz3+bFjBQlx
         5lIlkP96kdJ9MDSQSyhHn9tXILsczycUE65M52ZVQCcaF01nnmFBc1KkdWnoTCWXGaa9
         Yqw0nEq3KUtCeKils/ZKi2GhdYEl/Rop0mXuIvt1jbQ7Ra/t59YtyodxI2Fnw8CfOA9J
         E/b4MzVaqpN98kIK1zb+b02Jugqe1whQVBGNB1lPpe/IJMZDVZJaCMsST2yRJzRemZb1
         pSPs9FaWXs13ZJAvjQK1wJ56bkl0NP2l3QrMkgb1J9get4vNOqy6B8/j5JLcgIrjWdGv
         HPHA==
X-Gm-Message-State: AOJu0YxThssPQ49Q+Q5eC0PNn91KIksSvJabO0fG/1J53Dx4tv5I8uxc
	lHhEj0K9QE2kZUegn6yIKYvUfg==
X-Google-Smtp-Source: AGHT+IG+H1AplyMOolKejY8sam55E+wpqzlnjo2WR74yXXIdT24YPEVy1N8wGCWjRBfU+sFQnUNXAg==
X-Received: by 2002:a05:6000:1b0c:b0:320:6db:3548 with SMTP id f12-20020a0560001b0c00b0032006db3548mr4052410wrz.55.1696499376045;
        Thu, 05 Oct 2023 02:49:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a7d6:58b1:d86b:6d1e])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b003247d3e5d99sm1376415wrx.55.2023.10.05.02.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 02:49:35 -0700 (PDT)
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
 <b81a296d-0640-4b2e-aab6-c9de37d10206@linaro.org>
 <1j5y3ozvmk.fsf@starbuckisacylon.baylibre.com>
 <3e69ae4b-5d9e-42ee-a21e-151de8fbb996@linaro.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Thu, 05 Oct 2023 11:42:57 +0200
In-reply-to: <3e69ae4b-5d9e-42ee-a21e-151de8fbb996@linaro.org>
Message-ID: <1j8r8hxutt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_024940_363560_F49CC22E 
X-CRM114-Status: GOOD (  20.32  )
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


On Tue 03 Oct 2023 at 09:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 02/10/2023 20:57, Jerome Brunet wrote:
>> On Mon 02 Oct 2023 at 18:45, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>
> <snip>
>
>>>> +&usb3_pcie_phy {
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +	phy-supply = <&vcc_5v>;
>>>> +
>>>> +	hub: hub@1 {
>>>> +		compatible = "usb5e3,626";
>>>> +		reg = <1>;
>>>> +		reset-gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>>>> +	};
>>>
>>> Not sure the PHY is the right place to put the USB HUB,
>>> and it's probable the HUB is connected to both the USB2 and USB3 lines
>> It is connected to the USB3.0 only
>> 
>>> so you should have both USB IDs in DT like it'd done for the Odroid-C4:
>>>
>>> / {
>>> ...
>>>           /* USB hub supports both USB 2.0 and USB 3.0 root hub */
>>>           usb-hub {
>>>                   dr_mode = "host";
>>>                   #address-cells = <1>;
>>>                   #size-cells = <0>;
>>>
>>>                   /* 2.0 hub on port 1 */
>>>                   hub_2_0: hub@1 {
>>>                           compatible = "usb2109,2817";
>>>                           reg = <1>;
>>>                           peer-hub = <&hub_3_0>;
>>>                           reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>>                           vdd-supply = <&vcc_5v>;
>>>                   };
>>>
>>>                   /* 3.1 hub on port 4 */
>>>                   hub_3_0: hub@2 {
>>>                           compatible = "usb2109,817";
>>>                           reg = <2>;
>>>                           peer-hub = <&hub_2_0>;
>>>                           reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>>                           vdd-supply = <&vcc_5v>;
>>>                   };
>>>           };
>>> ...
>>> };
>>>
>>> if it only has a single USB ID, then it should go under the dwc3 node.
>> The usb controller is connected to the PHY and what's coming out of the
>> PHY
>> goes to the hub. It seems logical to hub the hub under it.
>> Why bypass the PHY ?
>
> The USB bindings the USB devices nodes should be under the controller's node,
> not the PHY, see:
>
> Documentation/devicetree/bindings/usb/usb-hcd.yaml
> ...
> patternProperties:
>   "^.*@[0-9a-f]{1,2}$":
>     description: The hard wired USB devices
>     type: object
>     $ref: /schemas/usb/usb-device.yaml
> ...
> and the example.
>
> Subnodes aren't allowed in the PHY node.

Ok, that is what schema says.
HW wise there is possible problem though.

The phy node has the power supply to the bus.
In that case it is a controllable one.

If fixed USB devices go under the controller instead of the PHY, isn't
it possible that the kernel may attempt to probe them before the bus is
powered ? For this particular board, it would make the reset we are
trying to apply useless.

>
> Neil
>
>> 
>>>
>>>> +};
>>>> +
>>>> +&usb {
>>>> +	status = "okay";
>>>> +};
>
> <snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
