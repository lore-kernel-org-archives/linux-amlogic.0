Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2398C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiO77poz8SG0cQp+VlkhPbY8qD8+ZcXmJ7OUjPGU6Go=; b=iFFfcxGTRLQnYA
	wSdPpT9vnFEIz7eMbLXRhGXAUhuax9FCyDh6TkeaQ8aOMEeUd++PZtzwsTMFe3nZiS1hMhXhOluSB
	iUP4xL2pqnEbRslFGxcQuI2WA+bgvOu1Pm8YBlMbj+CnFz9ZF8xHGV/i9sAFEK4COhqyLr5heCz6h
	qa3glZU0p9cXPS62l28a3y1NBnwqc04ZS/8uT9/u1lg9/p1So1wON0ZE5u/AfxY44VznlhXp+v+ev
	xTbuWx5EmcMbE96C4lRdonmSysRViZlb79clAPhPkfc/NQEEB9xhlyC3jD7UtrHIkMxBcFdJPBcqA
	DcZSTLGY5k64UfI7SEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoSG-009jy5-Ad; Fri, 20 Jan 2023 10:17:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoQW-009jDT-63
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 10:15:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bk16so4368125wrb.11
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 02:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ril1swV1R+hDAF9LknluyICUN2es7YWX6Imr0pDgjpo=;
        b=C+1n6li9rkMtthIDJ0i1JnxsRwnOJGLXYU76WnO2SPd97meX7h9jvhG9ONC4AWMyLE
         UiZmmg5ertTzKELe7dnQfXg6sLOjm4ocRy717sAEs8LTs6Byw5QKAa4A26TloL2Vrvar
         i8LUgRh87HnqPfbRUS7lS3Z8RkJ2dCuHzuNGTe67hNb1BoPzP0B5rj9OzPT3syo0iDmu
         yk7o8NsZtWYraw6cZGBWprGYcwADC3hvXl9//C4LoFRt84bpgrjEUFKBjknTolSS/S7f
         9oe/C0K2/322qre0cTQ39x4z76qgWd9UjiGeGrTVy0MioAeawQe/f//FO47uLdEOm4+Y
         1Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ril1swV1R+hDAF9LknluyICUN2es7YWX6Imr0pDgjpo=;
        b=GUNY7/0hz0Hpl0RYJz4rKroDUz8ZLNIIdOhDzFTpnLfF0qczWy9g2i7M4cqRIj4eh4
         EBR6voHAPpLyQMKlptKk6Hg3ehTAglSBGvpABvKXEOwzLl766C1ntYRgEy7x1UFOtIq5
         dJev0xi6HA+5nJLUAZdwoPFIJMSA2fK+5l5reAj+hUqhr3YLYqZT1WjXNn2lSx1Jyuqe
         u1h+Rf+UXxD7sk3QNWaLaKPlH8VU/eqWHI0wuwafUyHXZUwJJZDucuFFbmpTn7mQgI8N
         OMzCWgwNHxIyywPzuxV70rsSSbcd8UuSSvcEaPpiHlQVEEeOX97XzmlBuaudfyyEQhn4
         Cjbw==
X-Gm-Message-State: AFqh2kpGaFIn9jfnRVZaLHA8Txa2nW/1WOmGUADz32cyVtyQZ3oQ4U0P
	A7oP6yrm0TmlwrQMDFJsnoxHEg==
X-Google-Smtp-Source: AMrXdXspp38zMEFlOmPzzPcZ9bV4OI1r50uFYJJa9bV+wIZ0z25b2cgR90lgJ5ffAc+d+9PuKAVl/Q==
X-Received: by 2002:a5d:4d8d:0:b0:2bd:da99:bb8e with SMTP id b13-20020a5d4d8d000000b002bdda99bb8emr12480445wru.52.1674209714537;
        Fri, 20 Jan 2023 02:15:14 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002b6bcc0b64dsm23441127wrz.4.2023.01.20.02.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 02:15:14 -0800 (PST)
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
 <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <84871cc7-2f96-7252-768f-5f869208045b@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Russell King - ARM
 Linux <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Kevin Hilman <khilman@baylibre.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: mdio: mux-meson-g12a: use
 devm_clk_get_enabled to simplify the code
Date: Fri, 20 Jan 2023 11:14:41 +0100
In-reply-to: <84871cc7-2f96-7252-768f-5f869208045b@gmail.com>
Message-ID: <1jk01hwlzi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_021516_291698_7EB26772 
X-CRM114-Status: UNSURE (   5.70  )
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


On Thu 19 Jan 2023 at 23:56, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Use devm_clk_get_enabled() to simplify the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
