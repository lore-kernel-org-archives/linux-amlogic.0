Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D0DC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoWRcswrSitPOHkvAlUjS8luqNnbtdT4nTLkNwfQOYs=; b=atieJad+VUoiJs
	NcpiZM4lu6t2dTC8FxFONvWFpjMaJTnUPowd1AzQSujSZBFagGM02D81XXqKWPP+hpRC4wwT7Uvlt
	tNtlSPrsCyrfhSYxuqcxuN7f62DiJAknXJuWhKyCVLDwhboY//9U7utfKq/dHO6bXGecRf680olrV
	XPfVeKe7lPBGr54ch64FkJ3Z52/DmYtqLL1IYIu5x6PLdvra8cGKH+3WD48/M3QYz+qCDXcLCvAPO
	RiuQGzudibtsIko6nSdIRriOqheBNwwOr7LilbS0Jef/0z7erw+w2o+2HWaKAjijv+aPb41ZUg/mZ
	XToVHFdrDIN05F6pxnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33Vz-005INf-E9; Thu, 30 Dec 2021 22:03:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33Vm-005ILi-DL; Thu, 30 Dec 2021 22:03:03 +0000
Received: by mail-ed1-x535.google.com with SMTP id f5so102694509edq.6;
 Thu, 30 Dec 2021 14:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4rPv5VDwkM83EawqCJtB0oVkX4cCpnpIagZOktIPEg=;
 b=KP77+rwvPFHMRHO0h2rei104u2bna4Y7qB/oPUvF45hW3XvJHImp1B9v0CM2o8Ti/m
 LKOTa3MXWHau/fN1TUHHiOGNi3C8BKmhyHJI4ZOT+BXPoaLByHEWo8jczyVyGyFwitRd
 6cnHuleAjOqPsLThQumyYOtnyqYuFWrkLgUInNxWYRKNfmb13LPFBu4qoLKL22mnBs2x
 qMW8LRHB2DwqI5mShTRefBCWkDiunJXucrHekJ3Qr7Bq4xiaJK24eTHOQZkFcabk4xst
 gFcg9diknN/a1nxkQbRad+P+HP4Aa8AexMnUHH6kcHBglGIL1SltHcpNo+wdH/u7fUay
 UucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4rPv5VDwkM83EawqCJtB0oVkX4cCpnpIagZOktIPEg=;
 b=X5HcDQxDPaU6XuHY2rMIVu/HkD5/LASnq81uDMeh4XMBIMaRJzo971NrgEC28tGt18
 SuGncm2C7mIB8xl04YpvpmMaRHTf0g2/7Uin+2E8FJrysrH0SUcVVgf00isSA/lYIe5j
 yvMAgrLdh+ZZq/NKqhHGk+alplhaAvpAtgJFqQsNcP3bXkYa7wP9LNIcG70QJDJMPfUm
 WXANT/DrR6IUgOTglocJUEJExLhlxwLpcxKuBb1WKkxnH4VOwA1Yx95WFl4Nr1dFy7Wn
 RuIvCG79I5GhxhdKWYJHMR4/XFuyvHY/W2NBGwpHuN22RZ1hXn4I/HORJeuy279G2jV2
 r+qg==
X-Gm-Message-State: AOAM5305FXkdOey3G51z2rHK3AFJayvWKMNN6/y4AunUDDmXo32x+ALM
 kFjKW6YFblQRs3dC494wV1edQ17/iD5AmPmQVNM=
X-Google-Smtp-Source: ABdhPJwb4aizU4r4Vj6ngiBpF0BpCUqb8kK+mM1bIo+bsO20kdfcwhMhEtb5qb9Y3jPUOqlY7wFpHKl3U4dQA9/OTww=
X-Received: by 2002:a17:907:c2a:: with SMTP id
 ga42mr16415571ejc.147.1640901777535; 
 Thu, 30 Dec 2021 14:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20211229121605.10513-1-qianggui.song@amlogic.com>
 <20211229121605.10513-2-qianggui.song@amlogic.com>
In-Reply-To: <20211229121605.10513-2-qianggui.song@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:02:46 +0100
Message-ID: <CAFBinCBMpsd2JCz0ZZPDiaVcfV1an3O42a6B9yZy20h5n7KXCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: meson: Add compatible for S4
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_140302_511172_196897A4 
X-CRM114-Status: UNSURE (   7.65  )
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

On Wed, Dec 29, 2021 at 1:16 PM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> Add new compatible for Amlogic's Meson-S4 pin controller
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
