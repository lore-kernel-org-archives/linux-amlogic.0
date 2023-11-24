Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE1C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR8ONpyZM8i2SzjFQH78l9LKs4xGF7IpdEy7HTnZDSI=; b=v0aVREpQiLlTN3
	Gtps4ydE9dIx+itijHL8ZIdhTx6qWOaqgTq74VFNj6KjoDQmOyPXsFeSHBOx5s0Vldp2OpJXBdHaI
	vj8AoV2w4yvRaZUe9eBWjRkQee3esu0q2tMGGcs1I83pOWv3aM4keIDmNUjXN0Qao43jUWM5JgrCU
	xZiuXFPePitzR4b63G7WxRf4yW4l2XT6QPhYkoFeLh5LIH+b58bpecY4fGltqIrON4T9UmFIw7IV2
	NEp05ma5qBwSzAx4nSENhLIKlM+PNPWT0tlO6bIFAIlEVEFEbz0yUun5gPh1At79DTOKzhqOat0jI
	I9Auke13HCom6/jEqvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Tjq-006ulo-37;
	Fri, 24 Nov 2023 10:48:46 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Tjn-006ukm-0b
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 10:48:45 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d7eb7ff384so1047558a34.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700822919; x=1701427719; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JSUEAKedcFlvjkIzN6LzNXLF8ZLIJ83SRbS1kwzATO0=;
        b=J8PZvPfKO0Tgn04PU3aeiAOdpB4UGinDQJUWXAHAy4afMblaC3f5gNSlkM3B5t1LVh
         kDsWkd0YjbOWl8t+27FNRkY29snO7NPDsEwBnG/mAPQaIkvtXQ2nTMQTZEDyvCKKWm46
         RV7F2dac0+FDGseKnRypavRM6ChT3VEp8evCDw49I9y7CzNV+UmHxHfpodXZ8o8V3SAs
         b+xpAudsukd9rrSeSXlv8Y4YI0RMRrN+cEztiINkMivvTejp2N3nxRSbUZExbv/cWLoY
         YGUrzLh0Cd5obq9c1B53CmEDDycqbgxkNfVqbm5aw7cR1xyLr8XJhVPJSr9NbjxjgVaX
         s//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700822919; x=1701427719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSUEAKedcFlvjkIzN6LzNXLF8ZLIJ83SRbS1kwzATO0=;
        b=MF6Av2yq6sPP/YIo4KJgOsMtXhcuPbdi00Cz17Vt/98uhG377IZGLtKdnrC6S2llOK
         bcQnbBSgpJdtR3xvTxpH/LtPYQ424qwPPI1xfLIPCaJk+DafMBUArkip/K6vPREaHeui
         Rj4+8hw5O51lii2K0pX3fGe8gJN82Av58KoGh+L8VCVLbgR3MnnVlyNKCtkzolzNpDqw
         +jUkHHd/5TSpJMtS6ommqbUo1j7zJLg3KWBqPp657ixX61ZVpsC9r4BrsHOqCEgXNdlk
         LLNCx7Bkx/+D3eIP/bPYR+BDMKOZXAHK0kcUneQ/Zuk9g0/ZtYEmy43/pBm60Ye8QzpR
         ICxg==
X-Gm-Message-State: AOJu0Yx7OTez4NCmC1tB/r+FNXnAhZtatXxsZmaB3wteLysL2bhRVQ6D
	SyrlgWxPEW95WQZeu83EjnacAX7lvdNq8t6ChpI=
X-Google-Smtp-Source: AGHT+IH2TyCtkFLMnAO/yClVYDhq70yZy6EcVUl/P6ZwWvgPzvLcjJQMd6c3yTIRYwm7OY8ExvVm49pGjrDQTZCwM54=
X-Received: by 2002:a05:6870:9f8b:b0:1e9:c7cc:df9a with SMTP id
 xm11-20020a0568709f8b00b001e9c7ccdf9amr3508073oab.11.1700822919197; Fri, 24
 Nov 2023 02:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20231122182351.63214-1-linux.amoon@gmail.com> <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud>
In-Reply-To: <20231123-skeletal-smirk-390543e2d6ab@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 24 Nov 2023 16:18:23 +0530
Message-ID: <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_024843_224152_FB83D4EC 
X-CRM114-Status: GOOD (  28.84  )
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

Hi Conor

On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > Add the binding example for the USB3.1 Genesys Logic GL3523
> > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > hub.
> >
> > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > which has a common reset pin and power supply.
> > peer-hub phandle each peer controller with proper gpio reset
> > and help each peer power on during initialization
> > and power off during suspend.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v4: Fix the description of peer-hub and update the commit message.
> > Schematics of the Odroid N2+
> > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > V3: fix the dt_binding_check error, added new example for Genesys GL3523
> > v2: added Genesys GL3523 binding
> > v1: none
> > ---
> >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
> >  1 file changed, 63 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > index ee08b9c3721f..bc3b3f4c8473 100644
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
> > @@ -27,12 +24,48 @@ properties:
> >
> >    vdd-supply:
> >      description:
> > -      the regulator that provides 3.3V core power to the hub.
> > +      phandle to the regulator that provides power to the hub.
> > +
> > +  peer-hub:
>
> Should the property not be "peer-controller"? Your description refers to
> them as such.

No, as per my understanding, peer-hub represents a complete USB hub.
See the lock diagram in the below link.

>
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
>
>
> > +      which has a common reset pin and power supply.
> > +      peer-hub phandle each peer controller with proper gpio reset
> > +      and help each peer power on during initialization
> > +      and power off during suspend.
>
> I generally hate to talk about non-native speakers grammar etc, but what
> you have here is in need of a lot of improvement. The below is my
> attempt to understand what you are trying to say:
>
> "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> shared resets and power supplies, this property is used to identify
> the controllers with which these are shared."
>

Sorry for the poor grammar, I will update this in the next v5.

> Also - this is one particular system, what prevents there being a hub
> that has more than 2 controllers? Also, as you insist that this is
> generic, and not just for genesys, should this not be defined in a
> common location?

Here is the block diagram of the Genesys GL3523 hub.
[0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]

It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
the onboard hub module will bring up this hub.

There are many examples that use similar properties hence it is generic.

# Documentation/devicetree/bindings/usb/cypress,hx3.yaml
# Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
# Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
# Documentation/devicetree/bindings/usb/ti,usb8041.yaml
# Documentation/devicetree/bindings/usb/vialab,vl817.yaml

>
> Cheers,
> Conor.
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
