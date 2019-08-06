Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32696C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 14:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C1D20C01
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 14:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c46yFrqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjCo23KK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0C1D20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KYC9GpcG8+xyLGhFD/0J/9OUoBcJ8/R2kNKeixVtms=; b=c46yFrqS8HzfQv
	g8C2R1CaB8Rnr2hvT73p57b1kmlDz8auHegTePJisWbx5ZBe42l2TRZtwwIOfzvjK6yVaCbGjFtq8
	rbyh9htMsAu09FNAL2nOUKU5XTBIJWW68WmsQj6WEv48zllqCbemILNTg89JqVJznY8ncpd7wVEXr
	Vd0E7O7tusc3XsxTLLfPCnYmGJeKlwtJk6tFMxW7hy5u6mwfkm7Wg4gUUSPmt6/MYPTEIy6BRxIWF
	Kf3lm7DR8MTzXtHTb+mKjNaaAi0Pm1zWRWN/K0GnEVOIlbU54k8eHmlZ9O7ionGQPXnsPOvTpr1mh
	nyJ1QfGB/DDSi0B4c3cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv0fZ-0001tu-DV; Tue, 06 Aug 2019 14:42:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv0fW-0001so-I1
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 14:42:31 +0000
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00AE620C01
 for <linux-amlogic@lists.infradead.org>; Tue,  6 Aug 2019 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565102550;
 bh=ayNN7M5ClahzSEkoICsJ9tdxykID4BzfuIXdV5FkkSk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hjCo23KK9npfTyxD8jeeAjpyJjaqtJFBgnE0fCBW8R9dtzhUGgWiy2uY1rCAKeSzF
 h0oxkZ/Wl8v2Oj7fpUNquvP42vRjAKNyvoDbmHwnw8NboCR1n/4PqblncInkAnISwB
 HHBYPTx2jHGfrekMOdrTHZBWUMzkelxWH/ye2E+s=
Received: by mail-qk1-f181.google.com with SMTP id d15so63024014qkl.4
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 07:42:29 -0700 (PDT)
X-Gm-Message-State: APjAAAX+STjQNI9/gMKgOwkVZ0AdBHhWjiA/z41qdzKVrQOHEY3SHSux
 RS3F3IZAxpzfCHMoo98454ET55mYB8J2eUqW2Q==
X-Google-Smtp-Source: APXvYqyYuQYdgl7KuocuQ/T+ajuGJuzeSGZTaiXznVOz10/x+Ufuo4OOyDhhu0VZEDMYzparLR0uzkrMOBPV7qu8mt8=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr3437539qke.393.1565102548144; 
 Tue, 06 Aug 2019 07:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190806075520.14652-1-narmstrong@baylibre.com>
In-Reply-To: <20190806075520.14652-1-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 08:42:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ=dUX-bPa06KxJowf_3GM2-mPwm4U1KyTXyH0thA1pvg@mail.gmail.com>
Message-ID: <CAL_JsqJ=dUX-bPa06KxJowf_3GM2-mPwm4U1KyTXyH0thA1pvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: amlogic: fix x96-max/sei510 section in
 amlogic.yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_074230_619331_F02E548A 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 1:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> Move amediatech,x96-max and seirobotics,sei510 to the S905D2 section and
> update the S905D2 description to S905D2/X2/Y2.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
