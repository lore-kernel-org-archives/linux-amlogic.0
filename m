Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C193C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 01:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuKYpH7/AAON/d7ulkMi+jp5Q3ESoqmgsnv1BSLFi0M=; b=PO7BzVpZu/8OZ/
	aXOQ1HWG3+1NMANu4JHMxBpQhzz4TF54g7hccGl0UDhq7+6aPOYRzVGJH/65pZPZipjTe1P3qfBPt
	o2nNIxXP6SdXXfjLojfVCGDOuUEO2ZS9rss/TEumBFHw9qb3YM5yGDOfo/SOkRVVxpfVwjuxeezqa
	IxTkcxIdh7a3jjDC/Ig0nzt9Ue34utk/embKtDx8yq2hsZPunQuaw+WyC581DCpHbQ1v1nBYKXpKn
	zfLXNEehFQpI5YNZZF06ZLJ1gmpHYiQFTJDuJ8NNKn4l2K1Jd5a8Rsp83dUjH5XedT4NXPONfCAMm
	rfwZ1R0cERaqQSym4+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGsDY-002Ia7-Kv; Thu, 28 Jul 2022 01:21:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGsDV-002IX7-7U
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 01:21:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so319736wmo.0
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 18:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Cxp1c3BTumIa+oetWVz5ChWxRwi9acisZtSdnbq5CfQ=;
        b=QUw3kZLyF/ngAUJTs99Vp8oy0IIEqSrS3bqix/vKauqObNVg78C+ZWrGHYoh6L7fAo
         Q6okHBlBgE7OMmMqIEGKu4bnBqV2Mtv+QfPYVVpc3NB7mp6oBrbcpVXvWpXtkX3lcUaN
         EJB/W+x/DmANqx+SFw1zjGlnkanDnGkTFzxCz+nZP7l0lEzB5V+cqAXvDvvdtY33FykO
         HXdvPAFjRlRQQHDIC2ANyH7yH4VDsmngwRYsmgd/Y8hzXBoraAogg8mBq9BSvGrqgnbZ
         NGfSZ5nux/u+09qjOjwS2aTbEH9vF7qd5shyq6x0HJZfWvn3YQX8JEsbeRYP6QI77kua
         bB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Cxp1c3BTumIa+oetWVz5ChWxRwi9acisZtSdnbq5CfQ=;
        b=bSSgQVzK0FnjL7B6WKBcFm49/fe87C4SJ2izv702Q2JNIaQqmkKDq1tRiYtn1WQu8q
         9tDz3pjNF4MqLE51a6vAevFgVQSSTb+k65axbZqkOxPQNiet0Vv205RNYeflnqIqkxu8
         vZk+eXrELVeQFOXXZbPJxZKfwMhRjNhL1aYX13Y66rAv9ZmqOSpUBPSF38V9gkzHKpRm
         aNjrMNk7WrqDKze3jiADw/SqC5UpU5QxurruQ/xyMhh8rYT0/Ks8WbQ1dWizeX6k3Hdr
         vY0zkRcAf0jnR7ga2WlcvXTgE3j0k+m/2KLzDgejR+U3DNXYF2aAlG7KyepjfYQbZWpP
         2C+A==
X-Gm-Message-State: AJIora+pGZ77QNZ9WQbbqtZIFbVMd1etCmRqN8I/Ejv1/ZSTD6bbpT0N
	j6L09z6EbTiZW1pOUwHiNWM=
X-Google-Smtp-Source: AGRyM1v27SyKb+DQwAMOBq0K68BhSI7SXTjacmDoMDEvKcUHoAPSOXXqUJJbHAw3eZVTDDULo7jhVA==
X-Received: by 2002:a05:600c:19c9:b0:3a3:469f:c1e7 with SMTP id u9-20020a05600c19c900b003a3469fc1e7mr4626173wmq.141.1658971290276;
        Wed, 27 Jul 2022 18:21:30 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d548a000000b0021e6c52c921sm15966887wrv.54.2022.07.27.18.21.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jul 2022 18:21:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
Date: Thu, 28 Jul 2022 05:21:25 +0400
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 sean@mess.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <8CBF7318-B6E4-46D9-AFF2-8839459D4C54@gmail.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
To: Zhang Ning <zhangn1985@qq.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_182133_333217_6710E1AD 
X-CRM114-Status: UNSURE (   9.19  )
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

Cj4gT24gMjggSnVsIDIwMjIsIGF0IDM6NDggYW0sIFpoYW5nIE5pbmcgPHpoYW5nbjE5ODVAcXEu
Y29tPiB3cm90ZToKPiAKPiBPbiBXZWQsIEp1bCAyNywgMjAyMiBhdCAwNToyNzoyNVBNICswMjAw
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAyNi8wNy8yMDIyIDE2OjM2LCBaaGFu
ZyBOaW5nIHdyb3RlOgo+Pj4gQWRkIG1hbnVmYWN0b3IgYmluZGluZ3MgZm9yIFRtYWxsCj4+PiBB
ZGQgdGhlIGJvYXJkIGJpbmRpbmdzIGZvciBNYWdpY2JveCBNMTZTIFR2IEJveAo+Pj4gCj4+PiBT
aWduZWQtb2ZmLWJ5OiBaaGFuZyBOaW5nIDx6aGFuZ24xOTg1QHFxLmNvbT4KPj4gCj4+IFBsZWFz
ZSBzZW5kIHBhdGNoZXMgd2l0aCBjb3JyZWN0IHN1YmplY3QgUEFUQ0guCj4gSSBnb3QgY29uZnVz
ZWQsIGFuZCBkb24ndCBrbm93IGhvdyB0byB1cGRhdGUuLgo+IAo+IGFkMTUyZGFlZGM1YyBkdC1i
aW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgTWFnaWNCb3ggTTE2UyBiaW5kaW5ncwo+IDNmN2Ri
ZDMzNmYzNiBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgVmVybyA0SysgYmluZGluZ3MK
PiAyY2E4ODliMTIwMTYgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIEg5Ni1NYXggYmlu
ZGluZ3MKPiAKPj4gCj4+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+Cj4gCj4gQ2hyaXN0aWFuIEhld2l0dCB0b2xkIG1lIHRvIHNw
bGl0IHRvIDIgcGF0Y2hlcywgMXN0IGZvciBtYW51ZmFjdG9yLCAybmQKPiBmb3IgZGV2aWNlLCBo
b3cgdG8gaGFuZGxlIHlvdXIgQWNrZWQtYnk/CgpIZWxsbyBaaGFuZy4gTGV04oCZcyB3b3JrIG9m
Zi1saXN0IHRvIGdldCB0aGluZ3MgY29ycmVjdGVkIGJlZm9yZSB5b3Ugc2VuZAphbm90aGVyICho
b3BlZnVsbHkgZmluYWwpIHZlcnNpb24uIEnigJltIGhhcHB5IHRvIGV4cGxhaW4gYW5kIGNvYWNo
IHlvdSBvbgp0aGUgcHJvY2Vzcy4KCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
