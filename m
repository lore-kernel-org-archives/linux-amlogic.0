Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5323ECAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3ybnI5/xtAHH4mRPkZPeIPPaHUA9fkCSefqvhBxpF8=; b=36+Ho3MsLXfbMK
	k2yFfxFd9w4zuDfYdCc/jDmM1sVBG8CLsvsi/dpIFWy5zfoqHQ189P7q2ibjj5+QGey8x8IctH/r6
	tW8V1m98uXJ1aKMxOwOSzMbbh2dZnK4O4UnZayUaqJLNqUr12c3zqACRZ1hDRC/bnahGvpK5XJpmq
	K93sZ8sUIRMn0bAu4lVnHIHVGAQtATUWCu7it/iOysL6eRQoYGpKUfOA4o33O32M/6wP7IAw2+/66
	RcGAzwtTtmlttx5Rh0R3iP0Ikl94WgzqwaPMwm05hpqfo99si4DKeT6BriObkclGbR4oHOOhc6yyq
	TtMB+4nue7A2y9LPfEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31HQ-00000000diA-2odA;
	Sun, 28 Sep 2025 23:58:12 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31HN-00000000dfr-3pAH
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Sep 2025 23:58:11 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-581b92e680bso4893252e87.0
        for <linux-amlogic@lists.infradead.org>; Sun, 28 Sep 2025 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759103888; x=1759708688; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
        b=TY33NZ7hG9uq7WP1A0FYHT1uD/lJy3+Eljm3e+9HotuzqnQQSzlgYAMTbNcIzcInEt
         +7EJyWlHmymqQQ1YXhW1cOzSkquA6sjzUgN9VmxG9Adg9QonIi0cGIX0kkl3wgIFT/kA
         086yfKxgMctPWiKIxdlQ421YIb82V8lUPeKs+mnhHWMUQsApnBe79o3S84JOpQkqErmb
         hTLd+7x1ISh3151C0hRTFOL1p5uEyQPzGK3mPT1RF+qk8LzirT3y4dONEVXHeNBGC9XJ
         ceIwdIIOgNpG6m0vmQ6YEKWpeftSWOrs1Yy2CXdlU5pU3l2GDbHjzfjVYrpJvfs/Udej
         X0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103888; x=1759708688;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
        b=H7RmXyBYJ20WMYLwSpBQQIpVV64JsWNJ8XRoISLSmB8zPNutO6Psi2whIfg2hG5fPY
         K7jvZskDFDy4siOJazq9Ko9I0w06UrwyILZ0170NAJjfs7jSAmxL5DDxe5iC7KdeLsE7
         LXVgnU5EIibZpZU/cpdgTbJsd7pB72mnAOO9bBZooU5BKbCPDUERIKh9bWMvw5QsUvRU
         IJ0jsxsCByNg8ft026rMkgoj6MT4hZdExQtl65NYnFzoZqyTjUbq7qMUsdjApxmf0A7o
         MYaiJgQ3pJfJqpVNtR6QOts7E2YW6WtoRAHqUOAj3sq24y15RtRUbPuYO82r50PaQVSl
         ZMVA==
X-Forwarded-Encrypted: i=1; AJvYcCUhMv24lZkPQcKQz7DBf8Nw0/wG6cCydluUkYbmgPtnqOwCv6IpJDGiPZVW6D+bNW04yT/Q0lVBNKWKdoQx@lists.infradead.org
X-Gm-Message-State: AOJu0YxCNFqXNBaeFd5iPC7dMqzve7TJNVqPrP7LZosBEGgo1SLFt+/a
	7NltvB5SZfDghU2Ti+ADAVxnuXUB2RopDEscmd7qr/rzoLqQakYs5o8L
X-Gm-Gg: ASbGnctp3sLBDxx77+MACB60KIQ0Pa68IVgQ/DV1P2jIVh76p4y2+abMiSjZMnUrtFu
	XnxvaEJ0O9iteduYjwBqIsqrJzfiLBf6xvqDPwrGN49N/iQqNJq6uIybnI7rrtwqeTyCHcRusWP
	gdHOoWXIQWHz+BZD50E0U55NdjQVOUx2i8s4dLv8JHPK19s03ly55sdMBrzcJ1vAlSmnYu7/4hD
	FqUC5KWuf+yfQXXXzAjPQW+fBihdWULktTLtZREJLznQ+JKVyrp/LZjl12UUDuUuvg49Y8QTG+T
	4EGJklHdrTsG/XrCeIYbqCKbIDUPhzJRUA6oadxh+o5v8riVcafH7P8iTVdF8b+TevN4BV/loh5
	TC1P1VJgqj3hMj1NGVXN9ir4c/NDfL/nlfIdJQ4HPmz1GzZw=
