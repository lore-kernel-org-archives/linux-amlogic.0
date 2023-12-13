Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCCAC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Dec 2023 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnZbKj5Xks04iQvn7avzC9YUyEevOV8gFGEzvYa9Y/E=; b=Df46U2Kif++Xgt
	o8OduTB+8R5861lpNQ8LqmCAEGQx77MY14X3up+q1lc4e0RXRVSxfI+HMQ7rxrueSk6A6ZqkbaWP+
	ekqC/vSI56Qztl59HoABd4CPAhEFP7vaOD07zOAiwS9dc0v0x6yDpXTBqgU0AdA4o5Jbmc42Nnnpe
	js/68E+JQWOpaWRM6Kb5K3DOsnOP37WErUr4TCj1IWL678gJKT31l5xCwBmIwxCBow+XpIuD58ZZN
	Fe+ZCkCE5VRXMkdnDYbjAYKiDfUoxkCDoouYYrF4+uDA6rSR9P+32OfAyn6dHXHz7/IUmi/IGff3g
	80E2BGqhzort7HTRCrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSLd-00FUut-2Q;
	Wed, 13 Dec 2023 16:44:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSLb-00FUtb-0W
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Dec 2023 16:44:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3333074512bso4420559f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Dec 2023 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702485871; x=1703090671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xr6toAXCsIC/bmSJ5B/sgzDjMz3Z0Uajw+zCN70ZLA8=;
        b=VCF1y18VM6iH8UPsnxZ59xEe4f2+XEz40am40ZNDKOSi3FOqhhNQJL9MdVxZTijhVO
         w8gDj7cAMG96yCY2ErGSXjcGRHB7Gv+fFJY6KI3wEC5Mk1wBhAIUVQEXDBRvDpNBhZX2
         VpGSgrearDcxmYwgb3JgqQbtWJzF4ea7+xX1Nhoiv6oskA1PuVXZkfvrxZQFWUeE0VAQ
         qamCZ8yxnqV5YR7bGMaG+14lkA1GGslBpn/DJPjuSXBlFDEb5pwKW2f1rqCRfKhaQS9k
         xRHxz4Rs9TPCpdqwUSjWHBWVuc2PGBF7PdDzH9OKTGWET8xLelagrM/tOb+7dDeZSmT0
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485871; x=1703090671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xr6toAXCsIC/bmSJ5B/sgzDjMz3Z0Uajw+zCN70ZLA8=;
        b=g9rhAAP+1bd224iq4uE1lq5yyzbUxkeoyusHQJ+6NmrvQMU34Ln+J+glsQm2EHYU25
         j/6NW9iApA8vVwQ53C3RzaYs6m4VbDf+YSE0jtum2ejMOqqQX2E+MsTWUDfkR0BMtobe
         FdjkHY/fV7Cor/DlN5jcB+6rRRJjJFo7ul2IwX8pmL2EAFH7lUOnxsXU0Rd6e4Su04C/
         OhttXeHr8TRWiDuYwgSBtvX7oX/IIBRs0FLeeDzSRZ3pIM1gSB2eP7s4CQ/J5bMWkC/1
         MfRsC568W8huIWcw+8qw1ONjJeKF8+cOKYNwkL+zqL0Fsfq/j5RCeNEcfKApGFvf8ytA
         wnvw==
X-Gm-Message-State: AOJu0YycXABa7wenlE8nBb/pS8lzZI/3fujrUZu8M7WcGBQk+DURKFdn
	tF6LEgGnPey6InhsXbdpVd/3zA==
