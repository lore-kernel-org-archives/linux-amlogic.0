Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085BE810AD
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsI5heIz3EV4LaaZnS86S0noyAiUAaVQrlFnaxjcg20=; b=WahdVvC7QIqKbO
	6AmeYV4kqtj4QtB8MDCF+2KLwIEU8R2Gv5xPzJO0zwaeydnVwzE2ueqZnzDNHQqOkayUloWxR9gQF
	HTYz4GvjSp5hjwO0q7PtdUsI5Zvw4Gk8GC7xgSQlKg7lX104PM7ukGnz5g5MxsgS/WbyJHZkcGVnx
	CvddMOnkUs2Rw8+Wcw5alhWqLvyqmID6hsgeaT0eSHpqrZUs9r7QPjiEwxUitiF4+SnsvYz2lqt3r
	XV75j5uZs4ez6ku996gr9A5fRiq4WLInNuMAB2zhCG7C3Iaf7PZbF7seuyEATZVVRwxBRxldlJEY4
	YQWYqz4p136/6/PSq0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlR4t-000Vib-11;
	Wed, 27 Sep 2023 09:43:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlR4p-000VhB-1e
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 09:43:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32329d935d4so5655776f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695807804; x=1696412604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/Vciu3+yHbE6O47q6hpt2TsbRbklZJdjV+A597c9zg=;
        b=Mdjl5VtEcsWiVzF+V0qpgiCQs5RRkbZO74Zm4UFAR81OvtsHB1zpuafnjrqqYe0Qw5
         35b2eWVA5ASiXwNhvilUfOzWr6Q5VNMg8y4weqOvUkTWtTkXmq8S1usQz/dkQWv+JfAe
         5L0DSEwq60e5+izRbuQXS42wD4QXw6ikvr/SEa9ecqIRLovsM4YY7QPuQVQ9y6MvIABU
         YOqmSUpQIMlFCpOrhS+g5Swc9VgjrNqw7HPDaKFuvh6o/e/LCLEZ+hyA5YcoJz43ltVB
         Pqjv0WbQvRR0GBQ0vAXAfR5WG0q4aw1S6WgbBNhqcjgew00sDHfcuqohDc5Q61uu3ZHh
         PUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807804; x=1696412604;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/Vciu3+yHbE6O47q6hpt2TsbRbklZJdjV+A597c9zg=;
        b=GZmu4inv0Axl3QOk3FyqvW2RDk+3vT9WQcAd4mazsscMmO9W4xQS9jlo+2t0HeTpet
         mWE952iR7UeoW/RQuPTlutFiIRV+WBXKOnbjlOF6mj4RTEebgKbobRd/r3ZA/8kZi+ig
         H0QUy2Nbr1Cx08rQbU/LMchXAnpw5sezl+WCEGFEhajgCUJ/3+dVHIt+XbqL+e6H5aZL
         a/sGRN2hRTl/Te9ntj26IFrK0ycwjNFBVzcy+1PlZHxvYb5EqBcrArfFlUUzi7GyI1A1
         j59vJ0Izw9E4fl/S7bW2oHrFTmoss9wl9nQf6vqSkIwv3+Eou+nmOT/1BInVu+cEhHYx
         FIsQ==
X-Gm-Message-State: AOJu0YxVNwqqPVbRx5zTx6I2jWvWiGww7yDmwNRzXc/MwsKGMP7RDB9t
	Xo1XnRltkD1/uRiPhxFQ7Ou+IQ==
X-Google-Smtp-Source: AGHT+IGGV6+4F4z4U+nloZLbx1bb64PnR6aspmMiWtP8Fw3PjRsqTIUVvuvyt37IYY4jaWlUCSXjww==
X-Received: by 2002:adf:eb82:0:b0:31f:a259:73c with SMTP id t2-20020adfeb82000000b0031fa259073cmr1241534wrn.27.1695807803801;
        Wed, 27 Sep 2023 02:43:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:99be:56aa:a730:ad2d])
        by smtp.gmail.com with ESMTPSA id g16-20020adfa490000000b003232380ffd5sm8660245wrb.106.2023.09.27.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:43:23 -0700 (PDT)
References: <20230927072544.764285-1-Rong.Chen@amlogic.com>
 <202309271651027503622@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Rong.Chen@amlogic.com" <Rong.Chen@amlogic.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
Date: Wed, 27 Sep 2023 11:30:37 +0200
In-reply-to: <202309271651027503622@amlogic.com>
Message-ID: <1jil7wkl39.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_024327_572976_1BEE1666 
X-CRM114-Status: GOOD (  27.69  )
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