X-Google-Smtp-Source: AGHT+IFatLnH+CWKbIPVnt1XCGsPTWuZfxlrZtyuUOcPTm0iQtnY1bAc/cnSijrrtlSR3Mk4EECIMg==
X-Received: by 2002:a05:6512:3052:b0:57b:968a:6df6 with SMTP id 2adb3069b0e04-583066e7e35mr4445802e87.18.1759103887574;
        Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316c1d303sm3761723e87.123.2025.09.28.16.58.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Date: Mon, 29 Sep 2025 03:57:51 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dongjin Kim <tobetter@gmail.com>
Message-Id: <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_165809_973578_9A2ED0BC 
X-CRM114-Status: GOOD (  21.48  )
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

PiBPbiAyOSBTZXAgMjAyNSwgYXQgMToyNOKAr2FtLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiAKPiBIaSBDaHJpc3RpYW4s
Cj4gCj4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMzowMuKAr1BNIENocmlzdGlhbiBIZXdpdHQK
PiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+IFsuLi5dCj4+IEBAIC04OTQs
NiArOTA4LDEwIEBAIHN0YXRpYyB2b2lkIG1lc29uX3ZjbGtfc2V0KHN0cnVjdCBtZXNvbl9kcm0g
KnByaXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgbSA9IDB4Zjc7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgZnJhYyA9IHZpY19hbHRlcm5hdGVfY2xvY2sgPyAweDgxNDggOiAweDEwMDAw
Owo+PiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICAgICAgICAgY2Fz
ZSA0ODMwMDAwOgo+PiArICAgICAgICAgICAgICAgICAgICAgICBtID0gMHhjOTsKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZnJhYyA9IDB4ZDU2MDsKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gSW5pdGlhbGx5IEkgdGhvdWdodCB0aGlzIHdhcyB3cm9uZyBiZWNhdXNlIGl0
J3Mgb25seSBhZGRlZCBmb3IgdGhlCj4gRzEyQSAod2hpY2ggaXMgYWxzbyB1c2VkIG9uIEcxMkIg
YW5kIFNNMSkgY29kZS1wYXRoLCBsZWF2aW5nIG91dCB0aGUKPiBHWCBTb0NzLgo+IAo+IFdhcyB0
aGUgMjU2MHgxNDQwIG1vZGUgdGVzdGVkIG9uIGEgY29tcHV0ZXIgbW9uaXRvciBvciBhIFRWPwo+
IEkgc3VzcGVjdCBpdCdzIHRoZSBmb3JtZXIsIHNvIEkgdGhpbmsgaXQgZXhwZWN0ZWQgdGhlIGNv
ZGUgdG8gdGFrZSB0aGUKPiBNRVNPTl9WQ0xLX1RBUkdFVF9ETVQgcGF0aCwgd2hpY2ggYXV0b21h
dGljYWxseSBjYWxjdWxhdGVzIG0gYW5kIGZyYWMuCj4gCj4gSSdsbCBnaXZlIGl0IGEgdHJ5IG9u
IEZyaWRheSBhcyBJIGRvIGhhdmUgYSBjb21wdXRlciBtb25pdG9yIHdpdGggdGhhdAo+IHJlc29s
dXRpb24gLSBzbyBhbnkgaGludHMgZm9yIHRlc3RpbmcgYXJlIHdlbGNvbWUhCgpUaGUgb3JpZ2lu
YWwgcGF0Y2ggaXMgZnJvbSBIYXJka2VybmVsIHNvdXJjZXMgLSBJ4oCZdmUgcGlja2VkIGl0IHNl
dmVyYWwKeWVhcnMgYWdvIGFuZCB0aGVuIHVwZGF0ZWQgdmFsdWVzIHNlbWktcmVjZW50bHkgYWZ0
ZXIgMTAwMFVMTCBjaGFuZ2VzLgpUaGUgdXNlciB3aG8gb3JpZ2luYWxseSByZXF1ZXN0ZWQgdGhh
dCBJIGNoZXJyeS1waWNrIGl0IChhbmQgdGVzdGVkIGl0KQp3YXMgdXNpbmcgYW4gT2Ryb2lkIE4y
KyBib2FyZCAoRzEyQikgd2l0aCBhIERlbGwgbW9uaXRvciBJSVJDLiBJdOKAmXMgbm90CnRlc3Rl
ZCBieSBteXNlbGYgYXMgSSBvbmx5IGhhdmUgVFbigJlzIG5vdCBtb25pdG9ycywgc28gaXQgd2ls
bCBiZSBnb29kCnRvIGhhdmUgeW91ciBjb25maXJtYXRpb24gKGVpdGhlciB3YXkpLiBJZiBpdOKA
mXMgd3JvbmcgSeKAmWxsIGJlIGhhcHB5IHRvCmRyb3AgaXQgLSBJ4oCZbSBqdXN0IHRyeWluZyB0
byB1cHN0cmVhbSBhbmQgb2ZmbG9hZCBzb21lIGxvbmdlci1ydW5uaW5nCmFuZCBhbGxlZ2VkbHkg
Z29vZCBwYXRjaGVzIGluIHRoZSBMaWJyZUVMRUMga2VybmVsIHBhdGNoc2V0LgoKQ2hyaXN0aWFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
