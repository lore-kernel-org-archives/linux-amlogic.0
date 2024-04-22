Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05922C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szhO4YVUhdnv5G1kiGS+LCdM8UP0+3Aee3idRfxmg3Q=; b=WpClmSSenXjIMV
	elT1G6H5J4wMnpIRzhyNEcMIOtir3YoLZxHacVd4twh41HFwNbvLQ44thihAGUQ2wl91McTmouLzU
	GzMZSVa19+KIvDaJzI1CZKupXG8T7HzSWISkjIsTWsMaF+70MBMxweW8HOFXmkQAVTT2M7UyzWCI2
	986GNBqyBj+OZIIF/1xhBzf/BIqLQp8VKTekmIL6/aes4WI2ryLGP5Gl6YPW7swJDFFkg+KlnXfzz
	dk7KhcJ3Fk2svuYnneaYQjsGsU1qc31lMIDDNtJIbAo+/8IJP1MQKfN6fpEC57OjnI4cqHycLB9Us
	rE9h6O9vX7JySVAgKXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqYv-0000000D5BV-35ov;
	Mon, 22 Apr 2024 10:06:13 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqYq-0000000D5AV-13gD
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 10:06:13 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5aa1b7a37b5so2620344eaf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780364; x=1714385164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp9lUQ4HZ5PgJGPmf9IQ95ImHEOQFdQIgczUTfI1TFI=;
        b=KQeOMw8OzxtFrvV7YNgBNHIzuZ4etknz6CkxEpKZU5v50augBwPwq4uAdF8ZdzHC00
         ED+aPZfLm3kxsulK8J3WYGodKpXuY553c7qqbI8xqSg4ZB3zcwKeTKytKLx+/6DXFJDz
         5E8VXWmz7TGZPVzGtmD4vZhcKOyDQP+xoIDV+/3nqhdvSvCG2UkhLF3YX1H/0+Cx3Jel
         1pxcJa+WSAYITLS5Aymm3W8CePqr+I2iQNfW4RRS78FSxQ+RjjnZ9W2iUpmi0z3JBX3C
         oi7v9fvTUMFBy8XtNAH3t0Ln3PJL6efCeisBHz7TxBKFKSs2fgFnEMPS9Ryz2dEtAmU8
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780364; x=1714385164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp9lUQ4HZ5PgJGPmf9IQ95ImHEOQFdQIgczUTfI1TFI=;
        b=ff0V/yI/i+6fFW1j11tzYov7k2JWXgL7FbJdJlkaFcpCc/7gCoUdYupQBUnDUL9gYr
         r4RZ6FLFExG4HgLi3HRkK8PxhumvkGdV1z8iT9qoQN0a2ej1tWuMVF1LP1dO9b+AWpsx
         m3/DDfxfb1Aa8kVQtQSlqrBzpyKj2AijO0RhPW5bHpHM/6EpskDmDLdtsO46k3fzliAO
         gwq9dI4k7IvRjbhaKfoE8jbO2pFl5ctXxjLPM5xC0mh2DQTBIQoJ2xEiAh7zY0qN/vL3
         ezSK5FACVerRLNq0ZPnF11h7fydF9sqBUmymRfEJexMRB6FAZFvpud/y7iwg2nqtRu/x
         6cMg==
X-Forwarded-Encrypted: i=1; AJvYcCUCFSQOR+9U8u/sy/dUPk0owqgCtcmgwfPzU9FZB+YGQ6YG6pgbBIffL/RLMtl+byLA12fdapX8sTALMa1IuAKTLP0v9dhMwEW5Af4WEZPvTto=
X-Gm-Message-State: AOJu0YwjXApXY6AxmZQsmv/0ld6rs5k2JaJWkKakO15Ie/lLakq4gu/T
	8Ou+B3qwMWoJ+YcpMrVxNcpYOTKo5X57TgKlVcWcnHUFMAouToZ5sXFqlVpo9CeCghuVmtRoAho
	n7241XZk251HohGQnwuZ9zIavdKlOVIeIGKdPww==
X-Google-Smtp-Source: AGHT+IH2cO2rZIY+HwOOnVAFVGLIKgIBh5VFjqWuGGTbO6sx2Y1eZMlp8KcjvsVT5MV0EfKhJfiXJpIcIBTuwaWiisY=
X-Received: by 2002:a05:6359:4287:b0:183:dda6:4470 with SMTP id
 kp7-20020a056359428700b00183dda64470mr6527469rwb.12.1713780364561; Mon, 22
 Apr 2024 03:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240405060826.2521-1-jirislaby@kernel.org> <20240405060826.2521-13-jirislaby@kernel.org>
 <CGME20240415125847eucas1p2bc180c35f40f9c490c713679871af9ae@eucas1p2.samsung.com>
 <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com> <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org>
 <Zh-fgtujwjiSXz7D@monster> <c091da0b-a150-428a-bf96-75f9f3eab2e2@samsung.com>
 <CADYN=9LCJS0SW4PuF+e356HUxhzJYi093K6U+BdErPohq4RDWQ@mail.gmail.com> <6ef3422c-d931-4993-856d-c080b11d72d5@kernel.org>
In-Reply-To: <6ef3422c-d931-4993-856d-c080b11d72d5@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 22 Apr 2024 12:05:53 +0200
Message-ID: <CADYN=9LtODPtcFiuZ_Zv5O9M4S1+pAYJD8Fu8r5__67bPK98RA@mail.gmail.com>
Subject: Re: [PATCH 12/15] tty: serial: switch from circ_buf to kfifo
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, gregkh@linuxfoundation.org, 
	linux-amlogic@lists.infradead.org, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_030608_326383_3EDB01CE 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, 22 Apr 2024 at 08:45, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 17. 04. 24, 13:19, Anders Roxell wrote:
> >> I'm trying to run on two dragonboard devices db410c and db845c and both
> >>> fails to boot see the boot failure from db845c [1], linux-next tag: next-20240415.
> >>> I tried to apply the patch [2] (that you proposed in this thread) ontop of next-20240415. However, that didn't
> >>> help bootlog on db845c [3].
> >>
> >> This is a different issue, which I've reported 2 days ago. See the
> >> following thread:
> >>
> >> https://lore.kernel.org/all/d3eb9f21-f3e1-43ec-bf41-984c6aa5cfc8@samsung.com/
> >
> > Oh ok, I did the bisection on db845v, and that led me to this
> > patch 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
>
> Could you re-test with the today's -next?

Tested todays next and it boots fine.

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

>
> In particular, with this commit:
> commit f70f95b485d78838ad28dbec804b986d11ad7bb0
> Author: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Date:   Fri Apr 19 10:09:31 2024 +0200
>
>      serial: msm: check dma_map_sg() return value properly
>
>
> thanks,
> --
> js
> suse labs
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
