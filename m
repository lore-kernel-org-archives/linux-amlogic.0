Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C1DC54766
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RajeA/565yYWF0/wats+B5cS7S5PjcMDMJd4cWPVUC8=; b=SDCFHEqqeLRtiv
	0JgnZFjP6OlLrhB0ewNZRQ6q21Rgysu0C68yeTYPTgwi64iB+p2sLOOybPxT5cnT8sTVbFDZK2cLl
	BGNsA+1Y6GTpznJ3EolSeihbrglpFl215EcKUsh5nuf1H1n9d6YP0FujABzih80sQMOWY3RTyXi33
	9xJTDhUvEfcbBqAJs2AMue7kr8jgSQiOcTUwRob1cLPoTvdXPU3k7DlZ8kJuDMR6OMT5wFhAWxRbP
	Q3zuI8LIefo9y9A/MWifanKcAtn4ZBfNSwzFmi4UPm8VNB4hMvi7FbZDheu+CX6M6b96DjbhCB5vD
	LZ7vjZgXkNy7qVw03vCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc07j-00000009rUS-3afd;
	Mon, 19 Feb 2024 09:39:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc07h-00000009rSf-1MOD;
	Mon, 19 Feb 2024 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708335579;
	bh=eNBh5JpwUZ0+jl/Gio0qtOi4bqHTZ3A6braWYxV+N2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N25pmdsXyywrOwI3pBlJJ9qyR2MkR8q6uB3CEdJxb22cjIEUTV3I/LsBj3+n52fsm
	 WJa1Zu7W/6w5Te2yZ3oDPsbgi6qLCuTVN6VlHN1voEp/+JOHxvd24ZA5UJyDDzsnv6
	 Wks3OSsVQItOebQ4HMoHnZUYw5dc36UsfbVewRU3xARO/xgW9NCApWwKJm49xOA5zR
	 71dN1CQjT9BRyCT+MT91hf0zmuyhOjEIliWrHS16NyE2XBJ6cwDskUyh2PtMDO7qKL
	 Xzl7p77dQahXD+X8d6BCOXdMaspzjqrOobTHhhXIZ1cjfuWWngoCf7vzSeaIH1SyOV
	 hwwazeNZPOWJQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2572237801C1;
	Mon, 19 Feb 2024 09:39:32 +0000 (UTC)
Message-ID: <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
Date: Mon, 19 Feb 2024 15:09:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
 <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013941_570969_5BA98FC2 
X-CRM114-Status: GOOD (  22.85  )
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

