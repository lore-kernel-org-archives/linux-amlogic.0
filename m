Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3E9C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xbb+w1XD2Fwfkz2vdGLBcZZR0XIA43xstyVrR14BExg=; b=cIxe39nybNonOU
	va3/slreclCQB/HSQiLLWkG9eFmjWxEBQcuKtDpe0pHp6uSJR40JhseP7VaQ68GQXCIVh7ytrqnt3
	FpYDe9eMImGmLNDyp/TFFXBDO7otiDdNBljpAZ+T+m+m7jg9F2z3/HgtQscfkyVK0QkT+yXEL+UJM
	J355BU4isTxtdmQa050Ou8VYgghWxcsxhRcnrA4ggRv+fU6Y6epxPkl2v8rVIJmWxzyLhzQz1s/qk
	PNwkpunSSAb6wI9QN3cJpdUtxj2Fj4qqdeMCRwVVSL6vAlkrkADK7HGzIpbb6phLsnEEoQ5ds7p2i
	otwQR3pvz75HBn0W/ysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTPu-00CsBT-5A; Thu, 21 Apr 2022 09:48:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTPV-00Crxl-A4; Thu, 21 Apr 2022 09:47:38 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 21 Apr
 2022 17:47:34 +0800
Message-ID: <3c7e9ce4-4c01-4289-2ccd-7050774990fb@amlogic.com>
Date: Thu, 21 Apr 2022 17:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 2/2] tty: serial: meson: Added S4 SOC compatibility
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, <linux-serial@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-3-yu.tu@amlogic.com>
 <3f5df9df-7699-7210-6253-4dd03f4444a0@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <3f5df9df-7699-7210-6253-4dd03f4444a0@baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024737_371857_ADD68CB0 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIyLzQvMjEgMTY6NDksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+IAo+IE9uIDE4LzA0LzIwMjIgMDc6MzIsIFl1IFR1IHdyb3RlOgo+PiBNYWtlIFVB
UlQgZHJpdmVyIGNvbXBhdGlibGUgd2l0aCBTNCBTT0MgVUFSVC4gTWVhbndoaWxlLCB0aGUgUzQg
U09DCj4+IFVBUlQgdXNlcyAxMk1IeiBhcyB0aGUgY2xvY2sgc291cmNlIGZvciBiYXVkIHJhdGUg
Y2FsY3VsYXRpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5j
b20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgOCArKysr
KysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIAo+PiBiL2RyaXZlcnMvdHR5L3Nl
cmlhbC9tZXNvbl91YXJ0LmMKPj4gaW5kZXggNThiZDI3MjNjMDA0Li40Mzk0MWYyMTczNWYgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gKysrIGIvZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+PiBAQCAtNzkwLDExICs3OTAsMTkgQEAgc3Rh
dGljIGludCBtZXNvbl91YXJ0X3JlbW92ZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiArc3RhdGljIHN0cnVjdCBtZXNv
bl91YXJ0X2RhdGEgczRfdWFydF9kYXRlID0gewo+IAo+IFNob3VsZCBiZSBzNF91YXJ0X2RhdGEg
aW5zdGVhZCBvZiBzNF91YXJ0X2RhdGUKPiAKSSB3aWxsIHByZXBhcmUgdGhlIG5leHQgdmVyc2lv
biBhbmQgIGNvcnJlY3QgaXQuCj4+ICvCoMKgwqAgLmhhc194dGFsX2RpdjIgPSB0cnVlLAo+PiAr
fTsKPj4gKwo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl91YXJ0
X2R0X21hdGNoW10gPSB7Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1l
c29uNi11YXJ0IiB9LAo+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNv
bjgtdWFydCIgfSwKPj4gwqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb244
Yi11YXJ0IiB9LAo+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1n
eC11YXJ0IiB9LAo+PiArwqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb24tczQtdWFydCIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZGF0YSA9ICh2b2lk
ICopJnM0X3VhcnRfZGF0ZSwKPiAKPiBIZXJlIHNhbWUKPiAKPj4gK8KgwqDCoCB9LAo+PiDCoMKg
wqDCoMKgIHsgLyogc2VudGluZWwgKi8gfSwKPj4gwqAgfTsKPj4gwqAgTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgbWVzb25fdWFydF9kdF9tYXRjaCk7Cj4gV2l0aCB0aGlzIGNoYW5nZSwgaXQncyBm
aW5lIGZvciBtZS4KPiAKPiBOZWlsCj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
