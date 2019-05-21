Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC45CC04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C9C217F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POfG/+Rf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="n8lCd1SP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C9C217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wCZnZdhhb+EDzQ65PT38No0XIo6d7qSALj4OGxK6js=; b=POfG/+RfnoWpJj
	0+CIKrG4njml/J+TxI8F4wPUmSBeehfGWdroU9+/OaRYVHQ7S6gSxBjjLzjUAYHLHBJfoY1pODTun
	TXwsNr9kGtH8Z1jvrm4vjhqOyl6MRW9VZN6ODYxWeeZqEu1guM3U3RXbuPx70v4FFmlLTJqKkkOmT
	YA8yDULb+x/ypriKZb46ZG3XhmWnKRFVsJuryhZSELpwAtWpcbczMR72Flw09gl5z7/1W6FKdoMtO
	iuw8gpHA8Q7Zbyqi7Y/SDb5oIqQ5jNi0PwJcU+vFaGxO3S7AIOIcOtpzjILZKjp9MT/tGgg9Rb9Lh
	1uv+XHJg2rx93wvTMnsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT8XL-00056N-CM; Tue, 21 May 2019 17:26:51 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT8XJ-00055l-7u; Tue, 21 May 2019 17:26:50 +0000
Received: by mail-oi1-x243.google.com with SMTP id z65so13389269oia.11;
 Tue, 21 May 2019 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eJOLO6+fT4P+SCiRyBPi4+7nDWuVS/cC7SMFnlO8FSc=;
 b=n8lCd1SP0iIV23NZM5l7ia3aHOMNEtqfLvquCPcDPsnqwrEWFZ6vl9vMTQd1JRdQeW
 UXnFXy2vE1aEiifYnBqCVNna1rQH8K42SPgJjgyioDfJUNT92VDuAJx4Cr+reAYATiDn
 UOuJaaZ4PYi0cMSNKj5rrruCriHDjB/stgLnUu1+LH4TivLCmw89/aIaQ9nmfOekILtW
 wDNFBJWclJkOjPCeBpIj6bCh4YxXb5j7KtRis7iP3uU8QnIYH+JMtCgbPO15VZR60Tc2
 iHq6G+NRKM4NCrdZtpcARpKhCG9mABICAJd3F/9bTuTDbBcQd/cCUzhKfrtYVrHLU6jx
 S+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJOLO6+fT4P+SCiRyBPi4+7nDWuVS/cC7SMFnlO8FSc=;
 b=UUwN9XVpf00huosUX3f8IB6KSyfqC+IaG0DIoN4XsSK/PbCNBUMJ/YoW/oP43Ku4c9
 Zh2eFwwNGEKHldek93rWSbQH+Y7aIPuhf3Ek47cChqgout2axRRMP+y3UNyCioywJTTT
 f9SKK9v0UM/Cn2A3FgFfy1AsRyxYJwSyGsPqqn/9S7m/o9s6fQtd9TzRiAWqw1LXyHgS
 X+F+upK7rwDw8VbIV48hLpqIEFKcUyRLO4yJgALeeZwuSKx8N7gY3u0qvCkytO+47abn
 jCrZAEFkKxorJLvagNyjdAccf9hpqOyUfDo+sMQuRM9eKZ/ITx7yTbTxu93Z/B1hm5Ug
 17dQ==
X-Gm-Message-State: APjAAAUd867NaZOaeP92aKlTVxj1uqoDGesKciQlxxmFzHKgf/R8tAft
 4khOND+tn9SJKPrUdzv6ElAQQJiQas22D4gsGeg=
X-Google-Smtp-Source: APXvYqyxdi56Ueg7EALlUk1Ep4gxIoClF1dtxww572zKOE3qzb9zruGzNqp+lYbXuSuglCifRABlgvwxXURBaXVflsA=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr4436854oih.39.1558459608028; 
 Tue, 21 May 2019 10:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190521151952.2779-1-narmstrong@baylibre.com>
 <20190521151952.2779-3-narmstrong@baylibre.com>
In-Reply-To: <20190521151952.2779-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 May 2019 19:26:37 +0200
Message-ID: <CAFBinCCvoq0xkoCCiOqh7YHegZB4SJBjDMJTxEknDXogWiXUxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Odroid-N2 binding
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_102649_291437_0EAD86EB 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 21, 2019 at 5:19 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
> from HardKernel.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Rob, Martin,
>
> I converted the patch you acked in yaml, I kept the Reviewed-by,
> is it ok for you ?
yes, looks fine to me as well

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
