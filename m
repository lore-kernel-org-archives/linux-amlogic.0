Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F420FC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u82CUPtbZj862obF2t4QQBhKfE+8Velu3mGs1M91y3Y=; b=Xg9KluQHAYgrZR
	GlydTDy8pf9a3W9q4XkgGAn/w4WVnkGJpPfPOlQgvWU2GLSnKyP11usyXu4uhisTs69ARF/ijoEuZ
	e1+bylm/ngtR9SiJK3WmCpYKTkB3lVpChkT1R+EHFQl5GViax4kEARIDSOHJ63ESyEO6CdeGZ86it
	t7CKURs7gNys1xOkBhypledogganK6dAirY3EdFVnCYD54qjtitlI8WeYxJvhSTyZppAskkw+9VBW
	ovi3AU1HCQIy5OJ7wyQiaU8XUbdLUZSVSMsr6O2Gmie9+SSMTG86GCtsAk7TO7Zs19/IUFu5D2/Ax
	/merGXHpTWIbPGtfP40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oviZe-00GKlQ-W6; Thu, 17 Nov 2022 17:21:15 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oviZX-00GKg3-Gk
	for linux-amlogic@lists.infradead.org; Thu, 17 Nov 2022 17:21:13 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20221117172102euoutp021a4ea26cf32ea11601d35c8eae0ea2e5~obvWEDxJ22477024770euoutp02H
	for <linux-amlogic@lists.infradead.org>; Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20221117172102euoutp021a4ea26cf32ea11601d35c8eae0ea2e5~obvWEDxJ22477024770euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1668705662;
	bh=OBdjvppofbrHpcjkB2q+hZRYF4eQluWAk63w8IeXgwk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=W/8mv8BRhW8qdxW77ar3Q4D3Dy7JKVcM4qSuIZTlIuSadtLUJI5pZUiCnId3wiK7T
	 sjrUZAdP/niKALv8PZhb85VqQ1nh/CGnXpetNULmJiteywOiViRHs2CbIzWPWlGqmg
	 jeSNw+iyLv1YR/mzc1GF4NjGlgPMkXkR7Rzn1Le4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20221117172102eucas1p15b629fde0b21d796394d38d0b9d8deef~obvV01Y2W0749307493eucas1p1C;
	Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id BF.D2.09549.E7D66736; Thu, 17
	Nov 2022 17:21:02 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20221117172102eucas1p26838f21d9155f10aa8bae7ebaf540cb0~obvVgyD4e1896018960eucas1p2F;
	Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20221117172102eusmtrp21425acd6791c50bd6e08d56f067e5049~obvVfVmD10726407264eusmtrp2k;
	Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-61-63766d7ef4d3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id C4.7D.09026.D7D66736; Thu, 17
	Nov 2022 17:21:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20221117172101eusmtip2bddec874931c2796f240d1b5e61e66e3~obvU0xgx62650126501eusmtip2c;
	Thu, 17 Nov 2022 17:21:01 +0000 (GMT)
