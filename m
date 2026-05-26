Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF8CD5BC8
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFY9wRdGx04G56M9EnCrH/dGqFmHjzPQdQfNMBDUi0g=; b=e/BTXbRXN8pXhS
	KUPQiQ+d/MV+z6e8H4MPWF9gi9us4AKh/4mpdLNf5SNfnK/otJxcLEumYB8VcyaqWjzXCfyszf3r3
	Er3OnChxq+J52zCUl+CvTSc1fjDhlibX5McLbQXqQ7TxCGobSYEIDP0Amrj8OXHZukxBPLezIDBYd
	WjloCx3jEicoMdg0Ez87cQAWPL2tkICbnS+tk4kVjEBQAQJ4lZwaJ7bl0YtRG1sq4lM4x6UATFKwn
	Vm9wG0DcStt/mWAtmIDLiXnl8oZUpXtW6/kZ4cxnUn7Vf8U2Wec/chddBDWIf1dzQuRIXCzJXfc7L
	Q3+cbibTerlHpP02i1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpB0-00000001fXf-2hmb;
	Tue, 26 May 2026 10:38:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpAz-00000001fXN-0fbF
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 10:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46EE76008A;
	Tue, 26 May 2026 10:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEA71F00A3A;
	Tue, 26 May 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791900;
	bh=Yza9zM3aDrCy7bLpPrLiqHCCyGSJ9g8w8AOAUQlByvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dnAY+GbD+fYlTFjkOkQi4lix5ikxau3eKrpQnys/xnUs34w/1jKAUER5UYIepwwxZ
	 y34RMhe8Ha8UCO8vEaR4Q1gB+U/XVeewhHPcILAX6q1otGw8/5GB2DHMDWDrtKVwyT
	 7oH29E/43or/XaGaazJuVfsOBsskmC+QojXU30xEr+ZXMdBan5Qod8NPfRiRV94Z6O
	 p4hih63/F3ds0qCedB+emrLfYDZcmLhDZN8pdJomEVVsg0bpflYRiF4/NXR/F5dsug
	 Le0AtCMcqW4DmP8YXKi4UFLCpTv64SyhyYB48kV4xEZGZbf0O3+TMIBfL7vbEE3jky
	 fBPApUvfH6x1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 5/6] arm64: dts: amlogic: Add video
 decoder driver support for S4 SOCs
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
Date: Tue, 26 May 2026 10:38:19 +0000
Message-Id: <20260526103819.AFEA71F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBhdGNoIHNp
bGVudGx5IGludHJvZHVjZXMgYW4gYG9wdGVlYCBub2RlIHdoaWNoIGlzIG5vdCBtZW50aW9uZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBhbmQgcGxhY2VzIGl0IGluY29ycmVjdGx5IGF0IHRoZSBy
b290IG9mIHRoZSBkZXZpY2UgdHJlZS4KLSBbTG93XSBUaGUgbmV3bHkgYWRkZWQgYGNhbnZhc2Ag
YW5kIGB2aWRlby1jb2RlY2Agbm9kZXMgYnJlYWsgdGhlIGV4cGVjdGVkIHVuaXQtYWRkcmVzcyBz
b3J0aW5nIHdpdGhpbiB0aGUgYHNvY2Agc2ltcGxlLWJ1cyBub2RlLgotLQoKY29tbWl0IDlmMWJj
OGJkNzZkNThmNzU5ODUwODcwMGZjYzM3ODg4YWUxZGJmMGYKQXV0aG9yOiBaaGVudGFvIEd1byA8
emhlbnRhby5ndW9AYW1sb2dpYy5jb20+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgdmlkZW8g
ZGVjb2RlciBkcml2ZXIgc3VwcG9ydCBmb3IgUzQgU09DcwoKVGhpcyBjb21taXQgYWRkcyB0aGUg
dmRlYyBub2RlIHRvIGVuYWJsZSBBbWxvZ2ljIFY0TDIgc3RhdGVsZXNzIHZpZGVvCmRlY29kZXIg
c3VwcG9ydCBmb3IgUzQgU09Dcy4gSXQgYWxzbyBpbnRyb2R1Y2VzIGFuIG9wdGVlIG5vZGUgYW5k
IGEgY2FudmFzCm5vZGUgcmVxdWlyZWQgZm9yIHRoZSBkZWNvZGVyLgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kKPiBAQCAtOTYsNiArOTYsMTEgQEAgc2FyYWRjOiBhZGNAZmUwMjYwMDAg
ewo+ICAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAl9Owo+ICAKPiArCW9wdGVlIHsKPiArCQlj
b21wYXRpYmxlID0gImxpbmFybyxvcHRlZS10eiI7Cj4gKwkJbWV0aG9kID0gInNtYyI7Cj4gKwl9
OwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3VsZCB0aGlzIG9wdGVlIG5vZGUgYWRkaXRpb24gYmUg
ZXhwbGljaXRseSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdAptZXNzYWdlPyBUaGUgY29tbWl0IGRl
c2NyaXB0aW9uIGN1cnJlbnRseSBvbmx5IG1lbnRpb25zIGFkZGluZyB0aGUgdmRlYwpub2RlLgoK
QWxzbywgc2hvdWxkIHRoaXMgbm9kZSBiZSBwbGFjZWQgdW5kZXIgYSBmaXJtd2FyZSBub2RlIGlu
c3RlYWQgb2YgYXQgdGhlIHJvb3QKbGV2ZWwgb2YgdGhlIGRldmljZSB0cmVlPwoKPiAgCXNvYyB7
Cj4gIAkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiAgCQkjYWRkcmVzcy1jZWxscyA9IDwy
PjsKClsgLi4uIF0KCj4gQEAgLTkwNyw1ICs5MTIsMzQgQEAgZW1tYzogbW1jQGZlMDhjMDAwIHsK
PiAgCQkJYXNzaWduZWQtY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RfRU1NQ19DPjsK
PiAgCQkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+Owo+ICAJCX07Cj4gKwo+ICsJ
CWNhbnZhczogdmlkZW8tbHV0QGZlMDM2MDQ4IHsKPiArCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LGNhbnZhcyI7Cj4gKwkJCXJlZyA9IDwweDAgMHhmZTAzNjA0OCAweDAgMHgxND47Cj4gKwkJfTsK
PiArCj4gKwkJdmlkZW8tY29kZWNAZmUzMjAwMDAgewoKW1NldmVyaXR5OiBMb3ddCkRvZXMgYXBw
ZW5kaW5nIHRoZXNlIG5vZGVzIGJyZWFrIHRoZSBleHBlY3RlZCB1bml0LWFkZHJlc3Mgc29ydGlu
ZyB3aXRoaW4gdGhlCnNvYyBzaW1wbGUtYnVzIG5vZGU/IFRoZSBjYW52YXMgbm9kZSBhdCBmZTAz
NjA0OCBhbmQgdGhlIHZpZGVvLWNvZGVjIG5vZGUgYXQKZmUzMjAwMDAgYXBwZWFyIHRvIGJlIHBs
YWNlZCBhdCB0aGUgZW5kIG9mIHRoZSBibG9jaywgYWZ0ZXIgbW1jQGZlMDhjMDAwLApyYXRoZXIg
dGhhbiBiZWluZyBvcmRlcmVkIHNlcXVlbnRpYWxseS4KCj4gKwkJCWNvbXBhdGlibGUgPSAiYW1s
b2dpYyxzNC12ZGVjIjsKPiArCQkJcmVnID0gPDB4MCAweGZlMzIwMDAwIDB4MCAweDEwMDAwPiwK
PiArCQkJICAgICAgPDB4MCAweGZlMDM2MDAwIDB4MCAweDIwPjsKClsgLi4uIF0KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjYt
YjQtczQtdmRlYy11cHN0cmVhbS12NS0wLTMzYmM4MTdmOTNmNEBhbWxvZ2ljLmNvbT9wYXJ0PTUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
