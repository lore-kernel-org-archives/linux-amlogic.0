Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A83F8FA90
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1bBn4bwfk2bngEAkEFYciSCAvXHmzaREjH6cINyPA0=; b=oQ76M94dcrtAr5fQBtCEyd6i7S
	h7bizyReL/msPPvEUzFH3NKogZLxxWsc1JUBU8RSpU3eWlsYaH9F+J8eo/AND94y1bsRW/oYQTJka
	XYNjiBgVc8Qjx5QlKOXrhWGSGKngZD3TtQotjarbeabzNPJkONgcMq62zVWrcuOUPfM07bnlpJpT+
	ENgPO8CYGiq6kjBS56lKpa/JKzXProScyhvT5/C6P1rcWguI3CVTL5xVqmncSy7ZC2yQFoS2GBQMm
	LzCQraKX43udopacaKtMOrUKiOmGKfNIdoLy3JVaiBj3kWjJms4FTdXtOgw9/mUN5NyP0zuNPQ5z1
	a0jkDM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7S-00000008v9a-43uh;
	Tue, 21 Apr 2026 16:38:38 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7P-00000008v8D-27zT
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Apr 2026 16:38:37 +0000
Date: Tue, 21 Apr 2026 16:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776789512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYNRr78Bk7kKy8q5PZ8wAhWa1XHOZpv8D1mw9I7KD98=;
	b=RSg0wuXin0pVrh27qZrwL8SFBe6CUFcCoX5mUHmHSVFNgDcpusGKhUDQqcoSnZc8rwLAvx
	WXsEuOz92oH8jypRR5oA6XeD6sqtjH96SMgOVnm9c/z/mNfrQQVJczEj78YcfYMdhiEu7o
	7OC2crjL0ZftcPXXU+i+jGH+xJ+iayi35yjsUenWjQgxfa6H9FX96wLZotJDf9/qqrJ6XS
	rqXg0GrSZMWwWEQt6FO9LXXRi71EKCd3A+ZX0uSuTdAL3gQwObeJY3WlnazDeThfGWvAvD
	cKE3ZI+Jzg7Yp1TamJ3rokhAi7u8MolP3Q0Yzav9VDfNGEgv75TV0LgPakcgtg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v3 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdurk1.2nkwjyfysqjik@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093835_693054_B18772D7 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyMSBBcHIgMjAyNiAxNTo1MywgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50
LnVpYmsuYWMuYXQgd3JvdGU6Cj5Gcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwg
PGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0Pgo+Cj5DaGFuZ2VzIGlu
IHYzOgo+LSBDaGFuZ2UgcG9zaXRpb24gb2YgdGhlIGVudHJ5IGluIHRoZSBhbWxvZ2ljLnlhbWwu
Cj4tIENoYW5nZSBmb3JtYXR0aW5nIG9mIHRoZSBBbWxvZ2ljIFcxNTBTMSBXaS1GaSBtb2R1bGUg
Y29tbWVudC4KPi0gRml4IHNldmVyYWwgZm9ybWF0dGluZyBpc3N1ZXMuCj4KPkNoYW5nZXMgaW4g
djI6Cj4tIFNwbGl0IGR0LWJpbmRpbmdzIGFuZCBkdHMgY2hhbmdlcyBpbnRvIHNlcGFyYXRlIHBh
dGNoZXMuCj4tIFVwZGF0ZWQgbW9kZWwgc3RyaW5nIHRvIG1hdGNoIGRvY3VtZW50ZWQgdmVuZG9y
IHByZWZpeC4KPi0gUHV0IHZkZGlvX3NkIHN0YXRlcyBhcnJheSBpbiBhIHNpbmdsZSBsaW5lLgo+
LSBBZGRlZCBhIGNvbW1lbnQgZm9yIHRoZSB1bnN1cHBvcnRlZCBBbWxvZ2ljIFcxNTBTMSBXaS1G
aSBtb2R1bGUuCj4KCldoZXJlIGRpZCB0aGUgcmVzdCBvZiB0aGUgY292ZXIgbGV0dGVyIGdvPwoK
PkNocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6Cj4gIGR0LWJpbmRpbmdzOiBhcm06
IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZvciBBbWVkaWF0ZWNoIFg5OFEKPiAgYXJtNjQ6IGR0czog
YW1sb2dpYzogYWRkIHN1cHBvcnQgZm9yIFg5OFEKPgo+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9hbWxvZ2ljLnlhbWwgICAgICB8ICAgNyArCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL01ha2VmaWxlICAgICAgICAgIHwgICAxICsKPiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1zNC1zOTA1dzIteDk4cS5kdHMgfCAyNDkgKysrKysrKysrKysrKysrKysrCj4gMyBmaWxlcyBj
aGFuZ2VkLCAyNTcgaW5zZXJ0aW9ucygrKQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQtczkwNXcyLXg5OHEuZHRzCj4KPi0tIAo+Mi41My4w
CgotLQpCZXN0IHJlZ2FyZHMsCkZlcmFzcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