Ck9uIFdlZCAyNyBTZXAgMjAyMyBhdCAxNjo1MSwgIlJvbmcuQ2hlbkBhbWxvZ2ljLmNvbSIgPFJv
bmcuQ2hlbkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IEhpIEplcm9tZSwKPgo+IFNvY3MgY29udGFp
bmluZyBwcmV2aW91cyBjb250cm9sbGVycyBhcmUgZ3hsLCBneG0sIGd4YmLvvIxnMTJi77yMZzEy
Ye+8jHNtMe+8jGF4ZywgYTHvvIxzNCBhbmQgdDcuCgpUaGF0IGlzIG1vc3RseSBhbGwgdGhlIFNv
QyB3ZSBrbm93IG9mIGluIG1haW5saW5lIC4uLiBUaGlzIHdoeSB0aGUgd2F5CnlvdSBleHBsYWlu
ZWQgaXMgY29uZnVzaW5nLgoKQW5kIGJlbG93LCB5b3Ugc2F5ICdvbiBsYXRlc3QgY29udHJvbGxl
cnMnLCBva2F5IGJ1dCB3aGljaCBvbmVzID8KCj4gVGhlIGJpdCBDTURfQ0ZHX0VSUk9SIGlzIHVz
ZWQgZm9yIHNlbGVjdGluZyBTRyBMSU5LIG9mIGRhdGEgYWRkcmVzcyBvbiBsYXRlc3QgY29udHJv
bGxlcnPvvIxidXQKPiBkYXRhIGFkZHJlc3MgZG9uJ3QgdXNlIFNHIExJTksgYXQgcHJlc2VudO+8
jHNvIGl0IHdpbGwgY2F1c2UgYW4gSVJRIGFuZCBzdG9wIHdvcmtpbmcgb24gbGF0ZXN0IGNvbnRy
b2xsZXJzLgo+IFRoZXJlZm9yZSwgcmVtb3ZlIHRoaXMgc2V0dGluZy4KCk5vdCB0b3RhbGx5IHN1
cmUgd2hhdCBTRyBMSU5LIGJ1dCBva2F5LgoKV2hpbGUgdGhlIGNoYW5nZSBpdHNlbGYgaXMgZmlu
ZSB5b3UgcmVhbGx5IG5lZWQgcmVmb3JtdWxhdGUgdGhlIGRlc2NyaXB0aW9uLgpCYXNlZCBvbiB5
b3VyIGV4cGxhbmF0aW9uLCBzb21ldGhpbmcgbGlrZToKLS0tCkZvciB0aGUgdDcgYW5kIG9sZGVy
IFNvQyBmYW1pbGllcywgdGhlIENNRF9DRkdfRVJST1IgaGFzIG5vIGVmZmVjdC4KU3RhcnRpbmcg
ZnJvbSBTb0MgZmFtaWx5IFhZWiwgaXQgd2lsbCBzZWxlY3QgU0cgTElOSyBvbiBlcnJvciBidXQg
dGhpcwppcyBjYXVzaW5nIGEgcHJvYmxlbSB3aXRoIHRoZSBkYXRhIGFkZHJlc3MgLi4uIGJsYWJs
YWJsYQotLS0KClBsZWFzZSBleHBhbmQgYSBiaXQgb24gdGhpcywgdHJ5IHRvIG1ha2UgaXQgY2xl
YXJlci4KQWxzbywgcGxlYXNlIGluc2VydCB0aGUgcHJvcGVyIGZpeGVzIHRhZwoKTGFzdCwgbWFr
ZSBzdXJlIHRwIHJlcGx5IHdpdGggcGxhaW4gdGV4dCBlbWFpbHMsIG90aGVyd2lzZSBsaXN0cyB3
aWxsCmRyb3AgeW91ciByZXBseSBhbmQgcGxlYXNlIGRvIG5vdCB0b3AgcG9zdC4KClRoeAoKPgo+
IFRoYW5rcy4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gUm9uZy5DaGVuQGFtbG9naWMuY29tCj4KPiAgIAo+ICBGcm9t
OiBKZXJvbWUgQnJ1bmV0Cj4gIERhdGU6IDIwMjMtMDktMjcgMTU6NDMKPiAgVG86IFJvbmcuQ2hl
bjsgVWxmIEhhbnNzb247IE5laWwgQXJtc3Ryb25nOyBLZXZpbiBIaWxtYW47IE1hcnRpbiBCbHVt
ZW5zdGluZ2wKPiAgQ0M6IGxpbnV4LW1tYzsgbGludXgtYXJtLWtlcm5lbDsgbGludXgtYW1sb2dp
YzsgbGludXgta2VybmVsCj4gIFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1tYzogbWVzb24tZ3g6IFJl
bW92ZSBzZXR0aW5nIG9mIENNRF9DRkdfRVJST1IKPiAgW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1h
aWwgZnJvbSBqYnJ1bmV0QGJheWxpYnJlLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50
IGF0Cj4gIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4g
ICAKPiAgWyBFWFRFUk5BTCBFTUFJTCBdCj4gICAKPiAgcwo+ICBPbiBXZWQgMjcgU2VwIDIwMjMg
YXQgMTU6MjUsICJSb25nLkNoZW4iIDxSb25nLkNoZW5AYW1sb2dpYy5jb20+IHdyb3RlOgo+ICAg
Cj4gID4gRnJvbTogUm9uZyBDaGVuIDxyb25nLmNoZW5AYW1sb2dpYy5jb20+Cj4gID4KPiAgPiBT
ZXR0aW5nIGJpdCBDTURfQ0ZHX0VSUk9SIGhhcyBub24gZWZmZWN0cyBvbiBwcmV2aW91cyBjb250
cm9sbGVycy4KPiAgIAo+ICBXaGljaCBwcmV2aW91cyBjb250cm9sbGVycyA/IHYyLCB2MyA/IENh
biB5b3UgbGlzdCB0aGUgU29DcyBwbGVhc2UgPwo+ICAgCj4gID4gSG93ZXZlciwgaXQgd2lsbCBj
YXVzZSBhbiBJUlEgYW5kIHN0b3Agd29ya2luZyBvbiBsYXRlc3QgY29udHJvbGxlcnMsCj4gICAK
PiAgSXNuJ3QgaXQgZGVzaXJhYmxlIHRvIHN0b3Agb24gZXJyb3IgPyBzZWVtcyBsaWtlIGEgc2Fu
ZSB0aGluZyB0byBkby4KPiAgIAo+ICA+IFRoaXMgYml0IGlzIHVzZWQgZm9yIHNlbGVjdGluZyBT
RyBMSU5LIG9mIGRhdGEgYWRkcmVzcy4KPiAgPiBEb24ndCBzZXQgdGhlIGJpdCBDTURfQ0ZHX0VS
Uk9SIGFueW1vcmUgdG8gcmVzb2x2ZSB0aGlzIGlzc3VzZS4KPiAgIAo+ICBJJ20gbm90IHN1cmUg
SSB1bmRlcnN0YW5kIHRoZSBhY3R1YWwgaXNzdWUgYmVpbmcgcmVzb2x2ZWQuCj4gIENvdWxkIHlv
dSBwcm92aWRlIG1vcmUgZGV0YWlscyBwbGVhc2UgPwo+ICAgCj4gID4KPiAgPiBUaGVyZWZvcmUs
IHJlbW92ZSB0aGlzIHNldHRpbmcuCj4gID4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBSb25nIENoZW4g
PHJvbmcuY2hlbkBhbWxvZ2ljLmNvbT4KPiAgPiAtLS0KPiAgPiAgZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1neC1tbWMuYyB8IDEgLQo+ICA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+
ICA+Cj4gID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9k
cml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gID4gaW5kZXggOTgzN2RhYjA5NmU2Li5j
N2MwNjdiOTQxNWEgMTAwNjQ0Cj4gID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1t
bWMuYwo+ICA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiAgPiBAQCAt
ODAxLDcgKzgwMSw2IEBAIHN0YXRpYyB2b2lkIG1lc29uX21tY19zdGFydF9jbWQoc3RydWN0IG1t
Y19ob3N0ICptbWMsIHN0cnVjdCBtbWNfY29tbWFuZCAqY21kKQo+ICA+Cj4gID4gICAgICAgY21k
X2NmZyB8PSBGSUVMRF9QUkVQKENNRF9DRkdfQ01EX0lOREVYX01BU0ssIGNtZC0+b3Bjb2RlKTsK
PiAgPiAgICAgICBjbWRfY2ZnIHw9IENNRF9DRkdfT1dORVI7ICAvKiBvd25lZCBieSBDUFUgKi8K
PiAgPiAtICAgICBjbWRfY2ZnIHw9IENNRF9DRkdfRVJST1I7IC8qIHN0b3AgaW4gY2FzZSBvZiBl
cnJvciAqLwo+ICA+Cj4gID4gICAgICAgbWVzb25fbW1jX3NldF9yZXNwb25zZV9iaXRzKGNtZCwg
JmNtZF9jZmcpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
