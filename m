Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C212CC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 05:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUs7xnaKVv2l4m4iOEMqmHMREwjsIXlq9wofEl8uoHQ=; b=z0gzkcp+poB0+L
	5m0XHw9x48nA8eDU11FVtU5cGeLK97mETGDwWzKZsjVwbElH0x4Y+3jJcjc4yQMwuhyXXWT91bdvY
	QqRMd3QX9YYRfVaR5aAWpKWsmEPFuBCOkcAU3aegJnhbWJ3C6wn2mlnXRt6UyydbbfmzQ1l7Ah3PR
	B0ewV6ITQlrsbjy9vXaPeznCrdttuOR+ZM3IvYqq7a7VFbTHc4v1OHvaE/8Pj9TkVh/57lWLQcDTX
	PoyBPr9ySU+qnCGWpz+UUFfxD0CMlsC+AVJPZzk45+FMmxW/XB9L01ioEQw1RhgQCCv+SqN+3mX/t
	SpNc6JmHhnVuk80+Ixvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4Dh-00000004ELC-0Taz;
	Fri, 10 Jul 2026 05:56:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4Dg-00000004EL6-0GG3
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 05:56:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3A42600C3;
	Fri, 10 Jul 2026 05:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD8F1F000E9;
	Fri, 10 Jul 2026 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783662974;
	bh=ahuNRr/Mh7BaiOwHTLAC3cW7JJUenNp+2t36g1wXGF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oE7YptjOOC/1yaFN8r4XhAFWfYjqelHqsrLlWHcZRhwX4prtunIOkDGAAYOmssbbU
	 fNSXxgMHHiPXborNWP7wUOc65aPRDUHUx6b3UGeC6v6DLKv1uQuF7PbbAooxMaIA3i
	 fn/trfMO2MyBfi5ErXJ8RLwTgnMHh8qF5jVPfAveZPLr+SOnDwWMUIzv7n4s+T8Xdb
	 wwTuXTqzWdkYE1NXa608/XS1koo29n00Bf7KMiGrb745IntoVTz/Mq9bKnnxdDlS1Y
	 5nwgOVFiykjKi+1yGEFfPd5RMwg2hl9WsBVqDUpUflEFQJNGJTejgvbFUT0PGdbPXL
	 Fm5aMa5fBJYSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-amlogic-dma-v10-1-ff4deae837e7@amlogic.com>
References: <20260710-amlogic-dma-v10-0-ff4deae837e7@amlogic.com>
 <20260710-amlogic-dma-v10-1-ff4deae837e7@amlogic.com>
Date: Fri, 10 Jul 2026 05:56:13 +0000
Message-Id: <20260710055614.0CD8F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG1hY3JvcyBETUFf
VFggYW5kIERNQV9SWCBpbiB0aGUgZ2xvYmFsIGRldmljZXRyZWUgYmluZGluZ3MgaGVhZGVyIGxh
Y2sgYW4gU29DIG9yIHZlbmRvciBwcmVmaXgsIGNhdXNpbmcgbmFtZXNwYWNlIHBvbGx1dGlvbi4K
LS0KCi0tLSBQYXRjaCBbMV06IFtQQVRDSCB2MTAgMS8zXSBkdC1iaW5kaW5nczogZG1hOiBBZGQg
QW1sb2dpYyBBOSBTb0MgRE1BIC0tLQpjb21taXQgZGQ2OGMwOWNmODlhNDE0Mjc1NmVmZjdiNDRi
MDZmYjhmOGVkMWIyMApBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgoKZHQtYmluZGluZ3M6IGRtYTogQWRkIEFtbG9naWMgQTkgU29DIERNQQoKVGhpcyBjb21t
aXQgYWRkcyBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTkgU29DIERNQSBj
b250cm9sbGVyLgpJdCBhbHNvIGludHJvZHVjZXMgYSBuZXcgaW5jbHVkZSBmaWxlIGNvbnRhaW5p
bmcgc3BlY2lmaWMgcHJvcGVydHkgdmFsdWVzCmZvciBETUEgY2hhbm5lbHMuCgpbIC4uLiBdCgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5oIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEuaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYzU5YzJmZDRiOTU2MQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5oCj4gQEAg
LTAsMCArMSw4IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBN
SVQpICovCj4gKwo+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXwo+
ICsjZGVmaW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXwo+ICsKPiArI2RlZmlu
ZSBETUFfVFgJCQkwCj4gKyNkZWZpbmUgRE1BX1JYCQkJMQoKW1NldmVyaXR5OiBMb3ddCkRvIHRo
ZXNlIG1hY3JvIG5hbWVzIG5lZWQgYSB2ZW5kb3Igb3IgU29DIHByZWZpeCBsaWtlIEFNTE9HSUNf
QTlfRE1BX1RYPwoKU2luY2UgdGhleSBhcmUgaW4gYSBnbG9iYWwgZGV2aWNldHJlZSBiaW5kaW5n
cyBoZWFkZXIsIHVzaW5nIGdlbmVyaWMgbmFtZXMKbGlrZSBETUFfVFggYW5kIERNQV9SWCBjb3Vs
ZCBwb2xsdXRlIHRoZSBnbG9iYWwgbWFjcm8gbmFtZXNwYWNlLiBBcmUgdGhlc2UKbGlrZWx5IHRv
IGNvbGxpZGUgd2l0aCBleGlzdGluZyBkZWZpbml0aW9ucyBpbiBvdGhlciBkcml2ZXIgaGVhZGVy
cyBhbmQKY2F1c2UgbWFjcm8gcmVkZWZpbml0aW9uIGJ1aWxkIGVycm9ycz8KCj4gKyNlbmRpZiAv
KiBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18gKi8KCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MTAtYW1sb2dpYy1k
bWEtdjEwLTAtZmY0ZGVhZTgzN2U3QGFtbG9naWMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
