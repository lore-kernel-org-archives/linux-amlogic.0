Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6AC88E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BT3wcmCNbERglWKoOwj85vE4KH2rnO6Cc/+N7z9PCU8=; b=pJLrpo3hhAy9SU
	sYLBXuHVpG//JHmrcTpO136J1yoELmXOoUUPD9d4LBP5KHi9snDuhJBXhIQpBJv7WkX3TENBUCmm0
	iJiT0pYo6nnZpePeOEgcIcp6jeFambXWPEfFvO1Ts7V5EYPpkJrBK7PoRKOx4b1urdmnCTO/569p2
	WQBQ1LmO/arihHsTtD+50Jovg611j3KvqwF50G+J/jPe3WTWIkdu9ElTCxif0oDMhr5uq3uQvE4UN
	ZabQpx0itc0Y9+KH286if2WcRCOPUloB1p6kvBeXbJEsBA9C2hSK84+/daUkYG8APsOs8U0YcxsVz
	e3bF/6f9dgHGvOoAnbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62g9-00000002s51-21wu;
	Mon, 14 Sep 2026 09:08:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62g7-00000002s4Y-3x60
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 09:08:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D62060008;
	Mon, 14 Sep 2026 09:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A8F1F000FF;
	Mon, 14 Sep 2026 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376922;
	bh=xE1+Esup3rk0Q4HW/H0F8g0WgWMGpjevPh/tJZgcUew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KVxXxj8Sxvjnq5k+KDjI6rHfLcVH9IpTnR9bFUiRED2p9bBVvN4dRYPhNyQR3YJWr
	 f6rF68sAhCtafEIpQUShhAe/i/gqzGZNyz8S9q8rEmEkIkzwN888Txf54t/9zrtvdB
	 kcZkGfoay/d6/6ocNmjb/WD7ZmLsilOABCK55mydLL5dktrVbOZm+GIdDhe6umy1J7
	 4hyRhL3fO4h62iR7ddAyN7lbYuEBOkfdKT0mi4ug7XbtR4E2VMKbJQXKp8cBe2vRzF
	 FYqqa1JoqqeSM1c2G58JTs0/SePjw0us0qBhs9zogObXNkQa+YfFy3It27rgRVj0a1
	 DiaOLuMChzqhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
