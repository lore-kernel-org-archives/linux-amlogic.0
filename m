Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4378FC98302
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEEzZsAIp3XsCvF/o2mN1xzpHAfHLl1pq4gJ8mQmNoU=; b=gP41S6dG/ei0yc
	t/WEp5ojT8R0eEVy5Igd4DjBwIwG4QJ2Pnoj7pdN+h+uOKhui8SLmjCauEkSBK0rHcsNQW7eI9Et+
	c1EpxzQT4DYf2DWlYToe+Ygj0cqsOqNlaRxIGNb0Ig0nCv9+KL2ZCWguurNLgc2B6Gx2b4dgAfHoW
	3Oi1WfVCKxQObwzShcfHkxpWTPpqPtoxLBu5+wzrTTJZBcArHkeTCTeGlKbn2u6XjmF8huCG7pmzJ
	KAfaoTlaGkxYZUUzjA8pTmJYJPRzRjKWmtocGJLsI9TAUtLazHaPu1NISq4Mo82dYFCP0DdfowQvn
	/trr9qF/bc0Osi0TwNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x939n-000000061Vv-48iO;
	Tue, 22 Sep 2026 16:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x939m-000000061VU-2NEr
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:15:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 072F56024D;
	Tue, 22 Sep 2026 16:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586141F000FF;
	Tue, 22 Sep 2026 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093745;
	bh=D7yC38SMs0uBnLIInF6isvpcDUoTz4JRxPUfTqk4dcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFJwguOUi0aWqgP2/6Qe/iJjC5HC0UdK2zfxjTltIUJE7KvwwVOnhO46ZhXiMUlJ1
	 /I25vuc7zLfQd6r1nVSdjVF03pXCluQfHzRZq+7zs3Z8oEAkC1YsxrYcMaqAS4Z0bi
	 R3T4Yd6jZXj+b1XrYJA9HfVCL0ZiOdiXUz+55YZ9KWlroTbhEW2scXRfvGm4dU/5Kd
	 qnqLpd0fvD1GCZPvjf0auvwVnaRAbGcKC+4q8aMN82WpinIWu1Fi7aOx8Hf62Ta8cd
	 7/dSjtacV+gMVyQe2DTuaPQ0bIV+rEBtAamSrlz09OOZqe6O/5D9YgGSI4gVrS+bd/
	 /38Zvcp7jH19A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-5-a760312c076c@baylibre.com>
