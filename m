Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D4ECD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mFsfDC6Fy7FDRJjDSZMorPZJccjecq/+tXOIjB1v5M=; b=uGBK8qFgxotJg4
	o1iJBbbvUp2607MU5N/KUUl9j6ORrWFxzWq1F7KB7ctQ1UwQqC1Nz4kbbN2tiHVBSkF7kdjPbLd6S
	hp2qxZItqOCqip9Hb5Qw9vzoWALJ4ehzIRyv6WlXbAUIqu/i/AP7Nn33aYwOvwNcQlVF5AdQRbJCR
	dqE51fsRzAdbHHBuXD12NfImCzoFxDpdysFldiyNX/s+n3XTXxN4/aXi+FIgMCX5lIsc6tQqJQSut
	FyUxoK8B/joEVlCpdNOf6iJ9ALjE6dvask4/bjVrcMYKAXtcFcIIWRgRj/+rD4wcyx11kzmZcpGMT
	l+6DFfOjqRKM9LpanBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKLs-0000000BKiM-37Eq;
	Sat, 16 May 2026 19:07:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKLr-0000000BKhy-0rYr
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A97A6020B;
	Sat, 16 May 2026 19:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFC3C19425;
	Sat, 16 May 2026 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778958426;
	bh=IActPDY/uwaLnqH5VofbeByS/fMz/FazPRV3SkuzJ8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YiYBsRK9BIrilTfM8x8tpERGRBQhBETKvV6Fl7hIbD8EdSmrBflqdeeWnpMDiygkz
	 DgGkumWCmVO/0E9ibpghVkTk+lhYzyZdnWOgICSeKD3DYBYTIY7TPGQbrsA1NCt+yX
	 zMcrF+e5pJeSW31ftomDbjVol8OfMaGGI1eMgS4HVu4PL8ELJ7ENDRpD5Q4K9bieXt
	 Iv8lI1YXV1lRAiATKi7pLHf1OdGI175IcicTxoKM5yx0JTIFknkC8vyeRVISAvnChy
	 s3vWt2mZDfYOawtlSDfBM+hYlA28f1KDz4U0eYQU+FugzkixQ2vfkc5DVTLL229bnG
	 4HwGMor74EIsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260516183838.2024991-10-jonas@kwiboo.se>
