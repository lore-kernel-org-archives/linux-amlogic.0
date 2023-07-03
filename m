Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F38C001B3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxy6AVYDb0ONtrgFj6uBZJK07z6jcn3BYOo0qRAErZ4=; b=JE3sndRlAEMGpU
	sMA9XHHqc73XPx4xCk5FY5yININ2V3D5cnt/oqAHPmG9qOx8RXMiTXhFLuOwD26zhdcwCJ9uUxjOh
	ywbM+xu95ts3bpo6rtl7JWW7q3HGu+n41h/T1ZB5NQDEMMAE9FZ3CvEsFhnz5AGpE4lsZXV6aTYol
	sm+fJ/MPO0mF7ZLsO4q0u9srrP9eVYM7Lp7d/F8/Fqm8omNitQaPK+bicrDgDR5IIqOFaYX+8zFzZ
	DfIK5G+U8ZZj9Q3Zh/oq6fMvjz5Dr2vT14BmCZbt8bFVyohiMbtpL2oP4OFkwfLZuHp66/OjnWv6r
	ZCVnS0SggGAfnJTw+Vsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPOf-00BJDg-26;
	Mon, 03 Jul 2023 19:39:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPOc-00BJBw-26;
	Mon, 03 Jul 2023 19:39:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98e39784a85so866548566b.1;
        Mon, 03 Jul 2023 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688413170; x=1691005170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdjkuxl/GUliSxC/S2QPSFDglKe6XiR3aOWV0ZWOlb4=;
        b=g1kyzjevyoXXKeHjjlgynN3FOG9+O0T0TtBhpgTF1z6GxBZOUGwbfQOX2RFqHweX8B
         aeY5lBPpLNLzKCAV100DRAted5wVzer8ri5wT9V32+tuEJbMjlZEZbuFGbf1cDB2oADB
         d6vFoGhAOFQxVoTRBzvUAOZdtcTCyxkwN5neyVe0k/ufmse8ItCUPqs0f6dH71z/ZNQ4
         OjaQFhoZ4YivRxGapsHn28mjnFVLqZ37JrvvSnvjrf9Szi2HC13o6Qm/zmjhMA627Hhv
         ikGlFsDMEIlELhcKJ4SfVL4GDVp9jQ1FHjV492al4CtsssLMPPaIzgbwzkJQIUls0Naz
         63JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688413170; x=1691005170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdjkuxl/GUliSxC/S2QPSFDglKe6XiR3aOWV0ZWOlb4=;
        b=WZPDLT/mXMUnl7lGNTZzK94+Sdv7XwoDjChHwLP0BYrdQezd6wHdqdgKJLz7ICGh07
         BP4CAxSy3frDU350lHGcBaAhO3ZWxoRBJ72T//wa6sw/wPDEkv2h39xlKHnxB5u5GZhD
         3nq+KKxUj6+TaSJiJ2WWkhDnzzuK0J4Mp5sjQp1cp+RdTxulWqUh0+cDLw7rAGzYfeVG
         xNC5+MK0nfmd4GG77a0ESnheZAD/KlFEZbJVV6LtXPRodNfSwn+9Tty8Kxwjw1cUMgXU
         7U5a2g2JFTIWQkxiWLJb3MNDXS5+dEgDZEgfj3F9mUC6TiM71hk/UAP/UpKijemGY8sN
         kD/w==
X-Gm-Message-State: AC+VfDzdZ6QNm3Rra4DMaXzfLnWpydoW56YZFa6C1Ac0/KV2RdJwiZrN
	K3ZzvZHVZRUHSDMVJshYEiRXZlW/bEldPz7/5YRwmZ8Y
X-Google-Smtp-Source: ACHHUZ5yJ1O+Nu4jbUOL3a//8AgofkNaJfks09G2X24TJviwMgiZA5A56CY6N6UMcOqyu+rzF+YhpQRf0wCFknZm2fs=
X-Received: by 2002:a17:907:6e8a:b0:989:21e4:6c6d with SMTP id
 sh10-20020a1709076e8a00b0098921e46c6dmr14474331ejc.28.1688413169631; Mon, 03
 Jul 2023 12:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
 <20230627224017.1724097-6-gnstark@sberdevices.ru> <20230702172116.00006f33@Huawei.com>
