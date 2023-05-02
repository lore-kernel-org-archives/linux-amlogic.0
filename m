Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA84C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8DHm3M123Bc8B3NcJTyd+5KQfXLOD/1cWPC5dguKo0=; b=pPKCCgCZhH6Bl5
	3XBHPF4KU1H3vu+KOmDFvuq0Yqbx/Rq0VyXiJVcD+nu0yUPOz2pQRKLOBRXTdVX3lmIuyT+yM0NNc
	U5CV48VAkRzgEcVgaP/NXouqw9lesueKydlZarddX5FA0/zYQSiWAjQROoNLIJ2tOvMF3ffRsQzlT
	WUeS+6bCUMwF5SKAkaCIw2iusjT0JNtUm5/0ye15SmzTqKgnN9jPYbj3B1+Qzi6TplsdD2OOUHkTz
	dDUYWLvnRuy2kYJDUxvcBZMv3OkAs3LIrB+tTkflnyhq1aFhVsxIjX9BkNO1K/Sw9wEDCRmGx0waN
	czdEUnKSVdzJb0Srp4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwbU-002a56-2p;
	Tue, 02 May 2023 20:28:04 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwbR-002a2v-0d;
	Tue, 02 May 2023 20:28:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94ef8b88a5bso664194266b.2;
        Tue, 02 May 2023 13:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683059272; x=1685651272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvaKk2xIJRJAr0HLadgsY7MzLEb/bHxzszEYtp5mQjo=;
        b=HB9NHckuN3pzMs6VnxlxYMiTVWaTFi/NK7jZvJE6wIQKSLZM4NBuuFvldUs/G5sh18
         HHdnPg6xVKCNwp3LQDyK24rO++rhCaT7QdiXcWcALk+BfKXvbp/XeA5VnWZKG/XDfnFb
         d71/UO/XuQy8A9jOlSufFuzEeNQM/ritEWKMYp9HNMEJ4TmCtbAr1iHZhp2b8AGF2EZq
         8EQIm+ImwpG7qvzTQ25MAw65q+JT3P6a7GdqRNeB1/dBJIWIQLm00yBMnc1FcB6b3gkp
         yTyn3xtT50x14Z0BRVFNKH5KzDdc5tkidaMr96ha4f/e36EnXF1Ftqb6oQesCMQWjM9Q
         sWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683059272; x=1685651272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvaKk2xIJRJAr0HLadgsY7MzLEb/bHxzszEYtp5mQjo=;
        b=k5aPnniFczSaACod5M8qkJOs1FXc/FxorTGjrBYAfvwAmotZ2iM8YBd4fAeAg1/NFC
         ajlv1Mfg5+3QYmT2gRIMcjm4p2Vy7rV2zNNs59nOPyCFCXE/mNmUIBAbfdq/DTjYK2S5
         pFWQWYEnperfYIk/ORWR6kh00uOz6oxDk5Albm9iU4KfWsiD3ocfsgnX/ER/OHNbay1K
         +9YkxQfCwEWPPjWEKBFnSC+80+jzWncCyxVqfvBWaieltA2kv1lUynCWw3s7iJFj9di5
         S3+112DeHoOZis5wmLn6cw/U6hT1xdQ3nqK/juKyBkFiIjE1aVvPNmLaEORTZ+H4mLw+
         TwWA==
X-Gm-Message-State: AC+VfDzWsskGt13LBh5S9MexrX5K12D0FnrbrBO9MuE8+oWtN141XO3d
	95hdHZVJ6st4dbYq4WGvy+g=
X-Google-Smtp-Source: ACHHUZ4haDUcwTKgGDS/6gTdOVZ7SmHx8hWAkXJhOA+iAY+TenriJaeDzTcoa2X/H0TknLQ3HRz1yA==
X-Received: by 2002:a17:907:9496:b0:94e:ed5d:c864 with SMTP id dm22-20020a170907949600b0094eed5dc864mr1274429ejc.19.1683059271299;
        Tue, 02 May 2023 13:27:51 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9545:b300:8dc9:588b:ac03:5082? (dynamic-2a02-3100-9545-b300-8dc9-588b-ac03-5082.310.pool.telefonica.de. [2a02:3100:9545:b300:8dc9:588b:ac03:5082])
        by smtp.googlemail.com with ESMTPSA id ia1-20020a170907a06100b009614fea69e8sm4406117ejc.74.2023.05.02.13.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:27:50 -0700 (PDT)
