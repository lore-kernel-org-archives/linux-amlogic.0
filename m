Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0BEC678D5
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 21:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9rNGH4Lhio+FC18uI2+GaH/P02+UOs4ofBf5Q20Ank=; b=H+nkYSHvj2aBla
	cEuF2rFsOUaOTTzbbPf6d/uqd6Z7/ECYT5BSb5JaICnbyWhkxGp3KXr+uPRONVg3Qe62zhWFLdb4Y
	qsFAaHMGXAfNNd7D7QC8oZBqQ9i85PMU5R8wFkGTYZHHzHa2JiIbA1YGOvbLAjB/MloZhSRjLtVCE
	XgFIO7I0jMsGrmeJMz2mijCWPcDTFiOpfHaqWZv4pACX4yOGWARe37dmG47gtbcD0O9SHBvXmIOs0
	I68qpJdJ8XRABUA7uoxz5Ouj0fb4hIO+K7Nq0VdENd4hufXCRGghRnpGlW6EE4+FE+NFx0Qp8gSU/
	d5a5UAOr/iGnMwqwdpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZfW-009ZNg-Pq; Sat, 04 Mar 2023 21:43:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZfM-009ZLt-2h; Sat, 04 Mar 2023 21:43:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id g3so23966725eda.1;
        Sat, 04 Mar 2023 13:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVdfTRzagZpxrbPS5j0VXfk6cXHcDvqw5oLXINe0eUM=;
        b=KH9O3NKPoK8JOIJrxiYSbYUUv+6/3s/y3vevE/holb4QYp4HO/Ed+aW/pQ1wb2JDIs
         48FxkGdEG/ZM/AjHLViSMTrlHXiYYvlRE+AQaRAOnoJK6Y/qn8cap4E4uJSSl/99Jr8O
         AXqFtve5u+fisJGCoEZJ+yfIJamppq3oTW+amJo57NxfKY0oyWCzgNuocWdCa8oijuqw
         sAHkAA1D0gvzWc2mXQSvwGJ28Fkap2pPzj3x3IVwmeYI0ebdxkgqO+eZ1OQ0+TGmj3QB
         /Ek+VlXQ9LuhgozkYpvnJIax1Ix0ciZhV4JiB0Cn4l/u0GUeKxXHno+qGr4au1B+MNMM
         5qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVdfTRzagZpxrbPS5j0VXfk6cXHcDvqw5oLXINe0eUM=;
        b=XWb0Cth4zsUIraCWL2+YG+6yuukZKewmsTUHtt1pyToJtAf0K13AYaeCFTPjYXlcxm
         j3hSsbtH6BRtUOxFq99NGgGQm+rdKNH/UgT4zFD5vm4P5cdpAdti727VTH1d5i/5OhDK
         i+4/mEe5BRWSsSxMG4r85sF9rrGUTqk/tf+Y9e3qxHFvwuM3i9sdCe9VIFJ8GmTKhrjd
         eGeVhDjUFbLJcu903HUbZANDfkFwH4qWGSE2NMEnGKhbsmS85HnW1BSOnpPuRCdSuZ/U
         GaY+Hx0uqfU//2nSHex64p/bHxxGmmHM4kF6SyVNbxaRNtwDrR6RVAu82opGqcX790uz
         AOmw==
X-Gm-Message-State: AO0yUKVSc/r+0onlaNws3F6PlU6ALgyFA/RusAaQ82AfxBHd1J9DsZNB
	43WdYCwuSkPWR4gQvZQSny9fY281mUp9IFklRl0=
X-Google-Smtp-Source: AK7set+10mRjo9ATOn559XRqhqAnLr+AsGfHkSGLroL9AShCLDdP3latr/YZ1F0TqTBbjYDE1LUD8iFfpiKLdmz0QtA=
X-Received: by 2002:a17:906:5857:b0:8dd:76b6:65b3 with SMTP id
 h23-20020a170906585700b008dd76b665b3mr2900086ejs.4.1677966221622; Sat, 04 Mar
 2023 13:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de> <20230303172041.2103336-36-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303172041.2103336-36-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:43:30 +0100
Message-ID: <CAFBinCB8V6CNB5n1E4C2SrZEqw4bU4c+i8udEsmke9eBXSkSag@mail.gmail.com>
Subject: Re: [PATCH 35/87] spi: meson-spifc: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_134344_347682_C234B7DE 
X-CRM114-Status: GOOD (  11.48  )
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

T24gRnJpLCBNYXIgMywgMjAyMyBhdCA2OjIx4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
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
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpBY2tlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
