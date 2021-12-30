Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B1AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzlgNJfyAxo7GxVJfw4LtQgP9caX1w6MZfIMojERwvc=; b=KMuReoByvYWiIe
	FkILRnkUMN1c0Th9inaIX7NMgnDJCDI4FQAwDWiENkQx10C3NQzy501gzlkXT2fbYD8LLAYOTLETO
	6K53iFh3AeLTyWH7Jk9qq7gLA+W4J+szkKgDPLzmy8BvTutUfvXqVpW6mNpU1BR2gq3mAHJcDrMTG
	h9Q5WLa+XxAgJLbOeNFxRBaw9DMurtMJeJA4YblV9VJA5zisYu521wMWiMnlS8S+6IRwjBW0roxVm
	H6KB3YRUj7WGqBORjSsrwDxCljtN7T9sR0WnkqbEtNp92fMByXJd0Zc2bCV0aJ3rS39rMDsfQA/kE
	qHmMUCWUZsRBLM8lcVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33ov-005KnA-Cd; Thu, 30 Dec 2021 22:22:49 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33oj-005Kla-DR; Thu, 30 Dec 2021 22:22:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id x15so102975757edv.1;
 Thu, 30 Dec 2021 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icsjDhIEKBv5PA4Cpy4V9FTUygiq2ZP93ta7HHiW2v4=;
 b=Gr15T/KmJfjujIQlleKTVn7ZjlbaQshoHQ1fBpigwcMnqQcWeWZVx/DnOggcG9tljL
 4ScXXjD7bR1sp6MR3qYz3W0pp6jQ7lVRTFJZCnBT6pqLdi5dfzrwvqy3xG8+i+n6jMaV
 2WJeBebbpyw4+WP0SabwtOADxNCUYs5MFCwiTOWbLkYp+RwL5Syx0tn2yRG5vgpEYXSR
 gePRubOL3TJkn5vvnuh4PrDkMnILbt6sXY3GfScrognSzglomLdQGZWtd9f4C/5JNy/Q
 42lOWGesauSumOOHgI16SLX6ba160OqJzQALmz4Zq04ipB5eBNzSoqJEbBSknzbt1SMy
 BMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icsjDhIEKBv5PA4Cpy4V9FTUygiq2ZP93ta7HHiW2v4=;
 b=I2KlM1V4kLc6ewQjekJi01BMgfx5ensU5+TJxHEEL+kl8iqdA7YhoPP9GCeRPM9CK4
 kP1HsvnufwxEcsGClPjMxaZj6mxjjNU+vUBHiLe/Fl75q7R2AD9qV42lNjBLJkoqywct
 29dRm99FTPzZYiZNtpNsn4cqCRRp7SCtImoI5Uu6m1P4FrcHw9QzIb4eh5qWNBZhqklx
 y3V3vsAKIKgKmw/aPUCwiBuTWaZio19/ig/dPUK/XaIQdZp3agGp7zAdqwUo7JGLyaYU
 rYDE/M6fdmftZPmMUSv60zRRdBzOI7SCPzFIo44e/aWztQ/oxHNA4vj76c2TjD2hjBwn
 58Wg==
X-Gm-Message-State: AOAM531l9iAsJrMzaxLh2mDLjKL6JCuLnYKxbrhmOt/v/dpm6sG/22yo
 cFmf7WV6LoPjuuXGetcyK9QB2xhbJu9ZJzcASus=
X-Google-Smtp-Source: ABdhPJxtKwpWjmgFoVKO9DStYPv1zfin8xWOEvaSCQcpNxTMa3nbTPKK7mmsoXmhxZjD3Jf8NVKoGKv4X2fLb/PZQBo=
X-Received: by 2002:a17:907:75dc:: with SMTP id
 jl28mr26104740ejc.13.1640902955841; 
 Thu, 30 Dec 2021 14:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-2-yu.tu@amlogic.com>
In-Reply-To: <20211230102110.3861-2-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:22:25 +0100
Message-ID: <CAFBinCCwjS36ss_4sU+o9m8gEprFsVZbqcxgpQxczTNohZqFdA@mail.gmail.com>
Subject: Re: [PATCH V3 1/6] tty: serial: meson: Drop the legacy compatible
 strings and clock code
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_142237_495223_8A8D2328 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Dec 30, 2021 at 11:21 AM Yu Tu <yu.tu@amlogic.com> wrote:
>
> All mainline .dts files have been using the stable UART since Linux
> 4.16. Drop the legacy compatible strings and related clock code.
>
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
I have just realized that this cannot be dropped until my series "ARM:
dts: meson: fix UART device-tree schema validation" [0] is merged

[...]
> -/* Legacy bindings, should be removed when no more used */
> -OF_EARLYCON_DECLARE(meson, "amlogic,meson-uart",
> -                   meson_serial_early_console_setup);
This part is still needed as long as above series is not merged yet.
If we remove this then earlycon will stop working on the 32-bit SoCs
unless [0] is merged.

All other code below - except the of_device_id entry - can still be
removed since meson8.dtsi and meson8b.dtsi are using the non-legacy
clocks already.

Sorry for only noticing this now.


Best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20211227180026.4068352-1-martin.blumenstingl@googlemail.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
