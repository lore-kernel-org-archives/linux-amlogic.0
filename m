Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FE0C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YYQihU1LMecWQQUeol4CN7h6XO4ZzGc/uMuNHYRzwk=; b=PxGvUpI2tN5HJe
	onB/DZrT5OMX0nFhyfpGzE2Th5/H3p4osn+5elzmDsma8rw+YnZXt4nWYqmzhSO7imRkXR2yfj0p0
	iuv6zQIaRO70lpNV2W/jWZGyva0Awmxsu0t36902BWvgZsVay+oPQ1szBzORMyHlEYLh8nhxX565X
	NZ+WgdMFTo2N0Ql3e0Xse8HICdAn8TxD0PRhiXFOQzn+vgTBJptCFDAsInStlZC0ODylwDdG4E2Vm
	Wtx9kgqzSyIFXqQPdC0fE/DgYorPk2pxFs43DzdDSGYL+dCwut7uiCZuEesxJ/sI+ahHY1c2RkTTj
	upOIxyX+dhUpgQbRH6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZQA-007j75-1e;
	Fri, 24 Nov 2023 16:52:50 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZQ5-007j6J-1q
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 16:52:47 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-589d6647c6cso959756eaf.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700844762; x=1701449562; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwvURCD8JO2RIWqByNKqPi8KtIAW+ntHwZp3ixqrauc=;
        b=eZ7E8KB+lu3BiAZ4/iEo7+6nq7pmMKXzNxVhOGeGqQvErl44xs+fVJSxljoX3ZGLS/
         r4dmdKsYe6hzSdnZuSK/ZMhY6Jl1cYvLfMy9snl6j5e2RvNSEo+0joEp6aOmjjSNjtn8
         lZ0LEtY9rXewEiCrlJi6YFt/RZZ8pXLrEEkSEeogYlkGr7I6Fk36lUuBZq4QH3m80skD
         +iR6NGCDo9FGOTxmshOa6Ck0RYejs56R059hQdTVLi5rGwaQk8vZPfxXfdehEEeEu9r+
         JSNfsnWyjdeUx5u4UJ7joNVQxjrodtfsbe6IXcXEhTNfgT/S1VL0mqSmz0/iFu2uVfBh
         OWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700844762; x=1701449562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwvURCD8JO2RIWqByNKqPi8KtIAW+ntHwZp3ixqrauc=;
        b=Bar7xpZY/dyp4/SiixW1hKMIY7DYqoqW1Z7+HU3CrMup4BfMx1NHXKs95tz56vbx7U
         147c7o0Sm2mwM09+iRd4UsmZ3QeTxnL87HPMMA0G3K1k3Pw9Cghhs2mKzlj2MflHvuwU
         JL6RE4bej7BlnP0IOOnnYO6qVcr7Gyvvz1/dic9GAAATzKGSOv8ct4yHIj/CpflFn7O5
         t/XZslG8xDT2h7H0LkdoaTUe4sKtpfNPjpYA4snFtn/22WhdGWUrg40+RqrXRPN0XfuI
         Ovs90aepm6TYJ4KHg60p/nSYT9Gyy1ubUMXpN8QP3AYVB67HDyBnchyJ6XxiZHFvx2/i
         94wA==
X-Gm-Message-State: AOJu0YwRprrB3hYm6N0GpJuCmN9UBSBYNJsMWS8/s1uo9ydOdV9v7kvB
	2fCkyKAv3ysW6+qMhzyXYogr6rNAMiWykzFCCX7LGi90dOE=
X-Google-Smtp-Source: AGHT+IHyDITij++0oWIIfEE6LF/3Kb0JdsJVaCPpRgfdvGx+E5uurlL7PB8lD4NVooz9LQlIxdVmY5ODHj1CXNhlbnY=
X-Received: by 2002:a05:6820:513:b0:581:d5a6:da4a with SMTP id
 m19-20020a056820051300b00581d5a6da4amr4341978ooj.1.1700844762520; Fri, 24 Nov
 2023 08:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20231122182351.63214-1-linux.amoon@gmail.com> <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud> <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
 <20231124-clear-aids-2fd63e1dcbcf@spud>
