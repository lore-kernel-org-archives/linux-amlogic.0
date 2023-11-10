Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E6AC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 06:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpOvzXxGA+a6HADTQU4lv9ulX2ccP0UkramVOytzQqM=; b=f2KDCUwYLl9Q8E
	s1OU7bsp8qMCDS+bKWeYIs/JnvG9ouvEFQslMHYBUHIUOtrZF9esV0Neljl30HfxOEvPyv3B04LQT
	QO09GP4BMRyu9gW15buYgFmar8PSkbJge7tjBeHJb5kmGniMjZ1KpRJDnNtgl/opjbtzjuVcjtdfe
	vSQJTLA+bI/F4bp23PAHvp9zpy8ZQ9vStoIpznAqAaWeVZimX/b9c/QvUlqzDVIXPFdLOH4y8KwQH
	cPWiQjX9wwe0uHWNQI+aKTBlRD3KBEZkZl3ldRdvaPY1HQalHrCB7qhxUxYKnbv7LWWOC9U8Z4m3O
	0UCHl12x554Zy3tqsAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KZ3-007vJp-2W;
	Fri, 10 Nov 2023 06:00:21 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KYz-007vIm-2b;
	Fri, 10 Nov 2023 06:00:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C23515675E;
	Fri, 10 Nov 2023 06:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1699596008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pGAPimGotaSJcRtKrDnmSbjkSfOKuNnfaSzdhYkcmXo=;
	b=g1QU7QP1VD0oscW8sjske7Ntfl7CbqIKOn2vcAlWA7LvoLMyKLBWvFM78k60qh24GHqB6z
	xDYhNMyfSIQNLZTYhtWgffN1s5eXTUXft9oQaqoiF/fa0PBzGfv7P5VdkaxDbpXPmRWH7F
	XFhLYYaB6djHz19uz9nGKwJ4PTz6ofeimGtx0/Qi3i0s0UTFD2PN8Tl1MqJtGW/W1u1f0h
	zl983JV/CU/QvPATxM18yZp2hMoXRcMBbjHevmOpq7SxYLTqIeO7XHDZaNaBkpntoMNaY1
	CSpFzdnKyldZZJPAOgo5grDfxTWvp+zqqY7SnT+UDrrUgF8CQnFzST+zSIxUbA==
Message-ID: <d12f0909623088f1f66ab57b1868dee2e0fb6387.camel@lexina.in>
Subject: Re: [PATCH] firmware: meson-sm: change sprintf to scnprintf
From: Viacheslav Bocharov <adeep@lexina.in>
To: David Laight <David.Laight@ACULAB.COM>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Fri, 10 Nov 2023 09:00:06 +0300
In-Reply-To: <bd3a9ca738444c99855c6aabe318e351@AcuMS.aculab.com>
References: <20231109085029.2079176-1-adeep@lexina.in>
	 <bd3a9ca738444c99855c6aabe318e351@AcuMS.aculab.com>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_220018_483140_22BF0E6D 
X-CRM114-Status: GOOD (  17.79  )
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

SGkhCgpPbiBUaHUsIDIwMjMtMTEtMDkgYXQgMTc6NTkgKzAwMDAsIERhdmlkIExhaWdodCB3cm90
ZToKPiBGcm9tOiBWaWFjaGVzbGF2IEJvY2hhcm92Cj4gPiBTZW50OiAwOSBOb3ZlbWJlciAyMDIz
IDA4OjUwCj4gPiAKPiA+IFVwZGF0ZSBzcHJpbnRmIGluIHNlcmlhbF9zaG93IGZydW5jdGlvbiB0
byBzY25wcmludGYgY29tbWFuZCB0bwo+ID4gcHJldmVudCBzeXNmcyBidWZmZXIgb3ZlcmZsb3cg
KGJ1ZmZlciBhbHdheXMgaXMgUEFHRV9TSVpFIGJ5dGVzKS4KPiAKPiBJc24ndCB0aGUgY29ycmVj
dCBmdW5jdGlvbiBzeXNmc19lbWl0KCkgPwpHb29kIGNhdGNoLiBUaGVyZSdzIGFsd2F5cyBzb21l
dGhpbmcgbmV3IHRvIGZpbmQpCgoKCj4gSW4gYW55IGNhc2UgdGhhdCBwYXJ0aWN1bGFyIGV4YW1w
bGUgY2FuJ3QgcG9zc2libHkgb3ZlcmZsb3cuClByYWN0aWNhbGx5IGluIHRoaXMgZXhhbXBsZSwg
SSBhZ3JlZS4gQnV0IG5ldmVydGhlbGVzcywgaWRlb2xvZ2ljYWxseSzCoAphIHBvaW50ZXIgdG8g
dGhlIGJ1ZmZlciBpcyBwYXNzZWQgdG8gdGhlIGZ1bmN0aW9uLCBidXQgaXRzIHNpemUgaXMgbm90
wqAKcGFzc2VkLiBUaGlzIG1heSBjYXVzZSBhbiBvdmVyZmxvdyBlcnJvciB3aGVuIG1ha2luZyBj
aGFuZ2VzIGluIHRoZcKgCmNvZGUuwqBZZXMsIHRoZSBsZW5ndGhzIG9mICUxMnBoTiBhbmQgUEFH
RV9TSVpFIGFyZSB2ZXJ5IGRpZmZlcmVudCBhdMKgCnRoZSBtb21lbnQuwqBCdXQgd2hhdCBoYXBw
ZW5zIGlmIGJvdGggb2YgdGhlc2UgbnVtYmVycyBjaGFuZ2XCoAp1bnByZWRpY3RhYmx5IGluIGZ1
dHVyZSBjaGFuZ2VzPwoKCj4gCURhdmlkCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpYWNo
ZXNsYXYgQm9jaGFyb3YgPGFkZWVwQGxleGluYS5pbj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZmly
bXdhcmUvbWVzb24vbWVzb25fc20uYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmly
bXdhcmUvbWVzb24vbWVzb25fc20uYyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
Ywo+ID4gaW5kZXggZWQ2MGYxMTAzMDUzLi5jMWM2OTRiNDg1ZWUgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdh
cmUvbWVzb24vbWVzb25fc20uYwo+ID4gQEAgLTI2NSw3ICsyNjUsNyBAQCBzdGF0aWMgc3NpemVf
dCBzZXJpYWxfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLAo+ID4gIAkJcmV0dXJuIHJldDsKPiA+ICAJfQo+ID4gCj4gPiAtCXJldCA9IHNwcmlu
dGYoYnVmLCAiJTEycGhOXG4iLCAmaWRfYnVmW1NNX0NISVBfSURfT0ZGU0VUXSk7Cj4gPiArCXJl
dCA9IHNjbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiUxMnBoTlxuIiwgJmlkX2J1ZltTTV9DSElQ
X0lEX09GRlNFVF0pOwo+ID4gCj4gPiAgCWtmcmVlKGlkX2J1Zik7Cj4gPiAKPiA+IC0tCj4gPiAy
LjM0LjEKPiAKPiAtCj4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQs
IE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLCj4gUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
