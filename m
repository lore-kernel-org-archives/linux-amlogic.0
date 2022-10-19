Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC09DC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywYQX/kEQoU+xRf2Pp2ZoqYV46WyVjaXua+yw1H6Edk=; b=JRb2YOBf8/W1aoMw6+B0zz20JY
	G9FtwScDoQ+rJ2ND24osPiTDtOvv4KL0zgvIVrR1++bonFMmsPX8yvzXYdNL0ixBETl+CnlMP8mdZ
	gSIhxXPgDBIfuqinbTA7Qwfn1TqwH9qFa5FQ5Yw93ytw6XZg/ZkVldX71COH/nzkzORWKt+suaAYS
	a3uXl5I10GAeiSbXoKQqf3/+rP51RBPocViP7dh097dP+JfC6eg2retGGIJ/0SYj5dkTo8cC4GqiE
	IN652YGUbtnu+IlTgYE50HxPvSkPszbYm91kU37XgUWYfIm8OUbz5jhabgwG214bXxyM75rxzNe9B
	GogNlHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5VN-00HOtA-EV; Wed, 19 Oct 2022 09:36:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5VK-00HOp8-2r
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 09:36:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id r13so27938583wrj.11
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CAFlOUOSDNnpuoT+qdniJV4n8MjtoOiXZ0ZGelulaWU=;
        b=mxBYSXH83a8R2gqazBpTtCz7VO9xqsgjj2vXwj9nr1M6ylxMyqTveNpscOoPWCYCsA
         eEzTpwgls/8waiWeVGKE1584hYuc3sHvIlMuh2rMc6NtmsDkFxefJBunGnAM739QREkw
         vXDCNujfYlxtUAxITdcNpDx8WcahP+aq6jxtMM/QxXVOmZIJlcj0n/dQfH9gndSAliMu
         vjOeW/8L13HSd457fpcbjtjfs9kPcBAT0NorhP0seOW5+RFoxm0L/GlCHESgl+4gpjmz
         wt7sXgWS/b+c4gxd7/oc+uBTTE5IAjaxt1yE6VrtceXlFZizLGuPFtrtVyfJHf1mBMEE
         wtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAFlOUOSDNnpuoT+qdniJV4n8MjtoOiXZ0ZGelulaWU=;
        b=0ho3d/M8H79bdOH42sAKX3EMa1Nw78rE+wwTTZaM5p18DEQTYz/P2Hjd2ICplVUlmu
         H517yJWy57GTkHTw9SNsgEI4VLtFTbSufkUIVS2RzIxwrKtak1aarMWoyoO/uyoTGkpX
         S3CTLXH1ni2l6j15FuZuiioyo0fxt0OEnWG9H0wKhv1rgwaavk1ypcvi59BF22wkBpcy
         t17z0OjjyjbyA8pGX/dY4j0+Fk0v7PRpiN8uTIWtaQxKJXay3mdze5p7lviF2OzEqjGu
         0NivKGtwy81fgnYno0PqOPDYGCEAD7aS+ZsMQO06HkdI9wZYevLutdcF9xSHhY37MoAf
         88OQ==
X-Gm-Message-State: ACrzQf2zHw/aD6G7slRTj7akQexqb+ySaLUlFKFqp49TbNNafcTiBRVu
	RANfkI6VO1HcvoWh8W/NN04FzQ==
X-Google-Smtp-Source: AMsMyM50f/3OOKH1f22KJUuMMnPFOXKp4tez4aGFwbvdlYy/HHNOVo7/VLqR1PmpIjtixY1NE1R44g==
X-Received: by 2002:a05:6000:12ca:b0:22e:6529:a764 with SMTP id l10-20020a05600012ca00b0022e6529a764mr4484971wrx.153.1666172206880;
        Wed, 19 Oct 2022 02:36:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b15b:4b56:592a:c397? ([2a01:e0a:982:cbb0:b15b:4b56:592a:c397])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6290000000b0022ae4f8395dsm12834601wru.96.2022.10.19.02.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 02:36:46 -0700 (PDT)
Message-ID: <010ea9e1-4a66-61d4-94c5-2bec20ef928d@linaro.org>
Date: Wed, 19 Oct 2022 11:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 22/44] serial: meson: Use uart_xmit_advance()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
 <20221019091151.6692-23-ilpo.jarvinen@linux.intel.com>
Organization: Linaro Developer Services
In-Reply-To: <20221019091151.6692-23-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_023650_158342_BC09BCEB 
X-CRM114-Status: GOOD (  12.80  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkvMTAvMjAyMiAxMToxMSwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gVGFrZSBhZHZhbnRh
Z2Ugb2YgdGhlIG5ldyB1YXJ0X3htaXRfYWR2YW5jZSgpIGhlbHBlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMyArLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNv
bl91YXJ0LmMKPiBpbmRleCAwNTYyNDNjMTI4MzYuLjc0MTEwMDE3OTg4YSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gKysrIGIvZHJpdmVycy90dHkvc2Vy
aWFsL21lc29uX3VhcnQuYwo+IEBAIC0xNjIsOCArMTYyLDcgQEAgc3RhdGljIHZvaWQgbWVzb25f
dWFydF9zdGFydF90eChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+ICAgCj4gICAJCWNoID0geG1p
dC0+YnVmW3htaXQtPnRhaWxdOwo+ICAgCQl3cml0ZWwoY2gsIHBvcnQtPm1lbWJhc2UgKyBBTUxf
VUFSVF9XRklGTyk7Cj4gLQkJeG1pdC0+dGFpbCA9ICh4bWl0LT50YWlsICsgMSkgJiAoVUFSVF9Y
TUlUX1NJWkUgLSAxKTsKPiAtCQlwb3J0LT5pY291bnQudHgrKzsKPiArCQl1YXJ0X3htaXRfYWR2
YW5jZShwb3J0LCAxKTsKPiAgIAl9Cj4gICAKPiAgIAlpZiAoIXVhcnRfY2lyY19lbXB0eSh4bWl0
KSkgewoKCkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
