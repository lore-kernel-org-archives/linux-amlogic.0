Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D957BCD98F2
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2026 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4QWOpZZZu1G9aUczlV0N+jEQiIKAFIbq6omUsJNlUU=; b=ili9oPbXWros98
	NNjruW1//D+Iyj4SR8hkOj/x4Gf6nHoIACEme2isAm43L8XMI8YgdaBiDpzkST1LM5kbvNMw+7HqZ
	uffFxlvKtd9Fdq3fILfL627XVFhUQXfqFPAyjN7Yz89dOfYCRsBbAlvQKpO93HPxJlCd5c4MU6AC9
	BKRLKomYQhoNhfz6NF4qMi58mDAX8g1SVU9UdkW46aNSpO29GSO2vAB+M4GpHqdtLIc7Yhtbrn011
	Q73Bco+7GN/Shg8sI6gEJBbxpyqtuNLG+2yilVkwXf8kEt61BY4W2tE5Yx1BYNOyc70aFMNdpMmry
	wqHfq3I1fP143tu/QwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9b4-000000012e1-1pat;
	Thu, 18 Jun 2026 10:03:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9b2-000000012dg-2rWJ
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jun 2026 10:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26567404AD;
	Thu, 18 Jun 2026 10:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DAF1F000E9;
	Thu, 18 Jun 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781777019;
	bh=jJT2qzmGuolZTrVpAaRD9lBg4iP0nNq7iIFvEKa2JTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQLGFaK3TlatN+inrja2w/vgK9ZFUi6VM0E57U7uj/cNjUNkmGUuGjxRN4+8/2yDK
	 OiMI+rkS/G0cQyPJ3/OCvYZOktuvdC2zNbADWp18IQ2Oj85SwmkUfmZRIrDdiiWXI5
	 jH7DszsWzQFRv3l/ieFunsFLJiZVyeJ/lh25HjcHTVjj3eMXvBnQ3DsagMXk/cA2UV
	 QEOlbF5HAyKBnS35X+nfQ4Mkp9nOu4S81E8lfiuTyJ4z8Qm+pvO3Ya2bGpuPZmQaA+
	 0OkSqdQVk0i+EoZvQuKXKCeyV8+TNb/zCwi1awrn/5ATKgHwCes6sWQpPhFOxcjEb4
	 T5tyzMY5fdCAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260618-a9_peripherals-v4-2-fe120de44e77@amlogic.com>
References: <20260618-a9_peripherals-v4-0-fe120de44e77@amlogic.com>
 <20260618-a9_peripherals-v4-2-fe120de44e77@amlogic.com>
