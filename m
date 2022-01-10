Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA2BC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yMtPbP4psFcxak/U3VbZ1LB+DEf3HVl6eFOIX6XIt14=; b=sbydFBGN2TApWOCZ/7R2eAim2+
	dKEIBlPOaMo3DUPimxYbYmY1ztheHbBArSGt3wpgxxWcdb5ENvt8cESZ+f4FA7mjm/w29JYaWbQaj
	1MAeHknUDu8UHVOHDPTafWLEBS+6fWPiD4rFA88HFpD/9Zbx3wHlS5Z2PNzXUV7TmsdBz4BROKk73
	cQsfFx61S9FCjMtGe8B6+kN4pQBx4gxzBXvMTrey0rIp10iTc3EvdixOuAMUCmcEWTAk8ZU/P9wUH
	MTdWdOknLtjMiHKGz4ZbXAa4PS71zXVjhNyBzvrxIZhvqaz0GkWrwTre5NXw6lwW4J07bQxrUuuBN
	/Xxl7Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6r7m-00ATDx-8K; Mon, 10 Jan 2022 09:37:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qy8-00AN61-LR
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:28:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id a5so21537166wrh.5
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3JIe/AziNkL7QWWwzr2FGj9H5QSbDRRWwjLKOVDugLY=;
 b=4e/NgOncPGsI6zL82IKBGE3RBzWcjd1sdmMoSfIeMMq+biJ+zFQ12dPnmoHrSyF1xK
 2BkUZwWICKVO4SteHjvVLKvJB9ATXfg51nfZSwlQq77s9g/hwyC0nnsO+bgfBdq3Akoi
 9e9nLREII4Uc+KUJYMZIIrhyna9Auemz9XbYnL3XGgstSUhh8UVLVs7YFxTMgZ8G5kg7
 +wnIIgQQWV9Pgr6kXgJ1ZobbydhZ4DCcxn60Xesojt8EiL71Ks0IfMv5sJdgP4QmAfqC
 MZIoS2QQfVrwjuXnj/U8qkecb5Pt5ggMsicb56e2GCFt+t1i648g0w0JUmIQ/nARiuNg
 kYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3JIe/AziNkL7QWWwzr2FGj9H5QSbDRRWwjLKOVDugLY=;
 b=eudYpU/q5I1bzEh2SzK80MsOq6SnAeMHZ7RTBBlxPrdbtpzrVL83CQQqcJFT//U0ZC
 mF1O0aNwrfFAqV1aGHiaq6CBMni07mp+R7zc5JPO5ZFlqk8slIfodq3fQVvCz0RbSyx5
 TcI418nk0vs0VermgswNF2x8mON3Ms27/L/qd3NQRBiTmN3zhWAuRVOmxRzBOJPrx5Wf
 7lSaVACi6xdjD3toUVgv6XkFiw2iI/F1okhSkbeKrkmwEI8UuedoVGq53BOqcDI8vezW
 pUiUdqxNXQ6MDaSWgMe/H3eTr9ACiQHf7sZxccDuEgMeFBPsrqGAgqjRQe4oYixs5o40
 tfAw==
X-Gm-Message-State: AOAM533pao5eoQx8TTZ1m+cJ7FBUx2KiTz5YWNrDbk5CqM5c2fplzR4b
 VNCU/3ls5eF/D3739Xn5Fl1yxg==
X-Google-Smtp-Source: ABdhPJxif1cXTO0qc4AtrxnBYKdw1S+IGnZNRgcQM96lZpohEhKLaAGAuc9lRusoIkLi0vPyC0k68A==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr63539563wrz.127.1641806878077; 
 Mon, 10 Jan 2022 01:27:58 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id m6sm7068700wrx.36.2022.01.10.01.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:27:57 -0800 (PST)
Subject: Re: [PATCH V4 0/5] the UART driver compatible with
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110085604.18042-1-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1f4b9288-c7ff-c895-425c-187d058642b9@baylibre.com>
Date: Mon, 10 Jan 2022 10:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220110085604.18042-1-yu.tu@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_012800_784100_8C679E17 
X-CRM114-Status: GOOD (  16.08  )
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

On 10/01/2022 09:55, Yu Tu wrote:
> Using the common Clock code to describe the UART baud rate
> clock makes it easier for the UART driver to be compatible
> with the baud rate requirements of the UART IP on different
> meson chips. Add Meson S4 SoC compatible.
> 
> Yu Tu (5):
>   dt-bindings: serial: meson: Drop compatible = amlogic,meson-gx-uart.
>   tty: serial: meson: Request the register region in meson_uart_probe()
>   tty: serial: meson: The UART baud rate calculation is described using
>     the common clock code.
>   tty: serial: meson: Make the bit24 and bit [26,27] of the UART_REG5
>     register writable
>   tty: serial: meson: Added S4 SOC compatibility.

Weird, the subjects are fine in the cover letter but are all truncated in the email thread:
[PATCH V4 0/5] the UART driver compatible with
[PATCH V4 1/5] dt-bindings: serial: meson: Drop
[PATCH V4 2/5] tty: serial: meson: Request the register
...
Only the last one is OK.


> 
> V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
> discussed in the email
> V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
> the DTS before it can be deleted
> V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
> in the email.
> 
> Link:https://lore.kernel.org/linux-amlogic/20211230102110.3861-4-yu.tu@amlogic.com/
> 
>  .../bindings/serial/amlogic,meson-uart.yaml   |  10 +-
>  drivers/tty/serial/meson_uart.c               | 244 ++++++++++++------
>  2 files changed, 177 insertions(+), 77 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
