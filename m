Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57E0C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 19:00:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477666191B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 19:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477666191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7O1wHCqc/AXyVkpamazD9V6EHwIYNQaRu4hiUDFZEoA=; b=Y2HeAO9YAWSXbGeTTHbNs/KtE
	+KxbAJIfQxlenQlbFRG93Yl2VgXCU9ASl4nh6ImXWvEYqlnwwVSSvukXmDpL1M7MBL1nvgpAgrziL
	5hsQQ2r+Kx2SjqnibnZxSJFb4+fFWuHksoM8c7/zv3nYY8LGy1GkSbvYA8YwdfcvqOb8FhypycBji
	h9nnW3eq6AYAERTe4HCoQOgIhQ4/hNYktMoaWQjImmNt5cZgkQjUSAIRHiy1jMVhAyjWNLyHq7P1p
	9oMXijqJ/odIabW3eWdeSQlw8Diw8AhfmD/5qjAwq4fEZiXNKqwIVVW5fTdtz7UAoFUC2b1u+V49c
	GyxCj1/2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx7H-0019iL-Rl; Mon, 29 Mar 2021 19:00:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpxZ-000c9j-7d; Mon, 29 Mar 2021 11:21:30 +0000
Received: by mail-ej1-x629.google.com with SMTP id kt15so18798903ejb.12;
 Mon, 29 Mar 2021 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8X3xkCb2iKB1gBnb2OIJ1fkuZbHQANnRKaUSTzssmg=;
 b=ESp1OIAIKANj6P4M6l2SRGboimfHCB6ez6cMjR5+bnW41ngioW7pLqCe4Nr5o8WPr+
 nw1AX2EFcyldrHMQslSs7QQP+/XPZQPvNURDiR22UA8jPEfLwta7Icid6eSeWVPss9dH
 IFBv21gGNGwQZ+Cr129IDO75lofg6HGgLPDy4y0NBhdVe0iW6AkOnjyS6OUFMRmBPA+C
 Vkt7E20tE4bgZv4MOc5XA52IvweWuGCAkCyKHrgRtYQrs8tXfIaOfR2frcrFZVAUfQuB
 eq1HBc8KwmgMak16il8V0p82DAjML0EajwgZrYN8+Z5pWzYAdICjxcp4gDNwH47k8T0U
 3BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8X3xkCb2iKB1gBnb2OIJ1fkuZbHQANnRKaUSTzssmg=;
 b=BS5By4FKgCqCwL059Mh/XfCuTgCT9iKp/T244zGWlfc5pJkbyNl5JmmlVay868gOEX
 J5DN+isVJifxCSYjXZRZP60gJTofqW0J015M+GTBUmFACE+1cfzYKFwEsOIWvqFWy1hU
 +5Z/BOCm48X24Wvkzv8qrAPz/bQkRlE7Jf66FOpIy3nX3C7fK4zKFbEe8lCLbcjZoUPr
 YCb2/l2rDfgrXW1baChnu7yofApt38Z4fvxR3Z/CxSpM6cqwqYuDFhsXE5yT+W7d0L4D
 VU75V+NKBjUUyz1pdqNW3gmH6BJYcv0x12yEbskd39i0gaANOPOrbgyvfGn1PtwA48xp
 w0aA==
X-Gm-Message-State: AOAM532Ks512IwEmRzFi1Xk8jVU6Whan1CWhxE2ezPjqBPm4VoMLWVG1
 voX3t8sCj7Ps5DEfD+JeCvTw91BE31fhEwblvUW63txyrPE=
X-Google-Smtp-Source: ABdhPJwO88tlg8QBHREqzsFMcEe9Jhi5Z9xZo47eaL0S4suKjsU2w2XhA5xvl8Lf4/MlD1zHmY0pKal0XDGBU0uXrLc=
X-Received: by 2002:a17:906:52d0:: with SMTP id
 w16mr25472016ejn.172.1616966655864; 
 Sun, 28 Mar 2021 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
 <20210325152410.1795557-3-narmstrong@baylibre.com>
In-Reply-To: <20210325152410.1795557-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Mar 2021 23:24:05 +0200
Message-ID: <CAFBinCB0_xonzPnZck3Ji6x9x12uLshDYo29nnEjqh8unn_YyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] tty: serial: meson: retrieve port FIFO size from DT
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_122129_397211_F788C9E5 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, Mar 25, 2021 at 4:25 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now the DT bindings has a property to get the FIFO size for a particular port,
> retrieve it and use to setup the FIFO interrupts threshold.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
