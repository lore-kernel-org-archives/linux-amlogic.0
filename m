Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A30C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqLtikao2W6jz3u5gF9g3KQ7/w0QVTzeBzw+UyWfIDA=; b=wUrZF21huAM91V
	KzO4YSQcvpoMmMSkQWGbxpUihbjCyXRU31MbuZ15avd24Ra5dkTxqTS+8ZI5UXkDYIqHCOZ3RseLU
	ZH0cyJrjMLnxGaM5IizLsR5yXp8Mvoc6qP3YGYTs6QLhug7i2R9J0R1fGtilE1VupMHbmyZ4zt5B9
	oCjF5YUdgAHCWkdZmhNxBVTt2BRJTye3i6kEqrIQ+YCnZjMLZUFIQdoI7xxNC7yDjPxQQpvGpSw83
	B8gcxmlre1cp65QLvLL0JND+BmnWXV3yXnNui259jNszD5APmQMz9p+HOahDfU2UgQX9wswFiI72Y
	Y/DjrNzxScKrld6blhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2FL-00BjXW-00;
	Tue, 12 Dec 2023 12:52:23 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2FH-00BjWD-2m
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 12:52:21 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d9d209c9bbso4469459a34.0
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Dec 2023 04:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702385531; x=1702990331; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OiQLT1KyS2c/6FByDfn019uWStgZcMlHLm0iys4Bj8I=;
        b=OlaFwYwyKTDBE9yMGcNUBAaxAcZfkhqmHFjK3vTQL9oSfucUT0zrTPUQG6EW1sJ2iC
         72GtWZuO6jWWj9jb5Xbd06MIB9g2NypvowHHJTKaq73pvdDMc4LvkTBqURSYp6ZPD9jq
         3PqtYJj737KKZdiLCLMeXlsF2GSX5QeymaiUMc+bUVkwQs/n4obdPzTm5jeZnkciTkQ0
         9zrVx/Lh7kpZD+60nsygjmGxHy4eSNZj+vom5U0TkY+gWTIeOxeq0915RntQQssnn/tb
         gaIRC+hBAJAzx3DNf5SFoxaU+Acq+iHgiIQEEWDbGHljaa2BWkDRxGrwYOgpnxWSgRoE
         1ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702385531; x=1702990331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiQLT1KyS2c/6FByDfn019uWStgZcMlHLm0iys4Bj8I=;
        b=mj7rF3KdD9m02gQB/j8G43yn3Y9D0zHt6xAcobxXvaU30Q4YnGLZAWFKpo72qyCj1Y
         MiHBI358F6ANK6UUeLXxXciBHRIMHPLpykHr/UsZK+CLN5/h3hb+6F5UI6n4llotj+WP
         ZXKzdMIks1gXGImqAf4O1gfo/jgs82PFxCT+IU6plVmDyyfy8OU+b03uMwaEZUWhlFCM
         GIk3K91CRBeBouj1qfqKq51Rg4pyG0ypbxA7thGEcYiM2fdMDPzAJ3f+ejHQ2H00Kkf6
         YByQLqKqLEUgWOt1x96JyPJC8YzBV3x0c8WfXnm6PjZJXSADTP834I8mmcKVBQLIOlBm
         C7WA==
X-Gm-Message-State: AOJu0YzE9wq6LGPSURPaua7Dq6baZhJiZQg74cH2OGDUWrMHZ204RqsR
	1ocy6gb9m2N+iJdGkzIiut5wCGrz3rY5UObr5IY=
X-Google-Smtp-Source: AGHT+IHKWrsXy01ldugdSTL8sfEzcukqIIBEOBmZkVoJSFLBDXhY2XL4cl7TiAlUdAuH1cYperFkv+OqfPifykaYFLM=
X-Received: by 2002:a05:6871:d102:b0:1fb:75a:de63 with SMTP id
 pi2-20020a056871d10200b001fb075ade63mr6447333oac.81.1702385531019; Tue, 12
 Dec 2023 04:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org>
In-Reply-To: <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 18:21:55 +0530
Message-ID: <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_045219_922489_354C9C9E 
X-CRM114-Status: GOOD (  18.35  )
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

Hi Krzysztof,

On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 12:37, Anand Moon wrote:
> >
> > Here is the list of warnings I observed with this patch
> >
> >   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> > /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > hub@1: 'vdd-supply' is a required property
>
> You always require the property, but it is not valid for some devices.
> Just require it only where it is applicable (in if:then: clause).
>
I had already done this check many times before.
my v6 original patch was doing the same and it passed all the tests
but since I updated the required field it not parsing correctly.

required:
  - compatible
  - reg
  - vdd-supply
  - reset-gpios
  - peer-hub

>
> >         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> > /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > hub@1: 'reset-gpios' is a required property
> >         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> > /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > hub@1: 'peer-hub' is a required property
>
> ...
>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - usb5e3,610
> >>> +              - usb5e3,620
> >>> +    then:
> >>> +      properties:
> >>> +        peer-hub: true
> >>> +        vdd-supply: true
> >>
> >> Drop this if:, redundant.
> >>
> > No, this does not resolve the above issue.
>
> It shouldn't resolve it, not related.
>
ok
>
> Best regards,
> Krzysztof

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
