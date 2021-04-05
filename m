Return-Path: <SRS0=c12J=JC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56783C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 20:57:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BBB613B3
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 20:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2BBB613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LrM9JJoAntjwavtX2e/mhX3S7NzYwLF5aLF2zwuRR1I=; b=WCnueWZI4oho6jZpSLsBPCPe8
	Rg+4hqC7ViXsbswo9qKbXedoQFJ4etISA/1uQhtxxqXiBpWKW+vR23HP3SXyWDSTrRUjy5hwgXLSC
	FmFmB5n2OTM88yEXM15vIobAH1pjFgbaisVQYI9tnRn5V0RjAv25e8Xi3IpqK42W6lrzc9dBNEG6z
	cnY0KGdI8mjP5fSvi0GzA5vPlL8yBp3RoHjkLScC81sDO4UlcN5IZuuPJxW7NEDfd5rLkiaoyzU4F
	UgaL1IlxDyYA0gs3z1/AmgZxWClEPosWAg4fVLYeJQ5V7wv/7n2rv5UuVUZkr7IRP7Ap3Y95VEEwV
	gTvf8Jq4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTWHJ-000fMm-8y; Mon, 05 Apr 2021 20:56:57 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTWH8-000fKV-4P; Mon, 05 Apr 2021 20:56:47 +0000
Received: by mail-ed1-x532.google.com with SMTP id x21so13952887eds.4;
 Mon, 05 Apr 2021 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQ/sz4QIHDjzJ8nBtshigsYBFNP5a7OC28YN9pA/Mgs=;
 b=pqY0VoiUuzbRQXs8ucTKXxClB62OzQM+BlbkkZ2Hye6SXe/syKCvG6pTuMLdaVubLl
 5mgLqR8fESyG3no3UFkaTx1QNBSPOiD3mpwRa6Tyia2y19PsRP2Kg0dccNPZzXp1vh1h
 QT3K4XtgNf1kTxFvziOT/8W9P3N1PdcHhUuqGvbq8F7dH2rhg/34XVPlgCXN3CydNaM9
 kKHHfKXjwg5HVDkEjBvrd/lutrJglYGOecJlYhiruWYFyhGnet76U46FxPZH5q2xvFLy
 aO7xfTHcQHF0FvHGQjJSbyyoSy+vy7q0SMFhXl4o/qLIiAy2zvfHxpW7iq+jB1hPq2xO
 EvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQ/sz4QIHDjzJ8nBtshigsYBFNP5a7OC28YN9pA/Mgs=;
 b=pcqiYWEmz55lXwSzlq3gZkbx6VpZqzBGfi0X56dYWSYUf1AU6LvgcHOMe0ZfIlorae
 4PtPooa7je0gWYS1NzSPA7ypZD+axjMgp43js8kbWRhibOl/lEmnQ73HPeLgDxfdCIxh
 blOaFkys3I+qW41a/r7psW+lUmU1wn9YWsaXLVBEIDLLwLiNGMWWabnfv94ENCWnEJw7
 qD3Sj3GIMnFGjQ7Q7PWI3DG4wV/VTm6AVMG4LlZ/0sX22NthgXQpD7tLC75W25uvEcqb
 l2TO/9xt3bGnZ8U+0YqcZJHNy/AOZTh9f59v/9O7ajvImkaxc9mKwHmmTJuQ7eaO4+tG
 ER6g==
X-Gm-Message-State: AOAM532gj6Bfcl9+EmtHbvqVRY6/UH6llpSa1zWFpBaQyQszaFQeogDH
 7gYsGwHUTQU35pvtdizRXAZme+wQjVanzrkHSnQ=
X-Google-Smtp-Source: ABdhPJzX3Q8IXaEZkwIhW5K8Z3KZLRUvOlw+9yPPAdzK4VJIqdsuppTBkPO+VE5uuz4LwXuK1++UzZHn2k9D3o8cyOU=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr33533620edu.52.1617656205602; 
 Mon, 05 Apr 2021 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-3-christianshewitt@gmail.com>
In-Reply-To: <20210329161256.31171-3-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Apr 2021 22:56:34 +0200
Message-ID: <CAFBinCAJMvdus+bUjDpJxrATfifG7BstdKi=x_yUEYH0RqhJUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: meson: add saradc node to ODROID N2/N2+
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hyeonki Hong <hhk7734@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_215646_323132_FE8EBA0E 
X-CRM114-Status: UNSURE (   9.75  )
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

On Tue, Mar 30, 2021 at 1:18 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> From: Hyeonki Hong <hhk7734@gmail.com>
>
> Add the meson saradc node to the ODROID N2/N2+ common dtsi.
in general I am fine with this as some SAR ADC channels seem to be on
the pin headers...

[...]
> +&saradc {
> +       status = "okay";
> +};
...but a vref-supply should be provided to get meaningful numbers

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
