Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D0606A8AB
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjpruenQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hMttQTJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cuP7hR+F4HzBEH/hEA619OZTTad2GYWYFsMIGCfvyw4=; b=wjpruenQWvwP+0SrRO91yIYvY3
	qf4nyHMAT5wXEA9sY4DIrJKljNXpx7fg1pRO/lpiecjFBsdFMtYj8OP6jy90LkHEc5NbVxLwzJLN+
	9o0hulOLZF5utaop6IEqP+baxMQ3Y0RdOlj3N8Bv4GzBK/3ZMTmrB4f3drtycgoWbROcobJi5qFWX
	BGCNuIzjPykL/pYYzMonHiXaC+ifoxbKYFGCp2Uw27XALRWsZsnSfoGcAYN1C8B9bFxdMJisrQNUu
	eREsTIlPdJH8/YOPPbJQg5x29CKTcgQysiymMve4H4rkiJ86JFtdPUU6ZlKz4lM42VTkieD2EuJv0
	QmKlnMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsKu-0000000DAUs-0d1I;
	Fri, 13 Nov 2026 14:33:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsKq-0000000DATq-2BqK
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 14:33:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so16948295e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794580378; x=1795185178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=hMttQTJgFyn/CkDD99p4Niayo23Qsqsq7Zx8qQRn8BNjq2CGY8CgcbhxmVfHuapby8
         rVlT2bO262QRV2LEzySojFZHPIuemUhjWdUjrQpsWhpRraUmn6A6wCyscyTnILYDtJBD
         iVMRxQEUz1zBcUgzon0UEodJDjAEuiFegZAhnQkiNORkjLlisuILTUlWigFGe8CC9O0P
         HI4OMnxNjke+GzqiWzcOWPzSZS+N6ylGbhbMbWiAfuwchhRYrJ8q8nvMbd0BBC7G1Ffg
         QeEI7wmQZ41udoV+lBP5FQ/23x2ErRXg0uUTy2OuVtVEO2YgOGvl+1hyf+wvrFABn9ic
         upBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580378; x=1795185178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=se/85wsc5CtWylNSEQ8DK75LSfEBQPa7wKg4+liwpZ7Lxxd98dFXZwl6WmXcVIenmf
         3IfgxbXKzv+iPix73URTf0V5/EflTHZKOu/khM3KehJvAmPed6qInpmfTKJlhC2Gk5yZ
         1NSnUWDnFn15rioIkPWKKpFH/CkGFUjyry6M24WP3Xc93lxiEUbnIws65GvgkSEJUlRI
         +Q2chpCMpcDzwvrv5zb3HUHH+Dw9RhR2NPJGvwJmvURYAoKze4tb9X5/Z/t8/2hXp3LN
         mIctYu/hrBTsKXREHiSXOvkBCxJMyiAqFQNvpYy47ZojFn9dPs2WyydgOfQgHWKySzdA
         eARw==
X-Forwarded-Encrypted: i=1; AL+hErGr95CgA8shu6NFlR5AAXQD04WMkl98A8v2mwewDQAgJwaHtI1mReOrJRZ0LKE5qV8AEYD8LGju/KMf5y6Z@lists.infradead.org
X-Gm-Message-State: APuU4Z9UpzdXRw2leFer9AodOtvnIR/0jDXUdwREmlXRFUCZblDEMPd6
	BBaEAwwZNniKXvdZvWxYROWKi8rhxh1p3rmM01SwY6M3+o3OAg20EUYb995pE8R60AE=
