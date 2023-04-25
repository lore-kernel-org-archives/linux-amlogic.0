Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4F4C77B61
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5Qkm7qF3z5Jpeu3yDOAfhz+ZpEwoS9o320o5ortkvI=; b=1K58sVvGgmCKr4
	99bADR+9bVR8f5201IYhFMAT2pQLAJR+i/EpOOqIMabIrj10xObOq+3fIU4fm3QhAkxHXMFjWeFTd
	HLhV34Pp0kDtpFt8rFLVJJd1RFi+gVZ8wjptt9z45Yb5Wj1seT1HJGI97m8Q9wKZxtxTtCIGNqlH/
	BLOfeADZuDwMNOImHvNl4qZbB6pL+xna24EN9mdNLoncZhIJVU5uZNUsn7G1BKi6T0MrJ5vYdZpTP
	7rnZjM/jI9mXfm2vBZNQB7ab3CZU8ffXkJPo+KtWdpn9xU062GMTXEWyIJ+sigocekA7Ye8a8aY1a
	aidy55fGl1asoRCrr0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFvN-000mIL-2t;
	Tue, 25 Apr 2023 10:29:29 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFvH-000mE4-1L;
	Tue, 25 Apr 2023 10:29:28 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C33525FD3A;
	Tue, 25 Apr 2023 13:29:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682418556;
	bh=7hJUvsqyjWvVw7Khab8QmwY8D6Cfdc1hwURLPhG6nao=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=R8pi8/0owL2UIrCSxT7v/uznrT6w4UND+ouhHulfzffi8K9KU7C0DQcQhAhVmfAUO
	 bHj8WqBB6H3BW1VsgjG3heM0vG131VbHEWGjsGvYd6WiRfhLDQC+BjixfJoQWUJeiz
	 ROjtBRLmM6MkBYX2seBbll/WzJT3znwgbP3HS2VrCZQ5nh/kBIi7sdABi4Fqda4bgR
	 7INi08hXNI89fs09g1mxsJ/25OH3jp7k2WWjMjIm5VGQsmkI1P6sBaNM8CrPG8UyB8
	 lnkB6hSsKBEYNlxyImd8z94Jdf+255FWgkHqsDP4ABG6+1fWhF2DEYPaq3rK9kj7H1
	 e1HLqiXav4S0Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 25 Apr 2023 13:29:12 +0300 (MSK)
Date: Tue, 25 Apr 2023 13:29:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>, <yue.wang@amlogic.com>,
	<hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] phy: amlogic: enable/disable clkin during Amlogic
 USB PHY init/exit
Message-ID: <20230425102912.qhey7fpbuqvwg44j@CAB-WSD-L081021>
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru>
 <20230418111612.19479-2-ddrokosov@sberdevices.ru>
 <CAFBinCDyhBQ5Nob38EmXor1PtcO09dRdReDTW+tc5CN4i20HhA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDyhBQ5Nob38EmXor1PtcO09dRdReDTW+tc5CN4i20HhA@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/25 07:55:00 #21159618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_032924_154499_E06D1728 
X-CRM114-Status: GOOD (  36.21  )
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

