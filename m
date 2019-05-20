Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9605BC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:09:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C4B208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJjAGDcb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p0rilSq2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C4B208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LSuRAKEPlHTDEpwIdVW9M3Omyhi0q0hgKErQtBh2qw=; b=PJjAGDcbMDkkEl
	LUegOoH+vt2xSLfimmY5rCidQgAFohAYJLJG9aP72nlGhJCIznGuKqsHXT/42qyZJkAkT8hKSsRQK
	ehTfQsrWRTeCDpvQ7RW6TOMG8LyciQuHAYUVaTxLaXmFDPUa6u1gcoSc6S3wPFdos4oEpB9DQ2JmB
	fgWgNgMsahcnF3VBKZv47HQQhSwlvBiR70MeppLoCErIbdXm2eYUzgP52b7hWhd19gtbjY1Ddnqjg
	w1kYBNsfDP/A8LkQIAviD1relzFiw0B48J1EJPila2ey962e/OXB+5fhQofJ9tu2FbMaK4CTLMTlw
	UpKOhF6bnEtA+xRliRgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmif-00007H-Ka; Mon, 20 May 2019 18:09:05 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmiP-0008FX-MV; Mon, 20 May 2019 18:08:53 +0000
Received: by mail-oi1-x243.google.com with SMTP id q186so4034629oia.0;
 Mon, 20 May 2019 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=p0rilSq2HK/3GLFdIsM3W0esD1E70bZ4ap80QtZkmUwFik8fQLlRneXhyF69OUOLTR
 +dptkfa5Qvgd5BuCPhZZJ6NhjUlWda9smxTObo/ubrx/1pV9kduFim2wv9XuGdXkgFy1
 8KcMIcnNIk22Anzc2GO/iwhtyM2zEE4Zrz/dMqMHY8naFqRBrVx5TAgQZM0S4PSjINd+
 +CLOU8blq8nhhgJTo2gr5j8xEPZtjhn1ykKcN13D7C1dqAusMCsn+QwJXPwArwS9oMTq
 +m0t6bsGevtfOUgJjwVD1uKt7KLnb0WudnzeKk9ADP09ux2mdWfxK14WGgz3wmAfx2VR
 XlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=bWdi5htk/IdG0pTjqRJOuK7YwJTGGBSPmR0iWtkJOQfR3Kz8RjN+nDkp/Hko9nkAAn
 tg4syadwPcGIGYkR/yPgZOsC16rl2uEA/Dch1bJ+vaJSQjWhj8VCxubIwpprRT4HH1AC
 MRSCWTpgwChTmF/8p2D2P0g9Y3ZAokkwABV/3Y894x3H0BfUg0UrGObgh3H7PvnEnJAZ
 itKp/R0k9zS/a5C5OhGJEqvGJcqHTg0D3j9LLYJ1bl4FF1sVVqO6A3z2shw1ldaE3vGm
 6GVIVzI4FTLJFjPwqpEVFjUYQYhXcgkZTsQ7yO9pKZJ4lOE/QQEgPgT7ev0FJ8Dm9J+l
 saHw==
X-Gm-Message-State: APjAAAXfDzcPGnk5rJ/6GGY8cJ1FhNynQluc9U+jnwXdn+wEXS7Mny6N
 y1pQfBIcIG2Cps+yr8zJXR9w+E96XwPJfsI+sHk=
X-Google-Smtp-Source: APXvYqwo63kXnxppc/g8GoRRU2jASvWNgeVjHOKQoTWH78i0rEmmwsrELvB7RuW8hSB4HTgDUfOK0kTXRZAhylYphKE=
X-Received: by 2002:aca:f144:: with SMTP id p65mr322071oih.47.1558375728938;
 Mon, 20 May 2019 11:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
 <20190520144108.3787-6-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:08:37 +0200
Message-ID: <CAFBinCBV_TYz_gf91iMBFk8bWBwx4kpAQ+d0n7wJQ=Xo5xKmOw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: meson8b-gpio: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110850_316036_F46C5FC1 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
