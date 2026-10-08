Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F181CA6007
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gvzx3NXoLmqcXSTVEy2bDEv2iBwZxuRAxuGzILh2fyg=; b=CstL5smcEk10cA
	ObRteMkl+Lr2yAftXyacQQpLdW7CxScAcGyEfbclAVjDZthDRouh+sLlHIvP9bfajBJW2it0z9ug6
	JMLHRg+eCqoYs0s0mSSy/RoQSb5h5K0Ioh6vX2IaL0jKHIF4F7KeKQ7GrPddi/foDWhONJXm2CTlF
	6VT6fnEtjQXpfMp1jnK+cYwXpdPjpOjlc/iJlkj7X/NlTf07JFnJE5Die53QeoAX9TeWcBlWe8+9z
	PzgNZMA8KG6jXv4GPS0M3C6ElzWtu4k5BtBCA87K1U8VETULyMfJbsyzhOoyETFg6mSdRsKKlNpN3
	pHCc2KD3MGtCQDzi5DUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpIH-00000004YfG-3zZG;
	Thu, 08 Oct 2026 14:40:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpIH-00000004Yev-0RNJ
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 14:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7AF1429F5;
	Thu,  8 Oct 2026 14:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8478E1F000FF;
	Thu,  8 Oct 2026 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791470424;
	bh=VBdNS1eTqcKiqborFO2R14T2kzLEaTofOmV+FW67Oew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwqQTEQ2iCI5BPCz+a/st9BJmuEeDgWiWlRQts32g4Xebqc0ifce81Cx0ER4FiCtA
	 SYgbpkhGGO+xz1dUseVrSZtvRdnms5nJKibJ0KhAFTs3gXXnKryHKYQ3zVumI5Du75
	 li0v/tB4QQSqbtXuA/BuQeQ2Hgz/coB45c57LGCz1Kk2V5uRC+/tLUcAqcqCO6dLqk
	 N6LdS0p/KvCjubgEX+bGpwaOItN+SP3e4qRIuctvBuAjtypL5pHpd3liA5ZKeGC/iA
	 Db9gAHit1Un0Aol26mH55HqLzejZLuSCaSFzLUg3V26TONoRb1x3J9JfOvbMaBQt1W
	 b2ris79JW/+kA==
Message-ID: <sashiko-outbox-164314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mmc: meson-gx: report the longest busy wait the
 controller can do
To: "Igor Velkov" <iav@iav.lv>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261008-meson-gx-busy-timeout-v2-3-8bde1adfb5b4@iav.lv>
References: <20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv>
 <20261008-meson-gx-busy-timeout-v2-3-8bde1adfb5b4@iav.lv>
