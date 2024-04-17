Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1F2C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2024 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hA05frZxtB03UiCucBAJIyZPgUDZV9Bi3KkGyLqY8E=; b=NI8eV5UXx1lQ4L
	zIsHlDIajAw9K3GyOXOylUZVyMNiNIY2dWGj0bD3ePNYpC3WSgwMrXHCGKLaF5/Ywl7uw9G5IhdCz
	PSyJw7tHvVN22cE1tll9/r48mZwVxZ9caUk5JQM/4qqtdxOPYFLS1Wbeq60ypOMgEXTXP1pOyj/cU
	4Pgxf7gnrRAYzi6Ewr4IuoiyzD1BN8oqh+7ct/KR2+SGdjVdJGdKYLpAM+8+IXRtjsym/xk9K4vRm
	pPCi+BpMdLVWB1Hbp1B2ttLno3p93CpCrO6r0GgYCfIv6aoX6+ZxytUCEIzOoppHe0W6XU8EQ0nd2
	UTO02tMFhO+GJuGDeyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3K9-0000000FlD2-41mQ;
	Wed, 17 Apr 2024 11:19:33 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3K6-0000000FlCZ-3qBN
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Apr 2024 11:19:32 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-69b4e94ecd2so17846376d6.3
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2024 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713352768; x=1713957568; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nShAutHtuE37PrbMJ/3jcXGQkinGfTAuQNwXS5UlpzU=;
        b=QkxJ3k2Kf5ksro5eKX5y4P/TG/DoAP/T16bdvQv8OoJKTWpFO2GwzAq/WAOdF9mTGI
         q/F/PB5a0mwACa0ou5r0mWhMqZNyhxDSbcEbWC25WnIwpA/EjWP/Pr0boYZrxY3wCDZZ
         gsI75Z58bOaOASNGQ2M7h/2DiqT/KiXTnjWBiAtXloqs+MN3gi5KR7fpizRojScUpGj2
         SZUHDcMXlCYxlHwa5gIyJv8AHaZGFzkUIflFVi1yy1G3Cm5ENeNZrV58tLC6NGQAcBKL
         X4nIDhh2EfXpeYnfy0U1fbYY3CMtCKjoVtNWZ/WaLp+ZCn+DMqAK6/JD4bwT6DvpwelL
         7Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713352768; x=1713957568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nShAutHtuE37PrbMJ/3jcXGQkinGfTAuQNwXS5UlpzU=;
        b=plzTUAeFOXQLd4UEr8BheUbzwHjtaOYgc33nu2W8bCt1P7pV7bwDh2Zsub3gYXuaQf
         R883JBt4iEoaDzgSlxpP3Vm2IrhpTxAztFOKe7IK0zKKF7GwIJp0v9HekHRGM2VP0Cep
         TMDEK66qt5uKYDxAgrmcYc9kg9RMkCM1lIKL7CdssRSgLs7biM/5whU6PklbutiEx+vz
         AbvYLVXT1huMSaj95Qieg6xYi22vhVCHG/YF6i7p/lSaPYA6bj+pjIXI+ztQajts4Vrx
         78jfd4exCQSatjQT5xGJUxwcd2nCGKFJeB2GTgCJPCIGq+hdON7EQbW9eBBwEUmDuIUd
         pAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM7bZdtiveBVQlI8w78xb6CPmNWvwb2VtAyICnwjCAHdmHO0gMmj7lqHGak0Xvhb/UNwDzie7x6/8gR9OUkzuqnhRJ+5usn9TCq+ab/msqebc=
X-Gm-Message-State: AOJu0YxKSuVVMvUyY3O82vnAeuLizs27Jooc35z9Q+PiBM5wywWMTHZR
	1g87rBHBT7HfrkG7WMxvVb5l8IDhnFM2J/3Ct58C0Zq/4t2hHo1gbR2aqwOmoEdx6mkSbrxclPl
	30pPdSfdVVgOCIm22Vp+tiMCeShy2uZ7uMVEiVw==
