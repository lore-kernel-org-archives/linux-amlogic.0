Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC6FCD1297
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8lb7/Od8MPRA/yyDgxQwI7Wb51n8xuSo9iUrGlmEB0=; b=mbeKNSb2neV8mz
	lhuHTuw5fAxmyAURhBBy0o8qoRInPAyBy5OjzSur0z0Qm5fbHRXWqaULinu7ac7oI1RojHtsefLpR
	1nRL9MJYWoTA4y1zqZaCpNWkIqBv14ftV7oh8PrgYFu2LpukcF3ecPluhiCFBep4s5L7/3mpSGskL
	HVLnQK5/6UoTa7UGVocoQmql/iUZ9GFZIZkCXDxCzGp8jOX+TZHBhw7selB1LgKgTMut5222O6bED
	K38klSzdIdCTL4Th0qXDdj6RDp2pOA8lhbyLYZ0DLsjNwEHvtZ7OR8GuEPJf1Ft0wEhXBZfFJL/Qj
	kXkEFf4FQA2Lj0CskUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsGei-00000001SbS-3yL0;
	Thu, 04 Apr 2024 06:33:00 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsGeg-00000001Sag-1wIc
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 06:32:59 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5a550ce1a41so384825eaf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712212374; x=1712817174; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj7mtPwxXeiOI90eJ23PpfoAYasKt78w/08LA9L6e0M=;
        b=PgeM4tbkK7znaIzY6E5qy2HZeyUGdC1amjMVpiBIR4STzOEdGW8lb7XGG652Gn2qOc
         /wzuISL6tO1B97dHNj83JAyXz9n+4cSGnRbN9aM25DAskOZ26S9Q9kswa0DZhzd/Hpim
         2f6EgRfBGYK9yCFw73ec1xnl+dqv1fxEFnVbWco4q39dinHmJ2CKR49ZZpbc/nnTcmBF
         2UZD0DWR6Rj3hXckCZFhFX3LcDONMsRc7o1fFMtXTrMDpSfUXTX2gKLDnJrv88kd5E2h
         RRyAa/Z2V2tl0lb4nbM4WPY35QP5T+XrsjxLLpxtKwJEIr1fry5IjH/rMes1DbZ0FOwu
         l80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212374; x=1712817174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pj7mtPwxXeiOI90eJ23PpfoAYasKt78w/08LA9L6e0M=;
        b=iJ+3rVld7EDtEfWUiopiE55FOFRzyAzlyNfq/lrUYYOX/X06oCW8QRhOa3tLlEG2ee
         m1pVt5UGJhDCTDLzFJMwPW8XeGuSVoOJOSgFYIdloEw4TAiV1MNW9smEKcUIlGf4/FOU
         ziY4Rrv8IdO+tOQlYhFTZUIK4xWGdLWZyv0c6NrIiT7FP5TK5WBSENMs2YtLUUr6RTZr
         PR6htLwOaWVzdgSbk4+kz9LPj8IyCajcfjoBSkc5ndsZBVbpdpC0QWBOcri2CI87xK0X
         IIG0qi9bVcUK5/fd3VtCPuKqicPKfbSqTMxbfNr8QaRzHYlPNEAVvwDym7qrbB6Ju4Np
         JFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwhWs8AMcv1zseyXy80zMVpLPLYKVKQU1rS7wVDRnnkkwf16b0U4TIIxyZu50xxwkMOKXFehnSrcEhXK4If0dnJSY2FERTgu3ER8U3Zr0p/1o=
X-Gm-Message-State: AOJu0YxGMvTthGI8jQfabMjv1n7r3UoJXSkvmYIDeq+a+Wx13n5XOV3n
	w4lMB7cBwv5Ibvaah+/P4J849/kkSzpDzy6AgZmSEOC/2mqofw38Dr5ZRhgWQPkGi2hnRJi1VQv
	CDFJ1ehxfsPgc0L6fKwoAC89lWlo=
X-Google-Smtp-Source: AGHT+IFU298ki3F3ZIF233kDIl2xjoKCe2Kx7EDWtmHBMuzJsoYktNQbuUmvSvqD56FK9wSDx2qlDBlYsnmJPqqGGrg=
X-Received: by 2002:a4a:e911:0:b0:5a7:afa0:4a0f with SMTP id
 bx17-20020a4ae911000000b005a7afa04a0fmr1532139oob.8.1712212374215; Wed, 03
 Apr 2024 23:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org>
 <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org> <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
 <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org> <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
 <CANAwSgSftb3KkXvzNyGGixVtK8SWcOYjxO9WWpLt-B3mf_B6tg@mail.gmail.com> <194aa24c-2763-47e2-8ccc-1637d299c1ba@linaro.org>
In-Reply-To: <194aa24c-2763-47e2-8ccc-1637d299c1ba@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 4 Apr 2024 12:02:38 +0530
Message-ID: <CANAwSgR4zwoHUZRFmbjV9Z5kX9P_bU=HjkUokZm3eNStPXwwOw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240403_233258_579986_F29A8875 
X-CRM114-Status: GOOD (  24.16  )
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

Hi,

On Thu, 4 Apr 2024 at 11:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 04/04/2024 06:27, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Tue, 12 Dec 2023 at 18:47, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Krzysztof,
> >>
> >> On Tue, 12 Dec 2023 at 18:39, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>> On 12/12/2023 13:51, Anand Moon wrote:
> >>>> Hi Krzysztof,
> >>>>
> >>>> On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
> >>>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>>
> >>>>> On 12/12/2023 12:37, Anand Moon wrote:
> >>>>>>
> >>>>>> Here is the list of warnings I observed with this patch
> >>>>>>
> >>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> >>>>>> /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>>>>> hub@1: 'vdd-supply' is a required property
> >>>>>
> >>>>> You always require the property, but it is not valid for some devices.
> >>>>> Just require it only where it is applicable (in if:then: clause).
> >>>>>
> >>>> I had already done this check many times before.
> >>>
> >>> I don't ask you to check. I ask you to change the code.
> >>>
> >> I have tried this and it's not working for me.
> >>
> >>>> my v6 original patch was doing the same and it passed all the tests
> >>>> but since I updated the required field it not parsing correctly.
> >>>
> >>> Your original v6 patch was different. I don't understand what you are
> >>> trying to achieve. Or rather: how is it different, that my simple advice
> >>> above does not work for you  (as in the past you reply with some really
> >>> unrelated sentence).
> >>>
> >> Ok, It's my poor English grammar, thanks for your review comments.
> >>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >
> > Any reason this device tree binding got removed,I cannot find this file
> > Can not find the commit which removed this file.
>
> Use git log.
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
