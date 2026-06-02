Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F2DCD6E60
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjW2KrfRLTxDFYo9TUR4KNBP9rAVnnOnr1rLCMrieX8=; b=1/ZY6dlDcTjuC6
	6a8kNmgq1uE0fOs+W6q2y0eyHcdsq8X5A4qyT3cLZf3861+VDn/xVukCZA1eU6If/yJyjtdQa70Pe
	WrUOpQkB+uIBonrPYyeHvxIj30B3b3N4yKh8xFR40oHm0KwVWWUgHYN9JCSKPr96CszaAy+TdO542
	yxqXzRbiSPy8bNCsjNEaccDtEQEqHPsheXq8clD3CQHmCAfyyaJ3zMBEAvTjxEnlmKQFi0YaI5ChS
	0TNToDMXA5ZlxNTq8IuaTiCAp6nkqjMdN0cDshnY0OylhN9ltl+zGT8DTjZFxuCCr2xN9wYGbxB+L
	2URoSa7u5q4g74GU09ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQBv-0000000DCBg-3I4v;
	Tue, 02 Jun 2026 14:34:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQBu-0000000DCBK-2DQ5
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 14:34:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8328F6001A;
	Tue,  2 Jun 2026 14:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5571F00893;
	Tue,  2 Jun 2026 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780410841;
	bh=SJPsWCk4G2HgbM6UHK7HKl7dS61v/+c65AiGcFKaBOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OXmhSm0MRFyCCIwm07L3fX272B862QvrDVHZYQWwh+xMcR94/iuFOpcKPBU0ujlGm
	 Bo3nCO00iwBPuWR3qHWfsQmuERJw9LK/QWkFu1HmX4bNqoeAlCUH/wPsPvnewB6PCM
	 VWpbFwxcRbpk3l9+olUHrLnruzazGU+1XelydMcK0D3h5uc9gOSEhYeM2yWLLJiAOp
	 XAWcKdBt0DIsHJfl/84CQuo/k7cWN3+oACsG1n17PXz2N718YwAsfhofNlR8B3zVLX
	 7eJiRCSZAJlGvH1v/DprLxOgc9EM65UkywvLWyAFORzphgRzGtfVSqAqkPCsyizc+X
	 cnARGYxhTXNfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Date: Tue, 02 Jun 2026 14:34:00 +0000
