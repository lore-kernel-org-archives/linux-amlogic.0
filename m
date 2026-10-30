Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D0606A338
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PsznwW54;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUeqAFHQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CY13hqDOLqrE8MU4HaPYQmeDjwPzUb/PYmdg1B06mF8=; b=PsznwW54aBfsZ0Oef21La9G+tp
	xceIjv1Tid9mD/ySgO8iVzab3f5cLpQvIA32oZaWbkPBzTzwIrL14fT32JhsvKUfvd1tCRK7Z5TRS
	2w7g/nHPo6gZYvlJQgVuYqZZ7bjpel+GwaT4FOgrReHSDxOYJjFQj4o0l8sH3AccnE6l89RwpvnJO
	dpG5fDlrEorLNddTudc9fwKaSboSdkDDw/5ComJRh+QtjvMIzQ1/PWCk7m5zyIVSMo+Q2swZNCAU8
	4y2cIkGQ4gFtLblGjaL/mtnmJE28krbPsO2iJvgjk7MT+3tHDWHYdHa5clAsav3lHPjBUKJKoeTPx
	eVipRuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkg7-0000000BXiK-1tDJ;
	Fri, 30 Oct 2026 11:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkg6-0000000BXhT-00mu;
	Fri, 30 Oct 2026 11:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58261438EC;
	Fri, 30 Oct 2026 11:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE601F00A18;
	Fri, 30 Oct 2026 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359305;
	bh=Ivlp40VyVn8KszTJtgCYob0RPuAFDPOsj7lo4X2gHHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUeqAFHQV6dbP0aw5HxzJN5G39aqc7eFWXNCy/m40JH1jRwjt3iAdOqRY6A3+0/F/
	 NKKYgpuLa0Rx6uOkqb9myzFhRhynrFFsnI8+3Hgv5MykQiWdQApF/Kik6pjLuFBSmI
	 2zc7M4l9V463SuPnDPejWgbmqcQowbr+a39a8F+omLtQoKloVQt8qi0YpWB6QYEU3n
	 8eD+lXsYGf2dljt5/9yEDBLqQboxzSlxJHymEmlXTFx6C1Nd0rAPyvoGrev+cTZH1I
	 pSukKz39WpDiKlMx7qA9Tkxp1/hxoMkNsYZx/lxzIy2GQ/9OwimD021NkiDV4u8bLB
	 gZc90AOO9vAuw==
Date: Fri, 30 Oct 2026 12:21:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: amlogic,meson-gx-mmc: add
 amlogic,core-phase-degrees
Message-ID: <20261030-sarcastic-sophisticated-tortoise-a7a8ea@quoll>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjA6NThQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIGNvbnRyb2xsZXIg
c2FtcGxlcyB3aXRoIGEgY29yZSBjbG9jayBwaGFzZSB0aGF0IGlzIGZpeGVkIGF0IDE4MAo+IGRl
Z3JlZXMgaW4gdGhlIGRyaXZlci4gU29tZSBib2FyZHMgbmVlZCBhbm90aGVyIHBoYXNlIHRvIHdv
cmsgYXQgaGlnaAo+IHNwZWVkOiBhbiBTRCBzbG90IG9uIGFuIFM5MDVXMiBUViBib3ggZmFpbHMg
d2l0aCBDUkMgZXJyb3JzIGF0IDUwIE1Iego+IGF0IDE4MCBkZWdyZWVzIGJ1dCB3b3JrcyByZWxp
YWJseSBhdCAyNzAgZGVncmVlcywgd2hpY2ggaXMgYWxzbyB3aGF0Cj4gdGhlIHZlbmRvciBrZXJu
ZWwgcHJvZ3JhbXMgZm9yIGl0Lgo+IAo+IEFkZCBhbiBvcHRpb25hbCBwcm9wZXJ0eSB0byBkZXNj
cmliZSB0aGUgcGhhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2
w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLWd4LW1tYy55YW1sICAgIHwgOSArKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gtbW1jLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gt
bW1jLnlhbWwKPiBpbmRleCA5NzZmMzZkZTIwOTEuLjgxMjMzNzVhNjZlMCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gt
bW1jLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2Ft
bG9naWMsbWVzb24tZ3gtbW1jLnlhbWwKPiBAQCAtNTgsNiArNTgsMTUgQEAgcHJvcGVydGllczoK
PiAgICBwb3dlci1kb21haW5zOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAgCj4gKyAgYW1sb2dpYyxj
b3JlLXBoYXNlLWRlZ3JlZXM6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzIKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBQaGFzZSBvZiB0aGUg
Y29udHJvbGxlciBjb3JlIGNsb2NrIHJlbGF0aXZlIHRvIHRoZSBjYXJkIGNsb2NrLiBTb21lCj4g
KyAgICAgIGJvYXJkcyBvbmx5IHNhbXBsZSByZWxpYWJseSBhdCBoaWdoIHNwZWVkIHdpdGggYSBw
aGFzZSBvdGhlciB0aGFuCj4gKyAgICAgIHRoZSBkZWZhdWx0Lgo+ICsgICAgZW51bTogWzAsIDkw
LCAxODAsIDI3MF0KPiArICAgIGRlZmF1bHQ6IDE4MAoKSXMgdGhpcyB0aGUgc2FtZSBhcyBjbGst
cGhhc2UtIHByb3BlcnRpZXMgZnJvbSBtbWMgc2NoZW1hPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
