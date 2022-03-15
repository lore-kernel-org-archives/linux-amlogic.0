Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A32BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Mar 2022 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mU7FocBY1LwhWk4xJFCq9gR/7ThlB28m62atCMKLhMI=; b=vZ05CGOsyRVP5J
	pg5bZR+m6wrVNRmCT+nX8DUJ6hQoXu7j8AxsmNcoWDk2wUd+/Bt1lLKVjOfYDu6NVRHmAJdO9aVOO
	BHzzWJCiuBNQ//hvBp2Aak1pNRlasa84a3TSZFH9Ro4TungIaSRhtrPsSHdzAVAevBopd2bh/CIGC
	JjccAHw0tTATU46eOb17K02gO+bWJivB/0B0I3E3T5mM4U+hAry3rPmx4OGmKCz511lc0DQivgmhx
	YpYSCorXijNP/0hCiQhWjnGiSDeQxVBuXiHt+L73kQjeP91ozZI/xErK8GvuTcnyzUracEDmwGR7x
	E5OdC0C8eneoiFw4Rz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUGZK-00Ate5-GM; Tue, 15 Mar 2022 23:27:10 +0000
Received: from gateway34.websitewelcome.com ([192.185.148.214])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUGZ9-00Atcf-7l
 for linux-amlogic@lists.infradead.org; Tue, 15 Mar 2022 23:27:01 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 4E6E58420A0
 for <linux-amlogic@lists.infradead.org>;
 Tue, 15 Mar 2022 18:26:45 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id UGYun7BWYRnrrUGYundI1c; Tue, 15 Mar 2022 18:26:45 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMz4dv/MLCPqxMquT9pFk6KUEVB5ed9lWVOqB/G2Qsw=; b=5lgvZgsRcs9SGWnnx6JtY06wdS
 zNXTyuY4WPr1wuvZdRXTiodbvM++DqqAvJyC19CA1efn2LGgFXA5qswXI8+H5ekOniOW4LesN/j9c
 MOLxvpN0OUjSoIQtD2nynya5Z+MpWX7hY0+xSke5stHgb/hj87kik5FoJ+WSanS7i4229VDCICafa
 FpS6GM3T4sp7pPNRFf1ZKKt7C2hqPvlWWwBvComWpmZ8BAlO2Uh4UK6DwxqNpaxM51BUQSCIFiM/u
 ZNCUOiYA+JF/3hjMpkpc9Whgk7qsXtGL4Z09OfHF1aVB6HSuN8siwqS7wVzAwtMpZY6c+Z9LoMT+5
 fWYrEG3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54298)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nUGYs-002Vpc-Bh; Tue, 15 Mar 2022 23:26:42 +0000
