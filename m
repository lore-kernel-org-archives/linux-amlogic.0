Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5515ECD4F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 23:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWsxqKJLI28Z4xBtiDAz/aIsWNvTBHhaCY8Am4cBoXw=; b=YJS14uQDkffUGG
	oLrV7nPUXiowUdKqYNQOIzivHG9mKoPLDx5Mkqlaslmdwr3F2/G9dZVJunLGLwEK2p+WR+F4TdV4n
	13zvSPURVr9h3mMajrK0kwfeoxIlLJzA2MyGa5ll8QHU0n1ItK7/tI/iSC/cQSh0YtkAy87AS7LT/
	InxjR0cfOHMD38cHzzkYoPri4HdopZD/r9piFFsJpQ0U3Xnmx25Qm/U4WayGqUPb279EvUsblElOm
	t3S2jG2AVQvuEvPbxff0mZkEJDgoCkjr1rau5E1jOSXJTbKjnHkpkyNEaVZFIkhGv3Uu+BGATl5+H
	BbUCtQYbOzBNFRGAG6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJFk-0000000459s-1NCT;
	Wed, 13 May 2026 23:44:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJFj-0000000459I-0Fl0
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 23:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2229860052;
	Wed, 13 May 2026 23:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0A0C19425;
	Wed, 13 May 2026 23:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715873;
	bh=e8J6P8spAZypS3Lm4Cbbib+cfuktCXJtm+vAKlnXz20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CMJ6j6lwWbat34XmCBe2BnFSf1xhKmSrZ2/AThW/l37/kwla7ZH6Jrm49KuRacH26
	 7pD39E/s1iyQlYhUdAFcL1Ho4il5O3u5rU+wF9wMJ/CHto2U819+2c2loYMlNR80Dj
	 HwGPxVL3SI/XSZLaVxe4p1MLq4O9PrhNtAlcUYvWjl4JSea7D6m4lAINPsR2G4gkBs
	 UnBuJdWlbBFE4hHJkHKMVj0WAFYCRtHhjydgnyyBH1FdiE8A9XwtU7KZEewzkgKnps
	 n/aGD5F7dCWPrq1ufxB3sBJ4SESeWA7/WuSmLL5miJQhymFKtw+BQliafQjrAR7ZOE
	 bk1DteMHqsFYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
