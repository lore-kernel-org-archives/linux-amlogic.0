Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385EC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2024 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBZY1amAvY1vAkJdhJPiWe8KtFlL40Qm4yp7HYpid7E=; b=pK98JO18JVi3D4
	65K1xVqGr7Q/r1+bgRkiUwJ009Haje8HNJG0913bZtGrtQs5n4B3GrRKAGWjivfBwAlU8b2M/bRwM
	57sZzqONLHcVbqJS4XXTdtuuyzBs0s14YJQshJruRxT5sVQn2AN2YJRRRQifLF8y3JUB5zVeGST8O
	QkvQIc9Hrd5YKSh6bXc8wUV92lZgADNE21BJEps+Lr9SmMiZ51M7K2QiXkBTWYrpMmsG2hYlHhPax
	L679QteCgBKaEO37AzTKHUd1N0hQr0+7OOCcuZt77d6rEsmEvwTTCHE1dmBEx4aQDC2RaBXNtxSnS
	Nedrui5hCB6FB+P/wNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2D7-0000000FWOM-0dEv;
	Wed, 17 Apr 2024 10:08:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2D2-0000000FWLj-20eR
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Apr 2024 10:08:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-518b9527c60so4410068e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2024 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713348483; x=1713953283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rew6iLA0plRdxtIqeoXYtK2CEUSuSYY+qCYCtmDSd1o=;
        b=NQOxS4LvDhf+nwLKLC3QOyxXep+XjHosWnjsgnjZRzZuq6MgiTSnqtKZzTNV8X3tzr
         54BoZH/LnAIgM8xS1hr/XV679osYZUKKAxU24L+TeFuUPGnRub4Dp49U+gS4cCyT2UmA
         KRBNbmReKy8Uqf1zI3Y6hxxtDNqS7mpXuDAR2/Xv7qT7fOIS2lUdVU0JF7KDHPxNBnyo
         JwKiALdJbYsbi2MkaX9aZsKYeoBcnwjYZvWtqOupc0vNqn3zp3g7tXCvhCbsEcb69X6y
         lm0r4QQUhMVKClz/jfUx1T3gWlwF6ZaYaym7cdTdw1y12huoWtVol4GqE9TcsaeThVQi
         YmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348483; x=1713953283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rew6iLA0plRdxtIqeoXYtK2CEUSuSYY+qCYCtmDSd1o=;
        b=QOwzo5h9+CpwwMOeraQGoAY9foKWWoAYKvHwNKHa+0AA8g8TW5UAcihWAiQOFkp5DK
         vlPamOoxWXEAE4sILo2UYOUNKQCxeUYyav5er9qpfy7qPe3uzzuCEmi04QAWxSlosM/v
         mcqyJJifozKrMPFij8go3tADTtCxmPK1qoVjdZAJn0gdRUE8ZKDsvfaS6Rj7pjyUGVFD
         AFWUicm6OD+GIFXRjrFYqRvssvwq7O2VjHq78UldabZsw4AN7le9DNn5b0t9X53y9hiU
         H9yvd9mNJOuYonkXPPfgp1Z0dw7UP6iLIHxaRyTR5rqtxwRDc0CTr5R/7urLwObk5SJj
         3vtw==
X-Forwarded-Encrypted: i=1; AJvYcCUo0ADiPqhmYF9eCR39eebKHidJGqHzVUnfRVIaqFE7RGCuVEx13+tMuERbUr52Lddc8yrt+davHY5yKpgHw0Zagz3QljMuQQQXoYl73dz8sr4=
X-Gm-Message-State: AOJu0YxtYBNMTmpv/x0LlV7YUeJ78lgEPHtvKm7jj9CQ/0XMXN6wdgED
	PjoYgRqlJSbT/Io4x4B93RPK+XY+vHWx6MrXpqDxGcFqzL7SFmhka3ixnJCPHwAwBZhgLQbT8rk
	Y
