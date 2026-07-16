Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746AC44512
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx2JctumvHWg8HQHVqJCN4MU7/mHywCaOT4qox2yNTI=; b=uyDHx21YQ8eMAs
	Gaw2rviYe8xcC8Kc0B6TgDTpd5CKAXGox0rN98ZvEvGPY7KNMj4uT5KYUTOQaTaerlLty/446YiHH
	YMoeF9IaansodcdNMQg8NDChD9/T5A838ZCPISlR7c0ieRndT1v7VvmtHgFtD0cOTKPX4uTTxRLqo
	CHfSzHV5ZskgVB78K1pL/rGF2AnkEV1HhuI6kaZ16W/QlUUZ67EAv56PRUj/RnXXFbSgDY4KsBPCS
	NBbd8BlYz+P9DP0Q7E9UI2jBk2Ix0dWCw8oAN1V5z5m28BJiejppYgCKHP6JPQb/jRudahfiVtDlc
	rPT502XADW30kMx7iFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTwW-00000000gRr-3xWm;
	Thu, 16 Jul 2026 21:48:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTwV-00000000gRT-08UM
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 21:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9BD417F4;
	Thu, 16 Jul 2026 21:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530481F000E9;
	Thu, 16 Jul 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784238510;
	bh=2UDogGLhSnQV2ldmUrOhnPjIkMikwziPcFYzIqm2udo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUldGeuZVf05QFExc72vuUZI3mc/QMFV+hvnYWe208DBXcVFw6p0PpDiWDnune1WA
	 HR0mOt8Qk3lenE4JJo4WRD7ajpmD1moaH6GApUaUrb+u8+mbTyPaNmGrIuVBUmFBNu
	 SV0plckYA7+L06npk1Fuy5Ts4Qh7gHG8NH/6078GTi5YPvdaunodK3YiKwkvyffPsJ
	 iSgwz3dV+1jDtkzc2lW6UYutOuqEdxQ86amupzbLaNATXf4/q2J0I9vsZVQ+X/4l7P
	 0vHhg95UhAiYqX46O4WYb5QkGJQ3qIsLxHjIb8mMmPu37fAqDPJ7ZLa3Si2zApq4s2
	 eQxm1gzR5crXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] media: meson-ir-tx: Ensure clock is disabled
 on unbind
To: "Sean Young" <sean@mess.org>
Cc: media-ci@linuxtv.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <5f880faac5530202a07dcf92329476608bbabfc1.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
 <5f880faac5530202a07dcf92329476608bbabfc1.1783977550.git.sean@mess.org>
