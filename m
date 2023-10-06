Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E628E92FFB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wX//uoQj7BpiAom5cOBg8VqDeZNjwRkIAYIbg1+0MI=; b=sQ8Xn/z2N0KY6Q
	SNziXnS+rZpuONa36OZ6jxSXDGyqUdmE9sRVPCMMHNLSRvQEA8f8ojjvPNd6xU7rHWRhCe9wFnJHp
	dMQYsqxYROuflioBJSYpHdVWpmN22R+E7Yr9hnC7IWUKwOZ5czYHlOyDjABRXOkr/B4rwOfgfAxbI
	fHmJMor3SKGgZmFjRvH1dHYl3OwfhKRWn3pNAEvVPcHMsqSITd2G7VyUGgnv/1BbEuoc2Egmtm66k
	fSY59I+jwsfnC/PCB3u3xRO2xejITBNSfdtiXf0QTIKa24Lvn+qCqYadCG2iZSf2jigQpxyr5g1KR
	Ljn7sUQS3GEkXtSRAnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qohWp-005QXo-1O;
	Fri, 06 Oct 2023 09:53:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qohWk-005QWW-10
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 09:53:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso17237395e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 02:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696586022; x=1697190822; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=EAsXkny87ZOF57hq2rRzij47Q/y5dvWojHFo8373xlo=;
        b=JmCX87OKGIrCijaBZB1icTrbPrY7vAIwDzEuKm2TDFWb7P7MiuvNbSh7VauH3lEeKl
         u3hCm7kVuGWmb9oL5b8O3SnuphBUH/D6Fv8oY60pqpegovB694H2/qvyk5ZX1w13LKY4
         fdj1FDGJI19SWqFp9Jqqx6BgWVGo1gblFU3WSEsQCarn1sxs8wb6I/r2aJ9kGDT2Qzln
         WRHWtm99/qzeiwJp4dkfsQfYajFxBcRaI4zcKeYie5wehJJvM5LAT3H4oekIge5tS4O8
         qmtC146zYXN79ZyilpizdqqkCw1Irk6J/S9FKQwLqpbh8KiPePBnJ+JovbYwp6zRIIwp
         zAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696586022; x=1697190822;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAsXkny87ZOF57hq2rRzij47Q/y5dvWojHFo8373xlo=;
        b=xUjeHPK0UNdVLaG9HDiCflxhYFQYBTQc8YrhVRyNE5Qe/5PPGRP8CVV490C9/+UO1a
         MgZhvyKEWXZgIftbGY2DgVKLT8I/oMlsT6YHiK+zAgKKjTMCn0gBNU1INpNq8mq4Crfi
         3n1kg48tM8zm4u0ZdUu/e1GkKFRCcb3eldNv3YESWYNmiKmbre4nsLPSgU0OZa+Sia27
         /vo6/wjZbhlqkaCY7XrZSDg2cNmWhXgGPcT0WQSmK53y5635FctPGnKw0NeSIHyte7XI
         9xGBHos5Y/ZREnLpU38IMhKvxJQ27Oq8B8Jcu/HqZ+a6yvE11wt1E+wbOWlyFfloLiGq
         Fe0w==
X-Gm-Message-State: AOJu0YyeAOpDstDUaO4xGAGWYNh/Zffjvps8QPwWm5z/ZeibGnGmkRqs
	cPbGMDR7dmY9/N5bkkFJeoTFRw==
X-Google-Smtp-Source: AGHT+IHrcOMJ9DKWXLL+OqURxmxVAi/wXO6noduuqphftmmCBE8BiZD7h8nJrZjcg+IQZX0E+BghMg==
X-Received: by 2002:a05:600c:2a4e:b0:3fe:fc0f:52e2 with SMTP id x14-20020a05600c2a4e00b003fefc0f52e2mr6934953wme.37.1696586022042;
        Fri, 06 Oct 2023 02:53:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f44:72b3:5bcb:6c6b])
        by smtp.gmail.com with ESMTPSA id c5-20020a05600c0ac500b0040586360a36sm5579460wmr.17.2023.10.06.02.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:53:41 -0700 (PDT)
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
 <b81a296d-0640-4b2e-aab6-c9de37d10206@linaro.org>
 <1j5y3ozvmk.fsf@starbuckisacylon.baylibre.com>
 <3e69ae4b-5d9e-42ee-a21e-151de8fbb996@linaro.org>
 <1j8r8hxutt.fsf@starbuckisacylon.baylibre.com>
 <036a9fef-02fd-4bfd-afb5-50724f15176c@linaro.org>
 <1j4jj4xik6.fsf@starbuckisacylon.baylibre.com>
 <78c8d21f-99b1-40ed-a76f-fdf3cbb42274@linaro.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Fri, 06 Oct 2023 11:52:58 +0200
In-reply-to: <78c8d21f-99b1-40ed-a76f-fdf3cbb42274@linaro.org>
Message-ID: <1jzg0wvzyz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_025346_587036_D411ADCE 
X-CRM114-Status: GOOD (  24.27  )
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


