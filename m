Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566D606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCzgPSf/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfsoaVgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lGf/hj+pNCrnmhYtdKl3IZnbpfP6G7uG5IFunp/mFHw=; b=uCzgPSf/xgIOK61GqkhBVo4ASm
	RyTmt6rSPbikaVZmRypxDa4N24BHV6jpyfo+3N8p5NTzrJ0Py6vAIkrSAX+Tuntoo+jHYRyrkDr1N
	XxUqDPrHBR/mVFO8950hnuUSPNGj25JFaSwGJYE8xmMZ5o3zOuE7nyvQqqdRw3eci+XjPSyAUZyru
	eGt7QpI4LPi7ZVtGrTPND7JhSl/oAOL8IIEhHXY5xxBbLZ7Vwt5oR2EaleCu7eBxSYWdlttM+aYX5
	dn8InvtYomJGOXosAVdzOxOeoQT3thlABBIzg2Ka1pSGU/rMOQ3Xu3A1xttRFzK7bt1ucpBkPvGic
	y6gS5kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFfP-0000000BdO5-1UiA;
	Fri, 06 Nov 2026 08:51:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFfN-0000000BdNG-1pfN
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98CFB601BF;
	Fri,  6 Nov 2026 08:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004E11F0089F;
	Fri,  6 Nov 2026 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955080;
	bh=ZPrMxi71NV9gjGGF2lBGP+8nq9DMZ0NgKsrzGDmzMVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfsoaVgXm+zjdv8bk+icyZunADPHDj9zgn/y/eBZBkqG+CbludKkCD+kbdiKfzkWJ
	 thHjsfR3WXEJgAmps0KhQ6k8u8ldnwkLWaI/A3kd0JFldwVXiPA+6JmZhSgvker/82
	 j9/Wg0sC5xMLnvUyuX0hkNACLlei75o8lBXylWo073UCwqPMV9Hwo7VgNXyeeTsjxU
	 WqHufSzNdv09ALHlSGt0ZUG/hxKOMJybt78MxZpZddj7hlKi3YEjihxl/u6AXcI858
	 gXaVm8+7PBRsQfD1DpmnmxZbzBE/e18R7qJnc1ba9MqGub/MK200ChaKO6lOL07MhQ
	 Ua2JxCqWZsjGA==
