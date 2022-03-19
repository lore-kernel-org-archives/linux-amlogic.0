Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11CCC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Mar 2022 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPjisP/Z3wouijKrkKigKfwAdvNtC1YAVeMBggbwXns=; b=ciesLENm0Vsfej
	HfAxveDkN1GBYXXuC6NEEqA94gvuXyMxqEqk4lZ9HfsPnaGWinI+LYsNSM9ZFRCF4QsklyxqyLdpn
	pPwac59p9xev/HSz5A6AkMAvu7ZyWo6xSXrOfR/AcRt8YJMJvr3GwFb7efrleyZKPHNiTQPhdUwFk
	4MlSowKaK/ssYwyaTiYIL2jp5ot1qVMlh+cgHXXomUaY6jsAjQkk+NXTAL7+9iF8qtjXvOWtrjaKm
	zrJrAgXinYNZu6r3c58QRkCwdlUymoY507hB81NSJUeVBYJWJam4w6w3hjBHdX2CUE95vTYhSyj35
	+xwwoYwfyVP1VIyinhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVdij-004BGO-4m; Sat, 19 Mar 2022 18:22:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVdig-004BFQ-13; Sat, 19 Mar 2022 18:22:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F40BF60B0A;
 Sat, 19 Mar 2022 18:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32FEC340EC;
 Sat, 19 Mar 2022 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647714148;
 bh=hhu+iiM+PEsCTNMjvrEDz1ucmDg+Fr+55HCY0c8/UsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NXtiYgj8z1V7NwGkSTBqzfcsA2AcF0FUaqWmKBlbJdkZlY+5X/Y+POt10MISO2kS/
 +1wBVMn6in+UaYxrsB+ld5KedeYkHNIj02KA2XruXSe2eHDPJ8URwB8AcSYSv8ps+Z
 Ifuohar81D4hwwl9tgfqOVucJpMb+IwOwfp/yuzmcpASxtg1A0RlMGefuRRTYs6DZ8
 Xkap8/jSbiLBifie7GY6O1b3vhEHaGasq6nPAxrFZ7DCPkDSnV0SrTrqs0Z0rxACg7
 vwu2sYtiP3sQddRlnOw3C8WIjDKnbeTbeq2k5N++3G6fabIoEi1fRpinli5QNuYYzo
 nvfjeQZ5q5TAQ==
Date: Sat, 19 Mar 2022 18:29:36 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=        
 <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Neil Armstrong
 <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Paul Cercueil <paul@crapouillou.net>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Thierry Reding
 <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, NXP
 Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Tomislav Denis <tomislav.denis@avl.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?QW5kcsOp?= Gustavo Nakagomi Lopez <andregnl@usp.br>, Cai Huoqing
 <caihuoqing@baidu.com>, linux-iio@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org, Keguang Zhang
 <keguang.zhang@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, Amireddy Mallikarjuna reddy        
 <mallikarjunax.reddy@linux.intel.com>, dmaengine@vger.kernel.org, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Alexandru Ardelean
 <aardelean@deviqon.com>
Subject: Re: [PATCH v8 02/16] clk: Provide new devm_clk helpers for prepared
 and enabled clocks
Message-ID: <20220319182936.06d75742@jic23-huawei>
In-Reply-To: <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_112230_178200_5FF7B4A8 
X-CRM114-Status: GOOD (  32.23  )
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

