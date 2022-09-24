Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F42CC32771
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Sep 2022 15:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwQvdSre6muiK1NmBBfD8xF37kUT1jiJf3myv9tAZcY=; b=oCUOj/v6tybiks
	W0Q54HS05SnZkZDhxf+pFpdz9srk/QgGgd3v07CxY+FFCP66ac7SAOqqi298x2s/9C6iPSXFxxJRO
	0qh55wCApK/0xJBq/MlwKZQcWhpfl1TjwpR0h7fF5qM68U/emqSUc4cIW0tlLf1sVqeDiI+3QsF1H
	PVPwY/wxlUyGvC+O4GbC1eouolX7TDyxdK7dR5N+eRFWt2x2eM4SC7LDNpwZOv0FlGjQ7M/xAY9dM
	F8avINN1M0gmgmAzhOXwiYTnJwHZmpxBRCPJfARznCHw9xV2jG4XR/c9vCL0mfGtXOwmL/5ytH2Fd
	otp15iPmDYcTgErOzJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc73c-007bfG-OV; Sat, 24 Sep 2022 15:27:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc73a-007bdF-4k; Sat, 24 Sep 2022 15:27:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAEE060BC1;
	Sat, 24 Sep 2022 15:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18007C433C1;
	Sat, 24 Sep 2022 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664033225;
	bh=K56eGXLGJNUqDJ6yNU+SPkp3jUptZSzn9pC/ayv3KBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d2zpm7xIppaORIFkSCk1Pm5PQOrv4LjYmobjcCpjwcoYxMfHNyBRrbCTFsZ28JQim
	 zdkBrIbQLZQpNOm1JuY0QQNLAiA5alIJnJBaQA/JfUjU41ajbawQTvnJZGtRsnN7ml
	 RlhOo5HPRYUmXhk1zlR/hINDeolxuAXepjmnXlnejbcL6xoftcLn7DoZOHl2vFnO1k
	 RK+iDdgIY/Zc1wfDVvUcJnww6GQrc94VBfbFeEX/We3uWT4Lv0abm8EEXeYXlDqNsG
	 oJ27KUtF4/jpjntVqYI1KUuyIhdNusvBM8dMmbCj95wPXzad3XoIdQkCLZS35H8+Gu
	 +CIP/Qm5UMWgQ==
Date: Sat, 24 Sep 2022 16:27:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-imx@nxp.com>, <linux-iio@vger.kernel.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Cixi Geng <cixi.geng1@unisoc.com>, Kevin Hilman
 <khilman@baylibre.com>, Vladimir Zapolskiy <vz@mleia.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Alexandru Ardelean
 <aardelean@deviqon.com>, Fabio Estevam <festevam@gmail.com>, Andriy
 Tryshnivskyy <andriy.tryshnivskyy@opensynergy.com>, Haibo Chen
 <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Florian
 Boor <florian.boor@kernelconcepts.de>, Ciprian Regus
 <ciprian.regus@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Andy
 Shevchenko <andy.shevchenko@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jyoti Bhayana <jbhayana@google.com>, Chen-Yu Tsai <wens@csie.org>, Orson
 Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH 05/15] iio: adc: lpc32xx_adc: do not use internal
 iio_dev lock
Message-ID: <20220924162706.2a731356@jic23-huawei>
In-Reply-To: <20220920112821.975359-6-nuno.sa@analog.com>
References: <20220920112821.975359-1-nuno.sa@analog.com>
	<20220920112821.975359-6-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_082706_280830_0207F4D9 
X-CRM114-Status: GOOD (  18.74  )
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

