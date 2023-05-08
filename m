Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2099C7EE22
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyeFZTDEoIJjdoFvwt5M+sSfZp8ICUN8LD6Lp6zgbNA=; b=2HYCXqVx08/Ep3
	Oi9+lNbl1UmfKIm98zTNA1f1uqRPdK0vQYQMsYluHIO/HjDfo4Lol0p/pCboOycsCV6kmUKg/DTPI
	ihrkRuEiVpR+unw42BhArD3dMd5UObcgMPeEixry7wwjHEiSvrzPjBvo0E2w0BAVonJPYw6QVoApu
	23Qzj52mnpC07mHdVCI+zsi4kJ+IX4ouO1JN1Wrss9ISBf3pSghmUzdCIbjhmvUJjV44SyI/hxipt
	684wXj/efhmd7amYxZUC5OAmbeKRGCDywrqVKEl6JjMgribkCz4QLifs5iUCcrHn18wKMHZFKQTMs
	1B00mt0JMHbtm1Sv0IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6i0-001DNV-0C;
	Mon, 08 May 2023 19:39:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6hw-001DMm-2C;
	Mon, 08 May 2023 19:39:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965a68abfd4so934524766b.2;
        Mon, 08 May 2023 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574779; x=1686166779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZo5wi0IhdS732BMMRQ/ooi48+6IHXRkVw8vGwD34pA=;
        b=dOYh7jgfGYyk9pQCmU6hRNEAgZEydObWFJsZYWau/MLAPg+yYOsc4SnyWAZDTp9yXJ
         E2EnxvAFbFUUyIX8McR0YjZd+4WasyeB0330Zt+XjQ9a0ex4hwJq/93lFd5r+EYsD4Sk
         i/iJ/F4NGXx9IPJeMPgCLO7CVTzp0zg+58gVVUtl8FmrakIYOJhAh8xcgFBgOGl2KMCG
         cevVuao3FMIhROxStBUqzOlbMNiHNV5DDdnRG625Rnqc5ORm9yNZS/F+k9Rtj9LAYD6j
         B5gXpIMFAsGlsl7eDGV8gacSlcf8Rztcz2N0ctcOCRxe3AH2XkiSWKpbxCf6E/Nz2rnj
         79gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574779; x=1686166779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZo5wi0IhdS732BMMRQ/ooi48+6IHXRkVw8vGwD34pA=;
        b=TdwbT5PfT3KgCLmEk2K32m83TKAZoDKc+xeOn+3uizMgACY0znsXDaV2E79Xl3URa1
         DChwWisOIqNuWlC3ojuTLPzrFrh3S9KCQDrswiOQBUbwKS/PlXMcZT7XsdpHB/Pz6arJ
         WOixozjGy0UixNGLu4V0bCCKSWEyZ5B4AXze0I41gMAupMCxD6iDzE2ikRKEhV49tbo6
         iAnVF2vkPA/GHx4C78O52/immAloqo2iZPOrcvFpkddY770clfE24e9Kc6anmSBWcffl
         AZsLjizR/nEZQ/ZHfUfXJQLxkzJ3XVxTr1MyyZXl0jd8uBBctWWsDvoJ7KLi2/iNOO7U
         C0jg==
X-Gm-Message-State: AC+VfDyr6bNxppJIMBZ1YZtscqhNSMYUcMRfw4s4aySCTC+0Xogc5wMx
	xFUysK53bLN2RJEJWcInQj0gMEtwlOv1k3egzagg7onOOGw=
X-Google-Smtp-Source: ACHHUZ4w2oFvtz1UalbLPpJhTPOevQ0PaRpgVvwZl0CCFJ0YwHL94e6Jp95FUcVBFMuQpEBibFIavKk9Jp6iVJVLLLk=
X-Received: by 2002:a17:907:a4d:b0:95e:de94:5bea with SMTP id
 be13-20020a1709070a4d00b0095ede945beamr9526177ejc.56.1683574778804; Mon, 08
 May 2023 12:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de> <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:39:27 +0200
Message-ID: <CAFBinCC3kP7vTZZ6cdCwn15qtQCqVfVhVS0hDpbX7r0P8RA1qA@mail.gmail.com>
Subject: Re: [PATCH 30/53] drm/meson: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_123940_728320_80DF4B21 
X-CRM114-Status: GOOD (  11.99  )
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

T24gU3VuLCBNYXkgNywgMjAyMyBhdCA2OjI24oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCBt
ZXNvbiBkcm0gZHJpdmVycyBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUKPiByZW1v
dmUgY2FsbGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
