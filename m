Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9B6FF8864
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2026 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3ulmKVxsjLxkQzW7+fjhPsUylwKGwupMQ26WAT/m4A=; b=v9lUPqy71/sqUg
	qVzsyHToQ6N3s8UudeD98OgV/DVtYpUsr5ZZuxPIolai5OvjwsfrR03tgWFoxLjV4WQW/PqdUHBVT
	NhBewMT25BOmx1X5Blx5vdM9P5ItKY5+N1t9CdLPbj3cp4mdWA4IOTVxjnJKhOjjr53N6r5KSj+oC
	NqmDchWSKOEaVH1bncKTN5kXzWMS8AOfg0TzWHFdvz8tWQ1Zt3NR/GMK4n6FtRZP9mjMRD6Hf8rOz
	hcD+uvBfd5nZpixq4BNyL7kD7da07aT0YlDlS9w3zhWCrfCvfpBLRFZHmcwGd0nRKgbV4vQUkzkQy
	o0XH0rO/Ox4L3JTYL23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjH0-00000006Vxj-2VXy;
	Fri, 01 May 2026 08:30:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjGy-00000006Vx4-3LIO
	for linux-amlogic@lists.infradead.org;
	Fri, 01 May 2026 08:30:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso9259225e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 01 May 2026 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777624254; x=1778229054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=To0qe3l0vAu0P3HelDCJoh3V9ir3NtQBqsW6gCduW4BKD92WCdqOt+kgJ1iP6d+vf7
         Ee4xvGHv9kOcRR0efovOlD1NbV/Ju3Us8C2nWTXPNX7lG6XXuPjAilHQTJsu1J4tTSGg
         PeM6kUJcwujzNMtoZiK4thvrgzLX3dDDrWlYVS8/GUnHqLuzjJSLoCliT0/iaiNhsmwe
         0efOBii1Vm/+DXu3OTVcXpAjNhXCIBEON9L9xl4MMMrun3Ubp8qdEPMjizlGAZ+IeyS4
         DcpJUekqb+4O4nzteFb2NoBS0N9OsP8paL55102lyvjxqxePgqKLrKZuHhPr/omHn+My
         CiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777624254; x=1778229054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=BnVchfSuEy2w2KpTRcRGLNVczd1nYaAdCmUj+wlXiFkDR8vWX21Pd1+uz+55iYIE72
         tZ4GKNvnWmE7bWt7w9Lnq9VwHoK7B5pBkkkOBler8IJa3cxz1OjtZtvYsvzpG6ndrIWf
         +8fQwzyAk9dWRNNOZZTMsxnbcARUEmsElib9w2Rb1atICi7d5L3ZorwleZ7B4fv9Uajd
         N6Fe4zAUWZIR/NVhe1ra5d9JEUpoJT0x1ITxVSLgLF1uTZl74NDzx8xO8YK7opMX5yBf
         rA41vWKF8zOVgYpIkUCdPBj3ORsTAh+ZEN5VPVDyyRj6OgFA6wMmIRwAqP6xGJGyIU41
         eU2g==
X-Forwarded-Encrypted: i=1; AFNElJ+x/iyY6GY03K2BRP9COd9sNDZ9eK3uaYXYkJUwnP7rtC5Cuf6qFDd+VsihpWf9O9g3/zyhOtuVlXbNgr/U@lists.infradead.org
X-Gm-Message-State: AOJu0YwFhcIm1CaLyoJ9LI6FGu9VqFEYaGUeM/EvW3UkKPi3/LKVmlVR
	u/YSPIcZuEdLJu6TM6SNPZ1ukthiq5qi5eSb7L3uTSM+oCBKZlT4yJc8
X-Gm-Gg: AeBDieukteKfTHlwN2ta37TM9B8IGk5D47u/clz51gdY/oofxBcg0xKlNqMw93VjeQA
	BwAHStxlarXSlPAuwOlXwTfnyYD4ertSJaPzqPEsGAc5NdjSjjI3ogGD83s4UaZyzP5n3/FBaKs
	GVAWbB5MnJT44c3xiw1d5+/Grt/XU7Z3PaBKLONI0/uV97byvLp8a0ntT3LuQUo7IcfFug2VYYd
	7vjZlti48Imgsp8ltb7VZ/9PcYkrVBUAJlhYUTZkQ+bIPuj0JTs2Ws3SQhKSls4hptlDxA5THuE
	FqnBm/iBMuKhoUOLRCMnbqVD6SqjVPTFQAhHI+ypHFknrYyV5rQe/7HI6qe6Ny6BpAbt0LjLdfh
	iMqoArH1Atp9I5yymm7bhRBn+wGXXi/S23SxyBQ7aqzF95D7c04SyrCr6RFbM/vbq4CY/Pf89go
	wzYLkUuu6Hl4ZPPkEHXmBS3aZgWy8wJVueC9AsrTwnDOKo7TJK1C1ONA5r2JBaJR3oDeK9ELDtx
	XxsdvJfCSbj+Q==
X-Received: by 2002:a05:6000:2582:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-44a2cb3b668mr6019597f8f.12.1777624252671;
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defbfsm3336950f8f.17.2026.05.01.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Date: Fri, 1 May 2026 09:30:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hans Zhang <18255117159@163.com>
Cc: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
Message-ID: <20260501093050.3f97cd3e@pumpkin>
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_013056_870668_67FE0F40 
X-CRM114-Status: GOOD (  10.60  )
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

On Thu, 30 Apr 2026 23:54:46 +0800
Hans Zhang <18255117159@163.com> wrote:

> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.

I don't think these changes are worth the effort.
The readability doesn't change much - you need to know what a slightly
more obscure 'helper' does.
The extra compile-time checks are pretty unlikely to ever find a problem
and mostly just slow down the compile.
The generated code is likely be slightly worse.
And, with the best will in the world, it is easy to make silly mistakes.

	David

> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> Hans Zhang (10):
>   spi: amlogic-spifc-a1: Use FIELD_MODIFY()
>   spi: amlogic-spisg: Use FIELD_MODIFY()
>   spi: cadence-xspi: Use FIELD_MODIFY()
>   spi: meson-spicc: Use FIELD_MODIFY()
>   spi: nxp-xspi: Use FIELD_MODIFY()
>   spi: sn-f-ospi: Use FIELD_MODIFY()
>   spi: stm32-ospi: Use FIELD_MODIFY()
>   spi: stm32-qspi: Use FIELD_MODIFY()
>   spi: sunplus-sp7021: Use FIELD_MODIFY()
>   spi: uniphier: Use FIELD_MODIFY()
> 
>  drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
>  drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
>  drivers/spi/spi-cadence-xspi.c     |  3 +--
>  drivers/spi/spi-meson-spicc.c      |  5 ++---
>  drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
>  drivers/spi/spi-sn-f-ospi.c        |  5 ++---
>  drivers/spi/spi-stm32-ospi.c       |  7 +++----
>  drivers/spi/spi-stm32-qspi.c       |  5 ++---
>  drivers/spi/spi-sunplus-sp7021.c   |  3 +--
>  drivers/spi/spi-uniphier.c         | 13 +++++--------
>  10 files changed, 27 insertions(+), 44 deletions(-)
> 
> 
> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
