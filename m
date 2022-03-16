Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50372C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I83gv6WOM/oA9jU7l3yquJgIBG8eBdQ3bgBg5Lhf4c8=; b=aCaccpZgwGIHcT
	YU5MTUz/OUrrn6a/fQdoVKnEusdL/PvOUAjyErNNemGYGpz4bHP+LKI08ILD7WKsiGvbV/QV66rse
	IVy9BHMqNadWtY40LdhLUCh2CC1hnP5OCCsQcSE6+80lQl8C4Anz4Y0EKHlStfqhSGnDIde+1UCsL
	F7+uc3XpTHuI1i5u0TpAd2gL9IBx33y5FVFY6N9ywtr7pIvl8CNTpP5TBCX6gzsdPszLXIoPakAkl
	cmm1BKnEe0H4owCcG12FzsEg3WyWkz/6pJgug3nIw9bwHw3lo5S+zWkfLDqXdTheqNfK5UegReH98
	QniLI0Gr4L0oJSztPHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUP5g-00C7vU-7z; Wed, 16 Mar 2022 08:33:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUP5d-00C7u2-5G
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 08:33:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id h23so1228178wrb.8
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BvpZeowevIb87CxIuiNa0pESwSLe00CabXMSsOuMuQ=;
 b=hNeQokt0fmuAA+5vnxHgJBgljGTOBpbtM65phSfAYl3GcefXKZ2lWF3/GmrwSl5d7g
 nmR/rdY6sQiqDcJIc0jnqpmR8Fklbx6b3p0lG5Ov7PshhnB35ACT1Vm61dUF3llSPKPA
 sqVvsm07AjJreYNMZ3+KF3Pf2pjYVhYjexVAw0d9xgWbGG79cQLdjpL49g6laO8E5/to
 VGVphxqgrJ1ANbrmccMKLroLMffIBjWt1/CVPokR+aJuLFehW/+BrwmbsypueQQgoiC3
 jqzrI/my6XIwKyh6koZkAlHQNc5dwqoRNUTfimovO3vnieKdNNhlIWTpugYDm72tJRqb
 QsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BvpZeowevIb87CxIuiNa0pESwSLe00CabXMSsOuMuQ=;
 b=OXSuumkgdbOxSAHMQxaBIHdRv8Ka4NWtabbEKiAlXSpKbWCYDK9mF0GJeQyrr/vtCn
 OXKvGB1L37IfcJxqVgVuUGA3yvf8UVuElsMpC8vWyMX2bveY3IsQFEqec4WUHUGSPef5
 SO/+Dx78kppAzOsgGszhUcCQPDgZMSoCSVeqRHPIktoB4CegjkJfW+LKmVk1OUw8qTki
 kqnDxN4ow6lCCJ38kWzQJmxAB8TAc4MQXt4ovJ5G1quABq11Ng6KhB/Ae/6JO/PzYIET
 gZL2JP4/WYWq9Lnmnv/Hvh8dKNnL4Lesu0Fz2neD6//rD721SURApD1SOGYi7Md0gOLG
 tROA==
X-Gm-Message-State: AOAM531XMvSn3/S8MTXyO8J4I1CVHWvr31z4d59IlNEnLCvu7p0IRIue
 ZKo+BJ7KVeEA6sUL4aXOfySIgQ==
X-Google-Smtp-Source: ABdhPJzJNIEO2OOFb0fLeQNLGAy9/4xQ9pFyGnlANpx+I2SRdPmAxC1H7JIFDloo0UnZCNIeHlKGng==
X-Received: by 2002:a5d:5046:0:b0:1ed:9eac:bade with SMTP id
 h6-20020a5d5046000000b001ed9eacbademr23412319wrt.697.1647419583692; 
 Wed, 16 Mar 2022 01:33:03 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm1473580wmh.41.2022.03.16.01.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 01:33:03 -0700 (PDT)
Message-ID: <73cca4e1-c427-1fa3-52f6-18c211dd84b7@baylibre.com>
Date: Wed, 16 Mar 2022 09:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 08/16] drm/meson: dw-hdmi: Don't open code
 devm_clk_get_enabled()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013305_223974_0D38B6AC 
X-CRM114-Status: GOOD (  20.66  )
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

