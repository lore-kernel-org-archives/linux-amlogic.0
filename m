Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF8F557FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sH4DRlhyd9b6c0x6cpeR4mUEVyN7j1c9SuPTPSvkKnM=; b=0K6wbk/lc+7KRPELFWdYEwSN7K
	JO7YxzzbMZ+cubirtCYFJYw7/F3xjhkUfnK3uR12xzgJF0NeQiy5AQkqN0/dxFyth3iUUcDmSlmw2
	3DzeEZwV0XYj1DahgIdr5u7QQY9Mhvtohyhj2HpYo/K/KXLPev8LwS9FOUuYW69qEs5rtKqaUhYJh
	04MQ0LGajidqEZsSDgAmUGw0KozOF861kUfGMr+GR2rS6MMEUQvGFAhkJ1t7XKeDNtpWQGfh0JnBB
	6SiVBdwLxjjxZ8IhHWc3YwsnAK+3JPyE+A6F0j4vRz5OF8Itlebgc4UvAnKeOMCkkKelt+PnhrAS7
	Xa1HlLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElOz-00000006hvX-05hI;
	Mon, 20 Apr 2026 09:58:49 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElOv-00000006huf-0JuG
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 09:58:48 +0000
Date: Mon, 20 Apr 2026 09:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776679119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kvD2DikviA++89KX8OaJkmvE5pvGQ/4eoowpnanR1U=;
	b=l9Q+SfqX30Qbs4KOt9Td3MQlmR+ub2/x8RzsNtI1ikkuTqvGUHqL/7fQSxj4+MPO0w/lPr
	NEf8ZTUZ4MYvbPtcFkMzHF854I7iUPa+mZO39ehgSm85T6DYrbCa3wF/UtSpqdZ+3MFZU7
	zMYqG5I2ke+s7B5IWmHES5F8yKqLtickGuWLgp3wu/SRnw7ZUnY8ZN+VNDwG86vPyDjQPJ
	u4uH795JJPYgjjHH2hfcnr0aFPMtEPAaAs26qfZ6B6zdFa5zN/8Ky4FZjjSM7vLBVgNaie
	e+7+a7NIDNiCPjbLeaZlH3OMxJ4CK6dzJi2zUmpCmiQ9DNNaBKV3PpIoxEb8Xg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, funderscore@postmarketos.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at
Subject: Re: [PATCH v2 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdsedm.2ad0jjpxzfm46@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025846_554364_4F1DDE87 
X-CRM114-Status: GOOD (  11.05  )
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

SGksCgpPbiBNb24sIDIwIEFwciAyMDI2IDA2OjE4LCBjaHJpc3RpYW4ua29ldmVyLWRyYXhsQHN0
dWRlbnQudWliay5hYy5hdCB3cm90ZToKPkZyb206IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1E
cmF4bCA8Y2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ+Cj4KPlN1cHBv
cnRlZCBmZWF0dXJlczoKPi0gMUdCLzJHQiBSQU0gKHZpYSBVLUJvb3QgbWVtb3J5IGZpeHVwKQo+
LSAxMC8xMDAgRXRoZXJuZXQgKEludGVybmFsIFBIWSkKPi0gZU1NQyBhbmQgU0QgY2FyZCBzdG9y
YWdlCj4tIFBXTS1iYXNlZCBDUFUgdm9sdGFnZSByZWd1bGF0aW9uCj4tIFVBUlQgKFNlcmlhbCBj
b25zb2xlKQo+Cj5DaGFuZ2VzIGluIHYyOgo+LSBTcGxpdCBkdC1iaW5kaW5ncyBhbmQgZHRzIGNo
YW5nZXMgaW50byBzZXBhcmF0ZSBwYXRjaGVzLgo+LSBVcGRhdGVkIG1vZGVsIHN0cmluZyB0byBt
YXRjaCBkb2N1bWVudGVkIHZlbmRvciBwcmVmaXguCj4tIFB1dCB2ZGRpb19zZCBzdGF0ZXMgYXJy
YXkgaW4gYSBzaW5nbGUgbGluZS4KPi0gQWRkZWQgYSBjbGFyaWZ5aW5nIGNvbW1lbnQgZm9yIHRo
ZSB1bnN1cHBvcnRlZCBBbWxvZ2ljIFcxNTBTMSBXaS1GaSBtb2R1bGUuCj4KPk5vdGVzOgo+LSBU
aGUgY29uc29sZSB1c2VzIHVhcnRfYiBhdCA5MjE2MDAgYmF1ZC4KPi0gVmVyaWZpZWQgbWVtb3J5
IHZpYSAvcHJvYy9kZXZpY2UtdHJlZTsgVS1Cb290IHBhdGNoZXMgdGhlIG5vZGUgdG8gYXJvdW5k
IDJHQi4KPi0gVGVzdGVkIG9uIHRoZSAyR0IgUkFNIHBsdXMgMTZHQiBlTU1DIHZhcmlhbnQuCj4K
ClNvcnJ5IEkgd2FzIG5vdCBjbGVhciwgYnV0IHRoZSBwYXRjaGVzIG5lZWQgdG8gaGF2ZSBhIGRl
c2NyaXB0aW9uLgoKY2hlY2twYXRjaC5wbCBzaG91bGQgY29tcGxhaW4gYWJvdXQgdGhpcy4gUGxl
YXNlIHVzZSBpdCB0byBjaGVjayB0aGF0CnlvdXIgcGF0Y2hlcyBhcmUgaW4gdGhlIGNvcnJlY3Qg
Zm9ybWF0LgoKU2VlIHRoZSBrZXJuZWwgZG9jcyBhYm91dCBzZW5kaW5nIHBhdGNoZXMgaGVyZToK
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNk
ZXNjcmliZS15b3VyLWNoYW5nZXMKCj5DaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgKDIp
Ogo+ICBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgWDk4USBjb21wYXRpYmxlCj4gIGFy
bTY0OiBkdHM6IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZvciBYOThRCj4KPiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sICAgICAgfCAgIDcgKwo+IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArCj4gLi4uL2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tczQtczkwNXcyLXg5OHEuZHRzIHwgMjUwICsrKysrKysrKysrKysrKysrKwo+
IDMgZmlsZXMgY2hhbmdlZCwgMjU4IGluc2VydGlvbnMoKykKPiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LXM5MDV3Mi14OThxLmR0cwo+Cj4t
LSAKPjIuNTMuMAoKLS0KQmVzdCByZWdhcmRzLApGZXJhc3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
