Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EFFC3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Apr 2025 02:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AXv1nOx6RLO4SicfEp2LsvGVbFr7lWvabcVi9hR2aM=; b=cenDgSeDrpf7yB
	dZSbZfQJquc57TptF7ScCnBF6xzYbvse74WsNq+Jn1OIRdWudYfoXo2frWIN7zS9jgiljeQnEiVjp
	n5Uuy88N7NZlsm+ZLn1/tggFJiRtj63kiyYhW8ZlVS8O8kzbCv67ACZf4yNNpK8Lbh3JDpIIkPsVn
	aGIVmD8RKVjULPdtHU6ZLuVEbJvTSO+VLd8NHSkqvgIuNDwWe4b7aCVm779GiDD6EgOIvdglQ9IX0
	zmORoXBnYHH3rr1Slo4moM0rB5Lx+WffXPxrLlbhLefDVN+DV+wLesO3HA76QjTXDinCPUXaD62jb
	1OVRAR5Yu6dE4r4m2zDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRdh-00000001oF9-2kHQ;
	Tue, 01 Apr 2025 02:46:09 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRbu-00000001o62-2Nt2
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Apr 2025 02:44:20 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so8493657a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Mar 2025 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743475458; x=1744080258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=gvTZBctn6UeQb1fsDHOQB2myZyMTkFs7c01KfuHaH1n4bKJ4hLK5H5xZk56sH2fL0m
         usgG0gDePZf5CcbxogCfLK4PQtE55XRicDhfL+IjxC8bxLM/Fm2zzna2ld4iz/vvHJB4
         J42E2aC3H4n2YR6fV0G0aMLDnhDMtp5T+GsxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743475458; x=1744080258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=Wc7xgPpVOxzmsuYjsaUsMExIVjKhWgQlK+rygOmj0A7sZUEko8nMxNMZxND+cvcqII
         zXJYxiuOFbkU+71inDgQDuM8kDjZ+ll8gaWwm2ywnnYOxKZMRgJSUtTj0jyVwSclL/g/
         Zjdstjltn3BFhAStURwvL03OH6pU3bw+AcFi+ZVevnxaxaRtcjGeFJGEnIU7kxHQmpi3
         +MIrrnnK5MT0xfGShqTDpP3JX0OPmXs83LbcigcLdejYw8wtSiY0PoYtQfLbi1nAok5e
         uaBNlyjenOHGaf7DO3r1eDwPTbRJWD+5V2NsxtDc0wPsU4YJ9noPcqQ3i+mYIMNEaivE
         MgDw==
X-Forwarded-Encrypted: i=1; AJvYcCXMy2K9rehd/CcHK5fEaiQEA+9p0JOjKTJ9o+958i9+RvNOjYOGHdzGK3DfzMY7dNklCmXqzXwbB43Gpz4e@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi7RTbgHuoW/VwUWlretSTBeRF3FboIEa0L4FOAv2SzpxoEFA/
	+fFE4a8YOoyNTDOiXF10YygTzAozEBMxyHF2kx98xBYCSD4kEV5y+VcBarVVndUYN/79q//U/ev
	KE+EA7gXheGrLQyQCVzFvw4+PtCWM/qJIAyFZYw==
X-Gm-Gg: ASbGncs8v3v/ya3Ar0AXMlTBnjpSZnmuargb+zXkmBViXJcTGU0DPretd+oWOH4pgRk
	C52e/I7Kfm7fMq6aPS2qHnHjNDHgovNHry3TAO1EU8BKxhWpIHIcZILXRFB5BisdG62iDCsOcrx
	ZKmXZhIbcTGgYDq5frJ/4yUwc=
X-Google-Smtp-Source: AGHT+IEpFvhBi+lUM5E7CGqIh8SlOtzaJBvCk79aI8LiSy+0QDNR3/3AA4vdH3Sbx11mdSvsVtvYulswYGsuHxWrLD0=
X-Received: by 2002:a17:90b:1f91:b0:305:2d68:8d39 with SMTP id
 98e67ed59e1d1-30531f9475fmr21374158a91.12.1743475457642; Mon, 31 Mar 2025
 19:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
 <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk> <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
 <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
In-Reply-To: <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 22:44:05 -0400
X-Gm-Features: AQ5f1JqL8hh66tVHnQp1H53_t8VYOq9ejOXVjyop1xdABti6QeP9kvlxkmw2sn8
Message-ID: <CACdvmAgP8iftcUumv9RrHBLLHFtQtPeRVgDVp7YkWuPsW6Ybmg@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_194418_631439_3B38D8CF 
X-CRM114-Status: GOOD (  14.12  )
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgNzo1OeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0
IDA1OjIxOjA4UE0gLTA0MDAsIERhIFh1ZSB3cm90ZToKPiA+IEkgZm91bmQgdGhpcyBvbiB0aGUg
emlyY29uIGtlcm5lbDoKPiA+Cj4gPiAjZGVmaW5lIFJFRzJfRVRIX1JFRzJfUkVWRVJTRUQgKDEg
PDwgMjgpCj4gPgo+ID4gcHJlZ3MtPldyaXRlMzIoUkVHMl9FVEhfUkVHMl9SRVZFUlNFRCB8IFJF
RzJfSU5URVJOQUxfUEhZX0lELCBQRVJfRVRIX1JFRzIpOwo+ID4KPiA+IEkgY2FuIHJlc3BpbiBh
bmQgY2FsbCBpdCB0aGF0Lgo+Cj4gV2hpY2ggaW50ZXJmYWNlIG1vZGUgaXMgYmVpbmcgdXNlZCwg
YW5kIHdoYXQgaXMgdGhlIE1BQyBjb25uZWN0ZWQgdG8/Cj4KPiAiUmV2ZXJzZWQiIHNlZW1zIHRv
IGltcGx5IHRoYXQgX3RoaXNfIGVuZCBpcyBhY3RpbmcgYXMgYSBQSFkgcmF0aGVyCj4gdGhhbiB0
aGUgTUFDIGluIHRoZSBsaW5rLCBzbyBJIHRoaW5rIGEgYml0IG1vcmUgaW5mb3JtYXRpb24gKHRo
ZSBhYm92ZSkKPiBpcyBuZWVkZWQgdG8gZW5zdXJlIHRoYXQgdGhpcyBpcyB0aGUgY29ycmVjdCBz
b2x1dGlvbi4KClRoZSBTb0MgY2FuIGJlIGNvbm5lY3RlZCB0byBhbiBleHRlcm5hbCBQSFkgb3Ig
dXNlIHRoZSBpbnRlcm5hbCBQSFkuCkluIHRoaXMgZ3hsX2VuYWJsZV9pbnRlcm5hbF9tZGlvIGNh
c2UsIHdlIGFyZSB1c2luZyB0aGUgaW50ZXJuYWwgUEhZLgoKU29ycnkgYWJvdXQgbGVhdmluZyB0
aGlzIG91dCBpbiB0aGUgbGFzdCBlbWFpbCBhbmQgY2F1c2luZyBhbm90aGVyIFJULgpJJ20gbm90
IHZlcnkgZmFtaWxpYXIgd2l0aCBldGhlcm5ldCB1bmRlcnBpbm5pbmdzIHNvIEkgZG9uJ3Qgd2Fu
dCB0bwp1c2UgdGhlIHdyb25nIHRlcm1zLgoKCj4KPiAtLQo+IFJNSydzIFBhdGNoIHN5c3RlbTog
aHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwo+IEZUVFAgaXMg
aGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3Qh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
