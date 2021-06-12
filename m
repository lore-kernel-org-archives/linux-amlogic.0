Return-Path: <SRS0=bUyK=LG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C285CC48BCF
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A9F761029
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A9F761029
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG+tX88U/5x9OvXdrtN7WJTNIUmixusxbWfkELo0jdU=; b=2WwbVkk2JAnIz2
	c2VKlT5VQs3qRdznGXyv8Jnk9KtXqxoGn/s6P2psyXzbZcUBZjwt49mfxglfvJsAlrIZ0e6uE787/
	QO68grwtkpYcbq05gg4HZ8RE33sG+fR2G4CIj42trkfTdCCS5Xdc+o9LHftCqHtRiRYUQkf6VVmCQ
	6rlt3mvPCoNw+yPJApXcHR/bCvWamHvAypWMrCo8czKXnDlhWcevae6Ay0o+FGsF3a7A/GWPhXG+e
	pMSbqoWe6qtamVfdusj9iKLF0tMyEjuE5f4Kf1wg1ZJ4LmQaiDj1zEKowBjsUQRqiUnhiejtULrDJ
	S2AR0Gg6Zc1J0Rd3zXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls9dr-0094FU-91; Sat, 12 Jun 2021 19:50:03 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls9do-0094EN-3T; Sat, 12 Jun 2021 19:50:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id h24so9714681ejy.2;
 Sat, 12 Jun 2021 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIMk1za7gIwbBysGV1BobCxdF30mvznLvy92C4pEuvY=;
 b=Xplxl9T9BtKZrBQqAGK4q3tu5f0ZJzMu+F4Q0JTyBk8wSMfA2SbJ7AMu5QtBbd7t+U
 1QNoq88nPOiV2jOEapd1kCFY95S0mZAcY5svzcoR5KOUdEVBI1nRTEtnwudyawMhZs0e
 C1xgHjTBP1BNz5HtatANpO1q4eiIdFU36DU85rCGdh4o1MB7vF/5MAs63WgQZJAmG2Fp
 YFKYLjbYjL5jMrEK7AQPqDiKLjt/PsUJXqVarTDNqI+iZGHKCuE64uSr9ZtgmZ0X6poa
 /AHSR4Jyf4XA1ktkXaCTuNliRvFDDS2Owut2HhKu0VDrlrldLy7YOMDArATY3+x1VIMG
 lQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIMk1za7gIwbBysGV1BobCxdF30mvznLvy92C4pEuvY=;
 b=Z+mT27STAnh7W/j+82+iI9Okma2DLYiob+CFuJ93bZec4uoqDNgjZW65rzmqk7tBsO
 Eh1P6PH6fTw8mDe0TsqeVh+AjgNVXL0cwNOfKP0GJWwBkqEhmx9nYsgzttHxb+AUFR+/
 bQthcJLr2vMzWCisRL1t4vcjaKfNZYHmJjGZEIO7z8o79U+Lcnj4vNP3aY1hixVIPy1x
 ATnVc3Bo3kMX2e+J6XoK3edIjnpP4HW9gX0OPgjBNH+CARjLNfj4i5ElmZecMBMSNla9
 TwK7geQ+ZqRBq/0KYPajxb7gBWHXktbFhiX5Ozob4PYqhcwLvOEJRDlYTyGbx5o884Z0
 6RaA==
X-Gm-Message-State: AOAM531uG0/ZwctNfXbKii9shMfxkVm6MNMzUw4ItY+52bVH0WOnGNxB
 SdfhW5oV9N27JteSnv7MkcXvRoMd5inWi3zz8zY=
X-Google-Smtp-Source: ABdhPJwhXAh9aO1S25/+ZNsLEAlFqRL0/SSaYDZzQeQd2YO9I4P9Qly952nnVwRxAQq7XNB6jXcUOcmg+9irq1fl3Sc=
X-Received: by 2002:a17:906:1682:: with SMTP id
 s2mr8758087ejd.172.1623527397423; 
 Sat, 12 Jun 2021 12:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210607065435.577334-1-narmstrong@baylibre.com>
 <20210607065435.577334-8-narmstrong@baylibre.com>
In-Reply-To: <20210607065435.577334-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 12 Jun 2021 21:49:40 +0200
Message-ID: <CAFBinCBFa8UGdY+E+zdTgGEjRYQ6Y57XNf0sV4ixGLruDeCa_w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: meson-sm1-odroid-c4: remove invalid
 hub_5v regulator
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_125000_184253_3B62434A 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, Jun 7, 2021 at 8:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Drop the hub_5v regulator which controls the HUB Reset line with GPIOH_4 which
> is already controlled by a GPIO HOG.
>
> Until we can properly describe how to control USB HUBs reset lines, keeping
> the GPIO HOG is an acceptable solution we use on multiple boards.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
