Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85DDC76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsLMQaIw4lzCoTGNlTWTSFNibV4uWiUokQuoDa2/KtI=; b=w9OOd4Q5jMzdWpBg0+CIRSO+wg
	1c3w2/BbVH0gckeV9ECIL9dCdITBMRxGOcjJ+DN7a+MamKYEqCcyf06+PT80kyewP3m0jIn5+SJDk
	wZoC/FNhQ0eDehAHGI7rGnBxLBlSinfg6to/rWWcqMZcUY/lZzsC1f5nb6Z86XZRYoq7X54wlN8+9
	+NCFZ40E+fWw5jlty8MUGOGnCrXQDBH2tmQQ5CiFW8KLn8uvPfvMYXeLm+Xw6UipBpwYSoW/wClMq
	c/MRfjbOFe1J+TtBF1U8MJs5Nes6U6tMpB8+aQUfvJzghi6TyeaRY6oiHxE8wus12w3E7lSQRgbGI
	xN8IZWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghax-00A6iM-2R;
	Mon, 27 Mar 2023 07:48:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghav-00A6hL-0s
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 07:48:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so1239714wmo.4
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679903322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oSmN6oRYq7dY4etjAThcnG/48eLu8Y7z1f+KuGJeYxM=;
        b=JZNrOe7aiCHkse8kv3y90I4Le8yCyFtyAYwOuzspszmSldR1oGb2bCQlKtheCvNPCM
         4ImbVWloHdQdYiuCgOckrLqOrfymdf2e/5SnwbvVMPQQKABpvpjjItNEJ9DvBRKLCAw0
         KVRLQ8lN6g01kuI7RL94uN/hYSxpIRGYdG06QRMCSYIvrGj1nCHYCSah0jTJcgPeQPmn
         6yMZ2bOIbwK3McOtWgU9ylr1obg+2PV5FNq0fpAcMpYT2aQDB4lW+3cgTCOsDHeeheL5
         KJckqY/IQk1X7BdLsg4vOVZG6VCCt/i3KH1x7YM6JZz88KW/cba+YMEI1yqVw3y/Kqrc
         /TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679903322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSmN6oRYq7dY4etjAThcnG/48eLu8Y7z1f+KuGJeYxM=;
        b=fVsG65itvMBCcNSRHbFg3J3Us9sAJ07u4qinwBqxAx/meuoq7jM1dpKHgYpdR7l6SZ
         Up59pbxnStQ7JQiKfc3vrXv5fcSXk9d6/uUbjuItMu2qzJANC3kjOUbzDiP4jordyrUv
         khm3jIYkS9yXLHqZQaocSNI6cANJ9YT6cjxEZZXuTvNeBwBmKzZhzurI2j7/MrVX9Cw+
         H4b4E2okWaa5/RW2EF0c7DHuQIM/M5072OOhLt/kvG0EtLcfb+rcJyYwXgHUquflPrQv
         NBRxnqWa/kVZvBQlnFr9XVtb9BX1eDC8btK6O2+JPdfw59QWeOIElBtl4oWYw+f6ZRKY
         WhNw==
X-Gm-Message-State: AO0yUKUX8+GV+CS6y7PMmMQLrqL/sZynpxcxNZncTw6N3lG+GJ4DScJk
	KvkKwQFprtL3jVpaldcy+GY9XQ==
X-Google-Smtp-Source: AK7set8jyiBwNbntQd1N/DKdcV6EfAN1u9lu7+uJZXZmYIb2+YAMBZjED/gc2hN0uOsrQ9NQvogD2g==
X-Received: by 2002:a7b:c84e:0:b0:3db:8de:6993 with SMTP id c14-20020a7bc84e000000b003db08de6993mr7968826wml.4.1679903321967;
        Mon, 27 Mar 2023 00:48:41 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c214400b003ef62deb830sm6691095wml.25.2023.03.27.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:48:41 -0700 (PDT)
Message-ID: <6d75de34-3de7-16b7-9d16-70f95b4e14e4@linaro.org>
Date: Mon, 27 Mar 2023 09:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] perf/amlogic: resolve conflict between canvas & pmu
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>,
 AML <linux-amlogic@lists.infradead.org>, Chris Healy <healych@amazon.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Pierre-Hugues Husson <phh@phh.me>
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
 <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr>
 <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
 <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
 <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
 <a81a1ebd-2621-ded1-855d-bd91d923436b@free.fr>
 <CAFBinCDmzgh2eHbJHbi+90DQsyUqUgoxHmqha3URD0KZmi5T5Q@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCDmzgh2eHbJHbi+90DQsyUqUgoxHmqha3URD0KZmi5T5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_004845_317975_E522F5F6 
X-CRM114-Status: GOOD (  18.80  )
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