SGkgSGVsZW4sCgpPbiAwOS8wMi8yNCAyMzo1MSwgSGVsZW4gS29pa2Ugd3JvdGU6Cj4gCj4gCj4g
T24gMzAvMDEvMjAyNCAxMjowMywgVmlnbmVzaCBSYW1hbiB3cm90ZToKPj4gRm9yIG1lZGlhdGVr
IG10ODE3MywgdGhlIEdQVSBkcml2ZXIgaXMgcG93ZXJ2ciBhbmQgZm9yIG1lZGlhdGVrCj4+IG10
ODE4MywgdGhlIEdQVSBkcml2ZXIgaXMgcGFuZnJvc3QuIFNvIGFkZCBzdXBwb3J0IGluIGRybS1j
aSB0bwo+PiB0ZXN0IHBhbmZyb3N0IGFuZCBwb3dlcnZyIEdQVSBkcml2ZXIgZm9yIG1lZGlhdGVr
IFNPQ3MgYW5kIHVwZGF0ZQo+PiB4ZmFpbHMuIFBvd2VydnIgZHJpdmVyIHdhcyBtZXJnZWQgaW4g
bGludXgga2VybmVsLCBidXQgdGhlcmUncyBubwo+PiBtZWRpYXRlayBzdXBwb3J0IHlldC4gU28g
ZGlzYWJsZSB0aGUgbXQ4MTczLWdwdSBqb2Igd2hpY2ggdXNlcwo+PiBwb3dlcnZyIGRyaXZlci4K
Pj4KPj4gQWRkIHBhbmZyb3N0IHNwZWNpZmljIHRlc3RzIHRvIHRlc3RsaXN0IGFuZCBza2lwIEtN
UyB0ZXN0cyBmb3IKPj4gcGFuZnJvc3QgZHJpdmVyIHNpbmNlIGl0IGlzIG5vdCBhIG5vdCBhIEtN
UyBkcml2ZXIuIEFsc28gdXBkYXRlCj4+IHRoZSBNQUlOVEFJTkVSUyBmaWxlIHRvIGluY2x1ZGUg
eGZhaWxzIGZvciBwYW5mcm9zdCBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFZpZ25lc2gg
UmFtYW4gPHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4KPiAKPiBIaSBWaWduZXNoLCB0aGFu
a3MgZm9yIHlvdXIgd29yay4KPiAKPiBJJ20gc3RpbGwgd29uZGVyaW5nIGFib3V0IGEgZmV3IHRo
aW5ncywgcGxlYXNlIGNoZWNrIGJlbG93Lgo+IAo+PiAtLS0KPj4KPj4gdjI6Cj4+IMKgwqAgLSBB
ZGQgcGFuZnJvc3QgYW5kIFBWUiBHUFUgam9icyBmb3IgbWVkaWF0ZWsgU09DIHdpdGggbmV3IHhm
YWlscywgCj4+IGFkZCB4ZmFpbAo+PiDCoMKgwqDCoCBlbnRyeSB0byBNQUlOVEFJTkVSUy4KPiAK
PiBNYXliZSB3ZSBzaG91bGQgcmV2aWV3IGhvdyB0aGUgeGZhaWxzIGZhaWxlcyBhcmUgbmFtZWQu
IEkgdGhpbmsgdGhleSAKPiBzaG91bGQgc3RhcnQgd2l0aCB0aGUgRFJJVkVSX05BTUUgaW5zdGVh
ZCBvZiBHUFVfVkVSU0lPTi4KPiAKPiBGb3IgaW5zdGFuY2UsIGNvbnNpZGVyIHRoZSBmb2xsb3dp
bmcgam9iOgo+IAo+IG1lZGlhdGVrOm10ODE4My1ncHU6Cj4gIMKgIGV4dGVuZHM6Cj4gIMKgwqDC
oCAtIC5tdDgxODMKPiAgwqAgdmFyaWFibGVzOgo+ICDCoMKgwqAgR1BVX1ZFUlNJT046IG1lZGlh
dGVrLW10ODE4My1ncHUKPiAgwqDCoMKgIERSSVZFUl9OQU1FOiBwYW5mcm9zdAo+IAo+IEFuZCB3
ZSBoYXZlIG1lZGlhdGVrLW10ODE4My1ncHUtc2tpcHMudHh0Cj4gCj4gSWYgdGhlcmUgaXMgYW4g
ZXJyb3IsIHdlIHdhbnQgdG8gbm90aWZ5IHRoZSBwYW5mcm9zdCBkcml2ZXIgbWFpbnRhaW5lcnMg
Cj4gKGFuZCBtYXliZSBub3QgdGhlIG1lZGlhdGVrIGRyaXZlciBtYWludGFpbmVycyksIHNvIE1B
SU5UQUlORVJTIGZpbGUgCj4gZG9lc24ndCBjb3JyZXNwb25kIHRvIHRoaXMuCgpBZ3JlZS4KCj4g
Cj4gSG93IGFib3V0IGEgbmFtaW5nIDxkcml2ZXIgbmFtZT5fPGhhcmR3YXJlL2dwdT5fPHR5cGU6
IGdwdS9kaXNwbGF5PiA/Cj4gCj4gcG93ZXJ2cl9tZWRpYXRlay1tdDgxNzNfZ3B1LXNraXB0cy50
eHQKPiBtZWRpYXRla19tZWRpYXRlay1tdDgxNzNfZGlzcGxheS1za2lwdHMudHh0Cj4gcGFuZnJv
c3RfbWVkaWF0ZWstbXQ4MTgzX2dwdS1za2lwcy50eHQKPiBtZWRpYXRla19tZWRpYXRlay1tdDgx
ODNfZGlzcGxheS1za2lwcy50eHQKPiAuLi4KPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KClllcyB3
ZSBjYW4ga2VlcCB0aGlzIG5hbWluZy4gSW4gdGhpcyBjYXNlIGRvIHdlIHN0aWxsIG5lZWQgZ3B1
L2Rpc3BsYXkgCmluIHRoZSB4ZmFpbHMgZmlsZSBuYW1lPwoKUmVnYXJkcywKVmlnbmVzaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