Date: Thu, 18 Jun 2026 10:03:38 +0000
Message-Id: <20260618100339.84DAF1F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGBoZG1pdHgx
X3BpeGVsYCBjbG9jayB1c2VzIHRoZSB3cm9uZyBwYXJlbnQgc2VsZWN0b3IuCi0gW0xvd10gVGhl
IEtjb25maWcgc3ltYm9sIGBDT01NT05fQ0xLX0E5X1BMTGAgaXMgaW1wbGllZCBieSBgQ09NTU9O
X0NMS19BOV9QRVJJUEhFUkFMU2AgYnV0IGlzIG5ldmVyIGRlZmluZWQgYW55d2hlcmUgaW4gdGhl
IGtlcm5lbCB0cmVlLgotIFtMb3ddIFR5cG9ncmFwaGljYWwgZXJyb3IgaW4gY2xvY2sgbmFtZTog
YGE5X2VuY29kZXIxYCBpcyBuYW1lZCAiZW5jb3JkZXIxIi4KLS0KCmNvbW1pdCBkYTQ0ZWUxYjFk
MzExYmY4ZjFkNWY0NjAzZDg2ZjJmYjJhNTg3NTg4CkF1dGhvcjogSmlhbiBIdSA8amlhbi5odUBh
bWxvZ2ljLmNvbT4KCmNsazogYW1sb2dpYzogQWRkIEE5IHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRy
b2xsZXIgZHJpdmVyCiAgICAKQWRkIHRoZSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIGRy
aXZlciBmb3IgdGhlIEFtbG9naWMgQTkgU29DIGZhbWlseS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL21lc29uL0tjb25maWcgYi9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4gaW5kZXgg
Y2Y4Y2YzZjllNGVlOC4uODZkMmUyNzBlMWI4MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9t
ZXNvbi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZwo+IEBAIC0xMzIs
NiArMTMyLDIxIEBAIGNvbmZpZyBDT01NT05fQ0xLX0ExX1BFUklQSEVSQUxTCj4gIAkgIGRldmlj
ZSwgQTEgU29DIEZhbWlseS4gU2F5IFkgaWYgeW91IHdhbnQgQTEgUGVyaXBoZXJhbHMgY2xvY2sK
PiAgCSAgY29udHJvbGxlciB0byB3b3JrLgo+ICAKPiArY29uZmlnIENPTU1PTl9DTEtfQTlfUEVS
SVBIRVJBTFMKPiArCXRyaXN0YXRlICJBbWxvZ2ljIEE5IFNvQyBwZXJpcGhlcmFscyBjbG9jayBj
b250cm9sbGVyIHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEFSTTY0IHx8IENPTVBJTEVfVEVTVAo+
ICsJZGVmYXVsdCBBUkNIX01FU09OCj4gKwlzZWxlY3QgQ09NTU9OX0NMS19NRVNPTl9SRUdNQVAK
PiArCXNlbGVjdCBDT01NT05fQ0xLX01FU09OX0NMS0NfVVRJTFMKPiArCXNlbGVjdCBDT01NT05f
Q0xLX01FU09OX0RVQUxESVYKPiArCXNlbGVjdCBDT01NT05fQ0xLX01FU09OX1ZJRF9QTExfRElW
Cj4gKwlpbXBseSBDT01NT05fQ0xLX1NDTUkKPiArCWltcGx5IENPTU1PTl9DTEtfQTlfUExMCgpb
U2V2ZXJpdHk6IExvd10KRG9lcyB0aGUgc3ltYm9sIENPTU1PTl9DTEtfQTlfUExMIGV4aXN0IGlu
IHRoZSBrZXJuZWwgdHJlZT8gSXQgYXBwZWFycyB0byBiZQp1bmRlZmluZWQsIHdoaWNoIG1lYW5z
IGltcGx5aW5nIGl0IGhhcyBubyBlZmZlY3QuIENvdWxkIHRoaXMgYmUgYSB0eXBvIG9yCnBlcmhh
cHMgYSBtaXNzaW5nIHBhdGNoIGRlcGVuZGVuY3k/CgpbIC4uLiBdCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lc29uL2E5LXBlcmlwaGVyYWxzLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9hOS1w
ZXJpcGhlcmFscy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAw
Li44ZTBhZTMyMDVkNzcyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29u
L2E5LXBlcmlwaGVyYWxzLmMKWyAuLi4gXQo+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgYTlf
ZW5jb2RlcjFfc2VsID0gewo+ICsJLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX211eF9kYXRh
KXsKPiArCQkub2Zmc2V0ID0gVklJRF9DTEtfRElWLAo+ICsJCS5tYXNrID0gMHhmLAo+ICsJCS5z
aGlmdCA9IDgsCj4gKwkJLnRhYmxlID0gYTlfdmlkX3BhcmVudHNfdmFsX3RhYmxlLAo+ICsJfSwK
PiArCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4gKwkJLm5hbWUgPSAiZW5j
b2RlcjFfc2VsIiwKPiArCQkub3BzID0gJmNsa19yZWdtYXBfbXV4X29wcywKPiArCQkucGFyZW50
X2h3cyA9IGE5X3ZpZF9wYXJlbnRzLAo+ICsJCS5udW1fcGFyZW50cyA9IEFSUkFZX1NJWkUoYTlf
dmlkX3BhcmVudHMpLAo+ICsJfSwKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21h
cCBhOV9lbmNvZGVyMSA9IHsKPiArCS5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2Rh
dGEpewo+ICsJCS5vZmZzZXQgPSBWSURfQ0xLX0NUUkwyLAo+ICsJCS5iaXRfaWR4ID0gMTEsCj4g
Kwl9LAo+ICsJLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gKwkJLm5hbWUg
PSAiZW5jb3JkZXIxIiwKCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgdGhl
cmUncyBhIHR5cG8gaW4gdGhlIGNsb2NrIG5hbWUgKGVuY29yZGVyMSBpbnN0ZWFkIG9mCmVuY29k
ZXIxKS4KCj4gKwkJLm9wcyA9ICZjbGtfcmVnbWFwX2dhdGVfb3BzLAo+ICsJCS5wYXJlbnRfaHdz
ID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gKwkJCSZhOV9lbmNvZGVyMV9zZWwuaHcK
PiArCQl9LAo+ICsJCS5udW1fcGFyZW50cyA9IDEsCj4gKwkJLmZsYWdzID0gQ0xLX1NFVF9SQVRF
X1BBUkVOVCwKPiArCX0sCj4gK307ClsgLi4uIF0KPiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFw
IGE5X2hkbWl0eDFfcGl4ZWwgPSB7Cj4gKwkuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZ2F0
ZV9kYXRhKXsKPiArCQkub2Zmc2V0ID0gVklEX0NMS19DVFJMMiwKPiArCQkuYml0X2lkeCA9IDEy
LAo+ICsJfSwKPiArCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgewo+ICsJCS5u
YW1lID0gImhkbWl0eDFfcGl4ZWwiLAo+ICsJCS5vcHMgPSAmY2xrX3JlZ21hcF9nYXRlX29wcywK
PiArCQkucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgewo+ICsJCQkmYTlf
aGRtaXR4X3BpeGVsX3NlbC5odwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3VsZCB0aGlzIHBhcmVu
dCBiZSAmYTlfaGRtaXR4MV9waXhlbF9zZWwuaHcgaW5zdGVhZCBvZgomYTlfaGRtaXR4X3BpeGVs
X3NlbC5odz8gVXNpbmcgYTlfaGRtaXR4X3BpeGVsX3NlbCBsb29rcyBsaWtlIGEgY29weS1wYXN0
ZSBlcnJvcgp0aGF0IG1pZ2h0IHJvdXRlIHRoZSBjbG9jayBpbmNvcnJlY3RseSBmb3IgdGhlIHNl
Y29uZGFyeSBIRE1JIHRyYW5zbWl0dGVyLgoKPiArCQl9LAo+ICsJCS5udW1fcGFyZW50cyA9IDEs
Cj4gKwkJLmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVCwKPiArCX0sCj4gK307CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE4
LWE5X3BlcmlwaGVyYWxzLXY0LTAtZmUxMjBkZTQ0ZTc3QGFtbG9naWMuY29tP3BhcnQ9MgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