In-Reply-To: <20231124-clear-aids-2fd63e1dcbcf@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 24 Nov 2023 22:22:26 +0530
Message-ID: <CANAwSgSRp96fjGfHw2rRNW8S3iKSzL7QTBV4N8_+vPxDoos1gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_085245_617981_AE63DB07 
X-CRM114-Status: GOOD (  44.50  )
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

Hi Conor,

On Fri, 24 Nov 2023 at 17:55, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Nov 24, 2023 at 04:18:23PM +0530, Anand Moon wrote:
> > Hi Conor
> >
> > On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > > hub.
> > > >
> > > > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > > > which has a common reset pin and power supply.
> > > > peer-hub phandle each peer controller with proper gpio reset
> > > > and help each peer power on during initialization
> > > > and power off during suspend.
> > > >
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v4: Fix the description of peer-hub and update the commit message.
> > > > Schematics of the Odroid N2+
> > > > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > > > V3: fix the dt_binding_check error, added new example for Genesys GL3523
> > > > v2: added Genesys GL3523 binding
> > > > v1: none
> > > > ---
> > > >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
> > > >  1 file changed, 63 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > index ee08b9c3721f..bc3b3f4c8473 100644
> > > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> > > >  maintainers:
> > > >    - Icenowy Zheng <uwu@icenowy.me>
> > > >
> > > > -allOf:
> > > > -  - $ref: usb-device.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      enum:
> > > > @@ -27,12 +24,48 @@ properties:
> > > >
> > > >    vdd-supply:
> > > >      description:
> > > > -      the regulator that provides 3.3V core power to the hub.
> > > > +      phandle to the regulator that provides power to the hub.
> > > > +
> > > > +  peer-hub:
> > >
> > > Should the property not be "peer-controller"? Your description refers to
> > > them as such.
> >
> > No, as per my understanding, peer-hub represents a complete USB hub.
> > See the lock diagram in the below link.
> >
> > >
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > >
> > >
> > > > +      which has a common reset pin and power supply.
> > > > +      peer-hub phandle each peer controller with proper gpio reset
>
> This is what I don't get. You say "peer-hub phandle each peer
> controller..". It is hard for me to understand that portion of the
> sentence, but the interchanging of "hub" and "controller" is
> confusing. The title of the binding says "hub controller", so maybe it
> is better to use that here.
>
> > > > +      and help each peer power on during initialization
> > > > +      and power off during suspend.
> > >
> > > I generally hate to talk about non-native speakers grammar etc, but what
> > > you have here is in need of a lot of improvement. The below is my
> > > attempt to understand what you are trying to say:
> > >
> > > "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> > > shared resets and power supplies, this property is used to identify
> > > the controllers with which these are shared."
>
> "For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> with shared resets and power supplies, this property is used to identify
> the hubs with which these are shared."
>
Thanks for your review comments.
Ok will update this in the next version.

> I re-worded this again to try and remove the use of "controller".
> Do you think that this still makes sense?
>
> > Sorry for the poor grammar, I will update this in the next v5.
> >
> > > Also - this is one particular system, what prevents there being a hub
> > > that has more than 2 controllers? Also, as you insist that this is
> > > generic, and not just for genesys, should this not be defined in a
> > > common location?
> >
> > Here is the block diagram of the Genesys GL3523 hub.
> > [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> >
> > It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
> > the onboard hub module will bring up this hub.
> >
> > There are many examples that use similar properties hence it is generic.
> >
> > # Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > # Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > # Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > # Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > # Documentation/devicetree/bindings/usb/vialab,vl817.yaml
>
> Which brings me back to the unanswered question, should this not be
> defined in a common location given there are several devices using it?
> I assume because it only applies to hub controllers and not other types
> of devices.
>
> Also, the descriptions that I saw when looking at some of those other
> bindings are similarly poor. I can't bring myself to care any more,
> just clean up the ambiguous wording here and I'll ack the next version,
> I don't expect you to sort out the wording in other bindings.
>
Ok
> Cheers,
> Conor.

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
