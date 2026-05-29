Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877BACD4F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGhS13hNYcse5RUxE37IPy2pAtUusQcGXCBx82y8r7s=; b=WQ19OfRMvjO5Cu
	T9nZSckKpNMd/Ev9/fYveBppKTc7JTOsz8m8dDdh9rKozjJdNlekjQ1u5A+7WVQvQfyWjj/Zzoqbx
	dBH8Apt9KsPGTE3UPZFiBM8LUenAFw3nznNiDK/JtuTWELEWwirsSIpkFQ56lxa6tpYZqqD83WgA2
	uMYK2E1xq4CEmNEObmHvP7WJJ7iPbbgcYeL+LvWWJK/P5frVOFW1JATrZO5GcsetfMTZj+a80PKtc
	t+2DXa1l7BmiL7WsiKQxogbXmhzaNwzAGJo3axfMaSs/1dQqo+SphqolINTEDWTEBhIH9gIr4JHli
	M4oeH16Wen5u3qV5P7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyBj-00000007WGK-1CDR;
	Fri, 29 May 2026 14:27:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyBg-00000007WFv-3d5I
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 14:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4650435B3;
	Fri, 29 May 2026 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6184A1F00893;
	Fri, 29 May 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780064867;
	bh=BPXwiKFSm0zW8QbnHOThnDxSK0V+XzbVRh92LoGOLH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aV6gkr3OO89bEjXwcfiMEqGmYG5g8n7Q12t95l0yX1jbCUSIaiNPebKEY1n4NRyOC
	 0S6ACyY+D+qps4QLWtiAwETtnx2cGtkgXtln9SZucmUTQsXXNJ/KOExgddMaag6fOH
	 37j4vOd3Jwm8ofOZap1d75bb9QKY2wOF3F0Vn9noji0vyzPSS8JjFHONbYhTztiK0x
	 7J3mB23Msg8FOeqFth08USweg2XVaqApjtmNGxr/QVQ9KErDbL3zckAuAZwD/rK2Ki
	 tFtuq1Q6usUBQ3BTuzQqyEwZEzQgw4Py62FbDjkYbwMId7PfVLtKas/q/Dl4EzDqN0
	 d0pWjLGPsfoVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: amlogic: meson-axg: Add missing
 nand_rb0 pin to nand_all_pins
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
Date: Fri, 29 May 2026 14:27:47 +0000
Message-Id: <20260529142747.6184A1F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_072748_941000_E43C598E 
X-CRM114-Status: GOOD (  10.86  )
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
IFtIaWdoXSBlTU1DIGJvb3QgZmFpbHVyZSBkdWUgdG8gQk9PVF8xMyBwaW5jdHJsIGNvbmZsaWN0
LiBGaXg6IEFkZCBzdGF0dXMgPSAiZGlzYWJsZWQiIHRvIHRoZSBuZmMgbm9kZSBpbiBtZXNvbi1h
eGcuZHRzaS4KLS0KCmNvbW1pdCBjMjE4YWU1OTk0OGU4YmFiNmM2OGZjZmRjNTM5ZWY2NzhlYzNi
ZGJhCkF1dGhvcjogSnVuIFlhbiA8amVycnlzdGV2ZTExMDFAZ21haWwuY29tPgoKYXJtNjQ6IGR0
czogYW1sb2dpYzogbWVzb24tYXhnOiBBZGQgbWlzc2luZyBuYW5kX3JiMCBwaW4gdG8gbmFuZF9h
bGxfcGlucwoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgbmFuZF9hbGxfcGlucyBwaW5jdHJsIG5v
ZGUgdG8gaW5jbHVkZSB0aGUgbWlzc2luZwpuYW5kX3JiMCBwaW4gZm9yIHRoZSBtZXNvbi1heGcg
cGxhdGZvcm0uIFRoaXMgZW5zdXJlcyB0aGUgcmVhZHkvYnVzeSBwaW4KaXMgcHJvcGVybHkgY29u
ZmlndXJlZCBmb3IgTkFORCBjb250cm9sbGVyIG9wZXJhdGlvbi4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaQo+IGluZGV4IGYxZjUzZmQ5OGFlMjUuLmI3YTdm
NGZhZTdkYzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWF4Zy5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5k
dHNpCgpbIC4uLiBdCgo+IEBAIC00ODEsNyArNDgxLDggQEAgbXV4IHsKPiAgCQkJCQkJCSAibmFu
ZF9hbGUiLAo+ICAJCQkJCQkJICJuYW5kX2NsZSIsCj4gIAkJCQkJCQkgIm5hbmRfd2VuX2NsayIs
Cj4gLQkJCQkJCQkgIm5hbmRfcmVuX3dyIjsKPiArCQkJCQkJCSAibmFuZF9yZW5fd3IiLAo+ICsJ
CQkJCQkJICJuYW5kX3JiMCI7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50
cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgYWRkaW5nIHRoaXMgcGluIGV4cG9zZXMgYQpwcmUt
ZXhpc3RpbmcgaXNzdWUgd2hlcmUgdGhlIG5mYyBub2RlIHVuY29uZGl0aW9uYWxseSBjbGFpbXMg
bmFuZF9hbGxfcGlucy4KClNpbmNlIG5hbmRfcmIwIGFuZCBlbW1jX2RzIHNoYXJlIHRoZSBCT09U
XzEzIHBpbiwgZG9lcyB0aGlzIGZvcmNlIGEgc3RyaWN0CnBpbmN0cmwgY29sbGlzaW9uIGJldHdl
ZW4gdGhlIE5BTkQgYW5kIGVNTUMgbm9kZXM/IAoKSWYgdGhpcyBjb2xsaXNpb24gY2F1c2VzIHRo
ZSBlTU1DIHN0b3JhZ2UgcHJvYmUgdG8gZmFpbCBhbmQgYnJlYWtzIHRoZSBib290CnByb2Nlc3Ms
IHNob3VsZCB3ZSBhZGQgc3RhdHVzID0gImRpc2FibGVkIiB0byB0aGUgbmZjIG5vZGUgaW4gbWVz
b24tYXhnLmR0c2kKdG8gcHJldmVudCB0aGlzIGNvbmZsaWN0IHdoZW4gTkFORCBpcyBub3QgYWN0
aXZlbHkgdXNlZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA1MjkxNDA2MDUuMTA3MDc2NC0xLWplcnJ5c3RldmUxMTAxQGdtYWls
LmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
