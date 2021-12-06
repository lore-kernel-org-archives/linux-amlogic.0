Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F09C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVWJ1Ci84A3dD3o9PCALgQaC/knYB7m/HgDKbKq2skQ=; b=PRwR6WmeVLSCZs
	CRKCLmimRfdB3TwteRe2CuWn+DTjOPJZcHPcbtEWlochVHwX+VUlVUMR1CR8hd07HWFuYwyvIRKvm
	PK+tok5s+bdQir6BAgAUrJ2ZwTU4gPP5o4GZMdriZja6yFM7EYwjS5i8NAl0LnDDPLN7jmO6KQ31u
	yGT6Qh+Q6/7+4kDhK6QTuYkvJBFspJakF2Xt5UFD8XYPC4a9xBzi6SmruG7GuRUTF3GJq+YzElzSZ
	+TTLBw46icBkv4eYBnDcRVxvIQFhtSH1tHT2/1pwyB56ngBEyqBJqukczmgedHZ2wBmoummia4aG2
	3MFhAigtd0qcx3iVHpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLc2-005v0h-4m; Mon, 06 Dec 2021 21:33:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLa5-005u7j-Ea; Mon, 06 Dec 2021 21:31:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id o20so48585755eds.10;
 Mon, 06 Dec 2021 13:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HGGJ/0Da454drz8o7P1nv4jVOxoCQJvdP5iy7oytDZ4=;
 b=K0ChTKtCkttJcpgJlZGR09ZMimEXXDr5JXRo98CPQe926UQKVnaKkQyIpRzw0SW2Vg
 t6eHzqLL63OAzoE8gVOr78Brz3nDOvj4lJ9LXhOBXFYiEkariFZud5so108iAy/egNPa
 NbELHHQM1V3dj4Fb+DwVTEICQagSJ3zB6KhtDauKLgoZBgno40IA1xdeeLbDSDAciNxu
 PRdyvm31IHlecuQTs2ZJMuHunZlbOXMMF5N/XgL6txEeFUftWtlW4DlcD1sP3DsDQP8R
 BLLRDFg1Yb6CUyeWd6DZcSPFEvkDRCJJoW4DxhHe8hya1UdGhZzvCOMjGAJDYxeHSQc4
 8FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HGGJ/0Da454drz8o7P1nv4jVOxoCQJvdP5iy7oytDZ4=;
 b=4fx37Y2YckJd/UHIyouhHXCVcHpC7mMynrMEJN17zArgYnpEgjxMQ3AKKO0PKmqD0v
 X+N9ttwwYFp+x6Uu8XQmdbmswh7LWHFOcDouwIUw4f81qdwRynkjbAwUqc0OYOP8AxzZ
 DqUfgk+7N1+nMPggmp0LWvBdoPai5TXz7HFVisUxIBroS2PXW5Frk+Z4l+n8IOzzvr1+
 0STl02kThPOVrVhD5qPQXUPT3C2ONWztR44vafrzF3mTUNLFp+wuDCxCOQG2LsH0lQLi
 gXeJSv3+kewt9jVnADQICLlUirwh/UL0mc5LePt+l52F3AwJEzxq+CRLvJm+z3UE0rLq
 z4YA==
X-Gm-Message-State: AOAM5311UqeKYepABeG/2OHDClE0g1ne8oPIS8sRziz7oOxWdOuHLxXy
 N2NPZqRbAQgqdkJLp7pa7jM9GO0ALIoDSF6CZMQ=
X-Google-Smtp-Source: ABdhPJygraTF13+5Ta4kUTyDW17cbvSWjq1QANG+bwG/TFPN2n5D+bBOLN/c2NiwEQZDBBVWZEW6PykAfRfEd/XmMcc=
X-Received: by 2002:a05:6402:354c:: with SMTP id
 f12mr2590207edd.256.1638826287556; 
 Mon, 06 Dec 2021 13:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20211206100200.31914-1-xianwei.zhao@amlogic.com>
In-Reply-To: <20211206100200.31914-1-xianwei.zhao@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:31:16 +0100
Message-ID: <CAFBinCDbWtFuWP9h8sYR4LabFwkT9moKBvxX-uOTWN21uuC1gQ@mail.gmail.com>
Subject: Re: [PATCH] serial: meson: make the current driver compatible with S4
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_133129_568253_6EC492AB 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, Dec 6, 2021 at 11:02 AM xianwei.zhao <xianwei.zhao@amlogic.com> wrote:
>
> Because S4 UART use a different clock source, the baud rate calculation need to be updated.
> Reset the UART during initialization to clear previous status.
Could you please explain why it is needed (is the divide-by-three
divider broken, does this patch decrease clock jitter, ...)?
Think of it like this: if I add another Amlogic board.dts tomorrow,
then how do I know when the "xtal_tick_en" property needs to be set?

I found that the public datasheet for the A311D SoC already mentions
AML_UART_BAUD_XTAL_TICK and AML_UART_BAUD_XTAL_DIV2 but so far UART is
working fine on that SoC even without this patch.

[...]
> +       val = readl_relaxed(port->membase + AML_UART_REG5);
The old logic worked like this:
- calculate the new register values
- write "val" to the register

The new logic uses many extra steps:
- read the existing register value
- mask off some bits in the "val" variable
- update some bits in the "val" variable based on the calculations below
- write "val" to the register

Is there any reason why we need to change this logic to set AML_UART_REG5?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
