Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497C2C77B7C
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 May 2023 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olo5Xhm5H3laNcUvQQ2/k+KjgyQ2Xqric5fGaKKxu6w=; b=O0qj70YyXV8XeU
	L52aTfCq3SYDXbBcIXK4FHyan5VbddkowWicbSMQsGTtU4yb4YgDYwPNUqQxgpAnXd0JtVWFPtMs8
	NXgiQIzg0kGm4IK1b6owH12CZfQ8mmbfUmt/ulxrWDmsLkD1ZZ3k8gzpNsMA9jaXjyU3a0c9vZVHS
	3a0eM9+zcCALwGF87EH56XRbsLXXiiY9Kjam58C6aCDfp5IbCsCJ08VK5w7Df9VxQGoJmM2M+jfNn
	7w6CGf8SS6BrEYwxU3cAlH+9gtnIPemCizCRq5tiKhOmLk7sr6TMAeOWZDLEvDUbV0lL9t3YINqQH
	W7DwGZgu/ToMUnbKE27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0epH-003S6g-0u;
	Sun, 21 May 2023 08:54:03 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0epE-003S5i-0a;
	Sun, 21 May 2023 08:54:01 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-75afeacb5e4so94764385a.3;
        Sun, 21 May 2023 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684659235; x=1687251235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEIrP2ynpjpmZmVLItYY+rNU7ObAmm9vuXWERHD5GRU=;
        b=ST1pQhAY8zUonWh1liTdSJ9j7v/hDgthAFgILkfcxi45vkQc3G8QRUcfP+y9nu2KwA
         l4wE1CQt9UdkqXi79C/5vUnjAtVaGYe0rPXsUrFv1/cz0CgPXogrHjSd3PBuwzq1caQX
         fV7ni8gC8vZWgDMxFpRtvSe5vMSPDdsx/OL/81/uIrS4UgtoxCnvSKsAaZ3d3z26B5Ea
         DW3Ilxw5K3VQc4K4zhg9l8sx+ckiAEFZPgrPiqjGBz3BaJ9hGElT/LkZeZKYc5SRJ8JF
         3YoxtdkrhdnisGE02CKYjm9+Y9KlucNVulLe9/If4BeAZjjYf/qOq+/ympibu5iGR750
         lFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684659235; x=1687251235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEIrP2ynpjpmZmVLItYY+rNU7ObAmm9vuXWERHD5GRU=;
        b=Z28BAFl2FOCLxKqxXDoR51oDh62ihBqYQ0Ld/2/WnUZmvhG+eJnB1bgT5oOiuE7+Du
         yFVnzB2kZWnpNOdeRjb8r16GqPmksE80w4BPy01iCgKRpMAl7lzI1uj0GN/ncnGtY8nf
         AqxhKYWvVtp64Nl1QOCMoh3uGY2EmVxw7uUVOA5P6eEakgRT/XLA/qMNhLDrKHdiO+TV
         pUBj2/Jl+xh5bQZGEmDvK13eRSA5Pk0DfwdHFlxkdAG45t4OkJALZgQBg6VIij8s48EM
         cP2sbJlg+FywpaZfw9iq3nZcl9Dv8U/wugrBqmbUBJFmoDUnvS17DxcfQtW3oCJnn2/U
         xmAw==
X-Gm-Message-State: AC+VfDx2EiqsZCYKgtIOoAB1/jPhoMbNqNcpIt18rq06AScD6Kg2Lkj7
	K7Y7KsLtcWCcpeiQFNrDTE9TxfHLmHnsSvJXulU=
X-Google-Smtp-Source: ACHHUZ6Z2pP9QjNcRZjEfdfq0bpt+soUrXi6Q3GIPCsRITb5cwsQAg6J8GvUL5nww5ZFgbGQm+YwX9aaD1UulpmaEHU=
X-Received: by 2002:ac8:5d8d:0:b0:3f5:543:4c3f with SMTP id
 d13-20020ac85d8d000000b003f505434c3fmr12959562qtx.66.1684659235216; Sun, 21
 May 2023 01:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <f0966e95-43c7-e6f6-8aeb-05f27691cec3@sberdevices.ru> <20230520164618.08f26fd9@jic23-huawei>
In-Reply-To: <20230520164618.08f26fd9@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 21 May 2023 11:53:19 +0300
Message-ID: <CAHp75VenNPOK7X=vOoZE2rGyC46q4qdNOgSDbDMqV+Gdigm81Q@mail.gmail.com>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?B?0KHRgtCw0YDQuiDQk9C10L7RgNCz0LjQuSDQndC40LrQvtC70LDQtdCy0LjRhw==?= <GNStark@sberdevices.ru>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "khilman@baylibre.com" <khilman@baylibre.com>, 
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_015400_223290_F64876C9 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBNYXkgMjAsIDIwMjMgYXQgNjozMOKAr1BNIEpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgMTcgTWF5IDIwMjMgMTY6NDc6NTkgKzAwMDAK
PiDQodGC0LDRgNC6INCT0LXQvtGA0LPQuNC5INCd0LjQutC+0LvQsNC10LLQuNGHIDxHTlN0YXJr
QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiA+IE9uIDUvMTYvMjMgMjI6MDgsIE1hcnRpbiBCbHVt
ZW5zdGluZ2wgd3JvdGU6CgouLi4KCj4gPiBJJ3ZlIGNoZWNrZWQgZGF0YXNoZWV0cyBvZiBhbGwg
Y2hpcHMgbGlzdGVkIGluIG1lc29uX3Nhcl9hZGNfb2ZfbWF0Y2ggYXJyYXkgaW4gbWVzb25fc2Fy
YWRjLmMgYW5kIGV2ZXJ5d2hlcmUgdGhpcyBmaWVsZCBpcyA2IGJpdHMgbG9uZy4gQWNjb3JkaW5n
IHRvIGRyaXZlciBjb2RlIGFuZCBleGlzdGluZyBkdHMgZmlsZXMgdGhpcyBwYXRjaCBhZmZlY3Rz
IGFsbCBzdXBwb3J0ZWQgY2hpcHMgZXhjZXB0IG1lc29uOC4KPgo+IE9uIHRoYXQgbm90ZSwgZG8g
d2Ugd2FudCB0byBhZGQgYW55IGNsYXJpZnlpbmcgdGV4dCBvbiB0aGUgc2NvcGUgdG8gdGhlCj4g
Y29tbWl0IG1lc3NhZ2U/CgpXZSBzaG91bGQsIEkgdGhpbmssIGJ1dCBhY2NvcmRpbmcgdG8gTWFy
dGluJ3MgbWVzc2FnZSwgYXMgSSBtYXkKaW50ZXJwcmV0IGl0LCB0aGUgZGF0YXNoZWV0IG1heSBh
bHNvIGJlIHdyb25nIGFuZCBzb21lIGV4cGVyaW1lbnRzIG9uCmEgcmVhbCBoYXJkd2FyZSBzaG91
bGQgcHJlcGVuZCBhbnkgY2hhbmdlIGluIHRoZSBjb2RlLgoKCi0tIApXaXRoIEJlc3QgUmVnYXJk
cywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