Date: Wed, 13 May 2026 23:44:32 +0000
Message-Id: <20260513234433.7D0A0C19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGNvbW1pdCBw
cm92aWRlcyBhbiBpbmNvbXBsZXRlIGZpeCBieSByZXNvbHZpbmcgbWlzc2luZyBwaW4gZ3JvdXAg
c3VmZml4ZXMgZm9yIGBwd21fYW9fY2AgYnV0IG92ZXJsb29raW5nIGlkZW50aWNhbCBidWdzIGZv
ciBgcHdtX2FvX2dgLCBgcHdtX2FvX2hgLCBhbmQgYHB3bV92c2AgaW4gdGhlIHNhbWUgZGV2aWNl
IHRyZWUgZmlsZS4KLS0KCmNvbW1pdCA0NWIyOTgyMzdiODFjZjkxYTNjMDJjYzA4MjM3YzgwZTYz
NTZkMzA4CkF1dGhvcjogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+
Cgphcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogRml4IHB3bV9hb19jIHBpbm11eCBkZWZpbml0aW9u
cwoKVGhlIHB3bV9hb19jIHBpbiBub2RlIHdhcyBpbmNvbXBsZXRlOiBpdCB3YXMgbWlzc2luZyB0
aGUgZ3JvdXAgbmFtZQpzdWZmaXgsIGNvbmZsYXRpbmcgdHdvIGRpc3RpbmN0IHBpbiBncm91cHMg
KHB3bV9hb19jX2QgYW5kIHB3bV9hb19jX2UpCmludG8gYSBzaW5nbGUsIGFtYmlndW91cyBlbnRy
eS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gaW5k
ZXggN2ZlNzJjOTRlZDYyMy4uNjJmNmI5YmFhZDI4YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+IEBAIC00MDAsOSArNDAwLDE3IEBAIG11eCB7
Cj4gIAkJCQkJfTsKPiAgCQkJCX07Cj4gIAo+IC0JCQkJcHdtX2FvX2NfcGluczogcHdtLWFvLWMg
ewo+ICsJCQkJcHdtX2FvX2NfZF9waW5zOiBwd20tYW8tYy1kIHsKPiAgCQkJCQltdXggewo+IC0J
CQkJCQlncm91cHMgPSAicHdtX2FvX2MiOwo+ICsJCQkJCQlncm91cHMgPSAicHdtX2FvX2NfZCI7
CgpTaG91bGQgd2UgYWxzbyBmaXggdGhlIHJlZ3Jlc3Npb25zIGZvciBwd21fYW9fZywgcHdtX2Fv
X2gsIGFuZCBwd21fdnMgaW4KdGhpcyBjb21taXQ/CgpJbiB0aGlzIHNhbWUgZGV2aWNlIHRyZWUg
ZmlsZSwgcHdtX2FvX2dfcGlucywgcHdtX2FvX2hfcGlucywgYW5kIHB3bV92c19waW5zCmFyZSBk
ZWZpbmVkIHVzaW5nIHRoZSBzYW1lIGdlbmVyaWMgc3RyaW5nIHBhdHRlcm46CgphcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpOgoJCQkJcHdtX2FvX2dfcGluczogcHdt
LWFvLWcgewoJCQkJCW11eCB7CgkJCQkJCWdyb3VwcyA9ICJwd21fYW9fZyI7CgkJCQkJCWZ1bmN0
aW9uID0gInB3bV9hb19nIjsKCQkJCQkJYmlhcy1kaXNhYmxlOwoJCQkJCX07CgkJCQl9OwoKSW4g
ZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy10Ny5jLCB0aGVzZSBnZW5lcmlj
IGdyb3VwcyBkbyBub3QKZXhpc3QgYXMgdmFsaWQgcGluIGFycmF5cy4gVGhlIGRyaXZlciBvbmx5
IGRlZmluZXMgc3VmZml4ZWQgdmFyaWFudHMgbGlrZQpwd21fYW9fZ19kMTEsIHB3bV9hb19nX2Q3
LCBwd21fYW9fZ19lLCBwd21fYW9faF9kNSwgcHdtX2FvX2hfZDEwLCBwd21fdnNfeSwKYW5kIHB3
bV92c19oLgoKSWYgYW55IGZ1dHVyZSBvciBvdXQtb2YtdHJlZSBib2FyZCB0cmllcyB0byB1c2Ug
dGhlc2UgZXhpc3Rpbmcgbm9kZXMsIHdvbid0Cml0IHJlc3VsdCBpbiBhIHBpbmN0cmwgbG9va3Vw
IGZhaWx1cmUgYXQgcnVudGltZT8KCj4gKwkJCQkJCWZ1bmN0aW9uID0gInB3bV9hb19jIjsKPiAr
CQkJCQkJYmlhcy1kaXNhYmxlOwo+ICsJCQkJCX07Cj4gKwkJCQl9Owo+ICsKPiArCQkJCXB3bV9h
b19jX2VfcGluczogcHdtLWFvLWMtZSB7Cj4gKwkJCQkJbXV4IHsKPiArCQkJCQkJZ3JvdXBzID0g
InB3bV9hb19jX2UiOwo+ICAJCQkJCQlmdW5jdGlvbiA9ICJwd21fYW9fYyI7Cj4gIAkJCQkJCWJp
YXMtZGlzYWJsZTsKPiAgCQkJCQl9OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxMi1hZGQta3ZpbTQtc3lzbGVkLXYxLTAtNzE3
ODcxOWE0M2U3QGFsaWVsLmZyP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
