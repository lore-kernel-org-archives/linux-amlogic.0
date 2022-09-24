Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C10C32771
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Sep 2022 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdpYhVPBR1eiVoZupeTSSjpYEr3XJcHQbU8rnugBr7A=; b=VlTvDQeC+l4fxk
	micvjZ0SpUILdxDsyZbFXgPpwC6jV/bFtXMC7iwNq+NdNuNwdOPiUfNIiytTq0EPqReoZhY39mhzx
	UwioJxOqFTq+VAJDC5C0rhZRp3YFm9R6dOKcSxyeE4MMURiLM6acany4L42ReCeMJOoCf9OLdRI9z
	b03mNEochr3c1Vfz8lu59XcBx2RYMRY3IBMyG3ipKWwrseVd8eU1H7q236iDsJJfLZ0UqnyVsbW3P
	E1KE1YoNgi8MPvBXBAiYg9tTftOE2VEOyKedFfu0CLG3AYivHF+VuF0pZcKFBzgkCtYMp8ecC/gOD
	KXC29a/9LDnEBmDH2JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc70x-007aYY-S6; Sat, 24 Sep 2022 15:24:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc70u-007aWY-Bd; Sat, 24 Sep 2022 15:24:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C58FBB8049B;
	Sat, 24 Sep 2022 15:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E98AC433D6;
	Sat, 24 Sep 2022 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664033057;
	bh=1gU88OznqaSWekwuxOljVASWVDCEECwP7hlnsm3KYxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hnm6vfhU/N7dfe3NIpZ49rKxs3MqJXnXw+iVVBWr+yP9VAY63FN9TNbqoyidgU/Va
	 PKUdViywZtBMeUUusa01YT7ZMNh43kdgSi501FFfj9YaQT5HwA7QijzoKq+kwArvmn
	 qAvdApyg365QYCRSOzXrNySVOcXXkJALyoKdV+sv1agMGJJ1XjXGj0Lech990NOX8y
	 QRAbS0tsI2zQHxOf1IZBjGVhVCZwXVSopWtf3ODV6XeRNp6BqWe67unkgdgGG136WO
	 TFlfaiUONuNrgxiimU2oF7CIkSmT5bodwGaPLv+EGMDZPUt7PNIBPk2RCEXMUzetr4
	 9BEFxaHppt1DA==
Date: Sat, 24 Sep 2022 16:24:19 +0100
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
Subject: Re: [PATCH 03/15] iio: adc: axp288_adc: do not use internal iio_dev
 lock
Message-ID: <20220924162419.341bbe85@jic23-huawei>
In-Reply-To: <20220920112821.975359-4-nuno.sa@analog.com>
References: <20220920112821.975359-1-nuno.sa@analog.com>
	<20220920112821.975359-4-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_082420_708945_35170DE0 
X-CRM114-Status: GOOD (  18.79  )
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

T24gVHVlLCAyMCBTZXAgMjAyMiAxMzoyODowOSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhlIGlpb19kZXZpY2UgbG9jayBpcyBvbmx5IG1lYW50IGZvciBp
bnRlcm5hbCB1c2UuIEhlbmNlIGRlZmluZSBhCj4gZGV2aWNlIGxvY2FsIGxvY2sgdG8gcHJvdGVj
dCBhZ2FpbnN0IGNvbmN1cnJlbnQgYWNjZXNzZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTnVubyBT
w6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KTG9va3MgZ29vZC4gTm90IHN1cmUgaG93IHdlIG1pc3Nl
ZCBjbGVhbmluZyB0aGlzIG9uZSB1cCBlYXJsaWVyCmdpdmVuIGhvdyBzaW1wbGUgaXQgaXMhICBB
bnlob3csIGdpdmVuIEFuZHkncyBmZWVkYmFjayBJJ2xsIHdhaXQgZm9yIHYyCnRvIHBpY2sgdGhp
cyB1cC4KCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMgfCA4ICsrKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMgYi9kcml2ZXJzL2lpby9h
ZGMvYXhwMjg4X2FkYy5jCj4gaW5kZXggNTgwMzYxYmQ5ODQ5Li4zYmJiOTYxNTY3MzkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL2F4cDI4OF9hZGMuYwo+ICsrKyBiL2RyaXZlcnMvaWlv
L2FkYy9heHAyODhfYWRjLmMKPiBAQCAtOSw2ICs5LDcgQEAKPiAgCj4gICNpbmNsdWRlIDxsaW51
eC9kbWkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
bXV0ZXguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiBAQCAtNTAsNiArNTEsOCBA
QCBlbnVtIGF4cDI4OF9hZGNfaWQgewo+ICBzdHJ1Y3QgYXhwMjg4X2FkY19pbmZvIHsKPiAgCWlu
dCBpcnE7Cj4gIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gKwkvKiBsb2NrIHRvIHByb3RlY3Qg
YWdhaW5zdCBtdWx0aXBsZSBhY2Nlc3MgdG8gdGhlIGRldmljZSAqLwo+ICsJc3RydWN0IG11dGV4
IGxvY2s7Cj4gIAlib29sIHRzX2VuYWJsZWQ7Cj4gIH07Cj4gIAo+IEBAIC0xNjEsNyArMTY0LDcg
QEAgc3RhdGljIGludCBheHAyODhfYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYsCj4gIAlpbnQgcmV0Owo+ICAJc3RydWN0IGF4cDI4OF9hZGNfaW5mbyAqaW5mbyA9IGlpb19w
cml2KGluZGlvX2Rldik7Cj4gIAo+IC0JbXV0ZXhfbG9jaygmaW5kaW9fZGV2LT5tbG9jayk7Cj4g
KwltdXRleF9sb2NrKCZpbmZvLT5sb2NrKTsKPiAgCXN3aXRjaCAobWFzaykgewo+ICAJY2FzZSBJ
SU9fQ0hBTl9JTkZPX1JBVzoKPiAgCQlpZiAoYXhwMjg4X2FkY19zZXRfdHMoaW5mbywgQVhQMjg4
X0FEQ19UU19DVVJSRU5UX09OX09OREVNQU5ELAo+IEBAIC0xNzgsNyArMTgxLDcgQEAgc3RhdGlj
IGludCBheHAyODhfYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gIAlk
ZWZhdWx0Ogo+ICAJCXJldCA9IC1FSU5WQUw7Cj4gIAl9Cj4gLQltdXRleF91bmxvY2soJmluZGlv
X2Rldi0+bWxvY2spOwo+ICsJbXV0ZXhfdW5sb2NrKCZpbmZvLT5sb2NrKTsKPiAgCj4gIAlyZXR1
cm4gcmV0Owo+ICB9Cj4gQEAgLTI2NCw2ICsyNjcsNyBAQCBzdGF0aWMgaW50IGF4cDI4OF9hZGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gLUVOT01FTTsK
PiAgCj4gIAlpbmZvID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPiArCW11dGV4X2luaXQoJmluZm8t
PmxvY2spOwo+ICAJaW5mby0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAgCWlm
IChpbmZvLT5pcnEgPCAwKQo+ICAJCXJldHVybiBpbmZvLT5pcnE7CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
