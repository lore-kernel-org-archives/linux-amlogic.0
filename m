Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E6606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhS/kCQq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PU/w9YZ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y4CQQEqJIDogHz+c8yZXWaarEJuwiYaj58Miflc/im4=; b=QhS/kCQqoTE3Fmc+1iYmlBPvIq
	4tc27jQNtuhmq1GbbzWpUeAErHNHjqQ7kAQCCuil5GOJba0ZiqluvrQhMxcbHcW+WCP8fQGUSfJYn
	zH7oszdv+fVWr5IQdncbJEs4vJ4DQYFvUIoxVJ9jeuhpl4PJSe03f1G1ifweU/ShXPYQagvFPBQJE
	A2goqJIVNB3dMUUAHawRs0oKuKB0P7FlauBLTUVEi4zhrJNAbch2orAkOvYzHiolT8DnwqeFaIHN+
	DaPBic5leWwuWmNUwMhKo0fG9xKfycY5MRDcOCx8ftFQJTV7g9UKq9A5MMedzoT6bFGv0wKEpsu7a
	kKLxkvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfSi-0000000ENlA-23u5;
	Thu, 26 Nov 2026 19:48:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfSh-0000000ENkp-1PRk
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CD1F417D4;
	Thu, 26 Nov 2026 19:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDB01F000D8;
	Thu, 26 Nov 2026 19:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722534;
	bh=sQFMt2XiguQ7TYuz7CbVOO5lW2+hip2/2wrcZt+W2Gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PU/w9YZ4IlnTKnDrce7jLSsO6/Vy6vIKF5YzSBtSGj6cDe9ZQaSrOfraS5D9SHjP8
	 52HZKh7yV/nPBlAhqi66DARUk79SLlN5xVOZdNljXVo2D9NlGK366LcMcX7gq4/sIi
	 ByOhqjzHDqY2XKRtfRPaUDNC+gJ/N3Pvq1fKnC7qr5szROGkBz/bBU7aZiuftpbOz9
	 WJwd/bPiioo8QVGT8Y22qOGDSPOkGFPmmKrsDMFt8/bQJKBSlIvRnTj3rPtSNOkr3p
	 uNPSDE8cDNwaX/tUPV4fwlQwVG2Mdyo5ezjoDwbxo3ecq5we5jlddELoZzTbfyDwcv
	 45Hq8P4GmeN8A==