Date: Thu, 08 Oct 2026 14:40:24 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG1tYzogbWVzb24tZ3g6
IG1heF9idXN5X3RpbWVvdXQgcGF0Y2ggdW5tYXNrcyBwcmUtZXhpc3RpbmcgbG9naWMgYnVnIGNh
dXNpbmcgc2tpcHBlZCBidXN5IHdhaXRzCi0tCgpjb21taXQgODM5MjQ3M2ZmZTdmZTA1ZWEzMWE1
ODdlOWQ2ODJhMjIwMWNiMzQwYwpBdXRob3I6IElnb3IgVmVsa292IDxpYXZAaWF2Lmx2PgoKbW1j
OiBtZXNvbi1neDogcmVwb3J0IHRoZSBsb25nZXN0IGJ1c3kgd2FpdCB0aGUgY29udHJvbGxlciBj
YW4gZG8KClRoZSBkcml2ZXIgZG9lcyBub3QgY3VycmVudGx5IHNldCBtYXhfYnVzeV90aW1lb3V0
LCBsZWFkaW5nIHRoZSBjb3JlIHRvCmFzc3VtZSBpdCBjYW4gd2FpdCBpbmRlZmluaXRlbHkgYW5k
IHNlbmQgY29tbWFuZHMgd2l0aCB0aW1lb3V0cyB0aGF0IGV4Y2VlZAp0aGUgY29udHJvbGxlcidz
IG1heGltdW0gY2FwYWJpbGl0eS4gVGhpcyBwYXRjaCBleHBsaWNpdGx5IHNldHMKbWF4X2J1c3lf
dGltZW91dCB0byBmb3JjZSB0aGUgY29yZSB0byBzaXplIGRpc2NhcmRzIGFwcHJvcHJpYXRlbHkg
YW5kIGZhbGwKYmFjayB0byBzb2Z0d2FyZSBwb2xsaW5nIGZvciBsb25nIHdhaXRzLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBiL2RyaXZlcnMvbW1jL2hv
c3QvbWVzb24tZ3gtbW1jLmMKPiBpbmRleCBkZDdkM2Q2N2YwMjkwLi44ZGUzZWI2NWNjYjA3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiArKysgYi9kcml2
ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gQEAgLTExODMsNiArMTE4Myw5IEBAIHN0YXRp
YyBpbnQgbWVzb25fbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+
ICAJbW1jLT5jYXBzIHw9IE1NQ19DQVBfQ01EMjM7Cj4gIAo+ICsJLyogVGhlIGxvbmdlc3QgYnVz
eSB3YWl0IHRoZSBDTURfQ0ZHIHRpbWVvdXQgZmllbGQgY2FuIGhvbGQuICovCj4gKwltbWMtPm1h
eF9idXN5X3RpbWVvdXQgPSBTRF9FTU1DX0NNRF9USU1FT1VUX01BWDsKPiArCgpbU2V2ZXJpdHk6
IEhpZ2hdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQg
ZG9lcyBzZXR0aW5nIHRoZQptYXhfYnVzeV90aW1lb3V0IGhlcmUgdW5tYXNrIGEgYnVnIGluIHRo
ZSBzb2Z0d2FyZSBwb2xsaW5nIGZhbGxiYWNrPwoKV2hlbiBhIGxvbmctcnVubmluZyBjb21tYW5k
IGV4Y2VlZHMgdGhpcyB0aW1lb3V0LCB0aGUgTU1DIGNvcmUgZHJvcHMgdGhlCmhhcmR3YXJlIFIx
QiBidXN5IHdhaXQgYW5kIHJlbGllcyBvbiBzb2Z0d2FyZSBwb2xsaW5nIHVzaW5nCm1lc29uX21t
Y19jYXJkX2J1c3koKS4KCkhvd2V2ZXIsIG1lc29uX21tY19jYXJkX2J1c3koKSByZXF1aXJlcyBh
bGwgNCBEQVQgbGluZXMgdG8gYmUgbG93OgoKZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMu
YzptZXNvbl9tbWNfY2FyZF9idXN5KCkgewoJLi4uCglyZWd2YWwgPSByZWFkbChob3N0LT5yZWdz
ICsgU0RfRU1NQ19TVEFUVVMpOwoKCS8qIFdlIGFyZSBvbmx5IGludGVycmVzdGVkIGluIGxpbmVz
IDAgdG8gMywgc28gbWFzayB0aGUgb3RoZXIgb25lcyAqLwoJcmV0dXJuICEoRklFTERfR0VUKFNU
QVRVU19EQVRJLCByZWd2YWwpICYgMHhmKTsKfQoKU2luY2UgdGhlIE1NQy9TRCBzcGVjIGRpY3Rh
dGVzIHRoYXQgb25seSBEQVQwIGlzIHB1bGxlZCBsb3cgZHVyaW5nIGJ1c3kgd2hpbGUKREFUMS0z
IHJlbWFpbiBoaWdoLCB3b3VsZG4ndCB0aGlzIGNoZWNrIGltbWVkaWF0ZWx5IHJldHVybiBmYWxz
ZT8KCklmIHNvLCB0aGUgY29yZSB3b3VsZCBpbnN0YW50bHkgc2VuZCB0aGUgbmV4dCBjb21tYW5k
IHdoaWxlIHRoZSBjYXJkIGlzIHN0aWxsCmJ1c3kgZXJhc2luZyBvciBmbHVzaGluZy4KCkNvdWxk
IG1lc29uX21tY19jYXJkX2J1c3koKSBiZSB1cGRhdGVkIHRvIG9ubHkgY2hlY2sgREFUMD8KCj4g
IAlpZiAobW1jLT5jYXBzICYgTU1DX0NBUF9TRElPX0lSUSkKPiAgCQltbWMtPmNhcHMyIHw9IE1N
Q19DQVAyX1NESU9fSVJRX05PVEhSRUFEOwo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDA4LW1lc29uLWd4LWJ1c3ktdGltZW91
dC12Mi0wLThiZGUxYWRmYjViNEBpYXYubHY/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
