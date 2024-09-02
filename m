Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE65FCA0ED3
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz0sRSqkUT1pI4XPKoiZ0fOQfkEySkwbRtdAJizeEoI=; b=iwXbdHjrsvhf4y
	3qm3wJYC7RUHm6+abCvDCTHhBAnd6cDhsxttnJsUe8kqctUc0kVz7MouoKdW618vGrNdzCSe3BO8r
	BHenfBoBBDoCa6PthT5TnJI2Qz8YOsC90+PWg8wHIpd2lDzDUNfpmttCclOddWb96ursVQ3/XszcM
	gTTVLs/s+Pk272akp1Ui1Mrc6hOU/9I0wB2HYo5nG//KyL3hkF1APYDpljTfNj/alGWIMl8wmBKcZ
	whWChW6bxP2ghmIQaj+49WqcQnxuKHVGqfQuNnpCIx56MjTk5jO60ikp8pdx4NyQdiYyzG2RLhkwj
	0E9E4xen3DNUQr7SMlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl1EN-0000000DF80-28rA;
	Mon, 02 Sep 2024 07:12:07 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl1EJ-0000000DF4D-2iYA;
	Mon, 02 Sep 2024 07:12:05 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 75E09C3F2A57;
	Mon,  2 Sep 2024 09:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 75E09C3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>,
  Jerome Brunet <jbrunet@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  linux-media@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] media: ar0521: Refactor ar0521_power_off()
