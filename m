Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE4EC4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9AOeLtEiFtkmEL0Ygdoxh3HZUwuR5xFt61i1CNbnhU=; b=cLGVtmQPbBKiFI
	5jdBIlDmdsPuJhYQPRWAhfyGHLwiyS9bsLMOr3WXLYsabDZ6Y00AHYkJaGPjXhY5lRaWiwJE3j0Bl
	Jr4mPlci8EvOLP2Tb5MmbmBHPQNGqGqobsbxwIHskdUnI/0kIwLCWUrikf7U9QrYWapGcB3d1QB81
	dn13p90jMJbUVsgEmiOvgNUwBLoleKt/V+p1gmOv0Pr9dvKNPuH15/KfPmJIYjOoJh+xPuPnc/VUy
	9A0RRVIoPslKe2a4SLOMUfPou7BMCGW9GpcWslJYF+6NfJ/IAX3qekjN097b2m0vpFAkpuU+kT+Lp
	EEPlwGPU0l+8V6hrik4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYu2-00FRjU-0N;
	Fri, 08 Dec 2023 11:20:18 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYtz-00FRgt-0i
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Dec 2023 11:20:16 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b8b0ced0f4so1443683b6e.0
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Dec 2023 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702034414; x=1702639214; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2PEUKU4RsP0giZMZ/KrfzmNAgaL4v7lal6pj/aFK5ok=;
        b=fMcyyzvJyG/M5eYR4rsO+S+sKPODP8U7Kr11Cl0gGT3CIuW0B615AznS7vKRcES3GD
         SSHYWElES2uT/rxzK5Uwb6f28sjspI06n6Cujj5/Dm7bBrFM8VRw4PDU/jN1wpv8BcF1
         IcVIWGcbpY5kPsMyYf48cv5Izxj3HRfK8qkYKXx3Xo17MaodwmpBd7QP4XbMeFSredD8
         t7e7H6NLvYmyDwUvt+APGNjQgzntBGq5S9cmGR1c6GwWaMaIDTilsodwbOroQqccgFB9
         wsHpXktsO/hNe6opBkkK0RisuX3jlMmynxs4eVCjx2rmOyAczLEzClq86/IlUbfeXRmq
         d1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034414; x=1702639214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PEUKU4RsP0giZMZ/KrfzmNAgaL4v7lal6pj/aFK5ok=;
        b=iJxP+grwA5+Xpir31vRtKvwOzxO68qvCOsYjNOQhW0AJtILR7wUrwQvr9B3YFETMPs
         8O7eM5ky9EqUREFiFVcNl+l+B/pEoIyTAIo6goHArKMBb38G0SjGq2I/p0edtU0J/kUX
         oh7zl57uoo+DUXL5/wPFn/U10uK5WHLj8ZXea6xrZWiXC22XnjGVZ3xW8y92fgZXXTCd
         DPLFj4wwIx+8Lqyzl1oLo7P9RzmY1naL/UsJEw7ZZO5BHDwWZmBuMsKlDuoNjDMYZ7+l
         BWhIfJBaKf1UYR0yh/XMOfzS9zg6i368KFFm3IcSpUFn3bbZMhosoYfjTuLzFq3vgj/r
         dXyg==
X-Gm-Message-State: AOJu0YxdsYRb15z31DgKlOoEwZmV1dT0GltOTgRLtfffNmEfUEhIYq5S
	mKa2iSjoGVffoBj8nrUsj4gKF6900VjcNvyI2Ag=
X-Google-Smtp-Source: AGHT+IHKfgOJJkGUVNVFohMebN1Pi1RObECe1iqnsd4pbG5YaF8nQXN5FgdG0fJYIqAU9y4NJPN/aM1KEVAfQ33/aHk=
X-Received: by 2002:a05:6808:640c:b0:3b9:d2ea:4d2 with SMTP id
 fg12-20020a056808640c00b003b9d2ea04d2mr327428oib.22.1702034413856; Fri, 08
 Dec 2023 03:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org>
In-Reply-To: <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 Dec 2023 16:49:57 +0530
Message-ID: <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231208_032015_257237_F151FC96 
X-CRM114-Status: GOOD (  16.22  )
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

On Fri, 8 Dec 2023 at 13:14, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 01:24, Anand Moon wrote:
> >>>>>
> >>>>> If I move reset-gpios to required, I observe the below warning.
> >>>>>
> >>>>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>>>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>>>> hub@1: 'reset-gpio' is a required property
> >>>>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>>>
> >>>> Where are the properties defined? If you open the binding you see:
> >>>> nowhere. You cannot define properties in some variant with "true".
> >>>> Please define all of them in top-level and only narrow/constrain when
> >>>> applicable.
> >>>>
> >>> What I meant is the example below, required meant applicable for both
> >>> the binding
> >>> But it shows me the above warning.
> >>
> >> My explanation stands... So again:
> >>
> >>>> Please define all of them in top-level and only narrow/constrain when
> >>>> applicable.
> >>
> > Apologies, But I have tried this multiple times but have not been able
> > to fix the device tree warning
>
> Did you document all properties in top-level "properties:" block?
>
Yes, I have,

Can you suggest a couple of examples to follow?
I looked at some of the YAML files but could not fix my issue.

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