T24gVHVlLCAyMCBTZXAgMjAyMiAxMzoyODoxMSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhlIGlpb19kZXZpY2UgbG9jayBpcyBvbmx5IG1lYW50IGZvciBp
bnRlcm5hbCB1c2UuIEhlbmNlIGRlZmluZSBhCj4gZGV2aWNlIGxvY2FsIGxvY2sgdG8gcHJvdGVj
dCBhZ2FpbnN0IGNvbmN1cnJlbnQgYWNjZXNzZXMuCgpBcyB3aXRoIHByZXZpb3VzIHBhdGNoLCBt
ZW50aW9uIHRoZSBhZGRpdGlvbmFsIGluY2x1ZGUgY2xlYW51cC4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vYWRj
L2xwYzMyeHhfYWRjLmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2Fk
Yy9scGMzMnh4X2FkYy5jIGIvZHJpdmVycy9paW8vYWRjL2xwYzMyeHhfYWRjLmMKPiBpbmRleCBi
NTZjZTE1MjU1Y2YuLjQxMzZjZjUzNmQ1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMv
bHBjMzJ4eF9hZGMuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9scGMzMnh4X2FkYy5jCj4gQEAg
LTE1LDYgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ICsjaW5j
bHVkZSA8bGludXgvbXV0ZXguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gIAo+IEBAIC00OSw2
ICs1MCw4IEBAIHN0cnVjdCBscGMzMnh4X2FkY19zdGF0ZSB7Cj4gIAlzdHJ1Y3QgY2xrICpjbGs7
Cj4gIAlzdHJ1Y3QgY29tcGxldGlvbiBjb21wbGV0aW9uOwo+ICAJc3RydWN0IHJlZ3VsYXRvciAq
dnJlZjsKPiArCS8qIGxvY2sgdG8gcHJvdGVjdCBhZ2FpbnN0IG11bHRpcGxlIGFjY2VzcyB0byB0
aGUgZGV2aWNlICovCj4gKwlzdHJ1Y3QgbXV0ZXggbG9jazsKPiAgCj4gIAl1MzIgdmFsdWU7Cj4g
IH07Cj4gQEAgLTY0LDEwICs2NywxMCBAQCBzdGF0aWMgaW50IGxwYzMyeHhfcmVhZF9yYXcoc3Ry
dWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiAgCj4gIAlzd2l0Y2ggKG1hc2spIHsKPiAgCWNhc2Ug
SUlPX0NIQU5fSU5GT19SQVc6Cj4gLQkJbXV0ZXhfbG9jaygmaW5kaW9fZGV2LT5tbG9jayk7Cj4g
KwkJbXV0ZXhfbG9jaygmc3QtPmxvY2spOwo+ICAJCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShz
dC0+Y2xrKTsKPiAgCQlpZiAocmV0KSB7Cj4gLQkJCW11dGV4X3VubG9jaygmaW5kaW9fZGV2LT5t
bG9jayk7Cj4gKwkJCW11dGV4X3VubG9jaygmc3QtPmxvY2spOwo+ICAJCQlyZXR1cm4gcmV0Owo+
ICAJCX0KPiAgCQkvKiBNZWFzdXJlbWVudCBzZXR1cCAqLwo+IEBAIC04MCw3ICs4Myw3IEBAIHN0
YXRpYyBpbnQgbHBjMzJ4eF9yZWFkX3JhdyhzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+ICAJ
CXdhaXRfZm9yX2NvbXBsZXRpb24oJnN0LT5jb21wbGV0aW9uKTsgLyogc2V0IGJ5IElTUiAqLwo+
ICAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShzdC0+Y2xrKTsKPiAgCQkqdmFsID0gc3QtPnZhbHVl
Owo+IC0JCW11dGV4X3VubG9jaygmaW5kaW9fZGV2LT5tbG9jayk7Cj4gKwkJbXV0ZXhfdW5sb2Nr
KCZzdC0+bG9jayk7Cj4gIAo+ICAJCXJldHVybiBJSU9fVkFMX0lOVDsKPiAgCj4gQEAgLTE1OCw2
ICsxNjEsNyBAQCBzdGF0aWMgaW50IGxwYzMyeHhfYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJc3QgPSBpaW9fcHJpdihp
b2Rldik7Cj4gKwltdXRleF9pbml0KCZzdC0+bG9jayk7Cj4gIAo+ICAJc3QtPmFkY19iYXNlID0g
ZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsCj4gIAkJCQkgICAgcmVzb3VyY2Vf
c2l6ZShyZXMpKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
