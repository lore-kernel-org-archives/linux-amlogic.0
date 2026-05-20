Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653A7CD4F5E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMW4CZULjGFNg3x1XZyxMli4wIn3Q6Ibtlu2M0wglOI=; b=f1X9DUiWRJUC1J
	P56hyPDmly7/TY+c5ta1lMjzbhBlmbh9GStzkK0GwAiOUik8o3FYGhKX5kmXdtdIwnqbrK+IMTXKz
	9Oryia0mHQuH3VQf76JJnkqhGUOAUuuG6ydQXJZmWjQBkzmzwnDNL/DUsOnlPzbQyn3Iw2WSaGHax
	zn7l29Sm+DvU1BpkKEmHgnXNybZl9QysL/xMzhAkaKAdCf844W5jhqKLiNlJ/V0TicebkeafatCoI
	flzFfYXRTkjgNiVUoB9nDME4Bu68nb23Izfa9WU90YUKnHGCkwHw8bH2NkXCMd7I0zeEnnLzUQ/dd
	0xrWTukrsVKOYepGxKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSv-00000003oih-2D5W;
	Wed, 20 May 2026 07:35:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSs-00000003ogW-06c2
	for linux-amlogic@lists.infradead.org;
	Wed, 20 May 2026 07:35:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso32997365e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 20 May 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779262536; x=1779867336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=bsDxUXYfRERbRgvW/LyT1b/CvcJbvl5qCDzuPEZtaGA5f7rnIzB6Na+k8bOCP5azxK
         O65otBHZzcO0+Hb1fFOxTys/3mTezn/ueagwrwjc0/yPV32pbEA12pRhKaVtp4atXsHi
         /gg3p+Exh5qNINWrz4LwdC4X9TGi8CitM0yxrZfbNtO46fZsALspWIc/Ar/OZvnge+oe
         UiG6QIbBvoKUkn/l8jCmBLnr4a65YO0emEp5T1UVLcEJ3e35Zdvxrbj2YSFPp5tn00zS
         TF6AgsSSVHYZH/4nHccS52fTfAOPorCf2IlRNzipz2dS/gryyfAbjZO0ciYPZPKFme1r
         m33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262536; x=1779867336;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=N/1OzZMivMryowzjJbYZNdJulOlf6316xet3cz3KTc01hW+jgEKi+VRn0L6I5soYI7
         Z++xY2tmiZZiq/zj8qhoenxVWkYSFR61IZHphN0Si4krtbjMYzYzZnL5nyzfDwhvCsbp
         JsAbAZhxGstVFsFbWL0AjXKVUGgS70SyM/7cwUU5poZ65A2/IpjWhfQ22WY9jSAcN9cZ
         heXhWWjUTXRUkBGzwx0h+w+t3xmwBtk0jJfQygqbJym0TvuHs3ioXZ2nHxQbFybmnxfW
         zP5zk+ywhSZDBjsahydJTe1cTtpuUDKIMdJS3k28XYFlIF5mCq5KZXNZZnxnB6w/GbQ3
         dBQw==
X-Forwarded-Encrypted: i=1; AFNElJ8MD4X/U5TmGMm7c0eLsdIww6DAtJ2nFWSiqMGPCphuAvNT9KmMUQU35fzrEkKvp8m24glk0EuHj7IErrGI@lists.infradead.org
X-Gm-Message-State: AOJu0YxwDE3Z040BvuKPpuW/j4/2cGZ0j/ahOGG8ElXsPOTWq14hkueA
	Gw7zHriiaxmQtARSggTsSNQslMHcjjx8c8wx4CrOUOUtKtu4YO2SkNDw0wpwkMphAQc=