Message-Id: <20260602143400.8E5571F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBjb21taXQgaW50
cm9kdWNlcyBhIHNwdXJpb3VzIGBkZXBlbmRzIG9uIE1FU09OX1NNYCBkZXBlbmRlbmN5IGZvciBg
Q09ORklHX0FNTE9HSUNfVEhFUk1BTGAgYmFzZWQgb24gdGhlIGZhbHNlIHByZW1pc2UgdGhhdCB0
aGUgZHJpdmVyIGNhbGxzIGBtZXNvbl9zbV9nZXQoKWAgYW5kIGBtZXNvbl9zbV9nZXRfdGhlcm1h
bF9jYWxpYigpYC4gQW4gYW5hbHlzaXMgb2YgYGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJt
YWwuY2AgY29uZmlybXMgaXQgcmVsaWVzIG9uIGEgc3lzY29uIHJlZ21hcCAoYGFtbG9naWMsYW8t
c2VjdXJlYCkgZm9yIGl0cyBjYWxpYnJhdGlvbiBkYXRhIGFuZCBtYWtlcyBubyBjYWxscyB0byB0
aGUgc2VjdXJlIG1vbml0b3IgZHJpdmVyLiBDcnVjaWFsbHksIGBNRVNPTl9TTWAgc3RyaWN0bHkg
ZGVwZW5kcyBvbiBgQVJNNjRfNEtfUEFHRVNgLiBUaHVzLCB0aGlzIHBhdGNoIGluYWR2ZXJ0ZW50
bHkgZGlzYWJsZXMgdGhlcm1hbCBtYW5hZ2VtZW50IG9uIGFsbCBBbWxvZ2ljIHN5c3RlbXMgdXNp
bmcgMTZLIG9yIDY0SyBwYWdlIHNpemVzLCBvciB0aG9zZSBpbnRlbnRpb25hbGx5IG9taXR0aW5n
IGBNRVNPTl9TTWAuCi0tCgpjb21taXQgZjljM2I5MDk3YWM3NzA1NDJlNzI2YTM3OWEwNzA0N2Fi
YjM2OWJhZQpBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZy
PgoKdGhlcm1hbDogYW1sb2dpYzogYWRkIG1pc3NpbmcgZGVwZW5kZW5jeSBvbiBNRVNPTl9TTQoK
VGhpcyBjb21taXQgYWRkcyBhIGRlcGVuZGVuY3kgb24gTUVTT05fU00gdG8gdGhlIEFtbG9naWMg
dGhlcm1hbCBkcml2ZXIKY29uZmlndXJhdGlvbiB0byBhZGRyZXNzIHJlcG9ydGVkIHVuZGVmaW5l
ZCByZWZlcmVuY2VzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFs
bC8yMDI2MDUyOTE1MzAuZW43YUduN3ctbGtwQGludGVsLmNvbS8KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdGhlcm1hbC9LY29uZmlnIGIvZHJpdmVycy90aGVybWFsL0tjb25maWcKPiAtLS0gYS9k
cml2ZXJzL3RoZXJtYWwvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9LY29uZmlnCj4g
QEAgLTQzNiw2ICs0MzYsNyBAQCBjb25maWcgQU1MT0dJQ19USEVSTUFMCj4gIAl0cmlzdGF0ZSAi
QW1sb2dpYyBUaGVybWFsIFN1cHBvcnQiCj4gIAlkZWZhdWx0IEFSQ0hfTUVTT04KPiAgCWRlcGVu
ZHMgb24gT0YgJiYgQVJDSF9NRVNPTgo+ICsJZGVwZW5kcyBvbiBNRVNPTl9TTQoKW1NldmVyaXR5
OiBIaWdoXQpUaGUgY29tbWl0IG1lc3NhZ2Ugc3RhdGVzIHRoYXQgdGhlIGFtbG9naWMgdGhlcm1h
bCBkcml2ZXIgY2FsbHMKbWVzb25fc21fZ2V0KCkgYW5kIG1lc29uX3NtX2dldF90aGVybWFsX2Nh
bGliKCkuIElzIHRoaXMgZGVzY3JpcHRpb24KYWNjdXJhdGU/CgpMb29raW5nIGF0IGRyaXZlcnMv
dGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYywgdGhlIGRyaXZlciBhcHBlYXJzIHRvIHJlbHkgb24g
YQpzeXNjb24gcmVnbWFwIChhbWxvZ2ljLGFvLXNlY3VyZSkgZm9yIGl0cyBjYWxpYnJhdGlvbiBk
YXRhLCByYXRoZXIgdGhhbiBtYWtpbmcKZGlyZWN0IGNhbGxzIHRvIHRoZSBzZWN1cmUgbW9uaXRv
ci4KClNpbmNlIE1FU09OX1NNIGhhcyBhIHN0cmljdCBkZXBlbmRlbmN5IG9uIEFSTTY0XzRLX1BB
R0VTLCB3b3VsZG4ndCBhZGRpbmcKdGhpcyBkZXBlbmRlbmN5IGluYWR2ZXJ0ZW50bHkgZGlzYWJs
ZSB0aGVybWFsIG1hbmFnZW1lbnQgb24gYWxsIEFtbG9naWMKc3lzdGVtcyB1c2luZyAxNksgb3Ig
NjRLIHBhZ2Ugc2l6ZXMsIG9yIHRob3NlIGludGVudGlvbmFsbHkgb21pdHRpbmcgTUVTT05fU00/
CgpXaXRob3V0IHRoZXJtYWwgbWFuYWdlbWVudCwgdGhlc2Ugc3lzdGVtcyBtaWdodCBzdWZmZXIg
ZnJvbSBhIGxhY2sgb2YKYWN0aXZlIGNvb2xpbmcgb3IgdGhlcm1hbCB0aHJvdHRsaW5nLgoKPiAg
CWhlbHAKPiAgCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBvcnQgZm9yIEFtbG9n
aWMgVGhlcm1hbAo+ICAJICBmb3IgRzEyIFNvQyBGYW1pbHkuCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjAyLWZpeC1taXNzaW5n
LW1lc29uX3NtLXN5bWJvbC12My0xLTZmN2Y2OWNkN2Q2Y0BhbGllbC5mcj9wYXJ0PTEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
