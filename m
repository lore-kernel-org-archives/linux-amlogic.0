Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909F2C07E9D
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Sep 2022 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiOllAblft41hQWegwHGOCWasqtBkuF60pCm0MZZX74=; b=QajWRFSgXuVq41
	uiErI7DW5l8h18ohWyGo/v+fjZa2A9ihyiSZS7bByrhTm+j3sMH9ogsRLLKy5f6O42Cw8g7rWMjrP
	/7C5ulAorfbg2QVESwCcgCEDEsXzaXKC1IrHIYD0b1Kl+J7RwAFL5U0xPST7K4Z1lTE74T9zNktd2
	8CAMYoQ0YjF6Qe5MQJCnWd+SRSlHzt5qB0fz5pvYF0lNL83urR1gTEQ+VJ8lcXqSADceUrUo45XNz
	rzfXWKDW/Zd9wyabj2TKW2g0ubF17V8/+Xl37aZHyrOpcFIf4n+Noakzkw7OqRMl7g58gDXxfBiV8
	4nryrEI9fOE+Fwg8fZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc63S-007NYd-Gf; Sat, 24 Sep 2022 14:22:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc63P-007NWu-EZ; Sat, 24 Sep 2022 14:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA45D61192;
	Sat, 24 Sep 2022 14:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A142C433D6;
	Sat, 24 Sep 2022 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664029366;
	bh=DmG39HCLiqVHbQoFCtDoz0NAoOHiovpmsUn+4M8cQKQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DAJTSFkp0Pv/j1sorh6J2+fNUf4K+QglFZrNRAkNqvVgpXIOYs6M3akjqwu5V6TTn
	 nTQbgDrt41n38jL49OXrDd4Z/wOzyDUUG9i4QWFpO9Uc9s0y11ZHrosjZxOo3OuoLB
	 7MKfjOBN5dbqEiO2hN/5PXiUXcPojM1rg9w0jxchorBO3fCo+dnnjf34SvSBk4p+pU
	 YmsnmSdr3uUqvmohZYMQJpb88Q7POu6m0vWnZSGDJ7olKkWOgMtDkDvftvx6dqkYYR
	 pEhAFcc1LzvC/6bebpsmlqlUzg1+S5SbW6CzCcquqR3BdibiwYZnfiAyTXqP6GdcBF
	 SEdtsJxPYEScw==
Date: Sat, 24 Sep 2022 15:22:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-imx@nxp.com>, <linux-iio@vger.kernel.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Cixi Geng <cixi.geng1@unisoc.com>, Kevin Hilman
 <khilman@baylibre.com>, Vladimir Zapolskiy <vz@mleia.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Alexandru Ardelean
 <aardelean@deviqon.com>, "Fabio Estevam" <festevam@gmail.com>, Andriy
 Tryshnivskyy <andriy.tryshnivskyy@opensynergy.com>, Haibo Chen
 <haibo.chen@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, "Heiko
 Stuebner" <heiko@sntech.de>, Florian Boor <florian.boor@kernelconcepts.de>,
 Ciprian Regus <ciprian.regus@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, Jyoti Bhayana <jbhayana@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH 01/15] iio: adc: ad_sigma_delta: do not use internal
 iio_dev lock
Message-ID: <20220924152248.5523267d@jic23-huawei>
In-Reply-To: <20220920135410.4429694c@xps-13>
References: <20220920112821.975359-1-nuno.sa@analog.com>
	<20220920112821.975359-2-nuno.sa@analog.com>
	<20220920135410.4429694c@xps-13>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_072251_607587_56DCBE9F 
X-CRM114-Status: GOOD (  25.61  )
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