X-Gm-Gg: AYBFou0n/E5bK4HWewOvRSTDqtt9LnBnu91eiCvAVl1ivPKpeZKTZGYrq388MKnlfLm
	BvYWJFiNPI449ob8JRRJpy9w793xfM7fUpOx7CJA/36s2PEiStfYTxylxENF8fYdX1fxS4Bewwm
	QunnRZptO1b7lEon5s2scGCZmWZyVqwPmY834prdtgvD7eB2vy8o9Gsm/Ck/j1xxZEOcLXPOUfY
	frrelPn6atO2+am2C/+zI2MASxBla5F+8jWp9Vhq5irgOJbSCph4Qvzuk4vX23FI/lo8ks6fjZs
	tLMlkHKtABpGhODDD4Afv/OknTRFbHVdg1l+EE3n+njBNGz54B4ld/D5S05rNC62Sb3zvLt93uC
	CZAzUJnfQB1fxRSjyYQqm25lt6wkHpaIDUIsemYLKjgu+uzc0crEN1Pvskcfetso1OV8dKhVRNN
	uocuyuYvdpWQvwA1wMARC0lozBIRfJr584mFKGmNNU404IRtPKRx9C4EuAboJArBI4X5brG37v2
	oFnJ7V8XCzP5A7OQR9mAnP5hZcA9mQvCk4ffDI/eofoUfZxhdDEqOdYG8zHTxVCukvB1kWZRTA9
	ByhF12yftrSPCzhffy+RHiIGCtadLjI8agzycPwJ9ZU/kFdt
X-Received: by 2002:a05:600c:3111:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4bb55a4490fmr56671835e9.10.1794580378184;
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm167089005e9.2.2026.11.13.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org,
 christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org,
 sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Stefan
 =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>,
 devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 krzk+dt@kernel.org, bmasney+clk@redhat.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Fri, 13 Nov 2026 15:32:56 +0100
