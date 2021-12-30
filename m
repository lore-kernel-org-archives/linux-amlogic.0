Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B30C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPZWqPes+0I65xRZCJo9bfI4Bn/MJQlDEUsjdrz0VzM=; b=y7dkg7Wrwn88Ju
	jqevmVfDcAolpaAKQ5jM1w/EBPIvH5ARzrUrcu1SJQthHd3Ai56Z/EIqVW1y9qvh2mMNpq4kvVXwe
	rvJWllOBcNuwVCMNqHulNoX3WrSG43tb4d5KaJGZJbx3SCimGYW6h9IRRSKoF50TjNhiDCh9SAQ37
	FpIaU/7q/IBBY2l3FqYYV7nZ8ehWDOgvo8ewuXlIlScwv4v/pOIHHZO43L4x58jAnBlRRJ3o5aprt
	31A5NnA5xWd773+m3JoJpP5UXJi4y/srTj7UQG11evY+BaHbblfmQG0vVuFuDL9jfkmus/bBPPrFs
	Oqh/ezpay08XbEdmJa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n34AP-005N0y-8i; Thu, 30 Dec 2021 22:45:01 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n34AD-005MzA-Qi; Thu, 30 Dec 2021 22:44:51 +0000
Received: by mail-ed1-x52f.google.com with SMTP id j6so102846686edw.12;
 Thu, 30 Dec 2021 14:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qu1iBkqwq4gwDrjzqUJwaE3i7AcALVAHr+dbklNhfGM=;
 b=Hb2X3me5ngwnM9/ovCXQctanhIuWZssE/FpP28bQTN+27vlXffb/DwmYhJlXsefzkV
 6A2jV/+Vs9Pait7i2wf4rxgPdLuHX5DF5r9cyCiAq65wWS3QZSyYrnt7eHmLqX8OggSD
 chLg3CJR5j/f5vRMPHmnz8p6JTzl+qFeq88ApvXU9uW02YL7Yi1FSxLDBJoeR/bgQo4o
 bbNbnV10YkiOUc7azSu8wqDEkBFig81kpmqO5FEkZbmwquUlaympNWoXSADeO/wUwKjV
 hqt9STlGo6LCHkVS4qQmbWbfKea6K5ylQgUV5HkjkEDZ1NIRKY6pwBfF9OSjeYPVrtEz
 Z33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qu1iBkqwq4gwDrjzqUJwaE3i7AcALVAHr+dbklNhfGM=;
 b=rkyRjYwWoYGStmG2GaBH7WAiYZCl3Ghe/BzxjKZGkXjdg8C2cHgbowjxEdk4/5M5ZU
 Q0b6A1CAOCZKeGxCFGi1ycmVh4ZPSYiI83iTgUd1ZCjs1HopPdoi42TJmy/8UwqCTHd0
 PcB7M/5cJMncfr6E0HA4Ya0i5IGuoPywbMbXTb6YTmZr9Q9xQ8vJqq9Q5E5vEYEVBe3N
 LdjPiGDuS7F52Vze+aeFCSouHHhfeP8YO7CkzFjij2wrE1YKYLPj4Ql296b3VTXzHJRC
 pw4wXVL4UtaexPt8DAV2tXTrQeXddeGQ9cCb/ngha/09RiDLGjBUfyRR2bPSaGHhbEcM
 enGg==
X-Gm-Message-State: AOAM530FrzAeWsu/22kW7WWhyMI7x+mRSOIdJbSj02XJ19iZTyrcSoYr
 Fdh0PWnj42iX2WN7/Zas+FMOSJLyGUnmE/F7dN0=
X-Google-Smtp-Source: ABdhPJzsaTcMpcokf1ks8GXkefbPz3tzcAwBpu0OISmNor47kqTcwkW/dfI/sBF2vR4KUIc8q9FXIGbKJ91dMLZZAms=
X-Received: by 2002:a05:6402:2072:: with SMTP id
 bd18mr31917772edb.280.1640904288271; 
 Thu, 30 Dec 2021 14:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-6-yu.tu@amlogic.com>
In-Reply-To: <20211230102110.3861-6-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:44:37 +0100
Message-ID: <CAFBinCC7pvT4=LhowZQpH-_5=90KBnczcRfYc3tLQr8hEh49Zg@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] tty: serial: meson: meson_uart_shutdown omit clear
 AML_UART_TX_EN bit
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_144449_894199_D35CCAC0 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 30, 2021 at 11:22 AM Yu Tu <yu.tu@amlogic.com> wrote:
[...]
>         val = readl(port->membase + AML_UART_CONTROL);
> -       val &= ~AML_UART_RX_EN;
> +       val &= ~(AML_UART_RX_EN | AML_UART_TX_EN);
>         val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
>         writel(val, port->membase + AML_UART_CONTROL);
This looks fine to me but I think it would be good to Cc the author of
commit 855ddcab352c15 ("ARM: meson: serial: only disable tx irq on
stop")
The meson_uart driver which Carlo added eight years ago did clear
AML_UART_TX_EN here, but it was changed with the commit I mentioned
above.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
