Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D03606A31C
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lUVrPVA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=laDln03I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PVU5b3hxumyP3lMJvXwvvUZirLCVSZwE/cMsKBKkHak=; b=3lUVrPVAd8Q4dod/+5HTGnIdmv
	vXBplOORyTEWRK76qEZwlpSgbtgblTrxq5nnGQtfZWX5uMa7U0LcmkUPhxJrBnlOHSpVIQ+1OPOO/
	ix8SR6k82sVzzqjJXXsdg8//Y//DyhPna0EHp1l+gLaeUAXQpRYy6S3yX40LPwMaW+xfF+i4EuER2
	sQ7js+m8kMhcvUD4z1PJ7igXS1MOtYmlthZ1m1F8WLlab4in0zZ3d2e+WhIqHVbAE58Fze8tDsDn3
	tnYGfyheMwAdkrNlnDFHL+RZqbS5rbqAU915i1Zs3OlA4uLSGk+LWEz1V+eWzNUCYdqc26AOMAanV
	7hgIOanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjo6-00000003b7h-0bM0;
	Tue, 10 Nov 2026 11:14:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjo4-00000003b75-0QfG
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 11:14:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso19156315e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794309266; x=1794914066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=laDln03IyvtTQyxjeHSMGkz60qbVXiXZsmGVpt01HSBNVUrWMwkK5qDjPJwFNc74CZ
         4NxYtJyhHmh7I9P8Z8NmRsX5LTq+QtG/M/uqrkzU4MWrDxiACj7C77CjnJXoNOB6/1aD
         sLzX+koaZDnq9NOXw3FHrJvEsJbMZqnRO83G/VIHcjCXaBR6V5iq7rgICXc0Mz9S8n/S
         WkHMPy6d2quIxCpJtz/W3tpB12gbqWjBG+VHvjvRAiEe7VyDhZJQmwzPDkSrU+RE2nTZ
         6jtgj8DMPRFSlXcAlK3k9Wvi+CMlwrBkL32wSYW9p8yD4N4K25TH5KkPrGIg343J/qcM
         QTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309266; x=1794914066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=UYZQvTmA15SpEuSts1O+xM73VNJYgHd8edx0aQW+VJO0ODrVQAm/XvkT8eZQT9OIGz
         GC/DqH9A61a1jbSUkTg7t7S1alMCSZfrtGUxQgH+PIsV9A2cKjTZsdsgqfwkQOAwv4dh
         5HnHLt1Ycvoz+EBcwehoIkhYlJ7eFH8QqUiayuglkOADseDbbPS0/ua9JiUl0swqtJ+/
         exIPHnR1Y1msuAyCQlgYsce2jv/dH9VNHa2BssVUBjuST2VVxIPms5mnshSNuygV2NCz
         MIZkz52ne96f2vAYmd2hnRm7akymD0wxatd6jxKWcvV5F5Z8o2pIaFICfHpo1c7aZ6h1
         vkQg==
X-Forwarded-Encrypted: i=1; AL+hErHnhpAdQCIzZuEkd6M96DZWU9RDnmsEBCZcrxe1NuqXQPy/M52dr1otmH5GogyZoi8mpDAAvFb9tCjJnXIw@lists.infradead.org
X-Gm-Message-State: APuU4Z/5OdZ+cFdI52wGjJ7tR5ZalSdGHmR7Gs4WQJqTfhYFKV8ZBR/i
	UnffCSMVK9jMZeFhgC6xpEp91YkRg6kcmQZnJwsf4sjeRm70T0v4QlBDWZIgba8Y+Io=