Date: Tue, 22 Sep 2026 16:15:44 +0000
Message-Id: <20260922161545.586141F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEFTb0M6IG1lc29uOiBt
aXNzaW5nIERBUE0gcm91dGUgZm9yIEkyUyBFbmNvZGVyIENhcHR1cmUgYnJlYWtzIGNhcHR1cmUK
LS0KCmNvbW1pdCBmYTA5OTExZTRhNTk0YjU4MWYzM2U1NTBiOGU1OWMxNTM0Yjc4NGYwCkF1dGhv
cjogVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KCkFTb0M6IG1lc29uOiBhaXU6
IGFkZCBJMlMgQ2FwdHVyZSBEQUkKCkFkZCBjYXB0dXJlIHN0cmVhbSB0byBDUFVfSTJTX0VOQ09E
RVIgdG8gaGFuZGxlIGJvdGggcGxheWJhY2sgYW5kIGNhcHR1cmUKc3RyZWFtcy4gQ2FwdHVyZWQg
ZGF0YSBpcyBmb3JtYXR0ZWQgYW5kIGJ1ZmZlcmVkIGZyb20gdGhlIHdpZGdldHMsIHRoZW4gYnVs
awp0cmFuc21pdHRlZCBpbnRvIFJBTS4KCj4gQWRkIGNhcHR1cmUgc3RyZWFtIHRvIENQVV9JMlNf
RU5DT0RFUiBtYWtpbmcgaXQgYWJsZSB0byBoYW5kbGUgYm90aAo+IHBsYXliYWNrIGFuZCBjYXB0
dXJlIHN0cmVhbXMuIENhcHR1cmVkIGRhdGEgaXMgZm9ybWF0dGVkIGZyb20KPiAiYXVkaW4tZm9y
bWF0dGVyLWkycyIgd2lkZ2V0LCBidWZmZXJlZCBmcm9tICJhdWRpbi1maWZvIiBpbnRvIGFuIGlu
dGVybmFsCj4gRklGTyBhbmQgdGhlbiBidWxrIHRyYW5zbWl0dGVkIGludG8gUkFNIHdoZW4gdGhl
IEZJRk8gaXMgZnVsbC4KCklzIHRoZSBmb3JtYXR0ZXIgd2lkZ2V0IGluIGF1ZGluLmMgZXJyb25l
b3VzbHkgbmFtZWQgJ0kyUyBGb3JtYXR0ZXInIGluc3RlYWQKb2YgJ2F1ZGluLWZvcm1hdHRlci1p
MnMnIGFzIGNsYWltZWQgaGVyZT8KClRoaXMgY3JlYXRlcyBhIG5hbWluZyBjb2xsaXNpb24gd2l0
aCB0aGUgcGxheWJhY2sgZm9ybWF0dGVyIGluIGFpdS5jLgoKPiBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL21lc29uL2FpdS5jIGIvc291bmQvc29jL21lc29uL2FpdS5jCj4gaW5kZXggNTM1ZmJmN2Mx
NjM5NC4uMTRkMGUyMGE0YmQ2NiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vYWl1LmMK
PiArKysgYi9zb3VuZC9zb2MvbWVzb24vYWl1LmMKPiBAQCAtMTUzLDYgKzE1MywxMyBAQCBzdGF0
aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBhaXVfY3B1X2RhaV9kcnZbXSA9IHsKPiAgCQkJ
LnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF8xOTIwMDAsCj4gIAkJCS5mb3JtYXRzID0gQUlV
X0ZPUk1BVFMsCj4gIAkJfSwKPiArCQkuY2FwdHVyZSA9IHsKPiArCQkJLnN0cmVhbV9uYW1lID0g
IkkyUyBFbmNvZGVyIENhcHR1cmUiLAoKW1NldmVyaXR5OiBIaWdoXQpBcmUgdGhlIERBUE0gcm91
dGVzIGZvciB0aGlzIGNhcHR1cmUgcGF0aCBtaXNzaW5nPwoKVGhlIHBhdGNoIGNyZWF0ZXMgdGhl
ICdJMlMgRW5jb2RlciBDYXB0dXJlJyBCRSBzdHJlYW0gd2lkZ2V0IGJ1dCBmYWlscyB0byBhZGQK
YW55IHNuZF9zb2NfZGFwbV9yb3V0ZSBjb25uZWN0aW5nIGl0IHRvIHRoZSBmb3JtYXR0ZXIgKG5l
aXRoZXIgaW4gYWl1LmMgbm9yIGluCmF1ZGluLmMpLiBBcyBhIHJlc3VsdCwgdGhlIGNhcHR1cmUg
cGF0aCBpcyBkaXNqb2ludC4KCldoZW4gdGhlIGNhcHR1cmUgc3RyZWFtIGlzIG9wZW5lZCwgdGhl
IERBUE0gZ3JhcGggdHJhdmVyc2FsIGluCmF1ZGluX2Zvcm1hdHRlcl9pMnNfZ2V0X2JlKCkgZmFp
bHMgdG8gZmluZCBhIGJhY2tlbmQgc291cmNlLCByZXR1cm5pbmcgTlVMTC4KClRoaXMgdHJpZ2dl
cnMgYSBXQVJOX09OKCF0cykgaW5zaWRlIGd4X2Zvcm1hdHRlcl9wb3dlcl91cCgpIGFuZCByZXR1
cm5zCi1FTk9ERVYsIGJyZWFraW5nIGNhcHR1cmUgZnVuY3Rpb25hbGl0eS4KCj4gKwkJCS5jaGFu
bmVsc19taW4gPSAyLAo+ICsJCQkuY2hhbm5lbHNfbWF4ID0gMiwKPiArCQkJLnJhdGVzID0gU05E
UlZfUENNX1JBVEVfODAwMF8xOTIwMDAsCj4gKwkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJ
VF9TMTZfTEUsCj4gKwkJfSwKPiAgCQkub3BzID0gJmFpdV9lbmNvZGVyX2kyc19kYWlfb3BzLAo+
ICAJCS5zeW1tZXRyaWNfcmF0ZSA9IDEsCj4gIAl9LAoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyMi1hdWRpbi12My0wLWE3NjAz
MTJjMDc2Y0BiYXlsaWJyZS5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