Date: Thu, 16 Jul 2026 21:48:29 +0000
Message-Id: <20260716214830.530481F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
c2UtQWZ0ZXItRnJlZSBpbiB0aGUgcmVkcmF0MyBwcm9iZSBlcnJvciBwYXRoLgoKUHJlLWV4aXN0
aW5nIGlzc3VlczoKLSBbSGlnaF0gSW5jb21wbGV0ZSBmaXggZm9yIElSUSByYWNlIGNvbmRpdGlv
biBkdXJpbmcgcmVtb3ZlLCBsZWFkaW5nIHRvIGtlcm5lbCBwYW5pYyBhbmQgdXNlLWFmdGVyLWZy
ZWUuCi0tCgotLS0gUGF0Y2ggWzddOiBbUEFUQ0ggdjIgMDcvMTFdIG1lZGlhOiBtZXNvbi1pci10
eDogRW5zdXJlIGNsb2NrIGlzIGRpc2FibGVkIG9uIHVuYmluZCAtLS0KY29tbWl0IDc5MzZkMzdi
OWQ1NDEyYTEyZDdhNjEwNTI4MjczYTNiYjdlN2FkYTIKQXV0aG9yOiBTZWFuIFlvdW5nIDxzZWFu
QG1lc3Mub3JnPgoKbWVkaWE6IG1lc29uLWlyLXR4OiBFbnN1cmUgY2xvY2sgaXMgZGlzYWJsZWQg
b24gdW5iaW5kCgpjbGtfcHJlcGFyZV9lbmFibGUoKSBuZWVkcyBhIGNhbGwgdG8gY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKCkgb24gZHJpdmVyCnVuYmluZC4gTWFrZSBpdCBkZXZtIG1hbmFnZWQuCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3JjL3JlZHJhdDMuYyBiL2RyaXZlcnMvbWVkaWEv
cmMvcmVkcmF0My5jCj4gaW5kZXggM2Y4MjhhNTY0ZTE5Mi4uYjY0YzY0NDBiMDYyZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3JjL3JlZHJhdDMuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cmMvcmVkcmF0My5jCgpbIC4uLiBdCgo+IEBAIC0xMTExLDE3ICsxMTI3LDIwIEBAIHN0YXRpYyBp
bnQgcmVkcmF0M19kZXZfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCj4gIAkvKiBt
aWdodCBiZSBhbGwgd2UgbmVlZCB0byBkbz8gKi8KPiAgCXJldHZhbCA9IHJlZHJhdDNfZW5hYmxl
X2RldGVjdG9yKHJyMyk7Cj4gIAlpZiAocmV0dmFsIDwgMCkKPiAtCQlnb3RvIGxlZF9mcmVlOwo+
ICsJCWdvdG8gcmNfZnJlZTsKPiAgCj4gIAkvKiB3ZSBjYW4gcmVnaXN0ZXIgdGhlIGRldmljZSBu
b3csIGFzIGl0IGlzIHJlYWR5ICovCj4gIAl1c2Jfc2V0X2ludGZkYXRhKGludGYsIHJyMyk7Cj4g
IAo+ICAJcmV0dXJuIDA7Cj4gIAo+ICtyY19mcmVlOgo+ICsJcmNfdW5yZWdpc3Rlcl9kZXZpY2Uo
cnIzLT5yYyk7Cj4gIGxlZF9mcmVlOgo+ICAJbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoJnJyMy0+
bGVkKTsKPiAgcmVkcmF0X2ZyZWU6Cj4gIAlyZWRyYXQzX2RlbGV0ZShycjMsIHJyMy0+dWRldik7
Cj4gKwlyY19mcmVlX2RldmljZShycjMtPnJjKTsKCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoaXMg
ZXJyb3IgcGF0aCB0cmlnZ2VyIGEgdXNlLWFmdGVyLWZyZWUgb24gdGhlIHJyMyBwb2ludGVyPwoK
V2hlbiByZWRyYXQzX2RlbGV0ZSgpIGlzIGNhbGxlZCBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0
aCwgaXQKdW5jb25kaXRpb25hbGx5IGZyZWVzIHRoZSBycjMgc3RydWN0dXJlOgoKZHJpdmVycy9t
ZWRpYS9yYy9yZWRyYXQzLmM6cmVkcmF0M19kZWxldGUoKSB7CiAgICAuLi4KICAgIGtmcmVlKHJy
Myk7Cn0KCkRpcmVjdGx5IGFmdGVyIHRoaXMsIHJjX2ZyZWVfZGV2aWNlKHJyMy0+cmMpIGlzIGV4
ZWN1dGVkLCB3aGljaCBkZXJlZmVyZW5jZXMKdGhlIG5ld2x5IGZyZWVkIHJyMyBwb2ludGVyIHRv
IGFjY2VzcyB0aGUgcmMgbWVtYmVyLgoKU2hvdWxkIHJjX2ZyZWVfZGV2aWNlKCkgYmUgY2FsbGVk
IGJlZm9yZSByZWRyYXQzX2RlbGV0ZSgpIHRvIGF2b2lkIHRoaXM/Cgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3JjL3N1bnhpLWNpci5jIGIvZHJpdmVycy9tZWRpYS9yYy9zdW54aS1jaXIu
Ywo+IGluZGV4IDI4ZTg0MGE3ZTViOGMuLmFmMWVlMDhmZmRiZWMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tZWRpYS9yYy9zdW54aS1jaXIuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcmMvc3VueGkt
Y2lyLmMKClsgLi4uIF0KCj4gQEAgLTM3NCw4ICszNzQsOCBAQCBzdGF0aWMgdm9pZCBzdW54aV9p
cl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBzdW54aV9p
ciAqaXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgCj4gIAlyY191bnJlZ2lzdGVy
X2RldmljZShpci0+cmMpOwo+IC0JcmNfZnJlZV9kZXZpY2UoaXItPnJjKTsKPiAgCXN1bnhpX2ly
X2h3X2V4aXQoJnBkZXYtPmRldik7Cj4gKwlyY19mcmVlX2RldmljZShpci0+cmMpOwo+ICB9Cgpb
U2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIG1v
dmluZyByY19mcmVlX2RldmljZSgpIGFmdGVyCnN1bnhpX2lyX2h3X2V4aXQoKSBzdGlsbCBsZWF2
ZSBhIHJhY2UgY29uZGl0aW9uIHRoYXQgY291bGQgY2F1c2UgYSBrZXJuZWwKcGFuaWM/CgpCZWNh
dXNlIHN1bnhpX2lyX3Byb2JlKCkgdXNlcyBkZXZtX3JlcXVlc3RfaXJxKCksIHRoZSBpbnRlcnJ1
cHQgcmVtYWlucwphY3RpdmUgdW50aWwgZGV2cmVzIGNsZWFudXAgZXhlY3V0ZXMgYWZ0ZXIgc3Vu
eGlfaXJfcmVtb3ZlKCkgcmV0dXJucy4gSWYgYW4KaW50ZXJydXB0IGZpcmVzIGFmdGVyIHN1bnhp
X2lyX2h3X2V4aXQoKSBkaXNhYmxlcyB0aGUgQVBCIGNsb2NrcyBidXQgYmVmb3JlCmRldnJlcyBk
ZXJlZ2lzdGVycyB0aGUgSVJRLCBzdW54aV9pcl9pcnEoKSB3aWxsIGV4ZWN1dGUgYW5kIHJlYWQg
ZnJvbSB0aGUKdW5jbG9ja2VkIFNVTlhJX0lSX1JYU1RBX1JFRyByZWdpc3Rlci4KCk9uIEFSTSBh
cmNoaXRlY3R1cmVzLCBhY2Nlc3NpbmcgdGhpcyByZWdpc3RlciB3aGVuIHRoZSBBUEIgY2xvY2sg
aXMgZGlzYWJsZWQKY2F1c2VzIGEgc3luY2hyb25vdXMgZXh0ZXJuYWwgYWJvcnQsIHJlc3VsdGlu
ZyBpbiBhIGtlcm5lbCBwYW5pYy4gSWYgdGhlCmV4ZWN1dGlvbiBzb21laG93IHByb2NlZWRzLCB0
aGUgaGFuZGxlciB3b3VsZCBhbHNvIGRlcmVmZXJlbmNlIHRoZSBuZXdseQpmcmVlZCBpci0+cmMg
cG9pbnRlci4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvY292ZXIuMTc4Mzk3NzU1MC5naXQuc2VhbkBtZXNzLm9yZz9wYXJ0PTcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