T24gMjUvMDMvMjAyMyAyMTo1NCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBNYXJj
LAo+IAo+IHRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzIQo+IAo+IE9uIFRodSwgTWFyIDIzLCAy
MDIzIGF0IDU6MjTigK9QTSBNYXJjIEdvbnphbGV6IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4g
d3JvdGU6Cj4+Cj4+IEFjY29yZGluZyB0byBTOTA1WDIgRGF0YXNoZWV0IC0gUmV2aXNpb24gMDc6
Cj4+Cj4+IERNQ19NT04gYXJlYSBzcGFucyAweGZmNjM4MDgwLTB4ZmY2MzgwYzAKPj4gRERSX1BM
TCBhcmVhIHNwYW5zIDB4ZmY2MzhjMDAtMHhmZjYzOGMzNAo+Pgo+PiBSb3VuZCBERFJfUExMIGFy
ZWEgc2l6ZSB1cCB0byAweDQwCj4+Cj4+IEZpeGVzOiA5MGNmOGUyMTAxNmYgKCJhcm02NDogZHRz
OiBtZXNvbjogQWRkIEREUiBQTVUgbm9kZSIpCj4gVGhpcyBpcyBvbmx5IHBhcnRpYWxseSBjb3Jy
ZWN0LiBXZSBhbHNvIG5lZWQ6Cj4gRml4ZXM6IDIwMTZlMjExM2QzNSAoInBlcmYvYW1sb2dpYzog
QWRkIHN1cHBvcnQgZm9yIEFtbG9naWMgbWVzb24gRzEyCj4gU29DIEREUiBQTVUgZHJpdmVyIikK
PiAKPj4gU2lnbmVkLW9mZi1ieTogTWFyYyBHb256YWxleiA8bWFyYy53LmdvbnphbGV6QGZyZWUu
ZnI+Cj4+IC0tLQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29t
bW9uLmR0c2kgfCAxMiArKysrKystLS0tLS0KPj4gICBkcml2ZXJzL3BlcmYvYW1sb2dpYy9tZXNv
bl9nMTJfZGRyX3BtdS5jICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQo+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gc3BsaXQgdGhpcyBwYXRjaCBpbnRv
IHR3byBzZXBhcmF0ZSBwYXRjaGVzLAo+IGVhY2ggb2YgdGhlbSB3aXRoIHRoZSBwcm9wZXIgRml4
ZXMgdGFnIGF0dGFjaGVkIChhbmQgc3ViamVjdCBwcmVmaXgpLgo+IFRoYXQgd2F5IHRoZSBtYWlu
dGFpbmVycyBvZiB0aGUgYWNjb3JkaW5nIGZpbGVzIGNhbiBwaWNrIHRoZW0gdXAgKC5kdHMKPiBh
bmQgZHJpdmVyIGNoYW5nZXMgdXN1YWxseSBnbyB0aHJvdWdoIGRpZmZlcmVudCB0cmVlcywgSSBl
eHBlY3QgdGhpcwo+IHRvIGJlIHRoZSBjYXNlIGhlcmUgYXMgd2VsbCkuCj4gCj4gTXkgdW5kZXJz
dGFuZGluZyBpcyB0aGF0IHRoZSBkcml2ZXIgY2hhbmdlcyB3aWxsIGdvIHRocm91Z2ggYSB0cmVl
Cj4gb3RoZXIgdGhhbiB0aGUgQW1sb2dpYyBvbmUgKEkgc3VzcGVjdCBpdCdzIFdpbGwgRGVhY29u
J3MgdHJlZSkuCj4gUGxlYXNlIENjIHRoZSBvdGhlciBtYWludGFpbmVycyBhbmQgbWFpbGluZyBs
aXN0cyBhcyBzaG93biBieQo+IHNjcmlwdHMvZ2V0X21haW50YWluZXIucGw6Cj4gICAgV2lsbCBE
ZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gKG1haW50YWluZXI6QVJNIFBNVSBQUk9GSUxJTkcgQU5E
IERFQlVHR0lORykKPiAgICBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiAobWFp
bnRhaW5lcjpBUk0gUE1VIFBST0ZJTElORwo+IEFORCBERUJVR0dJTkcpCj4gICAgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0ZWQgbGlzdDpBUk0vQW1sb2dpYwo+
IE1lc29uIFNvQyBzdXBwb3J0KQo+IAo+IFRoZSBjb250ZW50cyBvZiB0aGUgcGF0Y2ggbG9vayBn
b29kIHRvIG1lIC0gc28gdGhpcyBpcyBvbmx5IGFib3V0Cj4gb3JnYW5pemluZyB0aGluZ3MuCgpU
aGUgY29udGVudCBpcyBnb29kLCBidXQgY2FuIHlvdSBzZW5kIHRoZSAzIHBhdGNoZXMgKERNQyBy
YW5nZSwgRFQgZml4LCBEcml2ZXIgZml4KQppbiBhIHNlcGFyYXRlIHBhdGNoc2V0ID8KCkFuZCBh
dm9pZCBzZW5kaW5nIHBhdGNoZXMgaW4gcmVwbHkgdG8gb3RoZXIgcGF0Y2hzZXRzL2Rpc2N1c3Np
b25zLCB0aGlzIG1lc3NlcyB0aGluZ3Mgb3V0LgoKVGhhbmtzICEKTmVpbAoKPiAKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gTWFydGluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
