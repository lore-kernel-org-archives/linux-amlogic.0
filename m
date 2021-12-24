Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2076FC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaTBSkh9b78aNFI6i8OsN09xu7IZfRlgG/JjsLU0ACg=; b=C9fwxuoKtNfTar
	pR4SNvBDUni9jqJMInIWuZyumo8pUa08EtZyS5EPQX2yRq6d5lDi4D/HpFqGlmw5sfOzXx1Nmsl6q
	zvni0eOOc43tsv1gWQgbrg8RllOujlYbtVJTlFGwv31DJzngs3cB3ssyN8QAKsqNliwwjX+4gV4Et
	Q5Q2SOk6Fnw67Ed4SqaPlBLQ3/5ASiX9l9A9/9xP2GMQx9GckytlJrreo+4OK8b5ynB3PiMK401Q1
	zn4CgkoQ9c/5StrfkJ0iEToFdeahBD44X3lVchzVXCUXYhTp21h9w4e7c2JA7W9sz53aU1HyqLxxs
	RAD2zPiKgKiz6h7rsS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0oK8-00EMVn-15; Fri, 24 Dec 2021 17:25:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oJw-00EMUr-Co; Fri, 24 Dec 2021 17:25:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id j21so35490822edt.9;
 Fri, 24 Dec 2021 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KuTjgwH+FkGjo+0kMKflsFHxsvKi/rJpxLiasu7mx6s=;
 b=XgjIkn8UkAuY6SKls/ZiprFT8L25uAkSS2Fl7njQ6bhReHWtRg4YJlbrGqtFzC6I1b
 7HBzqm+ebPYhziN0O4UCyMK7fTEN8OKXl2H3Y1HLHVGj1DJel9qEcOrC5JH65te1FAnh
 +jW1lzQAo8a4tf/VKygxgy2v4buur1E5bOj/YQ0NuXjw/IWE8kgLcvsF2U6X2h2tzSO8
 p5iGKS5PXHxk10WO0YERCXSowiFDL0d1aZVhlSNIJY9FnYQVb8vwjfLv6WFMEFCBzCm6
 m41+kRehH9mV3DtnfTYhD2EjnyVoJIrOyUqyHC0bB+yueY2Wytq1wY+8Rw9dg2VTKVHk
 YpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuTjgwH+FkGjo+0kMKflsFHxsvKi/rJpxLiasu7mx6s=;
 b=H04E2pUuQBLUkf78fpASEMV2suUmBKDmFEwWSa+Gw3YwIuH+OgYswYl9oAGsEXnpOk
 qmDc6Ub9LGJdjMjOMm9c3rggneVMZ9U5XZ4j680ikEky8CzI9qoqvwKag88yyrE9CGXY
 TlZPoH9DZDK8vxAsU8u4+DaqXqFX/bSlbl2GRZbiIEAyXeVdqiinu6AZnZaRdXrOCJaV
 c/24jE/5sfDLfSLqWs4Yb0KmL41NHTQobs0rcT284dCuoiS4ygLFmN1w0BK+BRN26e8x
 ETw5j4ZKbCPTVWbz/3uMZxIKz/Ppb2LFgEJ4RQKFd4hrnu9jat14cyYjRKgUDWj/AT0l
 ZgmA==
X-Gm-Message-State: AOAM531cw7PZ8W+CJCMhim9YND4gIr9VS1YFm4FtEWm9WJQg6bE5HmPN
 CI7YKVcQHaKGMtvJ+ArQfa0jTRw6IdZE12E1S1M=
X-Google-Smtp-Source: ABdhPJyc11+JkPEMQT+pTLoJD1KWuqfTAVmfOBMYnWwmWHpeCkyvXdY+D4MjyEu7TuPIWvnKfD9bf7bg0cpi1GLK8GI=
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr5924684ejc.147.1640366729650; 
 Fri, 24 Dec 2021 09:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-4-yu.tu@amlogic.com>
In-Reply-To: <20211221071634.25980-4-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 18:25:18 +0100
Message-ID: <CAFBinCB9Fre9Lea2CAm_8o8g1e3o8oX4ZONbN_bhykNXoFHDdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] tty: serial: meson: add UART driver compatible with
 S4 SoC on-chip
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_092532_480666_1843EA7E 
X-CRM114-Status: GOOD (  15.09  )
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

Hello,

On Tue, Dec 21, 2021 at 8:17 AM Yu Tu <yu.tu@amlogic.com> wrote:
>
> The S4 SoC on-chip UART uses a 12M clock as the clock source for
> calculating the baud rate of the UART. But previously, chips used 24M or
> other clock sources. So add this change. The specific clock source is
> determined by chip design.
Does the new S4 SoC use an external 12MHz XTAL or does it use a 24MHz XTAL?
If there's still a 24MHz XTAL then I think this description is not
correct - at least based on how I understand the UART controller.

SoCs up to GXL and GXM had an internal divide-by-3 (clock divider) in
the UART controller IP and an external 24MHz XTAL.
This was not configurable, so the clock for all baud-rates had to be
derived from an 8MHz (24MHz divided by 3) clock.

With the A311D (G12B, which is still using an external 24MHz XTAL) SoC
the UART controller gained two new bits - with configurable dividers -
according to the public datasheets:
UART_EE_A_REG5[26]:
- 0x0: divide the input clock by 3 (meaning: this internally works
with an 8MHz clock)
- 0x1: use the input clock directly without further division (meaning:
this internally work with an 24MHz clock)
UART_EE_A_REG5[27]:
- 0x0: use the clock as configured in UART_EE_A_REG5[26]
- 0x1: divide the input clock by 2 (meaning: this internally works
with an 12MHz clock)

While writing this email I did some investigation and found that
UART_EE_A_REG5[26] is used in the vendor kernel even for GXL and GXM
SoCs.
So this probably has been introduced with the GXL generation (and thus
is missing on GXBB and earlier SoCs).
Also UART_EE_A_REG5[27] seems to have been introduced with the G12A
generation of SoCs (not surprising since G12A and G12B peripherals are
very similar).

Does the UART controller not work with divide-by-3 (as we have it
today) or are these configurable dividers to reduce jitter?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
