Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3BAC4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBmx/3psippY84lnSlEhWx91hX55LsVPc+z//p07HoI=; b=n3Yt4SnB8mzq2y
	+rB7aB75P/K32475b/SzYjQerqGKMvVr236V2FMWHCRdy3VHYLWtzS8Det9wCdz28oYbvKvgFRYIY
	oBn2SD9V+ZSw4HMjfFYkTU+h9nRJPfGQDqVcoTdbfAX+5BE8t0at1YTJB9p1DGE3ynWLV88GwAsM+
	uQnkSG38N/pLNBfGC6z4i4sxOFfTlD9Azvyv9Qe01obzNbGEQyO5AZauY9XqnN8h7ALqc1ZSCiCOa
	9eaw6/KRQsUvLg70UD1Z5+JEnZObPoIiFQ3q1BSuF0ozu0+hM2bs1mtU4Sad+xRvFPTrDO5wqwt9j
	i7lv4REJljpbD4MIzIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOfz-00EJZa-0U;
	Fri, 08 Dec 2023 00:25:07 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOfv-00EJYZ-1I
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Dec 2023 00:25:05 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5908a63a83fso75000eaf.1
        for <linux-amlogic@lists.infradead.org>; Thu, 07 Dec 2023 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701995101; x=1702599901; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MSN+KGwjWnynTpdt4z2HpHMekwKnkXSJkY0oqIZKp+Q=;
        b=ERfp6bZTMSTHJqN75ID+xvZmg+6yatfelH8oYc8FwfJrsMVKUDYEGTxjFjU+juu+P0
         C2+f8v7teTvcSuSqpUYglr5KGpR5amjYurBlWo1ts2ZqSZdvOY73Fl0LnqM0jbahIIt/
         cKrz7XGVYlPR4RrR2tD1gYFsW1/aKo6iT5ZrcJdbU1VJTk3kaAoQmg7SFrYD+fOtHE64
         mYhxDlBVrfRZEVv4OTRapRDe+JlteMswQgE276sl12Y/xIEhSYFv1ctZBdcHKccNtzTd
         hxawWBWH6BBwzVTowA7C29UNeVZoYEptYpE9NSlQi+6BWa49f7Ir/JR4RTYtvrCAPgmw
         thxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701995101; x=1702599901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSN+KGwjWnynTpdt4z2HpHMekwKnkXSJkY0oqIZKp+Q=;
        b=YPWkX7HZdruzvTkGKwlIblI+K0QWJzoUlj2YYWXmh6nwVP5FuOCDiTJmqSpT7g3/kR
         Cy7IAKYjwJR4nM+gZVohvagl3v3askQngJB70CLDycika7IdqGwBVJ0af34WiTvpBjmn
         HziFc+ITcSpDi284aOAI/XZu+qIFUgeg2I0kyt7/XMtL0Mwh3YoPlQRHEWHmRu4zQyu6
         /9+L+L4KYMA2Et/oe4df4BagyH/grZaH3oEEHhDcabRkoUXNtjMq3TjRRIS2litKeW6V
         fedzfCGhC/+qQaJLsvgJocRA8bBClyAlYld+GAfHWdBF2b5KAtW9eNVx7KZuFUbkq+sN
         aphg==
X-Gm-Message-State: AOJu0Yw/T02OjvTRHxP38a6cfH0kVL72ssW/vby8rn2F6nbnb6R9dXwa
	LI7QuGc9VbRu70yb8bay7+YjZqGQj2w/AGvAHvs=
X-Google-Smtp-Source: AGHT+IE2udV2rvMrY/grsLbuSgK8URfWOYUoftrCeWOfi0y4igmmQ/GFemj7anYUoOXKfI5XMf4vtFLfWHzvboXtdVQ=
X-Received: by 2002:a05:6820:1ac8:b0:58d:6ea3:8fc with SMTP id
 bu8-20020a0568201ac800b0058d6ea308fcmr4111694oob.2.1701995100761; Thu, 07 Dec
 2023 16:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org>
In-Reply-To: <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 Dec 2023 05:54:43 +0530
Message-ID: <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231207_162503_448298_101138D3 
X-CRM114-Status: GOOD (  28.32  )
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