Message-ID: <81399603-6253-b671-85c7-373f196b73ed@samsung.com>
Date: Thu, 17 Nov 2022 18:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [v2,5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
	airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-rpi-kernel
	<linux-rpi-kernel@lists.infradead.org>, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87p1uWXJBmuOC1ucuL6IyWLhw7vM
	Fv+3TWS2uPL1PZvFwmnLGS0WzOa2mHh7A7vFwo9bWSzaOpexWmx5M5HVgctj77cFLB47Z91l
	99i0qpPNY97JQI/73ceZPDYvqfd4v+8qm8fm09UBHFFcNimpOZllqUX6dglcGfNOPmUpOCxQ
	0bP7AlsD41neLkYODgkBE4lHNzW7GLk4hARWMEo0bF7ACOF8YZTYsGIjO4TzmVHi7sozzF2M
	nGAdz7bsZgGxhQSWM0rs/lwFUfSRUeLR6xmMIAleATuJh6cPsYGsYBFQlfi5UwMiLChxcuYT
	sF5RgRSJhVtuMIHYwgIJEt8mfgJrZRYQl7j1ZD5YXERgHqPE4h8JIPOZBVYzSqzc8I4NJMEm
	YCjR9bYLzOYUsJZY9WIGK0SzvETz1tnMIA0SAt2cEjNvdjJCXO0isWDueXYIW1ji1fEtULaM
	xP+dINtAGtoZJRb8vg/lTACGxvNbUN3WEnfO/QJ7h1lAU2L9Ln2IsKPEgl3d7JCA5JO48VYQ
	4gg+iUnbpjNDhHklOtqEIKrVJGYdXwe39uCFS8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeW
	FuempxYb56WW6xUn5haX5qXrJefnbmIEJq7T/45/3cG44tVHvUOMTByMhxglOJiVRHhzL5Ym
	C/GmJFZWpRblxxeV5qQWH2KU5mBREudlm6GVLCSQnliSmp2aWpBaBJNl4uCUamDiyNh+pv/5
	3+x69ZLA21/Wz/9tO6Wi+f7+nmMph5hueMXV9E9jaFfds/+LGBc3Z90GeT7t1U4WPNv2nhad
	/GhR0t/OVdPc2LxsmE4ekEhTvrOyU6Z1l0Kw+vaS23PXS4oe4d1x+Md7hlCHhbvY/TJl9UP3
	v+xQO7gwIc4jbJ6H+beiJWUslxNNKoLuy2+8VFPH/vKRUsNejprrrotDw+T0Q341M/x+nz33
	78QZzFPKqvszXabMcj6poV/imb1V8MGfE0vnlG7ruR+87cQTXv8m3viq4JNX3jZ3T96c5t9u
	d7Xz1ex3y88XlPzyuVU/N23J7h11jC4rbDpMuJ98XdF30vjz2ckRtvZTfmsvnzdPiaU4I9FQ
	i7moOBEA+7oyJMsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7q1uWXJBjv/WlmcuL6IyWLhw7vM
	Fv+3TWS2uPL1PZvFwmnLGS0WzOa2mHh7A7vFwo9bWSzaOpexWmx5M5HVgctj77cFLB47Z91l
	99i0qpPNY97JQI/73ceZPDYvqfd4v+8qm8fm09UBHFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
	ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GfNOPmUpOCxQ0bP7AlsD41neLkZODgkBE4ln
	W3azdDFycQgJLGWUeP73GTNEQkbi5LQGVghbWOLPtS42iKL3jBKrb/0CS/AK2Ek8PH0IKMHB
	wSKgKvFzpwZEWFDi5MwnLCBhUYEUiXVHokDCwgIJEt8mfmIEsZkFxCVuPZnPBDJSRGAeo8SV
	4xcYQRxmgdWMEn/+9zJCLPvEKNF68DVYC5uAoUTXW5ArODk4BawlVr2YwQoxykyia2sX1Fh5
	ieats5knMArNQnLILCQbZyFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAaN12
	7OeWHYwrX33UO8TIxMF4iFGCg1lJhDf3YmmyEG9KYmVValF+fFFpTmrxIUZTYGBMZJYSTc4H
	pou8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmz63ps61DXpqq
	FH5pUJkx3dopXnZZY03wUe2f5+2tY+fXZu7q3TFfK/JXfOr5VWXVMWvZWJl74nX4rcL8nlQW
	MHz9w3/4B+OT+ClFkVPXdn9/xXddj9frqo2oVWdrwfrPhpzT7Dwv888/8CO++YTMTHbDl7KN
	LlUs1x9Kdepq1Z+6LnvWV8Uzr2qZ9LTs0PzYJ48Yttzw9NvyiuF8n7zZ1qdirB6FK57ZvbO7
	eWHuNFfv8seBNiGsYlUaU+bejVpZdPyPeFV7ZLDr9DMpXzpjBCvSn1cdvHbl/r4H+Xy3TY/d
	T1uzr0pGd4Jlx7f43dpSrKxXpvmcma71d632gjmdsw5r3zvKeV5zt/SSo3ZKLMUZiYZazEXF
	iQCl4/vaXwMAAA==
X-CMS-MailID: 20221117172102eucas1p26838f21d9155f10aa8bae7ebaf540cb0
X-Msg-Generator: CA
X-RootMTR: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
References: <20221115115819.23088-6-tzimmermann@suse.de>
	<CGME20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33@eucas1p2.samsung.com>
	<ee076724-cee3-cd6a-de44-191e058fddbb@samsung.com>
	<1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_092108_210838_672E7080 
X-CRM114-Status: GOOD (  12.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTcuMTEuMjAyMiAxNzowNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gQW0gMTcuMTEu
MjIgdW0gMTM6NTcgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+PiBPbiAxNS4xMS4yMDIyIDEy
OjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+IFNjaGVkdWxlIHRoZSBkZWZlcnJlZC1J
L08gd29ya2VyIGluc3RlYWQgb2YgdGhlIGRhbWFnZSB3b3JrZXIgYWZ0ZXIKPj4+IHdyaXRpbmcg
dG8gdGhlIGZiZGV2IGZyYW1lYnVmZmVyLiBUaGUgZGVmZXJyZWQtSS9PIHdvcmtlciB0aGVuIHBl
cmZvcm1zCj4+PiB0aGUgZGlydHktZmIgdXBkYXRlLiBUaGUgZmJkZXYgZW11bGF0aW9uIHdpbGwg
aW5pdGlhbGl6ZSBkZWZlcnJlZCBJL08KPj4+IGZvciBhbGwgZHJpdmVycyB0aGF0IHJlcXVpcmUg
ZGFtYWdlIHVwZGF0ZXMuIEl0IGlzIHRoZXJlZm9yZSBhIHZhbGlkCj4+PiBhc3N1bXB0aW9uIHRo
YXQgdGhlIGRlZmVycmVkLUkvTyB3b3JrZXIgaXMgcHJlc2VudC4KPj4+Cj4+PiBJdCB3b3VsZCBi
ZSBwb3NzaWJsZSB0byBwZXJmb3JtIHRoZSBkYW1hZ2UgaGFuZGxpbmcgZGlyZWN0bHkgZnJvbSAK
Pj4+IHdpdGhpbgo+Pj4gdGhlIHdyaXRlIG9wZXJhdGlvbi4gQnV0IGRvaW5nIHRoaXMgY291bGQg
aW5jcmVhc2UgdGhlIG92ZXJoZWFkIG9mIHRoZQo+Pj4gd3JpdGUgb3IgaW50ZXJmZXJlIHdpdGgg
YSBjb25jdXJyZW50bHkgc2NoZWR1bGVkIGRlZmVycmVkLUkvTyB3b3JrZXIuCj4+PiBJbnN0ZWFk
LCBzY2hlZHVsaW5nIHRoZSBkZWZlcnJlZC1JL08gd29ya2VyIHdpdGggaXRzIHJlZ3VsYXIgZGVs
YXkgb2YKPj4+IDUwIG1zIHJlbW92ZXMgbG9hZCBvZmYgdGhlIHdyaXRlIG9wZXJhdGlvbiBhbmQg
YWxsb3dzIHRoZSBkZWZlcnJlZC1JL08KPj4+IHdvcmtlciB0byBoYW5kbGUgbXVsdGlwbGUgd3Jp
dGUgb3BlcmF0aW9ucyB0aGF0IGFycml2ZWQgZHVyaW5nIHRoZSAKPj4+IGRlbGF5Cj4+PiB0aW1l
IHdpbmRvdy4KPj4+Cj4+PiB2MjoKPj4+IMKgwqDCoMKgKiBrZWVwIGRybV9mYl9oZWxwZXJfZGFt
YWdlKCkgKERhbmllbCkKPj4+IMKgwqDCoMKgKiB1c2UgZmJfZGVmZXJyZWRfaW9fc2NoZWR1bGVf
Zmx1c2goKSAoRGFuaWVsKQo+Pj4gwqDCoMKgwqAqIGNsYXJpZnkgY29tbWVudHMgKERhbmllbCkK
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+Pgo+PiBUaGlzIHBhdGNoLCBtZXJnZWQgaW50byB0b2RheSdzIGxpbnV4LW5leHQgYXMg
Y29tbWl0IDdmNWNjNGEzZTVlNAo+PiAoImRybS9mYi1oZWxwZXI6IFNjaGVkdWxlIGRlZmVycmVk
LUkvTyB3b3JrZXIgYWZ0ZXIgd3JpdGluZyB0bwo+PiBmcmFtZWJ1ZmZlciIpLCB0cmlnZ2VycyBh
IGZvbGxvd2luZyB3YXJuaW5nIG9uIFJhc3BiZXJyeSBQaSAzICYgNCBhcwo+PiB3ZWxsIGFzIGFs
bCBBbWxvZ2ljIE1lc29uIEcxMkEvQiBiYXNlZCBib2FyZHM6Cj4+Cj4+IC0tLS0tLS0tLS0tLVsg
Y3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+PiBXQVJOSU5HOiBDUFU6IDAgUElEOiAyMjAgYXQgZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmM6MzQwCj4KPiBUaGFuayB5b3Ugc28gbXVj
aCBmb3IgcmVwb3J0aW5nLiBUaGF0IGxpbmUgc2hvdWxkIG5ldmVyIGJlIGV4ZWN1dGVkIAo+IHdp
dGggdmM0IGV0IGFsLgo+Cj4gSWYgeW91IGhhdmUgdGhlIHRpbWUsIGNvdWxkIHlvdSBwbGVhc2Ug
dHJ5IHRoZSBhdHRhY2hlZCBwYXRjaCBhbmQgCj4gcmVwb3J0IHRoZSByZXN1bHRzLiBUaGFua3Mg
YSBsb3QuCgpUaGlzIGZpeGVzIHRoZSBpc3N1ZSBvYnNlcnZlZCBvbiBteSBSYXNwYmVycnkgUGkg
My80IGFuZCBBbWxvZ2ljIE1lc29uIApiYXNlZCBib2FyZHMuIEZlZWwgZnJlZSB0byBhZGQ6CgpU
ZXN0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KCkJl
c3QgcmVnYXJkcwoKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1
dGUgUG9sYW5kCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
