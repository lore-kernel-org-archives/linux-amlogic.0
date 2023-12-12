Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452E1C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvJLTHm3Ngx8pzj6PR6ZPS8JQQi4GBMmz9cJEqVL2cg=; b=sbWYD7MiNZU4pH
	xy76OddbpJDJ5cxL5aAoYEiZiCWlnYnDusQB9NVipJu4YIeragUskQPcUz4A7TKAXtrrDRd3c9gQc
	0cL8nAPKHusM0WdVuffhsxnC8a2ClnRlX4Ynud8CILDVmusKaOASXOp46ZTTL/PDFTx/bh24mtFX5
	EHv+wstB0VxjPha1AZU/wJSrgzfcbJkElhImVb/C8ERErMOUdVCEkqlxlvvZ2pSLEdyyC3KnJSztY
	yzy2inPb63c6461t/6RcS70d80qVukYlhP6D8sZYMf9+69JD5EpA21LzMG94ARHG1l9zxWuUlTpss
	lbvRfV2jMJAQ1rueXCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD15b-00BYVL-2h;
	Tue, 12 Dec 2023 11:38:15 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD15Y-00BYUU-0n
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 11:38:14 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b9e6262fccso3390047b6e.3
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Dec 2023 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702381090; x=1702985890; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+L2kxEHCu62/EVSOcD5zqPnIMCZrQemKF2WuvkQ2BF4=;
        b=XzGLYYOElCOGtx0775ODvMSn7XA64GL9I7QTokaP9hUHM74PsA3uOuqGz57jnI9Doe
         7u60KTWj5Qb05ytaE+Ul6UcRGjGYrbywcOQBh1WiYOforzSNFJrt8iZ0DYWfL83r+NAk
         OeDUP1ramLkXSIlLwFsQHPf+KjycXFWMpdmjqzJH8wkvkNNEoT4nJ6NkoKkRrqIibneP
         SFUEYQn6wuREcQAvGPPeXQU18/LsHoyhVJipxWja67eFVyMZOJ019Ngx78+YqHvSBOSh
         XpYFGxMT1UwDUkmJFNq57Gd65U/Q8jz9H2d3sdy6/awqyoaF9V7F9Q7NbfQm/oggqN+6
         12Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381090; x=1702985890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L2kxEHCu62/EVSOcD5zqPnIMCZrQemKF2WuvkQ2BF4=;
        b=HnzplrC6IqmyrXdkJz5hThjdxmp++M+L4Meb6T+lGJUfU6MymJIROy2Bz1eOWqX5vC
         D+ePFGXarP5mmC/7KxLR4uIBFfpnsH6ayha3ZgB629Fl5pjUtIzQtVwiTeZ+L/hWxxa8
         9fyauZI673xQNiM6kYx2kjMIzToVZ5QmNCMsZNy2dTVhiNyy97KKSuMEJxR3cGDqBYu3
         B08yR2WL3/fXLO/Gh/o94HZzrZFIXkz7LdPqiJ9CavEbUx1j+kNxC2VFRAo1T//cB9lb
         Q9GUGqAjgLsVOF4tQB6nk2dPqrVMA5gjbGoBkGIm1p5I+OmDU4ogfUfTPw48zurv88Tn
         jNlA==
X-Gm-Message-State: AOJu0YzYf3iM9zrqO9lFkwwJY892u7d3YWfNpOzuIPvepGPgd6TeRCm8
	W4Xhy8Db59KOcLvc1biKRhPzE83RuCtkE3Ofv75ISUKUFkrYOw==
X-Google-Smtp-Source: AGHT+IF+mLItRlwncGPLaOBSbWrzSF4zO2CcLPzv42Do4B8u1Slt2WF4wMUjE3qjHmiGNMT7cW9QlrmRlFHAq5rq+7I=
X-Received: by 2002:a05:6870:aa97:b0:1fb:75b:99a0 with SMTP id
 gr23-20020a056870aa9700b001fb075b99a0mr7675745oab.79.1702381089856; Tue, 12
 Dec 2023 03:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org>
In-Reply-To: <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 17:07:54 +0530
Message-ID: <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231212_033812_284335_D9468D85 
X-CRM114-Status: GOOD (  31.23  )
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

