Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD2E7F156
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8EJyFMS/uTL7vPHhbi1CB/+sjrEri6WcMD9GC9fJeU=; b=ugABLhWKHj/kpt
	W6WvTvGRBK9s6aPlQ21gWXpqOYIjVL5/lgIBq3X8d3Mve+eSyEMzrLtOOJVehV8D5DqPAmyCFXLBP
	qQ1RVPNpL0SHWHrkqpx+XALDbfxVQD2aa14FnTDNAJOkUMZ8GZohGbCQaFthABBAj5JeKl1OF5TSU
	CNzd47Nmqib46SzD5XO19jYi8aQKW3nImDC9yxsFaWFi3PrzixeboHiNgsIFXkzuXZoKsqfdXvc0T
	KjtzukodT2dc8fIvqrr/6jVfuk5V+013XdV8NxYUBgd8k/Fhscl4SBuFVs37b3roHtRBmVd3ns95u
	EQypqMxWeg6Gq7eV7Atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBK5-007l5l-2t;
	Fri, 29 Sep 2023 11:06:17 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBK3-007l58-1a
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Sep 2023 11:06:16 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57ddba5ba84so501298eaf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Sep 2023 04:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985574; x=1696590374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXfAf5K3soRpBRm4siYV07qIpnEuTmFZ/fmri8xNbS0=;
        b=NT7LfJ+WmguDy+upepnYNxbGJ9+3b6TzJFwUYzy8ujfCOHhU5ls2iIQckPdAFcBDSp
         I4FScBTD9GGg7WBd/ghzlHjELQow2F/3SGb3uFPONBFmXSAqOKdCUBBWJcroLEwCfEUV
         iukxpPmeImgrASUgT3prWH4LoqFGkl1QkydlnK586SMVX8kuVI9YBrSHKd27ZV8hL8NW
         rt3F6MAAL+/8WeBugzLcUDG8GW8XQj3uZEWA0zkV+cvSMR3/1fSV6fmSXMC9HuUl41Ws
         JhUdDxz9KmHV7WwECoBbF5zqKlwZ1SE4Fv3t8Tp1Xd+VbE3JL/1lAKr+QDzQmyhuHOYZ
         6z7A==
X-Gm-Message-State: AOJu0YygtOCk7kbR6ar7MUlmMjXroLZXXlT9UctWHXSz8VXCske5tfkX
	AcvNFraMsvyEjKtHKKmUwpi1jzK+efA99nMHqJw=
X-Google-Smtp-Source: AGHT+IHnjMQf4TcIXqCYxJb3MiiDMpkfJS1bbFz8BdVVdymPezpCAoDu2EEE46tvAJIh66O1sFSg8v/jwiHNHZ+/gT0=
X-Received: by 2002:a05:6820:3c1:b0:57c:6e35:251e with SMTP id
 s1-20020a05682003c100b0057c6e35251emr3709817ooj.1.1695985573695; Fri, 29 Sep
 2023 04:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230929061305.2351953-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230929061305.2351953-1-u.kleine-koenig@pengutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 29 Sep 2023 13:06:02 +0200
Message-ID: <CAJZ5v0gZa24GuaqxH2M7Br9jWzivqVdxDurZv3F0K1xRVj8e4A@mail.gmail.com>
Subject: Re: [PATCH] thermal: amlogic: Fix build failure after conversion to .remove_new()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Guillaume La Roque <glaroque@baylibre.com>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_040615_554217_4F1E425E 
X-CRM114-Status: GOOD (  14.42  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgODoxM+KAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQ29tbWl0IDg4YWY4YjY2ZmZl
ZCAoInRoZXJtYWw6IGFtbG9naWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlCj4gY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQiKSBjb252ZXJ0ZWQgYW1sb2dpY190aGVybWFsX2Rpc2FibGUoKSB0
byByZXR1cm4KPiBubyB2YWx1ZSBidXQgbWlzc2VkIHRoYXQgYW1sb2dpY190aGVybWFsX3N1c3Bl
bmQoKSBtYWtlcyB1c2Ugb2YgdGhlIGludAo+IHJldHVybmVkIGJ5IHRoaXMgZnVuY3Rpb24uIEFz
IGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKCkgcmV0dXJuZWQgemVybwo+IHVuY29uZGl0aW9uYWxs
eSBiZWZvcmUsIGFkZCBhIHJldHVybiAwIHRvIGdldCB0aGUgc2FtZSBiZWhhdmlvdXIgYXMKPiBi
ZWZvcmUgdGhlIG9mZmVuZGluZyBjb21taXQuCj4KPiBGaXhlczogODhhZjhiNjZmZmVkICgidGhl
cm1hbDogYW1sb2dpYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQiKQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA5
MjkxMjE0LkhqbjNnSjk0LWxrcEBpbnRlbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBIZWxsbywK
Pgo+IHNvcnJ5IGZvciBub3QgY2F0Y2hpbmcgdGhhdCBiZWZvcmUgc2VuZGluZy4gSSBkb24ndCB1
bmRlcnN0YW5kIHlldCB3aGF0Cj4gd2FzIHdyb25nIHdpdGggbXkgdGVzdGluZzsgSSB3b3VsZCBo
YXZlIGJldCB0aGUgc2VyaWVzIHdhcyB0ZXN0ZWQgd2l0aAo+IGFuIEFSQ0g9YXJtNjQgYWxsbW9k
Y29uZmlnIGJ1aWxkLiA6LVwKPgo+IElmIHlvdSBwcmVmZXIgaXQsIGZlZWwgZnJlZSB0byBzcXVh
c2ggdGhpcyBwYXRjaCBpbnRvIHRoZSBvZmZlbmRpbmcKPiBjb21taXQuCgpJbnN0ZWFkLCBJJ3Zl
IGRyb3BwZWQgdGhlIGNoYW5nZXMgaW4gYW1sb2dpY190aGVybWFsX2Rpc2FibGUoKSBmcm9tIHRo
YXQgY29tbWl0LgoKSU1PIHRoZXkgYXJlIG5vdCByZWFsbHkgcmVsYXRlZCB0byBpdCwgYmVjYXVz
ZSAicmVtb3ZlIiBpcyBub3QgdGhlCm9ubHkgY2FsbGVyIG9mIHRoZSBhYm92ZS4KClRoYW5rcyEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
