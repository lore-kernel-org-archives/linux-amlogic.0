Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8AC76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwnkTSE3BwfwOXWGNRyL88MlEBX9pKjhv5mg+cr50+g=; b=zCcND3rx4meERo
	pOylUa8zFE8Jc3q8sD48acSILOuGzg3ph0ATju0D7KVTmWT07LnWp8lLNIcA3eYI3IiDXl7b1NeAd
	eVy/etVi9b5v0Wav1fkgKYiVSwFMkgEBSLsp1eGR4t7mTka+TMvJhoZurUnG2pu8XBnlDz+3deJ0B
	/4CmiouB9RZ8bR+VO3L5bPv+GmVGMeh70m1UWUgv96ztseWlvfpilsuEngTcpmmGd5Vvfw7MpNYCm
	zJcIbGxRlpNHT5T74Hgo7G61Rt89rwU7cr+ePFbeMBZHtVu88EedL9ICZIMXYvolVdbB005oexxFL
	n77zjD82DPeMDisQkyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJzG-000zN2-1e;
	Tue, 11 Apr 2023 19:49:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJzC-000zMG-1T;
	Tue, 11 Apr 2023 19:49:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id f26so17161677ejb.1;
        Tue, 11 Apr 2023 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681242538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTUUbSrcyGYVVIkSI+DZBOfy0xrXgYqsQoFAd5zef+A=;
        b=qy2+KtbSGyvuu4a4hU27QatyQwEJPTa/E+ACtxaRobBDjyPpnBCHxqeuvVMicDLTs7
         aEOBu6eWzh9wopu1Ny/Xggx4F/dD2qFgGJFyVRwtJtQLBbnU6tJeQ0QXfEhs9CWbcwJ3
         Eh5OFvrGlkaCwN/7IQqrMRCBN78A4o67XTKEzqZzFVeqQ6JiLjk+ym6yFU+9BAtsNO3j
         kzYqZjdlSl15oVzLshHlp6VEowMUnk2+a6e9j7xGrQ1tTT7MQDUIhFYZbFdfC52nub5o
         tMIzOb9PXPdUWaJaD5WiM1vgfOzAwbItaWXTHUfj/lR8QnqYZyOHXbUoNv6+dpk0xbQK
         FIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681242538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTUUbSrcyGYVVIkSI+DZBOfy0xrXgYqsQoFAd5zef+A=;
        b=Rw1N0aOBcSEAGj8zVhFvXO2e4ryxc29Z5exhmOfi0MUzhJz/gsDqj0EN1T7SikYzMJ
         qxg7kGjA1xTBE2g7p1ENtBTYo0Vjgswq82fPTvNgj7H0y8wfHpbFXoeOsFKD/zUdIx0s
         jL8LBf0D9n6Oog/FV637yNoUuIJwjr+tcwzmmzoaa3ywO49FdTze5n7BGybZek7r26bk
         8AiCG4a8TE/3GcYZwFf1B37MEptbwxN7wXFtHrBY8pIBvAWXZi09aZcQ0drrH/+SCceH
         tFYfYdRpWVQTirUyGz2TmHERrt9MsaDM3VESMREhfs1QHK46aqe7SECvByVvUOieL4ml
         N6qg==
X-Gm-Message-State: AAQBX9eYe0+8cNJx/9AJ+qWEgJu4LyYUpJRcAkJOsHzpGb+nf6spFL+V
	0a6NzH0rwbp50pAbI/4kg0jlv10yiOIF51ZAzho=
X-Google-Smtp-Source: AKy350blABHYIEYUdGZEF3BT8eF8mXBkHbgI6Gds0qr/ylBa22+0ltEEoVq2d1aQv+F0cIMh4XD8yOOJ86Y4BH6iKLc=
X-Received: by 2002:a17:907:ea5:b0:94a:972c:c28d with SMTP id
 ho37-20020a1709070ea500b0094a972cc28dmr3811104ejc.6.1681242537771; Tue, 11
 Apr 2023 12:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com> <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com>
In-Reply-To: <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 21:48:46 +0200
Message-ID: <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_124902_493475_3D535566 
X-CRM114-Status: UNSURE (   7.85  )
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

T24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgOToyNuKAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAgICAgICBpbml0Lm5hbWUg
PSBuYW1lOwo+ICsgICAgICAgICAgICAgICBpbml0Lm9wcyA9ICZjbGtfZ2F0ZV9vcHM7Cj4gKyAg
ICAgICAgICAgICAgIGluaXQuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UOwpBcyBtdWNoIGFz
IEkgZG9uJ3Qgd2FudCBpdDogSSB0aGluayB3ZSBuZWVkIENMS19JR05PUkVfVU5VU0VEIGhlcmUg
YXMgd2VsbCA6LSgKT24gR1hCQiwgR1hMIGFuZCBHWE0gU29DcyB0aGUgYm9hcmQgZGVzaWduIHR5
cGljYWxseSB1c2VzIFBXTQpyZWd1bGF0b3JzIChsaWtlIHRoZSBib2FyZHMgdXNpbmcgMzItYml0
IFNvQ3MgYXMgd2VsbCBhcyBuZXdlciBib2FyZHMKdXNpbmcgRzEyQSBvciBsYXRlciBTb0NzKS4K
VGhpcyBtZWFuczogaWYgd2UgZW5hYmxlIHRoYXQgUFdNIGNvbnRyb2xsZXIgYW5kIG9uZSBvZiB0
aGUgY2hhbm5lbHMKaXMgZmlybXdhcmUgbWFuYWdlZCBhbmQgdGhlIG90aGVyIGlzbid0IHRoZW4g
d2UgY2FuIGVuZCB1cCBkaXNhYmxpbmcKdGhlIGNsb2NrIC0gdGFraW5nIGF3YXkgVkNDSyAod2hp
Y2ggc3VwcGxpZXMgdGhlIENQVSkgb3IgVkRERUUgKHdoaWNoCnN1cHBsaWVzIEdQVSBhbmQgdmFy
aW91cyBvdGhlciBjb21wb25lbnRzKS4KSSdkIGJlIGhhcHB5IGlmIHRoZXJlIGFyZSBvdGhlciBz
dWdnZXN0aW9ucyBhcm91bmQgdGhpcyB0aG91Z2guCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
