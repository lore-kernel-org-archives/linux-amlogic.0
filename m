Return-Path: <SRS0=uK5F=7S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45967C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jun 2020 15:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155372074B
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jun 2020 15:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SE4i7sdG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ndufresne-ca.20150623.gappssmtp.com header.i=@ndufresne-ca.20150623.gappssmtp.com header.b="Ws/vknZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155372074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWFfl4tAhFEE6PG2/j+/4swTlHvAwdGgXgquJJx5Yp0=; b=SE4i7sdGfUpFHV
	+M8zwUOLPECxuqA1EDP6lwHdV25q/YdbCzq3hWQBNADac2imG/bsgD91E4ff1SgdS3OIgqPgd71NQ
	56DUigvlxtuX2EQQgDGMx0Ia3XCyKdAG65vZ7bgTCasIHdNckGpRboAN54D6dG4pwZX85/jUR/SY3
	m5C3YVubpV0pfiEQBXRj/YtJAshn9g2hic73h/quyRqklx4Cu3hwazv/ifC2YAD7dGnmJDVjDPYQj
	iLgQKA55yf4NnWHaxZ4HMfKyXexlC/wSKLnbBywcQRNn83tUJWVUiojbljCPS3xcRfwLAklFxr/k4
	xGL9ZyXe3gXBEpj+Kdrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhEPI-0006u3-6Q; Fri, 05 Jun 2020 15:37:20 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhEPF-0006tK-BZ
 for linux-amlogic@lists.infradead.org; Fri, 05 Jun 2020 15:37:18 +0000
Received: by mail-qk1-x742.google.com with SMTP id c185so10067333qke.7
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Jun 2020 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=6dIRalDKukNHz3swE/kQj/FCPxkqgYRrJWqT5xc0928=;
 b=Ws/vknZem3s0dSVcrFTtK798SXVRdP/M5djs99ILMOwUF3cYzeW1g9WXvvvNqkBz1c
 2s0fX+GDycNfAm1Zk8aKEYTel3pvPQNw3TvZ5lSnSFJD/GaPBDFpDBlOSrfC+dS0GJpY
 g1vQRbXfD0Bc8xzezZKeS8KF7wzKj4OHElgffB0AmLr4Bt866+sOb0ZW6wtN5r0LwPNl
 tNBN4Icemp1Xad2Osx0yClhDGcvW8Ou6RoZmZlMTARp+a2j4iKY7VaS7pbLDFSIgLvs3
 Ptj6JycT1S8cCe5/dq3TPnQKZK0nn67ia33gCcb8kvvPpd7R2zQ54A7OvbsFobVpromX
 sqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6dIRalDKukNHz3swE/kQj/FCPxkqgYRrJWqT5xc0928=;
 b=cumWTohP6o9Ww9yCecJLQdWUlXH/DfeZPA7NyPqnSOt0p3j1QcYwshOOBW2Mz6M0lv
 8Rn5QYn08cmj87lUBNNWItAwMzd5ovfVksr1fKTvmIf0q2L3dvz+O5oOdODKIrhMsls9
 CON73U1KXRP7g9BXYGFX8MrPqN9doU3iUEVRNX1AnGl0grNzQ2nx7tKd5xnsdO4Pjw0T
 qUoY6tExLhoxBJ5ZcGPIgkf8kYT9IOTl8JewtI3mku+Y3Y8k8XMNl4Iu2JTnu/7ofpIc
 q0cFuE8Ip1qyIFRxfEAJvOzqLiu+xkySvyt9FBPZghk6cY/dUMaxHKTwp/gfVnfNQ5rp
 qx9w==
X-Gm-Message-State: AOAM533lc368N+XtoyKFRsXWhKjEmfBZevR8ZsVcceP/8FYcMA+oyJaE
 Fych0XIMfwsW+CYABINDOXcrgw==
X-Google-Smtp-Source: ABdhPJwSva/8aulW2zIjT1mFgpKBNkLomhs6UlAbs0vzaebZnojmGDUsgoBL6g8XrramHpl+0a0UVg==
X-Received: by 2002:a37:8ec3:: with SMTP id
 q186mr10814060qkd.231.1591371435604; 
 Fri, 05 Jun 2020 08:37:15 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id h5sm67524qkk.108.2020.06.05.08.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 08:37:14 -0700 (PDT)
Message-ID: <6be2b7794c469a434befc2f71f83cf918f4e1b4b.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel
 formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <narmstrong@baylibre.com>, hverkuil-cisco@xs4all.nl
