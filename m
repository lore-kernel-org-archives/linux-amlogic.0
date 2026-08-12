Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB926C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8aZQ/l3LSM4hcoE8n7FkleHavtKHd2OiDloTG3oRWk=; b=rw09ie7kNp/nCQ
	QyXEYa/Meym3f8MB1DtnrEuS+vPAWzKmxKcrRzT77ix1MQkOr6ShyQx9svLnTlzThCeEkqzz49o30
	FMLOOt9khJsa4DBOb/RYsoHHASlawkcfBGZufvK/g9kUJOfvVcfOaQ/oIBHKzo87x38RZF4cpUY38
	71L9gcELAjRvKITn6e6knlGR/XYI0MKJQO4NNHNMPI7Od1jbPe1ow/ocPl9VPLGDOVG8sov+bkVkx
	lSgkqDJe69UiIV5rTXVT7Kp9Lqaqc7g1WEYRDnWTFj7yCVFQ/wjSaGEuR26ysOhZSm22AMKoxqyOO
	tIK8eNEdeinqKPZeS2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz3x-0000000FJNP-0KCj;
	Wed, 12 Aug 2026 02:51:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz3Y-0000000FJLt-2hzM
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 02:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 531564057E;
	Wed, 12 Aug 2026 02:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C652B1F000E9;
	Wed, 12 Aug 2026 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503064;
	bh=zIwp/0ofU7TBSBShrkE7OOToS3PA92bLNKlKnstbmgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8te2vFBoYGDi0WUJr6bEaatLEXNIRWnZHe/GZKc4b9/xlpUUgkQ8nzded4hbS6+4
	 hZSIFZfGo0WUjW+m8VxUYV2VXNUAsOZvqp0n2qucj/MfTUoOU5Q9aK3roDmFj8MbF/
	 KLwEOc6uBNyaz3ywLvKo/j8NCOo5Rv43/n8Eg4EsVlGlwitFLr9cr8OzefioTUeMcf
	 RKgPohNx2EO5/zrXf80qushlJ5/6BJqPfhAorm9Gy1Y9qBn84olbKf9vz4gmGLwWqw
	 y3iTgNTThCsoI3NmS290MH4CwZBzXhCVIN8bLViY/OiebRuIOLx2rQonfjXR16nm/1
	 uKr/WMmLcSLeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-2-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-2-3fae085861bd@amlogic.com>
