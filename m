Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365CC4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtSu6ojnG6qBTPU422n+0HPvoQTQ7LJd5uBFNxp8rGo=; b=lu6AbTrAGSv1m/
	q0ZIR+RMWQl2vW6Blk1L+vVEynE3Nc9JOVwhHbvkXM3dtQlvRi0vE3EMvscDVWqgcWfJxqn4W/sE0
	TBM/fwGN0eOGCWAAOgtDfaHw9dCav5pIotDFCM+4PPKSC+uTuc3gwPH1gJanS6siU8L8Iuzzvjh0J
	3CsnYQCdi8NURgJhNwuj1c7v5TV1JMK9IiTTLwgzKb3umI8VLMZYHsqxz0Zh1Xq47nx6mWxeKvMGg
	4VSTXI9FPmorM0uPDCyfiqPrgR4dbcYd3edfSWBwIDrE4aIt4eJ/mJWpm2eu2HrqDLbKVAWDyn9z1
	vwJRPwRFMdSQab4BBJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CBS-003roO-5z; Mon, 05 Dec 2022 14:11:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CBP-003rlH-5i
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 14:11:01 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20221205141044euoutp0282a76801dd6b981b24b5723b5e9732c0~t6wUepZ1i2259422594euoutp02O
	for <linux-amlogic@lists.infradead.org>; Mon,  5 Dec 2022 14:10:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20221205141044euoutp0282a76801dd6b981b24b5723b5e9732c0~t6wUepZ1i2259422594euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1670249444;
	bh=1FnWs5NlhK/IcYzuuu1bSm04a7tkIdV5CeIDyp4i0Pk=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=XF4Ye/nl1Fu1JkBLzfNnCyBdryD4ShLUgmp1Fvdus/0+WYGyO6267jgPlKr73joIm
	 iCtIuzrrMXMi/sN1mjHa7N5yLzt+3pg7uFHb3yOuYRfgcS8wrgsZ1tlRXkjUVG0q72
	 ciMNQTZlfxYLgoEyoWd8YDSfkLf1Xx8E5S1pR+zc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20221205141043eucas1p23b100143b3189778ddde93f5e5b1e2a3~t6wULfbIe2222322223eucas1p2w;
	Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 00.5B.09549.3EBFD836; Mon,  5
	Dec 2022 14:10:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20221205141043eucas1p104a1e77304da5b5b8b287c10d9d00daa~t6wTsLVsw1614716147eucas1p1G;
	Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20221205141043eusmtrp23d9766abbaddc434e21ea033505174c4~t6wTnbJro3234132341eusmtrp2L;
	Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-d4-638dfbe322f1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.E5.09026.2EBFD836; Mon,  5
	Dec 2022 14:10:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20221205141042eusmtip2a56af7237c75db6751c32fdb5c37033d~t6wTEEwSq2339423394eusmtip2N;
	Mon,  5 Dec 2022 14:10:42 +0000 (GMT)
