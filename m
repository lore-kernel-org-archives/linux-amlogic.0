Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63687FF885D
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2026 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3e9g23wGd0Z1p+GMhn0Li1xKdRS/4SIz6nkleuwBxBc=; b=iok7ghDvTKTodG
	F83rYo/kvmj+7jrqAWnsMbzJ/sNMK1P7WI1S5z9UJqQfPSWDXT3hfHg43HlhsET3Kslrelzo/7nV7
	Qd+O/rxPqo3asnR7DccXvoUXtVHYPqQr1sQtizYoM6ydcXDJF4iT7o/e+VE742WZYRDOdXX8G+LdT
	xKq9nK9Kk9SMoL2I9gF3bVgGzux1qYVMBepKs6Gor4vh1yOap1S6RVk/NglZg34mvLLv9C6b5PtJK
	sgzjG4y84gZD06pmQMSswP771vZqHwKwYBq0CeKk61sgJt7DAA9B9iVrR6PTpgDo0SU2+HzYsOowf
	k/6uDRRN5nhAeiD1gR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwvZ-0000000FSYl-1Imn;
	Sun, 26 Apr 2026 10:41:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwvY-0000000FSYS-1ywj;
	Sun, 26 Apr 2026 10:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 934C2600CB;
	Sun, 26 Apr 2026 10:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B5DC2BCAF;
	Sun, 26 Apr 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777200087;
	bh=bWuYnO75xPWJJzpmOLfME7o59x3oZomw2PqqFsHNDKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rxn4W1ybROgNUPHL7WHZepd5HEn3s4NjpiHxJPTzVQTagfs298o6rOZZ3vI4COjS0
	 Zo1QTzuYVJJEhelJrboWJ+aYJZsM/LthaEvmMqcFjg+2TOQZvd6FP9h40puitiI696
	 qGup3Zb0LePODPuqynEoHZA936p8PvtaL9GK/RJAmK5gfwmUXI1q8B3iAhgWP3MsR3
	 2TUZmwQcf0j0+HQwKrKWJwMkbUxdviLcEfi2ZEHMD8XBUJGVWIHHcW35afjIB1vAlB
	 ZhtLxGOS6feEg8BeHxFvIMPytR2sbX52jNC4sLyZ43+naquvu5p1m+BrsuNnPhFB+e
	 v4Dt1yZDNY+OA==
Date: Sun, 26 Apr 2026 11:41:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Felix Gu <ustc.gu@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260426114118.7ad8b130@jic23-huawei>
In-Reply-To: <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

