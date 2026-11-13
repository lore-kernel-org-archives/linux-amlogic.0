Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CAB606A8AA
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCkyzXqe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tKtrPj/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G5jZSprR0YGfK5mecHePXtncuRa66KNS+mLD8RsGlXI=; b=uCkyzXqeYsCzVWKNtIdjqAk3EJ
	ZC/SxY9f61yozc/9DdeMhYoxCs7pL+TarVC1NySwKVEazzm3MZh2pXs4K7nctwkiNJIX0kbum0IWQ
	SlWeTxlKOBmXGgvwHg+kzjjbSaXMR9HwJG3fYjL6vAhqUls7tf+YsxvWZkk3cYN/OTEmncv8G0Oj3
	zSjChn4ZhBjKA1ey8ycnH9lpS8O/RNBySBnazGFIDkF8VQpe4XqOeoppvs4EVRlEhgIHxwmmFYg5x
	qKMT8WaqrGoY/KGrXZZYMihDwriB6RjfQJbYodyjRJkXNy+D48U2a01Aa0TyoojwIl32iO2wVSRxa
	eDxvwcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz9M-0000000EcxV-2z3g;
	Fri, 13 Nov 2026 21:49:36 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz9J-0000000EcwV-2XYY
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 21:49:34 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6798eb0d190so1198809d50.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 13:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794606572; cv=none;
        d=google.com; s=arc-20260327;
        b=PbOKbMw9XUKnVYZlFSXAdbt6hAMxK6g11o8av/EFr6Ndxn7G+wfSNhZlaC7MDxTLri
         BQAGM9K2ybxN0QOlgQsg8q/djHOFVMyYJlYangpEUXp0IGtn/mQ4DYMEP+hZiv2FXnmc
         t+Po7Umpt4KTL2eH0WV+/IuQMS25nay7e9n4nAgxmh4E25x3mjwVQoaL+sAxVHqa7yiE
         U60ipr4dyxSaA57WsFQ8MFv20ZUiAzIiTDMw/j0oX5/1vHtD1LrwyZ2OAzxgXcNdjrRo
         F9qTyhjJQIIOcbXWf5kfuGt5uJjKe3FI6+PDHBHSVALFW19Hms8QYsl+GhwDboCEfzhK
         o1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        fh=eIbnDuwfYraszMeKwZ9+nIjJBkIOpEZ7tWDAqTXVlZk=;
        b=iQiRzwnMkzAGC8KQDUJs7j6dh6QlKluFUZi1rmK3sApZ2TshtDJq1YCjzySQ7Jew3G
         /pVx8q92MoFQBJiI1Bo2kqhW3P0HzDctV8np/zKlfas5zzHHxbU4on8JQBffxr/VjAkf
         Rtix4CByMShU4DYj7zOnCu3/1zTtxET9r9Eaw4GCELKvdO/Zh3vePLHcUHSwYeV+/olR
         HK9JIzCHajT69p85nyGkNKg5zq3ZaCao45AwY07c27je5QFzUayW6yyqfHsFqLzmh26Z
         vPjxY+5wkrjfoSrPHlqvijEO2U2kV9vyOIIUXbCp0pYJ3S/aNuBt5JTFKe0NejpugG4J
         sxvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794606572; x=1795211372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=tKtrPj/XX4N44IevHlFgAH7DbNuZGVFEQKyd25070wYbDFkMzLKiBC6oaxaJMznNMI
         5ZpZDiIH2/tRXV86476GP52nA2Y9fo2lU6ZYnLmM0YxY0ArcQ0WV53gZkOWRpOg/Gu/S
         NUyEj1j8DhHmn0BtemcEERk65Gf1nRW34DwxqCOLsHv5ycr6WQXIuarMlqUtLTlS6nhC
         3zDaShT3qVhSQqbJHXxtGsHYeTVef/oVbhd2WMIh+qlN2+C6UMEIUZaDGkiPZhTHkTzY
         i9SOwzAu4CbrEQa7X6+usgdCwnK/Yqbpv3ag/InA/wzV0xtvEn9QMS85/ww2Qa6LRSlR
         T0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606572; x=1795211372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=iIzyuIzpppmWHwL+LmUPVnGtz1QkTfXNUGX/E2JyGvJEhtf86027UQlobBlmZqwk4k
         Q8p7263Z2ZiKQ+40Ec7gaxrrAmA2N9ilGmliBv8yA0a1jv+k2Q3xAqfXXUq9q/CYw552
         ZHQP3T2rjkyVKjZkNxDPybvoR2JQqGGaP1A6j3l9NjipcNR0+spLBsZU9H+PmofLUhf9
         GljXwSTlv33Lcs+rnmy1sQtGI9VPlh71LVzJOt1m/VRqUlGLbcODdZTe2I8jlA7uX9Pt
         rssFdnMNfRejUBHe5s3RDZIMRnYvkUnpmvJvm5ADaHANGAuJ6OtIxdPHxdiHdtE3jdrA
         pBoA==