X-Google-Smtp-Source: AGHT+IHpU2FckcUTS4T6HUYuJqnYbBgP+xCaAEopvwDiMHdA/fetkEHgQoPYTTOMp3Se2U1GhQcWFA==
X-Received: by 2002:a19:ca03:0:b0:519:5c34:9652 with SMTP id a3-20020a19ca03000000b005195c349652mr10971lfg.31.1713348483318;
        Wed, 17 Apr 2024 03:08:03 -0700 (PDT)
Received: from localhost (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id i25-20020a0565123e1900b00518dfedc3ddsm1012464lfv.12.2024.04.17.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:08:02 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:08:02 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, gregkh@linuxfoundation.org,
	linux-amlogic@lists.infradead.org,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 12/15] tty: serial: switch from circ_buf to kfifo
Message-ID: <Zh-fgtujwjiSXz7D@monster>
References: <20240405060826.2521-1-jirislaby@kernel.org>
 <20240405060826.2521-13-jirislaby@kernel.org>
 <CGME20240415125847eucas1p2bc180c35f40f9c490c713679871af9ae@eucas1p2.samsung.com>
 <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com>
 <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_030808_663233_5E9BE473 
X-CRM114-Status: GOOD (  28.64  )
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

On 2024-04-15 15:28, Jiri Slaby wrote:
> On 15. 04. 24, 14:58, Marek Szyprowski wrote:
> > Dear All,
> > 
> > On 05.04.2024 08:08, Jiri Slaby (SUSE) wrote:
> > > Switch from struct circ_buf to proper kfifo. kfifo provides much better
> > > API, esp. when wrap-around of the buffer needs to be taken into account.
> > > Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for example.
> > > 
> > > Kfifo API can also fill in scatter-gather DMA structures, so it easier
> > > for that use case too. Look at lpuart_dma_tx() for example. Note that
> > > not all drivers can be converted to that (like atmel_serial), they
> > > handle DMA specially.
> > > 
> > > Note that usb-serial uses kfifo for TX for ages.
> > > 
> > > omap needed a bit more care as it needs to put a char into FIFO to start
> > > the DMA transfer when OMAP_DMA_TX_KICK is set. In that case, we have to
> > > do kfifo_dma_out_prepare twice: once to find out the tx_size (to find
> > > out if it is worths to do DMA at all -- size >= 4), the second time for
> > > the actual transfer.
> > > 
> > > All traces of circ_buf are removed from serial_core.h (and its struct
> > > uart_state).
> > > 
> > > Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> > > ...
> > 
> > This patch landed in linux-next as commit 1788cf6a91d9 ("tty: serial:
> > switch from circ_buf to kfifo"). Unfortunately it breaks UART operation
> > on thr Amlogic Meson based boards (drivers/tty/serial/meson_uart.c
> > driver) and Qualcomm RB5 board (drivers/tty/serial/qcom_geni_serial.c).
> > Once the init process is started, a complete garbage is printed to the
> > serial console. Here is an example how it looks:
> 
> Oh my!
> 
> Both drivers move the tail using both kfifo and uart_xmit_advance()
> interfaces. Bah. Does it help to remove that uart_xmit_advance() for both of
> them? (TX stats will be broken.)
> 
> Users of uart_port_tx() are not affected.
> 
> This is my fault when merging uart_xmit_advance() with this series.
> 

I'm trying to run on two dragonboard devices db410c and db845c and both
fails to boot see the boot failure from db845c [1], linux-next tag: next-20240415.
I tried to apply the patch [2] (that you proposed in this thread) ontop of next-20240415. However, that didn't
help bootlog on db845c [3].

Cheers,
Anders
[1] https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2f7sLxYtIQXQzsnTzE1Dye2xweg/logs?format=html
[2] https://lore.kernel.org/lkml/20240416054825.6211-1-jirislaby@kernel.org/raw
[3] https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2fDgvWnyEmFm9mqMCxOaruBOfTe/logs?format=html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