On Fri 06 Oct 2023 at 10:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 06/10/2023 10:21, Jerome Brunet wrote:
>> On Thu 05 Oct 2023 at 12:04, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> On 05/10/2023 11:42, Jerome Brunet wrote:
>>>> On Tue 03 Oct 2023 at 09:35, Neil Armstrong <neil.armstrong@linaro.org>
>>>> wrote:
>>>>
>>>>> On 02/10/2023 20:57, Jerome Brunet wrote:
>>>>>> On Mon 02 Oct 2023 at 18:45, Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> wrote:
>>>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>>>>>> +&usb3_pcie_phy {
>>>>>>>> +	#address-cells = <1>;
>>>>>>>> +	#size-cells = <0>;
>>>>>>>> +	phy-supply = <&vcc_5v>;
>>>>>>>> +
>>>>>>>> +	hub: hub@1 {
>>>>>>>> +		compatible = "usb5e3,626";
>>>>>>>> +		reg = <1>;
>>>>>>>> +		reset-gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>>>>>>>> +	};
>>>>>>>
>>>>>>> Not sure the PHY is the right place to put the USB HUB,
>>>>>>> and it's probable the HUB is connected to both the USB2 and USB3 lines
>>>>>> It is connected to the USB3.0 only
>>>>>>
>>>>>>> so you should have both USB IDs in DT like it'd done for the Odroid-C4:
>>>>>>>
>>>>>>> / {
>>>>>>> ...
>>>>>>>             /* USB hub supports both USB 2.0 and USB 3.0 root hub */
>>>>>>>             usb-hub {
>>>>>>>                     dr_mode = "host";
>>>>>>>                     #address-cells = <1>;
>>>>>>>                     #size-cells = <0>;
>>>>>>>
>>>>>>>                     /* 2.0 hub on port 1 */
>>>>>>>                     hub_2_0: hub@1 {
>>>>>>>                             compatible = "usb2109,2817";
>>>>>>>                             reg = <1>;
>>>>>>>                             peer-hub = <&hub_3_0>;
>>>>>>>                             reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>>>>>>                             vdd-supply = <&vcc_5v>;
>>>>>>>                     };
>>>>>>>
>>>>>>>                     /* 3.1 hub on port 4 */
>>>>>>>                     hub_3_0: hub@2 {
>>>>>>>                             compatible = "usb2109,817";
>>>>>>>                             reg = <2>;
>>>>>>>                             peer-hub = <&hub_2_0>;
>>>>>>>                             reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>>>>>>                             vdd-supply = <&vcc_5v>;
>>>>>>>                     };
>>>>>>>             };
>>>>>>> ...
>>>>>>> };
>>>>>>>
>>>>>>> if it only has a single USB ID, then it should go under the dwc3 node.
>>>>>> The usb controller is connected to the PHY and what's coming out of the
>>>>>> PHY
>>>>>> goes to the hub. It seems logical to hub the hub under it.
>>>>>> Why bypass the PHY ?
>>>>>
>>>>> The USB bindings the USB devices nodes should be under the controller's node,
>>>>> not the PHY, see:
>>>>>
>>>>> Documentation/devicetree/bindings/usb/usb-hcd.yaml
>>>>> ...
>>>>> patternProperties:
>>>>>     "^.*@[0-9a-f]{1,2}$":
>>>>>       description: The hard wired USB devices
>>>>>       type: object
>>>>>       $ref: /schemas/usb/usb-device.yaml
>>>>> ...
>>>>> and the example.
>>>>>
>>>>> Subnodes aren't allowed in the PHY node.
>>>> Ok, that is what schema says.
>>>> HW wise there is possible problem though.
>>>> The phy node has the power supply to the bus.
>>>> In that case it is a controllable one.
>>>> If fixed USB devices go under the controller instead of the PHY, isn't
>>>> it possible that the kernel may attempt to probe them before the bus is
>>>> powered ? For this particular board, it would make the reset we are
>>>> trying to apply useless.
>>>
>>> The usb core has a special handling for those usb hubs doing the power
>>> up at the right time during the USB setup, including the PHY powering up.
>>> So the power sequence should be fine.
>>>
>>> This has been done on Odroid-C2 and Odroid-N2 already.
>> Tried it. Unfortunately something is off with the hub under the dwc3 node
>> I often get this error (like once in 3 boots):
>> [    0.419301] usbcore: registered new interface driver usbfs
>> [    0.424434] usbcore: registered new interface driver hub
>> [    0.429696] usbcore: registered new device driver usb
>> [    0.921460] usbcore: registered new interface driver usb-storage
>> [    0.968157] usbcore: registered new interface driver usbhid
>> [    0.972114] usbhid: USB HID core driver
>> [    1.132529] dwc3-meson-g12a ffe09000.usb: USB2 ports: 2
>> [    1.134897] dwc3-meson-g12a ffe09000.usb: USB3 ports: 1
>> [    1.144451] dwc2 ff400000.usb: supply vusb_d not found, using dummy regulator
>> [    1.147231] dwc2 ff400000.usb: supply vusb_a not found, using dummy regulator
>> [    1.154464] dwc2 ff400000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
>> [    1.219515] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>> [    1.469260] usb 1-1: new high-speed USB device number 2 using xhci-hcd
>> [    1.745395] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
>> [    9.794777] usbcore: registered new device driver onboard-usb-hub
>> [   10.255484] onboard-usb-hub 1-1: Failed to suspend device, error -32
>> [   10.261699] onboard-usb-hub 1-1: can't set config #1, error -71
>> [   10.287500] onboard-usb-hub 1-1: Failed to suspend device, error -32
>> [   10.287844] onboard-usb-hub 1-1: USB disconnect, device number 2
>> [   10.573277] usb 1-1: new high-speed USB device number 3 using xhci-hcd
>> [   10.921468] usb 2-1: reset SuperSpeed USB device number 2 using xhci-hcd
>> [   11.193453] usb 2-1: reset SuperSpeed USB device number 2 using xhci-hcd
>> While it works reliably when the onboard-usb-hub is under the phy node.
>> I added the 5v supply as vdd under the hub for good measure.
>
> The .reset_us you used from genesys_gl852g is probably too low, you may need to use a bigger one then.
>

Indeed. This seems to do the trick.
I'll change this

Thx

> Neil
>
>> 
>>>
>>> Neil
>>>
>>>>
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&usb {
>>>>>>>> +	status = "okay";
>>>>>>>> +};
>>>>>
>>>>> <snip>
>>>>
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