Message-ID: <3e1a041e-f721-1535-840c-3e1970a80bc8@gmail.com>
Date: Tue, 2 May 2023 22:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <f48f17a7-7f50-c5ef-cc8f-007d0cb302b0@gmail.com>
 <20230501180755.mxua3owqyaa26jnq@pengutronix.de>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230501180755.mxua3owqyaa26jnq@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_132801_254802_BA541A15 
X-CRM114-Status: GOOD (  28.01  )
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

T24gMDEuMDUuMjAyMyAyMDowNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gTW9uLCBN
YXkgMDEsIDIwMjMgYXQgMDQ6MDM6MTZQTSArMDIwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+
PiBJIGRvbid0IHNlZSBhIHJlYXNvbiB3aHkgd2Ugc2hvdWxkIHRyZWF0IHRoZSBjYXNlIGxvIDwg
aGkgZGlmZmVyZW50bHkKPj4gYW5kIHJldHVybiAwIGFzIHBlcmlvZCBhbmQgZHV0eV9jeWNsZS4g
VGhlIGN1cnJlbnQgbG9naWMgd2FzIGFkZGVkIHdpdGgKPj4gYzM3NWJjYmFhYmRiICgicHdtOiBt
ZXNvbjogUmVhZCB0aGUgZnVsbCBoYXJkd2FyZSBzdGF0ZSBpbgo+PiBtZXNvbl9wd21fZ2V0X3N0
YXRlKCkiKSwgTWFydGluIGFzIG9yaWdpbmFsIGF1dGhvciBkb2Vzbid0IHJlbWVtYmVyIHdoeQo+
PiBpdCB3YXMgaW1wbGVtZW50ZWQgdGhpcyB3YXkgYmFjayB0aGVuLgo+PiBTbyBsZXQncyBoYW5k
bGUgaXQgYXMgbm9ybWFsIHVzZSBjYXNlIGFuZCBhbHNvIHJlbW92ZSB0aGUgb3B0aW1pemF0aW9u
Cj4+IGZvciBsbyA9PSAwLiBJIHRoaW5rIHRoZSBpbXByb3ZlZCByZWFkYWJpbGl0eSBpcyB3b3J0
aCBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdt
YWlsLmNvbT4KPj4gLS0tCj4+IHYyOgo+PiAtIGltcHJvdmUgY29tbWl0IGRlc2NyaXB0aW9uCj4+
IC0tLQo+PiAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAxNCArKy0tLS0tLS0tLS0tLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jCj4+IGluZGV4IDU3MzIzMDBlYi4uMzg2NTUzOGRkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L3B3bS9wd20tbWVzb24uYwo+PiArKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiBAQCAt
MzUxLDE4ICszNTEsOCBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3
bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+PiAgCWNoYW5uZWwtPmxvID0g
RklFTERfR0VUKFBXTV9MT1dfTUFTSywgdmFsdWUpOwo+PiAgCWNoYW5uZWwtPmhpID0gRklFTERf
R0VUKFBXTV9ISUdIX01BU0ssIHZhbHVlKTsKPj4gIAo+PiAtCWlmIChjaGFubmVsLT5sbyA9PSAw
KSB7Cj4+IC0JCXN0YXRlLT5wZXJpb2QgPSBtZXNvbl9wd21fY250X3RvX25zKGNoaXAsIHB3bSwg
Y2hhbm5lbC0+aGkpOwo+PiAtCQlzdGF0ZS0+ZHV0eV9jeWNsZSA9IHN0YXRlLT5wZXJpb2Q7Cj4+
IC0JfSBlbHNlIGlmIChjaGFubmVsLT5sbyA+PSBjaGFubmVsLT5oaSkgewo+PiAtCQlzdGF0ZS0+
cGVyaW9kID0gbWVzb25fcHdtX2NudF90b19ucyhjaGlwLCBwd20sCj4+IC0JCQkJCQkgICAgY2hh
bm5lbC0+bG8gKyBjaGFubmVsLT5oaSk7Cj4+IC0JCXN0YXRlLT5kdXR5X2N5Y2xlID0gbWVzb25f
cHdtX2NudF90b19ucyhjaGlwLCBwd20sCj4+IC0JCQkJCQkJY2hhbm5lbC0+aGkpOwo+PiAtCX0g
ZWxzZSB7Cj4+IC0JCXN0YXRlLT5wZXJpb2QgPSAwOwo+PiAtCQlzdGF0ZS0+ZHV0eV9jeWNsZSA9
IDA7Cj4+IC0JfQo+IAo+IFRoZSBsYXN0IGVsc2UgYnJhbmNoIGlzIGV2ZW4gd3JvbmcsIGlzbid0
IGl0PyAuYXBwbHkoKSBjYW4gZm9yIGEgZ3JlYXRlcgo+IHRoYW4gNTAlIHJlbGF0aXZlIGR1dHkg
Y3ljbGUgd2VsbCBoYXZlIGxvIDwgaGksIHJpZ2h0PyBTbyB0aGlzIGlzIG5vdCBhCj4gbWVyZSBv
cHRpbWlzYXRpb24gYnV0IGEgZml4PyEKPiAKCkkgKnRoaW5rKiB0b28gdGhhdCBpdCdzIHdyb25n
LiBIb3dldmVyIEkgaGF2ZSBubyB0ZXN0IGh3IGFuZCBJJ20gbm90IGF3YXJlCm9mIGFueSBwcm9i
bGVtIGNhdXNlZCBieSB0aGUgY3VycmVudCBjb2RlLiBUaGVyZWZvcmUgSSB3YXMgcmVsdWN0YW50
IHRvIG1ha2UKdGhlIHBhdGNoIGEgZml4LgoKPj4gKwlzdGF0ZS0+cGVyaW9kID0gbWVzb25fcHdt
X2NudF90b19ucyhjaGlwLCBwd20sIGNoYW5uZWwtPmxvICsgY2hhbm5lbC0+aGkpOwo+PiArCXN0
YXRlLT5kdXR5X2N5Y2xlID0gbWVzb25fcHdtX2NudF90b19ucyhjaGlwLCBwd20sIGNoYW5uZWwt
PmhpKTsKPiAKPiBOb3RlIHRoYXQgbWVzb25fcHdtX2NhbGMoKSBoYXMgYSBzaW1pbGFyIGNvbnN0
cnVjdCB0aGF0IGNhbiBiZQo+IHNpbXBsaWZpZWQgaW4gYSBzaW1pbGFyIHdheS4gQWxsIHRocmVl
IHZhcmlhbnRzIGhhdmUKPiAKPiAJY2hhbm5lbC0+cHJlX2RpdiA9IHByZV9kaXY7Cj4gClRoZSBw
cmVfZGl2IG1lbWJlciB3aWxsIGJlIGdvbmUgYW55d2F5IHdpdGggYSBwYXRjaCBzZXJpZXMgdGhh
dCBpcyBpbgpkaXNjdXNzaW9uIGN1cnJlbnRseSAoIm1ha2UgZnVsbCB1c2Ugb2YgQ0NGIikuCgo+
IGFuZCB0aGUgbGFzdCBlbHNlIGJyYW5jaCBpcyB1bml2ZXJzYWwgYW5kIGNhbiByZXBsYWNlIHRo
ZSBvdGhlcnMuCj4gCj4gQW5vdGhlciBpc3N1ZSBJIGp1c3Qgc3BvdHRlZCBpcyB0aGF0Cj4gCj4g
CWR1dHkgPSBzdGF0ZS0+ZHV0eV9jeWNsZQo+IAo+IGlzIHdyb25nIGZvciBzdGF0ZS0+ZHV0eV9j
eWNsZSA+IFVJTlRfTUFYLiAoRGl0dG8gdGhlIGFzc2lnbm1lbnQgdG8KPiBwZXJpb2QuKSBNYWtp
bmcgYm90aCBkdXR5IGFuZCBwZXJpb2QgdTY0IHNob3VkbCBmaXggdGhhdC4gQWZ0ZXIgdGhhdAo+
IGR1dHlfY250ID4gMHhmZmZmIGNhbm5vdCBoYXBwZW4gYXMgdGhlIGNvcmUgZW5zdXJlcyB0aGF0
IGR1dHlfY3ljbGUgPD0KPiBwZXJpb2QuCj4gCkkgc2F3IHRoYXQgb25lIHRvby4gSXQncyBzb21l
dGhpbmcgZm9yIGEgZm9sbG93LXVwIHBhdGNoLgoKPiBIYXZpbmcgc2FpZCB0aGF0LCB0aGUgcHJv
cG9zZWQgY2hhbmdlIGhlcmUgaXMgYW4gaW1wcm92ZW1lbnQsIHNvOgo+IAo+IFJldmlld2VkLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IAo+
IEkgYWxzbyBzdWdnZXN0IHRvIGFkZCBhIEZpeGVzIGxpbmUsIGkuZS4KPiAKPiBGaXhlczogYzM3
NWJjYmFhYmRiICgicHdtOiBtZXNvbjogUmVhZCB0aGUgZnVsbCBoYXJkd2FyZSBzdGF0ZSBpbiBt
ZXNvbl9wd21fZ2V0X3N0YXRlKCkiKQo+IApPSwoKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKSGVp
bmVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
