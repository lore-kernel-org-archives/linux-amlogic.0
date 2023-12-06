Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF467C10DC1
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Dec 2023 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSr4+eNludyiwBcD4BncSVhIgMtTmTNclbq7XJwE/WA=; b=4aq9kZ1/Pp74Rh
	pBYv92s+4WeYeesQFh6HHLOq4Ftu4Psx2fKEJX/KursRv6XpuWVBlhR/pnlKFLSpnH/mT5dIN92ve
	OhSy8sJt1RgKJTS+nyePhhjkgQltmaRJZqby6QqfDnEPSYSARKOb4BB/0CKXbIaCAORg+v0SieN3e
	7AsbCDx9ObZ2fYYt8KQlJGAl487mBjbGk69eFaizmEXR4Zc8sL9BX55X8ynnCILy+OgXUctJ7ITu+
	lYPgWD0XLNrV/V1cmXk6+uok2NBY5nefxZG/COoP2KrmkZp3v73WC+OXcjWcgdQ+7WtJozqeUPjwK
	87oK4OiettYtJAeX3nNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvTy-00Arft-22;
	Wed, 06 Dec 2023 17:14:46 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvTv-00ArdI-0E
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Dec 2023 17:14:45 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1fb40253680so36850fac.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Dec 2023 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701882880; x=1702487680; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0A3N+96A+1Q1WOKJBTgT0YZdafSP9BVjbGQLT1Px9rg=;
        b=Z8owfjF7DbkURRl2oPg6xRaeJ9+lK0Vp2l/bw/7ow+I+CuZHzXsXjKjGC+QT+hnnQz
         AAT9mo9ky4lMCSRiTt1cg3mt5vsPRlCUE6A7ZI8QadMJCS6dZf4tjgG0Obnww0XbbhMU
         l4f2pRhb0blt6V8W/wZ1Gg4voL8ZKnEfqZMMvKj1e0mpZig52YnE7UfaowjzbUZhARmX
         xCYFtv6+cZf3yKPfVfBajb1RsF2T4gicdNYzka1EUWuMGrn1TALgfeIMJ7rXIxKM95SD
         CkXOlFbuMUPgnsEWIfkK0ZlpBBpJO9s9mcoVYizg0ThdL/P37cTYLFrI4+obCr0C3T56
         21Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882880; x=1702487680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A3N+96A+1Q1WOKJBTgT0YZdafSP9BVjbGQLT1Px9rg=;
        b=LI0F1LpqkXYRGEE2m+6Gt1s3/3bwU5jK3V/BUsWDLCholriAsp0QdB87axnaRLI3ts
         qLiDSjSKVUkHmsb9AgV8CG8jQfcwgkh3gw7rjSeonlI4+7BO1LKekQhQ1iQ+FZs6e2qu
         nl3+HPC3nxDkkdkLTH2jHjzCfvRuXHi+hI/zc3L+ukI5noClIrNRU4jPO9p4qgp8ezsr
         pEkKf0GQ8GvYjxOFlmnEXMQReGLPsKqQkJpxTXyf+I1LuCpfxDMNhlXJQycBIt/0JL11
         hAhPXYItfhJtSQHXWhZpb85SEXZsvShbtzc5R1k6LNHHufNokhrClrcc7lh0so2GZ9EV
         gTOg==
X-Gm-Message-State: AOJu0YzVc0jEk/Fs1G0fgcvY4k1YjKtRWuFQYPsv4A/Cg4J5MyB3DP0M
	0yHhs229evmSRX4Ca5+DeTz6Z7sERBgoleaXivspG1DkrU1aJA==
X-Google-Smtp-Source: AGHT+IHXBDJwsUWKBFw4DqlEqnhQX9IUX2BaSV8wq52NeyLZimuYnsac+q5/+DjzsdbKheZI6/62489OkjicV+ovZqg=
X-Received: by 2002:a05:6870:970c:b0:1fb:75a:c421 with SMTP id
 n12-20020a056870970c00b001fb075ac421mr1176895oaq.74.1701882880366; Wed, 06
 Dec 2023 09:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org>
In-Reply-To: <20231206135311.GA2043711-robh@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 6 Dec 2023 22:44:24 +0530
Message-ID: <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_091443_107903_9231E409 
X-CRM114-Status: GOOD (  23.72  )
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

Hi Rob,

On Wed, 6 Dec 2023 at 19:23, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 04, 2023 at 08:14:25PM +0530, Anand Moon wrote:
> > Add the binding example for the USB3.1 Genesys Logic GL3523
> > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > hub.
> >
> > For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> > with shared resets and power supplies, this property is used to identify
> > the hubs with which these are shared.
> >
> > GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
> > power to the USB HUB, it uses 5V power regulator.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > V6: fix the description of the regulators
> > Updated the commit message for regulator updates.
> > add reviewed by Conor Dooley
> > [1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
> > v5: upgrade peer-hub description : Conor Dooley
> > [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> > v4: Fix the description of peer-hub and update the commit message.
> > Schematics of the Odroid N2+
> > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > V3: fix the dt_binding_check error, added new example for Genesys GL3523
> > v2: added Genesys GL3523 binding
> > v1: none
> > ---
> >  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
> >  1 file changed, 61 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > index ee08b9c3721f..c6f63a69396d 100644
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
> > @@ -27,12 +24,46 @@ properties:
> >
> >    vdd-supply:
> >      description:
> > -      the regulator that provides 3.3V core power to the hub.
> > +      The regulator that provides 3.3V or 5.0V core power to the hub.
> > +
> > +  peer-hub:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> > +      with shared resets and power supplies, this property is used to identify
> > +      the hubs with which these are shared.
> >
> >  required:
> >    - compatible
> >    - reg
> >
> > +allOf:
> > +  - $ref: usb-device.yaml#
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
> > +        reset-gpios: true
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
> > +        reset-gpios: true
>
> No need for this if schema. The default is they are allowed.
>

If I move reset-gpios to required, I observe the below warning.

  DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
/home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
hub@1: 'reset-gpio' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/mediatek,musb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/usb251xb.example.dtb
  DTC_CHK Documentation/devicetree/bindings/usb/realtek,rts5411.example.dtb
/home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb:
hub@1: 'reset-gpio' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/brcm,bdc.example.dtb
/home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb:
hub@1: 'reset-gpio' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/xlnx,usb2.example.dtb
/home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb:
hub@2: 'reset-gpio' is a required property
        from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
  DTC_CHK Documentation/devicetree/bindings/usb/starfive,jh7110-usb.example.dtb

> Rob

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
