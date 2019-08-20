Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EBEC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC5122D6D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/aeiDsB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aXSDqapn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC5122D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW58agul3VmY2reEuaocVC0KfqxXcEClbxxXKZJ1GwE=; b=R/aeiDsBkLUbQJ
	8kvuAN+qq3kP069AINcGV5+97HUOoMLwmygaD7mT4Sy+anaO2oZgL5I5uN/AoOnTbmpFFDhqrYaQG
	HkV9S9+otF6eO0lmdyOQmJMRu9qLiwkrrx4fQS7aQVbri0T12bkPgBtURtL9SJdRzIY1ukL6FnYRv
	P3oFDEXEUmq2qsegB+iVwe8Q4369n+aQXeWwjKplwrAU3mP6kFGMS1dohPAx+9n2lZgjCufjiT18U
	ygl4X4OuNnjM80xzxAFwA4zVHsSL4zPrSdEVvYRJlr5MJ95ctOcsDfb1h00cKc2j5y9bREKrgNdDC
	pa08+vE+LO71+2a/cRrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0ATQ-0005Al-HH; Tue, 20 Aug 2019 20:11:20 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0ATN-0005AO-BY; Tue, 20 Aug 2019 20:11:18 +0000
Received: by mail-ot1-x344.google.com with SMTP id j7so6244413ota.9;
 Tue, 20 Aug 2019 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o53I8vQ9wtrjSFvWFPcuH8kjN1+m/8dnlNo9/cVPbt8=;
 b=aXSDqapn6WcKOYaJMrG+AuEcNKR4ihdAGTy5PiUw3m0wOxgaXf8eWWtGNLruZkeHF+
 czLnhpIGWgJuzyVjWEdx1vv95qhYAr/qYfNOqYgGagknQypZ6xj7wU/kD3x9cWhZ8nTB
 aw2iKaGU2zW9/WokEhMjRrQ2klXY+U0KwY9E+qmOWYJZpfMLSG/Oj1ZtNa/vWZDg4d9P
 XBTFLjYeOhgJZFcUQly6UzktsnNuEVwviRHFOTSHooqOFd+09C1CflhTRF/NX81KEA3n
 0pk4PDm3rRiovNg+OU6pQM454+2aIQIXprQ3MMCMymWrwCLkZ5uCmO9IRvwr0pKscDYm
 0bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o53I8vQ9wtrjSFvWFPcuH8kjN1+m/8dnlNo9/cVPbt8=;
 b=Vi1119z00nvLIqtMXbhNtOgWWnU+luQJ5vOSObHss8Q1roeeKHAWI7KqWPlI5cJBdJ
 nC6RsuSRm/LZWJkYEcEHnVjKf/rRsElt+BcV//VI4bt0y4gtPmGNxJ+I6Ike8MxjvNRC
 xUS9Ji1KasITeTZ4pPj+phCVHJkwSrJxCrv76+E5vxVq2ERck4328C2ST4j2XWuU1FYg
 kaxwgvbK6OdkvwF/xi9LN67vr3wz2+KUNhVeF9rNX2IAvOoNxylj4UmGZR7vg4d6kYF4
 lteTtn+30PBpDqk6GQ6/XYLVQG3aTnnkMn8iufLEvwNUtocks08W2QYj1JCL0yhBACDE
 ZazA==
X-Gm-Message-State: APjAAAUXbWEuNPRJFZvvcABLr3I5vnmkdtVvAhOTnaOTIHL3ez6qN0Ym
 UxJDFkikRAAXKnhO8zBqyEWWBDwKhHVy8LnzuEA=
X-Google-Smtp-Source: APXvYqwn/kxALIlREivrdhOnbCiD0KjV4l6AfLiKQa88DaW3qcOfPgQzhj3tub/nIyws3g4JAhwVLjpNxTIycbzhZtc=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr23455879ote.98.1566331875411; 
 Tue, 20 Aug 2019 13:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190820144052.18269-1-narmstrong@baylibre.com>
 <20190820144052.18269-7-narmstrong@baylibre.com>
In-Reply-To: <20190820144052.18269-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:11:04 +0200
Message-ID: <CAFBinCCNN_DBiriJRjw-AA-OCMFc+UgYi4oSJasJSypYFSbw9g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: add support for SM1 based SEI Robotics
 SEI610
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_131117_420870_1AF38822 
X-CRM114-Status: GOOD (  13.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Aug 20, 2019 at 4:43 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add support for the Amlogic SM1 Based SEI610 board.
>
> The SM1 SoC is a derivative of the G12A SoC Family with :
> - Cortex-A55 core instead of A53
> - more power domains, including USB & PCIe
> - a neural network co-processor (NNA)
> - a CSI input and image processor
> - some changes in the audio complex, thus not yet enabled
>
> The SEI610 board is a derivative of the SEI510 board with :
> - removed ADC based touch button, replaced with 3x GPIO buttons
> - physical switch disabling on-board MICs
> - USB-C port for USB 2.0 OTG
> - On-board FTDI USB2SERIAL port for Linux console
>
> Audio, Display and USB support will be added later when support of the
> corresponding power domains will be added, for now they are kept disabled.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I don't have any details about this board but overall this looks sane, so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       /* Used by Tuner, RGB Led & IR Emitter LED array */
> +       vddao_3v3_t: regultor-vddao_3v3_t {
that should be regulator-vddao_3v3_t - maybe Kevin can fix this up, if
not then we can still fix it with a follow-up patch


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
