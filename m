Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500F0C88E59
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Sep 2026 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fnvD7hVxTp02nGhjXaRKyX/eU/qtWyKyoYhfOOS6cA=; b=yFbm3tVgQBVGFL
	Dq//OF/GNPR7vtvgyapMqj4aD3z+ByXLV3P5aZtMu2ZriSj3gIiXz5nWE7oZ/QJhZNTCIuJ2N3eeg
	nQYccPgVsXPNxwiky/Q2kfo83JcYQppmbgkOqHcUgbOSSHzWrna1e/oD/8IDTd/6/T2MCRKQjso8S
	EewHGXzXINDDMDGrD42HaBg1SkccJ+3/MmWNjrTzG+KOA1+MX1qNs/jSvpdQEaWqpca+84O4hss/G
	cijItqhc03vuiMzRXhteUrHrF7uw6Z65/tcH3nBY1vlQZWRcekhRWY+JSkz811lIb8AB3U2MCb3dX
	uZ+o5Zb4551/zVvle94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Q0Q-0000000109N-1amI;
	Sat, 12 Sep 2026 15:51:06 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Q0M-0000000108U-3aCb
	for linux-amlogic@lists.infradead.org;
	Sat, 12 Sep 2026 15:51:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b965f447cso4105085e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 12 Sep 2026 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789228260; x=1789833060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=Ye8imBPF7KukpRyQUqshoKAZoBN/sTUc42/MPybMIV6km7fNrcvapPXRsBrk85l3KK
         2uFqnbm/zgxSXHPMElxUcVmIVf5FiAp7TrrerrG6AgEKJoGnLr1y+nj3inA11Tzr4TH7
         gC8Cmu7NkKhcn1SLg3nQ9dpaAoM46Z4z8mIEaohSic1qmU1XoXs9F/wrmyP5hZahPF4v
         xnZ4QNAYTyat8oIQ26tmHX5eMbhLEbdhkoM6moNsJgdOEiKHK8IGst5d5w+uEzZ2A26H
         SWBswE91cB10JszkWJr3Vgivj+CPUEtTUffWnOTc8sVgin38rS7nLsXSVx/MH3qacgE2
         SyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228260; x=1789833060;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=IK5jfeBCNKlU5V6qbHTpzUZI+T/9zSguocWOEXrlL98rZvDMPr5d2Mj8nRHxOL4bPc
         PnhSnesnzk5OjoFoU+GNxtV6U3zKAjy8BSk2I/S4sJD5P4L8KajbC9SrJqmEZjPZMWcm
         lTKXloJOJYGC+cL5FyzlKtu1ALuE1csNvTUJ7zQpLlzH1lGthLyGO5tI0vMRQOVVg75O
         7tCVaE5Wl/4YUf2GHEXEYg5qx5a49kIzwMs8mzJEwiuzy7JbjKzYhv/UjBoxI3TzV9dS
         VTweFkdjF97qnL7bW/wLQmHQqAve4Ph4MNwQWJXHnZkRLqQVs5oMRI+edzcEPu3zc60P
         V9Lw==
X-Forwarded-Encrypted: i=1; AKwUvByKN+y/88jpX1NGIKvEPfZv8AEedvweDrDSiuD35CTtxvoYmajhPuNLB79ZHP9L7+PX+9i6iFKDv12FUtK7@lists.infradead.org
X-Gm-Message-State: AFuF++lSBuLWEyzR5LEzEzfy7hhvY9c3vVpEZuPfU+Mjd1JapA6sJdRI
	h1KAt6I8eGvjNrbPg7RqcJMSeS9POlpJL77m6SS8vU5tAz31COLHGra8vAnKYP1TItw=