T24gTW9uLCAxNCBNYXIgMjAyMiAxNToxNjoyOSArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyAgICAg
ICAgIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKPiBXaGVuIGEgZHJp
dmVyIGtlZXBzIGEgY2xvY2sgcHJlcGFyZWQgKG9yIGVuYWJsZWQpIGR1cmluZyB0aGUgd2hvbGUK
PiBsaWZldGltZSBvZiB0aGUgZHJpdmVyLCB0aGVzZSBoZWxwZXJzIGFsbG93IHRvIHNpbXBsaWZ5
IHRoZSBkcml2ZXJzLgo+IAo+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhh
bi5DYW1lcm9uQGh1YXdlaS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8
YWFyZGVsZWFuQGRldmlxb24uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpPbmUgdHJpdmlhbCB0aGluZyBiZWxv
dy4KCj4gLS0tCj4gIGRyaXZlcnMvY2xrL2Nsay1kZXZyZXMuYyB8IDMxICsrKysrKysrKysrKysr
Cj4gIGluY2x1ZGUvbGludXgvY2xrLmggICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMg
Yi9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMKPiBpbmRleCBmYjc3NjE4ODhiMzAuLjQ3MDdmZTcx
OGYwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMKPiArKysgYi9kcml2
ZXJzL2Nsay9jbGstZGV2cmVzLmMKPiBAQCAtNjcsMTIgKzY3LDQzIEBAIHN0cnVjdCBjbGsgKmRl
dm1fY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+ICB9Cj4gIEVY
UE9SVF9TWU1CT0woZGV2bV9jbGtfZ2V0KTsKPiAgCj4gK3N0cnVjdCBjbGsgKmRldm1fY2xrX2dl
dF9wcmVwYXJlZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+ICt7Cj4gKwly
ZXR1cm4gX19kZXZtX2Nsa19nZXQoZGV2LCBpZCwgY2xrX2dldCwgY2xrX3ByZXBhcmUsIGNsa191
bnByZXBhcmUpOwoKTml0cGljayBidXQgdGhpcyBzcGFjaW5nIGJlZm9yZSB9IGluIGZ1bmN0aW9u
cyBpcyByYXRoZXIgdW51c3VhbCBhbmQgbm90CmluIGtlZXBpbmcgd2l0aCB0aGUgZXhpc3Rpbmcg
Y29kZSBpbiB0aGlzIGZpbGUuCgo+ICsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRldm1fY2xrX2dl
dF9wcmVwYXJlZCk7Cj4gKwo+ICtzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfZW5hYmxlZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+ICt7Cj4gKwlyZXR1cm4gX19kZXZtX2Ns
a19nZXQoZGV2LCBpZCwgY2xrX2dldCwKPiArCQkJICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlLCBj
bGtfZGlzYWJsZV91bnByZXBhcmUpOwo+ICsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRldm1fY2xr
X2dldF9lbmFibGVkKTsKPiArCj4gIHN0cnVjdCBjbGsgKmRldm1fY2xrX2dldF9vcHRpb25hbChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+ICB7Cj4gIAlyZXR1cm4gX19kZXZt
X2Nsa19nZXQoZGV2LCBpZCwgY2xrX2dldF9vcHRpb25hbCwgTlVMTCwgTlVMTCk7Cj4gIH0KPiAg
RVhQT1JUX1NZTUJPTChkZXZtX2Nsa19nZXRfb3B0aW9uYWwpOwo+ICAKPiArc3RydWN0IGNsayAq
ZGV2bV9jbGtfZ2V0X29wdGlvbmFsX3ByZXBhcmVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qg
Y2hhciAqaWQpCj4gK3sKPiArCXJldHVybiBfX2Rldm1fY2xrX2dldChkZXYsIGlkLCBjbGtfZ2V0
X29wdGlvbmFsLAo+ICsJCQkgICAgICBjbGtfcHJlcGFyZSwgY2xrX3VucHJlcGFyZSk7Cj4gKwo+
ICt9Cj4gK0VYUE9SVF9TWU1CT0woZGV2bV9jbGtfZ2V0X29wdGlvbmFsX3ByZXBhcmVkKTsKPiAr
Cj4gK3N0cnVjdCBjbGsgKmRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKHN0cnVjdCBkZXZp
Y2UgKmRldiwgY29uc3QgY2hhciAqaWQpCj4gK3sKPiArCXJldHVybiBfX2Rldm1fY2xrX2dldChk
ZXYsIGlkLCBjbGtfZ2V0X29wdGlvbmFsLAo+ICsJCQkgICAgICBjbGtfcHJlcGFyZV9lbmFibGUs
IGNsa19kaXNhYmxlX3VucHJlcGFyZSk7Cj4gKwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZGV2bV9j
bGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQpOwo+ICsKPiAgc3RydWN0IGNsa19idWxrX2RldnJlcyB7
Cj4gIAlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsKPiAgCWludCBudW1fY2xrczsKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbGsuaCBiL2luY2x1ZGUvbGludXgvY2xrLmgKPiBpbmRl
eCAyNjZlOGRlM2NiNTEuLmIwMTFkYmJhNzEwOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2Nsay5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9jbGsuaAo+IEBAIC00NDksNyArNDQ5LDcgQEAg
aW50IF9fbXVzdF9jaGVjayBkZXZtX2Nsa19idWxrX2dldF9hbGwoc3RydWN0IGRldmljZSAqZGV2
LAo+ICAgKiB0aGUgY2xvY2sgcHJvZHVjZXIuICAoSU9XLCBAaWQgbWF5IGJlIGlkZW50aWNhbCBz
dHJpbmdzLCBidXQKPiAgICogY2xrX2dldCBtYXkgcmV0dXJuIGRpZmZlcmVudCBjbG9jayBwcm9k
dWNlcnMgZGVwZW5kaW5nIG9uIEBkZXYuKQo+ICAgKgo+IC0gKiBEcml2ZXJzIG11c3QgYXNzdW1l
IHRoYXQgdGhlIGNsb2NrIHNvdXJjZSBpcyBub3QgZW5hYmxlZC4KPiArICogRHJpdmVycyBtdXN0
IGFzc3VtZSB0aGF0IHRoZSBjbG9jayBzb3VyY2UgaXMgbmVpdGhlciBwcmVwYXJlZCBub3IgZW5h
YmxlZC4KPiAgICoKPiAgICogZGV2bV9jbGtfZ2V0IHNob3VsZCBub3QgYmUgY2FsbGVkIGZyb20g
d2l0aGluIGludGVycnVwdCBjb250ZXh0Lgo+ICAgKgo+IEBAIC00NTgsNiArNDU4LDQ3IEBAIGlu
dCBfX211c3RfY2hlY2sgZGV2bV9jbGtfYnVsa19nZXRfYWxsKHN0cnVjdCBkZXZpY2UgKmRldiwK
PiAgICovCj4gIHN0cnVjdCBjbGsgKmRldm1fY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IGNoYXIgKmlkKTsKPiAgCj4gKy8qKgo+ICsgKiBkZXZtX2Nsa19nZXRfcHJlcGFyZWQgLSBk
ZXZtX2Nsa19nZXQoKSArIGNsa19wcmVwYXJlKCkKPiArICogQGRldjogZGV2aWNlIGZvciBjbG9j
ayAiY29uc3VtZXIiCj4gKyAqIEBpZDogY2xvY2sgY29uc3VtZXIgSUQKPiArICoKPiArICogUmV0
dXJucyBhIHN0cnVjdCBjbGsgY29ycmVzcG9uZGluZyB0byB0aGUgY2xvY2sgcHJvZHVjZXIsIG9y
Cj4gKyAqIHZhbGlkIElTX0VSUigpIGNvbmRpdGlvbiBjb250YWluaW5nIGVycm5vLiAgVGhlIGlt
cGxlbWVudGF0aW9uCj4gKyAqIHVzZXMgQGRldiBhbmQgQGlkIHRvIGRldGVybWluZSB0aGUgY2xv
Y2sgY29uc3VtZXIsIGFuZCB0aGVyZWJ5Cj4gKyAqIHRoZSBjbG9jayBwcm9kdWNlci4gIChJT1cs
IEBpZCBtYXkgYmUgaWRlbnRpY2FsIHN0cmluZ3MsIGJ1dAo+ICsgKiBjbGtfZ2V0IG1heSByZXR1
cm4gZGlmZmVyZW50IGNsb2NrIHByb2R1Y2VycyBkZXBlbmRpbmcgb24gQGRldi4pCj4gKyAqCj4g
KyAqIFRoZSByZXR1cm5lZCBjbGsgKGlmIHZhbGlkKSBpcyBwcmVwYXJlZC4gRHJpdmVycyBtdXN0
IGhvd2V2ZXIgYXNzdW1lIHRoYXQgdGhlCj4gKyAqIGNsb2NrIGlzIG5vdCBlbmFibGVkLgo+ICsg
Kgo+ICsgKiBkZXZtX2Nsa19nZXRfcHJlcGFyZWQgc2hvdWxkIG5vdCBiZSBjYWxsZWQgZnJvbSB3
aXRoaW4gaW50ZXJydXB0IGNvbnRleHQuCj4gKyAqCj4gKyAqIFRoZSBjbG9jayB3aWxsIGF1dG9t
YXRpY2FsbHkgYmUgdW5wcmVwYXJlZCBhbmQgZnJlZWQgd2hlbiB0aGUKPiArICogZGV2aWNlIGlz
IHVuYm91bmQgZnJvbSB0aGUgYnVzLgo+ICsgKi8KPiArc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0
X3ByZXBhcmVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpOwo+ICsKPiArLyoq
Cj4gKyAqIGRldm1fY2xrX2dldF9lbmFibGVkIC0gZGV2bV9jbGtfZ2V0KCkgKyBjbGtfcHJlcGFy
ZV9lbmFibGUoKQo+ICsgKiBAZGV2OiBkZXZpY2UgZm9yIGNsb2NrICJjb25zdW1lciIKPiArICog
QGlkOiBjbG9jayBjb25zdW1lciBJRAo+ICsgKgo+ICsgKiBSZXR1cm5zIGEgc3RydWN0IGNsayBj
b3JyZXNwb25kaW5nIHRvIHRoZSBjbG9jayBwcm9kdWNlciwgb3IgdmFsaWQgSVNfRVJSKCkKPiAr
ICogY29uZGl0aW9uIGNvbnRhaW5pbmcgZXJybm8uICBUaGUgaW1wbGVtZW50YXRpb24gdXNlcyBA
ZGV2IGFuZCBAaWQgdG8KPiArICogZGV0ZXJtaW5lIHRoZSBjbG9jayBjb25zdW1lciwgYW5kIHRo
ZXJlYnkgdGhlIGNsb2NrIHByb2R1Y2VyLiAgKElPVywgQGlkIG1heQo+ICsgKiBiZSBpZGVudGlj
YWwgc3RyaW5ncywgYnV0IGNsa19nZXQgbWF5IHJldHVybiBkaWZmZXJlbnQgY2xvY2sgcHJvZHVj
ZXJzCj4gKyAqIGRlcGVuZGluZyBvbiBAZGV2LikKPiArICoKPiArICogVGhlIHJldHVybmVkIGNs
ayAoaWYgdmFsaWQpIGlzIHByZXBhcmVkIGFuZCBlbmFibGVkLgo+ICsgKgo+ICsgKiBkZXZtX2Ns
a19nZXRfcHJlcGFyZWQgc2hvdWxkIG5vdCBiZSBjYWxsZWQgZnJvbSB3aXRoaW4gaW50ZXJydXB0
IGNvbnRleHQuCj4gKyAqCj4gKyAqIFRoZSBjbG9jayB3aWxsIGF1dG9tYXRpY2FsbHkgYmUgZGlz
YWJsZWQsIHVucHJlcGFyZWQgYW5kIGZyZWVkIHdoZW4gdGhlCj4gKyAqIGRldmljZSBpcyB1bmJv
dW5kIGZyb20gdGhlIGJ1cy4KPiArICovCj4gK3N0cnVjdCBjbGsgKmRldm1fY2xrX2dldF9lbmFi
bGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpOwo+ICsKPiAgLyoqCj4gICAq
IGRldm1fY2xrX2dldF9vcHRpb25hbCAtIGxvb2t1cCBhbmQgb2J0YWluIGEgbWFuYWdlZCByZWZl
cmVuY2UgdG8gYW4gb3B0aW9uYWwKPiAgICoJCQkgICBjbG9jayBwcm9kdWNlci4KPiBAQCAtNDY5
LDYgKzUxMCwyOSBAQCBzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXQoc3RydWN0IGRldmljZSAqZGV2
LCBjb25zdCBjaGFyICppZCk7Cj4gICAqLwo+ICBzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfb3B0
aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCk7Cj4gIAo+ICsvKioKPiAr
ICogZGV2bV9jbGtfZ2V0X29wdGlvbmFsX3ByZXBhcmVkIC0gZGV2bV9jbGtfZ2V0X29wdGlvbmFs
KCkgKyBjbGtfcHJlcGFyZSgpCj4gKyAqIEBkZXY6IGRldmljZSBmb3IgY2xvY2sgImNvbnN1bWVy
Igo+ICsgKiBAaWQ6IGNsb2NrIGNvbnN1bWVyIElECj4gKyAqCj4gKyAqIEJlaGF2ZXMgdGhlIHNh
bWUgYXMgZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKCkgZXhjZXB0IHdoZXJlIHRoZXJlIGlzIG5vIGNs
b2NrCj4gKyAqIHByb2R1Y2VyLiAgSW4gdGhpcyBjYXNlLCBpbnN0ZWFkIG9mIHJldHVybmluZyAt
RU5PRU5ULCB0aGUgZnVuY3Rpb24gcmV0dXJucwo+ICsgKiBOVUxMLgo+ICsgKi8KPiArc3RydWN0
IGNsayAqZGV2bV9jbGtfZ2V0X29wdGlvbmFsX3ByZXBhcmVkKHN0cnVjdCBkZXZpY2UgKmRldiwg
Y29uc3QgY2hhciAqaWQpOwo+ICsKPiArLyoqCj4gKyAqIGRldm1fY2xrX2dldF9vcHRpb25hbF9l
bmFibGVkIC0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkgKwo+ICsgKiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNsa19wcmVwYXJlX2VuYWJsZSgpCj4gKyAqIEBkZXY6IGRldmljZSBm
b3IgY2xvY2sgImNvbnN1bWVyIgo+ICsgKiBAaWQ6IGNsb2NrIGNvbnN1bWVyIElECj4gKyAqCj4g
KyAqIEJlaGF2ZXMgdGhlIHNhbWUgYXMgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBleGNlcHQgd2hl
cmUgdGhlcmUgaXMgbm8gY2xvY2sKPiArICogcHJvZHVjZXIuICBJbiB0aGlzIGNhc2UsIGluc3Rl
YWQgb2YgcmV0dXJuaW5nIC1FTk9FTlQsIHRoZSBmdW5jdGlvbiByZXR1cm5zCj4gKyAqIE5VTEwu
Cj4gKyAqLwo+ICtzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKTsKPiArCj4gIC8qKgo+ICAgKiBkZXZtX2dl
dF9jbGtfZnJvbV9jaGlsZCAtIGxvb2t1cCBhbmQgb2J0YWluIGEgbWFuYWdlZCByZWZlcmVuY2Ug
dG8gYQo+ICAgKgkJCSAgICAgY2xvY2sgcHJvZHVjZXIgZnJvbSBjaGlsZCBub2RlLgo+IEBAIC04
MTMsMTIgKzg3NywzNiBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKmRldm1fY2xrX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+ICAJcmV0dXJuIE5VTEw7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKHN0
cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJCQkJY29uc3QgY2hhciAqaWQpCj4gK3sKPiArCXJldHVy
biBOVUxMOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKmRldm1fY2xrX2dl
dF9lbmFibGVkKHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJCQkgICAgICAgY29uc3QgY2hhciAq
aWQpCj4gK3sKPiArCXJldHVybiBOVUxMOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHN0cnVj
dCBjbGsgKmRldm1fY2xrX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJCQkJ
CWNvbnN0IGNoYXIgKmlkKQo+ICB7Cj4gIAlyZXR1cm4gTlVMTDsKPiAgfQo+ICAKPiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfb3B0aW9uYWxfcHJlcGFyZWQoc3RydWN0
IGRldmljZSAqZGV2LAo+ICsJCQkJCQkJIGNvbnN0IGNoYXIgKmlkKQo+ICt7Cj4gKwlyZXR1cm4g
TlVMTDsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRf
b3B0aW9uYWxfZW5hYmxlZChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCQkJCQljb25zdCBjaGFy
ICppZCkKPiArewo+ICsJcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gIHN0YXRpYyBpbmxpbmUgaW50
IF9fbXVzdF9jaGVjayBkZXZtX2Nsa19idWxrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBu
dW1fY2xrcywKPiAgCQkJCQkJIHN0cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzKQo+ICB7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
