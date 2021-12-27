Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65779C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLuuieB2UmlSEiMFmrjkI+VENqDPGAMNj3kxgi2cFXA=; b=0nkj++bP7wGhxs
	maf5qCROD+Mxs0qlC+/vecC9A4bs41Kg2bO3F7yRgQneFislWaQDrMGhSiIOdjmIaRQG4E5q6S707
	+MtaLPn53rMaHFyBlxuJvZNNo8n4Sxidt/xx/Pi1jZv8VGDm9QunO3Id+bKFB49NtFKtcfmWirgZ4
	2P28kfdZCl5SiDw8tO79lzviLNZbEMJQsulQ0uyDJItk4h3sEv26IPo+X9jlYCShN+xfEVmRDV56E
	EhKZgnvFUOMmoukOOs7x0gNU05BQFdDNEScnpt2eC0dqfDDfcs8R+sH0//wJJC3/tEWIzIOFk+6co
	ChV3g88+zeEMCDzBxp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1jvo-00GHha-OQ; Mon, 27 Dec 2021 06:56:28 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1jvc-00GHfS-Du; Mon, 27 Dec 2021 06:56:17 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 27 Dec
 2021 14:56:09 +0800
Message-ID: <e041c9ed-ff42-a7e7-2fc5-03c96cc69a88@amlogic.com>
Date: Mon, 27 Dec 2021 14:56:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3] tty: serial: meson: add UART driver compatible with
 S4 SoC on-chip
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-4-yu.tu@amlogic.com>
 <CAFBinCB9Fre9Lea2CAm_8o8g1e3o8oX4ZONbN_bhykNXoFHDdQ@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCB9Fre9Lea2CAm_8o8g1e3o8oX4ZONbN_bhykNXoFHDdQ@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_225616_530296_96D79FF0 
X-CRM114-Status: GOOD (  22.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,
	Thank you very much for your reply.

On 2021/12/25 1:25, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hello,
> 
> On Tue, Dec 21, 2021 at 8:17 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>
>> The S4 SoC on-chip UART uses a 12M clock as the clock source for
>> calculating the baud rate of the UART. But previously, chips used 24M or
>> other clock sources. So add this change. The specific clock source is
>> determined by chip design.
> Does the new S4 SoC use an external 12MHz XTAL or does it use a 24MHz XTAL?
> If there's still a 24MHz XTAL then I think this description is not
> correct - at least based on how I understand the UART controller.
> 
The S4 SoC uses 12MHz(UART_EE_A_REG5[27]=0x1,the bit is set in romcode). 
This register description is the same as the G12A and G12B you know.

> SoCs up to GXL and GXM had an internal divide-by-3 (clock divider) in
> the UART controller IP and an external 24MHz XTAL.
> This was not configurable, so the clock for all baud-rates had to be
> derived from an 8MHz (24MHz divided by 3) clock.
> 
> With the A311D (G12B, which is still using an external 24MHz XTAL) SoC
> the UART controller gained two new bits - with configurable dividers -
> according to the public datasheets:
> UART_EE_A_REG5[26]:
> - 0x0: divide the input clock by 3 (meaning: this internally works
> with an 8MHz clock)
> - 0x1: use the input clock directly without further division (meaning:
> this internally work with an 24MHz clock)
> UART_EE_A_REG5[27]:
> - 0x0: use the clock as configured in UART_EE_A_REG5[26]
> - 0x1: divide the input clock by 2 (meaning: this internally works
> with an 12MHz clock)
> 
> While writing this email I did some investigation and found that
> UART_EE_A_REG5[26] is used in the vendor kernel even for GXL and GXM
> SoCs.
> So this probably has been introduced with the GXL generation (and thus
> is missing on GXBB and earlier SoCs).
> Also UART_EE_A_REG5[27] seems to have been introduced with the G12A
> generation of SoCs (not surprising since G12A and G12B peripherals are
> very similar).
> 
> Does the UART controller not work with divide-by-3 (as we have it
> today) or are these configurable dividers to reduce jitter?
> 
The UART controller can work with divide-by-3.
The chip history as you described above, the current reason for using 
12MHz clock is really what you call reduce jitter. The UART mainly 
connects to Bluetooth and uses typical baud rates of 2Mhz, 3MHz and 
4MHz, so 12MHz is used as the clock source.
> 
> Best regards,
> Martin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
