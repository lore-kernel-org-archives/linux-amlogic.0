Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33040CD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XYXdgo2ii1hZ6iBZNyVV7BBYUR6NcVTQHqAgiL9OxQ=; b=ffqIxmPFa8zxJA
	exF/ZXXxLQy+32BcLSedXMcKBzcZZRzt7gS99ebr0Wpiaz97eCMzV+FkwasolFXKDeIViIqfvC3vr
	dAKpL4kgujiQs2SNLnnZ9dZILAK0WpSXAFP6+gbHLJskoufCVC8dGm2sLtI6oSyZDbk6iGi3wCihl
	zwTIJQTibS4UkId1UzmN9UE1v+cOCrzayMVY3LdQNxKBb5dh9sU4X1jXddUXZA9eboaHhET8o9DF9
	9+2FIjxbieAHZ4CUSSbU+gjZZdgYg6vnzTSt1NoyYctfeLTZgPOUtWWuvB3eYlNl9pXWNPkJedeFm
	w09S7T1hGiTVDYJxf7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2mR-0000000GZpP-2GyA;
	Mon, 18 May 2026 18:33:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2mP-0000000GZpA-43ja
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D938E60120;
	Mon, 18 May 2026 18:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13424C2BCF6;
	Mon, 18 May 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779129208;
	bh=LGKGSMUN4o8qJprgckf5sju9UjIfUozUpvum/hvdi4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cgFJPYURhIOG9dJmQHfBDUx+U48eMNN16jXyMNo+FCMHw+qrLbkKBw0ur62totE8y
	 owDOudIJi520iNEHAd6F3zSdx11g75JJZvxiv0TKQvonsshJo0WJu6M+vMesLv+2rX
	 ri101/DuQAEEjp8Jy5zqcqqwH1DvGmAtRGHKdq23MRnfBJ3qEwAGkQMD4HKQlbZDR6
	 T/6h5jp3tfZTPzVAaKwW3QNDtSoxzuA3jtyeSxXi3i5v7gBlqUYn+DAixJBT3ffPZS
	 rW7NGZLqwwjQKqAduDh2D6uzxlCVEhW2ztl7/wE6DVaUqG62EfkCKa7CFmpCV7uHNt
	 Al7uAY48tKFcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC
 adapter is unregistered
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-4-jonas@kwiboo.se>
References: <20260518180206.2480119-4-jonas@kwiboo.se>
Date: Mon, 18 May 2026 18:33:27 +0000
Message-Id: <20260518183328.13424C2BCF6@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEZyZWVpbmcgdGhlIHNo
YXJlZCBJUlEgYmVmb3JlIG1hc2tpbmcgdGhlIGhhcmR3YXJlIGludGVycnVwdCBzb3VyY2UgY3Jl
YXRlcyBhIHJhY2UgY29uZGl0aW9uIHRoYXQgY2FuIGxlYWQgdG8gYW4gdW5oYW5kbGVkIGludGVy
cnVwdCBzdG9ybSwgcGVybWFuZW50bHkgZGlzYWJsaW5nIHRoZSBzaGFyZWQgSVJRIGxpbmUuCi0t
Cgpjb21taXQgODYwYTA1MThjNTU4M2RkYTYwNmM2NzBiNjA5Nzk0YjYwZTZiYzA3YgpBdXRob3I6
IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KCmRybTogYnJpZGdlOiBkd19oZG1pOiBG
cmVlIElSUSBiZWZvcmUgQ0VDIGFkYXB0ZXIgaXMgdW5yZWdpc3RlcmVkCgpUaGlzIGNvbW1pdCBl
eHBsaWNpdGx5IGZyZWVzIHRoZSBJUlEgYmVmb3JlIHRoZSBDRUMgYWRhcHRlciBpcyB1bnJlZ2lz
dGVyZWQKdG8gcHJldmVudCBhIHVzZS1hZnRlci1mcmVlIGlzc3VlLiBUaGlzIGFkZHJlc3NlcyBh
IEtBU0FOIHNsYWItdXNlLWFmdGVyLWZyZWUKcmVwb3J0IHRyaWdnZXJlZCBkdXJpbmcgZGV2aWNl
IHVuYmluZCB3aGVuIHRoZSBkZXZyZXMgcmVsZWFzZSBhY3Rpb24gZnJlZXMKdGhlIElSUS4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYwo+IGluZGV4
IDk1NDlkYWJkZTk0MWMuLjY3YTJhMjQyZDNjYTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jCj4gQEAgLTMwOSw2ICszMDksNyBAQCBzdGF0
aWMgdm9pZCBkd19oZG1pX2NlY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgCXN0cnVjdCBkd19oZG1pX2NlYyAqY2VjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7
Cj4gIAo+ICAJY2VjX25vdGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIoY2VjLT5ub3RpZnksIGNl
Yy0+YWRhcCk7Cj4gKwlkZXZtX2ZyZWVfaXJxKCZwZGV2LT5kZXYsIGNlYy0+aXJxLCBjZWMtPmFk
YXApOwoKRG9lcyB0aGlzIHNlcXVlbmNlIGNyZWF0ZSBhIHJhY2UgY29uZGl0aW9uIHRoYXQgY291
bGQgcmVzdWx0IGluIGFuIHVuaGFuZGxlZAppbnRlcnJ1cHQgc3Rvcm0/CgpUaGUgZHctaGRtaS1j
ZWMgZHJpdmVyIHNoYXJlcyB0aGlzIElSUSBsaW5lIHdpdGggdGhlIG1haW4gZHctaGRtaSBkcml2
ZXIuCkJ5IGZyZWVpbmcgdGhlIElSUSBoYW5kbGVyIGJlZm9yZSBjYWxsaW5nIGNlY191bnJlZ2lz
dGVyX2FkYXB0ZXIoKSwgdGhlCmhhcmR3YXJlIENFQyBpbnRlcnJ1cHRzIG1pZ2h0IHN0aWxsIGJl
IHVubWFza2VkIGFuZCBhY3RpdmUuCgpJZiB0aGUgQ0VDIGhhcmR3YXJlIGFzc2VydHMgYW4gaW50
ZXJydXB0IGR1cmluZyB0aGlzIHdpbmRvdywgdGhlIHNoYXJlZCBJUlEKbGluZSB3aWxsIGdvIGhp
Z2guIFRoZSByZW1haW5pbmcgaGFuZGxlcnMgb24gdGhhdCBsaW5lIHdvbid0IGNsZWFyIHRoZSBD
RUMKaW50ZXJydXB0LCByZXR1cm5pbmcgSVJRX05PTkUuCgpUaGlzIGNvdWxkIGxlYWQgdG8gYW4g
aW50ZXJydXB0IHN0b3JtLCBjYXVzaW5nIHRoZSBrZXJuZWwgdG8gcGVybWFuZW50bHkKZGlzYWJs
ZSB0aGUgc2hhcmVkIElSUSBsaW5lIGFuZCBicmVhayB0aGUgbWFpbiBkdy1oZG1pIGRyaXZlcidz
IGZ1bmN0aW9uYWxpdHkuCgpTaG91bGQgdGhlIENFQyBoYXJkd2FyZSBpbnRlcnJ1cHRzIGJlIGV4
cGxpY2l0bHkgbWFza2VkIGJlZm9yZQpkZXZtX2ZyZWVfaXJxKCkgaXMgY2FsbGVkPwoKPiAgCWNl
Y191bnJlZ2lzdGVyX2FkYXB0ZXIoY2VjLT5hZGFwKTsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxODE4MDIwNi4yNDgw
MTE5LTEtam9uYXNAa3dpYm9vLnNlP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
