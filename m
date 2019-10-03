Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE50C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 08:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE9D2133F
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 08:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gof0Eq+4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YzlDmBrt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE9D2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlEsZsdv5aczEYelNcSbQxpnMqs9/luBumQ88izFZ7U=; b=Gof0Eq+4+WOftf
	WgBIF8QxJG6vIftXbLf0hGz850kvNdPunwZjEPtPbR3UhE12zBeiLotvxlsgdTUGPSgTrLNUtxJpV
	UHp2TwLY/BSebBwiCU9hy8sCSPMIuOEE0anjNt/gB15XYJrBNCop0CW9kkJ9NyVcey0WtrxDWBLNM
	D5r5is3AYKXB2Fg3fW5jmPGkv8zMtrPQSjbO3QH3TcoLKb9vO1SHLn+MmlPWNgW2ist+XKzp/a1CX
	UvV+OAtnkEoujUN5FFQiwjIDLwqi7/15K/PNbuUar8r1AYq45Zj8qSMswEW2oWTfUmpR6YO+Co4g+
	CWyEg6EeAdSHeOMP2Ysw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFwbS-0005Zk-5c; Thu, 03 Oct 2019 08:36:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFwbQ-0005ZD-4q
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 08:36:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id 3so1570949wmi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2019 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=8oCj6ABjq7IlXduobnbx0HLQeAm5zYdqgwLkEMvrhbw=;
 b=YzlDmBrtuA4f9f4HTwJHuL34tp98Iq2VnrTUagXtMFfd+jt++BjGXLI6tci4A8zoCc
 869h3jCYtcNG52dut7CzsK3A0MR4OTGfeBO90dYg3e4okqfFu1eRVBbhtuKOvaFdzXOZ
 R/aHm/rfC+QMjdrAFJS/63fymA3B5ncpJ0yqpq2KoYLhCBZ9oiCt1MWm02eMvtwTdRck
 4y1stcrfo1YK0hXsQ7qdPaiKS/kKQJCru9YxHuccY1LykDPOExc2q0lg8NKyFbzIjsoS
 m9nWEKRP44kyK61grkf7hoR9wlcd8f+UIbsRs6mpTJfeVlhXbePzY59F/9URJN9kXotI
 +0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=8oCj6ABjq7IlXduobnbx0HLQeAm5zYdqgwLkEMvrhbw=;
 b=HDb7wzn5L3D2uA+F9BCk0/Mx/ovNznVW52OepFPmZl2OT46VAThq6Kk8JGlqwx+eRK
 2czyuF2nAGhykWhrheP2qITFXhxSVvu/UgA0KNyRBXziCNPXOLBWOL6aRep/OuJ/Jjex
 Qklyj8VOL31AokQohLtiY0cOKwLKNG06sLGCcM53hs83Oo7Hv3hAnx9J1OU3Q7tXXJle
 /FmDrtDu/5GE9j0tTYsBixwFpQRkvMw5+EWMnhO3J7xz3QZrPwFcn8VYGxgx4OgFM5DI
 mVlIlxIH4fwx1c2Y7sLncmRSx0wLP197OtUcoBvYRYsesO1E8UBcJ+7Z0IbczNxm1ChT
 gYag==
X-Gm-Message-State: APjAAAXdl2QvkcoOFYh/ZaPO8ti9nhXGg2jb6qgLqeFbn1zN+KjDl2XS
 HKCBNLs8PYZg/FlQlSZIaShmIJbs4oYgzQ==
X-Google-Smtp-Source: APXvYqy9NDEB2yuGbVOhGF2VnlxJIeKnAJPF5k4qit+D2Gt0YxqgW5XPWOAplITRI1XXKlf6ghpMqw==
X-Received: by 2002:a1c:980e:: with SMTP id a14mr5717814wme.99.1570091806362; 
 Thu, 03 Oct 2019 01:36:46 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 t17sm2461962wrp.72.2019.10.03.01.36.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 01:36:45 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <5f7d10ab-1ce5-25aa-90bd-4f87ed2a9bfb@baylibre.com>
 <d5ceef14-b876-c102-d793-25289635cab1@amd.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <530d1549-367f-b387-7f89-be6221b864a9@baylibre.com>
