Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339DECD98C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXuvyQd8HL7ivZR221JgqB8bmQk4MF6TZMXf7pZk46I=; b=RVyng2DoxJZc6g
	tmwdcsKEmL+ipRiNpIFS+2MTxo04SBkFsnNjlVpXpajHm66qrWsdnIAXXGFS6KlZBTjkLCGbHCak2
	YSZGZx0g4ksS6RFsTHJxRDtSz5vs5Z/yp0IBm+mUHpU7pmpq3s3pXDzGkEVi+0meeSAyBxQvoYdGS
	BbH84K0O+aUmIpwzAxTJSN/moPz9AnbMIWOmMyfgoR2IQ9Ntu1baBILVrKCe2DmCW9I4gi2ADaguI
	tQnBdgXkoBcxtWE7iJ7bnHuZcPtISERUuYDvAcXUEZdFtg6QHGvSrWzxikgojUmk0s2mj5dTWLj4k
	bMnBM7U8F6SQz+Z7VtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaQg-00000008xYM-1XxP;
	Thu, 11 Jun 2026 08:06:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaQe-00000008xYC-3s4X
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:06:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CDF260052;
	Thu, 11 Jun 2026 08:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884921F00893;
	Thu, 11 Jun 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165179;
	bh=ZfvX8nGXJCHbvZK7HHvWH99oIYlhxM69/j0f8E9KTyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EionIH0oOpyfc8U7f31x5nclZijLiclWYVUDZ0uitAFrJulxLZvwybq30Io4Vs+YG
	 GObcvPm+ntsLKyzJgAoGVQNYyWL2zy/qQ+el/iMI2oL5LKqU/lzasw2rLGakNCWClu
	 GN7M8jGX42D1oPUZ/L+NyHE4W7jzVC2XRSngS7bbSDZKR755kIknRG1Nz+lwHBqPnC
	 3PmdP3zjf3P4+f5dqkVoT/KUKCTD6a2nOOPThXYksqvFmbhYcXQDhjENECeOiKFpH7
	 GIDLlEO+sFhmJCu2JZmt/VDp7cey188lUXJwD5Z4wp5Yoaw+zDu/7xM6v5/NIm9H3d
	 suvNMS66PmMyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