X-Google-Smtp-Source: AGHT+IHmb8ewYnbRlq6v/5rMQRoMcMWRfLl01skabFTAXrcQx6eTujOz4Paqf/1jHchf7eivqMmEQQ==
X-Received: by 2002:a05:600c:2246:b0:40b:2a46:6f1 with SMTP id a6-20020a05600c224600b0040b2a4606f1mr4313509wmm.2.1702485870981;
        Wed, 13 Dec 2023 08:44:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59? ([2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm13767115wrf.107.2023.12.13.08.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 08:44:30 -0800 (PST)
Message-ID: <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
Date: Wed, 13 Dec 2023 17:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, Georgi Djakov <djakov@kernel.org>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_084435_203183_668FAEF6 
X-CRM114-Status: GOOD (  53.39  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKTGUgMTMvMTIvMjAyMyDDoCAwOTozNiwgTWF4aW1lIFJpcGFyZCBhIMOpY3Jp
dMKgOgo+IEhpLAo+IAo+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDA4OjQzOjAwQU0gKzAxMDAs
IFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+PiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAwODox
NjowNEFNICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4gT24gVHVlLCBEZWMgMTIsIDIw
MjMgYXQgMDY6MjY6MzdQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+Pj4gY2xr
X3JhdGVfZXhjbHVzaXZlX2dldCgpIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIE1vc3Qg
dXNlcnMgImtub3ciCj4+Pj4gdGhhdCBhbmQgZG9uJ3QgY2hlY2sgdGhlIHJldHVybiB2YWx1ZS4g
VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGZvdXIgdXNlcnMKPj4+PiB0aGF0IGRvIGVycm9yIGNoZWNr
aW5nIG9uIHRoZSByZXR1cm5lZCB2YWx1ZSBhbmQgdGhlbiBtYWtlcyBmdW5jdGlvbgo+Pj4+IHJl
dHVybiB2b2lkLgo+Pj4+Cj4+Pj4gR2l2ZW4gdGhhdCB0aGUgY2hhbmdlcyB0byB0aGUgZHJpdmVy
cyBhcmUgc2ltcGxlIGFuZCBzbyBtZXJnZSBjb25mbGljdHMKPj4+PiAoaWYgYW55KSBzaG91bGQg
YmUgZWFzeSB0byBoYW5kbGUsIEkgc3VnZ2VzdCB0byBtZXJnZSB0aGlzIGNvbXBsZXRlCj4+Pj4g
c2VyaWVzIHZpYSB0aGUgY2xrIHRyZWUuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayBpdCdzIHRoZSBy
aWdodCB3YXkgdG8gZ28gYWJvdXQgaXQuCj4+Pgo+Pj4gY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgp
IHNob3VsZCBiZSBleHBlY3RlZCB0byBmYWlsLiBGb3IgZXhhbXBsZSBpZgo+Pj4gdGhlcmUncyBh
bm90aGVyIHVzZXIgZ2V0dGluZyBhbiBleGNsdXNpdmUgcmF0ZSBvbiB0aGUgc2FtZSBjbG9jay4K
Pj4+Cj4+PiBJZiB3ZSdyZSBub3QgY2hlY2tpbmcgZm9yIGl0IHJpZ2h0IG5vdywgdGhlbiBpdCBz
aG91bGQgcHJvYmFibHkgYmUKPj4+IGZpeGVkLCBidXQgdGhlIGNhbGxlcnMgY2hlY2tpbmcgZm9y
IHRoZSBlcnJvciBhcmUgcmlnaHQgdG8gZG8gc28gaWYgdGhleQo+Pj4gcmVseSBvbiBhbiBleGNs
dXNpdmUgcmF0ZS4gSXQncyB0aGUgb25lcyB0aGF0IGRvbid0IHRoYXQgc2hvdWxkIGJlCj4+PiBt
b2RpZmllZC4KPj4KPj4gSWYgc29tZSBvdGhlciBjb25zdW1lciBoYXMgYWxyZWFkeSAibG9ja2Vk
IiBhIGNsb2NrIHRoYXQgSSBjYWxsCj4+IGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSBmb3IsIHRo
aXMgaXNuJ3QgYW4gZXJyb3IuIEluIG15IGJ1YmJsZSBJIGNhbGwKPj4gdGhpcyBmdW5jdGlvbiBi
ZWNhdXNlIEkgZG9uJ3Qgd2FudCB0aGUgcmF0ZSB0byBjaGFuZ2UgZS5nLiBiZWNhdXNlIEkKPj4g
c2V0dXAgc29tZSByZWdpc3RlcnMgaW4gdGhlIGNvbnN1bWluZyBkZXZpY2UgdG8gcHJvdmlkZSBh
IGZpeGVkIFVBUlQKPj4gYmF1ZCByYXRlIG9yIGkyYyBidXMgZnJlcXVlbmN5IChhbmQgdGhhdCB3
b3JrcyBhcyBleHBlY3RlZCkuCj4gCj4gSSBndWVzcyBpdCdzIGEgbGFyZ2VyIGNvbnZlcnNhdGlv
biwgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0IGNhbgo+IHBvc3NpYmx5IHdvcmsuCj4gCj4gVGhl
IHdheSB0aGUgQVBJIGlzIGRlc2lnbmVkLCB5b3UgaGF2ZSBubyBndWFyYW50ZWUgKG91dHNpZGUg
b2YKPiBjbGtfcmF0ZV9leGNsdXNpdmVfKikgdGhhdCB0aGUgcmF0ZSBpcyBnb2luZyB0byBjaGFu
Z2UuCj4gCj4gQW5kIGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSBkb2Vzbid0IGFsbG93IHRoZSBy
YXRlIHRvIGNoYW5nZSB3aGlsZSBpbgo+IHRoZSAiY3JpdGljYWwgc2VjdGlvbiIuCj4gCj4gU28g
dGhlIG9ubHkgcG9zc2libGUgdGhpbmcgdG8gZG8gaXMgY2xrX3NldF9yYXRlKCkgKwo+IGNsa19y
YXRlX2V4Y2x1c2l2ZV9nZXQoKS4KClRoZXJlJ3MgY2xrX3NldF9yYXRlX2V4Y2x1c2l2ZSgpIGZv
ciB0aGlzIHB1cnBvc2UuCgo+IAo+IFNvIHRoZXJlJ3MgYSB3aW5kb3cgd2hlcmUgdGhlIGNsb2Nr
IGNhbiBpbmRlZWQgYmUgY2hhbmdlZCwgYW5kIHRoZQo+IGNvbnN1bWVyIHRoYXQgaXMgYWJvdXQg
dG8gbG9jayBpdHMgcmF0ZSB3b3VsZG4ndCBiZSBhd2FyZSBvZiBpdC4KPiAKPiBJIGd1ZXNzIGl0
IHdvdWxkIHdvcmsgaWYgeW91IGRvbid0IGNhcmUgYWJvdXQgdGhlIHJhdGUgYXQgYWxsLCB5b3Ug
anVzdAo+IHdhbnQgdG8gbWFrZSBzdXJlIGl0IGRvZXNuJ3QgY2hhbmdlLgo+IAo+IE91dCBvZiB0
aGUgNyB1c2VycyBvZiB0aGF0IGZ1bmN0aW9uLCAzIGFyZSBpbiB0aGF0IHNpdHVhdGlvbiwgc28g
SSBndWVzcwo+IGl0J3MgZmFpci4KPiAKPiAzIGFyZSBvcGVuIHRvIHRoYXQgcmFjZSBjb25kaXRp
b24gSSBtZW50aW9uZWQgYWJvdmUuCj4gCj4gMSBpcyBjYWxsaW5nIGNsa19zZXRfcmF0ZSB3aGls
ZSBpbiB0aGUgY3JpdGljYWwgc2VjdGlvbiwgd2hpY2ggd29ya3MgaWYKPiB0aGVyZSdzIGEgc2lu
Z2xlIHVzZXIgYnV0IG5vdCBpZiB0aGVyZSdzIG11bHRpcGxlLCBzbyBpdCBzaG91bGQgYmUKPiBk
aXNjb3VyYWdlZC4KPiAKPj4gSW4gdGhpcyBjYXNlIEkgd29uJ3QgYmUgYWJsZSB0byBjaGFuZ2Ug
dGhlIHJhdGUgb2YgdGhlIGNsb2NrLCBidXQgdGhhdAo+PiBpcyBzaWduYWxsZWQgYnkgY2xrX3Nl
dF9yYXRlKCkgZmFpbGluZyAoaWZmIGFuZCB3aGVuIEkgbmVlZCBhd290aGVyCj4+IHJhdGUpIHdo
aWNoIGFsc28gc2VlbXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGZhaWwgdG8gbWUuCj4gCj4gV2hpY2gg
aXMgaWdub3JlZCBieSBsaWtlIGhhbGYgdGhlIGNhbGxlcnMsIGluY2x1ZGluZyB0aGUgb25lIG9k
ZCBjYXNlIEkKPiBtZW50aW9uZWQgYWJvdmUuCj4gCj4gQW5kIHRoYXQncyBzdXBlciBjb25mdXNp
bmcgc3RpbGw6IHlvdSBjYW4gKmFsd2F5cyogZ2V0IGV4Y2x1c2l2aXR5LCBidXQKPiBub3QgYWx3
YXlzIGRvIHdoYXRldmVyIHlvdSB3YW50IHdpdGggdGhlIHJhdGUgd2hlbiB5b3UgaGF2ZSBpdD8g
SG93IGFyZQo+IGRyaXZlcnMgc3VwcG9zZWQgdG8gcmVjb3ZlciBmcm9tIHRoYXQ/IFlvdSBjYW4g
aGFuZGxlIGZhaWxpbmcgdG8gZ2V0Cj4gZXhjbHVzaXZpdHksIGJ1dCBjZXJ0YWlubHkgbm90IHdv
cmtpbmcgYXJvdW5kIHZhcmlhYmxlIGd1YXJhbnRlZXMuCj4gCj4+IEl0J3MgbGlrZSB0aGF0IHNp
bmNlIGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSB3YXMgaW50cm9kdWNlZCBpbiAyMDE3Cj4+IChj
b21taXQgNTVlOWI4YjdiODA2ZWMzZjlhODgxN2UxMzU5NjY4MmE1OTgxYzE5YykuCj4gCj4gUmln
aHQsIGJ1dCAiaXQncyBhbHdheXMgYmVlbiB0aGF0IHdheSIgc3VyZWx5IGNhbid0IGJlIGFuIGFy
Z3VtZW50LAo+IG90aGVyd2lzZSB5b3Ugd291bGRuJ3QgaGF2ZSBkb25lIHRoYXQgc2VyaWVzIGlu
IHRoZSBmaXJzdCBwbGFjZS4KPiAKPj4gQlRXLCBJIGp1c3Qgbm90aWNlZCB0aGF0IG15IGFzc2Vy
dGlvbiAiTW9zdCB1c2VycyBcImtub3dcIiB0aGF0Cj4+IFtjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0
KCkgcmV0dXJucyB6ZXJvIHVuY29uZGl0aW9uYWxseV0iIGlzIHdyb25nLiBBcyBvZgo+PiBuZXh0
LTIwMjMxMjEzIHRoZXJlIGFyZSAzIGNhbGxlcnMgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSBv
Zgo+PiBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgYW5kIDQgdGhhdCBoYW5kbGUgKGltYWdpbmFy
eSkgcmV0dXJuZWQgZXJyb3JzLgo+PiBJIGV4cGVjdGVkIHRoaXMgZnVuY3Rpb24gdG8gYmUgdXNl
ZCBtb3JlIGV4dGVuc2l2ZWx5LiAoSW4gZmFjdCBJIHRoaW5rCj4+IGl0IHNob3VsZCBiZSB1c2Vk
IG1vcmUgYXMgc2V2ZXJhbCBkcml2ZXJzIHJlbHkgb24gdGhlIGNsayByYXRlIG5vdAo+PiBjaGFu
Z2luZy4pCj4gCj4gWWVzLCBidXQgYWxzbyBpdCdzIHN1cGVyIGRpZmZpY3VsdCB0byB1c2UgaW4g
cHJhY3RpY2UsIGFuZCBtb3N0IGRldmljZXMKPiBkb24ndCBjYXJlLgo+IAo+IFRoZSBjdXJyZW50
IHNpdHVhdGlvbiBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+ICAgICogT25seSBhIGhhbmRm
dWwgb2YgZGV2aWNlcyByZWFsbHkgY2FyZSBhYm91dCB0aGVpciBjbG9jayByYXRlLCBhbmQKPiAg
ICAgIG9mdGVuIG9ubHkgZm9yIG9uZSBvZiB0aGVpciBjbG9jayBpZiB0aGV5IGhhdmUgc2V2ZXJh
bC4gWW91IHdvdWxkCj4gICAgICBwcm9iYWJseSBnZXQgYWxsIHRoZSBkZXZpY2VzIHRoYXQgY3Jl
YXRlIGFuIGFuYWxvZyBzaWduYWwgc29tZWhvdwo+ICAgICAgdGhlcmUsIHNvIGF1ZGlvLCBkaXNw
bGF5LCBpMmMsIHNwaSwgdWFydHMsIGV0Yy4gUGx1cyB0aGUgb25lcyBkb2luZwo+ICAgICAgZnJl
cXVlbmN5IHNjYWxpbmcgc28gQ1BVIGFuZCBHUFVzLgo+IAo+ICAgICogQ1BVcyBhbmQgR1BVcyBh
cmUgdmVyeSBsaWtlbHkgdG8gaGF2ZSBhIGRlZGljYXRlZCBjbG9jaywgc28gd2UgY2FuCj4gICAg
ICBydWxlIHRoZSAiYW5vdGhlciB1c2VyIGlzIGdvaW5nIHRvIG1lc3Mgd2l0aCBteSBjbG9jayIg
Y2FzZS4KPiAKPiAgICAqIFVBUlRzL2kyYy9ldGMuIGFyZSB1c3VhbGx5IHRha2luZyB0aGVpciBj
bG9jayBmcm9tIHRoZSBidXMgaW50ZXJmYWNlCj4gICAgICBkaXJlY3RseSB3aGljaCBpcyBwcmV0
dHkgbXVjaCBuZXZlciBnb2luZyB0byBjaGFuZ2UgKGZvciBnb29kCj4gICAgICByZWFzb24pLiBB
bmQgdGhlIHJhdGUgb2YgdGhlIGJ1cyBpcyBub3QgcmVhbGx5IGxpa2VseSB0byBjaGFuZ2UuCj4g
Cj4gICAgKiBTUEkvTkFORC9NTUMgdXN1YWxseSBoYXZlIHRoZWlyIGRlZGljYXRlZCBjbG9jayB0
b28sIGFuZCB0aGUgYnVzCj4gICAgICByYXRlIGlzIG5vdCBsaWtlbHkgdG8gY2hhbmdlIGFmdGVy
IHRoZSBpbml0aWFsIHNldHVwIGVpdGhlci4KPiAKPiBTbywgdGhlIG9ubHkgYWZmZWN0ZWQgZGV2
aWNlcyBhcmUgdGhlIG9uZXMgZ2VuZXJhdGluZyBleHRlcm5hbCBzaWduYWxzLAo+IHdpdGggdGhl
IHJhdGUgY2hhbmdpbmcgZHVyaW5nIHRoZSBsaWZlIG9mIHRoZSBzeXN0ZW0uIEV2ZW4gZm9yIGF1
ZGlvIG9yCj4gdmlkZW8gZGV2aWNlcywgdGhhdCdzIGZhaXJseSB1bmxpa2VseSB0byBoYXBwZW4u
IEFuZCB5b3UgbmVlZCB0byBoYXZlCj4gbXVsdGlwbGUgZGV2aWNlcyBzaGFyaW5nIHRoZSBzYW1l
IGNsb2NrIHRyZWUgZm9yIHRoYXQgaXNzdWUgdG8gb2NjdXIsCj4gd2hpY2ggaXMgZnVydGhlciBy
ZWR1Y2luZyB0aGUgY2hhbmNlcyBpdCBoYXBwZW5zLgoKV2VsbCwgdGhhbmtzIGZvciBIVyBkZXNp
Z25lcnMsIHRoaXMgZXhpc3RzIGFuZCBzb21lIFNvQ3MgaGFzIGxlc3MgUExMcyB0aGFuCm5lZWRl
ZCwgYW5kIHRoZXkgY2FuJ3QgYmUgZGVkaWNhdGVkIGZvciBzb21lIGh3IGJsb2Nrcy4KCj4gCj4g
UmVhbGlzdGljYWxseSBzcGVha2luZywgdGhpcyBvbmx5IG9jY3VycyB3aXRoIG11bHRpLWhlYWQg
ZGlzcGxheSBvdXRwdXRzCj4gd2hlcmUgaXQncyBzb21ld2hhdCBsaWtlbHkgdG8gaGF2ZSBhbGwg
dGhlIGRpc3BsYXkgY29udHJvbGxlcnMgZmVlZGluZwo+IGZyb20gdGhlIHNhbWUgY2xvY2ssIGFu
ZCB0aGUgcG93ZXIgdXAgb2YgdGhlIHZhcmlvdXMgb3V0cHV0IGlzIGRvbmUgaW4KPiBzZXF1ZW5j
ZSB3aGljaCBjcmVhdGVzIHRoYXQgc2l0dWF0aW9uLgo+IAo+IEFuZCBldmVuIHRoZW4sIHRoZSBj
bGtfcmF0ZV9leGNsdXNpdmVfKiBpbnRlcmZhY2UgZWZmZWN0aXZlbHkgbG9ja3MgdGhlCj4gZW50
aXJlIGNsb2NrIHN1YnRyZWUgdG8gaXRzIGN1cnJlbnQgcmF0ZSwgc28gdGhlIGVmZmVjdCBvbiB0
aGUgcmVzdCBvZgo+IHRoZSBkZXZpY2VzIGNhbiBiZSBzaWduaWZpY2FudC4KPiAKPiBTby4uLiB5
ZWFoLiBFdmVuIHRob3VnaCB5b3UncmUgcmlnaHQsIGl0J3MgdHJ5aW5nIHRvIGFkZHJlc3MgYSBw
cm9ibGVtCj4gdGhhdCBpcyBzdXBlciB1bmxpa2VseSB0byBoYXBwZW4gd2l0aCBhIHByZXR0eSBi
aWcgaGFtbWVyIHRoYXQgbWlnaHQgYmUKPiB0b28gbXVjaCBmb3IgbW9zdC4gU28gaXQncyBub3Qg
cmVhbGx5IHN1cnByaXNpbmcgaXQncyBub3QgdXNlZCBtb3JlLgoKSG9uZXN0bHkgSSB0cmllZCBt
eSBiZXN0IHRvIGZpbmQgYSBzbWFydCB3YXkgdG8gc2V0IHRoZSBEU0kgY2xvY2sgdHJlZQp3aXRo
IG9ubHkgMiBlbmRwb2ludHMgb2YgdGhlIHRyZWUsIGJ1dCBDQ0Ygd2lsbCBleHBsb3JlIGFsbCBw
b3NzaWJpbGl0aWVzCmFuZCBzaW5jZSB5b3UgY2Fubm90IHNldCBjb25zdHJhaW50cywgbG9ja2lu
ZyBhIHN1Yi10cmVlIGlzIHRoZSBzbWFydGVzdAp3YXkgSSBmb3VuZC4KSW4gdGhpcyBjYXNlLCB0
aGUgUExMIGlzIGNvbW1vbiBiZXR3ZWVuIHRoZSBEU0kgY29udHJvbGxlciBhbmQgdmlkZW8gZ2Vu
ZXJhdG9yLApzbyB0byBrZWVwIHRoZSBleHBlY3RlZCBjbG9jayByYXRpbywgdGhlIHNtYXJ0IHdh
eSBpcyB0byBzZXQgdGhlIGZyZXEgb24Kb25lIHNpZGUsIGxvY2sgdGhlIHN1YnRyZWUgYW5kIHNl
dCB0aGUgcmF0ZSBvbiB0aGUgb3RoZXIgc2lkZS4KQW4gQVBJIHBlcm1pdHRpbmcgdG8gc2V0IG11
bHRpcGxlIHJhdGVzIHRvIG11bHRpcGxlIGNsb2NrcyBpbiBhIHNpbmdsZSBjYWxsCndvdWxkIGJl
IHRoZSBzb2x1dGlvbiwgYnV0IG5vdCBzdXJlIGlmIHdlIGNvdWxkIHBvc3NpYmx5IHdyaXRlIHN1
Y2ggYWxnb3JpdGhtLgoKPiAKPiBNYXhpbWUKCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
