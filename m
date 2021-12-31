Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA97C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=023h9gZiCHs5V9ledCtU4rx5LWos0q2Eh8BI2pGeOK8=; b=Xt8YzV3SblbaOr
	2nkeRckeFACszl8OFBiSTl/qQttmra9OA/BQGuKiu5do3oSioRTnbNPB3gAFRemLcmfEuzD7N+ldW
	iQxlq5JIvGE3qxRYsQYT3MDM3/ffMeFThz0Qmh+u0HDlZ8Ur4F7CT1O/bUvVLdIgdkq/n91TOwr7g
	ixwFFH9jO5ctw+J+mEVDlgp6WLuw6DNTi7n8hW71rCyNDoSfvYKMU28LUnX5iRQwPm6QevtaVjlrG
	j/OZB8tR6oA+UG3qJ+o142dozL4IfThyPtHjlouNfjwYbhOKKCxQk17dpJOnSfOdePJSdAhOX5hN8
	DzhoxUCN0M1Bz6LmTGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3JwV-006E3x-5V; Fri, 31 Dec 2021 15:35:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3JwI-006E0t-OD; Fri, 31 Dec 2021 15:35:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id j6so109767609edw.12;
 Fri, 31 Dec 2021 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBVQBI32yp8CmROb7EIEEt0uoANYGmZ8VFjWYLn1/iE=;
 b=Wtfq/hghpzkqguPYyuVfRXtDuTYP+nJPkVl1+1wJuk872XWUKZo6qOEDLIlPxRHWAT
 X+7r6LZbAHBJPpyGPw9Z4QDk54TAM4gOfoDEKr0yp6m11x8rD4uPhCN3Zf63x6Vr/Mrb
 t+2s4gcAivQkisTiWBSS1NZq99nwsVCry0anMNAIY0IcOLSOF+CJTVVzuJ37Ny9Wb6Mp
 S+X+2yMA9vMQ0k5KA+3PC5Pp2Hzm+Z9FecP0g+IjWjocFbT4J5XteBACvY9w1VeMZtCA
 /g1L05tejxjQTs4gNjI+ZnCJEl2GxLPTl/5NuqfitiBZU8AcnJ+m5ZzVbvsWA540s1l4
 B7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBVQBI32yp8CmROb7EIEEt0uoANYGmZ8VFjWYLn1/iE=;
 b=P6gqTgYj30QV7Xk+HJj8LvXOmfqi7P9cvMFvyjYjntBfR2psz+lEzf+agGpKk8cgPG
 Os7fMfYIvAQ2wVJOtptSP36wQmX9DbQaRxKappQ3CMXE7qI5kC/L0gp2+15sRAcPnhy5
 D3N6VVEGzYJfJHi6H4L66cF1ifio5pAvbsbVLrJnUKoPle/QbUnc3wf/uZ0h3WEyNmpW
 ahE/daSn8LArL6N2fFLJxiJjzXCNUoKtV3AtktpHqogH1a9+wjZ6sKoH/omv4usYpY7Z
 yQ70cMpPxA3hxSK0eHhNgU5RZO4O8ZYe6KyP9HhLnDZ+jdT6cjCHIyjboOllDA5M2kEm
 d8Vg==
X-Gm-Message-State: AOAM532TnFfaR+pr71ByBJyFgRgcBsgrAG7SrbWTqVVch0zrF3wtS5Wr
 S0LdYEImtVVO+k1190p55KDWfK6QghaDKoMBJkc=
X-Google-Smtp-Source: ABdhPJxGK+Pm5sWduX627fyQasmcKs55chqIihJcOe0FByR/1MmTk77LC/Vquahf0V4cZaxByRogNK/b5U9E844slWE=
X-Received: by 2002:a17:907:75dc:: with SMTP id
 jl28mr28283563ejc.13.1640964929172; 
 Fri, 31 Dec 2021 07:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-2-yu.tu@amlogic.com>
 <CAFBinCCwjS36ss_4sU+o9m8gEprFsVZbqcxgpQxczTNohZqFdA@mail.gmail.com>
 <a296e666-368b-4cd5-427e-30fc66a15b49@amlogic.com>
In-Reply-To: <a296e666-368b-4cd5-427e-30fc66a15b49@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 31 Dec 2021 16:35:18 +0100
Message-ID: <CAFBinCA2V=sx95Q=+4nLDXFK1Os11XVWtK8KauxixVwYXLUz1Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211231_073530_813143_037D4B65 
X-CRM114-Status: GOOD (  17.34  )
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

On Fri, Dec 31, 2021 at 11:27 AM Yu Tu <yu.tu@amlogic.com> wrote:
[...]
> >> -/* Legacy bindings, should be removed when no more used */
> >> -OF_EARLYCON_DECLARE(meson, "amlogic,meson-uart",
> >> -                   meson_serial_early_console_setup);
> > This part is still needed as long as above series is not merged yet.
> > If we remove this then earlycon will stop working on the 32-bit SoCs
> > unless [0] is merged.
> >
> > All other code below - except the of_device_id entry - can still be
> > removed since meson8.dtsi and meson8b.dtsi are using the non-legacy
> > clocks already.
> >
> > Sorry for only noticing this now.
> >
> I will add it back in the next patch and delete it after your submission
> is merged.
I have just seen that Greg has already added this patch to the tty-next tree [1]
In this case there's nothing to do on your end - I'll simply ask Neil
to also queue my 32-bit SoC UART .dts fixes [0] for 5.17


Best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20211227180026.4068352-1-martin.blumenstingl@googlemail.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
