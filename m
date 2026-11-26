Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEE606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOeJvfwB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkT9U9o9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IGNkQtH92OfQppSyRBmZts0sNL2GtKYZAdjMuB2kZD8=; b=YOeJvfwBKlTKsxS1so8RhrvBrK
	sCF8Kit3M5xBcFtY7KzfDt5JacAU2aE5Q6NM19axqRlar/sUTX1kiJkmgH0/UZdJszKtwTjGO+1qj
	fFcJbausMLbfCl019ldjQxBq/L7JSzOv5/jGwojs7be6wGKPEoB7VyLkO9Xtj1Auqy4jx4Hnuxtzp
	d8N/DAS3PtmydJqb70i2HzUBOUwNydCQze0mW5Cx0Yo8HB+SAk9sk50JV3PqrVoprIBQMVK9nwdGn
	5nfjVk0tTjE6SnlJsgIcJ4KCjtUSfm1/O42kLadyCrTh1hYZdsZqyzSNCRmBpgBUu3ZNd3qsgNWBH
	uuxQMKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfND-0000000ENGo-2Fhs;
	Thu, 26 Nov 2026 19:43:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfNC-0000000ENGg-1315
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A256841A23;
	Thu, 26 Nov 2026 19:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5941F000C4;
	Thu, 26 Nov 2026 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722193;
	bh=YEr6X8MD9YLmwSVjAHEQJC/Iu7dikRlAmBL0OK7jay8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kkT9U9o96e+wx08YeEoVDAIlAePLyqVn8c0f1t57cbb5UR2f06cwHMPlGc2sgCQED
	 KmSW0dCSMpSDtBsU54h0HbP8AnLQpB0NA4CkIHvOk7naZfFBC3rPPlhkI1oQloU4Si
	 HWMy9gJm7037c8QdAwHbyIkhsmk+RZ86H5KRmQr+uuOt6eD2jnRUQGHPrGrVEf2MSD
	 blWbnrQDk9zlGk/Y/tsniYieVH3aur9TiXC0Tvo8phakVOez9UQOSzD6F951vQY8Ua
	 p1NTD+LE8ICsJN4S9e6cGimrdUF9bxgELWElFdvvA8CoYeQJxu4qnEw+ChHz4MnTtf
	 hbpV8Jk+gHFbQ==
Message-ID: <sashiko-outbox-236112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/25] dt-bindings: crypto: amlogic,gxl-crypto:
 correct clk and interrupt lines
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261126193241.1471372-2-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-2-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 19:43:12 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGNyeXB0
bzogYW1sb2dpYyxneGwtY3J5cHRvOiBpbnRlcnJ1cHRzIGxpc3RlZAogIGJlZm9yZSBjbG9ja3MK
LS0KCmNvbW1pdCBiNGE2OGM0YzFmMGI4N2JlY2QwZGE2MWY4ZmIyMzEyMDE0YjliM2VlCkF1dGhv
cjogQWxleGV5IFJvbWFub3YgPHJvbWFub3YuYWxleGV5MjAwMEBnbWFpbC5jb20+CgpkdC1iaW5k
aW5nczogY3J5cHRvOiBhbWxvZ2ljLGd4bC1jcnlwdG86IGNvcnJlY3QgY2xrIGFuZCBpbnRlcnJ1
cHQgbGluZXMKClRoaXMgY29tbWl0IHJlbW92ZXMgdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5IGFu
ZCB0aGUgdW51c2VkIHNlY29uZCBpbnRlcnJ1cHQKbGluZSBmcm9tIHRoZSBhbWxvZ2ljLGd4bC1j
cnlwdG8gYmluZGluZyBzY2hlbWEgYW5kIHVwZGF0ZXMgdGhlIGV4YW1wbGUgY2xvY2sKdG8gQ0xL
SURfQ0xLODEuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY3J5cHRvL2FtbG9naWMsZ3hsLWNyeXB0by55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2NyeXB0by9hbWxvZ2ljLGd4bC1jcnlwdG8ueWFtbAo+IGluZGV4IDk0OGUx
MWViZTRlZWIuLmZkYzM5Nzk3YTJhOWMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2NyeXB0by9hbWxvZ2ljLGd4bC1jcnlwdG8ueWFtbAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vYW1sb2dpYyxneGwtY3J5cHRv
LnlhbWwKPiBAQCAtMjAsMjAgKzIwLDE1IEBAIHByb3BlcnRpZXM6Cj4gICAgaW50ZXJydXB0czoK
PiAgICAgIGl0ZW1zOgo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBJbnRlcnJ1cHQgZm9yIGZsb3cg
MAo+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBJbnRlcnJ1cHQgZm9yIGZsb3cgMQo+ICAKPiAgICBj
bG9ja3M6Cj4gICAgICBtYXhJdGVtczogMQo+ICAKPiAtICBjbG9jay1uYW1lczoKPiAtICAgIGNv
bnN0OiBibGttdgo+IC0KPiAgcmVxdWlyZWQ6Cj4gICAgLSBjb21wYXRpYmxlCj4gICAgLSByZWcK
PiAgICAtIGludGVycnVwdHMKPiAgICAtIGNsb2Nrcwo+IC0gIC0gY2xvY2stbmFtZXMKPiAgCj4g
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICAKPiBAQCAtNDYsNyArNDEsNiBAQCBleGFt
cGxlczoKPiAgICAgIGNyeXB0bzogY3J5cHRvLWVuZ2luZUBjODgzZTAwMCB7Cj4gICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLGd4bC1jcnlwdG8iOwo+ICAgICAgICAgIHJlZyA9IDwweGM4
ODNlMDAwIDB4MzY+Owo+IC0gICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxODggSVJRX1RZ
UEVfRURHRV9SSVNJTkc+LCA8R0lDX1NQSSAxODkgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+IC0g
ICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9CTEtNVj47Cj4gLSAgICAgICAgY2xvY2stbmFt
ZXMgPSAiYmxrbXYiOwo+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxODggSVJRX1RZ
UEVfRURHRV9SSVNJTkc+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9DTEs4MT47
Cj4gICAgICB9OwoKW1NldmVyaXR5OiBMb3ddClRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGUgZXhh
bXBsZSBub2RlLCBwcm9wZXJ0aWVzLCBhbmQgcmVxdWlyZWQgbGlzdHMgcGxhY2UKaW50ZXJydXB0
cyBiZWZvcmUgY2xvY2tzIGluc3RlYWQgb2YgZm9sbG93aW5nIHRoZSBzdGFuZGFyZCBEVCBiaW5k
aW5nIG9yZGVyCihjb21wYXRpYmxlLCByZWcsIGNsb2NrcywgaW50ZXJydXB0cykuCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI2
MTkzMjQxLjE0NzEzNzItMS1qbmlldG8uYWxhYmVyQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