Date: Thu, 11 Jun 2026 08:06:19 +0000
Message-Id: <20260611080619.884921F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIG5ld2x5IGFk
ZGVkIGBody1pcnFgIHByb3BlcnR5IGlzIG5vdCBtYXJrZWQgYXMgcmVxdWlyZWQgZm9yIHRoZSBH
UElPIGJhbmtzLCBhbmQgdGhlIGV4YW1wbGUgaXMgbm90IHVwZGF0ZWQuCi0gW01lZGl1bV0gVGhl
IGN1c3RvbSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBgaHctaXJxYCBsYWNrcyBhIHZlbmRvciBwcmVm
aXguCi0gW0xvd10gVGhlIG5ld2x5IGFkZGVkIGBody1pcnFgIHByb3BlcnR5IGxhY2tzIGEgZGVz
Y3JpcHRpb24gZmllbGQuCi0tCgpjb21taXQgNzc5ZTI5YjhjNGMxZTM3MjI0ZDU2ODg4MGZjZmNj
NzcyMjBjMWQ3MgpBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29t
PgoKZHQtYmluZGluZ3M6IHBpbmN0bDogYW1sb2dpYyxwaW5jdHJsLWE0OiBBZGQgZ3BpbyBpcnEg
cHJvcGVydHkKCkFkZCB0aGUgaHctaXJxIHByb3BlcnR5IGZvciBlYWNoIEdQSU8gYmFuayBhbmQg
ZW5hYmxlIGludGVycnVwdC1wYXJlbnQKZm9yIHBpbmN0cmwgc28gdGhhdCBncGlvZF90b19pcnEo
KSBjYW4gdHJhbnNsYXRlIEdQSU8gbGluZXMgdG8gSVJRcy4KCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2FtbG9naWMscGluY3RybC1hNC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvYW1sb2dpYyxw
aW5jdHJsLWE0LnlhbWwKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9hbWxvZ2ljLHBpbmN0cmwtYTQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2FtbG9naWMscGluY3RybC1hNC55YW1sCgpbIC4uLiBd
Cgo+IEBAIC02NSw2ICs2Nyw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgICBncGlvLXJh
bmdlczoKPiAgICAgICAgICBtYXhJdGVtczogMQo+ICAKPiArICAgICAgaHctaXJxOgo+ICsgICAg
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgoKW1NldmVy
aXR5OiBNZWRpdW1dClNob3VsZCB0aGlzIGN1c3RvbSBwcm9wZXJ0eSBoYXZlIGEgdmVuZG9yIHBy
ZWZpeCB0byBwcmV2ZW50IG5hbWVzcGFjZQpjb2xsaXNpb25zLCBzdWNoIGFzIGFtbG9naWMsaHct
aXJxPyAKCltTZXZlcml0eTogTG93XQpXb3VsZCBpdCBiZSBoZWxwZnVsIHRvIGluY2x1ZGUgYSBk
ZXNjcmlwdGlvbiBmaWVsZCBoZXJlIHRvIGRvY3VtZW50IHRoZQpwdXJwb3NlIGFuZCBzZW1hbnRp
YyB1c2FnZSBvZiB0aGlzIG5ldyBwcm9wZXJ0eT8KCj4gKwo+ICAgICAgcmVxdWlyZWQ6Cj4gICAg
ICAgIC0gcmVnCj4gICAgICAgIC0gcmVnLW5hbWVzCgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhlIGNv
bW1pdCBtZXNzYWdlIGluZGljYXRlcyB0aGlzIHByb3BlcnR5IGlzIGFkZGVkIGZvciBlYWNoIEdQ
SU8gYmFuay4KU2hvdWxkIGh3LWlycSBiZSBpbmNsdWRlZCBpbiB0aGlzIHJlcXVpcmVkIGxpc3Qg
dW5kZXIgdGhlIApwYXR0ZXJuUHJvcGVydGllczpeZ3Bpb0BbMC05YS1mXSskIG5vZGUgdG8gZW5z
dXJlIGluY29tcGxldGUgY29uZmlndXJhdGlvbnMKZmFpbCBzY2hlbWEgdmFsaWRhdGlvbj8KCkFk
ZGl0aW9uYWxseSwgdGhlIGV4YW1wbGUgYXQgdGhlIGJvdHRvbSBvZiB0aGUgZmlsZSBkb2Vzbid0
IHNlZW0gdG8gaW5jbHVkZQp0aGlzIG5ldyBwcm9wZXJ0eToKCmV4YW1wbGVzOgogIC4uLgogICAg
Z3Bpb0A0MjQwIHsKICAgICAgICByZWcgPSA8MCAweDQyNDAgMCAweDQwPiwgPDAgMHg0MDAwIDAg
MHg4PjsKICAgICAgICByZWctbmFtZXMgPSAiZ3BpbyIsICJtdXgiOwogICAgICAgIGdwaW8tY29u
dHJvbGxlcjsKICAgICAgICAjZ3Bpby1jZWxscyA9IDwyPjsKICAgICAgICBncGlvLXJhbmdlcyA9
IDwmcGVyaXBoc19waW5jdHJsIDAgOCAxMD47CiAgICB9OwoKRG9lcyB0aGUgZXhhbXBsZSBzZWN0
aW9uIG5lZWQgdG8gYmUgdXBkYXRlZCB0byBkZW1vbnN0cmF0ZSB0aGUgdXNhZ2Ugb2YgdGhlCm5l
d2x5IGFkZGVkIHByb3BlcnR5PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxMS1ncGlvLXRvLWlycS12MS0wLTEyMjAxNzE2ZjIz
ZkBhbWxvZ2ljLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
