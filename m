Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16019C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D0C218D0
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pefHIe2F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qfSupxWO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D0C218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EKNZ7HnAlTCcO0skM+HzaQ7Z2t5teSG59miUZkwRPs=; b=pefHIe2FGprhHP
	vIhznHNQRvPX2KFoAv8XKy/PtxQAyvXEa+BKNDJRc2xXz8l0Hh7cN6ad61rS6M4Uyb9AaS1ygRM/U
	R9zauIniLqAPragss1rkzWBIlftKh8mzj5MkefWbZOOY7pNn6aUzg1cjvgNj8PURwmi4BX6Ioo2NE
	bGWEiogEdqYSZBK77bcFwdl+gIkXTPYvah/6f9JS+82+pgf1jey/+l9SjU62Gb33cLnkYVk99JN5a
	daKx1PIkeqDdt+gkkTqt1ShLXtE0a3v6pXDz0rHtrhKf9ZTCs/7A3zhOZyhhi19Hq36OlGOjC6xru
	pVb2TORM2FrhIMR/UpiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5Ha7-0004z4-At; Sat, 16 Mar 2019 22:15:07 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5Ha4-0004BJ-DZ; Sat, 16 Mar 2019 22:15:05 +0000
Received: by mail-ot1-x344.google.com with SMTP id g1so11387149otj.11;
 Sat, 16 Mar 2019 15:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1HQC+1IFkebVQL6B4ux1aetRkmn37CSNxrXUwZ6hs4=;
 b=qfSupxWOpePXZgmDGqlMKQpnQ6BCNYs5EaFL12fkrEF8xgrNdBIPlpG8EMsnQ0fjyL
 tk2jU+mcggy3DsJcxRiB3+GTEnsr2SnjYtS7WYF3oC49Dcma1V+Uta1fLbBEh9GzFkzq
 gcQoO8v3kAde3b5sNRZUyaQJ1tx84xhYzU5lLZICg+fi1O4owFxPu1JwoYmZee/Ufp29
 EgNKRbwCyhjiEYmSuj4BuIMZdrbd0GzMhw69LFe4Dh5nkppKO31JBl8SrxIgiqfJzmzh
 hgNnn3WFoMKlDQkIJCP5hsoASUuOUdcr6H22teVb0PLUL0juJxaS0eEV6XfA3fZP2d5C
 yLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1HQC+1IFkebVQL6B4ux1aetRkmn37CSNxrXUwZ6hs4=;
 b=Ej+7TZ2bF61pmpilQ504WMiaK6Dn6NL1Guavn9dTF+J7fY1V/i1aqKmM9PRi83SfCr
 xSy7gZghIq3//kak48s8orQIDJQJZqT2hq7xTb8+Ztqc3UeCU+N6yUKNjT94gllOZgY7
 cm/aXIAvXXMRbL7l4GJtbh59rsRaaDZOUumW4axoLp/dFFTfKDnZHHpdXmFrtRDu9rzS
 4cf9CdtTy23/If1X50ImrKHDn4l6gh/2xeYIacL5vqsxj0PZOyVIef7EHROhivHbTq0A
 q9e5jFz1FMXweKcBnMbzDxku6XqIaQndK5hI/uBq2jb3GbiLrhkkpZYyAVcSs/U4ivOD
 u0LQ==
X-Gm-Message-State: APjAAAVrB70U3pEJGDfXtmEA//dDXNJ//6DLTAsZLVPSrYFMt5U6hWYQ
 obilXRneuFEVgiLA2chvcez0gNmtkIzqvIlry3A=
X-Google-Smtp-Source: APXvYqwSI9SAC06hhXk5T+2abmVcsC94KUvyeKel9KPB30erL3BOiYVQncrvjS/00NnJkOpPK9c8ufRKphaMo7squik=
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr6498564otn.131.1552774502289; 
 Sat, 16 Mar 2019 15:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-7-narmstrong@baylibre.com>
 <CAFBinCAa+ZjxJi491_dG+kvLFPLFoLXHFZToGP8W1ECeeqOYVQ@mail.gmail.com>
 <5C8D099D.5020206@baylibre.com>
In-Reply-To: <5C8D099D.5020206@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Mar 2019 23:14:51 +0100
Message-ID: <CAFBinCBHiLjrwXA4jXSg3qnGa925r--Nj_RH7xUFqyTkYzhKGA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A,
 B & C nodes and pins
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_151504_487373_522B2098 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Sat, Mar 16, 2019 at 3:35 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> +                                       uart_ao_a_c_pins: uart_ao_a_c {
> >> +                                               mux {
> >> +                                                       groups = "uart_ao_a_rx_c",
> >> +                                                                "uart_ao_a_tx_c";
> >> +                                                       function = "uart_ao_a_c";
> >> +                                                       bias-disable;
> >> +                                               };
> >> +                                       };
> > I'm fine with this part if you mention it in the subject and/or the description
> > uart_ao_a_c routes two pins from bank C (from the EE domain) to the
> > uart_AO controller (from the AO domain)
>
> Not sure DT is the right place for that, I think I'll remove this until
> we have it actually used somewhere.
I'm fine with that as well

[...]
> >> +
> >> +                       uart_C: serial@22000 {
> >> +                               compatible = "amlogic,meson-gx-uart";
> >> +                               reg = <0x0 0x22000 0x0 0x18>;
> >> +                               interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
> >> +                               clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
> > does uart_C really use CLKID_UART1? on GX uart_C uses CLKID_UART2
>
> It seems so :
> https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/arch/arm64/boot/dts/amlogic/mesong12a.dtsi#L1020
it's weird but we can always fix it up later if needed. so let's keep
it for now to stay consistent with the vendor kernel until we know
better

Jianxin, can you please check with the hardware team whether the
uart_C gate clock (pclk) is CLKID_UART1 or CLKID_UART2 on G12A?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
