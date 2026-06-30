Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46540C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpSmtNDxGBeVNDafOCooH8DAJv8cL6TqIKPriSRAbCE=; b=tdpSnVJp74F3Av
	lfP/Yn0E7CR+XyKcqFwa6pDnPN/IAEIp7da/pk/74OXcjWeTGiTbkKk+6J6OImaWH1PZDtBa010G/
	JO9+310E9gBDca7ybpi32tIT7MyG4xkgMwOMZgcl7wOcYp+2HtigDrbqWo3avvJu8M1EVOhVlkZjw
	8c3+U+vH9p7nb4gZ+ZAV/A6JpKCxWq9Gn1aX9fUS9dKEkiZUBjRMH8GfR1Pn1aBHLkie0CJTnUTd3
	ZFYz41NMwYDvfvhr2fh0O/YM2c5+nt8CywGxjIFf0GFNTgJl5U2IXUq7HrzdesaiYRDGgPSq19USh
	fo5jIu88YSL2AOwYn+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegzd-00000000JVE-3cT3;
	Tue, 30 Jun 2026 22:31:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegzc-00000000JUn-3Lgl
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 22:31:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CB36001D
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 22:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E6E1F000E9
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858707;
	bh=0vyBcI5TrDUOJsKRP78Qn4UY47KkKEgHkVpg0R4944I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NaFJ1rIJVlJTeP3ijFYuHHLRJ2LVGBSp02a3unMxIHx/YqdVkwo9eSFZhBjTRjgU8
	 tKwPgYi2JnxPfWj8vtLQdcHbV6XGYaGmB8PQfhxjzVVls/a5q1yA75FYCG14qPXBuP
	 juQaLMme73XBDXgJ0ipPO8qeMLZ3J2kiR64TlBPdc6SX4nvZqlbcPSpew1wZYdsxWL
	 qiQftyANALt+OgbQcB+m9plrzrwUt2yWgjH3l3K5RNhqZK9Rn3Ma9gQvih2jlQxDhm
	 mTmGjnRKGoe7zo5ch3456UV2UtT/GGziMVK/1iOdgFp+EuhyvgVTjiR6tHcldNJ1KG
	 EaEc4MsCyUYwg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so3550301e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 15:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roz/k0yMIqgBZwGMrLmMNqEOg1uzBxF6zrerk1S9EhZOMAwcZS+d8TTWDWPc+6SnPsUqBFsqKUJJwL1D6n4@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9xs8GUzrDdRe53gFUyHWUBEVXRnoqELMsY3K9oBPbqt9u8lk
	LS0k3ZSX1oGuIl3nPUzRnX+HAzIMcptOMVAaHHetFye/B7Iojz1aeLyPgTaWD8JWRbSs0I3ZfdY
	rTOLohJwNDe4dOckS2o0wrJyF5tBCijQ=
X-Received: by 2002:a05:6512:3d19:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aebdb7b9f3mr1476506e87.2.1782858706533; Tue, 30 Jun 2026
 15:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-3-v@baodeep.com>
