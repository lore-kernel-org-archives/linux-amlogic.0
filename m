Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71891C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHced5Ckyj0aKZSZfGJjvNsMWeHEhVE44jRx471PqC8=; b=bSPdVA7vWqE+DD
	PVvYCwV/gVS8M6fACmvtrVTjG0q7zFUpQvr0JuCOJjkeXd1XZ49yMiSjD3TsrBk/WlFEYRU2AzHqx
	RxAVwAMkttvD+xzTED3XGKqTKbk+c5MjYDfqPF7SE2XuVekk50OE2chBBQb+Ktb9j8kTJwfD9hyKF
	Zn/8eePnAWZIYuMxnIxXN7Gm4CrHwT2RzMbd83sjrslSNqOD5I7HWqsO+DzNiq3ReDD/cStjK4R7R
	KEJi3RUWyOKi6qIUXsqKkqVqY1apWcWZFsFioYllkDcZUgYzSmGkZoMjR3RxGsgnq4LY6HIXWkr+g
	SK2Tfyu7ZaAwOb+xEn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n340n-005M4w-Qi; Thu, 30 Dec 2021 22:35:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n340b-005M2w-Lm; Thu, 30 Dec 2021 22:34:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id b13so102871989edd.8;
 Thu, 30 Dec 2021 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=keDpfpmYkXFiVgktyndmnfL9DTHJGo7630SMho0JAeE=;
 b=ai6bQPVEAVEI84Hr676QSSliE+FR4kHYNtcIKRXGqvO0ZFSSntFZrdJGBovV7M2b8d
 p2CRo0K5/4qPORmzar5tSkOD19nOcQHG8T01qunC12cBe/fjgsvFXdSdtU5B4jfmuyLq
 AVLIM5tab73qpz3JSJ5WbJ7S9wE6eu00OJbybBCG2A72CwOsGoiiec3uorb7kiOsOmkw
 t4FsZpo32HpTTzn9N2DIE0LDn9l1TQA5nY3LlixgsZWZLfEsjZ6u7M/F0zA9p7cbT/Qo
 dfZbj3t6uqZLqrHVWO/TfQkS6xiRBdNO0eVecXvuVQ7oRFohDMw9alrxsjyQunudjRw1
 Nzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keDpfpmYkXFiVgktyndmnfL9DTHJGo7630SMho0JAeE=;
 b=zApiKy7F34THeGecOVY9LFmeBP7SDkpqWqe17790T8yQgczxC2vCiURJxG8hup/c1e
 oxF2vRzOq4ioIiv/HME16nEyfrN3xbt9CJe+hbVvZ8uNQgGpiUMDSfehK2r9PrGVgNqI
 rNfdlZen9deRfBiykoArYxnsvSR39cWyeqqiCR5B79Wkgnhi4uFXAi1fsIPDFeU8Br2/
 mkPRcI5W50TZmWeP643lvJp3X+j7R3BG0EBcvCE7nCtRxeg5KxVwvEee35IEllSoMOF7
 rOuJZO1lhNRPSS2GC0QDyhVbDjdyEdNVzSFF0eN5dZ6fuUKCiHns4nGJEK7+psEbTIU7
 pzuw==
X-Gm-Message-State: AOAM530jOkFAcAKO617GaJ1P0fEFjR/cOc8NntsatWv9p8SODXzlrJwn
 S2oX1XGabup4N8GWvN+ZFPw6ZvF8OguvRgYvHCg=
X-Google-Smtp-Source: ABdhPJy06stqBtrzO3pPH2Sb6S4wUoQroR8A11+Jus2e4clCR7PxO5IkHtNeOhstYloGzN2BG15vOFzp8x/xl7qa0w4=
X-Received: by 2002:a17:907:75dc:: with SMTP id
 jl28mr26131756ejc.13.1640903692114; 
 Thu, 30 Dec 2021 14:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-4-yu.tu@amlogic.com>
In-Reply-To: <20211230102110.3861-4-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:34:41 +0100
Message-ID: <CAFBinCB0RTfOLbV3ZC+9dJEiw2_y41V+JvNP9GOPaQcCLB7UdA@mail.gmail.com>
Subject: Re: [PATCH V3 3/6] dt-bindings: serial: meson: Support S4 SoC uart.
 Also Drop compatible = amlogic,meson-gx-uart.
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_143453_758136_F1A612E2 
X-CRM114-Status: UNSURE (   9.25  )
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

Hello,

as Greg already mentioned the $subject line is very long.

On Thu, Dec 30, 2021 at 11:21 AM Yu Tu <yu.tu@amlogic.com> wrote:
> Deprecated, don't use anymore because compatible = amlogic,meson-gx-uart
> don't differentiate between GXBB and GXL which have different
> revisions of the UART IP. So it's split into GXBB and GXL.
actually it's split into GXBB, GXL and G12A

[...]
> -              - amlogic,meson-gx-uart
> +              - amlogic,meson-gxbb-uart
> +              - amlogic,meson-gxl-uart
> +              - amlogic,meson-g12a-uart
> +              - amlogic,meson-s4-uart
In addition to Greg's comment I suggest splitting this into two patches:
- one where the "amlogic,meson-gx-uart" compatible is marked as
deprecated (Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
has an example for deprecated entries) and GXBB, GXL and G12A
compatible strings are added instead
- another one where the new S4 compatible string is added

The idea here is to have "one logical change per patch".
Deprecating and replacing "amlogic,meson-gx-uart" is one logical change.
Adding a new compatible string is another logical change.
I am hoping that this will also make it easier to find a shorter
$subject line (which according to the patch submission guide [0]
should be 70-75 characters: "the summary must be no more than 70-75
characters")


Best regards,
Martin


[0] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