In-Reply-To: <20230702172116.00006f33@Huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Jul 2023 21:39:18 +0200
Message-ID: <CAFBinCCLt-o_QX0izmtzs8MA=ETMAhEib3KDr-6Z66n__GVkyA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] meson saradc: support reading from channel 7 mux inputs
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: George Stark <gnstark@sberdevices.ru>, jic23@kernel.org, lars@metafoo.de, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	andriy.shevchenko@linux.intel.com, nuno.sa@analog.com, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_123938_689320_515B9B2E 
X-CRM114-Status: GOOD (  11.93  )
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

SGkgSm9uYXRoYW4sCgpPbiBTdW4sIEp1bCAyLCAyMDIzIGF0IDExOjIx4oCvQU0gSm9uYXRoYW4g
Q2FtZXJvbgo8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiB3cm90ZToKWy4uLl0KPiA+IEBA
IC0yMzUsNiArMjQ5LDI3IEBAIGVudW0gbWVzb25fc2FyX2FkY19jaGFubmVsX2luZGV4IHsKPiA+
ICAgICAgIE5VTV9DSEFOXzcsCj4gPiAgICAgICBOVU1fQ0hBTl9URU1QLAo+ID4gICAgICAgTlVN
X0NIQU5fU09GVF9USU1FU1RBTVAsCj4KPiBTaWxseSBxdWVzdGlvbi4uLiBXaHkgZG9lcyB0aGlz
IGRldmljZSBoYXZlIHRpbWVzdGFtcCBjaGFubmVscz8KPiBJdCBoYXMgbm8gYnVmZmVyIHN1cHBv
cnQgc28gdGhleSBkb24ndCAnZG8gYW55dGhpbmcnLgo+IElmIGl0IGhhZCB0aGVuIHB1dHRpbmcg
b3RoZXIgY2hhbm5lbHMgYWZ0ZXIgdGhhdCBtaWdodCBoYXZlIGJyb2tlbgo+IHRoaW5ncyBpZiBu
b3QgZG9uZSB2ZXJ5IGNhcmVmdWxseSAoaGVuY2UgSSB3ZW50IGxvb2tpbmcpClRoaXMgcXVlc3Rp
b24gaXMgcHJvYmFibHkgZm9yIG1lIChub3QgR2VvcmdlKS4KVGhlIGFuc3dlciBpcyBzaW1wbGU6
IHdoZW4gSSB3cm90ZSB0aGUgTWVzb24gU0FSIEFEQyBkcml2ZXIgSSBsb29rZWQKYXQgdmFyaW91
cyBvdGhlciBkcml2ZXJzIChidXQgY2FuJ3QgcmVjYWxsIHdoaWNoIG9uZXMgZXhhY3RseSkuIE9u
ZSBvZgp0aGVtIHByb2JhYmx5IHVzZWQgYSBzb2Z0IHRpbWVzdGFtcCBjaGFubmVsIHNvIEkgYWxz
byBhZGRlZCB0aGF0IHRvCm1lc29uX3NhcmFkYy4gU2luY2UgIml0IGRpZG4ndCBicmVhayBhbnl0
aGluZyIgSSB0aG91Z2h0IGl0IHdvdWxkIGJlCmZpbmUuCgpOZXdlciBTQVIgQURDIElQIGJsb2Nr
cyBoYXZlIGJ1ZmZlciBzdXBwb3J0LCBidXQgdGhhdCdzIG5vdAppbXBsZW1lbnRlZCBpbiB0aGUg
ZHJpdmVyICh5ZXQpLgpTbyBpZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3RseSB3ZSBjYW4gZHJv
cCB0aGUgc29mdCB0aW1lc3RhbXAKY2hhbm5lbCAod2l0aCBhIGRlZGljYXRlZCBwYXRjaCBpbiB0
aGlzIHNlcmllcyk/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
