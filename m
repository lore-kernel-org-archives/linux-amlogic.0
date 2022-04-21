Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCFC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWGN2jmLr3UKgaetNDh+ujzMkKDdbRLbZ1+Y492RJ7w=; b=xQACxrhZ3rYwPB
	73iEtsaUE6wd/AAbMG40CIs5K548Z/ug8p+RmI9gS4TAOWPJf6s/ahkC10mx62d6kJOUnD4k5qarb
	9WpuJQnpxYFAiCntamCJYOV3a0L/G6Vh/pbz+i4Yf4ryCnOGl+fMJWXYDL8TWjh6+AkFE06ImmebV
	qLtzWZ23ZvWUKu7j5Xm4BCkd/FeM1Vg2Jut0+ZHZGC3NAWshZkbhCqSAxGkrnsvUJFC7bn1KBbZZt
	wi0bWZ2Hmp1NwD6/t6T3JbS09p3pgsln2TSVDv6/U7veGjo9Q4R2lbNc/3Jbabrgr4jsKHuPwW95u
	e2IbjBwRQQAQ4EiYJLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTOa-00CrUc-1G; Thu, 21 Apr 2022 09:46:40 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTOE-00CrKy-1H; Thu, 21 Apr 2022 09:46:19 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 21 Apr
 2022 17:46:08 +0800
Message-ID: <b6067d55-4800-b533-2ec7-02166977c825@amlogic.com>
Date: Thu, 21 Apr 2022 17:46:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
CC: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Jiri Slaby <jirislaby@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
 <ea86eee0-409c-2d19-3669-35a8eaded53e@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <ea86eee0-409c-2d19-3669-35a8eaded53e@baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024618_090993_2D1A6DC0 
X-CRM114-Status: GOOD (  11.75  )
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

SGkgTmVpbCwKCk9uIDIwMjIvNC8yMSAxNjo0NiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gSGkgQW5keSwKPiAKPiBPbiAxOC8wNC8yMDIyIDE0OjA5LCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+IE9uIE1vbiwgQXByIDE4LCAyMDIyIGF0IDg6NTAgQU0g
WXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Cj4+PiBBIC8yIGRpdmlkZXIgb3Zl
ciBYVEFMIHdhcyBpbnRyb2R1Y2VkIHNpbmNlIEcxMkEsIGFuZCBpcyBwcmVmZXJyZWQKPj4+IHRv
IGJlIHVzZWQgb3ZlciB0aGUgc3RpbGwgcHJlc2VudCAvMyBkaXZpZGVyIHNpbmNlIGl0IHByb3Zp
ZGVzIG11Y2gKPj4+IGNsb3NlciBmcmVxdWVuY2llcyB2cyB0aGUgcmVxdWVzdCBiYXVkcmF0ZS5F
c3BlY2lhbGx5IHRoZSBCVCBtb2R1bGUKPj4KPj4gJ2UuIEUnIChtaW5kIHRoZSBzcGFjZSkKPj4K
Pj4+IHVzZXMgM01oeiBiYXVkIHJhdGUuIDhNaHogY2FsY3VsYXRpb25zIGNhbiBsZWFkIHRvIGJh
dWQgcmF0ZSBiaWFzLAo+Pj4gY2F1c2luZyBzb21lIHByb2JsZW1zLgo+Pgo+PiAuLi4KPj4KPj4+
ICtzdHJ1Y3QgbWVzb25fdWFydF9kYXRhIHsKPj4+ICvCoMKgwqDCoMKgwqAgYm9vbCBoYXNfeHRh
bF9kaXYyOwo+Pgo+PiBJIHdvdWxkIHByZWZlciB0byBzZWUgdGhpcyBhcyBhbiB1bnNpZ25lZCBp
bnQgYW5kIHdpdGggYSBsZXNzCj4+IHBhcnRpY3VsYXIgbmFtZSwgZS5nLiB4dGFsX2RpdiB3b3Vs
ZCBzdWZmaWNlLgo+Pgo+Pj4gK307Cj4+Cj4+IC4uLgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHh0YWxfZGl2ID0gMzsKPj4KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwcml2YXRlX2RhdGEgJiYgcHJpdmF0ZV9kYXRhLT5oYXNf
eHRhbF9kaXYyKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgeHRhbF9kaXYgPSAyOwo+Pgo+PiBCZXR0ZXIgdG8gZGVmaW5lIHByaXZhdGEgZGF0YSBh
bHdheXMKPiAKPiBXaGlsZSBJJ20gaW4gZmF2b3Igb2YgZGVmaW5pbmcgcHJpdmF0ZSBkYXRhLCBo
ZXJlIDMgYW5kIDIgYXJlIGFjdHVhbGx5IAo+IHRoZSB2YWx1ZXMKPiAyIGFuZCAzIHVzZWQgdG8g
ZGl2aWRlLgo+IAo+IFRoZSBjb2RlIGlzIGVhc3kgdG8gcmVhZCBhbmQgd2UgcXVpY2tseSB1bmRl
cnN0YW5kIHRoaXMgdmFsdWUgaXMgdGhlIAo+IGNsb2NrIGRpdmlkZXIuCj4gClRoZXJlZm9yZSwg
dGhpcyBwbGFjZSBzaG91bGQgYmUgbW9kaWZpZWQgYWNjb3JkaW5nIHRvIHlvdXIgcHJldmlvdXMg
CnN1Z2dlc3Rpb24uSSB3aWxsIHByZXBhcmUgdGhlIG5leHQgdmVyc2lvbi4KPj4KPj4KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gQU1MX1VB
UlRfQkFVRF9YVEFMX0RJVjI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gRElWX1JPVU5EX0NMT1NFU1Qo
cG9ydC0+dWFydGNsayAvIHh0YWxfZGl2LCAKPj4+IGJhdWQpIC0gMTsKPj4KPj4KPiAKPiAuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