T24gMTQvMDMvMjAyMiAxNToxNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gZGV2bV9jbGtf
Z2V0X2VuYWJsZWQoKSByZXR1cm5zIGEgY2xvY2sgcHJlcGFyZWQgYW5kIGVuYWJsZWQgYW5kIGFs
cmVhZHkKPiByZWdpc3RlcnMgYSBkZXZtIGV4aXQgaGFuZGxlciB0byBkaXNhYmxlIChhbmQgdW5w
cmVwYXJlKSB0aGUgY2xvY2suCj4gCj4gVGhlcmUgaXMgc2xpZ2h0IGNoYW5nZSBpbiBiZWhhdmlv
ciBhcyBhIGZhaWx1cmUgdG8gZW5hYmxlIHRoZSBjbG9jawo+IG5vdyByZXN1bHRzIGluIGFuIGVy
cm9yIG1lc3NhZ2UsIHRvby4gQWxzbyB0aGUgYWN0dWFsIGVycm9yIGNvZGUgaXMgYWRkZWQKPiB0
byB0aGUgbWVzc2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X2hkbWkuYyB8IDQ4ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+IGluZGV4IDVjZDJiMmViYmJkMy4uNjAz
NGU4MGM1YjJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gQEAg
LTY3MCwyOSArNjcwLDYgQEAgc3RhdGljIHZvaWQgbWVzb25fZGlzYWJsZV9yZWd1bGF0b3Iodm9p
ZCAqZGF0YSkKPiAgIAlyZWd1bGF0b3JfZGlzYWJsZShkYXRhKTsKPiAgIH0KPiAgIAo+IC1zdGF0
aWMgdm9pZCBtZXNvbl9kaXNhYmxlX2Nsayh2b2lkICpkYXRhKQo+IC17Cj4gLQljbGtfZGlzYWJs
ZV91bnByZXBhcmUoZGF0YSk7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgbWVzb25fZW5hYmxlX2Ns
ayhzdHJ1Y3QgZGV2aWNlICpkZXYsIGNoYXIgKm5hbWUpCj4gLXsKPiAtCXN0cnVjdCBjbGsgKmNs
azsKPiAtCWludCByZXQ7Cj4gLQo+IC0JY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgbmFtZSk7Cj4g
LQlpZiAoSVNfRVJSKGNsaykpIHsKPiAtCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBnZXQgJXMg
cGNsa1xuIiwgbmFtZSk7Cj4gLQkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiAtCX0KPiAtCj4gLQly
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoY2xrKTsKPiAtCWlmICghcmV0KQo+IC0JCXJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1lc29uX2Rpc2FibGVfY2xrLCBjbGspOwo+IC0K
PiAtCXJldHVybiByZXQ7Cj4gLX0KPiAtCj4gICBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiAgIAkJCQl2b2lk
ICpkYXRhKQo+ICAgewo+IEBAIC03MDIsNiArNjc5LDcgQEAgc3RhdGljIGludCBtZXNvbl9kd19o
ZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gICAJ
c3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRhdGE7Cj4gICAJc3RydWN0IG1lc29uX2RybSAqcHJp
diA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4gICAJc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRhICpkd19w
bGF0X2RhdGE7Cj4gKwlzdHJ1Y3QgY2xrICpjbGs7Cj4gICAJaW50IGlycTsKPiAgIAlpbnQgcmV0
Owo+ICAgCj4gQEAgLTc2MywxNyArNzQxLDIzIEBAIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ICAgCWlmIChJ
U19FUlIobWVzb25fZHdfaGRtaS0+aGRtaXR4KSkKPiAgIAkJcmV0dXJuIFBUUl9FUlIobWVzb25f
ZHdfaGRtaS0+aGRtaXR4KTsKPiAgIAo+IC0JcmV0ID0gbWVzb25fZW5hYmxlX2NsayhkZXYsICJp
c2ZyIik7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwljbGsgPSBkZXZtX2Nsa19n
ZXRfZW5hYmxlZChkZXYsICJpc2ZyIik7Cj4gKwlpZiAoSVNfRVJSKGNsaykpIHsKPiArCQlkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZW5hYmxlZCBpc2ZyIHBjbGsgKCVwZSlcbiIsIGNsayk7
Cj4gKwkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiArCX0KPiAgIAo+IC0JcmV0ID0gbWVzb25fZW5h
YmxlX2NsayhkZXYsICJpYWhiIik7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwlj
bGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJpYWhiIik7Cj4gKwlpZiAoSVNfRVJSKGNs
aykpIHsKPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZW5hYmxlZCBpYWhiIHBjbGsg
KCVwZSlcbiIsIGNsayk7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiArCX0KPiAgIAo+IC0J
cmV0ID0gbWVzb25fZW5hYmxlX2NsayhkZXYsICJ2ZW5jaSIpOwo+IC0JaWYgKHJldCkKPiAtCQly
ZXR1cm4gcmV0Owo+ICsJY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAidmVuY2kiKTsK
PiArCWlmIChJU19FUlIoY2xrKSkgewo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBl
bmFibGVkIHZlbmNpIHBjbGsgKCVwZSlcbiIsIGNsayk7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoY2xr
KTsKPiArCX0KPiAgIAo+ICAgCWR3X3BsYXRfZGF0YS0+cmVnbSA9IGRldm1fcmVnbWFwX2luaXQo
ZGV2LCBOVUxMLCBtZXNvbl9kd19oZG1pLAo+ICAgCQkJCQkgICAgICAmbWVzb25fZHdfaGRtaV9y
ZWdtYXBfY29uZmlnKTsKCkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