X-Gm-Gg: Acq92OE8QYoquoi7o2r+BYRUvGXpTJumW2GxK5AqVX9MYLAKuOOfEJDJg3PHPCKjBo3
	XbY0NVFSRq3NLLJFn6yJZod2fSoNRwhmTHIPNCbUIq2vkWx6laH/u8UZQHJ1QB8m3mVx4EQT05U
	ZBknh1NZGtKVg4Tfq/4BLr70pEDvlM3CVcbRMEJ0JcO7KMPQ/du1Sx5AW7n8as3kHceVOHvdTcW
	v6wpnrO5FC1oe/1T50HZTdE2tqO9112fAbScfi9ZbPMe9MfPzKzZ3KyQ5IJQK5HdsjtjAT6vti2
	+alw4+ZDS0d/X6LVY44ABQ3ELcbDknTOx1+S883uE9kBn6149U/IWIseV4PhAWpJR4Ea9KkMAT0
	qG1CRXjXqxQw32UyETMAG9kF88d+HyYi9P3sblxPspmRG4hWqB+HW772Ci00gerPC0BrSqAEOAh
	KjZAZCBkZRggCkt1JHVYzpVw==
X-Received: by 2002:a05:600c:1384:b0:490:2238:4021 with SMTP id 5b1f17b1804b1-4902238403fmr70491165e9.8.1779262536295;
        Wed, 20 May 2026 00:35:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm52671515f8f.33.2026.05.20.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:35:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 13:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:35:34 +0200
Message-ID: <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003538_085940_CDF0681F 
X-CRM114-Status: GOOD (  18.36  )
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