T24gU2F0LCAyNSBBcHIgMjAyNiAxMjoyMDo1NSAtMDcwMApSb3NlbiBQZW5ldiA8cm9zZW5wQGdt
YWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFNhdCwgQXByIDI1LCAyMDI2IGF0IDk6MDfigK9BTSBGZWxp
eCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IG1lc29uX3Nhcl9hZGNfdGVt
cF9zZW5zb3JfaW5pdCgpIGFsbG9jYXRlcyBhIGJ1ZmZlciB3aXRoCj4gPiBudm1lbV9jZWxsX3Jl
YWQoKSwgYnV0IHRoZSBvbGQgY29kZSBsZWFrZWQgaXQgaWYKPiA+IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGUoKSBmYWlsZWQuCj4gPgo+ID4gU3dpdGNoIGJ1ZiB0byBfX2ZyZWUoa2Zy
ZWUpIHNvIGFsbCByZXR1cm4gcGF0aHMgcmVsZWFzZSBpdC4KPiA+Cj4gPiBGaXhlczogZDZmMmVh
YzY0NDAzICgiaWlvOiBhZGM6IG1lc29uOiBubyBkZXZtIGZvciBudm1lbV9jZWxsX2dldCIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMgfCAxMCArKystLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jIGIvZHJpdmVycy9paW8vYWRj
L21lc29uX3NhcmFkYy5jCj4gPiBpbmRleCAyMzk5MWEzNjEyYmQuLjk3MDhkZGNjNDkxOSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYwo+ID4gKysrIGIvZHJp
dmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCj4gPiBAQCAtNzg2LDcgKzc4Niw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fc2FyX2FkY19jbGtfaW5pdChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+
ID4gIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY190ZW1wX3NlbnNvcl9pbml0KHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgbWVzb25fc2FyX2FkY19w
cml2ICpwcml2ID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPiA+IC0gICAgICAgdTggKmJ1ZiwgdHJp
bW1pbmdfYml0cywgdHJpbW1pbmdfbWFzaywgdXBwZXJfYWRjX3ZhbDsKPiA+ICsgICAgICAgdTgg
dHJpbW1pbmdfYml0cywgdHJpbW1pbmdfbWFzaywgdXBwZXJfYWRjX3ZhbDsKPiA+ICAgICAgICAg
c3RydWN0IGRldmljZSAqZGV2ID0gaW5kaW9fZGV2LT5kZXYucGFyZW50Owo+ID4gICAgICAgICBz
dHJ1Y3QgbnZtZW1fY2VsbCAqdGVtcGVyYXR1cmVfY2FsaWI7Cj4gPiAgICAgICAgIHNpemVfdCBy
ZWFkX2xlbjsKPiA+IEBAIC04MDcsMTQgKzgwNywxMiBAQCBzdGF0aWMgaW50IG1lc29uX3Nhcl9h
ZGNfdGVtcF9zZW5zb3JfaW5pdChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQo+ID4gICAgICAg
ICB9Cj4gPgo+ID4gICAgICAgICByZWFkX2xlbiA9IE1FU09OX1NBUl9BRENfRUZVU0VfQllURVM7
Cj4gPiAtICAgICAgIGJ1ZiA9IG52bWVtX2NlbGxfcmVhZCh0ZW1wZXJhdHVyZV9jYWxpYiwgJnJl
YWRfbGVuKTsKPiA+ICsgICAgICAgdTggKmJ1ZiBfX2ZyZWUoa2ZyZWUpID0gbnZtZW1fY2VsbF9y
ZWFkKHRlbXBlcmF0dXJlX2NhbGliLCAmcmVhZF9sZW4pOwo+ID4gICAgICAgICBudm1lbV9jZWxs
X3B1dCh0ZW1wZXJhdHVyZV9jYWxpYik7Cj4gPiAgICAgICAgIGlmIChJU19FUlIoYnVmKSkKPiA+
ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYnVmKSwg
ImZhaWxlZCB0byByZWFkIHRlbXBlcmF0dXJlX2NhbGliIGNlbGxcbiIpOwo+ID4gLSAgICAgICBp
ZiAocmVhZF9sZW4gIT0gTUVTT05fU0FSX0FEQ19FRlVTRV9CWVRFUykgewo+ID4gLSAgICAgICAg
ICAgICAgIGtmcmVlKGJ1Zik7ICAKPiBJIGRvbid0IGxpa2UgdGhpcy4gSnVzdCBhZGQgdGhlIG1p
c3Npbmcga2ZyZWUuCgpUaGF0IGlzIHRoZSBtaW5pbWFsIGZpeCwgc28gd2Ugc2hvdWxkIHByb2Jh
Ymx5IGRvIHRoYXQgZmlyc3QKZXZlbiBpZiB3ZSB0aGVuIGNpcmNsZSBiYWNrIHRvIGNvbnNpZGVy
IGlmIF9fZnJlZSgpIG1hZ2ljIGlzIHdvcnRoIHVzaW5nIGhlcmUuCgpKCj4gPiArICAgICAgIGlm
IChyZWFkX2xlbiAhPSBNRVNPTl9TQVJfQURDX0VGVVNFX0JZVEVTKQo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgImludmFsaWQgcmVhZCBzaXpl
IG9mIHRlbXBlcmF0dXJlX2NhbGliIGNlbGxcbiIpOwo+ID4gLSAgICAgICB9Cj4gPgo+ID4gICAg
ICAgICBwcml2LT50c2NfcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShk
ZXYtPm9mX25vZGUsICJhbWxvZ2ljLGhoaS1zeXNjdHJsIik7Cj4gPiAgICAgICAgIGlmIChJU19F
UlIocHJpdi0+dHNjX3JlZ21hcCkpCj4gPiBAQCAtODM1LDggKzgzMyw2IEBAIHN0YXRpYyBpbnQg
bWVzb25fc2FyX2FkY190ZW1wX3NlbnNvcl9pbml0KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYp
Cj4gPiAgICAgICAgIHByaXYtPnRlbXBlcmF0dXJlX3NlbnNvcl9hZGNfdmFsIHw9IHVwcGVyX2Fk
Y192YWwgPDwgQklUU19QRVJfQllURTsKPiA+ICAgICAgICAgcHJpdi0+dGVtcGVyYXR1cmVfc2Vu
c29yX2FkY192YWwgPj49IHRyaW1taW5nX2JpdHM7Cj4gPgo+ID4gLSAgICAgICBrZnJlZShidWYp
Owo+ID4gLQo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4KPiA+IC0tLQo+ID4g
YmFzZS1jb21taXQ6IDcwODBlMzJkM2YwOWQ4Njg4YzRhODdkODFiZGNjNzFmN2Y2MDZiMTYKPiA+
IGNoYW5nZS1pZDogMjAyNjA0MjUtbWVzb25fc2FyYWRjLTU0YWJjNTJkOWIzMQo+ID4KPiA+IEJl
c3QgcmVnYXJkcywKPiA+IC0tCj4gPiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+Cj4gPiAg
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