Message-ID: <4af362d3-999d-cc3c-50e2-5a91d888f09f@roeck-us.net>
Date: Tue, 15 Mar 2022 16:26:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 03/16] hwmon: Make use of devm_clk_get_enabled()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Heiko Stuebner <heiko@sntech.de>, Tomislav Denis <tomislav.denis@avl.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Cai Huoqing <caihuoqing@baidu.com>, linux-iio@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-4-u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220314141643.22184-4-u.kleine-koenig@pengutronix.de>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nUGYs-002Vpc-Bh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54298
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_162659_405124_CA7EC6D8 
X-CRM114-Status: GOOD (  17.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMy8xNC8yMiAwNzoxNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gU2V2ZXJhbCBkcml2
ZXJzIG1hbnVhbGx5IHJlZ2lzdGVyIGEgZGV2bSBoYW5kbGVyIHRvIGRpc2FibGUgdGhlaXIgY2xr
Lgo+IENvbnZlcnQgdGhlbSB0byBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
CgpMZXQncyBzZWUgaWYgaXQgZ29lcyBhbnl3aGVyZSB0aGlzIHRpbWUuCgpBY2tlZC1ieTogR3Vl
bnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoKPiAtLS0KPiAgIGRyaXZlcnMvaHdtb24v
YXhpLWZhbi1jb250cm9sLmMgfCAxNSArLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvaHdtb24v
bHRjMjk0Ny1jb3JlLmMgICAgfCAxNyArLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9od21v
bi9tcjc1MjAzLmMgICAgICAgICB8IDI2ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL2h3bW9uL3NwYXJ4NS10ZW1wLmMgICAgIHwgMTkgKy0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDczIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL2F4aS1mYW4tY29udHJvbC5jIGIvZHJpdmVycy9o
d21vbi9heGktZmFuLWNvbnRyb2wuYwo+IGluZGV4IGQyMDkyYzE3ZDk5My4uY2U0MDRlZDljNTNl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaHdtb24vYXhpLWZhbi1jb250cm9sLmMKPiArKysgYi9k
cml2ZXJzL2h3bW9uL2F4aS1mYW4tY29udHJvbC5jCj4gQEAgLTM5MywxMSArMzkzLDYgQEAgc3Rh
dGljIGludCBheGlfZmFuX2NvbnRyb2xfaW5pdChzdHJ1Y3QgYXhpX2Zhbl9jb250cm9sX2RhdGEg
KmN0bCwKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkIGF4aV9mYW5f
Y29udHJvbF9jbGtfZGlzYWJsZSh2b2lkICpjbGspCj4gLXsKPiAtCWNsa19kaXNhYmxlX3VucHJl
cGFyZShjbGspOwo+IC19Cj4gLQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBod21vbl9jaGFubmVs
X2luZm8gKmF4aV9mYW5fY29udHJvbF9pbmZvW10gPSB7Cj4gICAJSFdNT05fQ0hBTk5FTF9JTkZP
KHB3bSwgSFdNT05fUFdNX0lOUFVUKSwKPiAgIAlIV01PTl9DSEFOTkVMX0lORk8oZmFuLCBIV01P
Tl9GX0lOUFVUIHwgSFdNT05fRl9GQVVMVCB8IEhXTU9OX0ZfTEFCRUwpLAo+IEBAIC00NzcsMjAg
KzQ3MiwxMiBAQCBzdGF0aWMgaW50IGF4aV9mYW5fY29udHJvbF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAgCWlmIChJU19FUlIoY3RsLT5iYXNlKSkKPiAgIAkJcmV0dXJu
IFBUUl9FUlIoY3RsLT5iYXNlKTsKPiAgIAo+IC0JY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5k
ZXYsIE5VTEwpOwo+ICsJY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVM
TCk7Cj4gICAJaWYgKElTX0VSUihjbGspKSB7Cj4gICAJCWRldl9lcnIoJnBkZXYtPmRldiwgImNs
a19nZXQgZmFpbGVkIHdpdGggJWxkXG4iLCBQVFJfRVJSKGNsaykpOwo+ICAgCQlyZXR1cm4gUFRS
X0VSUihjbGspOwo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNsayk7
Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0ID0gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYsIGF4aV9mYW5fY29udHJvbF9jbGtfZGlzYWJsZSwgY2xr
KTsKPiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gICAJY3RsLT5jbGtfcmF0ZSA9
IGNsa19nZXRfcmF0ZShjbGspOwo+ICAgCWlmICghY3RsLT5jbGtfcmF0ZSkKPiAgIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vbHRjMjk0Ny1jb3JlLmMgYi9k
cml2ZXJzL2h3bW9uL2x0YzI5NDctY29yZS5jCj4gaW5kZXggNTQyMzQ2NmRlNjk3Li42MjZmNWJm
MmM5YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9od21vbi9sdGMyOTQ3LWNvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvaHdtb24vbHRjMjk0Ny1jb3JlLmMKPiBAQCAtOTU2LDEzICs5NTYsNiBAQCBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqbHRjMjk0N19hdHRyc1tdID0gewo+ICAgfTsKPiAgIEFUVFJJ
QlVURV9HUk9VUFMobHRjMjk0Nyk7Cj4gICAKPiAtc3RhdGljIHZvaWQgbHRjMjk0N19jbGtfZGlz
YWJsZSh2b2lkICpkYXRhKQo+IC17Cj4gLQlzdHJ1Y3QgY2xrICpleHRjbGsgPSBkYXRhOwo+IC0K
PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShleHRjbGspOwo+IC19Cj4gLQo+ICAgc3RhdGljIGlu
dCBsdGMyOTQ3X3NldHVwKHN0cnVjdCBsdGMyOTQ3X2RhdGEgKnN0KQo+ICAgewo+ICAgCWludCBy
ZXQ7Cj4gQEAgLTk4OSw3ICs5ODIsNyBAQCBzdGF0aWMgaW50IGx0YzI5NDdfc2V0dXAoc3RydWN0
IGx0YzI5NDdfZGF0YSAqc3QpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiAgIAkvKiBjaGVjayBl
eHRlcm5hbCBjbG9jayBwcmVzZW5jZSAqLwo+IC0JZXh0Y2xrID0gZGV2bV9jbGtfZ2V0X29wdGlv
bmFsKHN0LT5kZXYsIE5VTEwpOwo+ICsJZXh0Y2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2Vu
YWJsZWQoc3QtPmRldiwgTlVMTCk7Cj4gICAJaWYgKElTX0VSUihleHRjbGspKQo+ICAgCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShzdC0+ZGV2LCBQVFJfRVJSKGV4dGNsayksCj4gICAJCQkJICAgICAi
RmFpbGVkIHRvIGdldCBleHRlcm5hbCBjbG9ja1xuIik7Cj4gQEAgLTEwMDcsMTQgKzEwMDAsNiBA
QCBzdGF0aWMgaW50IGx0YzI5NDdfc2V0dXAoc3RydWN0IGx0YzI5NDdfZGF0YSAqc3QpCj4gICAJ
CQlyZXR1cm4gLUVJTlZBTDsKPiAgIAkJfQo+ICAgCj4gLQkJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGV4dGNsayk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCj4gLQkJcmV0
ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHN0LT5kZXYsIGx0YzI5NDdfY2xrX2Rpc2FibGUs
Cj4gLQkJCQkJICAgICAgIGV4dGNsayk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsK
PiAgIAkJLyogYXMgaW4gdGFibGUgMSBvZiB0aGUgZGF0YXNoZWV0ICovCj4gICAJCWlmIChyYXRl
X2h6ID49IExUQzI5NDdfQ0xLX01JTiAmJiByYXRlX2h6IDw9IDEwMDAwMDApCj4gICAJCQlwcmUg
PSAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL21yNzUyMDMuYyBiL2RyaXZlcnMvaHdt
b24vbXI3NTIwMy5jCj4gaW5kZXggMWJhMWUzMTQ1OTY5Li4wYzY5MWYyOTFhNjQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9od21vbi9tcjc1MjAzLmMKPiArKysgYi9kcml2ZXJzL2h3bW9uL21yNzUy
MDMuYwo+IEBAIC00NjEsMjQgKzQ2MSw2IEBAIHN0YXRpYyBpbnQgcHZ0X2dldF9yZWdtYXAoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgY2hhciAqcmVnX25hbWUsCj4gICAJcmV0dXJuIDA7
Cj4gICB9Cj4gICAKPiAtc3RhdGljIHZvaWQgcHZ0X2Nsa19kaXNhYmxlKHZvaWQgKmRhdGEpCj4g
LXsKPiAtCXN0cnVjdCBwdnRfZGV2aWNlICpwdnQgPSBkYXRhOwo+IC0KPiAtCWNsa19kaXNhYmxl
X3VucHJlcGFyZShwdnQtPmNsayk7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgcHZ0X2Nsa19lbmFi
bGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcHZ0X2RldmljZSAqcHZ0KQo+IC17Cj4gLQlp
bnQgcmV0Owo+IC0KPiAtCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShwdnQtPmNsayk7Cj4gLQlp
ZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9v
cl9yZXNldChkZXYsIHB2dF9jbGtfZGlzYWJsZSwgcHZ0KTsKPiAtfQo+IC0KPiAgIHN0YXRpYyB2
b2lkIHB2dF9yZXNldF9jb250cm9sX2Fzc2VydCh2b2lkICpkYXRhKQo+ICAgewo+ICAgCXN0cnVj
dCBwdnRfZGV2aWNlICpwdnQgPSBkYXRhOwo+IEBAIC01MTUsMTYgKzQ5NywxMCBAQCBzdGF0aWMg
aW50IG1yNzUyMDNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlpZiAo
cmV0KQo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQlwdnQtPmNsayA9IGRldm1fY2xrX2dldChk
ZXYsIE5VTEwpOwo+ICsJcHZ0LT5jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsIE5VTEwp
Owo+ICAgCWlmIChJU19FUlIocHZ0LT5jbGspKQo+ICAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIocHZ0LT5jbGspLCAiZmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gICAKPiAt
CXJldCA9IHB2dF9jbGtfZW5hYmxlKGRldiwgcHZ0KTsKPiAtCWlmIChyZXQpIHsKPiAtCQlkZXZf
ZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgY2xvY2tcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4g
LQl9Cj4gLQo+ICAgCXB2dC0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUo
ZGV2LCBOVUxMKTsKPiAgIAlpZiAoSVNfRVJSKHB2dC0+cnN0KSkKPiAgIAkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCBQVFJfRVJSKHB2dC0+cnN0KSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9o
d21vbi9zcGFyeDUtdGVtcC5jIGIvZHJpdmVycy9od21vbi9zcGFyeDUtdGVtcC5jCj4gaW5kZXgg
OThiZTQ4ZTNhMjJhLi4wNGZkODUwNWU1ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9od21vbi9z
cGFyeDUtdGVtcC5jCj4gKysrIGIvZHJpdmVycy9od21vbi9zcGFyeDUtdGVtcC5jCj4gQEAgLTI2
LDEzICsyNiw2IEBAIHN0cnVjdCBzNV9od21vbiB7Cj4gICAJc3RydWN0IGNsayAqY2xrOwo+ICAg
fTsKPiAgIAo+IC1zdGF0aWMgdm9pZCBzNV90ZW1wX2Nsa19kaXNhYmxlKHZvaWQgKmRhdGEpCj4g
LXsKPiAtCXN0cnVjdCBjbGsgKmNsayA9IGRhdGE7Cj4gLQo+IC0JY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGNsayk7Cj4gLX0KPiAtCj4gICBzdGF0aWMgdm9pZCBzNV90ZW1wX2VuYWJsZShzdHJ1Y3Qg
czVfaHdtb24gKmh3bW9uKQo+ICAgewo+ICAgCXUzMiB2YWwgPSByZWFkbChod21vbi0+YmFzZSAr
IFRFTVBfQ0ZHKTsKPiBAQCAtMTEzLDcgKzEwNiw2IEBAIHN0YXRpYyBpbnQgczVfdGVtcF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgewo+ICAgCXN0cnVjdCBkZXZpY2Ug
Kmh3bW9uX2RldjsKPiAgIAlzdHJ1Y3QgczVfaHdtb24gKmh3bW9uOwo+IC0JaW50IHJldDsKPiAg
IAo+ICAgCWh3bW9uID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqaHdtb24pLCBH
RlBfS0VSTkVMKTsKPiAgIAlpZiAoIWh3bW9uKQo+IEBAIC0xMjMsMTkgKzExNSwxMCBAQCBzdGF0
aWMgaW50IHM1X3RlbXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlp
ZiAoSVNfRVJSKGh3bW9uLT5iYXNlKSkKPiAgIAkJcmV0dXJuIFBUUl9FUlIoaHdtb24tPmJhc2Up
Owo+ICAgCj4gLQlod21vbi0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOwo+
ICsJaHdtb24tPmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsIE5VTEwpOwo+
ICAgCWlmIChJU19FUlIoaHdtb24tPmNsaykpCj4gICAJCXJldHVybiBQVFJfRVJSKGh3bW9uLT5j
bGspOwo+ICAgCj4gLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaHdtb24tPmNsayk7Cj4gLQlp
ZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCZwZGV2LT5kZXYsIHM1X3RlbXBfY2xrX2Rpc2FibGUsCj4gLQkJCQkgICAgICAgaHdt
b24tPmNsayk7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+ICAgCXM1X3RlbXBf
ZW5hYmxlKGh3bW9uKTsKPiAgIAo+ICAgCWh3bW9uX2RldiA9IGRldm1faHdtb25fZGV2aWNlX3Jl
Z2lzdGVyX3dpdGhfaW5mbygmcGRldi0+ZGV2LAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
