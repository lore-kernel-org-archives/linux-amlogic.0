Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65234C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejgNHuwPbi7wtsezotq+Y7OiN5VQ/2bkGXRRsdw1IB8=; b=xHHsfQld3+JmPv
	ZELqoq2n+eWcFy7Dgz3IkpBxh4dqXIbW0FN7cka9SrAnZT+kMCWFr5jk3gJ0lX/yw6CCxyuqkCjgX
	YV2+XsuT+Cg4hlTnlW/JQ+5h8W1ONlMgef7ghI7Vf5oHVHBClG8ngQTKE5HnpHbe17h6EcEPWyVpY
	IrxSQvjuZQGvXGGFy8NGP/DaXUOKNnOtAxufiNU/hP/I2kNpAquNDDsIet2Bw+rP/mIDLn0n3tCsk
	M9ATyNeBIhBbmWKh3NvlP6BFoFrJJHcV5HOvuSIJRcX4X/tYHGuaJQlqUGqcBk9Bn/n3eE/0HIBrX
	7/Q8Rqty0WKHW1sqOvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOchx-00BLZu-6O; Mon, 28 Feb 2022 09:52:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOchZ-00BLSC-C7
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 09:52:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id s13so14471609wrb.6
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M/yV7fD7mHF7OTSsIIPYhLDMmhlfZbNKyzT+LzGJue4=;
 b=ud8OGDY5wYIrh7CamNCmK3sqTXwVuvkwA07RAkFMKltyntGbzNnczWNjQDqEQIi3+s
 HBq2he/ypRr6rZ72evx4KLin8zczZkQSfywuQoOxn83kfCiqQb9Gz1sVdG2HwMIocgC5
 Uylj1VMPmoPgT0jdgyQfgcwIAGzigu4lX1LOdvj7/G2U/x3G9RY+Uae8ioRxUJvkVAWZ
 OY+Ap63fcbkLectnvyZCPCJ5pUW72c1ufQkvJri9WF6pHM33q3iENhnU/a4qlmpECkXp
 hi9bfekLkkDLA05kiK9cUhOD8SA/gv+YPQdIdLs6zwhUhfWnpTLIYY8nDU0MytrfnpLH
 pRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M/yV7fD7mHF7OTSsIIPYhLDMmhlfZbNKyzT+LzGJue4=;
 b=1+52Y5/AWrb2ltmA9HvmOEUXJPZJANSeMLm83haeBqjgXPH3KJuII/6fG61grWgrrp
 2xgKRQ8l28CbMW5TtTA1ipqjxMfx9gai0LSJ+2cnop3p3jhTlt4Oau+HaRtbTxw8y5Yk
 WdOZy7eTBUAPbd022pWYRTEZ7OzfwSPnRVCPOjCNiimvpizd8e0yJALsyiAQ0IUz8yS/
 bq/QvVckJ5m74MWen9UfE4c2Y+kLSRpQrhPe5MPprx581xIVmHtO6DvAee9XzcsRezUv
 I38UvGNjmFkaH8vZo9KG28vObygU2FoF5I1FKTYhJskCjDvDPSPzc4Q1gIKAIUecv0Pk
 KnIQ==
X-Gm-Message-State: AOAM5304OHWTren9M9AeUPF/HNaxbL125c18/HtbCqSriuDCLw0NPm0f
 VZvwP8p/bwBOrGrTYvej0FpwvA==
X-Google-Smtp-Source: ABdhPJzUoTEOIDAZiRlAiW0IfHjb3TQL6fWjRKAgUiavd0Y12ITtwkuQQZKjLJZLbow4eFp397CYBQ==
X-Received: by 2002:adf:a486:0:b0:1ed:9cfe:179d with SMTP id
 g6-20020adfa486000000b001ed9cfe179dmr15847522wrb.113.1646041937017; 
 Mon, 28 Feb 2022 01:52:17 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:6431:1dc7:b58f:6282?
 ([2001:861:44c0:66c0:6431:1dc7:b58f:6282])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b0038167e239a2sm3232887wmq.19.2022.02.28.01.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 01:52:16 -0800 (PST)
Message-ID: <790952bd-b066-0b41-545c-1f65cd4244af@baylibre.com>
Date: Mon, 28 Feb 2022 10:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220228090351.9976-1-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220228090351.9976-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_015221_442276_08DCCF7E 
X-CRM114-Status: GOOD (  20.98  )
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