Message-ID: <sashiko-outbox-236123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 17/25] crypto: amlogic - Add support for A1-series
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261126193241.1471372-18-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-18-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 19:48:53 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gY3J5cHRvOiBhbWxvZ2ljIC0g
ZHVwbGljYXRlIG1lc29uX2ExX3BkYXRhIGFuZCByZWR1bmRhbnQKICBzNC1jcnlwdG8gbWF0Y2gg
ZW50cnkKLS0KCmNvbW1pdCBjZTI3ZDAxMWQyYjY1ODY4YmZiNDNiYWE4MmVjYmRiM2YxZmQ1NWRi
CkF1dGhvcjogQWxleGV5IFJvbWFub3YgPHJvbWFub3YuYWxleGV5MjAwMEBnbWFpbC5jb20+Cgpj
cnlwdG86IGFtbG9naWMgLSBBZGQgc3VwcG9ydCBmb3IgQTEtc2VyaWVzCgpUaGlzIGNvbW1pdCBh
ZGRzIHBsYXRmb3JtIGRhdGEgYW5kIGRldmljZSB0cmVlIG1hdGNoIGVudHJpZXMgZm9yIHRoZQpB
bWxvZ2ljIEExIGFuZCBTNCBjcnlwdG8gaGFyZHdhcmUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9n
aWMvYW1sb2dpYy1neGwtY29yZS5jCj4gaW5kZXggMDhkODlkYjE0Nzg4YS4uM2E2YmFjMTBiYjA0
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUu
Ywo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCj4gQEAg
LTI5OCw2ICsyOTgsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9wZGF0YSBtZXNvbl9h
eGdfcGRhdGEgPSB7Cj4gIAkuc3VwcG9ydF8xOTJiaXRfa2V5ID0gdHJ1ZSwKPiAgfTsKPiAgCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcGRhdGEgbWVzb25fYTFfcGRhdGEgPSB7Cj4gKwku
ZGVzY3NfcmVnID0gMHgwLAo+ICsJLnN0YXR1c19yZWcgPSAweDgsCj4gKwkuc2V0dXBfZGVzY19j
bnQgPSAxLAo+ICsJLmhhc2hlcl9zdXBwb3J0ZWQgPSB0cnVlLAo+ICsJLnN1cHBvcnRfMTkyYml0
X2tleSA9IGZhbHNlLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbWVzb25fY3J5cHRvX29mX21hdGNoX3RhYmxlW10gPSB7Cj4gIAl7Cj4gIAkJLmNvbXBhdGli
bGUgPSAiYW1sb2dpYyxneGwtY3J5cHRvIiwKPiBAQCAtMzExLDYgKzMxOSwxNCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9jcnlwdG9fb2ZfbWF0Y2hfdGFibGVbXSA9
IHsKPiAgCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGF4Zy1jcnlwdG8iLAo+ICAJCS5kYXRhID0g
Jm1lc29uX2F4Z19wZGF0YSwKPiAgCX0sCj4gKwl7Cj4gKwkJLmNvbXBhdGlibGUgPSAiYW1sb2dp
YyxhMS1jcnlwdG8iLAo+ICsJCS5kYXRhID0gJm1lc29uX2ExX3BkYXRhLAo+ICsJfSwKPiArCXsK
PiArCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LWNyeXB0byIsCj4gKwkJLmRhdGEgPSAmbWVz
b25fYTFfcGRhdGEsCj4gKwl9LAo+ICAJe30sCj4gIH07CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBp
c24ndCBhIGJ1ZywgYnV0IG1lc29uX2ExX3BkYXRhIGhhcyB0aGUgZXhhY3Qgc2FtZSBmaWVsZCB2
YWx1ZXMgYXMKbWVzb25fZzEyYV9wZGF0YSBkZWZpbmVkIHJpZ2h0IGFib3ZlIGl0OgoKZHJpdmVy
cy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmM6CnN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWVzb25fcGRhdGEgbWVzb25fZzEyYV9wZGF0YSA9IHsKCS5kZXNjc19yZWcgPSAweDAsCgkuc3Rh
dHVzX3JlZyA9IDB4OCwKCS5zZXR1cF9kZXNjX2NudCA9IDEsCgkuaGFzaGVyX3N1cHBvcnRlZCA9
IHRydWUsCgkuc3VwcG9ydF8xOTJiaXRfa2V5ID0gZmFsc2UsCn07CgpBbHNvLCBzaW5jZSBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2FtbG9naWMsZ3hsLWNyeXB0by55
YW1sCnJlcXVpcmVzICJhbWxvZ2ljLHM0LWNyeXB0byIgbm9kZXMgdG8gc3BlY2lmeSAiYW1sb2dp
YyxhMS1jcnlwdG8iIGFzIGEKZmFsbGJhY2sgY29tcGF0aWJsZSBhbmQgYm90aCBlbnRyaWVzIHVz
ZSB0aGUgc2FtZSBwbGF0Zm9ybSBkYXRhLCBpcyB0aGUKc2VwYXJhdGUgImFtbG9naWMsczQtY3J5
cHRvIiBlbnRyeSBpbiBtZXNvbl9jcnlwdG9fb2ZfbWF0Y2hfdGFibGVbXSBuZWVkZWQ/CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYx
MTI2MTkzMjQxLjE0NzEzNzItMS1qbmlldG8uYWxhYmVyQGdtYWlsLmNvbT9wYXJ0PTE3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
