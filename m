Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624BDC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 21:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q50wAIVkwvvM1SbtBVL/6YfLD/q6/5bQt1DGPpmOqnw=; b=hEx0oaawr/bXuh
	QSAczQItK5zDDxv5BBlZvcvFZVWXgypp7CXmx+sFXZTofzfF7oThgn64ffU3Ws61AMMkSDym7e9Jl
	MfT273W1wcVbRywR6tw2XNQz68F4w/z88yfupe/DYvdheq+fR7N9GrBCy8eDlfxTm6hu4VsjpQbZt
	IQF9dqAJqrNTRQvxUgt2tWGZCngHxgovHi981jJlCuMcmO3/+lQ0tYuS1e/U62r27IqrWEeE6GErZ
	hBDvTZv957wO/y8KvYEctkdB76TQcDCX8KIvjBtk1ckvluVJY0OKf9865H6xTIoRbDp7M01M9ZsDn
	2LzQbHBvRf3Uw3ZBF0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6L4-001Etp-1O; Sat, 11 Mar 2023 21:01:14 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6Ku-001EsZ-Je; Sat, 11 Mar 2023 21:01:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id s11so34179959edy.8;
        Sat, 11 Mar 2023 13:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678568461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ7IjGprGZ7I/CKQDDDI8nwm0vwfXtggdGDsNEfxN4Y=;
        b=PiTR4FzIbsSL5+kTIFP/ubcw2RBvAk5N7feJGnrGwMllQ5gG3BPgXHRLX7Nae8KD8n
         Sx+QaOToeZYbO94b7NWHWdOALOnPjMVUaSl1n9GHO6aeSsKtcflaAM53ueFLYQuI4YWX
         0Czqwz3nyLQz7wKU+rw0jFsBe6W3FW5Qcc8T62fb+Q8jnw1Nasn6VxDB8NGjHK+nKOcU
         vQDiXrlQRTmA8/w+aLNpeXj0b7SFo4fznYzQ3NaOhATCN7tAZIv3SDzV+O1kNORZt4NX
         iLDVORHfRPBY1nW4RoDLCz3jiTnvZSVJxwHYRhquaky6bSOdgVUEF9aUY4/OwyUsvndk
         bSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678568461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ7IjGprGZ7I/CKQDDDI8nwm0vwfXtggdGDsNEfxN4Y=;
        b=jsjf3BEVOBHUqTFeODQzNB+fa+aLLMw5FT2+zdjiQ1M3isOiOFFKfwV6z+qahs066C
         rP2wVhAJe+rm+2Sfkh7BWQ6s9wvhOr7JzF1xRlVKgcxbRikSyQ0fqsND0unMEwGTvmf3
         AZ6M6UVQlm0MVJnbtyG3uoVfaYFgbFnqMJrcKY1F5denKG8cVqe5fs2CF498hSBAnCoH
         ikWYePSYxNkh7ZfTtECXRKyV1T7LZ0KAZ9cfuhb6pBQAOKVHujPpAHcALFEqe5iq3740
         WoDGRqMxv9+SaYNDrI3GzOozZLo2eeMLOsrLkR5/vtpzQx4V14755lf90Iwfok7CjS3M
         1/EQ==
X-Gm-Message-State: AO0yUKU4u0MPjlK0bxb2Zt2gmwKpOIlzIscUWVrPiBCbgJUlrNb45O3M
	BVR9OjY/w/8H0Ro/VT1njZwuG+ltFLYBTCQrW/o=
X-Google-Smtp-Source: AK7set+tGzVn8mUq9+ViKZpknU9hHzn5Xv/ej87PHZUE7Fr7JlB7GofkRlmbxccURntFrfOli+0CKD94Dktcdld9gCA=
X-Received: by 2002:a05:6402:530c:b0:4ad:739c:b38e with SMTP id
 eo12-20020a056402530c00b004ad739cb38emr4114413edb.1.1678568460834; Sat, 11
 Mar 2023 13:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Mar 2023 22:00:50 +0100
Message-ID: <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Munehisa Kamata <kamatam@amazon.com>, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_130104_666625_E8F2DF31 
X-CRM114-Status: GOOD (  10.48  )
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

SGkgVXdlLAoKT24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgODoxNOKAr1BNIFV3ZSBLbGVpbmUtS8O2
bmlnCjx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgpbLi4uXQo+IFRoZXJl
IGlzIGEgY29tcGxpY2F0aW5nIGZhY3QsIHRoYXQgdGhlIC5hcHBseSgpIGNhbGxiYWNrIGZha2Vz
IHN1cHBvcnQKPiBmb3IgaW52ZXJzZWQgcG9sYXJpdHkuIFRoaXMgaXMgbm90IChhbmQgY2Fubm90
KSBiZSBtYXRjaGVkIGJ5Cj4gLmdldF9zdGF0ZSgpLiBBcyBmaXhpbmcgdGhpcyBpc24ndCBlYXN5
LCBvbmx5IHBvaW50IGl0IG91dCBpbiBhIGNvbW1lbnQKPiB0byBwcmV2ZW50IGF1dGhvcnMgb2Yg
b3RoZXIgZHJpdmVycyBmcm9tIGNvcHlpbmcgdGhhdCBhcHByb2FjaC4KSWYgeW91IGhhdmUgYW55
IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBmaXggdGhpcyB0aGVuIHBsZWFzZSBsZXQgdXMga25vdy4K
SSBkb24ndCByZWNhbGwgYW55IGJvYXJkIG5lZWRpbmcgc3VwcG9ydCBmb3IgaW52ZXJ0ZWQgUFdN
IC0gYnV0IHRoZXkKbWF5IGJlIG91dCB0aGVyZSBzb21ld2hlcmUuLi4KCj4gRml4ZXM6IGMzNzVi
Y2JhYWJkYiAoInB3bTogbWVzb246IFJlYWQgdGhlIGZ1bGwgaGFyZHdhcmUgc3RhdGUgaW4gbWVz
b25fcHdtX2dldF9zdGF0ZSgpIikKPiBSZXBvcnRlZC1ieTogTXVuZWhpc2EgS2FtYXRhIDxrYW1h
dGFtQGFtYXpvbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgoKQmVzdCByZWdhcmRzLApNYXJ0
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
