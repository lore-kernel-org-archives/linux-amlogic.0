Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A87CC7EE22
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhDp/9gNdm/rUIERHTS0nFWuaSVnJ9mVbMlPDKUHO5s=; b=bxldxhvTeKDMni
	5qLpiBKrdDNIv6SpwC4w1jd4j4j8rkHvwMSCEox+4DsaExm6L1jpoTozEhp0gm3fObhYawh1ege23
	oc0EHkYm06HoHkTXg/RbEuhbOeR5mLRYg9YO8l+zLxcpnP5aFao3e2CawDhXZmX1JIFuxxe/Ng8Py
	JPh0tR08Z2pZ1jk4haLeApI6Y8EG6z9WpRhXdITKbQuiffVg/EjYa+4FlhUWHbgNno6icmY8lowuj
	I2yJ82i4SiYyouaNdwDKuGFcFDAI/tNbAQYwjnxLlgIV1m4wje+5S1IncDd2ApD65DK5Y5xPoaIFc
	mt9s7P1eaJJKof0tk34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6iN-001DTX-1x;
	Mon, 08 May 2023 19:40:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6iK-001DRv-2d;
	Mon, 08 May 2023 19:40:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so7651504a12.0;
        Mon, 08 May 2023 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574801; x=1686166801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/FUv0s0uxGOAEhAmizPOK6LOstZe+HzXc28uj+u2tI=;
        b=rPYVxJN48NAgnAnIvAKenwk4IOJ2RDZX29vdTvwYD2TokVD6CVXdI9lEegiucUrQWG
         dKdyA0vD/Ak2Q2zY55nXUUSUyExOhlv3mOFTU/uGoqmECd7WednDRMz7nuGMs9HcAInb
         Je1mBQK1UFWkjwEczcLajJP7TyYVQeJrPEwzfSFeKjY6T4PJV6R1H/GxTJlsS0MY4Xv6
         WK1TlZAI/hUlAehA+erdkjD3TN67TmX9q3LL3iCGZaQl1FQQImbhcyoPowenU5zhmxwc
         AW/WS00jX20tZzN2/Vfk76oOLD7bw3W961Hbjz8ViyZ36/oKB8iiaZcJtjCvHjMrWMG0
         6PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574801; x=1686166801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/FUv0s0uxGOAEhAmizPOK6LOstZe+HzXc28uj+u2tI=;
        b=Icjb5TJri3hCyoQ0FoGx7Sn7txTlqaUK7brkA7y/7nPC8GhawgqXnIweSfYL86ItZj
         Eu4Z9Id11yFge04szVO/bQjWBH3q2BwZzy4Dncd2GmP55fVeeFQwXch53y47+B4ZXF7I
         HXFLG0jZIeLAOjynInrfLQbZrTkkgTJH6+ElnZRTfEQF45JTw901Xe5+NTDQSqzkNs9W
         xoxxEEnwIkocn/weQxVE1bjRozty1ZfmsyHIQQb7AHxgfINw57psfRSc72QdqI24+sZv
         SUOTk0dSSprziCrJsjrRWCNovGfLDqYYirkucVmbyAyWv34xihz3V16T0fPQE+SpcL4w
         BE7Q==
X-Gm-Message-State: AC+VfDw8WYaem/gwnPHn74pNg9qoWRC7cr4L3wnhqxAAiQ8B6kfMstub
	2Hfjr2g7x4lnWbKsjBbDu92x6I5RccH9JR2sQlo=
X-Google-Smtp-Source: ACHHUZ7xPFOdR0tu9mLlwmC+xFOOyeEbdUwJPYjFROE9r2zYYk1YPkHxLUtmMG5BOLBzXOg5K00p5UDNukR5SMrJ0/M=
X-Received: by 2002:a17:907:3686:b0:965:fa3b:7478 with SMTP id
 bi6-20020a170907368600b00965fa3b7478mr8997027ejc.53.1683574800982; Mon, 08
 May 2023 12:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de> <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:39:50 +0200
Message-ID: <CAFBinCBXvhRbqDRxH1D29Ua1zTmVR+tqtzJWpyQ9upLX9RhLYA@mail.gmail.com>
Subject: Re: [PATCH 05/18] remoteproc: meson_mx_ao_arc: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124004_858130_3898D4F0 
X-CRM114-Status: GOOD (  11.52  )
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

T24gVGh1LCBNYXkgNCwgMjAyMyBhdCA5OjQ14oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCB0
aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2Fs
bGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