X-Gm-Gg: AYBFou2/nbnpHvo8gLad2WhEW/4+2BppcxLYWt/xaC1OdiAiqkmB9nMm3tIgYv+WKz0
	WPN8IwexJbA9PYVRJQqnWKjBFJ8oTA/8iBtGLazqcVRDAFOdQ0o9Nno2+59A3k+WDoQYnlxpKCv
	IMJYp019Tt2LCAqAqrWx2mM/xI/tzTO0pcxO/YVmWpSpMq+jExsLTX5+kXTT5JCg9Sq3d0FBIU3
	dXRjyKK5pP2SK4uLHNk4DnCwUMtJ7taizeRz2CaTfGweo1ORxU/7JyY6apFfe2zTN6ATZDmK25I
	9rlAxKBHQ5Hl4DsiwZpTdlKwSYynVjYDfO84MLRDlxX+EzjL3MwvZvvQJuCWLwrDQFTfaE5s/9V
	xEjr63XjBp1sYBIHy6YzBbmOjRPUL6DJqVZEjW7yiQHhZ9g0sES7SBR5SZSQVFfvj7RDdGgRPwp
	sCLs+gJwourj8DSPg0hIs7Q6AqrVyk4VQ7Khm7U5TNSGX0iRQ7lSQaBIa0xxJgmWK3eZD+FUyTv
	UEC4W1kAa2Uf5/uy2z3CPIp0EIcjDa+eSoaQpAFhMCXiwZYmE4Hnnw5nepei1clImWhpr1zJzKR
	jroXGhobz5wLjJmR6GJM138IItYNcDNb
X-Received: by 2002:a05:600c:c16f:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4ba0234e2e5mr35596445e9.26.1794309265823;
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm4366683f8f.44.2026.11.10.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Message-ID: <ca4c9e4e-80bf-435d-9f55-18f1a38c4472@baylibre.com>
Date: Tue, 10 Nov 2026 12:14:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
 <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031428_151044_7481679A 
