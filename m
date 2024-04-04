Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB74CD1284
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 06:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTsG35x09861Kwq4852pdbAM+5RnTbWRCDljLbu2hAY=; b=cC6zwrpRMWP7+0
	Nx5VG3e0AAr1jyCHgsI4H+kQEe40itpsQRYrVlmCETm97e+si0NWpu4VjGYKALJrq1g+M+krhAuCS
	qoTzqN0t7HwLk3cNQ4ZbwLv/RdSoHZSP/SKZ1eii5C2WZohYCaJan/+xBYjhR+JvRpH5F3QvqPo7e
	KA1dO2DVY8ocMEr9POOw9mlWvW3Ns8COWUeNa6kuzsKd1ymoeiqOY4MBJyPF/beLTkq80iMFtAPlH
	8Wcpf3qCR6eP2bTMoLrTyhIKeXafLs0zqy0RkKu5/aZS3oFdaen4T8QpKu9iZ02wRg+vCS+/h5Hi3
	hK/yLvX3j6xPVSEpj4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsGg9-00000001StW-0Y5Z;
	Thu, 04 Apr 2024 06:34:29 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsGg6-00000001Ss7-1OmL
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 06:34:27 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a4a102145fso372802eaf.3
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 23:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712212465; x=1712817265; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQhelsDTj1UznWewSHonFFvxGfv5FQP2z0tCUi3eH7Q=;
        b=RO6u0IRwBDCWQbj2FBvQXekTnIXlWA8c93u4bmY8gpiVRVVFphTuKN3tWOr/3Ab0xg
         uYRreVbs4i+qi0oFlDmBVQaQR7bHiUfSXTHzbJ7ONUOWoV+aY7EiZArcAAUeWIYFnSjG
         Vq2AhVlgKeQjcg3yUeYkcUwyXyNMerG7HGwpwBLg60o2LpHW0/DQwDt/VpqiSRPtKY1C
         TRN59blUMgc/5tsBJEvNMFr8jKHI0/9DfrkXA9S4rxU7nfk5Ue5Uqduz5EYf9hhvEgWY
         FuKr4q+bjwk/8Opqtw1mtUtXLlJLpvDPGovfONtYJ7FrQwwOrB9rTxyOwxcPcd0K/eq9
         jX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212465; x=1712817265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQhelsDTj1UznWewSHonFFvxGfv5FQP2z0tCUi3eH7Q=;
        b=GnEnxmcHbhJr7uopmVIO20E43qodKy3GCgwpLpSkaztdTydFnfKrfwQQXfbgjbsRSw
         We293CTEX0TfYvwl7LsDRbSgJfE7Zm9fiAefPgGLPgpOsmWoUD5g5X6H27148PoGSGNH
         Z2tDWF6c4ptc3wPjdf2QNfKJgDay3DuVQJLL6HD7kSXEAi5fvOr79aL+vF7CdE2ih2PG
         WrEGv2SpFvAsaynehwSRaLezh2G/pFcRnheNTGDNVO6kCE9Cb0ZU3/gwwguC8CdML+jM
         uvGX7N/Omb/C98YNyzWchDkexI+aEVVvf5/qA73/afTCg8K7LVG9LZhAXhk/KtLNLh+y
         lTNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvRPDhUX0JMY5ZoVcYP47l0r1GvfbOW5iPT5jAPEiKibv5jXSSaXwD/f1100TJ0W2JiPxVF+em5S4XvpoTGpJuB+3OicbjUpwDohqQgS+2a3A=
X-Gm-Message-State: AOJu0YxJJSQfFZb2H0UWbJQPT/3UWiuJFigC6GFlqxBCFIcUNpixJhhq
	9/wHLs/LfRqiaeMlPa2fko//OBc8ej27gtTbUieluK4jXlGH1fV/FYKorv/cBBo5WuliyZVENnt
	LA4WwaZtTWn3WchNNQqM9FbefTHY=
X-Google-Smtp-Source: AGHT+IEsuEN+i0n5eZx7glAwKTp1CRGVOa+m4T3Vrw7L0OzIBSke73D8YUDUXutRJgKSqj+TavU7BaByldSY86uphMc=
X-Received: by 2002:a05:6820:260c:b0:5a5:2553:5036 with SMTP id
 cy12-20020a056820260c00b005a525535036mr1454823oob.9.1712212465090; Wed, 03
 Apr 2024 23:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org>
 <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org> <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
 <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org> <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
 <CANAwSgSftb3KkXvzNyGGixVtK8SWcOYjxO9WWpLt-B3mf_B6tg@mail.gmail.com>
 <194aa24c-2763-47e2-8ccc-1637d299c1ba@linaro.org> <CANAwSgR4zwoHUZRFmbjV9Z5kX9P_bU=HjkUokZm3eNStPXwwOw@mail.gmail.com>
In-Reply-To: <CANAwSgR4zwoHUZRFmbjV9Z5kX9P_bU=HjkUokZm3eNStPXwwOw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 4 Apr 2024 12:04:09 +0530
Message-ID: <CANAwSgTTpJ5wiwGFHmkUTX9zyzCYaRh=2bGPBo6H8KFznmksxw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240403_233426_402479_95851D31 
X-CRM114-Status: GOOD (  27.82  )
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

On Thu, 4 Apr 2024 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi,
>
> On Thu, 4 Apr 2024 at 11:42, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 04/04/2024 06:27, Anand Moon wrote:
> > > Hi Krzysztof,
> > >
> > > On Tue, 12 Dec 2023 at 18:47, Anand Moon <linux.amoon@gmail.com> wrote:
> > >>
> > >> Hi Krzysztof,
> > >>
> > >> On Tue, 12 Dec 2023 at 18:39, Krzysztof Kozlowski
> > >> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>
> > >>> On 12/12/2023 13:51, Anand Moon wrote:
> > >>>> Hi Krzysztof,
> > >>>>
> > >>>> On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
> > >>>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>>>
> > >>>>> On 12/12/2023 12:37, Anand Moon wrote:
> > >>>>>>
> > >>>>>> Here is the list of warnings I observed with this patch
> > >>>>>>
> > >>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> > >>>>>> /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> > >>>>>> hub@1: 'vdd-supply' is a required property
> > >>>>>
> > >>>>> You always require the property, but it is not valid for some devices.
> > >>>>> Just require it only where it is applicable (in if:then: clause).
> > >>>>>
> > >>>> I had already done this check many times before.
> > >>>
> > >>> I don't ask you to check. I ask you to change the code.
> > >>>
> > >> I have tried this and it's not working for me.
> > >>
> > >>>> my v6 original patch was doing the same and it passed all the tests
> > >>>> but since I updated the required field it not parsing correctly.
> > >>>
> > >>> Your original v6 patch was different. I don't understand what you are
> > >>> trying to achieve. Or rather: how is it different, that my simple advice
> > >>> above does not work for you  (as in the past you reply with some really
> > >>> unrelated sentence).
> > >>>
> > >> Ok, It's my poor English grammar, thanks for your review comments.
> > >>
> > >>> Best regards,
> > >>> Krzysztof
> > >>>
> > >
> > > Any reason this device tree binding got removed,I cannot find this file
> > > Can not find the commit which removed this file.
> >
> > Use git log.
> >

I got confused with the file name and my local changes.

> > Best regards,
> > Krzysztof
> >
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