X-Google-Smtp-Source: AGHT+IFR6bhoypxiwiBMPF6IZr+uTIkVIpmOnJDANxKEhpPmGSVL/We4VkZgS73RHfl6aXFF1JnugYKsEXaCY4mMUq8=
X-Received: by 2002:ad4:4514:0:b0:6a0:4d4c:2ee3 with SMTP id
 k20-20020ad44514000000b006a04d4c2ee3mr269913qvu.30.1713352767703; Wed, 17 Apr
 2024 04:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240405060826.2521-1-jirislaby@kernel.org> <20240405060826.2521-13-jirislaby@kernel.org>
 <CGME20240415125847eucas1p2bc180c35f40f9c490c713679871af9ae@eucas1p2.samsung.com>
 <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com> <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org>
 <Zh-fgtujwjiSXz7D@monster> <c091da0b-a150-428a-bf96-75f9f3eab2e2@samsung.com>
In-Reply-To: <c091da0b-a150-428a-bf96-75f9f3eab2e2@samsung.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 17 Apr 2024 13:19:16 +0200
Message-ID: <CADYN=9LCJS0SW4PuF+e356HUxhzJYi093K6U+BdErPohq4RDWQ@mail.gmail.com>
Subject: Re: [PATCH 12/15] tty: serial: switch from circ_buf to kfifo
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org, 
	linux-amlogic@lists.infradead.org, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_041931_051584_04471CC7 
X-CRM114-Status: GOOD (  26.69  )
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

On Wed, 17 Apr 2024 at 12:20, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 17.04.2024 12:08, Anders Roxell wrote:
> > On 2024-04-15 15:28, Jiri Slaby wrote:
> >> On 15. 04. 24, 14:58, Marek Szyprowski wrote:
> >>> On 05.04.2024 08:08, Jiri Slaby (SUSE) wrote:
> >>>> Switch from struct circ_buf to proper kfifo. kfifo provides much better
> >>>> API, esp. when wrap-around of the buffer needs to be taken into account.
> >>>> Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for example.
> >>>>
> >>>> Kfifo API can also fill in scatter-gather DMA structures, so it easier
> >>>> for that use case too. Look at lpuart_dma_tx() for example. Note that
> >>>> not all drivers can be converted to that (like atmel_serial), they
> >>>> handle DMA specially.
> >>>>
> >>>> Note that usb-serial uses kfifo for TX for ages.
> >>>>
> >>>> omap needed a bit more care as it needs to put a char into FIFO to start
> >>>> the DMA transfer when OMAP_DMA_TX_KICK is set. In that case, we have to
> >>>> do kfifo_dma_out_prepare twice: once to find out the tx_size (to find
> >>>> out if it is worths to do DMA at all -- size >= 4), the second time for
> >>>> the actual transfer.
> >>>>
> >>>> All traces of circ_buf are removed from serial_core.h (and its struct
> >>>> uart_state).
> >>>>
> >>>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> >>>> ...
> >>> This patch landed in linux-next as commit 1788cf6a91d9 ("tty: serial:
> >>> switch from circ_buf to kfifo"). Unfortunately it breaks UART operation
> >>> on thr Amlogic Meson based boards (drivers/tty/serial/meson_uart.c
> >>> driver) and Qualcomm RB5 board (drivers/tty/serial/qcom_geni_serial.c).
> >>> Once the init process is started, a complete garbage is printed to the
> >>> serial console. Here is an example how it looks:
> >> Oh my!
> >>
> >> Both drivers move the tail using both kfifo and uart_xmit_advance()
> >> interfaces. Bah. Does it help to remove that uart_xmit_advance() for both of
> >> them? (TX stats will be broken.)
> >>
> >> Users of uart_port_tx() are not affected.
> >>
> >> This is my fault when merging uart_xmit_advance() with this series.
> >>
> > I'm trying to run on two dragonboard devices db410c and db845c and both
> > fails to boot see the boot failure from db845c [1], linux-next tag: next-20240415.
> > I tried to apply the patch [2] (that you proposed in this thread) ontop of next-20240415. However, that didn't
> > help bootlog on db845c [3].
>
> This is a different issue, which I've reported 2 days ago. See the
> following thread:
>
> https://lore.kernel.org/all/d3eb9f21-f3e1-43ec-bf41-984c6aa5cfc8@samsung.com/

Oh ok, I did the bisection on db845v, and that led me to this
patch 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")

Cheers,
Anders

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
