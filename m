Return-Path: <SRS0=7v4i=DN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CA3C4363D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 13:45:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2524C20782
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 13:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XsCBzeuW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tdFbbEab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2524C20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W9l4qdAz4LfOY4Po3ofAP2lQxjhKI2GtRESBJ11Uau8=; b=XsCBzeuW5LQj3Tm2VxcfGN6Ct
	F5UAvcRMZfuoo1TqDssyfPSQ0Hn2tmBQx7rF2w9+rXrb6324fBsLGA+PpJHANeXYfG4tZFSJgrHAp
	NL7Qd2urGh1dZKVLTZV/VA5EMZeT3sMrrrN4RPRJ1nc9/N6XNIpCEt54iRdB0KrmdZtF1cWbPI8wu
	WsAym7dSgRjCpHfJHRwGHAPXsXmUSdfqX+chwBkS6Rr03MfGXnbfFnJnAvvkkq8VH+EfqkREoWvXh
	379FwY6AoePC2ttEYhm3S9SgjHFV88QmX8wijWTzmWGG3A8GLM07tZlK6ua7e9hrF5y0xKw0yVIQp
	kFXT7MYHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPnHa-0001bB-1X; Tue, 06 Oct 2020 13:45:34 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPnHX-0001aC-FG
 for linux-amlogic@lists.infradead.org; Tue, 06 Oct 2020 13:45:32 +0000
Received: by mail-pf1-x443.google.com with SMTP id w21so9050675pfc.7
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5tbBktaYCveUyqUKP7C5+yx8eshWk6kNr6MFBtqaYs0=;
 b=tdFbbEab7P6ctnOCztAANhuNGfm0C/s+XpQayT+qel735y0nuTSQeZEui67TMEJKO5
 T1qaKdEgNKghpD6QPcfuqQxD9wJomEOMw6TIcsjv1cJasXB5IxHYbFA2Ee8aMWFTjJ5H
 k4QNJ2puGJPlj7rqNBI90PSx0qvHIl2R7QHn7sZG8WX0g83Nd7dRtzpsmDLFiYBI2olt
 DhmLNuHtiKwF8jOru8FkRFegFa8XtfNYrxyHHxDxuLIQBpiGUdpq3IILRshj4fvDEmOV
 8C0dOPV/bfkWx+6l205vAv0pG06xIg8FjgoU9WKBsb77UJEOGVNdFEbFaA0SrORVWgMd
 9uYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5tbBktaYCveUyqUKP7C5+yx8eshWk6kNr6MFBtqaYs0=;
 b=B42wsfykcat5XO3iD4Dn1oo4a3r8XGkCdv4r/PYG0PS2jJA2pXMY9N3vY6sv08kQpp
 lBXZCLUOWRxjfY9zLk2DLQzOuKpsGaeW631fZscQDcNAXPs7K7iLvcS+Jm+n1UFSjbzO
 AOCfcZWJ7Tu8NJA7f48KY1blyoEYJjFTB1u0djevPnDMtROPWLT/iH6hHCjDYgkc2and
 vPNV935wnObg/hYeaHh0+QhLGPxCD/4N/MS5stV++51O0eSWpJvYqH4BsCvyR3C96J7Q
 BAzQAF+Dnxyn5r2GIp/Du/siOStKTOBR09sdCA9uE6gW034Z7LdZ3PC/9hrJIdsjsAW5
 GEMw==
X-Gm-Message-State: AOAM532Cm6FNhS5sGPdXAgBPVMfBHGb64udtOs4YjK2YsiWAPS8+k+dc
 3hsQXN6rZ1GftT6J1YDuGSg=
X-Google-Smtp-Source: ABdhPJy8NH8Q6FBcZVTf/neYX6uRWoUFtx1mZx7iecYevo8Bf//iUTH5fR7Nsg1WtwWkexNTbJW4ug==
X-Received: by 2002:aa7:8dc7:0:b029:151:2237:52c5 with SMTP id
 j7-20020aa78dc70000b0290151223752c5mr4649146pfr.32.1601991927399; 
 Tue, 06 Oct 2020 06:45:27 -0700 (PDT)