Date: Fri, 05 Jun 2020 11:37:13 -0400
In-Reply-To: <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
 <20200604135317.9235-2-narmstrong@baylibre.com>
 <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_083717_398389_EB09A92A 
X-CRM114-Status: GOOD (  22.35  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgdmVuZHJlZGkgMDUganVpbiAyMDIwIMOgIDExOjM1IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25l
IGEgw6ljcml0IDoKPiBMZSBqZXVkaSAwNCBqdWluIDIwMjAgw6AgMTU6NTMgKzAyMDAsIE5laWwg
QXJtc3Ryb25nIGEgw6ljcml0IDoKPiA+IEZyb206IE1heGltZSBKb3VyZGFuIDxtam91cmRhbkBi
YXlsaWJyZS5jb20+Cj4gPiAKPiA+IEFkZCB0d28gZ2VuZXJpYyBDb21wcmVzc2VkIEZyYW1lYnVm
ZmVyIHBpeGVsIGZvcm1hdHMgdG8gYmUgdXNlZAo+ID4gd2l0aCBhIG1vZGlmaWVyIHdoZW4gaW1w
b3J0ZWQgYmFjayBpbiBhbm90aGVyIHN1YnN5c3RlbSBsaWtlIERSTS9LTVMuCj4gPiAKPiA+IFRo
ZXNlIHBpeGVsIGZvcm1hdHMgcmVwcmVzZW50cyBnZW5lcmljIDhiaXRzIGFuZCAxMGJpdHMgY29t
cHJlc3NlZCBidWZmZXJzCj4gPiB3aXRoIGEgdmVuZG9yIHNwZWNpZmljIGxheW91dC4KPiA+IAo+
ID4gVGhlc2UgYXJlIGFsaWduZWQgd2l0aCB0aGUgRFJNX0ZPUk1BVF9ZVVY0MjBfOEJJVCBhbmQg
RFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQKPiA+IHVzZWQgdG8gZGVzY3JpYmUgdGhlIHVuZGVybHlp
bmcgY29tcHJlc3NlZCBidWZmZXJzIHVzZWQgZm9yIEFSTSBGcmFtZWJ1ZmZlcgo+ID4gQ29tcHJl
c3Npb24uIEluIHRoZSBBbWxvZ2ljIGNhc2UsIHRoZSBjb21wcmVzc2lvbiBpcyBkaWZmZXJlbnQg
YnV0IHRoZQo+ID4gdW5kZXJseWluZyBidWZmZXIgY29tcG9uZW50cyBpcyB0aGUgc2FtZS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIEpvdXJkYW4gPG1qb3VyZGFuQGJheWxpYnJlLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyB8
IDIgKysKPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgfCA5ICsrKysr
KysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jIGIvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jCj4gPiBpbmRleCAyMzIyZjA4YTk4YmUuLjhmMTRh
ZGZkNWJjNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9j
dGwuYwo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jCj4gPiBA
QCAtMTQ0Nyw2ICsxNDQ3LDggQEAgc3RhdGljIHZvaWQgdjRsX2ZpbGxfZm10ZGVzYyhzdHJ1Y3Qg
djRsMl9mbXRkZXNjICpmbXQpCj4gPiAgCQljYXNlIFY0TDJfUElYX0ZNVF9TNUNfVVlWWV9KUEc6
CWRlc2NyID0gIlM1QzczTVggaW50ZXJsZWF2ZWQgVVlWWS9KUEVHIjsgYnJlYWs7Cj4gPiAgCQlj
YXNlIFY0TDJfUElYX0ZNVF9NVDIxQzoJZGVzY3IgPSAiTWVkaWF0ZWsgQ29tcHJlc3NlZCBGb3Jt
YXQiOyBicmVhazsKPiA+ICAJCWNhc2UgVjRMMl9QSVhfRk1UX1NVTlhJX1RJTEVEX05WMTI6IGRl
c2NyID0gIlN1bnhpIFRpbGVkIE5WMTIgRm9ybWF0IjsgYnJlYWs7Cj4gPiArCQljYXNlIFY0TDJf
UElYX0ZNVF9ZVVY0MjBfOEJJVDoJZGVzY3IgPSAiQ29tcHJlc3NlZCBZVVYgNDoyOjAgOC1iaXQg
Rm9ybWF0IjsgYnJlYWs7Cj4gPiArCQljYXNlIFY0TDJfUElYX0ZNVF9ZVVY0MjBfMTBCSVQ6CWRl
c2NyID0gIkNvbXByZXNzZWQgWVVWIDQ6MjowIDEwLWJpdCBGb3JtYXQiOyBicmVhazsKPiAKPiBX
aGVuIEkgcmVhZCB0aGUgRFJNIGRvY3VtZW50YXRpb24gWzBdLCBJJ20gcmVhZGluZyB0aGF0IFlV
VjQyMF84QklUCj4gZGVmaW5pdGlvbiBtYXRjaGVzIFY0TDJfUElYX0ZNVF9ZVlU0MjAgYW5kIFY0
TDJfUElYX0ZNVF9ZVlU0MjBNIGZ1bGx5Lgo+IEluIGZhY3QsIG9uIERSTSBzaWRlLCB0byByZXBy
ZXNlbnQgdGhhdCBmb3JtYXQgeW91IHdhbnQgdG8gZXhwb3NlIGhlcmUsCj4gdGhleSB3aWxsIHN0
cmljdGx5IGNvbWJpbmUgdGhpcyBnZW5lcmljIGZvcm1hdCAoZG9jdW1lbnRlZCB1bi0KPiBjb21w
cmVzc2VkKSB3aXRoIGEgbW9kaWZpZXIgZ2VuZXJhdGVkIHdpdGggdGhlIG1hY3JvCj4gRFJNX0ZP
Uk1BVF9NT0RfQVJNX0FGQkMoKikuIEFuZCBvbmx5IHRoZSBjb21iaW5hdGlvbiByZXByZXNlbnQg
YSB1bmlxdWUKPiBhbmQgc2hhcmUtYWJsZSBmb3JtYXQuCgpbMF0gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC92NS41LXJjMS9ncHUvYWZiYy5odG1sCgo+IAo+IEluIGFic2VuY2Ugb2Yg
bW9kaWZpZXIgaW4gVjRMMiBBUEksIHRoaXMgY29tcHJlc3NlZCBmb3JtYXQgc2hvdWxkIGJlCj4g
bmFtZWQgYWNjb3JkaW5nbHkgdG8gdGhlIGNvbXByZXNzZWQgYWxnb3JpdGhtIHVzZWQgKHNvbWV0
aGluZyBsaWtlCj4gRk1UX1lVVjQyMF84QklUX0FNTF9GQkMpLiBTbyBJIGJlbGlldmUgdGhlc2Ug
Zm9ybWF0IG5hbWUgY2Fubm90IGJlCj4gY29waWVkIGFzLWlzIGxpa2UgdGhpcywgYXMgdGhleSBj
YW4gb25seSBpbnRyb2R1Y2UgbW9yZSBhbWJpZ3VpdHkgaW4KPiB0aGUgYWxyZWFkeSBxdWl0ZSBo
YXJkIHRvIGZvbGxvdyBuYW1pbmcgb2YgcGl4ZWwgZm9ybWF0cy4gSW4gZmFjdCwgaXQKPiBpcyB2
ZXJ5IGNvbW1vbiB0byBzZWUgbXVsdGlwbGUgZGlmZmVyZW50IHZlbmRvciBjb21wcmVzc2lvbnMg
b24gdGhlCj4gc2FtZSBTb0MsIHNvIEkgZG9uJ3QgcmVhbGx5IGJlbGlldmUgYSAiZ2VuZXJpYyIg
Y29tcHJlc3NlZCBmb3JtYXQgbWFrZQo+IHNlbnNlLiBUbyBzaXRlIG9uZSwgdGhlIElNWDhNLCB3
aGljaCBnb3QgVmVycmlzaWxsaWNvbi9WaXZhbnRlIERFQzQwMAo+IG9uIHRoZSBHUFUsIGFuZCB0
aGUgSGFudHJvIEcyIGNvbXByZXNzaW9uIGZvcm1hdC4gQm90aCB3aWxsIGFwcGx5IHRvCj4gTlYx
MiBjbGFzcyBvZiBmb3JtYXQgc28gaW4gRFJNIHRoZXkgd291bGQgYmUgTlYxMiArIG1vZGlmaWVy
LCBhbmQgdGhlCj4gY29tYmluYXRpb24gZm9ybXMgdGhlIHVuaXF1ZSBmb3JtYXQuIE5vdywgaW4g
dGVybSBvZiBzaGFyaW5nLCB0aGV5IG11c3QKPiBiZSBkaWZmZXJpZW50ZWQgYnkgdXNlcnNwYWNl
LCBhcyBzdXBwb3J0IGZvciBjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uCj4gaXMgaGV0ZXJvZ2Vu
ZW91cyAoaW4gdGhhdCBjYXNlIHRoZSBHUFUgZG9lcyBub3Qgc3VwcG9ydCBIYW50cm8gRzIKPiBk
ZWNvbXByZXNzaW9uIG9yIGNvbXByZXNzaW9uLCBhbmQgdGhlIFZQVSBkb2VzIG5vdCBzdXBwb3J0
IERFQzQwMCkuCj4gCj4gSSdsbCByZW1pbmQgdGhhdCB0aGUgbW9kaWZpZXIgaW1wbGVtZW50YXRp
b24gaGFzIGdyZWF0IHZhbHVlIGFuZCBpcwo+IG11Y2ggbW9yZSBzY2FsYWJsZSB0aGVuIHRoZSBj
dXJyZW50IFY0TDIgYXBwcm9hY2guIFRoZXJlIGhhcyBiZWVuIHNvbWUKPiBlYXJseSBwcm9wb3Nh
bCBmb3IgdGhpcywgbWF5YmUgaXQncyB0aW1lIHRvIHByaW9yaXRpemUgYmVjYXVzZSB0aGlzCj4g
bGlzdCB3aWxsIHN0YXJ0cyBncm93aW5nIHdpdGggaHVuZHJlZCBvciBldmVuIHRob3VzYW5kcyBv
ciBmb3JtYXQsCj4gd2hpY2ggaXMgY2xlYXJseSBpbmRpY2F0ZWQgYnkgdGhlIGluY3JlYXNlIG9m
IG1vZGlmaWVyIGdlbmVyYXRvciBtYWNybwo+IG9uIHRoZSBEUk0gc2lkZS4KPiAKPiA+ICAJCWRl
ZmF1bHQ6Cj4gPiAgCQkJaWYgKGZtdC0+ZGVzY3JpcHRpb25bMF0pCj4gPiAgCQkJCXJldHVybjsK
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPiA+IGluZGV4IGMzYTFjZjFjNTA3Zi4uOTBiOTk0OWFj
YjhhIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oCj4gPiAr
KysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPiA+IEBAIC03MDUsNiArNzA1LDE1
IEBAIHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgewo+ID4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX0ZX
SFQgICAgIHY0bDJfZm91cmNjKCdGJywgJ1cnLCAnSCcsICdUJykgLyogRmFzdCBXYWxzaCBIYWRh
bWFyZCBUcmFuc2Zvcm0gKHZpY29kZWMpICovCj4gPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfRldI
VF9TVEFURUxFU1MgICAgIHY0bDJfZm91cmNjKCdTJywgJ0YnLCAnVycsICdIJykgLyogU3RhdGVs
ZXNzIEZXSFQgKHZpY29kZWMpICovCj4gPiAgCj4gPiArLyoKPiA+ICsgKiBDb21wcmVzc2VkIEx1
bWluYW5jZStDaHJvbWluYW5jZSBtZXRhLWZvcm1hdHMKPiA+ICsgKiBJbiB0aGVzZSBmb3JtYXRz
LCB0aGUgY29tcG9uZW50IG9yZGVyaW5nIGlzIHNwZWNpZmllZCAoWSwgZm9sbG93ZWQgYnkgVQo+
ID4gKyAqIHRoZW4gViksIGJ1dCB0aGUgZXhhY3QgTGluZWFyIGxheW91dCBpcyB1bmRlZmluZWQu
Cj4gPiArICogVGhlc2UgZm9ybWF0cyBjYW4gb25seSBiZSB1c2VkIHdpdGggYSBub24tTGluZWFy
IG1vZGlmaWVyLgo+ID4gKyAqLwo+ID4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX1lVVjQyMF84QklU
CXY0bDJfZm91cmNjKCdZJywgJ1UnLCAnMCcsICc4JykgLyogMS1wbGFuZSBZVVYgNDoyOjAgOC1i
aXQgKi8KPiA+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9ZVVY0MjBfMTBCSVQJdjRsMl9mb3VyY2Mo
J1knLCAnVScsICcxJywgJzAnKSAvKiAxLXBsYW5lIFlVViA0OjI6MCAxMC1iaXQgKi8KPiA+ICsK
PiA+ICAvKiAgVmVuZG9yLXNwZWNpZmljIGZvcm1hdHMgICAqLwo+ID4gICNkZWZpbmUgVjRMMl9Q
SVhfRk1UX0NQSUExICAgIHY0bDJfZm91cmNjKCdDJywgJ1AnLCAnSScsICdBJykgLyogY3BpYTEg
WVVWICovCj4gPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfV05WQSAgICAgdjRsMl9mb3VyY2MoJ1cn
LCAnTicsICdWJywgJ0EnKSAvKiBXaW5ub3YgaHcgY29tcHJlc3MgKi8KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