aSwKCk9uIDI4LzAyLzIwMjIgMTA6MDMsIFl1IFR1IHdyb3RlOgo+IERlc2NyaWJlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sKPiBmcmFt
ZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJvYm90IGNvbXBpbGF0aW9u
IGVycm9yCj4gZHVlIHRvIENPTU1PTl9DTEsgZGVwZW5kZW5jeS4KPiAKPiBGaXhlczogNDQwMjNi
OGUxZjE0ICgidHR5OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2FsY3VsYXRpb24gb2Yg
dGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sgZnJhbWXigJwpCgpBRkFJSyB0
aGlzIGNvbW1pdCBpcyBub3QgaW4gYW4gdXB0cmVhbS9mZWF0dXJlIGJyYW5jaCwgc28geW91IHNo
b3VsZCBzaW1wbHkgZml4IHlvdXIgYFVzZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCBy
YXRlIGNsb2NrYCBpbnN0ZWFkLgoKTmVpbAoKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyAgICAgIHwgIDEgKwo+ICAg
ZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+IGluZGV4IGU5NTJlYzVjN2E3Yy4uYTBmMmI4
MmZjMThiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKPiBAQCAtMjAwLDYgKzIwMCw3IEBAIGNvbmZpZyBT
RVJJQUxfS0dEQl9OTUkKPiAgIGNvbmZpZyBTRVJJQUxfTUVTT04KPiAgIAl0cmlzdGF0ZSAiTWVz
b24gc2VyaWFsIHBvcnQgc3VwcG9ydCIKPiAgIAlkZXBlbmRzIG9uIEFSQ0hfTUVTT04gfHwgQ09N
UElMRV9URVNUCj4gKwlkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiAgIAlzZWxlY3QgU0VSSUFMX0NP
UkUKPiAgIAloZWxwCj4gICAJICBUaGlzIGVuYWJsZXMgdGhlIGRyaXZlciBmb3IgdGhlIG9uLWNo
aXAgVUFSVHMgb2YgdGhlIEFtbG9naWMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFs
L21lc29uX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiBpbmRleCBi
ZjZiZTU0NjhhYWYuLjk3MmYyMTBmMzQ5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvbWVzb25fdWFydC5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+
IEBAIC03ODAsMjggKzc4MCwzNyBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAo+ICAgCWlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLQlpZiAoaXJxIDwgMCkKPiAtCQlyZXR1cm4g
aXJxOwo+ICsJaWYgKGlycSA8IDApIHsKPiArCQlyZXQgPSBpcnE7Cj4gKwkJZ290byBlcnJfb3V0
X2Nsa19kaXNhYmxlOwo+ICsJfQo+ICAgCj4gICAJb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+
ZGV2Lm9mX25vZGUsICJmaWZvLXNpemUiLCAmZmlmb3NpemUpOwo+ICAgCj4gICAJaWYgKG1lc29u
X3BvcnRzW3BkZXYtPmlkXSkgewo+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJwb3J0ICVkIGFs
cmVhZHkgYWxsb2NhdGVkXG4iLCBwZGV2LT5pZCk7Cj4gLQkJcmV0dXJuIC1FQlVTWTsKPiArCQly
ZXQgPSAtRUJVU1k7Cj4gKwkJZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOwo+ICAgCX0KPiAgIAo+
ICAgCXBvcnQgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCB1YXJ0X3Bv
cnQpLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghcG9ydCkKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiAr
CWlmICghcG9ydCkgewo+ICsJCXJldCA9IC1FTk9NRU07Cj4gKwkJZ290byBlcnJfb3V0X2Nsa19k
aXNhYmxlOwo+ICsJfQo+ICAgCj4gICAJcG9ydC0+bWVtYmFzZSA9IGRldm1faW9yZW1hcF9yZXNv
dXJjZSgmcGRldi0+ZGV2LCByZXNfbWVtKTsKPiAtCWlmIChJU19FUlIocG9ydC0+bWVtYmFzZSkp
Cj4gLQkJcmV0dXJuIFBUUl9FUlIocG9ydC0+bWVtYmFzZSk7Cj4gKwlpZiAoSVNfRVJSKHBvcnQt
Pm1lbWJhc2UpKSB7Cj4gKwkJcmV0ID0gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsKPiArCQlnb3Rv
IGVycl9vdXRfY2xrX2Rpc2FibGU7Cj4gKwl9Cj4gICAKPiAgIAlwcml2YXRlX2RhdGEgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2YXRlX2RhdGEpLAo+ICAgCQkJCSAgICBH
RlBfS0VSTkVMKTsKPiAtCWlmICghcHJpdmF0ZV9kYXRhKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+
ICsJaWYgKCFwcml2YXRlX2RhdGEpIHsKPiArCQlyZXQgPSAtRU5PTUVNOwo+ICsJCWdvdG8gZXJy
X291dF9jbGtfZGlzYWJsZTsKPiArCX0KPiAgIAo+ICAgCWlmIChkZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoJnBkZXYtPmRldikpCj4gICAJCXByaXZhdGVfZGF0YS0+dXNlX3h0YWxfY2xrID0gdHJ1ZTsK
PiBAQCAtODIyLDcgKzgzMSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCj4gICAJcmV0ID0gbWVzb25fdWFydF9wcm9iZV9j
bG9ja3MocG9ydCk7Cj4gICAJaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZXJy
X291dF9jbGtfZGlzYWJsZTsKPiAgIAo+ICAgCW1lc29uX3BvcnRzW3BkZXYtPmlkXSA9IHBvcnQ7
Cj4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcG9ydCk7Cj4gQEAgLTgzMSw5ICs4NDAs
MTUgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gICAJbWVzb25fdWFydF9yZXNldChwb3J0KTsKPiAgIAo+ICAgCXJldCA9IHVhcnRf
YWRkX29uZV9wb3J0KCZtZXNvbl91YXJ0X2RyaXZlciwgcG9ydCk7Cj4gLQlpZiAocmV0KQo+ICsJ
aWYgKHJldCkgewo+ICAgCQltZXNvbl9wb3J0c1twZGV2LT5pZF0gPSBOVUxMOwo+ICsJCWdvdG8g
ZXJyX291dF9jbGtfZGlzYWJsZTsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiAgIAo+ICtlcnJf
b3V0X2Nsa19kaXNhYmxlOgo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjbGspOwo+ICAgCXJl
dHVybiByZXQ7Cj4gICB9Cj4gICAKPiAKPiBiYXNlLWNvbW1pdDogYzJmYWY3MzdhYmZiMTBmODhm
MmQyNjEyZDU3M2U5ZWRjM2M0MmMzNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