X-CRM114-Status: GOOD (  20.09  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvOC8yNiAxMDowMSBQTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBWYWxl
cmlvLAo+IAo+IE9uIFdlZCwgT2N0IDIxLCAyMDI2IGF0IDExOjUy4oCvUE0gVmFsZXJpbyBTZXR0
aSA8dnNldHRpQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4gQEAgLTg1LDkgKzg1LDkg
QEAgc3RhdGljIHZvaWQgZ3hfZm9ybWF0dGVyX2RldGFjaChzdHJ1Y3QgZ3hfZm9ybWF0dGVyICpm
b3JtYXR0ZXIpCj4+ICAgICAgICAgIGlmICghdHMpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+Pgo+PiAtICAgICAgIG11dGV4X2xvY2soJnRzLT5sb2NrKTsKPj4gKyAgICAgICBzcGluX2xv
Y2tfaXJxKCZ0cy0+bG9jayk7Cj4+ICAgICAgICAgIGxpc3RfZGVsKCZmb3JtYXR0ZXItPmxpc3Qp
Owo+PiAtICAgICAgIG11dGV4X3VubG9jaygmdHMtPmxvY2spOwo+PiArICAgICAgIHNwaW5fdW5s
b2NrX2lycSgmdHMtPmxvY2spOwo+Pgo+PiAgICAgICAgICBneF9mb3JtYXR0ZXJfZGlzYWJsZShm
b3JtYXR0ZXIpOwo+IFRoZSBkb2N1bWVudGF0aW9uIGJlbG93IHN0YXRlcyB0aGF0IC0+b3BzLT5k
aXNhYmxlIGlzIGNhbGxlZCB3aXRoIHRoZSBsb2NrIGhlbGQuCj4gZ3hfc3RyZWFtX3N0b3AoKSBk
b2VzIGNhbGwgaXQgd2l0aCB0aGUgbG9ja3MgaGVsZCBidXQKPiBneF9mb3JtYXR0ZXJfZGV0YWNo
IGhlcmUgZG9lc24ndC4KPiAKPiBJdCBkb2Vzbid0IHNlZW0gdG8gYmUgcHJvYmxlbWF0aWMgeWV0
IGJlY2F1c2UgYWl1LWZvcm1hdHRlci1pMnMuYwo+IGRvZXNuJ3QgcmVnaXN0ZXIgYSAtPmRpc2Fi
bGUgY2FsbGJhY2suCj4gQ2FuIHlvdSBwbGVhc2Ugc3RpbGwgbG9vayBpbnRvIHdoZXRoZXIgdGhp
cyBpcyBhIHByb2JsZW0/Cj4gCj4gQWxzbyBmb3IgYSBmdXR1cmUgcGF0Y2ggKG5vdCB0aGlzIGJ1
Z2ZpeCBhbnltb3JlKSBpdCB3b3VsZCBiZSBncmVhdCB0bwo+IGhhdmUgbG9ja2RlcF9hc3NlcnRf
aGVsZCB2YWxpZGF0ZSB0aGF0IHRoZSBsb2NrIGhhcyBiZWVuIHRha2VuIChpbnNpZGUKPiAtPmVu
YWJsZSwgLT5kaXNhYmxlIGFuZCAtPnByZXBhcmUpLgo+IAo+IFsuLi5dCj4+ICAgc3RydWN0IGd4
X2Zvcm1hdHRlcl9vcHMgewo+PiAgICAgICAgICBzdHJ1Y3QgZ3hfc3RyZWFtICooKmdldF9zdHJl
YW0pKHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3KTsKPj4gKyAgICAgICAvKgo+PiArICAg
ICAgICAqIEZvbGxvd2luZyBmdW5jdGlvbnMgYXJlIGNhbGxlZCB3aXRoIGd4X3N0cmVhbS0+bG9j
ayBoZWxkIGFuZCBsb2NhbAo+PiArICAgICAgICAqIElSUXMgZGlzYWJsZWQgc28gdGhleSBtdXN0
IG5vdCBzbGVlcC4KPj4gKyAgICAgICAgKi8KPj4gICAgICAgICAgdm9pZCAoKmVuYWJsZSkoc3Ry
dWN0IHJlZ21hcCAqbWFwKTsKPj4gICAgICAgICAgdm9pZCAoKmRpc2FibGUpKHN0cnVjdCByZWdt
YXAgKm1hcCk7Cj4+ICAgICAgICAgIGludCAoKnByZXBhcmUpKHN0cnVjdCByZWdtYXAgKm1hcCwK
CkhpIE1hcnRpbi4KCk9oLCBnb29kIGNhdGNoIGluZGVlZC4KCkFzIHlvdSBjb3JyZWN0bHkgcG9p
bnRlZCBvdXQgdGhhdCdzIG5vdCBhIHByb2JsZW0gdG9kYXkgYmVjYXVzZSB0aGUgb25seSAKZm9y
bWF0dGVyIGN1cnJlbnRseSBwcmVzZW50IGluIHRoZSB0cmVlIGRvZXNuJ3QgaW1wbGVtZW50IHRo
ZSAKJ2Rpc2FibGUoKScgY2FsbGJhY2suIEhvd2V2ZXIgdGhlIHVwY29taW5nIEFVRElOIHN1cHBv
cnQgWzFdIHdpbGwgdXNlIAp0aGF0IGNhbGxiYWNrLCBzbyB0aGUgcXVlc3Rpb24gbWlnaHQgcmVt
YWluLgoKVGVjaG5pY2FsbHkgaW4gJ2d4X2Zvcm1hdHRlcl9kZXRhY2gnIHRoZSBmb3JtYXR0ZXIg
aXMgZmlyc3QgcmVtb3ZlZCBmcm9tIAp0aGUgZm9ybWF0dGVyIGxpc3QgKHdpdGggc3BpbmxvY2sg
aGVsZCkgYmVmb3JlIGJlaW5nIGRpc2FibGVkLiBUaGlzIAptZWFucyB0aGF0IG90aGVyIHN0YXJ0
L3N0b3AgYWN0aW9ucyBjYW5ub3QgYmUgY2FsbGVkIG9uIHRoYXQgZm9ybWF0dGVyLgoKU28gZXZl
biB0aG91Z2ggdGhpcyBpcyBpZGVhbGx5IHNhZmUsIEkgdGhpbmsgdGhhdCBtb3ZpbmcgCidneF9m
b3JtYXR0ZXJfZGlzYWJsZScgdW5kZXIgdGhlIHNwaW5sb2NrIGd1YXJkIGlzIGJldHRlcjogYWxs
IHRoZSAKcmVnaXN0ZXIgYWNjZXNzIGFyZSBNTUlPIChub3Qgc2xlZXBpbmcpIGFuZCB0aGVuIHRo
ZSBiZWhhdmlvciB3b3VsZCBiZSAKc3ltbWV0cmljYWwgd2l0aCAnZ3hfZm9ybWF0dGVyX2F0dGFj
aCcuCgpUaGFua3MgYWxzbyBmb3IgdGhlIHN1Z2dlc3Rpb24gYWJvdXQgJ2xvY2tkZXBfYXNzZXJ0
X2hlbGQnLgoKSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uIHdpdGggdGhlc2UgcHJvYmxl
bSBmaXhlZC4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCi0tIApWYWxlcmlvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