X-Gm-Gg: AYBFou34AZqh4pe/6jdqmYG9nF15VNV1FBSzN8NdILyCtXdn3NrCiP/QphwCxHCSniH
	+fSmcWrcn7c4rE0elcJdbMemSAOGeeV4Z8jZJ3Bq0aFYbNyqgbU13o5KwBhgOgFI9L1h/SXmJo9
	fHbmlehiDoIh3bFQDQcCieHUUqGxwN+us+Q8nac9B9AjlMIciXG/76OC94wtvz3W+E1qQwKsFj/
	GJNtIJDoiSetFO6kXtXPQ5bntnTj0rg7oofI0Q9BQ9cG/VIJbnhIznWdhV+lWNpibPu/kzFSr7B
	zbwtDBLUAeTYZtYo2zvzeFr+Gjq52Q9tK9ehrbVZeEXw7VIStxCwuFeWqB2E8hOIvZRpRdIokC3
	4VRmyd9JRrRQbivYnQQvWuJstjFRzwUE7At4bSUOVbSdFQLc98/Ba1+DTxEypp1u2bCxi8SkilR
	ql/FBWidkEtRXelMDKWwsQayaDCxG+bpj27mi+wQjq4NEBmvPT3XoCck2OtoVpAvdXr41EUmpU/
	6Z9lbQ2DiEpwhsgG5r2UeJRAO/v
X-Received: by 2002:a05:600c:8b8b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49e6cbfeee9mr26096875e9.20.1789228260689;
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm154001915e9.15.2026.09.12.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
In-Reply-To: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com> <aqSX-kUvYaixESxe@redhat.com>
 <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Date: Sat, 12 Sep 2026 17:50:55 +0200
Message-ID: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_085102_926629_FBFDDA94 
X-CRM114-Status: GOOD (  23.14  )
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