In-Reply-To: <20260625115718.1678991-3-v@baodeep.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
X-Gm-Features: AVVi8CfDmpM_WBEsoCA-fJj4k4OCxE4dpL_nSqphbxmK4p2VO77ksQUbWW6IkQU
Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: restore non-sleeping GPIO access
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjUsIDIwMjYgYXQgMTo1OOKAr1BNIFZpYWNoZXNsYXYgQm9jaGFyb3YgPHZA
YmFvZGVlcC5jb20+IHdyb3RlOgoKPiBDb21taXQgMjhmMjQwNjgzODcxICgicGluY3RybDogbWVz
b246IG1hcmsgdGhlIEdQSU8gY29udHJvbGxlciBhcwo+IHNsZWVwaW5nIikgc2V0IGdwaW9fY2hp
cC5jYW5fc2xlZXAgPSB0cnVlIHRvIHdvcmsgYXJvdW5kCj4gZ3Bpby1zaGFyZWQtcHJveHkgaG9s
ZGluZyBhIHNwaW5sb2NrIGFjcm9zcyBhIHNsZWVwaW5nIHBpbmN0cmwgY29uZmlnCj4gcGF0aC4g
VGhhdCBsb2NraW5nIGJ1ZyBpcyBub3cgZml4ZWQgaW4gdGhlIHNoYXJlZC1wcm94eSBpdHNlbGYg
KCJncGlvOgo+IHNoYXJlZC1wcm94eTogYWx3YXlzIHNlcmlhbGl6ZSB3aXRoIGEgc2xlZXBpbmcg
bXV0ZXgiKSwgc28gdGhlCj4gY29udHJvbGxlci13aWRlIHdvcmthcm91bmQgaXMgbm8gbG9uZ2Vy
IG5lZWRlZDsgdGhlIG1lc29uIEdQSU8KPiBjb250cm9sbGVyIGRvZXMgbm90IHNsZWVwLgo+Cj4g
bWVzb25fZ3Bpb19nZXQvc2V0L2RpcmVjdGlvbl8qIGFjY2VzcyBNTUlPIHRocm91Z2ggcmVnbWFw
LiBUaGUKPiByZWdtYXBfbW1pbyBidXMgdXNlcyBmYXN0IEkvTyAoc3BpbmxvY2spIGxvY2tpbmcs
IHNvIHRoZXNlIHZhbHVlCj4gY2FsbGJhY2tzIGRvIG5vdCBjb250YWluIHNsZWVwaW5nIG9wZXJh
dGlvbnMuIFNpbmNlIGdwaW9fY2hpcC5jYW5fc2xlZXAKPiBkZXNjcmliZXMgdGhlIGdldC9zZXQg
dmFsdWUgcGF0aCwgcmVzdG9yZSBjYW5fc2xlZXAgPSBmYWxzZS4KPgo+IE1hcmtpbmcgdGhlIGNv
bnRyb2xsZXIgc2xlZXBpbmcgYWxzbyBicm9rZSBhdG9taWMgdmFsdWUgY29uc3VtZXJzIHN1Y2gK
PiBhcyB3MS1ncGlvICgxLVdpcmUgYml0YmFuZyk6IHcxX2lvLmMgcnVucyBpdHMgcmVhZCB0aW1l
IHNsb3QgdW5kZXIKPiBsb2NhbF9pcnFfc2F2ZSgpIGFuZCB1c2VzIHRoZSBub24tY2Fuc2xlZXAg
Z3Bpb2Rfc2V0X3ZhbHVlKCkgLwo+IGdwaW9kX2dldF92YWx1ZSgpLCB3aGljaCB3aXRoIGNhbl9z
bGVlcD10cnVlIHRyaWdnZXIgV0FSTl9PTihjYW5fc2xlZXApCj4gaW4gZ3Bpb2xpYiBvbiBldmVy
eSB0cmFuc2ZlcnJlZCBiaXQgKGZyb20gdzFfZ3Bpb193cml0ZV9iaXQoKSAvCj4gdzFfZ3Bpb19y
ZWFkX2JpdCgpIHZpYSB3MV9yZXNldF9idXMoKSBhbmQgdzFfc2VhcmNoKCkpLiBUaGUgcHJpbnRr
IGFuZAo+IHN0YWNrIGR1bXAgaW5zaWRlIHRoZSBJUlFzLW9mZiwgbWljcm9zZWNvbmQtc2NhbGUg
dGltZSBzbG90IGRlc3Ryb3kgdGhlCj4gYml0IHRpbWluZywgc28gcmVzZXQvcHJlc2VuY2UgZGV0
ZWN0aW9uIGFuZCBST00gc2VhcmNoIGZhaWw6IHRoZSBidXMKPiBtYXN0ZXIgcmVnaXN0ZXJzIGJ1
dCB3MV9tYXN0ZXJfc2xhdmVfY291bnQgc3RheXMgYXQgMCBhbmQgbm8gZGV2aWNlcwo+IGFyZSBm
b3VuZC4gVmVyaWZpZWQgb24gYW4gQW1sb2dpYyBBMTEzWCBib2FyZCAoRFMxOEIyMCBvbiBHUElP
QV8xNCk6Cj4gd2l0aCBjYW5fc2xlZXAgcmVzdG9yZWQgdG8gZmFsc2UgdGhlIHdhcm5pbmdzIGFy
ZSBnb25lIGFuZCB0aGUgc2Vuc29yCj4gaXMgZGV0ZWN0ZWQgYW5kIHJlYWQgYWdhaW4uCj4KPiBU
aGlzIG11c3Qgbm90IGJlIGFwcGxpZWQgb3IgYmFja3BvcnRlZCB3aXRob3V0IHRoZSBzaGFyZWQt
cHJveHkgbG9ja2luZwo+IGZpeCBhYm92ZTsgb3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCBLaGFkYXMg
VklNMyBzcGxhdCByZXR1cm5zIG9uIGJvYXJkcwo+IHRoYXQgZ2VudWluZWx5IHNoYXJlIGEgbWVz
b24gR1BJTy4KPgo+IEZpeGVzOiAyOGYyNDA2ODM4NzEgKCJwaW5jdHJsOiBtZXNvbjogbWFyayB0
aGUgR1BJTyBjb250cm9sbGVyIGFzIHNsZWVwaW5nIikKPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjAxMDUxNTA1MDkuNTY1MzctMS1iYXJ0b3N6LmdvbGFzemV3c2tpQG9z
cy5xdWFsY29tbS5jb20vCj4gU2lnbmVkLW9mZi1ieTogVmlhY2hlc2xhdiBCb2NoYXJvdiA8dkBi
YW9kZWVwLmNvbT4KCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
