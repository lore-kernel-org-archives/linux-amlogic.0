Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9997CC624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff33Mcq+GmzWA7e4EJefJWOmxwwboK27jIU5Cd3ui5w=; b=JHP+AhOa/KMtON
	na8/XRlwMxF1ljfUlYLA9XS3LMVpkSnW4C9UGnMgzsTQqq6Onz/jlpquE7peYQi892R0bt1nlXpfP
	WijDw/YRZXgpPZ5dQ6jzOBuxNyZ0gXkpgYWi9w2LNKpYq79Xf+hBkwwOMKbAQtAPXTVy/2YxrvDrh
	jOPh66sNuKw48W8x8QL9XYIyhUcY2znmBV1DY10eDtbxaqLUOCcekZr9qB/PMquEjWawY/0+0xE+y
	qhPc7o7UUEykM8o676TkxZnDXrb389QPw0lGZdlfeVGTIRZQ1N031PiYXC2MsH3CkFHvCcjEVlapP
	EQN9l1Z7V+7YAK6+DXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2206-0000000Gbxp-0Ytq;
	Thu, 03 Sep 2026 07:36:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2204-0000000GbxP-3gP3
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A35041F97;
	Thu,  3 Sep 2026 07:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92A71F000E9;
	Thu,  3 Sep 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421004;
	bh=EPTzsvt7zknDgykhy6/SS/ByprLd9bK8MMFBN4TQRm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKn5KEp9EzN8B4UrUmbpK8irSeGU+DyIO7Lxv+228AALpH4ZTSkXcUuHmcxi4kJFO
	 fSYxdIr25errdX75xOpBPr8h1VrpUVk6u7cOeOM4cCBUSteF9LCdgrny1afZB0CgaE
	 pHLysGFXQAX/TWWpIUlCuvnWLLrFbRF7V+mc5L6YRJ5BmYOzZ2GYyd9mhucwzsxW5N
	 oGpxEPm3Y6u7UsscidtLHieygYJburKHzaz5rcFjo+FTtxAui8M/C/KRbZF04v6mQ9
	 qAO2Yf4ydRYa4ll2N9c/ZWJiLX0vrDbQPNYS2LmBdjnHNc+ZD7CyGDfFrzBljgqHup
	 85LrNvrqh4NKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 07:36:43 +0000
Message-Id: <20260903073643.B92A71F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIE1hbGkgR1BV
IGludGVycnVwdCBjb25maWd1cmF0aW9uIGluY29ycmVjdGx5IHNwZWNpZmllcyAxMCBpbnRlcnJ1
cHRzIChNYWxpLTQ1MCBNUDMgY29uZmlndXJhdGlvbikgaW5zdGVhZCBvZiA4LCBjb25mbGljdGlu
ZyB3aXRoIHRoZSBTOTA1TCBTb0MncyBNYWxpLTQ1MCBNUDIgaGFyZHdhcmUuCi0tCgpjb21taXQg
OGY2NTRhNDhmOGViMmU4ZGY0ODA0ZmRlZTI1MjBlZDI0MmJlZGIxNgpBdXRob3I6IFl1Q2hpYS1L
YW4gPHJhc3BiZXJyeWthbkBzdHUuaHF1LmVkdS5jbj4KCmFybTY0OiBkdHM6IGFtbG9naWM6IGFk
ZCBYaWFvbWkgTWkgQm94IDQgc3VwcG9ydAoKQWRkIGluaXRpYWwgZGV2aWNlIHRyZWUgc3VwcG9y
dCBmb3IgdGhlIFhpYW9taSBNaSBCb3ggNCAoTURaLTIxLUFBKSwKYmFzZWQgb24gdGhlIEFtbG9n
aWMgUzkwNUwgU29DLCBlbmFibGluZyBvbi1ib2FyZCBwZXJpcGhlcmFscy4KCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGx4LW1pYm94NC5kdHMgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hseC1taWJveDQuZHRzCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWd4bHgtbWlib3g0LmR0cwoKWyAuLi4gXQoKPiArJmFwYiB7Cj4gKwlt
YWxpOiBncHVAYzAwMDAgewo+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNjAgSVJRX1RZUEVf
TEVWRUxfSElHSD4sCj4gKwkJCTxHSUNfU1BJIDE2MSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiAr
CQkJPEdJQ19TUEkgMTYyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJCQk8R0lDX1NQSSAxNjMg
SVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKwkJCTxHSUNfU1BJIDE2NCBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKPiArCQkJPEdJQ19TUEkgMTY1IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJCQk8R0lD
X1NQSSAxNjYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKwkJCTxHSUNfU1BJIDE2NyBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKPiArCQkJPEdJQ19TUEkgMTY4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+
ICsJCQk8R0lDX1NQSSAxNjkgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJaW50ZXJydXB0LW5h
bWVzID0gImdwIiwgImdwbW11IiwgInBwIiwgInBtdSIsCj4gKwkJCSJwcDAiLCAicHBtbXUwIiwg
InBwMSIsICJwcG1tdTEiLAo+ICsJCQkicHAyIiwgInBwbW11MiI7CgpbU2V2ZXJpdHk6IE1lZGl1
bV0KSXMgdGhpcyBpbnRlcnJ1cHQgY29uZmlndXJhdGlvbiBjb3JyZWN0IGZvciB0aGUgUzkwNUwg
U29DPwoKVGhlIFM5MDVMIGNvbnRhaW5zIGEgTWFsaS00NTAgTVAyIEdQVSwgYnV0IHRoaXMgc3Bl
Y2lmaWVzIDEwIGludGVycnVwdHMKd2hpY2ggdGFyZ2V0cyBhIE1hbGktNDUwIE1QMyBjb25maWd1
cmF0aW9uIChpbmNsdWRpbmcgcHAyIGFuZCBwcG1tdTIpLgoKQnkgcHJvdmlkaW5nIGludGVycnVw
dHMgZm9yIHRoZSBub24tZXhpc3RlbnQgcHAyIGFuZCBwcG1tdTIgY29yZXMsIGNvdWxkCnRoaXMg
Y2F1c2UgdGhlIExpbWEgR1BVIGRyaXZlciB0byBtaXN0YWtlbmx5IGF0dGVtcHQgaW5pdGlhbGl6
YXRpb24gb2YKbWlzc2luZyBJUCBibG9ja3M/IFRoaXMgbWlnaHQgcmVzdWx0IGluIGhhcmR3YXJl
IGluaXRpYWxpemF0aW9uIHRpbWVvdXRzLApzcHVyaW91cyBoYXJkd2FyZSByZXNldCBlcnJvcnMg
aW4gdGhlIGtlcm5lbCBsb2csIG9yIHBvdGVudGlhbGx5IHRyaWdnZXIKYSBmYXRhbCBidXMgZXJy
b3IgKFNFcnJvcikgZGVwZW5kaW5nIG9uIGhvdyB0aGUgU29DIGhhbmRsZXMgdW5tYXBwZWQgQVBC
CnJlYWRzLgoKPiArCX07Cj4gK307CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAzLW1pYm94NC1kdC12MS0wLWYy
OWYxZTgyOGNhM0BzdHUuaHF1LmVkdS5jbj9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
