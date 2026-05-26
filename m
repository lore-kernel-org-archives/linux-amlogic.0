Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB85CD5BD0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9j+JR10k1sM55aWVxwjnYkAhE5bZTVcWjZqldgQqqk=; b=unECOE+eQgulJl
	tPQM3ks3TW9+OsgcKtATy4+rnYgr/B72ifE+/nSKSKiI1noGwM4GkGlCE2D3aM7bmQubjRYfaS9Mj
	4fmUfogmbevcx7IxzQwGimD2RzMytDcvseAQ+gYM8GWHAFHXmsXWKeiIBHDmsdcJZpnn/47hStIa9
	llSpdU5KPnYq72Nxx8IJlkjWhPMC0iLdFk4S+HbCYLp5yf1AsPkec97goTMCHYIAig91YSIZ3E39/
	MU6lfoJZkD/ZzTuaMjVINQtgwhtdWBguikfBtRReI2OF89tD74/CN6sopbmCxaxMMexMePy3JuuFf
	F0ZXYtSBvEPp+9cnZPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnvL-00000001U6c-0ej0;
	Tue, 26 May 2026 09:18:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnvK-00000001U6N-0nop
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 09:18:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B286008A;
	Tue, 26 May 2026 09:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974891F000E9;
	Tue, 26 May 2026 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787084;
	bh=Idn2QWCE2Hph4NT9PLQI+/aoKLgElIcn1Ab2J3XR5Kg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BNCZwn6vYArXG7TxPEc1kSoVK1EHVQxcK2NDpfVMRDzoosdHX/RJ9BC2Aq5N5VS9T
	 lheP3Qc2NcyLWfudNRUjdZZRRI4MqnHEMHw1EMZ5s+q9hD4OllTKC/Nw2ZrIdA9iV2
	 slWmbHSWOxU9H3tJfSqFjiEGEE5S9Kyu6s4UEs38Aa7PMqvmOCfVebAalQXxxKF8Iw
	 fkfsuuyZlcFRY31SbdzByvGaFURRXASH+LC3O90CWqqbRZVE6bbe575IFJFDnwLcZN
	 x7u1M4PGcRqIxTuzuB4J34/euopvvFJFfBYTDnoIm+w1vUGiz1cLam6/UiwANEWauo
	 BHFB9oDgCac7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 2/6] firmware: meson: sm: video firmware
 loading via secure monitor
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-2-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-2-33bc817f93f4@amlogic.com>
Date: Tue, 26 May 2026 09:18:04 +0000
Message-Id: <20260526091804.974891F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIHBhdGNoIHNlcmll
cyBpcyBpbmNvcnJlY3RseSBvcmRlcmVkLCBzZXBhcmF0aW5nIHRoZSBlbnVtIGRlY2xhcmF0aW9u
IG9mIGBTTV9MT0FEX1ZJREVPX0ZXYCBmcm9tIGl0cyB1c2FnZSwgd2hpY2ggYnJlYWtzIGBnaXQg
YmlzZWN0YCBkdWUgdG8gYSBidWlsZCBmYWlsdXJlLgotLQoKY29tbWl0IDdkYTc3ZGQzOGQyZWE1
NmZlN2I1N2UyNDY4NDdiNWNkMTE4ZmQ4NWUKQXV0aG9yOiBaaGVudGFvIEd1byA8emhlbnRhby5n
dW9AYW1sb2dpYy5jb20+CgpmaXJtd2FyZTogbWVzb246IHNtOiB2aWRlbyBmaXJtd2FyZSBsb2Fk
aW5nIHZpYSBzZWN1cmUgbW9uaXRvcgoKVGhpcyBjb21taXQgYWRkcyB0aGUgU01fTE9BRF9WSURF
T19GVyBjb21tYW5kIHRvIHRoZSBzZWN1cmUgbW9uaXRvcgpjb21tYW5kIGVudW0uIFRoaXMgZW5h
YmxlcyBkZWNvZGVyIGRyaXZlcnMgdG8gbG9hZCBmaXJtd2FyZSB0aHJvdWdoCnRoZSBtZXNvbl9z
bSBpbnRlcmZhY2UuCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29u
L21lc29uX3NtLmggYi9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKPiBp
bmRleCA4ZWFmODkyMmFiMDIwLi5mNDA4NjdhMDAwZjEwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmly
bXdhcmUvbWVzb24vbWVzb25fc20uaAo+IEBAIC0xNCw2ICsxNCw3IEBAIGVudW0gewo+ICAJU01f
R0VUX0NISVBfSUQsCj4gIAlTTV9BMV9QV1JDX1NFVCwKPiAgCVNNX0ExX1BXUkNfR0VULAo+ICsJ
U01fTE9BRF9WSURFT19GVywKCltTZXZlcml0eTogTG93XQpDb3VsZCB0aGlzIHBhdGNoIHNlcmll
cyBvcmRlcmluZyBicmVhayBnaXQgYmlzZWN0PwoKVGhlIHByZXZpb3VzIGNvbW1pdCAwODcxNDFl
NDExZTUzICgiZmlybXdhcmU6IG1lc29uOiBzbTogQWRkIHZpZGVvIGZpcm13YXJlCmxvYWRpbmcg
U01DIGNhbGwiKSB1c2VzIHRoZSBTTV9MT0FEX1ZJREVPX0ZXIGNvbW1hbmQsIGJ1dCB0aGUgZW51
bSB2YWx1ZSBpcwpub3QgZGVjbGFyZWQgdW50aWwgdGhpcyBzdWJzZXF1ZW50IGNvbW1pdC4gQ2hl
Y2tpbmcgb3V0IHRoZSBwcmV2aW91cyBjb21taXQKd291bGQgcmVzdWx0IGluIGFuIHVuZGVjbGFy
ZWQgaWRlbnRpZmllciBjb21waWxhdGlvbiBlcnJvci4gU2hvdWxkIHRoaXMKZGVjbGFyYXRpb24g
YmUgbW92ZWQgYmVmb3JlIGl0cyB1c2FnZSB0byBtYWludGFpbiBiaXNlY3RhYmlsaXR5PwoKPiAg
fTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA1MjYtYjQtczQtdmRlYy11cHN0cmVhbS12NS0wLTMzYmM4MTdmOTNmNEBhbWxvZ2lj
LmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
