Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3C1C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNz3wMaTWGX01xZ68+3liDrSzXnC22A+z302bEdNp9o=; b=oJ22GvcJCjIcgi
	eSMPaV307btloCw4yqEaP8s55SExIpZgZ+4WlKhTxq3Fqj1FCLyoZtysjFxRiFhoJ3diDGeCeT9ER
	Xru/IH7fcN1LbULGcvrjKfnT471oCPp9CI37ZaHQf5BFS6A4K+k+sXVLJydV8CP+kdQlHw96WLEMb
	XG0Stfdh18flcb/2HuYUmJOjE3JsdiF59XaX2N4h2PV5WeTV72LE6AvV03iRc78sXbMZ9/BCR+TQz
	5PGnpG+anGGA2IaYBr0+OkUdbMbz0adMTC4fKhsqnWAf5M0Hi8ERnJf+G725L3Y88NvM5cSVqlWuT
	oPQNoLjdtxP1IPq659rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLa5-005u85-K1; Mon, 06 Dec 2021 21:31:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLUX-005rpu-9a; Mon, 06 Dec 2021 21:25:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id t5so48497247edd.0;
 Mon, 06 Dec 2021 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJhO0TD9FxyBOSAsMHBoS4DzEUUiCc19SpaaArCSlRg=;
 b=TTK/sGlkC51XibKV283EHurB8uq4dFRC5lylJ+sSQgpvLZqv+YzfZOBRy2hjcRzRiu
 mDTZaPr0opOjufNa7GousDDy5K2UGMlrU/V2qN7hg1+kAnurKRYBkZ2jhnuQRSfd7uUU
 8N1ktZp695VJGlt2oR/Pj9eUB0rxT4oAm0ucZDv6Om2G2DKUqquYtotoXyuzSxDDlDxp
 EDtzFWuG6pXVODCq0IUMh9rwDJtPkooSJux3APW3GaAY4OmQGvo8wOU8CvtUzHmlWOD+
 GI/iA78s3VpnDMBwzegQFUSnvGTVMXNGJBqtLNzRrrVkYa8O9JeuGKVqti4i4owRkWU4
 poFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJhO0TD9FxyBOSAsMHBoS4DzEUUiCc19SpaaArCSlRg=;
 b=Pd+0RWdOiK97GuIwsSvxNbwZd+0LP8k0iw1fe2XIw2Jh917U5woBVMfXODuuKaDJrU
 5ertSCWXfHYvGkYL7Ho/GQeaTXjm+pZD9soaapT+w9ksFd9PJT5liCpXwIxtod634sEa
 veAcFm6ngMrIsXMROgVED223j3TMmkmJDdUW80YHrQE+ujjD+oAfqMT20rv5qkx0Pbsm
 QrEVwlB2DyUhZ0It/v9eIn3dMeZoOEw3iZTHqpH/PEQif4kb2v1zls+UVm9KfvtaE78X
 zOattrPj12hmVa9rrFG9o2+5/SUKIiDoofftdJ4ufjfGZuxQeNO1QM3di0q5UDzT5vjq
 HGYA==
X-Gm-Message-State: AOAM531O1boMxjB8L0JVaFBY2OwOefDs9jTqhQaC/dBXW88uM1Q6q1EO
 DfeGEKh7xqKTTo8LNTdJwPOssse9g6eWb8W8EiQ=
X-Google-Smtp-Source: ABdhPJzivefsaNiHaYwi9GZZhlshDUGfhrq9aeaUOKokrbFHJu1tlchzrUkrmL29IdqO1rYgGzvnKv9CgqpwJxrTkyU=
X-Received: by 2002:a05:6402:7d8:: with SMTP id
 u24mr2429113edy.215.1638825943964; 
 Mon, 06 Dec 2021 13:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20211206100209.31971-1-xianwei.zhao@amlogic.com>
 <f20968ff-667f-3fd9-3f8e-af8eced694f0@baylibre.com>
In-Reply-To: <f20968ff-667f-3fd9-3f8e-af8eced694f0@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:25:33 +0100
Message-ID: <CAFBinCC42vo0WydYeodgjiMH676J75kaPyVtURmmdoL0=Of=6w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: add support for S4 based Amlogic AQ222
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_132545_408093_6FBA2D77 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, Dec 6, 2021 at 11:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> > +/ {
> > +     model = "Amlogic";
>
> Please change to something like "Amlogic Meson S4 AQ222 Development Board"
>
> > +     compatible = "amlogic, aq222";
>
> Drop the space after amlogic, and add "amlogic,aq222" to the Documentation/devicetree/bindings/arm/amlogic.yaml bindings.
You can follow the approach from the Amlogic A1 SoC bringup, see
patches [0] and [1]

> You will probably need to add a new "amlogic,s4" family compatibla aswell.
For this (and various other code-review comments) you can also follow
the Amlogic A1 SoC (and AD401 board) bringup, see [2]


Best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-amlogic/patch/1568276370-54181-3-git-send-email-jianxin.pan@amlogic.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/patch/1568276370-54181-4-git-send-email-jianxin.pan@amlogic.com/
[2] https://patchwork.kernel.org/project/linux-amlogic/patch/1568276370-54181-5-git-send-email-jianxin.pan@amlogic.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