SGVsbG8gTWFydGluLAoKVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3ISBBcHByZWNpYXRlIGl0
IQpQbGVhc2UgZmluZCBteSBjb21tZW50cyBiZWxvdy4KCk9uIFN1biwgQXByIDIzLCAyMDIzIGF0
IDA3OjQyOjI1UE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gSGkgRG1pdHJ5
LAo+IAo+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDE6MTbigK9QTSBEbWl0cnkgUm9rb3NvdiA8
ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiA+Cj4gPiBQcmV2aW91c2x5LCBhbGwg
QW1sb2dpYyBib2FyZHMgdXNlZCB0aGUgWFRBTCBjbG9jayBhcyB0aGUgZGVmYXVsdCBib2FyZAo+
ID4gY2xvY2sgZm9yIHRoZSBVU0IgUEhZIGlucHV0LCBzbyB0aGVyZSB3YXMgbm8gbmVlZCB0byBl
bmFibGUgaXQuCj4gPiBIb3dldmVyLCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3IEFtbG9n
aWMgU29DcyBsaWtlIHRoZSBBMSBmYW1pbHksCj4gPiB0aGUgVVNCIFBIWSBub3cgdXNlcyBhIGdh
dGVkIGNsb2NrLiBIZW5jZSwgaXQgaXMgbmVjZXNzYXJ5IHRvIGVuYWJsZQo+ID4gdGhpcyBnYXRl
ZCBjbG9jayBkdXJpbmcgdGhlIFBIWSBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSwgb3IgZGlzYWJs
ZSBpdAo+ID4gZHVyaW5nIHRoZSBQSFkgZXhpdCwgYXMgYXBwcm9wcmlhdGUuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEtdXNiMi5jIHwgMTMg
KysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1t
ZXNvbi1nMTJhLXVzYjIuYyBiL2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEtdXNi
Mi5jCj4gPiBpbmRleCA5ZDFlZmEwZDkzOTQuLjgwOTM4NzUxZGE0ZiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEtdXNiMi5jCj4gPiArKysgYi9kcml2
ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1nMTJhLXVzYjIuYwo+ID4gQEAgLTE3MiwxMCArMTcy
LDE2IEBAIHN0YXRpYyBpbnQgcGh5X21lc29uX2cxMmFfdXNiMl9pbml0KHN0cnVjdCBwaHkgKnBo
eSkKPiA+ICAgICAgICAgaW50IHJldDsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHZhbHVlOwo+
ID4KPiA+IC0gICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldChwcml2LT5yZXNldCk7Cj4g
PiArICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShwcml2LT5jbGspOwo+ID4gICAgICAg
ICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPgo+ID4gKyAgICAg
ICByZXQgPSByZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJlc2V0KTsKPiA+ICsgICAgICAgaWYg
KHJldCkgewo+ID4gKyAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5j
bGspOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgIH0KPiA+ICsK
PiBUaGlzIHBhcnQgbG9va3MgZ29vZC4gWW91IGFza2VkIHdoeSBJIHN1Z2dlc3RlZCB0aGlzIGFw
cHJvYWNoIGluc3RlYWQKPiBvZiBlbmFibGluZyB0aGUgY2xvY2sgYXQgcHJvYmUgdGltZSBhbmQg
b25seSBub3cgSSBoYXZlIHRpbWUgdG8gcmVwbHkKPiB0byBpdC4KPiBDb25zaWRlciB0aGUgZm9s
bG93aW5nIHNjZW5hcmlvOgo+IC0gbW9kcHJvYmUgcGh5LW1lc29uLWcxMmEtdXNiMgo+IC0gbW9k
cHJvYmUgZHdjMy1tZXNvbi1nMTJhICh0aGlzIHdpbGwgY2FsbCBwaHlfaW5pdCkKPiAtIHJtbW9k
IGR3YzMtbWVzb24tZzEyYSAodGhpcyB3aWxsIGNhbGwgcGh5X2V4aXQpCj4gCj4gSWYgdGhlIGNs
b2NrIHdhcyBlbmFibGVkIGF0IHByb2JlIHRpbWUgdGhlbiBpdCB3b3VsZCBvbmx5IGJlIGRpc2Fi
bGVkCj4gd2hlbiB1c2luZyBybW1vZCBwaHktbWVzb24tZzEyYS11c2IyLgo+IEJ5IG1hbnVhbGx5
IGNhbGxpbmcgY2xrX3ByZXBhcmVfZW5hYmxlL2Nsa19kaXNhYmxlX3VucHJlcGFyZSB3ZSBlbnN1
cmUKPiB0aGF0IHRoZSBjbG9jayBnZXRzIGRpc2FibGVkIHdoZW4gd2UgZG9uJ3QgbmVlZCB0aGUg
UEhZIGFueW1vcmUuCj4gV2hldGhlciB0aGlzIG1ha2VzIGFueSBkaWZmZXJlbmNlIGluIHRlcm1z
IG9mIHBvd2VyIGRyYXc6IEkgY2FuJ3Qgc2F5Lgo+IAoKSXQgbWFrZXMgc2Vuc2UuIEkgZnVsbHkg
YWdyZWUgd2l0aCB5b3VyIGFwcHJvYWNoLCB3aGljaCBsb29rcyBiZXR0ZXIKY29tcGFyZWQgdG8g
dXNpbmcgdGhlIGF1dG9tYXRpYyBkZXZtX2NsayBBUEkuCgo+ID4gICAgICAgICB1ZGVsYXkoUkVT
RVRfQ09NUExFVEVfVElNRSk7Cj4gPgo+ID4gICAgICAgICAvKiB1c2IyX290Z19hY2FfZW4gPT0g
MCAqLwo+ID4gQEAgLTI3Nyw4ICsyODMsMTEgQEAgc3RhdGljIGludCBwaHlfbWVzb25fZzEyYV91
c2IyX2luaXQoc3RydWN0IHBoeSAqcGh5KQo+ID4gIHN0YXRpYyBpbnQgcGh5X21lc29uX2cxMmFf
dXNiMl9leGl0KHN0cnVjdCBwaHkgKnBoeSkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBwaHlf
bWVzb25fZzEyYV91c2IyX3ByaXYgKnByaXYgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsKPiA+ICsg
ICAgICAgaW50IHJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cmVzZXQpOwo+ID4gKwo+
ID4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xrKTsKPiA+Cj4gPiAtICAg
ICAgIHJldHVybiByZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJlc2V0KTsKPiA+ICsgICAgICAg
cmV0dXJuIHJldDsKPiBJIHRoaW5rIHRoaXMgY2FuIGNhdXNlIGlzc3VlcyBpbiBjYXNlIHdoZW4g
cmVzZXRfY29udHJvbF9yZXNldCByZXR1cm5zCj4gYW4gZXJyb3I6IElmIEkgdW5kZXJzdGFuZCB0
aGUgY29kZSBpbiBwaHktY29yZS5jIGNvcnJlY3RseSBpdCB3aWxsCj4gb25seSBkZWNyZWFzZSB0
aGUgaW5pdCByZWYtY291bnQgaWYgZXhpdCByZXR1cm5zIDAuCj4gV2hlbmV2ZXIgcGh5X2V4aXQg
aXMgY2FsbGVkIGZvciB0aGUgc2Vjb25kIHRpbWUKPiBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB3
aWxsIGJlIGNhbGxlZCB3aXRoIGEgY2xvY2sgcmVmLWNvdW50IG9mIDAsIHNvCj4gaXQnbGwgbGlr
ZWx5IHByaW50IHNvbWUgd2FybmluZy4KPiAKPiBNeSBzdWdnZXN0aW9uIGlzIHRvIHJldHVybiBl
YXJseSBpZiByZXNldF9jb250cm9sX3Jlc2V0KCkgZmFpbHMgYW5kCj4gbm90IGNhbGwgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKCkgaW4gdGhhdCBjYXNlLgo+IFdoYXQgZG8geW91IHRoaW5rPwoKQWZ0
ZXIgdGFraW5nIGEgY2xvc2VyIGxvb2sgYXQgdGhlIHBoeV9leGl0IGNvcmUgY29kZSwgaXQgYXBw
ZWFycyB0aGF0CnlvdXIgaWRlYSBpcyBzcG90IG9uLiBFeGl0aW5nIGltbWVkaWF0ZWx5IHdoZW4g
cmVzZXQgZmFpbHMgc2VlbXMgbGlrZQp0aGUgYmV0dGVyIGNob2ljZS4KSSB3aWxsIHdvcmsgb24g
YSBuZXcgdmVyc2lvbiBvZiB0aGUgY29kZSBhY2NvcmRpbmdseS4KCi0tIApUaGFuayB5b3UsCkRt
aXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
