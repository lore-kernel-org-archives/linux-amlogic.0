Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A89C11F68
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 16:15:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DEB6140C
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 16:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DEB6140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDqIQjrahyWYwTzdmqjot12Oig5ZLUPLULaM5r5XzVc=; b=b+QdjOanEdYxVM
	mSJThJEeSNvauqkGrva14R1iuplwL53gYkxMnwzEKtHbkzK7JCym+IVYPWPfR/AzqJkGEfyu+pc2U
	if2Xysh1ZIiu0izIF4gpl2eGHqmWTUdG2/sqzEiWYtgqjdNEP1xb4QvBFH8ZVoewbvbpsZclPDiwb
	UzF6FxK4ywTnsD9ltZHdDAfobMAcKNnvZjis8a5PrS8P/iY/Hgh3Ai5YEIJJzYc8fOEP3VD3H9FxA
	4PBkZfC6TOrbSlntVM20qST2GX3seamqd/99fbvi8ER1MIJOwrU5iI4IWAwyRZON8R7IEKSH+JhV/
	YPp24o5aL4BT2MIo1vTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzLpR-003VZT-1x; Fri, 02 Jul 2021 16:15:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLpE-003VXf-1A; Fri, 02 Jul 2021 16:15:33 +0000
Received: by mail-ed1-x535.google.com with SMTP id i5so14014836eds.1;
 Fri, 02 Jul 2021 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0CyPLvqK+Q8NHzNuZTr5kPFxjhrjFYWhZY35XEzbiOQ=;
 b=IbAqmb9ygFZk9a887t8qEkrN+RXWoHARiWHkHfVhqOrfUeyc5C9KeLOPdVZrHk2SVx
 gyxP3zCIzw+ztAO+vEn42sXTsh6h61gb5b76gPnChKNurlELilaYebJuqwgBUd1N5npb
 2UOAW6deQdfsq5DuDPWNRO0bW7/tGuEgUQk6jiHYWTI4klcfT8Be9PutLc+GLf7l7FDI
 T2zucV7K6m8be2MAb4KqkkBgSSDJcVB5ajBC5egeKZuo5JMTncsxWB/dC3ln5YsvylpT
 Y+SpGsQ+urLTsoI0AALKG3blP6Ud+U0jjQj9NXor35I1PG53iU8rD86ifFVgQxkHD/6O
 OiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CyPLvqK+Q8NHzNuZTr5kPFxjhrjFYWhZY35XEzbiOQ=;
 b=aMO6EqmBc0JqB+UUcUFLxLOdLC1HypQ55Rs0EM9+cbDNWC9X6mC0FffyKw+t6ZjDy6
 vI+xhGYxyu/BjMYDn3gcSiEd2pR8aQRBgLMb1ajudkrI7oOyh9l2ZPuhb65twVFWLJLZ
 PyvQD5526RAn6qyB/72NkX0fM7hnI3CAW19Z3CLBOxLfQbaPyUADv+m2lYRtTar4Lu/j
 3NbA5DZFUOV6fxUyZhtnb5CcZ2VDctpjqAJ7lsqYHBIYnocfhNkyHy9cilSpSiO8f2Hi
 fUfItOhERy3dHDV78OD6sxZ9tUUK+Yt57TMvB5u92XafhKBcw09D4TbBL1406epb7MDw
 nRIQ==
X-Gm-Message-State: AOAM530b9DhBZxYuAybl2COx3agCC9D33rK2acpAV4PhDhiFAkP792GX
 uSf6DmA2FE3ArQko2UweDGyH6Prf4bKtRd/9VHM=
X-Google-Smtp-Source: ABdhPJzTplJzJDgwT4b8/ikKLT8jsa9voYiaeLlsSCeJmsriCnofP+WlAfCEAN/jEj1wU+EwgK6wXThHemjJnDqwhik=
X-Received: by 2002:aa7:d8d4:: with SMTP id k20mr266060eds.143.1625242530226; 
 Fri, 02 Jul 2021 09:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
 <20210701215132.16317-3-viktor.prutyanov@phystech.edu>
 <20210701224646.GA18540@gofer.mess.org>
In-Reply-To: <20210701224646.GA18540@gofer.mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 2 Jul 2021 18:15:18 +0200
Message-ID: <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: introduce Meson IR blaster driver
To: Sean Young <sean@mess.org>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, mchehab@kernel.org,
 robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_091532_137978_31325814 
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

Hi Sean,

On Fri, Jul 2, 2021 at 12:46 AM Sean Young <sean@mess.org> wrote:
>
> Hi Viktor,
>
> Thank you for your driver. Is there a datasheet available for this hardware?
The public S905X datasheet [0] (starting at page 515) and the public
S905D3 datasheet [1] (starting at page 1105) document the registers.
If Viktor has additional or better information then it would be great
if he could share it with us.


Best regards,
Martin


[0] https://dl.khadas.com/Hardware/VIM1/Datasheet/S905X_Datasheet%20V0.3%2020170314publicversion-Wesion.pdf
[1] https://dl.khadas.com/Hardware/VIM3/Datasheet/S905D3_datasheet_0.2_Wesion.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
