Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B720C44501
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xezUxc/1JfpH7Easm054iT8B7D47hw6b2rtZ+VyqwgU=; b=P6TpkyHDM0JghK
	B26CCjDnPWQ4kcUbJrUIRSSbNommhdIO9TPW1dO2w14Snc07cA4Neh08k7mtphiQESIcJanKIlVc0
	AqWKSp1tVvl8QYD7pJg/LPtMi7vdA22U1IvOgFTs4eW1pHogRPm4HMZNMnhqtD0AfEe3xLO/3GK2V
	X9rt7zxyCn/dLlBTZup3OligafvAxnK0WCdzqETCuHIlnT6Ru/PGGzcQO0EtOW+GqegvqVFilg5cU
	NSm42M4syUIIP/0nDL7wPJr/25ZumYtC+1D69FHvlx/sa2PJ3ew2T2gufxiQ/2xejrxfbN4C+OJ4n
	PYAOW3p5Gwzdw9xGGuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WS-0000000F7QS-1JCI;
	Tue, 07 Jul 2026 14:11:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WP-0000000F7Pg-1gL1
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 14:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6849460018;
	Tue,  7 Jul 2026 14:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943421F000E9;
	Tue,  7 Jul 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433496;
	bh=nm0y0ggHgyoSIFEw/puAOvt8d3BgJyeQmpoK6IqR2TI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVQLAHYLitZPOD6hz4ljD9bztAdGMzeyKCguU8ZNikNhGPg/habFh1ZqwmeiwAm8A
	 gU+/FtTNIcwYgbJQDC2+cChk9FmDTdehA+USeLYIoz2r2lc2pkmquvse91dTDknMRT
	 8Kj+AwMDNQLdjDlBUVQuSdfjqZ+yNBeH0ubpaOgUMbhdsnoAjIsPmNpV5OS/YlMmAd
	 LZtemV3Qiu7TEAdUkDca8k4xKnSkj5+QKj5Ne3I4R+nFp8Mja4joPmjyUp/+abd5VU
	 uCVFtFKt9LvjIkE88bSpbok8vCiS8p6uIpoDtAKr2su1iMfuq+Zo5hA0LEAWTKeNl3
	 IpNDONfZMLOVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:11:35 +0000
Message-Id: <20260707141135.943421F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGBwb3dlci1kb21h
aW4tbmFtZXNgIHByb3BlcnR5IGxhY2tzIGEgc3RyaW5nIHZhbHVlIGNvbnN0cmFpbnQsIGFsbG93
aW5nIGFyYml0cmFyeSBzdHJpbmdzIHRvIHBhc3MgdmFsaWRhdGlvbi4KLS0KCmNvbW1pdCBkYTJk
MDFiMGM1YWJlZTE1NmZkYzliZjFlMjYxZTU3ODlhMmM2ZmI3CkF1dGhvcjogQmFydG9zeiBHb2xh
c3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPgoKZHQtYmluZGlu
Z3M6IHBoeTogZG9jdW1lbnQgdGhlIHNlcmRlcyBQSFkgb24gc2E4MjU1cAoKRGVzY3JpYmUgdGhl
IFNHTUlJL1NlckRlcyBQSFkgcHJlc2VudCBvbiB0aGUgUXVhbGNvbW0gc2E4MjU1cCBwbGF0Zm9y
bXMuClRoaXMgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgaGFyZHdhcmUgYXMgc2E4Nzc1cCByZXYz
IGJ1dCB0aGUgUEhZIGlzCm1hbmFnZWQgYnkgZmlybXdhcmUgb3ZlciBTQ01JLgoKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9xY29tLHNhODI1NXAt
ZHdtYWMtc2dtaWktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L3Fjb20sc2E4MjU1cC1kd21hYy1zZ21paS1waHkueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uOWU4NDZlMzgxNTU1NQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Fjb20sc2E4MjU1
cC1kd21hYy1zZ21paS1waHkueWFtbApbIC4uLiBdCj4gKyAgcG93ZXItZG9tYWluczoKPiArICAg
IG1heEl0ZW1zOiAxCj4gKwo+ICsgIHBvd2VyLWRvbWFpbi1uYW1lczoKPiArICAgIG1heEl0ZW1z
OiAxCgpbU2V2ZXJpdHk6IExvd10KRG9lcyB0aGlzIHByb3BlcnR5IG5lZWQgYSBzdHJpbmcgdmFs
dWUgY29uc3RyYWludD8gCgpUaGUgY3VycmVudCBzY2hlbWEgbGltaXRzIHRoZSBhcnJheSBsZW5n
dGggYnV0IGFsbG93cyBhcmJpdHJhcnkgc3RyaW5ncyB0byBwYXNzCnNjaGVtYSB2YWxpZGF0aW9u
LiBTaG91bGQgaXQgaW5jbHVkZSBhbiBpdGVtcyBsaXN0IHdpdGggYSBjb25zdCB2YWx1ZSwgc3Vj
aCBhcwpjb25zdDogc2VyZGVzLCB0byBtYXRjaCB0aGUgdXNhZ2UgaW4gdGhlIGV4YW1wbGU/Cgo+
ICsKPiArICAiI3BoeS1jZWxscyI6Cj4gKyAgICBjb25zdDogMAoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwNi1xY29tLXNhODI1
NXAtZW1hYy12MTItMC1lM2FiMWVjZjI5MDFAb3NzLnF1YWxjb21tLmNvbT9wYXJ0PTEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