Message-ID: <1j7big244n.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_063300_644268_E9599C4A 
X-CRM114-Status: GOOD (  33.32  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gbHVuLiAwOSBub3YuIDIwMjYgYXQgMDk6NDQsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcg
d3JvdGU6Cgo+IE9uIDExLzgvMjYgMjI6NDUsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+
IE9uIFR1ZSwgTm92IDMsIDIwMjYgYXQgMTA6NDbigK9BTSBDaHVhbiBMaXUgPGNodWFuLmxpdUBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gSGkgTWFydGluLAo+Pj4gICAgICAgVGhhbmsgeW91
IGZvciBqb2luaW5nIHRoaXMgZGlzY3Vzc2lvbi4gOikKPj4+Cj4+PiBJIGhhdmUgcmUtZXhhbWlu
ZWQgdGhlIGNhcGFiaWxpdGllcyBwcm92aWRlZCBieSBwbV9vcHAgYW5kIGNwdWZyZXEtZHQsCj4+
PiBhbmQgaXQgc2VlbXMgdGhhdCB3ZSBtYXkgYWxzbyBiZSBhYmxlIHRvIGFkYXB0IEE5IGZhaXJs
eSB3ZWxsIGJhc2VkIG9uCj4+PiB0aGUgYW1sb2dpYy1jcHVmcmVxLmMgaGVyZS4gU28gd2UgaGF2
ZSBubyBvYmplY3Rpb25zIHRvIHRoZSBkcml2ZXIKPj4+IGltcGxlbWVudGF0aW9uIGluIGFtbG9n
aWMtY3B1ZnJlcS5jIGhlcmUuCj4+Pgo+Pj4gSSB3YXMgbW9zdCB3b3JyaWVkIGFib3V0IGJlZm9y
ZSB3YXMgdGhhdCBjcHVmcmVxLWR0IG1pZ2h0IG5vdCBmdWxseQo+Pj4gaGFuZGxlIHRoZSBjb21w
bGljYXRlZCBjbG9jayBhbmQgc3VwcGx5IGFkanVzdG1lbnQgbG9naWMgYmV0d2Vlbgo+Pj4gbXVs
dGlwbGUgY2x1c3RlcnMsIHdoaWNoIHdvdWxkIGhhdmUgcmVxdWlyZWQgYWRkaW5nIGEgc2VwYXJh
dGUKPj4+IGNwdWZyZXFfZHJpdmVyLiBCdXQgaXQgbm93IGxvb2tzIGxpa2UgdGhpcyBjYW4gYmUg
c29sdmVkIGJ5IGFkZGluZyB0aGUKPj4+IGNvcnJlc3BvbmRpbmcgY29uZmlnX2Nsa3MoKSBhbmQg
Y29uZmlnX3JlZ3VsYXRvcnMoKSBjYWxsYmFja3MgaW4KPj4+IGRldl9wbV9vcHBfc2V0X2NvbmZp
ZygpLgo+PiBUaGF0J3MgZ3JlYXQgbmV3cywgaW5kZWVkIQo+PiAKPj4gWy4uLl0KPj4+PiAtIE1l
c29uOC84Yi84bTIgKDMyLWJpdCBBUk0gQ29ydGV4LUE1L0E5KSB3aGVyZSB3ZSBuZWVkIHRvIHJl
cGFyZW50Cj4+Pj4gdGhlIENQVSBjbG9jayB0byBYVEFMIGZvciBzdGFibGUgb3BlcmF0aW5nIGR1
cmluZyBjbG9jayBjaGFuZ2VzICh3aGljaAo+Pj4+IHNob3VsZCBnbyBpbnRvIGEgY3B1ZnJlcSBk
cml2ZXIgdGhhdCBpbXBsZW1lbnRzIHRhcmdldF9pbnRlcm1lZGlhdGUpLgo+Pj4+IFRoZXJlJ3Mg
bm8gc2VjdXJlIG1vbml0b3Igb3IgZmlybXdhcmUgaW52b2x2ZWQgZm9yIENQVSBjbG9ja3MuCj4+
Pgo+Pj4gQlRXLCBjb3VsZCB3ZSBwdXQgdGhlIENQVSBjbG9jayBoYW5kbGluZyBsb2dpYyBpbiB0
aGUgY2xvY2sgZHJpdmVyIGxpa2UKPj4+IEcxMkEgZG9lcyAodGhvdWdoLCBvZiBjb3Vyc2UsIGhh
bmRsaW5nIGl0IGluIHRoZSBjcHVmcmVxIGRyaXZlciBtaWdodAo+Pj4gbWluaW1pemUgdGhlIGNv
dXBsaW5nIGJldHdlZW4gdGhlIGNsb2NrIGFuZCBjcHVmcmVxIGRyaXZlcnMpPyBUaGF0IHdheQo+
Pj4gd2UgY291bGQgZnVsbHkgcmV1c2UgdGhlIGV4aXN0aW5nIGNwdWZyZXEtZHQ/Cj4+IENvbW1v
biBjbG9jayBmcmFtZXdvcmsgbWFpbnRhaW5lcnMgZG9uJ3Qgd2FudCBtdXhlcyB0byBiZSBwcm9n
cmFtbWVkCj4+IG1hZ2ljYWxseSBpbiBjbG9jayBub3RpZmllcnMgKHdoaWNoIGlzIHdoYXQgRzEy
QSBhbmQgTWVzb244KiBkbykuCj4+IFNvIHRoZXJlJ3MgYSBjaGFuY2UgdGhhdCBmb3IgbmV3IGRy
aXZlcnMgdGhleSB3b3VsZCBqdXN0IE5BQ0sgdGhhdCBhcHByb2FjaC4KPj4gSSBkb24ndCByZWNh
bGwgdGhlIGV4YWN0IHJlYXNvbiBhbnltb3JlIC0gYnV0IGZyb20gbXkgcGVyc3BlY3RpdmUKPj4g
dXNpbmcgYSBjcHVmcmVxIGRyaXZlciBmb3IgdGhpcyBpcyB0aGUgY2xlYW5lc3QgYXBwcm9hY2gg
KGFsdGhvdWdoIGEKPj4gZmV3IGxpbmVzIG9mIGNvZGUgZXh0cmEpLgo+Cj4gSXQgd291bGQgbW92
ZSB0aGUgc29jLXNwZWNpZmljIGxvZ2ljIGZyb20gYSBzb2Mtc3BlY2lmaWMgY2xrIGRyaXZlcgo+
IHRvIHNvYyBzcGVjaWZpYyBjcHVmcmVxIHRyZWUgaGFuZGxpbmcgY2xvY2sgbXV4aW5nLiBJIGtp
bmQgb2YKPiBkaXNhZ3JlZSBvbiB0aGlzIGFwcHJvYWNoLiBJZiBzb21lIGxvZ2ljIGlzIG5lZWRl
ZCB0byBoYW5kbGVkIGNsb2NrCj4gcGFya2luZyB3aGlsZSBzd2l0Y2hpbmcgY2xvY2sgc3ViLXRy
ZWVzIGFuZCBub3RpZmllcnMgaXMgbm90Cj4gYWNjZXB0ZWQgdGhlbSB0aGUgQ0NGIHNob3VsZCBl
dm9sdmUgdG8gaGFuZGxlIHRoYXQsIG5vdCBtb3ZpbmcKPiB0aGlzIGxvZ2ljIGVsc2V3aGVyZSBh
bmQgaGF2ZSBhIHByb2xpZmVyYXRpb24gb2YgY2xrIG11eCByZWxhdGVkCj4gY29kZSBpbiBjcHVm
cmVxLgoKSSBkb250IHJlYWxseSBhZ3JlZSB3aXRoIHRoaXMuIFRoZXJlIGFyZSBvdGhlciBjcHVm
cmVxIGRyaXZlciB0aGF0IGRvCmhhbmRsZSB0aGlzIGludGVybWVkaWF0ZSBjbG9jay4gQ0NGIGlz
IHRoZXJlIHRvIGV4cG9zZSB3aGF0IGEgY2xvY2sgY2FuCmRvIGFuZCBob3cgaXQgYmVoYXZlLCBu
b3QgdG8gZW5jb2RlIGhvdyBvbmUgZXhwZWN0IHRvIHVzZSBpdCAuLi4KZXZlbiBpZiBpdCBpcyB0
aGUgQ1BVLgoKV2hpY2ggY2xvY2sgaXMgdGhlICJwYXJraW5nIiBhbmQgaG93IGl0IGlzIGhhbmRs
ZWQgaXMgcmVhbGx5IG5vdApzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgaGFuZGxlIGluIHRoZSBj
bG9jayBjb250cm9sbGVyLiB0aGlzIGlzCmEgdXNhZ2UgcG9saWN5IGFuZCBpdCBiZWxvbmcgdGhl
IGNsb2NrIGNvbnN1bWVyIElNTy4KCkNoYW5naW5nIG11eGVzIGluIG5vdGlmaWVycyBpcyBhbHNv
IHZlcnkgZnJhZ2lsZSBhbmQgd2lsbCBjb21wbGV0bHkKYnJlYWsgaW4gYW5vdGhlciBjbG9jayB3
YXMgdG8gcmVmdXNlIHRoYXQgY2hhbmdlIHdoaWxlIGluIHRoZSBub3RpZmllci4KSXQgaXMga2lu
ZCBvZiBnZXR0aW5nIGluIHRoZSB3YXkgb24gcmV3b3JrcyB3ZSBoYXZlIHRvIGRvIGluIENDRgpB
bWxvZ2ljIEcxMiBpcyB0aGUgb25seSBvbmUgZG9pbmcgdGhhdC4gSSB3b3VsZCBwcmVmZXIgaWYg
dGhpcyBsb2dpYwpjb3VsZCBnbyBpbiBhIGNwdWZyZXEgZHJpdmVyLCB3aGljaCBpcyB3aGVyZSBp
dCBiZWxvbmcgSU1PLgpJZiB0aGluayB3ZSBjYW4gZG8gc28gd2l0aG91dCBhbnkgYnJlYWthZ2Ug
aW4gRFQuCgo+Cj4+IAo+PiBBZGRpdGlvbmFsbHk6IEkgYmVsaWV2ZSB0aGUgdWRlbGF5KDEwMCkg
aW4gdGhlIEcxMkEgYW5kIE1lc29uOCoKPj4gaW1wbGVtZW50YXRpb24gaXMgbm90IGV2ZW4gY2xv
Y2sgcmVsYXRlZCBidXQgYSBkZWxheSB0byB3YWl0IGZvciB0aGUKPj4gcmVndWxhdG9yIHRvIGJl
Y29tZSBzdGFibGUuCj4KPiBJdCdzIGhpZ2hseSBwcm9iYWJsZQo+Cj4+IAo+Pj4+IC0gR1hCQi9H
WEwvR1hNIHVzZSBTQ1BJIGZpcm13YXJlIENQVSBjbG9jayBjb250cm9sIHNvIHRvIG15IGtub3ds
ZWRnZQo+Pj4+IHdlJ3JlIGdvb2Qgd2l0aCB3aGF0IHdlIGhhdmUgKG1lYW5pbmc6IG5vIGN1c3Rv
bSBjcHVmcmVxIGRyaXZlcgo+Pj4+IG5lZWRlZCkKPj4+PiAtIEcxMkEgc2luZ2xlIGNsdXN0ZXIs
IG5vIERTVTogbmVlZHMgYSBjcHVmcmVxIGRyaXZlciB0aGF0IGltcGxlbWVudHMKPj4+PiB0YXJn
ZXRfaW50ZXJtZWRpYXRlIChjdXJyZW50bHkgaXQncyBtYW5hZ2VkIG9uIGNsb2NrIGRyaXZlciBz
aWRlIGluCj4+Pj4ga2VybmVsIHNwYWNlLCBubyBmaXJtd2FyZSBpbnZvbHZlZCkKPj4+PiAtIEcx
MkIgbXVsdGkgY2x1c3Rlciwgbm8gRFNVOiBuZWVkcyBhIGNwdWZyZXEgZHJpdmVyIHRoYXQgaW1w
bGVtZW50cwo+Pj4+IHRhcmdldF9pbnRlcm1lZGlhdGUgKGN1cnJlbnRseSBpdCdzIG1hbmFnZWQg
b24gY2xvY2sgZHJpdmVyIHNpZGUgaW4KPj4+PiBrZXJuZWwgc3BhY2UsIG5vIGZpcm13YXJlIGlu
dm9sdmVkKQo+Pj4KPj4+IFRoZSBjcHVmcmVxLXJlbGF0ZWQgcmVzb3VyY2VzIG9uIHRoZSBTb0Nz
IG1lbnRpb25lZCBhYm92ZSBhcmUgcmVsYXRpdmVseQo+Pj4gY2xlYW46IGVhY2ggY2x1c3RlciBo
YXMgb25seSBvbmUgaW5kZXBlbmRlbnQgY2xvY2sgYW5kIHN1cHBseSBvZiBpdHMKPj4+IG93biwg
YW5kIHRoZXNlIFNvQ3MgYWxzbyBkbyBub3Qgc3VwcG9ydCB2b2x0YWdlIHNlbGVjdGlvbiBiYXNl
ZCBvbiBjaGlwCj4+PiBiaW5uaW5nLgo+PiBUaGF0IG1ha2VzIHRoaW5ncyBzaW1wbGUsIGluZGVl
ZDogZWFjaCBjbHVzdGVyIGZvbGxvd3MgdGhlIHNhbWUgbG9naWMKPj4gdXNpbmcgaXQncyBvd24g
cmVzb3VyY2VzLgo+PiAKPj4+PiAtIFNNMSBzaW5nbGUgY2x1c3RlciBhbmQgRFNVOiBuZWVkcyBh
IGNwdWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cwo+Pj4+IHRhcmdldF9pbnRlcm1lZGlhdGUg
KGN1cnJlbnRseSBpdCdzIG1hbmFnZWQgb24gY2xvY2sgZHJpdmVyIHNpZGUgaW4KPj4+PiBrZXJu
ZWwgc3BhY2UsIG5vIGZpcm13YXJlIGludm9sdmVkKQo+Pj4KPj4+IENvbXBhcmVkIHdpdGggdGhl
IFNvQ3MgYWJvdmUsIHRoZSBkaWZmZXJlbmNlIGZvciBTTTEgaXMgdGhhdCBpdCBuZWVkcyB0bwo+
Pj4gYWRkaXRpb25hbGx5IG1hbmFnZSBhIERTVSBjbG9jay4gSW4gdGhpcyBjYXNlLCB0aGUgY2xv
Y2stcmVsYXRlZAo+Pj4gaGFuZGxpbmcgY2FuIGJlIGFkZGVkIGluIGRldl9wbV9vcHBfc2V0X2Nv
bmZpZygpIGluIGFtbG9naWMtY3B1ZnJlcS5jCj4+PiAoYnkgaW1wbGVtZW50aW5nIGNsa19uYW1l
cyBhbmQgY29uZmlnX2Nsa3MgaW4gc3RydWN0IGRldl9wbV9vcHBfY29uZmlnKS4KPj4gSSB0aGlu
ayBzbyBmYXIgbWFpbmxpbmUgaXMgbm90IHRvdWNoaW5nIHRoZSBEU1UgY2xvY2sgYXQgYWxsLgo+
PiAKPj4gWy4uLl0KPj4+IEFsbCBpbiBhbGwsIGl0IGxvb2tzIGxpa2Ugd2UgY2FuIGN1cnJlbnRs
eSBzdXBwb3J0IGFsbCBBbWxvZ2ljIFNvQ3MgaW4gYQo+Pj4gc2luZ2xlIGFtbG9naWMtY3B1ZnJl
cS5jPyBUaGVuLCBmb3IgdGhlIHNwZWNpZmljIGNoYXJhY3RlcmlzdGljcyBvZgo+Pj4gZGlmZmVy
ZW50IFNvQ3MsIHdlIGNhbiBkaWZmZXJlbnRpYXRlIHRoZW0gdGhyb3VnaCB0aGUgImNvbXBhdGli
bGUiCj4+PiBwcm9wZXJ0eSBhbmQgYWRkIHRoZSBjb3JyZXNwb25kaW5nIGRydmRhdGEgZm9yIGVh
Y2guCj4+Pgo+Pj4gSSdsbCBhbHNvIHRyeSB0byBzdXBwb3J0IFM3L0E5IHdpdGggcmVwcmVzZW50
YXRpdmUgZGlmZmVyZW5jZXMgYmFzZWQgb24KPj4+IHRoaXMgcGF0Y2guCj4+IEdyZWF0LCBsZXQn
cyBsb29rIGF0IHNvbWUgY29kZSByYXRoZXIgdGhhbiBkaXNjdXNzaW5nIHRoZW9yeSBvbiBob3cg
dG8KPj4gd3JpdGUgY29kZSA6LSkKPj4gCj4+IFRoZXJlJ3Mgb25lIGxhc3QgZGV0YWlsIHRoYXQg
d2UgaGF2ZSB0byBtYW5hZ2UgaW4gY2FzZSB3ZSBhbHNvIHdhbnQgdG8KPj4gaW5jbHVkZSB0aGUg
TWVzb244KiBjb2RlIGludG8gdGhlIHNhbWUgZmlsZToKPj4gY29uZmlnIE1FU09OX1NNIGRlcGVu
ZHMgb24gQVJNNjRfNEtfUEFHRVMKPj4gMzItYml0IGtlcm5lbCBidWlsZHMgY2FuJ3Qgc2F0aXNm
eSB0aGlzIChtZWFuaW5nOiB3ZSBlbmQgdXAgd2l0aAo+PiBsaW5rZXIgZXJyb3JzKS4gSSB0aGlu
ayBhIHNpbXBsZSB3YXkgdG8gZ2V0IGFyb3VuZCB0aGlzIGlzIHRvIGFkZCBzdHViCj4+IGZ1bmN0
aW9ucyB0byBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmguCj4+IEknbGwg
dGFrZSBjYXJlIG9mIHRoYXQgb25jZSBJIGNhbiBzdWJtaXQgTWVzb244IHN1cHBvcnQgcGF0Y2hl
cyBmb3IKPj4geW91ciB1cGNvbWluZyBhbWxvZ2ljLWNwdWZyZXEuYyEKPj4gCj4+IAo+PiBCZXN0
IHJlZ2FyZHMsCj4+IE1hcnRpbgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