References: <20260516183838.2024991-10-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:07:05 +0000
Message-Id: <20260516190705.AEFC3C19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIE1vdmluZyBDRUMgcGh5
c2ljYWwgYWRkcmVzcyBpbnZhbGlkYXRpb24gZXhjbHVzaXZlbHkgdG8gZHdfaGRtaV9jb25uZWN0
b3JfZGV0ZWN0IGJyZWFrcyBDRUMgZnVuY3Rpb25hbGl0eSB3aGVuIGR3X2hkbWkgb3BlcmF0ZXMg
cHVyZWx5IGFzIGEgRFJNIGJyaWRnZS4KLS0KCmNvbW1pdCAwNTIwNjExMGQyY2JlMDJkYzVlMmNh
ZTNiNmMzZTdkMmQ4Y2RiZTQ4CkF1dGhvcjogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNl
PgpTdWJqZWN0OiBkcm06IGJyaWRnZTogZHdfaGRtaTogSW52YWxpZGF0ZSBDRUMgcGh5cyBhZGRy
IGZyb20gY29ubmVjdG9yIGRldGVjdAoKVGhpcyBjb21taXQgZGVsYXlzIHRoZSBDRUMgcGh5c2lj
YWwgYWRkcmVzcyBpbnZhbGlkYXRpb24gZnJvbSB0aGUgSVJRCmhhbmRsZXIgdW50aWwgdGhlIGNv
bm5lY3RvciBkZXRlY3Qgb3BlcmF0aW9uIGlzIGNhbGxlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCA1ZmQyNmZmOGY1NWI0Li5hYWUxYjg5MDE2
N2IxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBA
QCAtMjQ3Miw3ICsyNDcyLDE3IEBAIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+ICB7Cj4gIAlzdHJ1Y3QgZHdfaGRt
aSAqaGRtaSA9IGNvbnRhaW5lcl9vZihjb25uZWN0b3IsIHN0cnVjdCBkd19oZG1pLAo+ICAJCQkJ
CSAgICAgY29ubmVjdG9yKTsKPiAtCXJldHVybiBkd19oZG1pX2RldGVjdChoZG1pKTsKPiArCWVu
dW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzOwo+ICsKPiArCXN0YXR1cyA9IGR3X2hkbWlf
ZGV0ZWN0KGhkbWkpOwo+ICsKPiArCWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19kaXNj
b25uZWN0ZWQpIHsKPiArCQltdXRleF9sb2NrKCZoZG1pLT5jZWNfbm90aWZpZXJfbXV0ZXgpOwo+
ICsJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShoZG1pLT5jZWNfbm90aWZpZXIp
Owo+ICsJCW11dGV4X3VubG9jaygmaGRtaS0+Y2VjX25vdGlmaWVyX211dGV4KTsKPiArCX0KPiAr
Cj4gKwlyZXR1cm4gc3RhdHVzOwo+ICB9CgpEb2VzIG1vdmluZyB0aGUgaW52YWxpZGF0aW9uIGV4
Y2x1c2l2ZWx5IHRvIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdCBicmVhawpDRUMgZnVuY3Rpb25h
bGl0eSB3aGVuIHRoZSBoYXJkd2FyZSBvcGVyYXRlcyBwdXJlbHkgYXMgYSBEUk0gYnJpZGdlPwoK
QmVmb3JlIHRoaXMgY2hhbmdlLCBjZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUgd2Fz
IGNhbGxlZCBkaXJlY3RseQpmcm9tIHRoZSBoYXJkd2FyZSBpbnRlcnJ1cHQgaGFuZGxlciwgZ3Vh
cmFudGVlaW5nIGV4ZWN1dGlvbiBvbiBkaXNjb25uZWN0CnJlZ2FyZGxlc3Mgb2YgaG93IHRoZSBk
cml2ZXIgd2FzIGNvbmZpZ3VyZWQuCgpJbiBicmlkZ2Utb25seSBtb2RlLCB0aGUgY29ubmVjdG9y
IGlzIGNyZWF0ZWQgZXh0ZXJuYWxseSBhbmQKZHdfaGRtaV9jb25uZWN0b3JfZGV0ZWN0IGlzIG5l
dmVyIGV4ZWN1dGVkLiBUaGUgRFJNIGNvcmUgb3IgZG93bnN0cmVhbQpjb21wb25lbnQgaW5zdGVh
ZCBjYWxscyBkd19oZG1pX2JyaWRnZV9kZXRlY3QsIHdoaWNoIHdhcyBub3QgdXBkYXRlZCBoZXJl
CnRvIGluY2x1ZGUgdGhlIENFQyBpbnZhbGlkYXRpb24gbG9naWMuIFRoZSBDRUMgcGh5c2ljYWwg
YWRkcmVzcyBtaWdodCBub3QKYmUgaW52YWxpZGF0ZWQgb24gdW5wbHVnIGluIGJyaWRnZSBtb2Rl
LCB3aGljaCB3b3VsZCBiZSBhIHJlZ3Jlc3Npb24uCgpJIHNlZSB0aGlzIGlzIGFkZHJlc3NlZCBs
YXRlciBpbiB0aGUgc2VyaWVzIGJ5IGNvbW1pdCA3OTVjMTcyZmFkZGFiIChkcm06CmJyaWRnZTog
ZHdfaGRtaTogVXBkYXRlIEVESUQgYW5kIENFQyBwaHlzIGFkZHIgaW4gYnJpZGdlIGRldGVjdCgp
KSwgYnV0CnRoaXMgaW50ZXJtZWRpYXRlIHBhdGNoIGFwcGVhcnMgdG8gaW50cm9kdWNlIGEgZnVu
Y3Rpb25hbCByZWdyZXNzaW9uIHRoYXQKbWlnaHQgYWZmZWN0IGJpc2VjdGlvbi4KClsgLi4uIF0K
Cj4gQEAgLTMxMDYsMTIgKzMxMTYsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEo
aW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ICAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlf
SFBELAo+ICAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlfUlhfU0VOU0UpOwo+ICAKPiAt
CQlpZiAoKHBoeV9zdGF0ICYgKEhETUlfUEhZX1JYX1NFTlNFIHwgSERNSV9QSFlfSFBEKSkgPT0g
MCkgewo+IC0JCQltdXRleF9sb2NrKCZoZG1pLT5jZWNfbm90aWZpZXJfbXV0ZXgpOwo+IC0JCQlj
ZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUoaGRtaS0+Y2VjX25vdGlmaWVyKTsKPiAt
CQkJbXV0ZXhfdW5sb2NrKCZoZG1pLT5jZWNfbm90aWZpZXJfbXV0ZXgpOwo+IC0JCX0KPiAtCj4g
IAkJaWYgKChpbnRyX3N0YXQgJiBIRE1JX0lIX1BIWV9TVEFUMF9IUEQpICYmCj4gIAkJICAgIChw
aHlfc3RhdCAmIEhETUlfUEhZX0hQRCkpCj4gIAkJCXN0YXR1cyA9IGNvbm5lY3Rvcl9zdGF0dXNf
Y29ubmVjdGVkOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDUxNjE4MzgzOC4yMDI0OTkxLTEtam9uYXNAa3dpYm9vLnNlP3BhcnQ9
OQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