Date: Wed, 12 Aug 2026 02:51:03 +0000
Message-Id: <20260812025103.C652B1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIHN5bmNocm9uaXphdGlvbiBpbiBgbWVzb25fc21fY2FsbF9yZWFkYCBh
bmQgYG1lc29uX3NtX2NhbGxfd3JpdGVgIGFsbG93cyBjb25jdXJyZW50IFNNQyBjYWxscyB0byBj
b3JydXB0IHNoYXJlZCBtZW1vcnkgYnVmZmVycy4KLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRDSCB2
NyAyLzZdIGZpcm13YXJlOiBtZXNvbjogc206IEFkZCB2aWRlbyBmaXJtd2FyZSBsb2FkaW5nIFNN
QyBjYWxsIC0tLQpjb21taXQgZGY0OTZlODg5MDQ2ZmMxMjhlYWJjNTIxMDhkMmYyNzk2N2M2ODJh
ZApBdXRob3I6IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KCmZpcm13YXJl
OiBtZXNvbjogc206IEFkZCB2aWRlbyBmaXJtd2FyZSBsb2FkaW5nIFNNQyBjYWxsCgpUaGlzIGNv
bW1pdCBhZGRzIHRoZSBTTV9MT0FEX1ZJREVPX0ZXIGNvbW1hbmQgdG8gdGhlIGNvbW1hbmQgdGFi
bGUgZm9yCmxvYWRpbmcgdmlkZW8gZmlybXdhcmUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zp
cm13YXJlL21lc29uL21lc29uX3NtLmMgYi9kcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3Nt
LmMKPiBpbmRleCBhYjk3NTFhNTliNTUyLi44ODdjYWE1YzYyNWRiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUv
bWVzb24vbWVzb25fc20uYwo+IEBAIC00OCw2ICs0OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWVzb25fc21fY2hpcCBneGJiX2NoaXAgPSB7Cj4gIAkJQ01EKFNNX1RIRVJNQUxfQ0FMSUJfUkVB
RCwJMHg4MjAwMDA0NyksCj4gIAkJQ01EKFNNX0ExX1BXUkNfU0VULAkJMHg4MjAwMDA5MyksCj4g
IAkJQ01EKFNNX0ExX1BXUkNfR0VULAkJMHg4MjAwMDA5NSksCj4gKwkJQ01EKFNNX0xPQURfVklE
RU9fRlcsCQkweGIyMDAwMDBmKSwKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlz
dGluZyBpc3N1ZSwgYnV0IGRvZXMgYWRkaW5nIG5ldyBmaXJtd2FyZSBsb2FkaW5nIGNvbW1hbmRz
CmluY3JlYXNlIHRoZSByaXNrIG9mIGNvbmN1cnJlbnQgc2hhcmVkIG1lbW9yeSBjb3JydXB0aW9u
PwoKTG9va2luZyBhdCBob3cgbWVzb25fc21fY2FsbF9yZWFkKCkgYW5kIG1lc29uX3NtX2NhbGxf
d3JpdGUoKSB1c2UgdGhlIHNoYXJlZApidWZmZXJzOgoKZHJpdmVycy9maXJtd2FyZS9tZXNvbi9t
ZXNvbl9zbS5jOm1lc29uX3NtX2NhbGxfcmVhZCgpIHsKICAgIC4uLgogICAgaWYgKG1lc29uX3Nt
X2NhbGwoZncsIGNtZF9pbmRleCwgJnNpemUsIGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQp
IDwgMCkKICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgIC4uLgogICAgaWYgKGJ1ZmZlcikKICAg
ICAgICBtZW1jcHkoYnVmZmVyLCBmdy0+c21fc2htZW1fb3V0X2Jhc2UsIHNpemUpOwogICAgLi4u
Cn0KCmFuZAoKZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jOm1lc29uX3NtX2NhbGxf
d3JpdGUoKSB7CiAgICAuLi4KICAgIG1lbWNweShmdy0+c21fc2htZW1faW5fYmFzZSwgYnVmZmVy
LCBzaXplKTsKCiAgICBpZiAobWVzb25fc21fY2FsbChmdywgY21kX2luZGV4LCAmd3JpdHRlbiwg
YXJnMCwgYXJnMSwgYXJnMiwgYXJnMywgYXJnNCkgPCAwKQogICAgICAgIHJldHVybiAtRUlOVkFM
OwogICAgLi4uCn0KClNpbmNlIHRoZXNlIGJ1ZmZlcnMgKHNtX3NobWVtX291dF9iYXNlIGFuZCBz
bV9zaG1lbV9pbl9iYXNlKSBhcmUgc2hhcmVkCmFjcm9zcyB0aGUgc3lzdGVtLCBpZiB0d28gdGhy
ZWFkcyBjYWxsIGludG8gdGhpcyBBUEkgY29uY3VycmVudGx5IChmb3IKZXhhbXBsZSwgdW5wcml2
aWxlZ2VkIHVzZXJzcGFjZSByZWFkaW5nIHRoZSBzZXJpYWwgc3lzZnMgYXR0cmlidXRlIHdoaWxl
CmFub3RoZXIgcHJvY2VzcyByZWFkcyBlZnVzZSB2aWEgdGhlIG52bWVtIGZyYW1ld29yayBvciBs
b2FkcyB2aWRlbwpmaXJtd2FyZSksIGNhbiB0aGV5IG92ZXJ3cml0ZSBlYWNoIG90aGVyJ3MgZGF0
YSBpbiB0aGUgc2hhcmVkIG1lbW9yeSByZWdpb24KYmVmb3JlIHRoZSBtZW1jcHkgY29tcGxldGVz
PwoKSXMgdGhlcmUgYSBsb2NraW5nIG1lY2hhbmlzbSBwcm90ZWN0aW5nIHRoZXNlIFNNQyBjYWxs
cyBhbmQgc2hhcmVkIGJ1ZmZlcnMKdGhhdCBJIGFtIG1pc3NpbmcsIG9yIGRvIHdlIG5lZWQgdG8g
YWRkIGEgbXV0ZXggdG8gc2VyaWFsaXplIGFjY2VzcyB0bwptZXNvbl9zbV9jYWxsX3JlYWQoKSBh
bmQgbWVzb25fc21fY2FsbF93cml0ZSgpPwoKPiAgCQl7IC8qIHNlbnRpbmVsICovIH0sCj4gIAl9
LAo+ICB9OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDgxMi1iNC1zNC12ZGVjLXVwc3RyZWFtLXY3LTAtM2ZhZTA4NTg2MWJkQGFt
bG9naWMuY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
