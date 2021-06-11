Return-Path: <SRS0=Tm47=LF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C274CC48BE0
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5979A613C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5979A613C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KZ5q0+2cFLlWbvaI5qUwOIVcGd6nyjw6u/Cj2f19iDU=; b=SLgTwIKs3bu3G+N1MyRBoyfec6
	nm2ml+csWWVJ+dJkwilGlHnp+JduIPnSZPsP5ZMD24RAs9s3rQw6otZHGcom+XQkmxEwIag++hm4E
	DY4HQdufc4OAFA1hRaG4RI3T2hAJ/MkXFqZ6t1g2T5byjq5Ww8VQxfB7yfxuwJhc4U51mG/qbC2rs
	uufXQKHwA4AWFpXfMwU3tGYunP5p7/u2uooXi3oqco+LALHrhSs0fN381ovCbFGjTofY6bJmQ8RUg
	7jxonCm3bqnpg9ofWZGspz3y8CS8+8rOef9xijGTHFf9cbaKtRNgRoU6LnrHdZTGVwrWPtTLB7f6O
	b4TsXswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrbO9-0046cF-2i; Fri, 11 Jun 2021 07:15:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrbNt-0046Xk-HV
 for linux-amlogic@lists.infradead.org; Fri, 11 Jun 2021 07:15:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m18so4885288wrv.2
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jun 2021 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FREoGcjYmwatSSvbTS2odeRUwmu2yN1APuIOZSR0RBY=;
 b=mJUZr/QXwC6Eq9noIyQKNB3FT88clReeJxuO9wolZRA71JslpBE2MPVycE0O8C8mZR
 TkHAU8EfnyOm3PYVhkFvTL10xPUTH3/Pz6JYmAJf81qKYRIDEzzmgRiXpvMy43rC+vK1
 P4DEVHnP7urdERwxs4KNnt//I5fpG6M1u+88sR08g9ZXyidQwqmS7Ri2JfNklvGjhb2w
 HqdlNzrDK9GZ2jcPg8WPkMko0+1yQxZdhtA2B5eEysyrOv/2ELAbYMzo6/eLFPlFPK8Y
 QiIT5AphSyi13oYbU6zOkFe0U6e4NOmygyte1p7wt1F91T9XOAliVTcOHdFa3Lucdpd0
 TonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FREoGcjYmwatSSvbTS2odeRUwmu2yN1APuIOZSR0RBY=;
 b=IzLcS19jp9MoebxMnY0tCkBePFRhXrAPbYY0a6/hnU22RY6Dzm9Ti7unFxOmNs80DK
 W9xbbFK0qesamw1j4RD1kjo6tflOjr5X2YZCNaof90PmgJ9VvMTcLggO+2sfDlECi5Xj
 tUJJA6zAURTs3QTldlG9c8oWRjX+Ov1LJyMqDChSTIWg0vq+R2r0oM2eJARTnkWiUYHH
 0avQzJH+Z0W6aU864F9yvjOkCJnYgT+e3a5HDxDTK5/6m9Q0r935YEt3QY9lajwjMj85
 RT3AhaoAh0+tauJr4pEgH62Nga61YT08hJZ3X0WUE/8bTL3WuA2KxI2ZX3hDBHW/czg7
 CaSg==
X-Gm-Message-State: AOAM531pNkJvk37gqZE3IHJW3LDh+TqAet3MUaItRT/HuIE/2+Jooz1K
 KNPKMokrdzx98mGtmPijTVDViw==
X-Google-Smtp-Source: ABdhPJxzefSoeOyoePIG/Zey+jgTLMreoCw+p+cwYA6CvgytK8vvrimtOK18u7sAms7CvBVfDXJMrA==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr2316655wrw.57.1623395716028; 
 Fri, 11 Jun 2021 00:15:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:bfd6:8f6:b84c:734f?
 ([2a01:e0a:90c:e290:bfd6:8f6:b84c:734f])
 by smtp.gmail.com with ESMTPSA id f18sm5281829wmj.13.2021.06.11.00.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 00:15:15 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
To: Nick Xie <xieqinick@gmail.com>
Cc: robh+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nick <nick@khadas.com>, artem@khadas.com
References: <20210609012849.797576-1-xieqinick@gmail.com>
 <11da3ae4-91d4-1e51-c652-e4ad518f13bd@baylibre.com>
 <CAP4nuTVMZV7pz8NrM2MHcZzBdueRXjS+KYsU4=cQ1CB67gr_Hg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ee3341d9-350e-a84d-6836-3401be679b2a@baylibre.com>