On Tue, 12 Dec 2023 at 14:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 07:22, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Fri, 8 Dec 2023 at 17:47, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/12/2023 12:19, Anand Moon wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Fri, 8 Dec 2023 at 13:14, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 08/12/2023 01:24, Anand Moon wrote:
> >>>>>>>>>
> >>>>>>>>> If I move reset-gpios to required, I observe the below warning.
> >>>>>>>>>
> >>>>>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>>>>>>>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>>>>>>>> hub@1: 'reset-gpio' is a required property
> >>>>>>>>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>>>>>>>
> >>>>>>>> Where are the properties defined? If you open the binding you see:
> >>>>>>>> nowhere. You cannot define properties in some variant with "true".
> >>>>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>>>> applicable.
> >>>>>>>>
> >>>>>>> What I meant is the example below, required meant applicable for both
> >>>>>>> the binding
> >>>>>>> But it shows me the above warning.
> >>>>>>
> >>>>>> My explanation stands... So again:
> >>>>>>
> >>>>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>>>> applicable.
> >>>>>>
> >>>>> Apologies, But I have tried this multiple times but have not been able
> >>>>> to fix the device tree warning
> >>>>
> >>>> Did you document all properties in top-level "properties:" block?
> >>>>
> >>> Yes, I have,
> >>>
> >>> Can you suggest a couple of examples to follow?
> >>> I looked at some of the YAML files but could not fix my issue.
> >>
> >> 99% of bindings. Look also at example-schema.
> >>
> >> You can also attach here complete patch for fast look / short review.
> >>
> >
> > Please find the modified patch, I have tried a few things but none
> > resolve the binding warning.
> > I am not able to debug this.
>
> And where is the warning or the issue? Can you describe what problem do
> you have?

Here is the list of warnings I observed with this patch

  DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
hub@1: 'vdd-supply' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
hub@1: 'reset-gpios' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
hub@1: 'peer-hub' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/ti,tps6598x.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/xlnx,usb2.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/renesas,usb-xhci.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/renesas,usbhs.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/cdns,usb3.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/ci-hdrc-usb2.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/brcm,usb-pinmap.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/renesas,usb3-peri.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/microchip,usb5744.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/smsc,usb3503.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/mediatek,musb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/vialab,vl817.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/richtek,rt1711h.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/usb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/realtek,rts5411.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/realtek,rtd-dwc3.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/usb-drd.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/ti,j721e-usb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/ti,am62-usb.example.dtb
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb:
hub@1: 'vdd-supply' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb:
hub@1: 'peer-hub' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/usb-hcd.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/fsl,imx8mq-dwc3.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb:
hub@1: 'vdd-supply' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb:
hub@1: 'reset-gpios' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb:
hub@1: 'peer-hub' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/nxp,isp1760.example.dtb

>
> >
> > -Thanks
> > Anand
> > -----8<----------8<----------8<----------8<----------8<----------8<-----
> > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > index ee08b9c3721f..7f75fa3c1945 100644
> > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> >  maintainers:
> >    - Icenowy Zheng <uwu@icenowy.me>
> >
> > -allOf:
> > -  - $ref: usb-device.yaml#
> > -
> >  properties:
> >    compatible:
> >      enum:
> > @@ -27,11 +24,47 @@ properties:
> >
> >    vdd-supply:
> >      description:
> > -      the regulator that provides 3.3V core power to the hub.
> > +      The regulator that provides 3.3V or 5.0V core power to the hub.
> > +
> > +  peer-hub:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs with
> > +      shared resets and power supplies, this property is used to identify the
> > +      hubs with which these are shared.
> >
> >  required:
> >    - compatible
> >    - reg
> > +  - vdd-supply
> > +  - reset-gpios
> > +  - peer-hub
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - usb5e3,608
> > +    then:
> > +      properties:
> > +        peer-hub: false
> > +        vdd-supply: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - usb5e3,610
> > +              - usb5e3,620
> > +    then:
> > +      properties:
> > +        peer-hub: true
> > +        vdd-supply: true
>
> Drop this if:, redundant.
>
No, this does not resolve the above issue.
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
