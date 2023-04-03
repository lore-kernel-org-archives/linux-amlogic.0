Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5899C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJN3SRUjnEYADmD2+UGYqY31nAxKdylimxdzO5s3hOM=; b=3bXdUkh1FnLGVX
	TGjV73XZlsIHcfyMe3YjoDYxF8GBdEcHVy/WMRcZbFt/Pmr4Bv9UHpcQ8CTYOt+5FqBd6j4rEmDFW
	bA0/v05zKdnLViUBqirsChlAvoKmfN2xx3IcT29bqm8r9B5RMs2mw9MEVX6Qqk1jxnYJQdXb1yz2Y
	na7oKOUTOaRaxp/cGwtl6VbdKCs7JGhhx0UBzbaTjp6ej3pcBaD7SuLzt/iMcxb95TaFGnZelp/us
	2XTHn2EbMdSaIlXz1hJUaI4uwOPWwIehmOSGCHSKvVeFEnNwPm5g4N8pxrCO37GTQFHHATL4d3uvN
	Eq2QLbjBYOeWjUXZ6XEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQjH-00Gbor-2C;
	Mon, 03 Apr 2023 20:24:39 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQjF-00Gbmb-2F;
	Mon, 03 Apr 2023 20:24:38 +0000
Received: by mail-qk1-x734.google.com with SMTP id dw4so8687135qkb.10;
        Mon, 03 Apr 2023 13:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680553475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/ExHCytE0KsKoc5jrSwhaa1cz3PFYyRhULgZC7gW7Q=;
        b=kLg9nH51oc0t5hg3KdC0+JKn6Z/Omou9jm/jyeSriZPuc2d93Qv4K/3/77Yk5NNHuP
         Lz7r4n6hdmuFKMxz9RhTg8/BlwkFIz/LGJnwGLqQMfEWE7hdd1Hqd/UZRiMfi2jLV+Xg
         OzzIzwDkRzxq9CCOEGx4sgLmJdIZQjhhwLvfXsbABTl2/OTIlhEwPO2/S/b3jpbjoB02
         QIWfDIONUX4pRsy/Hx3Z6QpuDWykcvutmsyV270y8bnhiIpIkZyV/J5Xm6taFjLy28Qp
         VJMdNgGnUSrfMakm1ThWuoE/EBSTTmvCBNuJmHRhI/Sj2wcbZFtnzNvQV8KU4SoclbAj
         +jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680553475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/ExHCytE0KsKoc5jrSwhaa1cz3PFYyRhULgZC7gW7Q=;
        b=X+zuedmwDVbvkYPrt1gTYvLFBnb8mLTXbgCLXFoZy3VNcQLDUfhv2I8sIhyKw4WJTy
         m36CY/WcdTLJRv0cgbgBNsdV9vn27spN6Bi8rCsZIthJmrd1SWlbaesmvEwfsawxLiLg
         BjAH4aZkjfyowaRWKqFK79th3c5yOuuXRPz0uBUCyQL00Ffgv9y6rZ++eMXiwMemLYnJ
         TN9e3fPD0F2SemPLvXj6ozlmCEs9KNlkxSGMqLUF8mWzdfwGXeLbJq/B7iyhP0kaGVCV
         1jBvPxKCZaEjSZPf61Mz8iTMgpg4WShzisXwTLaLLXkZvPz9NUxj10zJ42zLNSutF5VB
         bSgQ==
X-Gm-Message-State: AAQBX9fa93GTwN08OEntxAoiPxc4gQs6IW0Bi3RT3vlGKcn/Wjjqh1EH
	YJwfmxfyOm0EHuwN9mhyScVJ7X9gkvnUNALV3cY=
X-Google-Smtp-Source: AKy350amFBKA73lgqKcJqzmDy4FiiqtuaOB6aweBRSgdaq7zhmGJ0eFAvYIc6qgXv+WAHXLYPtXFGnIdcH8z3YtSLrQ=
X-Received: by 2002:a05:620a:178f:b0:742:9899:98fb with SMTP id
 ay15-20020a05620a178f00b00742989998fbmr85984qkb.7.1680553475088; Mon, 03 Apr
 2023 13:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
In-Reply-To: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Mon, 3 Apr 2023 13:24:24 -0700
Message-ID: <CAFXsbZq=uzfFjkYw3eWuTjvcGpn6TSoc_OJYCwgthr5jU9qBpQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: enable edpd tunable support
 for G12A internal PHY
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_132437_748143_9CD977C7 
X-CRM114-Status: GOOD (  16.31  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCAxMjozNeKAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRW5hYmxlIEVEUEQgUEhZIHR1bmFibGUgc3VwcG9y
dCBmb3IgdGhlIEcxMkEgaW50ZXJuYWwgUEhZLCByZXVzaW5nIHRoZQo+IHJlY2VudGx5IGFkZGVk
IHR1bmFibGUgc3VwcG9ydCBpbiB0aGUgc21zYyBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBI
ZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25l
dC9waHkvbWVzb24tZ3hsLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYyBiL2RyaXZl
cnMvbmV0L3BoeS9tZXNvbi1neGwuYwo+IGluZGV4IDNkZWE3Yzc1Mi4uYmI5YjMzYjZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L3BoeS9tZXNvbi1neGwuYwo+IEBAIC0yMTAsNiArMjEwLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgcGh5
X2RyaXZlciBtZXNvbl9neGxfcGh5W10gPSB7Cj4gICAgICAgICAgICAgICAgIC5yZWFkX3N0YXR1
cyAgICA9IGxhbjg3eHhfcmVhZF9zdGF0dXMsCj4gICAgICAgICAgICAgICAgIC5jb25maWdfaW50
ciAgICA9IHNtc2NfcGh5X2NvbmZpZ19pbnRyLAo+ICAgICAgICAgICAgICAgICAuaGFuZGxlX2lu
dGVycnVwdCA9IHNtc2NfcGh5X2hhbmRsZV9pbnRlcnJ1cHQsCj4gKwo+ICsgICAgICAgICAgICAg
ICAuZ2V0X3R1bmFibGUgICAgPSBzbXNjX3BoeV9nZXRfdHVuYWJsZSwKPiArICAgICAgICAgICAg
ICAgLnNldF90dW5hYmxlICAgID0gc21zY19waHlfc2V0X3R1bmFibGUsCj4gKwo+ICAgICAgICAg
ICAgICAgICAuc3VzcGVuZCAgICAgICAgPSBnZW5waHlfc3VzcGVuZCwKV2h5IGFkZCB0aGUgZW1w
dHkgbGluZXMgYmVmb3JlIGFuZCBhZnRlciB0aGUgdHdvIG5ldyBsaW5lcz8KCj4gICAgICAgICAg
ICAgICAgIC5yZXN1bWUgICAgICAgICA9IGdlbnBoeV9yZXN1bWUsCj4gICAgICAgICAgICAgICAg
IC5yZWFkX21tZCAgICAgICA9IGdlbnBoeV9yZWFkX21tZF91bnN1cHBvcnRlZCwKPiAtLQo+IDIu
NDAuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