Date: Mon, 14 Sep 2026 09:08:42 +0000
Message-Id: <20260914090842.B3A8F1F000FF@smtp.kernel.org>
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
IFtDcml0aWNhbF0gVGhlIGRyaXZlciBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgYHBtX2dl
bnBkX2luaXQoKWAsIHdoaWNoIGNhdXNlcyBhIGNyaXRpY2FsIFVzZS1BZnRlci1GcmVlIGR1cmlu
ZyBzeXN0ZW0gYm9vdCBpZiBpbml0aWFsaXphdGlvbiBmYWlscy4KLS0KCmNvbW1pdCBlM2I3ZDYx
YjdiN2U4ODM4NzY3ZDIwOTNiY2MxMDYzOGVjOGJiZDg0CkF1dGhvcjogUWluZ3BlbmcgWWFuZyA8
cWluZ3BlbmcueWFuZ0BhbWxvZ2ljLmNvbT4KCnBtZG9tYWluOiBhbWxvZ2ljOiBLZWVwIEFtbG9n
aWMgQTkgRVRIIGRvbWFpbiBhbHdheXMgb24KICAgIApUaGlzIGNvbW1pdCBtYXJrcyB0aGUgQW1s
b2dpYyBBOSBldGhlcm5ldCBwb3dlciBkb21haW4gYXMgYWx3YXlzLW9uLgpUaGUgY2hhbmdlIGlz
IGludGVuZGVkIHRvIGVuc3VyZSB0aGUgZG9tYWluIHJlbWFpbnMgcG93ZXJlZCB0byBzdXBwb3J0
CmV0aGVybmV0IG9ubGluZSB3YWtldXAgZnVuY3Rpb25hbGl0eS4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jIGIvZHJpdmVycy9wbWRv
bWFpbi9hbWxvZ2ljL21lc29uLXNlY3VyZS1wd3JjLmMKPiBpbmRleCAxMzM1NDk5NTZlZmE0Li5k
YWYwOWNmODYzMzViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNv
bi1zZWN1cmUtcHdyYy5jCj4gKysrIGIvZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLXNl
Y3VyZS1wd3JjLmMKPiBAQCAtMTk2LDcgKzE5Niw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVz
b25fc2VjdXJlX3B3cmNfZG9tYWluX2Rlc2MgYTlfcHdyY19kb21haW5zW10gPSB7Cj4gIAlTRUNf
UEQoQTlfVklDUCwJCTApLAo+ICAJU0VDX1BEKEE5X1NEX0VNTUNfQSwJMCksCj4gIAlTRUNfUEQo
QTlfU0RfRU1NQ19CLAkwKSwKPiAtCVNFQ19QRChBOV9FVEgsCQkwKSwKPiArCS8qIEVUSCBpcyBm
b3IgZXRoZXJuZXQgb25saW5lIHdha2V1cCwgYW5kIHNob3VsZCBiZSBhbHdheXMgb24gKi8KPiAr
CVNFQ19QRChBOV9FVEgsCQlHRU5QRF9GTEFHX0FMV0FZU19PTiksCgpbU2V2ZXJpdHk6IENyaXRp
Y2FsXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyBhZGRpbmcgR0VOUERf
RkxBR19BTFdBWVNfT04gaGVyZSByaXNrCmEgdXNlLWFmdGVyLWZyZWUgZHVyaW5nIHN5c3RlbSBi
b290IGlmIHRoZSBldGhlcm5ldCBkb21haW4gZmFpbHMgdG8gcG93ZXIgb24/CgpJZiB0aGUgQTlf
RVRIIGhhcmR3YXJlIHN0YXRlIGlzIG9mZiBhbmQgdGhlIHVuZGVybHlpbmcgZmlybXdhcmUgY2Fs
bCBmYWlscyB0bwpwb3dlciBpdCBvbiwgcG1fZ2VucGRfaW5pdCgpIHJldHVybnMgLUVJTlZBTCBi
ZWNhdXNlIGl0IHN0cmljdGx5IGVuZm9yY2VzIHRoZQphbHdheXMtb24gY29uc3RyYWludDoKCmRy
aXZlcnMvcG1kb21haW4vY29yZS5jOnBtX2dlbnBkX2luaXQoKSB7CiAgICAuLi4KICAgIC8qIEFs
d2F5cy1vbiBkb21haW5zIG11c3QgYmUgcG93ZXJlZCBvbiBhdCBpbml0aWFsaXphdGlvbi4gKi8K
ICAgIGlmICgoZ2VucGRfaXNfYWx3YXlzX29uKGdlbnBkKSB8fCBnZW5wZF9pc19ycG1fYWx3YXlz
X29uKGdlbnBkKSkgJiYKICAgICAgICAgICAgIWdlbnBkX3N0YXR1c19vbihnZW5wZCkpIHsKICAg
ICAgICBwcl9lcnIoImFsd2F5cy1vbiBQTSBkb21haW4gJXMgaXMgbm90IG9uXG4iLCBnZW5wZC0+
bmFtZSk7CiAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICB9CiAgICAuLi4KfQoKVGhlIHByb2Jl
IGZ1bmN0aW9uIGluIHRoZSBBbWxvZ2ljIHNlY3VyZSBwb3dlciBjb250cm9sbGVyIGRyaXZlciBj
dXJyZW50bHkKaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHBtX2dlbnBkX2luaXQoKSwgbGVh
dmluZyB0aGUgZmFpbGVkIGRvbWFpbgp1bmluaXRpYWxpemVkIGFuZCBvdXQgb2YgdGhlIGdsb2Jh
bCBncGRfbGlzdDoKCmRyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5j
Om1lc29uX3NlY3VyZV9wd3JjX3Byb2JlKCkgewogICAgLi4uCiAgICBmb3IgKGkgPSAwOyBpIDwg
bWF0Y2gtPmNvdW50OyBpKyspIHsKICAgICAgICAuLi4KICAgICAgICBwbV9nZW5wZF9pbml0KCZk
b20tPmJhc2UsIE5VTEwsIG1hdGNoLT5kb21haW5zW2ldLmlzX29mZihkb20pKTsKICAgICAgICBw
d3JjLT54bGF0ZS5kb21haW5zW2ldID0gJmRvbS0+YmFzZTsKICAgIH0KICAgIC4uLgp9CgpXaGVu
IHRoZSBwcm9iZSBmdW5jdGlvbiBsYXRlciBjYWxscyBvZl9nZW5wZF9hZGRfcHJvdmlkZXJfb25l
Y2VsbCgpLCBpdApkZXRlY3RzIHRoYXQgdGhlIGZhaWxlZCBkb21haW4gaXMgbWlzc2luZyBmcm9t
IGdwZF9saXN0IGFuZCBhYm9ydHMgcHJvdmlkZXIKcmVnaXN0cmF0aW9uLgoKVGhlIHByb2JlIGZh
aWx1cmUgdGhlbiB0cmlnZ2VycyBkZXZyZXMgY2xlYW51cCwgd2hpY2ggZnJlZXMgdGhlIGRldm1f
a2NhbGxvYwphbGxvY2F0ZWQgcHdyYy0+ZG9tYWlucyBhcnJheS4gSG93ZXZlciwgdGhlIHByZXZp
b3VzbHkgc3VjY2Vzc2Z1bGx5IGluaXRpYWxpemVkCmRvbWFpbnMgKHN1Y2ggYXMgQTlfRFNQQSkg
YXJlIG5ldmVyIHJlbW92ZWQgZnJvbSB0aGUgZ2xvYmFsIGdwZF9saXN0LiAKCkxhdGVyLCB3aGVu
IGdlbnBkX3Bvd2VyX29mZl91bnVzZWQoKSBpdGVyYXRlcyBvdmVyIGdwZF9saXN0IGR1cmluZyB0
aGUgbGF0ZQppbml0Y2FsbHMsIHdvbid0IGl0IGRlcmVmZXJlbmNlIHRoZSBmcmVlZCBtZW1vcnkg
ZnJvbSB0aGUgcHdyYy0+ZG9tYWlucyBhcnJheT8KCj4gIAlTRUNfUEQoQTlfUENJRV9BLAkwKSwK
PiAgCVNFQ19QRChBOV9QQ0lFX0IsCTApLAo+ICAJU0VDX1BEKEE5X05OQV80VCwJMCksCgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTE0LWE5LXB3ci1ldGgtdjEtMS03NTIwMDUxMzExMzVAYW1sb2dpYy5jb20/cGFydD0xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