T24gVHVlLCAyMCBTZXAgMjAyMiAxMzo1NDoxMCArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgTnVubywKPiAKPiBudW5vLnNhQGFuYWxv
Zy5jb20gd3JvdGUgb24gVHVlLCAyMCBTZXAgMjAyMiAxMzoyODowNyArMDIwMDoKPiAKPiA+IERy
b3AgJ21sb2NrJyB1c2FnZSBieSBtYWtpbmcgdXNlIG9mIGlpb19kZXZpY2VfY2xhaW1fZGlyZWN0
X21vZGUoKS4KPiA+IFRoaXMgY2hhbmdlIGFjdHVhbGx5IG1ha2VzIHN1cmUgd2UgY2Fubm90IGRv
IGEgc2luZ2xlIGNvbnZlcnNpb24gd2hpbGUKPiA+IGJ1ZmZlcmluZyBpcyBlbmFibGUuIE5vdGUg
dGhlcmUgd2FzIGEgcG90ZW50aWFsIHJhY2UgaW4gdGhlIHByZXZpb3VzCj4gPiBjb2RlIHNpbmNl
IHdlIHdlcmUgb25seSBhY3F1aXJpbmcgdGhlIGxvY2sgYWZ0ZXIgY2hlY2tpbmcgaWYgdGhlIGJ1
cyBpcwo+ID4gZW5hYmxlZC4KPiA+IAo+ID4gRml4ZXM6IGFmMzAwODQ4NWVhMCAoImlpbzphZGM6
IEFkZCBjb21tb24gY29kZSBmb3IgQURJIFNpZ21hIERlbHRhZGV2aWNlcyIpICAKPiAKPiBUbyBh
bnN3ZXIgeW91ciBxdWVzdGlvbiBpbiB0aGUgY292ZXIgbGV0dGVyLCBJIGZlZWwgbGlrZSB0aGlz
IEZpeGVzOgo+IHRhZyBpcyBkZXNlcnZlZC4KPiAKPiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkFncmVlZCB0byB0aGUgZml4ZXMgdGFnIGJl
aW5nIHZhbGlkLgpUaGVyZSBpcyB0aGUgc2xpZ2h0bHkgZnVuIGFzcGVjdCB0aGF0IHRoZSBpc3N1
ZSBwcmVkYXRlcwp0aGUgaW50cm9kdWN0aW9uIG9mIGlpb19kZXZpY2VfY2xhaW1fZGlyZWN0X21v
ZGUoKSBzbyB3aGVuIHRoaXMgZ2V0cwpiYWNrcG9ydGVkIHdlIGNvdWxkIGdldCBmYWlsdXJlcy4g
IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIG9sZGVzdCBrZXJuZWwKYW55b25lIGlzIGJvdGhlcmluZyB3
aXRoIGluIHRoZSBzdGFibGUgc2VyaWVzIGlzIDQuOSBhbmQgdGhhdCBmdW5jdGlvbgp3YXMgaW50
cm9kdWNlZCBlYXJsaWVyIHRoZSBzYW1lIHllYXIgYXMgdGhhdCBrZXJuZWwgc28gd2UgYXJlIHBy
b2JhYmx5IGZpbmUgOikKCkknbSBnb2luZyB0byBwaWNrIHRoZSBlYXN5IG9uZXMgdXAgaW4gdGhp
cyBzZXJpZXMsIHRob3VnaCBub3RlIHRoYXQgdGhlc2UKYXJlICdwcm9iYWJseScgbm93IGJlaW5n
IHF1ZXVlZCB1cCBmb3IgbmV4dCBjeWNsZS4gIExpbnVzIG1hZGUgc29tZSBub2lzZXMKYWJvdXQg
YSBwb3NzaWJsZSByYzggdGhvdWdoIHNvIEkgbWlnaHQgZG8gYW4gZXh0cmEgcHVsbCByZXF1ZXN0
IGlmIHRoYXQgbG9va3MKbGlrZWx5IC0gdGhlbiB0aGVzZSBtaWdodCBtYWtlIGl0IGluIHJhdGhl
ciBzb29uZXIuCgpKb25hdGhhbgoKCgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51
bm8uc2FAYW5hbG9nLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaWlvL2FkYy9hZF9zaWdtYV9k
ZWx0YS5jIHwgOCArKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYWRf
c2lnbWFfZGVsdGEuYyBiL2RyaXZlcnMvaWlvL2FkYy9hZF9zaWdtYV9kZWx0YS5jCj4gPiBpbmRl
eCAyNjFhOWE2YjQ1ZTEuLmQ4NTcwZjYyMDc4NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaWlv
L2FkYy9hZF9zaWdtYV9kZWx0YS5jCj4gPiArKysgYi9kcml2ZXJzL2lpby9hZGMvYWRfc2lnbWFf
ZGVsdGEuYwo+ID4gQEAgLTI4MSwxMCArMjgxLDEwIEBAIGludCBhZF9zaWdtYV9kZWx0YV9zaW5n
bGVfY29udmVyc2lvbihzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+ID4gIAl1bnNpZ25lZCBp
bnQgZGF0YV9yZWc7Cj4gPiAgCWludCByZXQgPSAwOwo+ID4gIAo+ID4gLQlpZiAoaWlvX2J1ZmZl
cl9lbmFibGVkKGluZGlvX2RldikpCj4gPiAtCQlyZXR1cm4gLUVCVVNZOwo+ID4gKwlyZXQgPSBp
aW9fZGV2aWNlX2NsYWltX2RpcmVjdF9tb2RlKGluZGlvX2Rldik7Cj4gPiArCWlmIChyZXQpCj4g
PiArCQlyZXR1cm4gcmV0Owo+ID4gIAo+ID4gLQltdXRleF9sb2NrKCZpbmRpb19kZXYtPm1sb2Nr
KTsKPiA+ICAJYWRfc2lnbWFfZGVsdGFfc2V0X2NoYW5uZWwoc2lnbWFfZGVsdGEsIGNoYW4tPmFk
ZHJlc3MpOwo+ID4gIAo+ID4gIAlzcGlfYnVzX2xvY2soc2lnbWFfZGVsdGEtPnNwaS0+bWFzdGVy
KTsKPiA+IEBAIC0zMjMsNyArMzIzLDcgQEAgaW50IGFkX3NpZ21hX2RlbHRhX3NpbmdsZV9jb252
ZXJzaW9uKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gPiAgCWFkX3NpZ21hX2RlbHRhX3Nl
dF9tb2RlKHNpZ21hX2RlbHRhLCBBRF9TRF9NT0RFX0lETEUpOwo+ID4gIAlzaWdtYV9kZWx0YS0+
YnVzX2xvY2tlZCA9IGZhbHNlOwo+ID4gIAlzcGlfYnVzX3VubG9jayhzaWdtYV9kZWx0YS0+c3Bp
LT5tYXN0ZXIpOwo+ID4gLQltdXRleF91bmxvY2soJmluZGlvX2Rldi0+bWxvY2spOwo+ID4gKwlp
aW9fZGV2aWNlX3JlbGVhc2VfZGlyZWN0X21vZGUoaW5kaW9fZGV2KTsKPiA+ICAKPiA+ICAJaWYg
KHJldCkKPiA+ICAJCXJldHVybiByZXQ7ICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