Message-ID: <sashiko-outbox-201090@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
Date: Fri, 06 Nov 2026 08:51:19 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gY2xrOiBtZXNvbjogczct
cGxsOiBIRE1JUExMX0NUUkwxIGluaXRpYWxpemVkIGFmdGVyCiAgczdfaGRtaV9wbGxfZGl2MHA1
IHJhdGUKLS0KCmNvbW1pdCA2YTUxYzI2Y2JlMzdkNGE3ZTNiMjQwN2U5MDM0MDUzNzhlMWUzNDhi
CkF1dGhvcjogQ2FybG8gQ2Fpb25lIDxjY2Fpb25lQGJheWxpYnJlLmNvbT4KCmNsazogYW1sb2dp
YzogQWRkIFM3IFBMTCBjbG9jayBjb250cm9sbGVyIGRyaXZlcgoKVGhpcyBjb21taXQgYWRkcyB0
aGUgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgQW1sb2dpYyBTNyBTb0MsCnBy
b3ZpZGluZyB0aGUgZml4ZWQgUExMIGFuZCBpdHMgZGl2aWRlcnMsIHRoZSBHUDAsIEhJRkkwIGFu
ZCBISUZJMSBQTExzLAphbmQgdGhlIEhETUkgUExMLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVzb24vczctcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9zNy1wbGwuYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uMmFhMjUzYTVmMjExMQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9zNy1wbGwuYwoKWyAuLi4gXQoKPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdfc2VxdWVuY2UgczdfaGRtaV9wbGxfaW5pdF9yZWdzW10g
PSB7Cj4gKwl7IC5yZWcgPSBIRE1JUExMX0NUUkwwLAkuZGVmID0gMHgwMDg4MTAwMCB9LAo+ICsJ
eyAucmVnID0gSERNSVBMTF9DVFJMMSwJLmRlZiA9IDB4MmM2MDExY2MgfSwKPiArCXsgLnJlZyA9
IEhETUlQTExfQ1RSTDIsCS5kZWYgPSAweDg2ODAxMDAwIH0sCj4gKwl7IC5yZWcgPSBIRE1JUExM
X0NUUkwzLAkuZGVmID0gMHgwMDAwMDAwMCB9LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBjbGtfZGl2X3RhYmxlIHM3X2hkbWlfcGxsX2RpdjBwNV90YWJsZVtdID0gewo+ICsJeyAu
dmFsID0gMCwgLmRpdiA9IDEgfSwKPiArCXsgLnZhbCA9IDEsIC5kaXYgPSAyIH0sCj4gKwl7IC8q
IHNlbnRpbmVsICovIH0KPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBzN19o
ZG1pX3BsbF9kaXYwcDUgPSB7Cj4gKwkuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZGl2X2Rh
dGEpIHsKPiArCQkub2Zmc2V0ID0gSERNSVBMTF9DVFJMMSwKPiArCQkuc2hpZnQgPSAxOSwKPiAr
CQkud2lkdGggPSAxLAo+ICsJCS50YWJsZSA9IHM3X2hkbWlfcGxsX2RpdjBwNV90YWJsZSwKPiAr
CQkuZmxhZ3MgPSBDTEtfRElWSURFUl9SRUFEX09OTFksCj4gKwl9LAo+ICsJLmh3LmluaXQgPSAm
KHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gKwkJLm5hbWUgPSAiaGRtaV9wbGxfZGl2MHA1IiwK
PiArCQkub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9yb19vcHMsCj4gKwkJLnBhcmVudF9kYXRh
ID0gJihjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhKSB7Cj4gKwkJCS5md19uYW1lID0gImhk
bWkiLAo+ICsJCX0sCj4gKwkJLm51bV9wYXJlbnRzID0gMSwKPiArCX0sCj4gK307Cj4gKwo+ICtz
dGF0aWMgc3RydWN0IGNsa19yZWdtYXAgczdfaGRtaV9wbGxfdmNvID0gewo+ICsJLmRhdGEgPSAm
KHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEpIHsKPiArCQkuZW4gPSB7Cj4gKwkJCS5yZWdfb2Zm
ID0gSERNSVBMTF9DVFJMMCwKPiArCQkJLnNoaWZ0ICAgPSAyOCwKPiArCQkJLndpZHRoICAgPSAx
LAo+ICsJCX0sCj4gKwkJLm0gPSB7Cj4gKwkJCS5yZWdfb2ZmID0gSERNSVBMTF9DVFJMMCwKPiAr
CQkJLnNoaWZ0ICAgPSAwLAo+ICsJCQkud2lkdGggICA9IDksCj4gKwkJfSwKPiArCQkuZnJhYyA9
IHsKPiArCQkJLnJlZ19vZmYgPSBIRE1JUExMX0NUUkwzLAo+ICsJCQkuc2hpZnQgICA9IDAsCj4g
KwkJCS53aWR0aCAgID0gMTcsCj4gKwkJfSwKPiArCQkubCA9IHsKPiArCQkJLnJlZ19vZmYgPSBI
RE1JUExMX1NUUywKPiArCQkJLnNoaWZ0ICAgPSAzMSwKPiArCQkJLndpZHRoICAgPSAxLAo+ICsJ
CX0sCj4gKwkJLnJzdCA9IHsKPiArCQkJLnJlZ19vZmYgPSBIRE1JUExMX0NUUkwwLAo+ICsJCQku
c2hpZnQgICA9IDI5LAo+ICsJCQkud2lkdGggICA9IDEsCj4gKwkJfSwKPiArCQkucmFuZ2UgPSAm
czdfaGRtaV9wbGxfbXVsdF9yYW5nZSwKPiArCQkuaW5pdF9yZWdzID0gczdfaGRtaV9wbGxfaW5p
dF9yZWdzLAo+ICsJCS5pbml0X2NvdW50ID0gQVJSQVlfU0laRShzN19oZG1pX3BsbF9pbml0X3Jl
Z3MpLAo+ICsJCS5mbGFncyA9IENMS19NRVNPTl9QTExfUlNUX0FDVElWRV9MT1cgfAo+ICsJCQkg
Q0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRCwKPiArCX0sCj4gKwkuaHcuaW5pdCA9ICYoc3Ry
dWN0IGNsa19pbml0X2RhdGEpIHsKPiArCQkubmFtZSA9ICJoZG1pX3BsbF92Y28iLAo+ICsJCS5v
cHMgPSAmbWVzb25fY2xrX3BsbF9vcHMsCj4gKwkJLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0
IGNsa19odyAqW10pIHsKPiArCQkJJnM3X2hkbWlfcGxsX2RpdjBwNS5odwo+ICsJCX0sCj4gKwkJ
Lm51bV9wYXJlbnRzID0gMSwKPiArCX0sCj4gK307CgpbIC4uLiBdCgo+ICtzdGF0aWMgc3RydWN0
IGNsa19odyAqczdfcGxsX2h3c1tdID0gewoKWyAuLi4gXQoKPiArCVtDTEtJRF9IRE1JX1BMTF9E
SVYwUDVdCQk9ICZzN19oZG1pX3BsbF9kaXYwcDUuaHcsCj4gKwlbQ0xLSURfSERNSV9QTExfVkNP
XQkJPSAmczdfaGRtaV9wbGxfdmNvLmh3LAoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiBzN19oZG1p
X3BsbF9kaXYwcDUgY2FjaGUgYSBzdGFsZSBkaXZpZGUtYnktMiByYXRlIGJlZm9yZQpzN19oZG1p
X3BsbF92Y28gaW5pdGlhbGl6ZXMgSERNSVBMTF9DVFJMMT8KCm1lc29uX2Nsa2NfaW5pdCgpIHJl
Z2lzdGVycyBzN19wbGxfaHdzW10gaW4gaW5kZXggb3JkZXIsIHNvCnM3X2hkbWlfcGxsX2RpdjBw
NSByZWFkcyBIRE1JUExMX0NUUkwxIGJpdCAxOSBhbmQgY2FjaGVzIGl0cyByYXRlIGJlZm9yZQpz
N19oZG1pX3BsbF92Y28gcnVucyBtZXNvbl9jbGtfcGxsX2luaXQoKSBhbmQgd3JpdGVzCnM3X2hk
bWlfcGxsX2luaXRfcmVncyAod2hpY2ggY2xlYXJzIEhETUlQTExfQ1RSTDEgYml0IDE5IHRvIDAg
d2hlbiB0aGUKUExMIGlzIG5vdCBhbHJlYWR5IGVuYWJsZWQgYnkgZmlybXdhcmUpLiBCZWNhdXNl
IHM3X2hkbWlfcGxsX2RpdjBwNSB1c2VzCmNsa19yZWdtYXBfZGl2aWRlcl9yb19vcHMgd2l0aG91
dCBDTEtfR0VUX1JBVEVfTk9DQUNIRSwgaXRzIGNhY2hlZCByYXRlCmlzIG5ldmVyIHVwZGF0ZWQg
YWZ0ZXIgSERNSVBMTF9DVFJMMSBpcyBvdmVyd3JpdHRlbiwgd2hpY2ggd291bGQgbGVhdmUKczdf
aGRtaV9wbGxfdmNvIGFuZCBhbGwgZG93bnN0cmVhbSBIRE1JIFBMTCBjbG9ja3MgY2FsY3VsYXRp
bmcgcmF0ZXMgb2ZmCmJ5IGEgZmFjdG9yIG9mIDIgaWYgYml0IDE5IHdhcyBzZXQgcHJpb3IgdG8g
aW5pdGlhbGl6YXRpb24uCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTA2LXVwc3RyZWFtLXM3LWNsay12MS0wLTdkNTAxZDYyNjIx
ZkBiYXlsaWJyZS5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
