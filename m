Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAF2C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX7Rre/wYkaUQXHZ6xsYz1J3sAzV/O+FfPmmskduEd8=; b=WwJtwNrvK2hfs47+Ys7aufQkcY
	FRs5UfRTpPv9dR3b4DAZY10ToGekBssnsGUGIMTWIAhIq9CUZAvR5AtREra5G8X+vzJGBUhNnpKxh
	fhaj74rrQKx/bxxi8dSx0wccE/K7vgfGCwlfOtFUFwlcb5E5wMBlLCpeMVs4GqtmhU4WD365/jNtQ
	hLOMSrtHZcHa0ACrMh/OOG7fxLPcTp9yssOwJcAzWxI+3TustzPj1kiof41X9+tLI7FMo1bCvcDfn
	vuhGsI1GyPDY29MSVXCW7xWMFkROYKLnTl/TrChx3xhYgyligLcLFV6RHr0Tu2p9FEfimkzzUsIWV
	n3HpwqRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY14U-003vUO-Mb; Sat, 26 Mar 2022 07:42:50 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY14R-003vTr-Lx; Sat, 26 Mar 2022 07:42:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 279FD33E13; Sat, 26 Mar 2022 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648280558; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GdswsmakIGiG00f5bOpw3wFaYlXB/0e6UaDzcr3aGeY=;
 b=NnewmZU6MUqVXZuiCiGX+6fi1CF7H3F2Ymci/0vR4FHIebuRQpXLn4ugT8Pjkb6a7jMeei
 AKF0sCpysLxTtoMyvadOdTPJuKB8OkBdICEbVESkNFnEnPe+pWVQe6L8FUT/zdhHE3H4OG
 /sGgxr7us4P0fUW/hDXAuaN1Tilbn9qlISHaahk7sWT21y+jtTsWmbVx14PJQCzSJ88c/0
 FhUZvVITSzeXmTzPm0ydy1YApSPWuCoD9goW6ofQCncGQkNC0FWW9r/nxX4IfwrauSKF+o
 xVZF9Dzlt93rDfJ40yyQsMdfPfduAyPgHAw19S7z8g7x37NQThJLchcQNXEq8w==
Message-ID: <b5205abb-745f-933e-bd36-53c8aa168f3f@lexina.in>
Date: Sat, 26 Mar 2022 10:42:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] arm64: meson: update dts for JetHub devices
Content-Language: ru
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220325165501.81551-1-adeep@lexina.in>
 <394573e1-0786-75ef-65fa-4b75d57714f2@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <394573e1-0786-75ef-65fa-4b75d57714f2@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_004248_083702_0B5CD218 
X-CRM114-Status: UNSURE (   7.18  )
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

CgoyNS4wMy4yMDIyIDIwOjM0LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBIaSwKPiAKPiBPbiAy
NS8wMy8yMDIyIDE3OjU0LCBWeWFjaGVzbGF2IEJvY2hhcm92IHdyb3RlOgo+PiBVcGRhdGUgZHRz
IGZvciBKZXRIdWIgSDE6Cj4+IC0gYWRkIGJsdWV0b290aCBub2RlIGZvciBSVEw4ODIyQ1MgdWFy
dCBwb3J0Cj4+Cj4+IFVwZGF0ZSBkdHMgZm9yIEpldEh1YiBEMToKPj4gLSBhZGQgWmlnQmVlIHNl
cmlhbCBhbGlhcyAodHR5QU1MMikgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkKPj4gLSB1cGRh
dGUgdm9sdGFnZSByZWd1bGF0b3JzIGFuZCBTRElPIGNvbmZpZyB0byBtYXRjaCBib2FyZCdzIHJl
ZmVyZW5jZSAKPj4gZGVzaWduCj4+Cj4+IFZ5YWNoZXNsYXYgQm9jaGFyb3YgKDMpOgo+PiDCoMKg
IGFybTY0OiBtZXNvbjogYWRkIHRvIGR0cyBmb3IgSmV0SHViIEgxIGJsdWV0b290aCBub2RlCj4+
IMKgwqAgYXJtNjQ6IG1lc29uOiBkdHM6IHVwZGF0ZSBkdHMgZm9yIEpldEh1YiBEMQo+PiDCoMKg
IGFybTY0OiBtZXNvbjogZml4IHNkaW8gaW4gZHRzIGZvciBKZXRIdWIgRDEKPj4KPj4gwqAgLi4u
L2FtbG9naWMvbWVzb24tYXhnLWpldGhvbWUtamV0aHViLWoxMDAuZHRzwqDCoCB8IDE3ICsrKysr
KysrKysrKystLS0tCj4+IMKgIC4uLi9tZXNvbi1neGwtczkwNXctamV0aG9tZS1qZXRodWItajgw
LmR0c8KgwqDCoMKgwqAgfMKgIDUgKysrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+IAo+IENhbiB5b3UgYWRkIEZpeGVzOiB0YWcg
aW4gYWxsIHBhdGNoZXMgc28gdGhleSBnZXQgYmFja3BvcnRlZCA/CkJsdWV0b290aCBub2RlIHVw
ZGF0ZSBkZXBlbmRzIG9uIGNvbW1pdCAKYjA1MGM1YmJiYmNjZmI5ZTZjYmYyOWM4ZWU3YTQxYzFi
YmE5NzJiZGYgKEJsdWV0b290aDogYnRydGw6IEFkZCBzdXBwb3J0IApmb3IgUlRMODgyMkMgaGNp
X3ZlciAweDA4KSwgd2hpY2ggc2VlbXMgdG8gYXBwZWFyIG9ubHkgaW4gNS4xOApUaGUgcmVzdCBh
cmUgY29zbWV0aWMgY2hhbmdlcywgbm90IGFmZmVjdGluZyB0aGUgZnVuY3Rpb25hbGl0eS4KVGhh
bmtzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
