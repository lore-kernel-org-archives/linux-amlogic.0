Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC986C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdmUsLILPX8neKD0bb3c/MrNXgoD47MrY+D2SSsH99Y=; b=ZAz4FY4MclbLWc
	1KwYrM57omWEvmvoluvQULzS0ln0+FymtIwtfccHufQbwW+wUnnCBtGE3B5Q1rsiGe2NEqKaRgmDJ
	X03veaTbvz7Clo3zPxPssgVRmcoxLEFug2QeV/+muCg6362pY2xthGuQBznvUfnMggLFuirIH5c39
	afeyn6nsI/bQFLrrNh2GkJgrR8DkQAWlJXNDHcPJi4jMxeDYvTs1PkEhLQpjvMkWDWgxfTw48pjXd
	Pw5Cduvex1JT1egbDEqlaKbvIfzDOwqLKEp3BijQhsmqjv4AtBEDlxMjxwm+3JcYnrERo3w7f13do
	v9YabH58+1UqNLj0aQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2eD-00BmGy-01;
	Tue, 12 Dec 2023 13:18:05 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2e9-00BmE4-14
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 13:18:02 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3ba0d0a72dfso821640b6e.1
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Dec 2023 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702387074; x=1702991874; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vejtt1vJmeMimDpZjsg0bJpa54Rp+HdUAmtTiNxdWkk=;
        b=Kih4ZOOyfHc77S3rYYTNFrZpyn7A1lZBzeQJq1uQPlxVBqL8MmShZgLeUw/67l+5ej
         rev38KIMZ4GdHvvhSLoO0YFnmS6Tbd2kkSYJszD4pyU/cETMfisem1MgpvWIwTzcNxJ6
         XbyIcUbp3A6ERDJLBFVaftKJOdc2IT+Mwv9sI9ibjgo3tXesNOdW1jtAtC3sNvg8RNvr
         ecyF19jwzewL0UoGRXCh6GL/12M4MjkIf2R/kkXMvG8qSkyodk/+w3zdQ3NSYSS1rvtk
         Ky7WeCiLC0Vf7gYX9vJDaX9fLc/i0rRSxZqb76lYADgZv4OHojgMleWP3QTEJZX/HF8y
         BgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387074; x=1702991874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vejtt1vJmeMimDpZjsg0bJpa54Rp+HdUAmtTiNxdWkk=;
        b=wLyMYJ7Z7R+h0mDM1tqy0+7GDZSgDwI3XQ9kskyuNuSR4wsFsvw8oAz9OElwtdY2n2
         pn2j8ahiDV49uH2j4eaI6UDeBFQ+yeZEye9NIiLG5OyVH7Lz84oSBJayAIU6kc2qlrbA
         vHxqPLCwwP78KN2H673IIaj/1T3X8qON3PZ0NmUW1PKeJUvsoHyXxM3hEobkwoRcx7cr
         1xlBapykfYgYR+E2y/HU76IT9PmttgM2sZJ49ewfRUR5Q0baUhRjvc9uOv3FoYHaG1i2
         Eizwh1QTsuZ04rOmp+/6EGXWuO4L0wrh6glQmV34ZwUpdZM1yFBOq9HFO7P+N5+9CO2g
         BP/Q==
X-Gm-Message-State: AOJu0YxCyBuWv/5NCWuRTX/5dox1KOUuDihZVt+9s/vc9nVWoIZ3h7z+
	zRy4FOcgOqgbNXJwQKiJzdTRy2c24//qg3XcZj8=
X-Google-Smtp-Source: AGHT+IHoT69UI/fJcUDrTHSTsHf974x8+i74FuoPvmebaK+30qyesiiJ+/Gf8J71fqPi/ux1J3g5Tm9RK2/uT3xBdJo=
X-Received: by 2002:aca:1908:0:b0:3b9:dd3d:f606 with SMTP id
 l8-20020aca1908000000b003b9dd3df606mr2844499oii.14.1702387073703; Tue, 12 Dec
 2023 05:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org> <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
 <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org>
In-Reply-To: <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 18:47:38 +0530
Message-ID: <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231212_051801_369879_F52DC54E 
X-CRM114-Status: GOOD (  22.23  )
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

On Tue, 12 Dec 2023 at 18:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 13:51, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 12/12/2023 12:37, Anand Moon wrote:
> >>>
> >>> Here is the list of warnings I observed with this patch
> >>>
> >>>   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> >>> /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>> hub@1: 'vdd-supply' is a required property
> >>
> >> You always require the property, but it is not valid for some devices.
> >> Just require it only where it is applicable (in if:then: clause).
> >>
> > I had already done this check many times before.
>
> I don't ask you to check. I ask you to change the code.
>
I have tried this and it's not working for me.

> > my v6 original patch was doing the same and it passed all the tests
> > but since I updated the required field it not parsing correctly.
>
> Your original v6 patch was different. I don't understand what you are
> trying to achieve. Or rather: how is it different, that my simple advice
> above does not work for you  (as in the past you reply with some really
> unrelated sentence).
>
Ok, It's my poor English grammar, thanks for your review comments.

> Best regards,
> Krzysztof
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
