Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBC3C77B7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYozypMTHQUi7UK7k7K3CE0/qqFVakWgkvxrvv1pPsk=; b=nF6q696BQlAkg2
	1EjrTx8TU7Wc83CghaBv3B5CxeWMls0d0oVpRBoGWQG8g4wIC1dy1p55gzlvMo/0ARD4eHMxbxxGz
	19D224rKTg0GTMho4PnBwdKrM4rKujnQHZ/O+IyY/oj681eKDBKyCxA8dGCq72EZEvHt5BEwY3mvh
	JUARTX8q11V3n2XKSoQagPMIxYrJZa0AVJAeDkMVG0kO20tGHQZxPaqSAEXAKvNwu5LSR0/l7hJER
	/qP2GzBfFHhHtIOrMA97o9tu/yONGSy8BhtgN9rWvXt8dQ3yOdKzxLwxElHaO/SfsC7deEjZBzxj+
	aOy1rMr4/EotZDZuSiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6nh-001G6W-0Y;
	Mon, 08 May 2023 19:45:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6n9-001FPB-2t;
	Mon, 08 May 2023 19:45:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96652cb7673so273399766b.0;
        Mon, 08 May 2023 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683575102; x=1686167102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9o0ZDuc/WFoj87oQCLOSGD/EQg39NiBUlIoA/BbiRY=;
        b=S2JqzLyhyW/ccbu5l86MwFo8X2qO3ccr/zyJQ8n+GCSuHAIvZlzLgZFhkjcnqqQmj8
         5zdKB3Y4Y9o8H9+t2vpkTucrO/se7TWM2bqG5DzWVxrapw2HR3yp+KasgaE7HT/MOt/q
         s6IKD9LmzdFsG9cyc9h4Bqt9shrA7y4pWCNY+mHh9ySI6ELLqlLB2iwoqmOnaUyCCQmn
         GZrc/PJi9OzIMEVww2eHtGOBEUdbLDeNe/OK+k4YclUiE/Uzq9Hv0bM/inarb2Zo2h/p
         NLrVuGJprLQw249ZOOpw+CLeFrP1AygfVKukaHaW/OyDAt4Vt7UduC5MzVRqsgXPkYtY
         vbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683575102; x=1686167102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9o0ZDuc/WFoj87oQCLOSGD/EQg39NiBUlIoA/BbiRY=;
        b=kN1i+zWC88IySYqDq8nQ600po9SRCrL0nXR6OcFNj8NFTpEd4M9boQ8Jcvhcpj6nc5
         4trgLUfio+QCAuMt5a2tzdLHYciCTlo03dgkwDKSjHmwDNibpUXb6I/FWsvDF2U8AqKD
         eU36L6QIMiyIYRZNKeZT32ocmFEcIEqVkqNi0gXriz+4OVKAXO8oWQofBy+LrUxSTihJ
         71Kg8QL6a/ojgR65ComtWEFE6HqTpqnSCdpgLbzXy9q0v91fpQoD9FbGcrSOi5uyMXf3
         TO7+IF7NRpeHgz4xDHGm9tR9xFqE1Y9vAuSGWolrWl7Ps61LIF7jEc8NrVLgSfPyEakx
         FS+Q==
X-Gm-Message-State: AC+VfDwZ4+m7tAarB5pv8TVXKxzel0ehpetIybbG+vOHuuPQN6gTPRQ5
	Z4fyBAioIog/RpS0bLM7vsbArscC+EPqlI5U7tU=
X-Google-Smtp-Source: ACHHUZ5wsU06NVXtBYFA7e1UP/o9q6kVeaNQWEyuf0g4wqzYx+wkJFzRCED4KE+XBuIHCb1RaNlz1wiWpu0hR39zD5k=
X-Received: by 2002:a17:907:608c:b0:94e:6a24:9463 with SMTP id
 ht12-20020a170907608c00b0094e6a249463mr10586313ejc.28.1683575101494; Mon, 08
 May 2023 12:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com>
In-Reply-To: <23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:44:50 +0200
Message-ID: <CAFBinCAYXdSJDy9oLh+_3GY=Xyr8W5Yge84aTeOWmadxJvorwA@mail.gmail.com>
Subject: Re: [PATCH v3] pwm: meson: modify and simplify calculation in meson_pwm_get_state
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124503_971249_5257189C 
X-CRM114-Status: GOOD (  11.39  )
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCAxMDozM+KAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSSBkb24ndCBzZWUgYSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdCB0aGUgY2FzZSBsbyA8IGhpIGRpZmZlcmVudGx5Cj4gYW5kIHJldHVybiAwIGFz
IHBlcmlvZCBhbmQgZHV0eV9jeWNsZS4gVGhlIGN1cnJlbnQgbG9naWMgd2FzIGFkZGVkIHdpdGgK
PiBjMzc1YmNiYWFiZGIgKCJwd206IG1lc29uOiBSZWFkIHRoZSBmdWxsIGhhcmR3YXJlIHN0YXRl
IGluCj4gbWVzb25fcHdtX2dldF9zdGF0ZSgpIiksIE1hcnRpbiBhcyBvcmlnaW5hbCBhdXRob3Ig
ZG9lc24ndCByZW1lbWJlciB3aHkKPiBpdCB3YXMgaW1wbGVtZW50ZWQgdGhpcyB3YXkgYmFjayB0
aGVuLgo+IFNvIGxldCdzIGhhbmRsZSBpdCBhcyBub3JtYWwgdXNlIGNhc2UgYW5kIGFsc28gcmVt
b3ZlIHRoZSBvcHRpbWl6YXRpb24KPiBmb3IgbG8gPT0gMC4gSSB0aGluayB0aGUgaW1wcm92ZWQg
cmVhZGFiaWxpdHkgaXMgd29ydGggaXQuCj4KPiBGaXhlczogYzM3NWJjYmFhYmRiICgicHdtOiBt
ZXNvbjogUmVhZCB0aGUgZnVsbCBoYXJkd2FyZSBzdGF0ZSBpbiBtZXNvbl9wd21fZ2V0X3N0YXRl
KCkiKQo+IFJldmlld2VkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KQWNrZWQtYnk6IE1hcnRp
biBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