T24gbWVyLiAyMCBtYWkgMjAyNiBhdCAxMzo0NywgSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNv
bT4gd3JvdGU6Cgo+IE9uIDUvMTQvMjAyNiAxMToxMSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIGx1bi4gMTEgbWFpIDIwMjYgYXQgMjA6NDcs
IEppYW4gSHUgdmlhIEI0IFJlbGF5IDxkZXZudWxsK2ppYW4uaHUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Cj4+PiBGcm9tOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+
Pj4KPj4+IFRoZSBBOSBQTEwgcHJlLWRpdmlkZXIgdXNlcyBhIGRpdmlzaW9uIGZhY3RvciBvZiAy
Xm4gdG8gZW5zdXJlIGEgY2xvY2sKPj4+IGR1dHkgY3ljbGUgb2YgNTAlIGFmdGVyIHByZWRpdmlz
aW9uLgo+Pj4KPj4+IEFkZCBmbGFnICdDTEtfTUVTT05fUExMX05fUE9XRVJfT0ZfVFdPJyB0byBp
bmRpY2F0ZSB0aGF0IHRoZSBQTEwKPj4+IHByZS1kaXZpZGVyIGRpdmlzaW9uIGZhY3RvciBpcyAy
Xm4uCj4+IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgZG9pbmcgaGVyZSBidXQgSSBoYXZlIHRv
IGFzayB3aHkgdGhpcyBjYW4ndCBiZQo+PiBpbXBsZW1lbnRlZCB3aXRoIGluZGVwZW5kZW50IGRp
dmlkZXJzIHRoYXQgYWxyZWFkeSBzdXBwb3J0cyBwb3dlciBvZiAyID8KPgo+Cj4gSWYgd2UgdXNl
IGluZGVwZW5kZW50IGRpdmlkZXJzLCB0aGUgbiBtZW1iZXIgd291bGQgaGF2ZSB0byBiZSByZW1v
dmVkIGZyb20KPiBtZXNvbl9jbGtfcGxsX2RhdGEuCj4KPiBIb3dldmVyLCBuIGlzIHJlZmVyZW5j
ZWQgMzUgdGltZXMgaW4gY2xrLXBsbC5jLCB3aGljaCBtZWFucyB3ZSB3b3VsZCBuZWVkCj4gdG8g
bW9kaWZ5IGFsbAo+IHJlbGF0ZWQgbG9naWMgYWNyb3NzIHRoZSBmaWxlLiBUaGlzIHdvdWxkIGJl
IGEgcmVsYXRpdmVseSBsYXJnZQo+IGNoYW5nZS4KClllcwoKPgo+Cj4gTW9yZW92ZXIsIGZvciBh
bGwgQW1sb2dpYyBjaGlwcywgdGhlIG4gZGl2aWRlciBpcyBhbiBpbmRpc3BlbnNhYmxlIHBhcnQg
b2YKPiB0aGUgRENPIGNsb2NrLgoKVGhlcmUgaXMgaGFyZGx5IGEganVzdGlmaWNhdGlvbiBoZXJl
Cgo+IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4gU29DIGdlbmVyYXRpb25zIGlzIGFzIGZvbGxvd3M6
Cj4gwqAgwqAgUHJldmlvdXMgU29DcyBQTEw6IG4gPSAxLCAyLCAzLCA0Li4uIChsaW5lYXIgZGl2
aWRlcikKPiDCoCDCoCBBOSBTb0MgUExMOsKgIMKgIMKgIMKgIMKgIMKgIG4gPSAyXjAsIDJeMSwg
Ml4yLCAyXjMsIDJeNC4uLiAocG93ZXItb2YtdHdvCj4gZGl2aWRlcikKClllcyB0aGF0IHdhcyBm
YWlybHkgb2J2aW91cwoKPgo+IFRoZXJlZm9yZSwgc3BsaXR0aW5nIG91dCB0aGUgbiBkaXZpZGVy
IGZyb20gdGhlIERDTyBjbG9jayBtaWdodCBub3QgYmUgYQo+IGdvb2QgZGVzaWduIGNob2ljZS4K
CkknbSBub3Qgc3VyZSBJIGFncmVlIGFuZCB5b3UndmUgb25seSBzdGF0ZWQgeW91ciBwb2ludCBv
ZiB2aWV3IHdpdGhvdXQKcHJvdmlkaW5nIGFueSB0ZWNobmljYWwganVzdGlmaWNhdGlvbiBoZXJl
LgoKRnJvbSB0aGUgZGF0YXNoZWV0cyBvZiB0aGUgZGlmZmVyZW50IFNvQyB3ZSBoYXZlLCB0aGUg
ZG9jdW1lbnRlZApsaW1pdGF0aW9uIGlzIGFsd2F5cyB0aGUgRENPIG91dHB1dCByYXRlIHJhbmdl
LiBOb3RoaW5nIHJlbGF0ZWQgdG8gbiAob3IKbSwgb3IgdGhlIG11bHQtcmFuZ2UgZm9yIHRoYXQg
bWF0dGVyKS4gVGhpcyBpcyBhIGxlZ2FjeSBwcm9ibGVtLCB3ZQpzdGFydGVkIHdpdGggbW9ub2xp
dGhpYyBkcml2ZXIgYW5kIHNsb3dseSBzaW1wbGlmaWVkIGl0LgoKQXMgZmFyIGFzIEkgY2FuIHNl
ZSBub3csIHJld29ya2luZyB0aGUgUExMIGRyaXZlciB0byBiZSBhIHNpbXBsZQptdWx0aXBsaWVy
IGRyaXZlciB3aXRoIHJhbmdlIG91dHB1dCByYXRlIGNvbnN0cmFpbnQgY291bGQgYWN0dWFsbHkg
YmUKc2ltcGxlciB0aGFuIHRoZSBjdXJyZW50IGNvZGUuIEkgd291bGQgYWxzbyBtYWtlIHNpbXBs
ZXIgdG8gYWNjb21vZGF0ZQpkaWZmZXJlbmNlcyBzdWNoIGFzIHRoZSBvbmUgcHJlc2VudGVkIGhl
cmUuCgpVbmxlc3MgeW91IGNhbiBwcm92aWRlIHRlY2huaWNhbCByZWFzb25zIHdoeSBnb2luZyBp
biB0aGlzIGRpcmVjdGlvbgp3b3VsZCBiZSBpbmNvcnJlY3QsIHRoYXQncyB3aGVyZSBJJ2QgcHJl
ZmVyIHRvIGdvLgoKPgo+IFsuLi5dCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKaWFuCgotLSAKSmVy
b21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