X-Forwarded-Encrypted: i=1; AL+hErGOLkK4acHVOGrOVFQZ5hUkHIzwfXB/ruxugz156kFYHfZ1xbPejhD3bOCnXdvW49W0FHyNtyWGiwMxANeb@lists.infradead.org
X-Gm-Message-State: APuU4Z8wFhQHLWa+HbB2KIPFhC3oXebO6YW6evMoWIZtQueieSOLSKfu
	PPJcdwD5wjtu7S7bQvm75tf5zomUx0aJPrg6OMnIh1fXFdlGTtN8LXpESX4591PQKTdyOOBPEro
	T925Qlv7x1lm0iP2dcYIFAZHhKa7oMO/vlXN6
X-Gm-Gg: AYBFou3MkK8oXvI5JpX22oOXBNWX9VtgbE+YMbWBRF2hYR8Hx2sUSwU+Uk1akhR5175
	0bsvqIjyJ4Q3Q/DR6nCmifz2mkdVfjmVIykSh06ZvArMtSyqrvr95LyhUQjkz9HXle7ebqHchHh
	JDWUG/B0x4sf7IDhc+Fxvq1bD5/c+1dUZGogQSyKEDN1RlnvAEAQs5udk1qlfzofAX/VLIGOP8k
	vvBLgFam5/EEnzHp6UVHOvGjDgfeO2uDeOKoZJLwR/RtNe1bAns2uACfuYC8IgWvunFplWv35Ps
	8XHkCY+24XKf890rLpM+npEtvMv5DbaMrsOKJwfVblRsLccK1RJDzfDYz0j2jltCxwVFEkZbdPK
	+hILKAsPojAcqbfleIRsz4bXrr5hBIm0jQET18rp2ic2mLaGYaBkeIn9MOZ15WiPNsMrTrA==
X-Received: by 2002:a05:690e:4514:20b0:67b:f3f1:1657 with SMTP id
 956f58d0204a3-67d895d1d1emr1805444d50.34.1794606572014; Fri, 13 Nov 2026
 13:49:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 22:49:21 +0100
