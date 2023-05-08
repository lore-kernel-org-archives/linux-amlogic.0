Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DB3C77B7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKYR3nDVD5o/mejUgqigbrTAJLdIbhNB1L3KE3DDV+Q=; b=vtXMt1ncBUBXDM
	nF14EvRAuu9MY43Nr81rFWROS9BWlXWFBsoX6Iu7xv9weqBml2FdpUarZMPYeVfM0TwJttNhRknS6
	Z3F7P/0JQ/Xa+mOUZvZ8Q5DkgYklhl78XGxCHt1gGNA1yP4ZlVE4JD1bxw1/L0R/yp8Rnhp5pSFZQ
	iLXXW4kQ7Ie7ZHvOn02kpwIOaA8+6x6qexAjPz2m4cAVz5v+Y0nUY92Fyd7bIgTL3Km+JB6e59Vaz
	83/fCZWHCHKjficpoZ6iBnADN+NQ5xFD1KnF2kClEus9RRsU/vPWDKwp6r28ZCs/4FukVTAI1j+1a
	C0eiZMLShWcT5pedWdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6oT-001Ggg-0N;
	Mon, 08 May 2023 19:46:25 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6oP-001GeR-2V;
	Mon, 08 May 2023 19:46:23 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-96622bca286so478641466b.1;
        Mon, 08 May 2023 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683575180; x=1686167180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NtJxceVAbEagHvQtUU9/qw+tYoFv4N/txoDVssCgCY=;
        b=PxHUOLMaMdGfRYeHzqC2wYDoWjXRpm1f2e+OpkGY/IVYOpni6P2/+XRHr1Oa8NpucF
         Fmbu8D+5W8p89HBU0s1l1XPv9Uya20spJPnsjK+4om0CYUMz6RRgw5KGEohWu9qxL9Td
         RzX/iu64/mt66fBU04jb4L4cFRpU+6l49tkaGmzBkko43m4HIm1Ef1dxPRl8oYkSDIX+
         t77D80MJHGyKKF4MzDlBGeJfUhR3mAyuKAtPIIRF8ZFEPT00KPOAQ4wXszfxU/LZhrwz
         S94xOhZvrR979cWDFePjBVOcChyiU00KzYIDteXTC3no2sv4U1wALe6WutizM7PL8ZjB
         WfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683575180; x=1686167180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NtJxceVAbEagHvQtUU9/qw+tYoFv4N/txoDVssCgCY=;
        b=PEXwXsjZmjnPNO5qnXpYRVKD56cyBNVLuEf/3Aa96menF3ztt0ue4qBv1gfWbEUWNB
         bOuY4ABXjPya2GtBEogXJspnfmQLtfAi9McwO233OsJcwQbXTgaIij1lvQoR3GGDXmPj
         GkUQHn4NRPUSL/MetZrV8Wa9VkpGmAqvHn+/MDxQdyoYiDsRv/oV5fmYVY7MbJ1qF4NK
         ItCvCoqHfEZrUccgOC581pQSKLgBKDqn6bIFcXQsfvp6YOVCoo4TvA1/HG15MaXxKHuP
         IcM5a+oFtTtBXxVVzsqTxY3BFhxUWypopG4yqQWbrUg+l3chJVBUcs3Ep8Gi0zpglaxy
         YmdQ==
X-Gm-Message-State: AC+VfDz5buW0uHVIiuGaVG51oUG+JMg1X2hHNvb3n7YTe1rWiIUE6Bv2
	Cpw+60fETmI5q/01uqzQgH7eLzTp8Y2ggp1NAsM=
X-Google-Smtp-Source: ACHHUZ6yOwrYoQ+snTUAwTEeCmMFhkQc3bfTdJ4HXRbhf28HnR2TFi3FxXit9EFwPnHMgLuEh4FYTajknvxnLZaFpzo=
X-Received: by 2002:a17:907:2cc5:b0:92b:69cd:34c7 with SMTP id
 hg5-20020a1709072cc500b0092b69cd34c7mr9808555ejc.40.1683575179927; Mon, 08
 May 2023 12:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
In-Reply-To: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:46:09 +0200
Message-ID: <CAFBinCCeh1eUo1=pfqmp4F7UsuKZ--cja-16mCqBhV-cgodzqw@mail.gmail.com>
Subject: Re: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater
 than UINT_MAX
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124621_817558_B615BCA3 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMywgMjAyMyBhdCA5OjU44oCvUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBzdGF0ZS0+cGVyaW9kL2R1dHkgYXJlIG9mIHR5cGUg
dTY0LCBhbmQgaWYgdGhlaXIgdmFsdWUgaXMgZ3JlYXRlciB0aGFuCj4gVUlOVF9NQVgsIHRoZW4g
dGhlIGNhc3QgdG8gdWludCB3aWxsIGNhdXNlIHByb2JsZW1zLiBGaXggdGhpcyBieQo+IGNoYW5n
aW5nIHRoZSB0eXBlIG9mIHRoZSByZXNwZWN0aXZlIGxvY2FsIHZhcmlhYmxlcyB0byB1NjQuCj4K
PiBGaXhlczogYjc5YzM2NzBlMTIwICgicHdtOiBtZXNvbjogRG9uJ3QgZHVwbGljYXRlIHRoZSBw
b2xhcml0eSBpbnRlcm5hbGx5IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFN1Z2dl
c3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29t
PgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
