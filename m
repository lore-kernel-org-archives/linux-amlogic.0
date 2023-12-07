Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF167C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Dec 2023 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+G6EEd/aqUpS5kX9hqsmipQN7FLFU/aEZxELig+mh0=; b=DYuHPh5I8pf0qh
	T3qCoDHP+kTIwh1WXiOIfhKowaD1wkedbjG9xH860xFQ4e8bFhdjch1fs2i1CAn7b9NRPr1xkt1Im
	GS3iv/5TINPvKYpfiAcvZCRY6bI5r3QafO9z+yTMQcrkIEnW01KpYd8gHf4CVw16lkjSi7BR69wm8
	jRAWpeGpr/UKLe5IluLpk/LlkNKHc1gDrlo0cI1OgEsVUMAmkIqe/fvALw3C47cHW2H/UkyyzX4fG
	d/xcT8MngbbBeVqTxJOvDMaG3x0qp1dPBsnaadIHJDKz6mdU/RJWve1+EX1XAspVO78ohGtEU2iNo
	UloNufkfkQ1xbgi9TNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDZd-00CnSQ-1I;
	Thu, 07 Dec 2023 12:33:49 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDZZ-00CnRb-0r
	for linux-amlogic@lists.infradead.org;
	Thu, 07 Dec 2023 12:33:47 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-58df5988172so332405eaf.0
        for <linux-amlogic@lists.infradead.org>; Thu, 07 Dec 2023 04:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701952423; x=1702557223; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoyF50C90+byNneOw67lraz5w5fqAkMLns+7xoj94Cw=;
        b=NlkELJWty/HTxs7MD7DDtjTQeKkYUtnwTGd5xd7iX05VyIo7vS0O6o878MTgU5/AkC
         RsQpl0p8yKZpE7bjfoni/HgHJ5gVINsJCEOFs3OUZQRrra2Q5uT00wgk1VmXXqSUPm23
         yMPwUtS6gpMHCIHuskXOPJn7azSEkBh7D3aGZuWI7whMi3Wo0AdCT9ghPkzxKK6xrps2
         diUJX8LyQOLYDW6DEF3O3UVp6zVJjDqs5XQMQLqp0N49GB7nhdCekYK584xyFWOKQ/0N
         4MHmVmJZoCTNlYTneG8JUrdDyv/aCTQUUdqVo+ovAzDazROCF1yCeTe44pos/szDpSQH
         hafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952423; x=1702557223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoyF50C90+byNneOw67lraz5w5fqAkMLns+7xoj94Cw=;
        b=nbKx8puS8NSbv+nuYWx+Ho88FwDnixmSQIZUTte3peLKtjqB4xZw5s5eeY9Ece7lDb
         VEEQkn5s1PGWxbGF2QEWGJ4gs/8cmJcAkXm7T9RyuNfze4DA8ptZgLm5ygmj2w5fVQxX
         va3q9K0C3jU+u+nWHho/r7G0lkgqu4vZYGtxxIGlvENx4rEmbBgRg9bZa0e16vKme6XR
         liMwFFNH79Ui/Mcer4+2uIrG1Yv81S/kLIsLSzBl/EH1LEK+GrokCwWtLuM4pIg8IF6E
         NsrWiLrbod6df5ajLObLG7ZqJf8D1DzyD1qUos8rf+4+WIDvA5XIHhLTp15PNbgn5crG
         +yCg==
X-Gm-Message-State: AOJu0YwZlMQdiAESFU8pITbSzD7TO5vphlQvbwymZ8+xOQyQ2K/DeIEE
	TYrw4PbrrZv9qWQz4ihJ/6LFtKpZCioANhi5v/s=
X-Google-Smtp-Source: AGHT+IFS8NwFi5sJw7amN4YsRotWSEY7Uv9GR7UCo3iJnNkSK0NiiYeAUIhB/yWzq4W+sEwWpOCZYlM6kE4su+J5LnI=
X-Received: by 2002:a05:6820:1ac8:b0:58d:6ea3:8fc with SMTP id
 bu8-20020a0568201ac800b0058d6ea308fcmr2905570oob.2.1701952422933; Thu, 07 Dec
 2023 04:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org>
In-Reply-To: <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 7 Dec 2023 18:03:25 +0530
Message-ID: <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231207_043345_307170_125C0224 
X-CRM114-Status: GOOD (  25.62  )
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

Hi Krzysztof

On Thu, 7 Dec 2023 at 14:00, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/12/2023 18:14, Anand Moon wrote:
> > Hi Rob,
> >
> > On Wed, 6 Dec 2023 at 19:23, Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Mon, Dec 04, 2023 at 08:14:25PM +0530, Anand Moon wrote:
> >>> Add the binding example for the USB3.1 Genesys Logic GL3523
> >>> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> >>> hub.
> >>>
> >>> For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>> with shared resets and power supplies, this property is used to identify
> >>> the hubs with which these are shared.
> >>>
> >>> GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
> >>> power to the USB HUB, it uses 5V power regulator.
> >>>
> >>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> >>> V6: fix the description of the regulators
> >>> Updated the commit message for regulator updates.
> >>> add reviewed by Conor Dooley
> >>> [1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
> >>> v5: upgrade peer-hub description : Conor Dooley
> >>> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> >>> v4: Fix the description of peer-hub and update the commit message.
> >>> Schematics of the Odroid N2+
> >>> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> >>> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> >>> v2: added Genesys GL3523 binding
> >>> v1: none
> >>> ---
> >>>  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
> >>>  1 file changed, 61 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>> index ee08b9c3721f..c6f63a69396d 100644
> >>> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> >>>  maintainers:
> >>>    - Icenowy Zheng <uwu@icenowy.me>
> >>>
> >>> -allOf:
> >>> -  - $ref: usb-device.yaml#
> >>> -
> >>>  properties:
> >>>    compatible:
> >>>      enum:
> >>> @@ -27,12 +24,46 @@ properties:
> >>>
> >>>    vdd-supply:
> >>>      description:
> >>> -      the regulator that provides 3.3V core power to the hub.
> >>> +      The regulator that provides 3.3V or 5.0V core power to the hub.
> >>> +
> >>> +  peer-hub:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description:
> >>> +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>> +      with shared resets and power supplies, this property is used to identify
> >>> +      the hubs with which these are shared.
> >>>
> >>>  required:
> >>>    - compatible
> >>>    - reg
> >>>
> >>> +allOf:
> >>> +  - $ref: usb-device.yaml#
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - usb5e3,608
> >>> +    then:
> >>> +      properties:
> >>> +        peer-hub: false
> >>> +        vdd-supply: false
> >>> +        reset-gpios: true
> >>> +
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
> >>> +        reset-gpios: true
> >>
> >> No need for this if schema. The default is they are allowed.
> >>
> >
> > If I move reset-gpios to required, I observe the below warning.
> >
> >   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> > /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > hub@1: 'reset-gpio' is a required property
> >         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
>
> Where are the properties defined? If you open the binding you see:
> nowhere. You cannot define properties in some variant with "true".
> Please define all of them in top-level and only narrow/constrain when
> applicable.
>
What I meant is the example below, required meant applicable for both
the binding
But it shows me the above warning.

required:
  - compatible
  - reg
  - reset-gpio

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

>
> Best regards,
> Krzysztof
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
