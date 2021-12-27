Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09465C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDf7k8rE4vYfCQ4vRl5u8V83HziVNJrER32bv50hY8Q=; b=s5J3Sf8vUzwb7J
	Tsz8Xet33OWino2Nw6FdVc7YbaC/mlLA6QqDsFpotCDxmYixfhpefvy6NITl28Wdk43H5oA1wFTFD
	fkaIFm7kq44FFKW6okJzUWD1BnKoTejDpXgAEqElz/7up35CoDj+ItkNIM/N/rIEMmbZMomHxrwzu
	3+7U0WjRCvG41tBH9LiAQFaGvqgt5UBQT57d29O+xScQGpbK9mqNW4bUobg614dTtVB1uIEcrxv6+
	KFTVz5aLcFBn/MenUtsNoW5gsIqXWMyA36XswSmI96EKANO8P/mdtqP3/T+ba4h19OXVl7XpMqZCZ
	FwEubAts0Fsr4vHoaGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1oho-00Gbay-Ge; Mon, 27 Dec 2021 12:02:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1oha-00GbZZ-JV
 for linux-amlogic@lists.infradead.org; Mon, 27 Dec 2021 12:02:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id i22so31855061wrb.13
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Dec 2021 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=xkc8SKUPYzJLLeRWgMJMh/IdK4g8gIh52fq2aT0Flxo=;
 b=oub0ntE58NXbt0tUZ2DHgu52WmkJ96Px7RyPUiH/Q45xLY2pW6tqCIrZOujPWVEzip
 fmZ8HNj4/G9CwhZm64IyN/9lOnt7u4Wn+nKhXvT0c/6TewDOwDV38imcK3WJCCn4YLD3
 EdWbW2Bu3oAXUq4gNLAEiy7K7SC1Xma3Vd6h7SKl5GhLpwiCRQETLHE+djyrpmNtHzGG
 zOBzfZhd8a7t3ukuk8WbAyTuv+b/MtiDXCXSxnWcOno87kAko0jEM74W7lkWPLPgcZ0v
 1L95fmZQsBt5tQTjK99nRjr5wApbKevpvSRTcGjtefn3S0gJeq3RE/mMaYfdj6W0EVg5
 Gqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=xkc8SKUPYzJLLeRWgMJMh/IdK4g8gIh52fq2aT0Flxo=;
 b=p42Klj7AjfVWlUpEBjsmNYwYkt4ePQuNZnfUSbQz0Df5gv3C75Zjnhdqgf8bhL14Ul
 GN6rOhTVbC9ZaPnqvVPi6BswCL1HqfG1F6F9XsoAti2CbunA2kJHD63+wNnQys6+DWnE
 QBgEKmxL2AouHupdxWwgm+F/1wnH2IVklkdIgxw9GAthQe592K6WMzf1okzMIimcdYZF
 ljqHNEh8CcS7Tib0vyauMKN6haZd8hvEsKxNhU4/v7kFophKKn+eEwPXo0rQwykQcsft
 oRpnFwA41d0fWS7U/km6NCmwQD9J4r53uX0dvjexFSPaJ970t4ul0tYtLJ8abZH7eQ0o
 DUbg==
X-Gm-Message-State: AOAM531GFjrZJLibMs6z/8XTGRr7S3SZIM8cr3blO41QdexmM6STj6xs
 aHLXOl8y6byjX0nNnD5+p1cwtA==
X-Google-Smtp-Source: ABdhPJyK3jVzmRJ1bHzkXpI+GlgYyNXvk0veyzs681rdxTKfvgfVYTo9TD5WLJ8FwhhUNcM2Rcq/FA==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr12549749wrc.141.1640606523406; 
 Mon, 27 Dec 2021 04:02:03 -0800 (PST)
Received: from localhost ([2a04:cec0:10c6:6fed:3056:9d74:5100:5bd5])
 by smtp.gmail.com with ESMTPSA id v1sm17460961wru.45.2021.12.27.04.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 04:02:03 -0800 (PST)
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-4-yu.tu@amlogic.com>
 <CAFBinCB9Fre9Lea2CAm_8o8g1e3o8oX4ZONbN_bhykNXoFHDdQ@mail.gmail.com>
 <e041c9ed-ff42-a7e7-2fc5-03c96cc69a88@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 3/3] tty: serial: meson: add UART driver compatible with
 S4 SoC on-chip
Date: Mon, 27 Dec 2021 12:58:34 +0100
In-reply-to: <e041c9ed-ff42-a7e7-2fc5-03c96cc69a88@amlogic.com>
Message-ID: <1jzgomz26b.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_040206_744694_0ED20307 
X-CRM114-Status: GOOD (  25.21  )
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


On Mon 27 Dec 2021 at 14:56, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Martin,
> 	Thank you very much for your reply.
>
> On 2021/12/25 1:25, Martin Blumenstingl wrote:
>> [ EXTERNAL EMAIL ]
>> Hello,
>> On Tue, Dec 21, 2021 at 8:17 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>>
>>> The S4 SoC on-chip UART uses a 12M clock as the clock source for
>>> calculating the baud rate of the UART. But previously, chips used 24M or
>>> other clock sources. So add this change. The specific clock source is
>>> determined by chip design.
>> Does the new S4 SoC use an external 12MHz XTAL or does it use a 24MHz XTAL?
>> If there's still a 24MHz XTAL then I think this description is not
>> correct - at least based on how I understand the UART controller.
>> 
> The S4 SoC uses 12MHz(UART_EE_A_REG5[27]=0x1,the bit is set in
> romcode). This register description is the same as the G12A and G12B you
> know.
>
>> SoCs up to GXL and GXM had an internal divide-by-3 (clock divider) in
>> the UART controller IP and an external 24MHz XTAL.
>> This was not configurable, so the clock for all baud-rates had to be
>> derived from an 8MHz (24MHz divided by 3) clock.
>> With the A311D (G12B, which is still using an external 24MHz XTAL) SoC
>> the UART controller gained two new bits - with configurable dividers -
>> according to the public datasheets:
>> UART_EE_A_REG5[26]:
>> - 0x0: divide the input clock by 3 (meaning: this internally works
>> with an 8MHz clock)
>> - 0x1: use the input clock directly without further division (meaning:
>> this internally work with an 24MHz clock)
>> UART_EE_A_REG5[27]:
>> - 0x0: use the clock as configured in UART_EE_A_REG5[26]
>> - 0x1: divide the input clock by 2 (meaning: this internally works
>> with an 12MHz clock)
>> While writing this email I did some investigation and found that
>> UART_EE_A_REG5[26] is used in the vendor kernel even for GXL and GXM
>> SoCs.
>> So this probably has been introduced with the GXL generation (and thus
>> is missing on GXBB and earlier SoCs).
>> Also UART_EE_A_REG5[27] seems to have been introduced with the G12A
>> generation of SoCs (not surprising since G12A and G12B peripherals are
>> very similar).
>> Does the UART controller not work with divide-by-3 (as we have it
>> today) or are these configurable dividers to reduce jitter?
>> 
> The UART controller can work with divide-by-3.
> The chip history as you described above, the current reason for using 12MHz
> clock is really what you call reduce jitter. The UART mainly connects to
> Bluetooth and uses typical baud rates of 2Mhz, 3MHz and 4MHz, so 12MHz is
> used as the clock source.

Looks to me that the clock divider above should be modelled properly
with CCF. If you wish the initial Romcode setting to remain untouched,
then don't put CLK_SET_RATE_PARENT to stop rate propagation.

CCF will figure out what the internal rate is. You don't need to device
tree data if things are done properly

>> Best regards,
>> Martin
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
