Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685DFCA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZHTFX8TVDarI+St2hE9ojEGVey8H6AQ/huQ7OuGOT0=; b=GZffda+6rqcHU9
	1mWms2gXcb7G2BwGYSP03JuRAsq8aPP5/EHn3MhponUgiHK0F1zDwqbtxTxfXR+5rKUmJYQwVND1F
	kndsVMymd+GKICQpZJwnQ6DK4M2u10NaKn5R0bopaTQYqyIBSrkchhihF7rbJuXt8NdLZUnhTRCX6
	YdtdQlzXBq05hXvxzJidkilQtZqz8kv3SsxS+ffjPKcfShMGF9cgzYHIlvYqGJdJ0ec1MtLd3QsxY
	LzLfrPeg/OIger1GmJqR5x1poAC7uot9Te5ADQ9BL12Msd7ZI6D6lSK4xiyCmHQPCUa0Ywj1mIJoQ
	JehddTSSPOZmNW8Hg17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1OW-00000005OjL-3raX;
	Fri, 09 Oct 2026 03:35:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1OV-00000005Oit-2qvL
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:35:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD7A341AB3;
	Fri,  9 Oct 2026 03:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8521F000FF;
	Fri,  9 Oct 2026 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516937;
	bh=vn9xLqecG/iJznrV55TfoGAVffj2F69FusTLuIK7Xls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V0X3Y28fW+NHoq3RweDwuh2RQ5ci7ttmF+8NvGWIsHuWWtRy7Kpz4wLs5AQ0eTGA1
	 QvzMAicJlOVtP7pw+XgWOiuHYkKLc9OFISe4qAuFIzuAH4z6MY+Jvl7AQoi+eMEunJ
	 kqugpYApkOO4g8lTgOSGyECrmSsUWokow2TE1RzQ7qM6iZ9KG/v0tMCQWqf1FmXGKI
	 G6KvqWM2YF2Rd0eeaFxt5oV6NIchiT1pxEIptWcLcQa2gGNdY2+0UILZwhZARpmPon
	 AXPRHNs3wG8PdipIJgsOjSsjj0iKKDz3A2Ajt7B+DTIaSg0JVK/q5G9Yo8d70OVPRq
	 ymBSzpvFZPj2Q==
Message-ID: <sashiko-outbox-164777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/20] drm/msm/dp: Unwind resources when enabling a
 stream fails