Received: from ?IPv6:2402:b801:2840:8200:a50f:f34d:264:5cdf?
 ([2402:b801:2840:8200:a50f:f34d:264:5cdf])
 by smtp.gmail.com with ESMTPSA id h12sm3703548pfo.68.2020.10.06.06.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 06:45:26 -0700 (PDT)
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
To: Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>
References: <20201002164915.938217-1-jbrunet@baylibre.com>
 <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
 <87wo052grp.fsf@nanos.tec.linutronix.de>
 <87v9fn7ce2.fsf@nanos.tec.linutronix.de>
From: Brad Harper <bjharper@gmail.com>
Message-ID: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
Date: Wed, 7 Oct 2020 00:45:20 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87v9fn7ce2.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_094531_516041_A32430AC 
X-CRM114-Status: GOOD (  27.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSdtIGhhcHB5IHRvIHRlc3QgYW55dGhpbmcgb24gYSByYW5nZSBvZiBhbWxvZ2ljIGhhcmR3YXJl
IHdpdGggc3RhbmRhcmQgCi8gcnQgYW5kwqAgbXVsdGlwbGUgbW1jIGRldmljZXMuwqAgSWxsIHRl
c3QgSmVyb21lJ3MgcGF0Y2ggaW4gbmV4dCAyNCAKaG91cnMgdG8gcmVwb3J0IHRoZSByZXN1bHRz
LgoKT24gNi8xMC8yMDIwIDExOjQzIHBtLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gTW9u
LCBPY3QgMDUgMjAyMCBhdCAxMDo1NSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBPbiBNb24s
IE9jdCAwNSAyMDIwIGF0IDEwOjIyLCBVbGYgSGFuc3NvbiB3cm90ZToKPj4+IE9uIEZyaSwgMiBP
Y3QgMjAyMCBhdCAxODo0OSwgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdy
b3RlOgo+Pj4+IElSUUZfT05FU0hPVCB3YXMgYWRkZWQgdG8gdGhpcyBkcml2ZXIgdG8gbWFrZSBz
dXJlIHRoZSBpcnEgd2FzIG5vdCBlbmFibGVkCj4+Pj4gYWdhaW4gdW50aWwgdGhlIHRocmVhZCBw
YXJ0IG9mIHRoZSBpcnEgaGFkIGZpbmlzaGVkIGRvaW5nIGl0cyBqb2IuCj4+Pj4KPj4+PiBEb2lu
ZyBzbyB1cHNldHMgUlQgYmVjYXVzZSwgdW5kZXIgUlQsIHRoZSBoYXJkaXJxIHBhcnQgb2YgdGhl
IGlycSBoYW5kbGVyCj4+Pj4gaXMgbm90IG1pZ3JhdGVkIHRvIGEgdGhyZWFkIGlmIHRoZSBpcnEg
aXMgY2xhaW1lZCB3aXRoIElSUUZfT05FU0hPVC4KPj4+PiBJbiB0aGlzIGNhc2UsIGl0IGhhcyBi
ZWVuIHJlcG9ydGVkIHRvIGV2ZW50dWFsbHkgdHJpZ2dlciBhIGRlYWRsb2NrIHdpdGgKPj4+PiB0
aGUgbGVkIHN1YnN5c3RlbS4KPj4+Pgo+Pj4+IFByZXZlbnRpbmcgUlQgZnJvbSBkb2luZyB0aGlz
IG1pZ3JhdGlvbiB3YXMgY2VydGFpbmx5IG5vdCB0aGUgaW50ZW50LCB0aGUKPj4+PiBkZXNjcmlw
dGlvbiBvZiBJUlFGX09ORVNIT1QgZG9lcyBub3QgcmVhbGx5IHJlZmxlY3QgdGhpcyBjb25zdHJh
aW50Ogo+Pj4+Cj4+Pj4gICA+IElSUUZfT05FU0hPVCAtIEludGVycnVwdCBpcyBub3QgcmVlbmFi
bGVkIGFmdGVyIHRoZSBoYXJkaXJxIGhhbmRsZXIgZmluaXNoZWQuCj4+Pj4gICA+ICAgICAgICAg
ICAgICBVc2VkIGJ5IHRocmVhZGVkIGludGVycnVwdHMgd2hpY2ggbmVlZCB0byBrZWVwIHRoZQo+
Pj4+ICAgPiAgICAgICAgICAgICAgaXJxIGxpbmUgZGlzYWJsZWQgdW50aWwgdGhlIHRocmVhZGVk
IGhhbmRsZXIgaGFzIGJlZW4gcnVuLgo+Pj4+Cj4+Pj4gVGhpcyBpcyBleGFjdGx5IHdoYXQgdGhp
cyBkcml2ZXIgd2FzIHRyeWluZyB0byBhY2hlaXZlIHNvIEknbSBzdGlsbCBhIGJpdAo+Pj4+IGNv
bmZ1c2VkIHdoZXRoZXIgdGhpcyBpcyBhIGRyaXZlciBvciBhbiBSVCBpc3N1ZS4KPj4+Pgo+Pj4+
IEFueXdheSwgdGhpcyBjYW4gYmUgc29sdmVkIGRyaXZlciBzaWRlIGJ5IG1hbnVhbGx5IGRpc2Fi
bGluZyB0aGUgSVJRcwo+Pj4+IGluc3RlYWQgb2YgdGhlIHJlbHlpbmcgb24gdGhlIElSUUZfT05F
U0hPVC4gSVJRRl9PTkVTSE9UIG1heSB0aGVuIGJlIHJlbW92ZWQKPj4+PiB3aGlsZSBzdGlsbCBt
YWtpbmcgc3VyZSB0aGUgaXJxIHdvbid0IHRyaWdnZXIgdW50aWwgdGhlIHRocmVhZGVkIHBhcnQg
b2YKPj4+PiB0aGUgaGFuZGxlciBpcyBkb25lLgo+Pj4gVGhvbWFzLCBtYXkgSSBoYXZlIHlvdXIg
b3BpbmlvbiBvbiB0aGlzIG9uZS4KPj4+Cj4+PiBJIGhhdmUgbm8gcHJvYmxlbSB0byBhcHBseSAk
c3ViamVjdCBwYXRjaCwgYnV0IGFzIEplcm9tZSBhbHNvCj4+PiBoaWdobGlnaHRzIGFib3ZlIC0g
dGhpcyBraW5kIG9mIG1ha2VzIG1lIHdvbmRlciBpZiB0aGlzIGlzIGFuIFJUCj4+PiBpc3N1ZSwg
dGhhdCBwZXJoYXBzIGRlc2VydmVzIHRvIGJlIHNvbHZlZCBpbiBhIGdlbmVyaWMgd2F5Lgo+Pj4K
Pj4+IFdoYXQgZG8geW91IHRoaW5rPwo+PiBMZXQgbWUgc3RhcmUgYXQgdGhlIGNvcmUgY29kZS4g
U29tZXRoaW5nIHNtZWxscyBmaXNoeS4KPiBUaGUgcG9pbnQgaXMgdGhhdCBmb3IgdGhyZWFkZWQg
aW50ZXJydXB0cyAod2l0aG91dCBhIHByaW1hcnkgaGFuZGxlcikKPiB0aGUgY29yZSBuZWVkcyB0
byBiZSB0b2xkIHRoYXQgdGhlIGludGVycnVwdCBsaW5lIHNob3VsZCBiZSBtYXNrZWQgdW50aWwK
PiB0aGUgdGhyZWFkZWQgaGFuZGxlciBmaW5pc2hlZC4gVGhhdCdzIHdoYXQgSVJRRl9PTkVTSE9U
IGlzIGZvci4KPgo+IEZvciBpbnRlcnJ1cHRzIHdoaWNoIGhhdmUgYm90aCBhIHByaW1hcnkgYW5k
IGEgdGhyZWFkZWQgaGFuZGxlciB0aGF0J3MgYQo+IGRpZmZlcmVudCBzdG9yeS4gVGhlIHByaW1h
cnkgaGFuZGxlciBkZWNpZGVzIHdoZXRoZXIgdGhlIHRocmVhZCBzaG91bGQKPiBiZSB3b2tlbiBh
bmQgaXQgZGVjaWRlcyB3aGV0aGVyIHRvIGJsb2NrIGZ1cnRoZXIgaW50ZXJydXB0IGRlbGl2ZXJ5
IGluCj4gdGhlIGRldmljZSBvciBrZWVwIGl0IGVuYWJsZWQuCj4KPiBXaGVuIGZvcmNlZCBpbnRl
cnJ1cHQgdGhyZWFkaW5nIGlzIGVuYWJsZWQgKGV2ZW4gaW5kZXBlbmRlbnQgb2YgUlQpIHRoZW4K
PiB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgY2FzZXM6Cj4KPiAgICAxKSBSZWd1bGFyIGRldmljZSBp
bnRlcnJ1cHQgKHByaW1hcnkgaGFuZGxlciBvbmx5KQo+Cj4gICAgICAgVGhlIHByaW1hcnkgaGFu
ZGxlciBpcyByZXBsYWNlZCB3aXRoIHRoZSBkZWZhdWx0ICd3YWtlIHVwIHRocmVhZCcKPiAgICAg
ICBoYW5kbGVyIGFuZCB0aGUgb3JpZ2luYWwgcHJpbWFyeSBoYW5kbGVyIGJlY29tZXMgdGhlIHRo
cmVhZGVkCj4gICAgICAgaGFuZGxlci4gVGhpcyBlbmZvcmNlcyBJUlFGX09ORVNIT1Qgc28gdGhh
dCB0aGUgaW50ZXJ1cHQgbGluZSAoZm9yCj4gICAgICAgbGV2ZWwgaW50ZXJydXB0cykgc3RheXMg
bWFza2VkIHVudGlsIHRoZSB0aHJlYWQgY29tcGxldGVkIGhhbmRsaW5nLgo+Cj4gICAgMikgVGhy
ZWFkZWQgaW50ZXJydXB0cwo+Cj4gICAgICAgSW50ZXJydXB0cyB3aGljaCBoYXZlIGJlZW4gcmVx
dWVzdGVkIGFzIHRocmVhZGVkIGhhbmRsZXIgKG5vCj4gICAgICAgcHJpbWFyeSBoYW5kbGVyKSBh
cmUgbm90IGNoYW5nZWQgb2J2aW91bHN5Cj4KPiAgICAzKSBJbnRlcnJ1cHRzIHdoaWNoIGhhdmUg
Ym90aCBhIHByaW1hcnkgYW5kIGEgdGhyZWFkIGhhbmRsZXIKPgo+ICAgICAgIEhlcmUgSVJRRl9P
TkVTSE9UIGRlY2lkZXMgd2hldGhlciB0aGUgcHJpbWFyeSBoYW5kbGVyIHdpbGwgYmUKPiAgICAg
ICBmb3JjZWQgdGhyZWFkZWQgb3Igbm90Lgo+Cj4gICAgICAgVGhhdCdzIGEgYml0IHVuZm9ydHVu
YXRlIGFuZCBpbGwgZGVmaW5lZCBhbmQgd2FzIG5vdCBpbnRlbmRlZCB0byBiZQo+ICAgICAgIHVz
ZWQgdGhhdCB3YXkuCj4KPiAgICAgICBXZSByYXRoZXIgc2hvdWxkIG1ha2UgaW50ZXJydXB0cyB3
aGljaCBuZWVkIHRvIGhhdmUgdGhlaXIgcHJpbWFyeQo+ICAgICAgIGhhbmRsZXIgaW4gaGFyZCBp
bnRlcnJ1cHQgY29udGV4dCB0byBzZXQgSVJRRl9OT19USFJFQUQuIFRoYXQKPiAgICAgICBzaG91
bGQgYXQgdGhlIHNhbWUgdGltZSBjb25maXJtIHRoYXQgdGhlIHByaW1hcnkgaGFuZGxlciBpcyBS
VAo+ICAgICAgIHNhZmUuCj4KPiAgICAgICBMZXQgbWUgc3RhcmUgYXQgdGhlIGNvcmUgY29kZSBh
bmQgdGhlIGFjdHVhbCB1c2FnZSBzaXRlcyBzb21lIG1vcmUuCj4KPiBUaGFua3MsCj4KPiAgICAg
ICAgICB0Z2x4Cj4KPgo+Cj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
