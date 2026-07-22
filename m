Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255E5C44539
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2026 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR6Uia4pmMofUpjUeYLqplMLkPcoRZVXwnSB2zEWFfs=; b=GwzNnEXZct14It
	JQQiIs/ZPECqitXoFChCsi9Uhldf9T6yd2HdEB+Sw/dW90bLJCG29p1Vy4aj/OmDZloThmotWGyMV
	5dZeJGGPIKyqPqx3F9I+ppN5TtRUHKXGrSe8rUkZjtD2xLXQSf+tOPIiLjxHreH1402eGh3HIPbAr
	FAniam2jTkGTk5qWPp/eWU79T6o9GhE0Q0yxIhRfEwYoWTZw66u38AP95dP0iG89VqCZZPSUqfgak
	n85JUE1vZy3R8hRQFHB48Z8ffauwROqYseE0grbzoEg2EKyed5hggUF+QHwqePMMOonZjo0LeUGSP
	D7lPeHldKGODWxV02HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSeA-0000000BIgl-0gdk;
	Wed, 22 Jul 2026 08:49:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSe8-0000000BIgT-3w9T
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Jul 2026 08:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3771600DA;
	Wed, 22 Jul 2026 08:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA081F000E9;
	Wed, 22 Jul 2026 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784710183;
	bh=F5s3g1MeLbxf1gwfxm8R7xj+QFBkRoVjIue3b+RtU78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lO02uZ5LXe8fKk8gmQF5vqtRi5fWbyJY2eWV8gDsb9p35B+FpLp/7EbfJf3ZKyHvA
	 qmBj0NyfI8qN/Ar3H4QFlNvsOU8CzF66BOLstqjD3j2MDKUXwa4zG1qW5INST0WAhE
	 HVLU1zfXLfDgswHU7jhE0WE0N9Pzk7S3+xid9IGsNPM+u/I9dPRM3i9aJc8f/pMP90
	 Rqtfv38iKCR586/AJnwUhcogaaSn732i49jA4lvcHJ3JPEEoPNxie9TSek7p6ifcUY
	 uSw0h2K+iqz7iLt159lrFMctNthFpLTHNYhpc0cIopgOaZ2n2yaFMIkNwYguhLqOsV
	 qEfCVHUJcCdmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A9 power domains
 controller
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
Date: Wed, 22 Jul 2026 08:49:42 +0000
Message-Id: <20260722084943.4DA081F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBkdWUgdG8gbWlzc2luZyAucmVtb3ZlIGNhbGxiYWNrIGZv
ciBtZXNvbl9zZWN1cmVfcHdyYyBkcml2ZXIKLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRDSCAyLzNd
IHBtZG9tYWluOiBhbWxvZ2ljOiBBZGQgc3VwcG9ydCBmb3IgQTkgcG93ZXIgZG9tYWlucyBjb250
cm9sbGVyIC0tLQpjb21taXQgMDA3NGE1YWI5Yjg1Zjg0MzI1YmZjMmJmMTRjOGZiNDhmY2QxNGZi
MApBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgoKcG1kb21h
aW46IGFtbG9naWM6IEFkZCBzdXBwb3J0IGZvciBBOSBwb3dlciBkb21haW5zIGNvbnRyb2xsZXIK
ClRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIEE5IHBvd2VyIGNvbnRyb2xsZXIgaW4g
dGhlIEFtbG9naWMKc2VjdXJlIHBvd2VyIGRvbWFpbiBkcml2ZXIuIEl0IGludHJvZHVjZXMgdGhl
IEE5IGRvbWFpbiBkZXNjcmlwdG9ycwphbmQgYWRkcyB0aGUgY29ycmVzcG9uZGluZyBjb21wYXRp
YmxlIHN0cmluZyB0byB0aGUgbWF0Y2ggdGFibGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bt
ZG9tYWluL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYyBiL2RyaXZlcnMvcG1kb21haW4vYW1s
b2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jCj4gaW5kZXggMWQyZjM3MWQyZDdmMC4uMTMzNTQ5OTU2
ZWZhNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BtZG9tYWluL2FtbG9naWMvbWVzb24tc2VjdXJl
LXB3cmMuYwo+ICsrKyBiL2RyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdy
Yy5jCgpbIC4uLiBdCgo+IEBAIC00NjgsNiArNTMzLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG1lc29uX3NlY3VyZV9wd3JjX21hdGNoX3RhYmxlW10gPSB7Cj4gIAkJLmNv
bXBhdGlibGUgPSAiYW1sb2dpYyxhNS1wd3JjIiwKPiAgCQkuZGF0YSA9ICZhbWxvZ2ljX3NlY3Vy
ZV9hNV9wd3JjX2RhdGEsCj4gIAl9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxlID0gImFtbG9naWMs
YTktcHdyYyIsCj4gKwkJLmRhdGEgPSAmYW1sb2dpY19zZWN1cmVfYTlfcHdyY19kYXRhLAo+ICsJ
fSwKPiAgCXsKPiAgCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGMzLXB3cmMiLAo+ICAJCS5kYXRh
ID0gJmFtbG9naWNfc2VjdXJlX2MzX3B3cmNfZGF0YSwKPiAgCX0sCgpbU2V2ZXJpdHk6IEhpZ2hd
ClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgd2hpbGUgcmV2
aWV3aW5nIHRoZXNlCmNoYW5nZXMgSSBub3RpY2VkIGEgcHJlLWV4aXN0aW5nIGlzc3VlIHdpdGgg
dGhlIHBsYXRmb3JtIGRyaXZlciByZWdpc3RyYXRpb246CgpzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBtZXNvbl9zZWN1cmVfcHdyY19kcml2ZXIgPSB7CiAgICAgICAgLnByb2JlID0gbWVz
b25fc2VjdXJlX3B3cmNfcHJvYmUsCiAgICAgICAgLmRyaXZlciA9IHsKICAgICAgICAgICAgICAg
IC5uYW1lICAgICAgICAgICA9ICJtZXNvbl9zZWN1cmVfcHdyYyIsCiAgICAgICAgICAgICAgICAu
b2ZfbWF0Y2hfdGFibGUgPSBtZXNvbl9zZWN1cmVfcHdyY19tYXRjaF90YWJsZSwKICAgICAgICB9
LAp9OwoKRG9lcyBtZXNvbl9zZWN1cmVfcHdyY19kcml2ZXIgbGFjayBhIC5yZW1vdmUgY2FsbGJh
Y2s/CgpJZiB0aGlzIGRyaXZlciBpcyB1bmJvdW5kIHZpYSBzeXNmcyBvciB1bmxvYWRlZCBhcyBh
IG1vZHVsZSwgaXQgc2VlbXMgCnBtX2dlbnBkX3JlbW92ZSgpLCBwbV9nZW5wZF9yZW1vdmVfc3Vi
ZG9tYWluKCksIGFuZCBvZl9nZW5wZF9kZWxfcHJvdmlkZXIoKSAKYXJlIG5ldmVyIGNhbGxlZCB0
byBkZXJlZ2lzdGVyIHRoZSBkb21haW5zLgoKU2luY2UgdGhlIGRyaXZlciBjb3JlJ3MgZGV2cmVz
IGNsZWFudXAgd2lsbCBmcmVlIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGZvciAKdGhlIGdlbmVyaWMg
cG93ZXIgZG9tYWlucyB1cG9uIHJlbW92YWwsIGNvdWxkbid0IHRoaXMgbGVhdmUgZGFuZ2xpbmcg
cG9pbnRlcnMgCmluIHRoZSBnbG9iYWwgZ3BkX2xpc3QgYW5kIG9mX2dlbnBkX3Byb3ZpZGVycyBs
aXN0cywgY2F1c2luZyBhIFVzZS1BZnRlci1GcmVlIAp3aGVuIHRoZSBwb3dlciBkb21haW4gZnJh
bWV3b3JrIHRyYXZlcnNlcyB0aGVtPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMi1hOS1wbS12MS0wLTFmZTIwYTQ0YmYyZEBh
bWxvZ2ljLmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