On Thu, 7 Dec 2023 at 18:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/12/2023 13:33, Anand Moon wrote:
> > Hi Krzysztof
> >
> > On Thu, 7 Dec 2023 at 14:00, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 06/12/2023 18:14, Anand Moon wrote:
> >>> Hi Rob,
> >>>
> >>> On Wed, 6 Dec 2023 at 19:23, Rob Herring <robh@kernel.org> wrote:
> >>>>
> >>>> On Mon, Dec 04, 2023 at 08:14:25PM +0530, Anand Moon wrote:
> >>>>> Add the binding example for the USB3.1 Genesys Logic GL3523
> >>>>> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> >>>>> hub.
> >>>>>
> >>>>> For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>>>> with shared resets and power supplies, this property is used to identify
> >>>>> the hubs with which these are shared.
> >>>>>
> >>>>> GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
> >>>>> power to the USB HUB, it uses 5V power regulator.
> >>>>>
> >>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> ---
> >>>>> V6: fix the description of the regulators
> >>>>> Updated the commit message for regulator updates.
> >>>>> add reviewed by Conor Dooley
> >>>>> [1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
> >>>>> v5: upgrade peer-hub description : Conor Dooley
> >>>>> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> >>>>> v4: Fix the description of peer-hub and update the commit message.
> >>>>> Schematics of the Odroid N2+
> >>>>> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> >>>>> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> >>>>> v2: added Genesys GL3523 binding
> >>>>> v1: none
> >>>>> ---
> >>>>>  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
> >>>>>  1 file changed, 61 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> index ee08b9c3721f..c6f63a69396d 100644
> >>>>> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> >>>>>  maintainers:
> >>>>>    - Icenowy Zheng <uwu@icenowy.me>
> >>>>>
> >>>>> -allOf:
> >>>>> -  - $ref: usb-device.yaml#
> >>>>> -
> >>>>>  properties:
> >>>>>    compatible:
> >>>>>      enum:
> >>>>> @@ -27,12 +24,46 @@ properties:
> >>>>>
> >>>>>    vdd-supply:
> >>>>>      description:
> >>>>> -      the regulator that provides 3.3V core power to the hub.
> >>>>> +      The regulator that provides 3.3V or 5.0V core power to the hub.
> >>>>> +
> >>>>> +  peer-hub:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>> +    description:
> >>>>> +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>>>> +      with shared resets and power supplies, this property is used to identify
> >>>>> +      the hubs with which these are shared.
> >>>>>
> >>>>>  required:
> >>>>>    - compatible
> >>>>>    - reg
> >>>>>
> >>>>> +allOf:
> >>>>> +  - $ref: usb-device.yaml#
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            enum:
> >>>>> +              - usb5e3,608
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        peer-hub: false
> >>>>> +        vdd-supply: false
> >>>>> +        reset-gpios: true
> >>>>> +
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            enum:
> >>>>> +              - usb5e3,610
> >>>>> +              - usb5e3,620
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        peer-hub: true
> >>>>> +        vdd-supply: true
> >>>>> +        reset-gpios: true
> >>>>
> >>>> No need for this if schema. The default is they are allowed.
> >>>>
> >>>
> >>> If I move reset-gpios to required, I observe the below warning.
> >>>
> >>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>> hub@1: 'reset-gpio' is a required property
> >>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>
> >> Where are the properties defined? If you open the binding you see:
> >> nowhere. You cannot define properties in some variant with "true".
> >> Please define all of them in top-level and only narrow/constrain when
> >> applicable.
> >>
> > What I meant is the example below, required meant applicable for both
> > the binding
> > But it shows me the above warning.
>
> My explanation stands... So again:
>
> >> Please define all of them in top-level and only narrow/constrain when
> >> applicable.
>
Apologies, But I have tried this multiple times but have not been able
to fix the device tree warning
I have verified that example
Documentation/devicetree/bindings/usb/genesys,gl850g.example.dts
generate is correct

required:
  - compatible
  - reg
  - reset-gpio
  - peer-hub
  - vdd-supply

allOf:
  - $ref: usb-device.yaml#
  - if:
      properties:
        compatible:
          contains:
            enum:
              - usb5e3,608
    then:
      properties:
        peer-hub: false
        vdd-supply: false

  - if:
      properties:
        compatible:
          contains:
            enum:
              - usb5e3,610
              - usb5e3,620
    then:
      properties:
        peer-hub: true
        vdd-supply: true

additionalProperties: false

> Best regards,
> Krzysztof
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
