Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331FC43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCElIHxv2Lkaw+ayh4kaVE6me5LQWOKkwZcPlBBlgOk=; b=hLWm6mHnKNS+nH
	Ywx398Y95AO047ZbmN3/36vFv1UaGcDbvF5One6D6o10DWBqPDl36CIU8dL6//XGdCL1Y5Xi1d+MJ
	8K0k5xtHSSW6pHiY6uPy28I9SYA1YdXCTIbtgEMnDi2zwlKlolhJxbjdf2pYxuQiinAm/5jWU6iha
	rcz77OmQeF8Qj6ExNcT5uuiLpMi3dQgNcep9y1tu7Z6bRacT9YB21G22cIE64XOYOaoSaCz5uY0Jo
	gBvPndCTK+DHj+h5w21eBw5+W1VpqxxeMAMFCj4OAp2+KrzJ1kt6F0NONbmwnJXPGtPdFq/udkUL+
	h8uvJAUOpikVXt7HmNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lkX-008K9q-EO; Thu, 01 Dec 2022 15:45:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lkU-008K7R-V4
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 15:45:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id z20so2852917edc.13
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=YOSKLNbCT/4q5PjmWEt1oRxSc0fAHVkR9aCRojDmy6dX3JIfmuh09oI2+RqgLe5/jd
         rhksY1dFQr1NIf0y+S4W3Srw2WU7sHKiYYle1iNRxPBiBIzFXL82IukHMHMtY9muYje3
         xmUTZGxkap/l3tbGPVsjXSxV7D/2u9/HaWZ6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=PR2bRy3oxIaciIWafTHQOCls0xjSZWETm8ELNhFr75Nzvhx7bvch6hRshMo9STuY0W
         WsjqpQ1KWEPygp1/WiglqOpovgG7U0pLdCcPiKqC3cYt466X2rrpcfo/3q1AUyylgwJV
         VQoqw8JjE6U28a3ufST79MieoIfSFI59pcpJ9Mm356sGWzbHSS8qM5T0UwGJ0iqBDbBW
         ADz5zpYtsKUo2LmggB63z9Pf7Z/O9tN40VDmv5VGQTGA5WtxzzAPX9wnsrUYLPjGQ+1W
         UI9CWDp/wTuIMOdTswg23eUoQv4cHpcUxhkX2f3nm5O5mpYCs+NQVI0zayz4Uy7FEQ/g
         SyGw==
X-Gm-Message-State: ANoB5pldZJ5/WU2MfDb7J5TcgPMnAnnnZv6wUoXXBQXR836Upj14/o4c
	LrjzJMXB9cVtAGifTbZKjLWuBK6TwCUm8xM9
X-Google-Smtp-Source: AA0mqf6CJKtqlZT2cUz1MyRXVIQydAzH0fsSt7nTLeusgJjxqKUnjGiEzg4hAPocSGsr7BMTKGWMhQ==
X-Received: by 2002:a05:6402:143:b0:463:f8aa:d2bf with SMTP id s3-20020a056402014300b00463f8aad2bfmr61054569edu.358.1669909515004;
        Thu, 01 Dec 2022 07:45:15 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906308900b007b2b98e1f2dsm1878863ejv.122.2022.12.01.07.45.14
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 07:45:14 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id bs21so3343167wrb.4
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 07:45:14 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr9556520wrs.405.1669909041754; Thu, 01
 Dec 2022 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Dec 2022 07:37:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, 
	Michal Simek <michal.simek@xilinx.com>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_074519_014052_D2633BC0 
X-CRM114-Status: GOOD (  20.73  )
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

SGksCgpPbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCA3OjIyIEFNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gLmdldF9zdGF0ZSgpIG1p
Z2h0IGZhaWwgaW4gc29tZSBjYXNlcy4gVG8gbWFrZSBpdCBwb3NzaWJsZSB0aGF0IGEgZHJpdmVy
Cj4gc2lnbmFscyBzdWNoIGEgZmFpbHVyZSBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiAuZ2V0X3N0
YXRlKCkgdG8gcmV0dXJuIGFuCj4gZXJyb3IgY29kZS4KPgo+IFRoaXMgcGF0Y2ggd2FzIGNyZWF0
ZWQgdXNpbmcgY29jY2luZWxsZSBhbmQgdGhlIGZvbGxvd2luZyBzZW1hbnRpYyBwYXRjaDoKPgo+
IEBwMUAKPiBpZGVudGlmaWVyIGdldHN0YXRlZnVuYzsKPiBpZGVudGlmaWVyIGRyaXZlcjsKPiBA
QAo+ICBzdHJ1Y3QgcHdtX29wcyBkcml2ZXIgPSB7Cj4gICAgICAgICAuLi4sCj4gICAgICAgICAu
Z2V0X3N0YXRlID0gZ2V0c3RhdGVmdW5jCj4gICAgICAgICAsLi4uCj4gIH07Cj4KPiBAcDJACj4g
aWRlbnRpZmllciBwMS5nZXRzdGF0ZWZ1bmM7Cj4gaWRlbnRpZmllciBjaGlwLCBwd20sIHN0YXRl
Owo+IEBACj4gLXZvaWQKPiAraW50Cj4gIGdldHN0YXRlZnVuYyhzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ICB7
Cj4gICAgLi4uCj4gLSAgcmV0dXJuOwo+ICsgIHJldHVybiAwOwo+ICAgIC4uLgo+ICB9Cj4KPiBw
bHVzIHRoZSBhY3R1YWwgY2hhbmdlIG9mIHRoZSBwcm90b3R5cGUgaW4gaW5jbHVkZS9saW51eC9w
d20uaCAocGx1cyBzb21lCj4gbWFudWFsIGZpeGluZyBvZiBpbmRlbnRpb25zIGFuZCBlbXB0eSBs
aW5lcykuCj4KPiBTbyBmb3Igbm93IGFsbCBkcml2ZXJzIHJldHVybiBzdWNjZXNzIHVuY29uZGl0
aW9uYWxseS4gVGhleSBhcmUgYWRhcHRlZAo+IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcyB0byBt
YWtlIHRoZSBjaGFuZ2VzIGVhc2llciByZXZpZXdhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAg
ZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUuYyAgICAgICAgICAgICB8ICA5ICsrKysrKy0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMTQgKysrKysrKystLS0tLS0K
PiAgZHJpdmVycy9sZWRzL3JnYi9sZWRzLXFjb20tbHBnLmMgICAgICB8IDE0ICsrKysrKysrLS0t
LS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgICAgICAgfCAgNiArKysrLS0K
PiAgZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4g
IGRyaXZlcnMvcHdtL3B3bS1jcmMuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0tCj4g
IGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBk
cml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZl
cnMvcHdtL3B3bS1oaWJ2dC5jICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9w
d20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdt
L3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9w
d20taW50ZWwtbGdtLmMgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1p
cXM2MjBhLmMgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLWtlZW1i
YXkuYyAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAg
ICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYyAgICAg
ICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1wY2E5Njg1LmMgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tcmFzcGJlcnJ5cGktcG9l
LmMgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXJvY2tjaGlwLmMgICAgICAg
ICAgICB8IDEyICsrKysrKystLS0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAg
ICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5jICAgICAgICAg
ICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3ByZC5jICAgICAgICAgICAgICAg
IHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAgICB8
ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zdW40aS5jICAgICAgICAgICAgICAgfCAx
MiArKysrKysrLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLXN1bnBsdXMuYyAgICAgICAgICAgICB8
ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAgICAgICAgIHwgIDYg
KysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS14aWxpbnguYyAgICAgICAgICAgICAgfCAgOCArKysr
Ky0tLQo+ICBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+
ICAyOSBmaWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgODkgZGVsZXRpb25zKC0pCgpG
b3IgdGktc242NWRzaTg2LmM6CgpBY2tlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
