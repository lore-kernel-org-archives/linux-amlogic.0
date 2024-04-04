Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D8CD1284
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 04:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHHdHTdROhG1axJyks5X0s9FE5B1y1hl82z9YfP2oTQ=; b=uKjumIiBsFaHCq
	P81ItxkUqUJfOzztLx5Y8wfvMLAmnAY30w2zjNBbHdmGZ051h46BiumZgqTGo0iYpJ3TMqpJ+7Oci
	bGbQP1gUIg5RmH7BpItFPk3+4WBaajuQTyBRoCNdLya5T+rjJclO0j3BZpXIvIG2cx4yDWk8XjPeI
	T1kdpo3lYooewtGOMFQ4aGGRS4USCdmFChW8vmXTp1Cz8pmW7DftttWZwK1ZbkvLSRGi/oqG4JYLu
	aQxMOmPxuBciYd/+zPIWbO8MCqzd1VVp0kzvxq/KSUq2w6EmySj2QGxNPHR1Uqfk/UpqeYxj8s4GO
	atzi3auAj+oV3s2Y7x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsEhP-00000001Aln-2cvn;
	Thu, 04 Apr 2024 04:27:39 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsEhM-00000001AlL-1sFf
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 04:27:38 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5a49261093cso289065eaf.3
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712204854; x=1712809654; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WWP5RAoFT0kiTo+qfZyglyrEgEHCHG1QIQ9F/lt7B8E=;
        b=it6M5XnP92SuipBFRdUG5Hy7qScTPe12l4YGJjgSKs3RdqQOR9sGvhegBeuzsIGA8+
         6IkVh6vACpLg/2oGp1QF/mItz7hF4aQNmi22r3dijeb1lqdwkT/pVjgx/mmOJsuNU1WS
         3Mg7mFTpwe2P+3Q12Uoo12m79jyo8WEZ/KSFLuyKAnS1RrLEiBTS2hHxFBUT/jXw+SMf
         2N8UP1OMtJ6pDqg4cTTU+JAq4NktN2piJXctxQ6+YaL7VKvEf45obsX+C9zaGmkjjjlL
         L/qJjKWXy9xCbCaThsw6c3KBg//151Szr2FrWgSGxijzlSOfL/MDgbR3jOJJUg4C8hJM
         kd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712204854; x=1712809654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWP5RAoFT0kiTo+qfZyglyrEgEHCHG1QIQ9F/lt7B8E=;
        b=rExAZCcG59pKbP4WKPp0gFYsylTpzzlv5NWeK7n7/F4N41AcVszv6VDxX9WT6hBNfx
         6/XR89FTyVhqfTW1IYjP8wJi9yU8MK0LJCj8DJt+HNvlbaVUZ+IGFZbVnKwsc1gwMVYF
         R0ScDU0l9UyewI/Mley4CsnHnDeOfQspkMzEtImkujvr0XJSFJAFdCncILKr3t8LdK4d
         5+7UUwKcUCNe2V/tGaEbLPg/hfaixybPfM8Ra5NYN/ypN+fs+RTAAIjR6qhv1iks384y
         s0j5WzAAnDfT+PEFmi0HXAxkiRtL7TqC2d+w3N8XJREJWlhRiUk/xDVAD9SrjcaMaWvF
         RcSg==
X-Forwarded-Encrypted: i=1; AJvYcCUWDDbOuRAqfu0OZW9rI3xodNuee7FWj8p5kGrtN2+3CVk8kZO3PvdzX+vICowydalp0DpMZg2hVHjJnzyld04wOyzB+f2K70ofRjlrul6mDNI=
X-Gm-Message-State: AOJu0Yxxfni1eK6qGXr/mNg4VWg/hOePNSCaYgXLFVI6ksUEqlkAfq2H
	NvqovoPH9UyZjYX1p//KNMLZR6XxH7OV0h6LLzTHVI/l4/CqVCQ1wIYGic8B98wJmt4g8arwFH3
	wfWGrHMusZJXHOsC5E/IuXEpNr2I=
X-Google-Smtp-Source: AGHT+IFwojGdn5TFA69NQKI8EHFePsm+grycDmM/kwemTgKo/lxJRDpk6nDdoeK1+VDGtXqMUJ0Dsn4FbyEFO4nF0nc=
X-Received: by 2002:a05:6820:2012:b0:5a5:639a:2faa with SMTP id
 by18-20020a056820201200b005a5639a2faamr1825200oob.2.1712204854408; Wed, 03
 Apr 2024 21:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org> <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
 <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org> <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
In-Reply-To: <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 4 Apr 2024 09:57:18 +0530
Message-ID: <CANAwSgSftb3KkXvzNyGGixVtK8SWcOYjxO9WWpLt-B3mf_B6tg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240403_212736_709304_984E8F39 
X-CRM114-Status: GOOD (  26.07  )
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

On Tue, 12 Dec 2023 at 18:47, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Tue, 12 Dec 2023 at 18:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 12/12/2023 13:51, Anand Moon wrote:
> > > Hi Krzysztof,
> > >
> > > On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >>
> > >> On 12/12/2023 12:37, Anand Moon wrote:
> > >>>
> > >>> Here is the list of warnings I observed with this patch
> > >>>
> > >>>   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> > >>> /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > >>> hub@1: 'vdd-supply' is a required property
> > >>
> > >> You always require the property, but it is not valid for some devices.
> > >> Just require it only where it is applicable (in if:then: clause).
> > >>
> > > I had already done this check many times before.
> >
> > I don't ask you to check. I ask you to change the code.
> >
> I have tried this and it's not working for me.
>
> > > my v6 original patch was doing the same and it passed all the tests
> > > but since I updated the required field it not parsing correctly.
> >
> > Your original v6 patch was different. I don't understand what you are
> > trying to achieve. Or rather: how is it different, that my simple advice
> > above does not work for you  (as in the past you reply with some really
> > unrelated sentence).
> >
> Ok, It's my poor English grammar, thanks for your review comments.
>
> > Best regards,
> > Krzysztof
> >

Any reason this device tree binding got removed,I cannot find this file
Can not find the commit which removed this file.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/usb?h=v6.9-rc2

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