T24gc2FtLiAxMiBzZXB0LiAyMDI2IGF0IDA4OjUwLCBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51
eC5jb20+IHdyb3RlOgoKPiBPbiBTYXQsIFNlcCAxMiwgMjAyNiBhdCAxOjA44oCvQU0gQnJpYW4g
TWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBMdWNhcywKPj4KPj4g
T24gU2F0LCBTZXAgMDUsIDIwMjYgYXQgMDQ6MzI6MzRQTSArMDEwMCwgTHVjYXMgVGFudXJlIHdy
b3RlOgo+PiA+IHN5c19hbXBpcGVfbmFuZCBjbG9ja3MgdGhlIHBpcGVsaW5lIHN0YWdlIGluc2Vy
dGVkIGluIHRoZSBidXMgcGF0aAo+PiA+IGJldHdlZW4gdGhlIFNEL2VNTUMgY29udHJvbGxlcnMg
YW5kIHRoZSBOSUNfTUFUUklYIGZhYnJpYy4gSXQgZG9lcyBoYXZlCj4+ID4gaWRlbnRpZmlhYmxl
IGNvbnN1bWVycyAtIHRoZSB0aHJlZSBNTUMgY29udHJvbGxlcnMgLSBzbyBtYXJraW5nIGl0Cj4+
ID4gY3JpdGljYWwgd2FzIHRoZSB3cm9uZyB0b29sOiB0aGUgY2xvY2sgc2hvdWxkIGJlIHJlZmVy
ZW5jZWQgZnJvbSB0aGUKPj4gPiBjb25zdW1lciBub2RlcyBhbmQgY2xhaW1lZCBieSB0aGUgbW1j
IGRyaXZlciBpbnN0ZWFkLgo+PiA+Cj4+ID4gRHJvcCB0aGUgQ0xLX0lTX0NSSVRJQ0FMIGZsYWcg
YW5kIHVwZGF0ZSB0aGUgY29tbWVudCBhY2NvcmRpbmdseS4KPj4gPiBzeXNfYW0yYXhpMC4uMiBy
ZW1haW4gY3JpdGljYWwgYXMgdGhleSBjbG9jayB0aGUgQVhJIERNQSBidXMgaXRzZWxmIGFuZAo+
PiA+IGhhdmUgbm8gc2luZ2xlIGlkZW50aWZpYWJsZSBjb25zdW1lci4KPj4gPgo+PiA+IEFzc2lz
dGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLWZhYmxlLTUKPj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBU
YW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4+ID4gLS0tCj4+ID4gVGhpcyBwYXRjaCBkZXBlbmRz
IG9uIHRoZSBNTUMgY29udHJvbGxlcnMgYWN0dWFsbHkgcmVmZXJlbmNpbmcgdGhlIGNsb2NrOgo+
PiA+IHRoZSBkdC1iaW5kaW5ncywgbW1jIGRyaXZlciBhbmQgdDcgRFRTIGNoYW5nZXMgYWRkaW5n
IHRoZSAicGlwZWxpbmUiCj4+ID4gY2xvY2sgbXVzdCBsYW5kIGJlZm9yZSB0aGlzIHBhdGNoLCBv
dGhlcndpc2UgdGhlIGJvb3QgaGFuZ3MgYW5kIG1lbW9yeQo+PiA+IGNvcnJ1cHRpb24gdGhpcyBj
bG9jayBjYXVzZWQgYXJlIHJlaW50cm9kdWNlZC4KPj4KPj4gVGhpcyBzZXJpZXMgc2hvdWxkIGJl
IG1lcmdlZCB0b2dldGhlciBpbiBvbmUgdHJlZT8gV2hpY2ggdHJlZT8gSSBjYW4KPj4gcHJvdmlk
ZSBhbiBBY2tlZC1ieSBpZiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgbW1jIHRyZWUuCj4+Cj4+
IEJyaWFuCj4+Cj4gSXQncyBkZWZpbml0ZWx5IGJlc3QgdG8ga2VlcCB0aGUgc2VyaWVzIHRvZ2V0
aGVyIGluIG9uZSB0cmVlIHRvIGF2b2lkCj4gYm9vdCByZWdyZXNzaW9ucywKPiBidXQgSSB0aGlu
ayB0aGUgY2xrIHRyZWUgaXMgdGhlIGJldHRlciBmaXQgc2luY2UgdGhlIGNvcmUgY2hhbmdlcwo+
IHJldm9sdmUgYXJvdW5kIGNsb2NrIGxvZ2ljLgo+IENvdWxkIHlvdSBhY2NlcHQgaXQgPwoKTm8u
IFRoaXMgYXBwbGllcyBvbiB0b3Agb2YgYW5vdGhlciBjaGFuZ2UgYWxyZWFkeSBxdWV1ZWQgaW4g
dGhlIGFtbG9naWMKY2xvY2sgdHJlZS4gSXQgY2FuJ3QgZ28gdGhyb3VnaCB0aGUgTU1DIHRyZWUg
YXQgdGhlIG1vbWVudC4KClRoaXMgY2xvY2sgaXMgbm90IGNyaXRpY2FsIGluIG1haW5saW5lIHJp
Z2h0IG5vdywgc28KMSkgSSBjb3VsZCBtZXJnZSB0aGlzIGFuZCBpdCBhbmQgaW4gcHJhY3RpY2Ug
dGhlcmUgd291bGQgYmUgbm8KICAgcmVncmVzc2lvbi4gVGhlIHByb2JsZW0geW91IGhhZCB3b3Vs
ZCBzdGlsbCBiZSB0aGVyZSB1bnRpbCB0aGUgTU1DCiAgIGNoYW5nZSBsYW5kcwoKMikgT3IgeW91
IGNhbiB3YWl0IGZvciB0aGUgTU1DIHN0dWZmIHRvIGxhbmQgYW5kIHJlLXN1Ym1pdCB0aGlzIGlu
CiAgIHRoZSBuZXh0IGN5Y2xlLgoKWW91ciBjaG9pY2UuIElNTywgKDEpIGlzIGZpbmUuCgo+Cj4g
dGhhbmtzCj4gbHVjYXMKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