Date: Fri, 11 Jun 2021 09:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP4nuTVMZV7pz8NrM2MHcZzBdueRXjS+KYsU4=cQ1CB67gr_Hg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_001517_606346_7FD100ED 
X-CRM114-Status: GOOD (  22.46  )
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

SGksCgpPbiAxMS8wNi8yMDIxIDA4OjU0LCBOaWNrIFhpZSB3cm90ZToKPiBIZWxsbyBOZWlsLAo+
IAo+IFRoZSBNQ1UgRkFOIHdvbid0IHdvcmsgdW50aWwgdGhlIHRlbXBlcmF0dXJlIHJlYWNoIHRv
IDgwwqBkZWdyZWUgY2VudGlncmFkZSwKPiBEbyB5b3UgdGhpbmsgdGhlIHRlbXBlcmF0dXJlIGlz
IHRvbyBoaWdoPwoKSSB0aGluayA4MCBpcyB0b29sIGhpZ2gsIGJ1dCBJIGZlYXIgNTAgaXMgd2F5
IHRvbyBsb3csIGJ1dCBpZiB5b3UgdGhpbmsgNTAgaXMgT0sgYWZ0ZXIgeW91IHJhbiBzb21lIHRl
c3RzLCBqdXN0IGFkZCBpdCB0byB0aGUgY29tbWl0IGxvZyBhbmQgaXQncyBvayBmb3IgbWUuCgpO
ZWlsCgo+IAo+IFRoYW5rcy4KPiAKPiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20gPG1haWx0bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+IOS6jjIwMjHlubQ25pyIMTHm
l6XlkajkupQg5LiL5Y2IMjo0NOWGmemBk++8mgo+IAo+ICAgICBIaSBOaWNrLAo+IAo+ICAgICBP
biAwOS8wNi8yMDIxIDAzOjI4LCB4aWVxaW5pY2tAZ21haWwuY29tIDxtYWlsdG86eGllcWluaWNr
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gICAgID4gRnJvbTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNv
bSA8bWFpbHRvOm5pY2tAa2hhZGFzLmNvbT4+Cj4gICAgID4KPiAgICAgPiBSZWR1Y2UgdGhlIE1D
VSBGQU4gdHJpZ2dlciB0ZW1wZXJhdHVyZSBmcm9tCj4gICAgID4gODAgZGVncmVlIGNlbnRpZ3Jh
ZGUgdG8gNTAgZGVncmVlIGNlbnRpZ3JhZGUuCj4gCj4gICAgIENhbiB5b3UgYWRkIHNvbWUgbW9y
ZSByYXRpb25hbGUgdG8gdGhpcyBjaGFuZ2UgPwo+IAo+ICAgICA+Cj4gICAgID4gU2lnbmVkLW9m
Zi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbSA8bWFpbHRvOm5pY2tAa2hhZGFzLmNvbT4+
Cj4gICAgID4gLS0tCj4gICAgID7CoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
a2hhZGFzLXZpbTMuZHRzaSB8IDIgKy0KPiAgICAgPsKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAgICA+Cj4gICAgID4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1raGFkYXMtdmltMy5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWtoYWRhcy12aW0zLmR0c2kKPiAgICAgPiBpbmRleCA2
NmQ2NzUyNGIwMzEuLmE5YzM0ZmVlOTFmNCAxMDA2NDQKPiAgICAgPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24ta2hhZGFzLXZpbTMuZHRzaQo+ICAgICA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1raGFkYXMtdmltMy5kdHNpCj4gICAgID4g
QEAgLTI1Niw3ICsyNTYsNyBAQCAmY2VjYl9BTyB7Cj4gICAgID7CoCAmY3B1X3RoZXJtYWwgewo+
ICAgICA+wqAgwqAgwqAgwqB0cmlwcyB7Cj4gICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNw
dV9hY3RpdmU6IGNwdS1hY3RpdmUgewo+ICAgICA+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHRlbXBlcmF0dXJlID0gPDgwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCj4gICAgID4g
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVtcGVyYXR1cmUgPSA8NTAwMDA+OyAv
KiBtaWxsaWNlbHNpdXMgKi8KPiAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCj4gICAgID7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAiYWN0aXZlIjsKPiAgICAgPsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTsKPiAgICAgPgo+IAo+ICAgICBXaXRoIHRoYXQ6Cj4gICAgIFJl
dmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20gPG1haWx0
bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