To: "Xilin Wu" <sophon@radxa.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:35:36 +0000
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBtOiBwbV9ydW50aW1l
IHJlZmVyZW5jZSBsZWFrIGluIG1zbV9kcF9icmlkZ2VfZGV0ZWN0KCkKLSBbTWVkaXVtXSBkcm0v
bXNtL2RwOiBkZWFkIGNvZGUgaW4gc3RyZWFtIGVuYWJsZSBhYm9ydCBwYXRoIGR1ZSB0byBzaW5r
X2NvdW50IGludmFyaWFudAotLQoKY29tbWl0IGFlZWM3ZWI0YTU1Mjc2Mjk2NDAwMTFjYmE4OWQ3
YmJhYWY5MDM0MWMKQXV0aG9yOiBYaWxpbiBXdSA8c29waG9uQHJhZHhhLmNvbT4KU3ViamVjdDog
ZHJtL21zbS9kcDogVW53aW5kIHJlc291cmNlcyB3aGVuIGVuYWJsaW5nIGEgc3RyZWFtIGZhaWxz
CgpUaGlzIHBhdGNoIGludHJvZHVjZXMgcmVzb3VyY2UgdW53aW5kaW5nIGZvciBzdHJlYW0gZW5h
YmxlIGZhaWx1cmVzIGJ5IHRyYWNraW5nCnRoZSBzdHJlYW0gUE0gcmVmZXJlbmNlIGFuZCBtYWlu
bGluayBzdGFydHVwIHN0YXR1cy4gSXQgdW5pZmllcyB0aGUgcm9sbGJhY2sKcGF0aHMgYW5kIHBy
b3BhZ2F0ZXMgZXJyb3JzIGZyb20gUEhZIGluaXRpYWxpemF0aW9uLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RwL2RwX2Rpc3BsYXkuYwo+IGluZGV4IDc4N2VmYmNiNmMxMjQuLmIwNzZkNDRiNTExOGMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+IEBAIC05ODgsNiArMTAxNCw3IEBA
IGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgbXNtX2RwX2JyaWRnZV9kZXRlY3Qoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwKPiAgCj4gIAkJcHV0ID0gdHJ1ZTsKPiAgCX0KPiArdW5sb2NrOgo+
ICAJbXV0ZXhfdW5sb2NrKCZwcml2LT5wbHVnZ2VkX2xvY2spOwo+ICAKPiAgCWlmIChwdXQpCj4g
IAkJcG1fcnVudGltZV9wdXRfc3luYygmZHAtPnBkZXYtPmRldik7CgpbU2V2ZXJpdHk6IEhpZ2hd
CkRvZXMgbXNtX2RwX2JyaWRnZV9kZXRlY3QoKSBsZWFrIGEgUE0gcnVudGltZSByZWZlcmVuY2Ug
aGVyZT8KCm1zbV9kcF9icmlkZ2VfZGV0ZWN0KCkgdW5jb25kaXRpb25hbGx5IGNhbGxzIHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQoKQplYXJsaWVyIGluIHRoZSBmdW5jdGlvbi4gSWYgdGhlIGRp
c3BsYXkgaXMgYWxyZWFkeSBjb25uZWN0ZWQgKHByaXYtPnBsdWdnZWQKaXMgdHJ1ZSksIHRoZSBl
eGl0IHBhdGggc2tpcHMgc2V0dGluZyBwdXQgPSB0cnVlLiAKCkFzIGEgcmVzdWx0LCBwbV9ydW50
aW1lX3B1dF9zeW5jKCkgaXMgbmV2ZXIgY2FsbGVkLCB3aGljaCBsZWFrcyB0aGUgUE0KcmVmZXJl
bmNlLiBTaW5jZSB1c2Vyc3BhY2UgY2FuIHBvbGwgdGhlIGRldGVjdCBjYWxsYmFjayByZXBlYXRl
ZGx5CihlLmcuLCB2aWEgRFJNX0lPQ1RMX01PREVfR0VUQ09OTkVDVE9SKSwgY291bGQgdGhpcyBs
ZWFrIHRoZSBQTSByZWZlcmVuY2UKaW5kZWZpbml0ZWx5IGFuZCBwZXJtYW5lbnRseSBwcmV2ZW50
IHRoZSBkZXZpY2UgZnJvbSBzdXNwZW5kaW5nPwoKWyAuLi4gXQoKPiBAQCAtMTQ2MCw2ICsxNDkz
LDUyIEBAIHZvaWQgbXNtX2RwX2Rpc3BsYXlfYXRvbWljX3ByZV9lbmFibGUoc3RydWN0IG1zbV9k
cCAqbXNtX2RwX2Rpc3BsYXksCj4gIAltc21fZHBfZGlzcGxheV9zZXRfbW9kZShtc21fZHBfZGlz
cGxheSwgJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGUsIGRwLT5wYW5lbCk7Cj4gIH0KPiAgCj4g
K3N0YXRpYyB2b2lkIG1zbV9kcF9kaXNwbGF5X2Fib3J0X2VuYWJsZV9sb2NrZWQoc3RydWN0IG1z
bV9kcF9kaXNwbGF5X3ByaXZhdGUgKmRwKQo+ICt7Cj4gKwlib29sIGtlZXBfYXV4Owo+ICsJaW50
IHJldDsKPiArCj4gKwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZkcC0+cGx1Z2dlZF9sb2NrKTsKPiAr
Cj4gKwlrZWVwX2F1eCA9ICFkcC0+bXNtX2RwX2Rpc3BsYXkuaXNfZWRwICYmIGRwLT5wbHVnZ2Vk
ICYmCj4gKwkJbXNtX2RwX2F1eF9pc19saW5rX2Nvbm5lY3RlZChkcC0+YXV4KTsKPiArCj4gKwlp
ZiAoZHAtPnN0cmVhbV9saW5rX2F0dGVtcHRlZCkgewo+ICsJCS8qIFRoZSBBVVggcGVlciBpcyB0
aGUgcmVtYWluaW5nIGRvbmdsZSwgbm90IGl0cyBhYnNlbnQgc2luay4gKi8KPiArCQlpZiAoa2Vl
cF9hdXggJiYgIWRwLT5saW5rLT5zaW5rX2NvdW50ICYmIGRwLT5waHlfaW5pdGlhbGl6ZWQpCj4g
KwkJCW1zbV9kcF9saW5rX3BzbV9jb25maWcoZHAtPmxpbmssICZkcC0+cGFuZWwtPmxpbmtfaW5m
bywgdHJ1ZSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KSXMgdGhpcyBQb3dlciBTYXZlIE1vZGUgKFBT
TSkgY29uZmlndXJhdGlvbiBibG9jayB1bnJlYWNoYWJsZT8KClRoZSBjb25kaXRpb24gIWRwLT5s
aW5rLT5zaW5rX2NvdW50IGlzIGV2YWx1YXRlZCBpbnNpZGUgdGhlCmlmIChkcC0+c3RyZWFtX2xp
bmtfYXR0ZW1wdGVkKSBibG9jay4gSG93ZXZlciwgZHAtPnN0cmVhbV9saW5rX2F0dGVtcHRlZApp
cyBvbmx5IHNldCB0byB0cnVlIGluIG1zbV9kcF9kaXNwbGF5X3ByZXBhcmVfbGlua19sb2NrZWQo
KSBpZgpkcC0+bGluay0+c2lua19jb3VudCBpcyBub24temVyby4gCgpCZWNhdXNlIGJvdGggbXNt
X2RwX2Rpc3BsYXlfcHJlcGFyZV9saW5rX2xvY2tlZCgpIGFuZCAKbXNtX2RwX2Rpc3BsYXlfYWJv
cnRfZW5hYmxlX2xvY2tlZCgpIGV4ZWN1dGUgc2VxdWVudGlhbGx5IHdpdGhpbiB0aGUgc2FtZSAK
cGx1Z2dlZF9sb2NrIGNyaXRpY2FsIHNlY3Rpb24gaW4gbXNtX2RwX2Rpc3BsYXlfYXRvbWljX2Vu
YWJsZSgpLCBjb25jdXJyZW50CkhQRCBldmVudHMgY2Fubm90IG1vZGlmeSBzaW5rX2NvdW50LgoK
RG9lc24ndCB0aGlzIG1lYW4gdGhlIGlubmVyIGNoZWNrICFkcC0+bGluay0+c2lua19jb3VudCB3
aWxsIGFsd2F5cyBldmFsdWF0ZQp0byBmYWxzZSwgcmVuZGVyaW5nIHRoaXMgZmFsbGJhY2sgZGVh
ZCBjb2RlPwoKPiArCj4gKwkJbXNtX2RwX2N0cmxfb2ZmX3BpeGVsX2NsayhkcC0+Y3RybCk7Cj4g
KwkJbXNtX2RwX2N0cmxfb2ZmX2xpbmsoZHAtPmN0cmwsIGRwLT5wYW5lbCk7Cj4gKwkJZHAtPnN0
cmVhbV9saW5rX2F0dGVtcHRlZCA9IGZhbHNlOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOS1tc20tZHAtaGRyMTAtdjItMC0x
ODM1ZDQ5NjZkYTNAcmFkeGEuY29tP3BhcnQ9OQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