In-Reply-To: <20240816-smatch-clock-v2-1-c63105db07e8@chromium.org> (Ricardo
	Ribalda's message of "Fri, 16 Aug 2024 12:31:59 +0000")
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
	<20240816-smatch-clock-v2-1-c63105db07e8@chromium.org>
Date: Mon, 02 Sep 2024 09:11:55 +0200
Message-ID: <m3tteycyx0.fsf@t19.piap.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_001203_866170_571322A8 
X-CRM114-Status: GOOD (  17.94  )
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

SGkgUmljYXJkbywKClJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+IHdyaXRl
czoKCj4gRmFjdG9yIG91dCBhbGwgdGhlIHBvd2VyIG9mZiBsb2dpYywgZXhjZXB0IHRoZSBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoKSwKPiB0byBhIG5ldyBmdW5jdGlvbiBfX2FyMDUyMV9wb3dlcl9v
ZmYoKS4KPgo+IFRoaXMgYWxsb3dzIGFyMDUyMV9wb3dlcl9vbigpIHRvIGV4cGxpY2l0bHkgY2xl
YW4tb3V0IHRoZSBjbG9jayBkdXJpbmcKPiB0aGUgZXJyb3ItcGF0aC4KPgo+IFRoZSBmb2xsb3dp
bmcgc21hdGNoIHdhcm5pbmcgaXMgZml4ZWQ6Cj4gZHJpdmVycy9tZWRpYS9pMmMvYXIwNTIxLmM6
OTEyIGFyMDUyMV9wb3dlcl9vbigpIHdhcm46ICdzZW5zb3ItPmV4dGNsaycgZnJvbSBjbGtfcHJl
cGFyZV9lbmFibGUoKSBub3QgcmVsZWFzZWQgb24gbGluZXM6IDkxMi4KClRCSCBJIGRvbid0IGtu
b3cgaWYgdGhlIGNvZGUgd2l0aCB0aGUgcGF0Y2ggYXBwbGllZCBpcyBiZXR0ZXIgb3Igbm90LgpJ
dCBpZiBzaWxlbmNlcyB0aGUgdG9vbCwgd2VsbCwgc29tZXRpbWVzIHRoaW5ncyBhcmUgbm90IGFz
IGNsZWFyIGFzIHdlCndhbnQgdGhlbS4KCkFja2VkLWJ5OiBLcnp5c3p0b2YgSGHFgmFzYSA8a2hh
bGFzYUBwaWFwLnBsPgoKPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIFJpYmFsZGEgPHJpYmFsZGFA
Y2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL2kyYy9hcjA1MjEuYyB8IDE3ICsr
KysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2FyMDUyMS5jIGIv
ZHJpdmVycy9tZWRpYS9pMmMvYXIwNTIxLmMKPiBpbmRleCAwOTMzMWNmOTVjNjIuLjU2YTcyNGI0
ZDQ3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9hcjA1MjEuYwo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL2FyMDUyMS5jCj4gQEAgLTgzNSwxNCArODM1LDEyIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaW5pdGlhbF9yZWcgewo+ICAgICAgICAgICAgICBiZSgweDA3MDcpKSwgLyog
M0Y0NDogY291cGxlIGsgZmFjdG9yIDIgKi8KPiAgfTsKPgo+IC1zdGF0aWMgaW50IGFyMDUyMV9w
b3dlcl9vZmYoc3RydWN0IGRldmljZSAqZGV2KQo+ICtzdGF0aWMgdm9pZCBfX2FyMDUyMV9wb3dl
cl9vZmYoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdjRsMl9zdWJk
ZXYgKnNkID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gICAgICAgICBzdHJ1Y3QgYXIwNTIxX2Rl
diAqc2Vuc29yID0gdG9fYXIwNTIxX2RldihzZCk7Cj4gICAgICAgICBpbnQgaTsKPgo+IC0gICAg
ICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNlbnNvci0+ZXh0Y2xrKTsKPiAtCj4gICAgICAgICBp
ZiAoc2Vuc29yLT5yZXNldF9ncGlvKQo+ICAgICAgICAgICAgICAgICBncGlvZF9zZXRfdmFsdWUo
c2Vuc29yLT5yZXNldF9ncGlvLCAxKTsgLyogYXNzZXJ0IFJFU0VUIHNpZ25hbCAqLwo+Cj4gQEAg
LTg1MCw2ICs4NDgsMTYgQEAgc3RhdGljIGludCBhcjA1MjFfcG93ZXJfb2ZmKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgICAgICAgICAgICAgICAgaWYgKHNlbnNvci0+c3VwcGxpZXNbaV0pCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yX2Rpc2FibGUoc2Vuc29yLT5zdXBwbGllc1tp
XSk7Cj4gICAgICAgICB9Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgYXIwNTIxX3Bvd2VyX29mZihz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldiAqc2Qg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArICAgICAgIHN0cnVjdCBhcjA1MjFfZGV2ICpzZW5z
b3IgPSB0b19hcjA1MjFfZGV2KHNkKTsKPiArCj4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUoc2Vuc29yLT5leHRjbGspOwo+ICsgICAgICAgX19hcjA1MjFfcG93ZXJfb2ZmKGRldik7Cj4g
Kwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IEBAIC05MDgsNyArOTE2LDggQEAgc3RhdGlj
IGludCBhcjA1MjFfcG93ZXJfb24oc3RydWN0IGRldmljZSAqZGV2KQo+Cj4gICAgICAgICByZXR1
cm4gMDsKPiAgb2ZmOgo+IC0gICAgICAgYXIwNTIxX3Bvd2VyX29mZihkZXYpOwo+ICsgICAgICAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNlbnNvci0+ZXh0Y2xrKTsKPiArICAgICAgIF9fYXIwNTIx
X3Bvd2VyX29mZihkZXYpOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+CgotLSAKS3J6eXN6
dG9mICJDaHJpcyIgSGHFgmFzYQoKU2llxIcgQmFkYXdjemEgxYF1a2FzaWV3aWN6ClByemVteXPF
gm93eSBJbnN0eXR1dCBBdXRvbWF0eWtpIGkgUG9taWFyw7N3IFBJQVAKQWwuIEplcm96b2xpbXNr
aWUgMjAyLCAwMi00ODYgV2Fyc3phd2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
