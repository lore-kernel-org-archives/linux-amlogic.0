Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35A606A326
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l+SvY6PH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=uXmUBz1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ynfp3nb6mKjT2Ll99SIKm7hMEBzNyP07x66AAQxtjho=; b=l+SvY6PHZBQGKsnOvvC0SlCURM
	GnsMnDKCkROnGSEaV+SsnzPurVc0g1JSD51b6x90DVOU+pP1lzWbf5zLRBRyWE/6lwF0ejbOlgk1P
	30l90nx7wIFLtdyivVNXkxJQxjLsYiQLiwBKO8iAOs9qBn9wu39UoFL7WuVc7XMTaWQz6BTiEBjYE
	SM4Rs0Zsh7KXXQCk+II+GPMf5KCgSlBnZEJ6FmhbONsEW7CGlPjnlJaQytN1kfnxIRfxlxed7Exs3
	NL8H7lP4v/EqW/PM7zhKW6koYkvO14JrKiKjtpeToklJwDsbCbsnppOEidoPK7goCPJ5KIyRRRVQJ
	0iXnyuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeYq-0000000FBv2-34T1;
	Sun, 01 Nov 2026 23:02:00 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeYo-0000000FBuD-1Rhk
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 23:01:59 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-679e6ab6471so3030377d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 15:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574117; cv=none;
        d=google.com; s=arc-20260327;
        b=s7wuONKcWPiFLF6vZe1dR+QuGnxUhQd9COlALGkUTAr6VMQz/hb8CucPPBc2UjqBxZ
         iqK1iJXfqqzJr94mwjG39W4pCGTL/TaVID6IpoqlAcB65sgqcHxsem7ogwxzIDvP+AiC
         8BhyifCiWMrXNokGXWPmi/l9l8Dav7yzfggmlqQOQzJqC97HoS78akOOn3sbFfujDJys
         267aJ6NvUTjT00GkVoNQri+ncHkHSzSoC+dc9r+ob8ukYB0Fi8OCblDEw1UERzXTxg4E
         tuZZRjMZLE3VwC0ql+27LxzhEISiF/9G7PXUyBFTVgfvU3o1m8nwnhBBnAuOaMh/Gc1D
         +1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        fh=l3x+dUFQXQQ5FWrWJDBnS8LK9IjY/XPgLKU5hVIGQag=;
        b=lvh4/AcIYUPgj1batpCEQQxAY1ZrQhp4UXzCu/OVeDueFKaVgmS4Xn68/hWjgHFt+B
         e/CHPSC0TxVcHKRjQJkwkEoGQD+J3ajJYkaHDmuuucKPdUtr8GWo9qWM1Dk5JS7/0/fK
         Kw0r37NzMVVHxtfVdUCSq4mhRaVqrqcd7cJ0mzBSxwjq1eAi+s1QVplUE6C1CZQC8+4c
         XUVXt18GfwMceuNkSDiv7mvD0/hkmoPNQuc4YyN0NXMULVEk+UjxtbPkxo6eVDLLPu3p
         FfZqFxSzfnKygep03+RCaArrLYui803Gyuxe3Jr6nfcasSAHcm6X7cuovuZtt+MmD1jO
         WmqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793574117; x=1794178917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=uXmUBz1+sGGBgiwmaNDNinDvW8QsN8J2MoDPQDGhQXjhAK2CU1ns/MK7FMLmuqCmZR
         /tldYocErhYEIj7Tlv+k7N6kyYTr79iC/5pLLC7IckA0N8fXUNrTMDd/EW8OJtxQbcDB
         WDZAZYNyThG9+B7ZMYmd1jODzw1dVJvjgg+Or8PzyldpMW/ClHl/gm8rES/t4no4n6n9
         T6d82pVBwvOsXQQ6xdJTQfMOBekPW/pIb7A98X4xi14Sbdkr/HLxkqpJ1GdyClb6B5ZJ
         W3r24BkTAuTmqEqds/zU+wWl4+S0xJpRnq8jmLQv6C8itbZnscvBJYD15wmFdSx/qon0
         5yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574117; x=1794178917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=hnZKBwaaxnbvtLTapeITOA+grbQCbdLm5zxT5imnbsP5WirZ3eKPLlFY6NEhr6Zfj6
         yH/gepRfU4r7iw4GSFI2K8qOXWNbfyoRh2f+i1o8oC7dMNPDKRITpIHHNXrMsMAaVi0A
         1yTqWvIsIikGO450z2fg9mMzfM+s5Ub+EH2M99Y0tlBt+kHhSU+Fg8Czlh/9qUY/qLOc
         mc8gBStq54rwfbQOHwJe51LsEiGKXFfM6/CFPqAkxNiNyVzi4OWgy8LctSdpO807xmSv
         Wu/36oivzizOeqQEHKstrGnhxBm+4KWQYvjoA7wXkFdIS+/jj7793Ltk5IuPmqCXQEEu
         OKlg==