Date: Thu, 3 Oct 2019 10:36:44 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d5ceef14-b876-c102-d793-25289635cab1@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_013648_201277_95C1594E 
X-CRM114-Status: GOOD (  18.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAwMi8xMC8yMDE5IMOgIDE4OjUzLCBHcm9kem92c2t5LCBBbmRyZXkgYSDDqWNyaXQgOgo+
IAo+IE9uIDkvMzAvMTkgNToxNyBBTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpIEFuZHJl
eSwKPj4KPj4gT24gMjcvMDkvMjAxOSAyMjo1NSwgR3JvZHpvdnNreSwgQW5kcmV5IHdyb3RlOgo+
Pj4gQ2FuIHlvdSBwbGVhc2UgdXNlIGFkZHIybGluZSBvciBnZGIgdG8gcGlucG9pbnQgd2hlcmUg
aW4KPj4+IGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSB5b3UgaGl0IHRoZSBOVUxMIHB0ciA/IEl0
IGxvb2tzIGxpa2UgdGhlIGd1aWx0eQo+Pj4gam9iLCBidXQgdG8gYmUgc3VyZS4KPj4gRGlkIGEg
bmV3IHJ1biBmcm9tIDUuMzoKPj4KPj4gWyAgIDM1Ljk3MTk3Ml0gQ2FsbCB0cmFjZToKPj4gWyAg
IDM1Ljk3NDM5MV0gIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjAJZmZmZjAwMDAx
MDY2N2YzOAlGRkZGMDAwMDEwNjY3Rjk0CWRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jOjMzNQo+Pgo+Pgo+PiBUaGUgY3Jhc2hpbmcgbGluZSBpcyA6Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0
ID09Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRpdHktPmZlbmNl
X2NvbnRleHQpIHsKPj4KPj4gRG9lc24ndCBzZWVtIHJlbGF0ZWQgdG8gZ3VpbHR5IGpvYi4KPj4K
Pj4gTmVpbAo+IAo+IAo+IFRoYW5rcyBOZWlsLCBieSBndWlsdHkgaSBtZWFudCB0aGUgJ2JhZCcg
am9iLiBJIHJldmlld2VkIHRoZSBjb2RlIGFuZCAKPiBjYW4ndCBzZWUgYW55dGhpbmcgc3VzcGlj
aW91cyBmb3Igbm93LiBUbyBoZWxwIGNsYXJpZnkgY291bGQgeW91IHBsZWFzZSAKPiBwcm92aWRl
IGZ0cmFjZSBsb2cgZm9yIHRoaXMgPyBBbGwgdGhlIGRtYV9mZW5jZSBhbmQgZ3B1X3NjaGVkdWxl
ciB0cmFjZXMgCj4gY2FuIGhlbHAuIEkgdXN1YWxseSBqdXN0IHNldCB0aGVtIGFsbCB1cCBpbiBv
bmUgbGluZSB1c2luZyB0cmFjZS1jbWQgCj4gdXRpbGl0eSBsaWtlIHRoaXMgYmVmb3JlIHN0YXJ0
aW5nIHRoZSBydW4uIElmIHlvdSBoYXZlIGFueSByZWxldmFudCAKPiB0cmFjZXMgaW4gcGFuZnJv
c3QgaXQgYXNsbyBjYW4gYmUgdXNlZnVsLgo+IAo+IHN1ZG8gdHJhY2UtY21kIHN0YXJ0IC1lIGRt
YV9mZW5jZSAtZSBncHVfc2NoZWR1bGVyCgpTdXJlIGJ1dCBJJ2xsIG5lZWQgbXVjaCBtb3JlIHRp
bWUgdG8gZG8gdGhpcywgaW4gdGhlIG1lYW50aW1lIEkgZGlkIDEwIHJ1bnMgd2l0aCB5b3VyCnBh
dGNoIGFuZCBpcyBmaXhlZCB0aGUgaXNzdWUuCgpJJ2xsIHRyeSB0byBnZW5lcmF0ZSB0aGUgdHJh
Y2VzLgoKTmVpbAoKPiAKPiBBbmRyZXkKPiAKPiAKPj4KPj4+IEFuZHJleQo+Pj4KPj4+IE9uIDkv
MjcvMTkgNDoxMiBBTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4gSGkgQ2hyaXN0aWFuLAo+
Pj4+Cj4+Pj4gSW4gdjUuMywgcnVubmluZyBkRVFQIHRyaWdnZXJzIHRoZSBmb2xsb3dpbmcga2Vy
bmVsIGNyYXNoIDoKPj4+Pgo+Pj4+IFsgICAyMC4yMjQ5ODJdIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAw
MDAwMDAzOAo+Pj4+IFsuLi5dCj4+Pj4gWyAgIDIwLjI5MTA2NF0gSGFyZHdhcmUgbmFtZTogS2hh
ZGFzIFZJTTIgKERUKQo+Pj4+IFsgICAyMC4yOTUyMTddIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9z
Y2hlZF9qb2JfdGltZWRvdXQKPj4+PiBbLi4uXQo+Pj4+IFsgICAyMC4zMDQ4NjddIHBjIDogZHJt
X3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMAo+Pj4+IFsgICAyMC4zMDk2OTZdIGxyIDog
ZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NDQvMHhmMAo+Pj4+IFsuLi5dCj4+Pj4gWyAgIDIw
LjM5NjcyMF0gQ2FsbCB0cmFjZToKPj4+PiBbICAgMjAuMzk5MTM4XSAgZHJtX3NjaGVkX2luY3Jl
YXNlX2thcm1hKzB4NWMvMHhmMAo+Pj4+IFsgICAyMC40MDM2MjNdICBwYW5mcm9zdF9qb2JfdGlt
ZWRvdXQrMHgxMmMvMHgxZTAKPj4+PiBbICAgMjAuNDA4MDIxXSAgZHJtX3NjaGVkX2pvYl90aW1l
ZG91dCsweDQ4LzB4YTAKPj4+PiBbICAgMjAuNDEyMzM2XSAgcHJvY2Vzc19vbmVfd29yaysweDFl
MC8weDMyMAo+Pj4+IFsgICAyMC40MTYzMDBdICB3b3JrZXJfdGhyZWFkKzB4NDAvMHg0NTAKPj4+
PiBbICAgMjAuNDE5OTI0XSAga3RocmVhZCsweDEyNC8weDEyOAo+Pj4+IFsgICAyMC40MjMxMTZd
ICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOAo+Pj4+IFsgICAyMC40MjY2NTNdIENvZGU6IGY5NDAw
MDAxIDU0MDAwMWMwIGY5NDAwYTgzIGY5NDAyNDAyIChmOTQwMWM2NCkKPj4+PiBbICAgMjAuNDMy
NjkwXSAtLS1bIGVuZCB0cmFjZSBiZDAyZjg5MDEzOTA5NmE3IF0tLS0KPj4+Pgo+Pj4+IFdoaWNo
IG5ldmVyIGhhcHBlbnMsIGF0IGFsbCwgb24gdjUuMi4KPj4+Pgo+Pj4+IEkgZGlkIGEgKHZlcnkp
IGxvbmcgKDcgZGF5cywgfjEwMHJ1bnMpIGJpc2VjdCBydW4gdXNpbmcgb3VyIExBVkEgbGFiICh0
aGFua3MgdG9tZXUgISksIGJ1dAo+Pj4+IGJpc2VjdGluZyB3YXMgbm90IGVhc3kgc2luY2UgdGhl
IGJhZCBjb21taXQgbGFuZGVkIG9uIGRybS1taXNjLW5leHQgYWZ0ZXIgdjUuMS1yYzYsIGFuZAo+
Pj4+IHRoZW4gdjUuMi1yYzEgd2FzIGJhY2ttZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0IGF0Ogo+
Pj4+IFsxXSAzNzRlZDU0MjkzNDYgTWVyZ2UgZHJtL2RybS1uZXh0IGludG8gZHJtLW1pc2MtbmV4
dAo+Pj4+Cj4+Pj4gVGh1cyBiaXNlY3RpbmcgYmV0d2VlbiBbMV0gYW5nIHY1LjItcmMxIGxlYWRz
IHRvIGNvbW1pdCBiYXNlZCBvbiB2NS4yLXJjMS4uLiB3aGVyZSBwYW5mcm9zdCB3YXMKPj4+PiBu
b3QgZW5hYmxlZCBpbiB0aGUgS2hhZGFzIFZJTTIgRFQuCj4+Pj4KPj4+PiBBbnl3YXksIEkgbWFu
YWdlZCB0byBpZGVudGlmeSAzIHBvc3NpYmx5IGJyZWFraW5nIGNvbW1pdHMgOgo+Pj4+IFsyXSAy
OTA3NjRhZjdlMzYgZHJtL3NjaGVkOiBLZWVwIHNfZmVuY2UtPnBhcmVudCBwb2ludGVyCj4+Pj4g
WzNdIDU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uCj4+
Pj4gWzRdIGE1MzQzYjhhMmNhNSBkcm0vc2NoZWR1bGVyOiBBZGQgZmxhZyB0byBoaW50IHRoZSBy
ZWxlYXNlIG9mIGd1aWx0eSBqb2IuCj4+Pj4KPj4+PiBCdXQgWzFdIGFuZCBbMl0gZG9lc24ndCBj
cmFzaCB0aGUgc2FtZSB3YXkgOgo+Pj4+IFsgICAxNi4yNTc5MTJdIFVuYWJsZSB0byBoYW5kbGUg
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAw
MDAwMDAwMDA2MAo+Pj4+IFsuLi5dCj4+Pj4gWyAgIDE2LjMwODMwN10gQ1BVOiA0IFBJRDogODAg
Q29tbToga3dvcmtlci80OjEgTm90IHRhaW50ZWQgNS4xLjAtcmMyLTAxMTg1LWcyOTA3NjRhZjdl
MzYtZGlydHkgIzM3OAo+Pj4+IFsgICAxNi4zMTcwOTldIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBW
SU0yIChEVCkKPj4+PiBbLi4uXSkKPj4+PiBbICAgMTYuMzMwOTA3XSBwYyA6IHJlZmNvdW50X3N1
Yl9hbmRfdGVzdF9jaGVja2VkKzB4NC8weGIwCj4+Pj4gWyAgIDE2LjMzNjA3OF0gbHIgOiByZWZj
b3VudF9kZWNfYW5kX3Rlc3RfY2hlY2tlZCsweDE0LzB4MjAKPj4+PiBbLi4uXQo+Pj4+IFsgICAx
Ni40MjM1MzNdIFByb2Nlc3Mga3dvcmtlci80OjEgKHBpZDogODAsIHN0YWNrIGxpbWl0ID0gMHgo
X19fX3B0cnZhbF9fX18pKQo+Pj4+IFsgICAxNi40MzA0MzFdIENhbGwgdHJhY2U6Cj4+Pj4gWyAg
IDE2LjQzMjg1MV0gIHJlZmNvdW50X3N1Yl9hbmRfdGVzdF9jaGVja2VkKzB4NC8weGIwCj4+Pj4g
WyAgIDE2LjQzNzY4MV0gIGRybV9zY2hlZF9qb2JfY2xlYW51cCsweDI0LzB4NTgKPj4+PiBbICAg
MTYuNDQxOTA4XSAgcGFuZnJvc3Rfam9iX2ZyZWUrMHgxNC8weDI4Cj4+Pj4gWyAgIDE2LjQ0NTc4
N10gIGRybV9zY2hlZF9qb2JfdGltZWRvdXQrMHg2Yy8weGEwCj4+Pj4gWyAgIDE2LjQ1MDEwMl0g
IHByb2Nlc3Nfb25lX3dvcmsrMHgxZTAvMHgzMjAKPj4+PiBbICAgMTYuNDU0MDY3XSAgd29ya2Vy
X3RocmVhZCsweDQwLzB4NDUwCj4+Pj4gWyAgIDE2LjQ1NzY5MF0gIGt0aHJlYWQrMHgxMjQvMHgx
MjgKPj4+PiBbICAgMTYuNDYwODgyXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgKPj4+PiBbICAg
MTYuNDY0NDIxXSBDb2RlOiA1MjgwMDAwMCBkNjVmMDNjMCBkNTAzMjAxZiBhYTAxMDNlMyAoYjk0
MDAwMjEpCj4+Pj4gWyAgIDE2LjQ3MDQ1Nl0gLS0tWyBlbmQgdHJhY2UgMzlhNjc0MTJlZTFiNjRi
NSBdLS0tCj4+Pj4KPj4+PiBhbmQgWzNdIGZhaWxzIGxpa2Ugb24gdjUuMyAoaW4gZHJtX3NjaGVk
X2luY3JlYXNlX2thcm1hKToKPj4+PiBbICAgMzMuODMwMDgwXSBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAw
MDAwMDAwMzgKPj4+PiBbLi4uXQo+Pj4+IFsgICAzMy44NzE5NDZdIEludGVybmFsIGVycm9yOiBP
b3BzOiA5NjAwMDAwNCBbIzFdIFBSRUVNUFQgU01QCj4+Pj4gWyAgIDMzLjg3NzQ1MF0gTW9kdWxl
cyBsaW5rZWQgaW46Cj4+Pj4gWyAgIDMzLjg4MDQ3NF0gQ1BVOiA2IFBJRDogODEgQ29tbToga3dv
cmtlci82OjEgTm90IHRhaW50ZWQgNS4xLjAtcmMyLTAxMTg2LWdhNTM0M2I4YTJjYTUtZGlydHkg
IzM4MAo+Pj4+IFsgICAzMy44ODkyNjVdIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0yIChEVCkK
Pj4+PiBbICAgMzMuODkzNDE5XSBXb3JrcXVldWU6IGV2ZW50cyBkcm1fc2NoZWRfam9iX3RpbWVk
b3V0Cj4+Pj4gWy4uLl0KPj4+PiBbICAgMzMuOTAzMDY5XSBwYyA6IGRybV9zY2hlZF9pbmNyZWFz
ZV9rYXJtYSsweDVjLzB4ZjAKPj4+PiBbICAgMzMuOTA3ODk4XSBsciA6IGRybV9zY2hlZF9pbmNy
ZWFzZV9rYXJtYSsweDQ0LzB4ZjAKPj4+PiBbLi4uXQo+Pj4+IFsgICAzMy45OTQ5MjRdIFByb2Nl
c3Mga3dvcmtlci82OjEgKHBpZDogODEsIHN0YWNrIGxpbWl0ID0gMHgoX19fX3B0cnZhbF9fX18p
KQo+Pj4+IFsgICAzNC4wMDE4MjJdIENhbGwgdHJhY2U6Cj4+Pj4gWyAgIDM0LjAwNDI0Ml0gIGRy
bV9zY2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjAKPj4+PiBbICAgMzQuMDA4NzI2XSAgcGFu
ZnJvc3Rfam9iX3RpbWVkb3V0KzB4MTJjLzB4MWUwCj4+Pj4gWyAgIDM0LjAxMzEyMl0gIGRybV9z
Y2hlZF9qb2JfdGltZWRvdXQrMHg0OC8weGEwCj4+Pj4gWyAgIDM0LjAxNzQzOF0gIHByb2Nlc3Nf
b25lX3dvcmsrMHgxZTAvMHgzMjAKPj4+PiBbICAgMzQuMDIxNDAyXSAgd29ya2VyX3RocmVhZCsw
eDQwLzB4NDUwCj4+Pj4gWyAgIDM0LjAyNTAyNl0gIGt0aHJlYWQrMHgxMjQvMHgxMjgKPj4+PiBb
ICAgMzQuMDI4MjE4XSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgKPj4+PiBbICAgMzQuMDMxNzU1
XSBDb2RlOiBmOTQwMDAwMSA1NDAwMDFjMCBmOTQwMGE4MyBmOTQwMjQwMiAoZjk0MDFjNjQpCj4+
Pj4gWyAgIDM0LjAzNzc5Ml0gLS0tWyBlbmQgdHJhY2UgYmUzZmQ2Zjc3ZjRkZjI2NyBdLS0tCj4+
Pj4KPj4+Pgo+Pj4+IFdoZW4gSSByZXZlcnQgWzNdIG9uIFsxXSwgaSBnZXQgdGhlIHNhbWUgY3Jh
c2ggYXMgWzJdLCBtZWFuaW5nCj4+Pj4gdGhlIGNvbW1pdCBbM10gbWFza3MgdGhlIGZhaWx1cmUg
WzJdIGludHJvZHVjZWQuCj4+Pj4KPj4+PiBEbyB5b3Uga25vdyBob3cgdG8gc29sdmUgdGhpcyA/
Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