X-Gm-Features: AclHuK86y13cJB3U7lK1W7UeMH0dHKC_-NtrK8Vfy5rgx6ydsQHgJZMUNQRuLoU
Message-ID: <CAFBinCCKLhk1RZX725o84kMYTsiVZF8SE3rc52t5NuknwHgMGg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
To: Valerio Setti <vsetti@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_134933_659425_5834DC37 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMjo1NuKAr1BNIFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gZGFpX2xpbmtzIGluIHRoZSBneC1jYXJkIGFyZSBhdG9t
aWMgd2hpY2ggbWVhbnMgdGhhdCB0aGUgREFJIHRyaWdnZXIKPiBjYWxsYmFjayBpcyBjYWxsZWQg
d2l0aCB0aGUgc3BpbmxvY2sgaGVsZC4gVGhpcyBtZWFucyB0aGF0IHVzYWdlIG9mCj4gcG90ZW50
aWFsbHkgc2xlZXBpbmcgZnVuY3Rpb25zIChlLmcuIG11dGV4ZXMpIGlzIG5vdCBhbGxvd2VkIGhl
cmUuCj4KPiAnc25kX3NvY19jb21wb25lbnRfd3JpdGUnLydzbmRfc29jX2NvbXBvbmVudF9yZWFk
JyB0YWtlIHRoZSBjb21wb25lbnQncwo+IGlvX211dGV4IG9uIGVudHJ5Lgo+Cj4gUmVwbGFjZSB1
c2FnZSBvZiB0aGVzZSBmdW5jdGlvbnMgaW46Cj4gLSAnYWl1X2ZpZm9faTJzX3RyaWdnZXInCj4g
LSAnZmlmb19zcGRpZl90cmlnZ2VyJwo+IC0gJ2FpdV9maWZvX3BvaW50ZXInCj4KPiBUaGlzIGlz
IG1lYW50IHRvIHJlc29sdmUgdGhlIGZvbGxvd2luZyBydW50aW1lIGJ1ZyBmb3VuZCB3aGlsZSBz
dGFydGluZyBJMlMKPiBwbGF5YmFjayBvbiBhbiBPZHJvaWRDMiBkZXZpY2Ugd2hlcmUgdGhlIGtl
cm5lbCB3YXMgYnVpbHQgZW5hYmxpbmcKPiBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQIGFuZCBD
T05GSUdfUFJPVkVfTE9DS0lORzoKPgo+ICAgUGxheWJhY2sgZGV2aWNlIGlzIGh3OjAsMAo+ICAg
U3RyZWFtIHBhcmFtZXRlcnMgYXJlIDQ0MTAwSHosIFMxNl9MRSwgMiBjaGFubmVscwo+ICAgU2lu
ZSB3YXZlIHJhdGUgaXMgMTAwMC4wMDAwSHoKPiAgIFJhdGUgc2V0IHRvIDQ0MTAwSHogKHJlcXVl
c3RlZCA0NDEwMEh6KQo+ICAgQnVmZmVyIHNpemUgcmFuZ2UgZnJvbSAxMjggdG8gMjYyMTQ0Cj4g
ICBQZXJpb2Qgc2l6ZSByYW5nZSBmcm9tIDY0IFsgICAyMS4wMTIwNzRdIEJVRzogc2xlZXBpbmcg
ZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IGtlcm5lbC9sb2NraW5nL211
dGV4LmM6NjIzCj4gICBbICAgMjEuMDE4MDA5XSBpbl9hdG9taWMoKTogMSwgaXJxc19kaXNhYmxl
ZCgpOiAxLCBub25fYmxvY2s6IDAsIHBpZDogMjY3LCBuYW1lOiBzcGVha2VyLXRlc3QKPiAgIFsg
ICAyMS4wMjYxODRdIHByZWVtcHRfY291bnQ6IDEsIGV4cGVjdGVkOiAwCj4gICBbICAgMjEuMDMw
MTUxXSBSQ1UgbmVzdCBkZXB0aDogMCwgZXhwZWN0ZWQ6IDAKPiAgIFsgICAyMS4wMzQyMDVdIGxv
Y2tzIGhlbGQgYnkgc3BlYWtlci10ZXN0LzI2NzogMSwgbGFzdCBDUFUjMzoKPiAgIFsgICAyMS4w
Mzk2MzhdICAjMDogZmZmZjAwMDAwM2RiZDkxMCAoJmdyb3VwLT5sb2NrIzIpey4uLi59LXszOjN9
LCBhdDogc25kX3BjbV9zdHJlYW1fbG9ja19pcnErMHg0MC8weDYwCj4gICBbICAgMjEuMDQ4Nzgy
XSBpcnEgZXZlbnQgc3RhbXA6IDUyNzQKPiAgIFsgICAyMS4wNTIwNTldIGhhcmRpcnFzIGxhc3Qg
IGVuYWJsZWQgYXQgKDUyNzMpOiBbPGZmZmY4MDAwODE0OTQyNDA+XSBfcmF3X3NwaW5fdW5sb2Nr
X2lycSsweDM4LzB4ODAKPiAgIFsgICAyMS4wNjA4NTZdIGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQg
YXQgKDUyNzQpOiBbPGZmZmY4MDAwODE0OTM1Yzg+XSBfcmF3X3NwaW5fbG9ja19pcnErMHg4MC8w
eDkwCj4gICBbICAgMjEuMDY5NDgxXSBzb2Z0aXJxcyBsYXN0ICBlbmFibGVkIGF0ICg1MjM4KTog
WzxmZmZmODAwMDgwMGY5YWVjPl0gaGFuZGxlX3NvZnRpcnFzKzB4NTg0LzB4NWUwCj4gICBbICAg
MjEuMDc4MDIwXSBzb2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICg1MjMxKTogWzxmZmZmODAwMDgw
MDEwMzI0Pl0gX19kb19zb2Z0aXJxKzB4MWMvMHgyOAo+ICAgWyAgIDIxLjA4NjEzM10gQ1BVOiAz
IFVJRDogMCBQSUQ6IDI2NyBDb21tOiBzcGVha2VyLXRlc3QgTm90IHRhaW50ZWQgNy4zLjAgIzIg
UFJFRU1QVAo+ICAgWyAgIDIxLjA4NjE0MV0gSGFyZHdhcmUgbmFtZTogSGFyZGtlcm5lbCBPRFJP
SUQtQzIgKERUKQo+ICAgWyAgIDIxLjA4NjE0NV0gQ2FsbCB0cmFjZToKPiAgIFsgICAyMS4wODYx
NDldICBzaG93X3N0YWNrKzB4MjAvMHg0MCAoQykKPiAgIFsgICAyMS4wODYxNjBdICBkdW1wX3N0
YWNrX2x2bCsweDZjLzB4OTgKPiAgIFsgICAyMS4wODYxNzFdICBkdW1wX3N0YWNrKzB4MTgvMHgy
NAo+ICAgWyAgIDIxLjA4NjE3OV0gIF9fbWlnaHRfcmVzY2hlZCsweDE2MC8weDIzMAo+ICAgWyAg
IDIxLjA4NjE4OV0gIF9fbWlnaHRfc2xlZXArMHg1MC8weDkwCj4gICBbICAgMjEuMDg2MTk3XSAg
X19tdXRleF9sb2NrKzB4NjQvMHg4YTAKPiAgIFsgICAyMS4wODYyMDZdICBtdXRleF9sb2NrX25l
c3RlZCsweDJjLzB4NDAKPiAgIFsgICAyMS4wODYyMTVdICBzbmRfc29jX2NvbXBvbmVudF93cml0
ZSsweDM4LzB4ODAKPiAgIFsgICAyMS4wODYyMjddICBhaXVfZmlmb19pMnNfdHJpZ2dlcisweDc0
LzB4OTAKPiAgIFsgICAyMS4wODYyMzddICBzb2NfZGFpX3RyaWdnZXIucGFydC4wKzB4NDQvMHg5
MAo+ICAgWyAgIDIxLjA4NjI0Nl0gIHNuZF9zb2NfcGNtX2RhaV90cmlnZ2VyKzB4MTc0LzB4Mjgw
Cj4gICBbICAgMjEuMDg2MjU1XSAgc29jX3BjbV90cmlnZ2VyKzB4ZTQvMHgxZjAKPiAgIFsgICAy
MS4wODYyNjVdICBkcGNtX2RhaV90cmlnZ2VyX2ZlX2JlKzB4MzAvMHhiMAo+ICAgWyAgIDIxLjA4
NjI3Nl0gIGRwY21fZmVfZGFpX2RvX3RyaWdnZXIrMHgxMWMvMHgxYTAKPiAgIFsgICAyMS4wODYy
ODddICBkcGNtX2ZlX2RhaV90cmlnZ2VyKzB4NDAvMHg2MAo+ICAgWyAgIDIxLjA4NjI5Nl0gIHNu
ZF9wY21fZG9fc3RhcnQrMHg0Yy8weDgwCj4gICBbICAgMjEuMDg2MzA3XSAgc25kX3BjbV9hY3Rp
b25fc2luZ2xlKzB4NTAvMHhjMAo+ICAgWyAgIDIxLjA4NjMxNl0gIHNuZF9wY21fYWN0aW9uKzB4
ODgvMHhiMAo+ICAgWyAgIDIxLjA4NjMyNV0gIHNuZF9wY21fc3RhcnQrMHgyYy8weDQwCj4gICBb
ICAgMjEuMDg2MzM1XSAgX19zbmRfcGNtX2xpYl94ZmVyKzB4NjYwLzB4ODEwCj4gICBbICAgMjEu
MDg2MzQ1XSAgc25kX3BjbV9jb21tb25faW9jdGwrMHhhMjAvMHgxN2UwCj4gICBbICAgMjEuMDg2
MzU2XSAgc25kX3BjbV9pb2N0bCsweDNjLzB4NjAKPiAgIFsgICAyMS4wODYzNjZdICBfX2FybTY0
X3N5c19pb2N0bCsweGFjLzB4MTEwCj4gICBbICAgMjEuMDg2Mzc2XSAgaW52b2tlX3N5c2NhbGwr
MHg1Yy8weDEyMAo+ICAgWyAgIDIxLjA4NjM4Nl0gIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4w
KzB4NDgvMHhmMAo+ICAgWyAgIDIxLjA4NjM5NV0gIGRvX2VsMF9zdmMrMHgyNC8weDQwCj4gICBb
ICAgMjEuMDg2NDA0XSAgZWwwX3N2YysweDU0LzB4M2IwCj4gICBbICAgMjEuMDg2NDE0XSAgZWww
dF82NF9zeW5jX2hhbmRsZXIrMHhhMC8weGYwCj4gICBbICAgMjEuMDg2NDI0XSAgZWwwdF82NF9z
eW5jKzB4MTk4LzB4MWEwCj4KPiBOb3RlOiB0aGUgcmV0dXJuIHZhbHVlIG9mICdyZWdtYXBfcmVh
ZCcgaW4gJ2FpdV9maWZvX3BvaW50ZXInIGlzCj4gaW50ZW50aW9uYWxseSBpZ25vcmVkLiBSZWdt
YXAgaXMgTU1JTyBoZXJlIGFuZCByZWFkIGZhaWx1cmVzIHNob3VsZG4ndAo+IGhhcHBlbi4gQWxz
byAnYXhnLWZpZm8uYycgaXMgZG9pbmcgdGhlIHNhbWUgaW4gaXRzICdheGdfZmlmb19wY21fcG9p
bnRlcicuCj4KPiBGaXhlczogZTg3MTIzMTVjNDRkICgiQVNvQzogc29jLWNvbXBvbmVudDogdXNl
IGlvX211dGV4IGNvcnJlY3RseSIpCj4gRml4ZXM6IDZiNTljNTNjOGFkYyAoIkFTb0M6IG1lc29u
OiBhaXU6IGZpZm8tc3BkaWY6IHNvZnQgcmVzZXQgdGhlIFMvUERJRiBkYXRhcGF0aCBvbiBzdGFy
dC9zdG9wIikKPiBTaWduZWQtb2ZmLWJ5OiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUu
Y29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