X-Forwarded-Encrypted: i=1; AKwUvBwYDhzFZlXNGkXIY4tfUey9V7ycHpi8SYCEp21HuqhGW+8CRdAy0Yro20d8GCzn/4bb9J0EVcQg0gpeekyW@lists.infradead.org
X-Gm-Message-State: APuU4Z+qJ+Ct8HiaOKLIdy91tVm7QiqhcSF5gJr0BR4opigqtMMZWcAz
	W3VafRDGWu4epVlzV91DyPYIEipFyZj7dqBAWbnvzISAKxiHzV2rWpLDgnU8Vrpm9VotyN/2OAo
	KsPydCcJkaA65rkhT+Vl6MNevBoPspSM=
X-Gm-Gg: AYBFou3BR+HoyNWFHqruZo6otX4lLByew1QGJHvSAeIGOI+QzB5qKix28ikaqDkjux2
	Ti+lrJrhTqXV96SafPMPP4qr2cm2ktOZjStI/3pIViN7R3fqQaO1BL3aDjWCIgv1gm9nFkc+vXp
	ryG66WX077GQ+tLUSfLSMuvTXgfJL5X8EGBreXR7c1S8eZEcdTrKLzxiKnSosrib+sSPS7nCAgz
	O1OvDY9P53xpWQDU8riuKiYQyPqk9a2FeCHjcoMgRH8BNsGzwJsaBln8FnaQG0bERSLp0oSDqap
	EHGAAFFNFACYGbFOkTGO45mJbv0kCyJoKK4R/NCkDr5mbZKi9N8qZWLx4+rTCZLvYm7zJ3Kh70s
	FIGHXDi28XNr19sQQOA+P8kfNjnO6yDJACxQT+Z/rk13WBIwwsmzKHeYKz8Ym5CEFs9Uvgw==
X-Received: by 2002:a05:690e:4084:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67a8d60ce47mr8913440d50.42.1793574117117; Sun, 01 Nov 2026
 15:01:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 00:01:46 +0100
X-Gm-Features: AclHuK_6zPYcTTvvo1ADEqHJgjW6vbl_w9ibYmytUlZi0WtkMQH9WoT0aPoNmLU
Message-ID: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_150158_409813_64A4212D 
X-CRM114-Status: GOOD (  11.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hyaXN0aWFuLAoKT24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgODoyM+KAr1BNCjxjaHJpc3Rp
YW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJp
c3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBz
dXNwZW5kIGNhbGxiYWNrIHN3aXRjaGVzIHRoZSBkZWNvZGVyIG9mZiwgc28gbm90aGluZyBpcyBs
ZWZ0IHRvCj4gbm90aWNlIHRoZSByZW1vdGUgYW5kIHRoZSByZWNlaXZlciBjYW4gbmV2ZXIgd2Fr
ZSB0aGUgc3lzdGVtLgo+Cj4gV2hlbiB0aGUgZGV2aWNlIGlzIGEgd2FrZXVwIHNvdXJjZSwga2Vl
cCB0aGUgZGVjb2RlciBydW5uaW5nIGFuZCBhcm0KPiBpdHMgaW50ZXJydXB0IGFzIGEgd2FrZSBp
bnRlcnJ1cHQgaW5zdGVhZC4gQm9hcmRzIHdpdGhvdXQgdGhlCj4gd2FrZXVwLXNvdXJjZSBwcm9w
ZXJ0eSBrZWVwIHRoZSBleGlzdGluZyBiZWhhdmlvdXIuCj4KPiBUZXN0ZWQgb24gYW4gUzkwNVcy
IGJvYXJkOiBzdXNwZW5kIHRvIFJBTSwgdGhlIHBvd2VyIGtleSBvbiB0aGUgcmVtb3RlCj4gcmVz
dW1lcyBpdC4KQ2FuIHlvdSBoZWxwIG1lIG91dCB3aXRoIGJldHRlciB1bmRlcnN0YW5kaW5nOiBp
cyB0aGUgZmlybXdhcmUKaW52b2x2ZWQgaW4gc3VzcGVuZCBvciBpcyB0aGlzIENQVSBjb3JlIGlk
bGUgc3RhdGUgc3VzcGVuZCAobWVhbmluZzoKZmlybXdhcmUgaXMgbm90IGludm9sdmVkKT8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