Message-ID: <edbee2a1-abef-e74c-1651-3401fe234b41@samsung.com>
Date: Mon, 5 Dec 2022 15:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [v2,5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
	airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-rpi-kernel
	<linux-rpi-kernel@lists.infradead.org>, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
In-Reply-To: <81399603-6253-b671-85c7-373f196b73ed@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87qPf/cmG6x8r2px4voiJouFD+8y
	W/zfNpHZ4srX92wWC6ctZ7RYMJvbYuLtDewWCz9uZbFo61zGarHlzURWBy6Pvd8WsHjsnHWX
	3WPTqk42j3knAz3udx9n8ti8pN7j/b6rbB6bT1cHcERx2aSk5mSWpRbp2yVwZezoXMBUcE+w
	Yv71BuYGxgt8XYycHBICJhJzFyxi72Lk4hASWMEosWP1LiYI5wujROuZTawQzmdGiYOdm5hg
	Wmbf2ABVtZxR4viPfVBVHxklZmzbzQZSxStgJ7H6QxsLiM0ioCLRfH8PVFxQ4uTMJ2BxUYEU
	iQM7z4JNFRZIkPg28RMjiM0sIC5x68l8sDibgKFE19susF4RgXmMEot/JIAsYxZYzSixcsM7
	oAQHB6eAvcSPh/YQvfISzVtnM4PUSAi0c0pc7O6EOttF4k1HHzuELSzx6vgWKFtG4v/O+UxQ
	DYwSC37fh3ImMEo0PL/FCFFlLXHn3C+wbcwCmhLrd+lDhB0lFuzqZgcJSwjwSdx4KwhxBJ/E
	pG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQgmUWkvdnIXlnFsLeBYwsqxjFU0uLc9NT
	i43zUsv1ihNzi0vz0vWS83M3MQKT1+l/x7/uYFzx6qPeIUYmDsZDjBIczEoivC829iYL8aYk
	VlalFuXHF5XmpBYfYpTmYFES510xpSNZSCA9sSQ1OzW1ILUIJsvEwSnVwNQ5e1vM+sulGuee
	XO2dpbpNX3v7OaUC/XexJ7akbZ53dd9L7YsKjiYzzqa/nPVb6Mmi6i16+Q72rc7y/TNbGqpL
	35dkcRT2+P65M/HMYyvuE677WVPW6/qeiVeabfpt6of5XdGftadNclbeZMEx50bh/cwsxZ82
	PqLTpm6ODVKRdst7ttjyvt/TMtU0ric6i9/75bUqbeK7J2IZ5Znrf3p9mJdz1R335oNfExZ8
	bJ94ytmoRa7MtLyPJdjxzVVt/wOfTM+UJl2zXSo8q+YUo7ucjyy/sNy9iUsy5IRe2nPteXx5
	43tZ5g2XNfp9pI+W9uZusbv36HVQ1yf70uhnhsHRjvNuq0xdFFzjn/48TomlOCPRUIu5qDgR
	AC9wjSPNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7qPf/cmGzSvZLY4cX0Rk8XCh3eZ
	Lf5vm8hsceXrezaLhdOWM1osmM1tMfH2BnaLhR+3sli0dS5jtdjyZiKrA5fH3m8LWDx2zrrL
	7rFpVSebx7yTgR73u48zeWxeUu/xft9VNo/Np6sDOKL0bIryS0tSFTLyi0tslaINLYz0DC0t
	9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MnZ0LmAquCdYMf96A3MD4wW+LkZODgkBE4nZ
	NzYwdTFycQgJLGWU+Px0FytEQkbi5LQGKFtY4s+1LjaIoveMEs8ntzGCJHgF7CRWf2hjAbFZ
	BFQkmu/vYYOIC0qcnPkELC4qkCLR3vOPCcQWFkiQ+DbxE1gvs4C4xK0n88HibAKGEl1vIRaI
	CMxjlLhy/AIjiMMssJpR4s//XkaI1cuZJGYfOQLUwsHBKWAv8eOhPcQkM4murV1QU+UlmrfO
	Zp7AKDQLySGzkCychaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjdduxn1t2
	MK589VHvECMTB+MhRgkOZiUR3hcbe5OFeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4wYeSV
	xBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTB1tBsVvHY8tOcSj9Wv
	I7mKjNlGU+Rs5lybZ3zGtOPOW78vj20qcooVl3SLtr2+fsm+xOXIhlQB/+3KylnGX3d/zv1s
	XdAgKHQ0sJS/PPxPe1+nXebf5y5LLVjEGBQK/s3cvuyuQPwRmalPdl4wqbc6zWlsErRf8kvC
	myubOP9EOAvs/ZhV1M+4eofHIvG6dfKZnn/fWc64mxlbfvZw9a85l85c2HJ58wS+4OC1mi9u
	VV3lfaX4SI7rYrK9T42k8xHtdwzHPtrJbpiuV9ek/NydNzTdpqug8ufD9QwvK6cKK1/tPzmp
	o//Zr5fWmlt31afKhqn0Om/3Mvb4r358SUHFzrflm7cvaD2nslzHwlyJpTgj0VCLuag4EQDV
	iL3lYAMAAA==
X-CMS-MailID: 20221205141043eucas1p104a1e77304da5b5b8b287c10d9d00daa
X-Msg-Generator: CA
X-RootMTR: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
References: <20221115115819.23088-6-tzimmermann@suse.de>
	<CGME20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33@eucas1p2.samsung.com>
	<ee076724-cee3-cd6a-de44-191e058fddbb@samsung.com>
	<1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
	<81399603-6253-b671-85c7-373f196b73ed@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_061059_485932_13BBA1DD 
X-CRM114-Status: GOOD (  12.81  )
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

T24gMTcuMTEuMjAyMiAxODoyMSwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBPbiAxNy4xMS4y
MDIyIDE3OjA3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4gQW0gMTcuMTEuMjIgdW0gMTM6
NTcgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+Pj4gT24gMTUuMTEuMjAyMiAxMjo1OCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+Pj4gU2NoZWR1bGUgdGhlIGRlZmVycmVkLUkvTyB3b3Jr
ZXIgaW5zdGVhZCBvZiB0aGUgZGFtYWdlIHdvcmtlciBhZnRlcgo+Pj4+IHdyaXRpbmcgdG8gdGhl
IGZiZGV2IGZyYW1lYnVmZmVyLiBUaGUgZGVmZXJyZWQtSS9PIHdvcmtlciB0aGVuIAo+Pj4+IHBl
cmZvcm1zCj4+Pj4gdGhlIGRpcnR5LWZiIHVwZGF0ZS4gVGhlIGZiZGV2IGVtdWxhdGlvbiB3aWxs
IGluaXRpYWxpemUgZGVmZXJyZWQgSS9PCj4+Pj4gZm9yIGFsbCBkcml2ZXJzIHRoYXQgcmVxdWly
ZSBkYW1hZ2UgdXBkYXRlcy4gSXQgaXMgdGhlcmVmb3JlIGEgdmFsaWQKPj4+PiBhc3N1bXB0aW9u
IHRoYXQgdGhlIGRlZmVycmVkLUkvTyB3b3JrZXIgaXMgcHJlc2VudC4KPj4+Pgo+Pj4+IEl0IHdv
dWxkIGJlIHBvc3NpYmxlIHRvIHBlcmZvcm0gdGhlIGRhbWFnZSBoYW5kbGluZyBkaXJlY3RseSBm
cm9tIAo+Pj4+IHdpdGhpbgo+Pj4+IHRoZSB3cml0ZSBvcGVyYXRpb24uIEJ1dCBkb2luZyB0aGlz
IGNvdWxkIGluY3JlYXNlIHRoZSBvdmVyaGVhZCBvZiB0aGUKPj4+PiB3cml0ZSBvciBpbnRlcmZl
cmUgd2l0aCBhIGNvbmN1cnJlbnRseSBzY2hlZHVsZWQgZGVmZXJyZWQtSS9PIHdvcmtlci4KPj4+
PiBJbnN0ZWFkLCBzY2hlZHVsaW5nIHRoZSBkZWZlcnJlZC1JL08gd29ya2VyIHdpdGggaXRzIHJl
Z3VsYXIgZGVsYXkgb2YKPj4+PiA1MCBtcyByZW1vdmVzIGxvYWQgb2ZmIHRoZSB3cml0ZSBvcGVy
YXRpb24gYW5kIGFsbG93cyB0aGUgZGVmZXJyZWQtSS9PCj4+Pj4gd29ya2VyIHRvIGhhbmRsZSBt
dWx0aXBsZSB3cml0ZSBvcGVyYXRpb25zIHRoYXQgYXJyaXZlZCBkdXJpbmcgdGhlIAo+Pj4+IGRl
bGF5Cj4+Pj4gdGltZSB3aW5kb3cuCj4+Pj4KPj4+PiB2MjoKPj4+PiDCoMKgwqDCoCoga2VlcCBk
cm1fZmJfaGVscGVyX2RhbWFnZSgpIChEYW5pZWwpCj4+Pj4gwqDCoMKgwqAqIHVzZSBmYl9kZWZl
cnJlZF9pb19zY2hlZHVsZV9mbHVzaCgpIChEYW5pZWwpCj4+Pj4gwqDCoMKgwqAqIGNsYXJpZnkg
Y29tbWVudHMgKERhbmllbCkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Pj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+Pj4KPj4+IFRoaXMgcGF0Y2gsIG1lcmdlZCBpbnRv
IHRvZGF5J3MgbGludXgtbmV4dCBhcyBjb21taXQgN2Y1Y2M0YTNlNWU0Cj4+PiAoImRybS9mYi1o
ZWxwZXI6IFNjaGVkdWxlIGRlZmVycmVkLUkvTyB3b3JrZXIgYWZ0ZXIgd3JpdGluZyB0bwo+Pj4g
ZnJhbWVidWZmZXIiKSwgdHJpZ2dlcnMgYSBmb2xsb3dpbmcgd2FybmluZyBvbiBSYXNwYmVycnkg
UGkgMyAmIDQgYXMKPj4+IHdlbGwgYXMgYWxsIEFtbG9naWMgTWVzb24gRzEyQS9CIGJhc2VkIGJv
YXJkczoKPj4+Cj4+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+IFdB
Uk5JTkc6IENQVTogMCBQSUQ6IDIyMCBhdCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVm
aW8uYzozNDAKPj4KPj4gVGhhbmsgeW91IHNvIG11Y2ggZm9yIHJlcG9ydGluZy4gVGhhdCBsaW5l
IHNob3VsZCBuZXZlciBiZSBleGVjdXRlZCAKPj4gd2l0aCB2YzQgZXQgYWwuCj4+Cj4+IElmIHlv
dSBoYXZlIHRoZSB0aW1lLCBjb3VsZCB5b3UgcGxlYXNlIHRyeSB0aGUgYXR0YWNoZWQgcGF0Y2gg
YW5kIAo+PiByZXBvcnQgdGhlIHJlc3VsdHMuIFRoYW5rcyBhIGxvdC4KPgo+IFRoaXMgZml4ZXMg
dGhlIGlzc3VlIG9ic2VydmVkIG9uIG15IFJhc3BiZXJyeSBQaSAzLzQgYW5kIEFtbG9naWMgTWVz
b24gCj4gYmFzZWQgYm9hcmRzLiBGZWVsIGZyZWUgdG8gYWRkOgo+Cj4gVGVzdGVkLWJ5OiBNYXJl
ayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CgpHZW50bGUgcGluZy4gVGhp
cyBpc3N1ZSBpcyBub3QgZml4ZWQgaW4gbGludXgtbmV4dC4KCkJlc3QgcmVnYXJkcwotLSAKTWFy
ZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
