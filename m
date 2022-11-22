Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B218C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN9dUQNMnxR/o7226omHkLWV+o3sxIWNa9PM78LjUgE=; b=4YTOodiF0/Qy3A
	2Y9xh13OqmlP6mIoAnDhuA8oDSaui/wyzl2beoc9qpRaWdntODcljcXkEwbi3PdzwjY4KolSNGeTI
	F7wQ9kvxeYv1oCe+YYmrbRmOsNm8YdjZXiMQMZ6ZXru2kirydyYEl2R/CK+Xf3Vl2towOZSf62tZL
	pO7CMPNA7lBYqz+jhoaavwJYXNkT15/J9G/bfvhZos5oX419A4am5i3Fc0Zl0+HSIXe5qG6Li8CaJ
	eXkjhB5KdDkRJE3AMqif53XfPs59ly9UQOxn4jr09Ft2bJ8TnJMyMeJk5rtnqwww52Ifrt21X6k57
	7HY4igNYR5nNcRo5UGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbsi-00CARA-4k; Tue, 22 Nov 2022 22:36:44 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbsf-00CAPj-7k
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 22:36:42 +0000
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id xbsaozAnSpJKlxbsaorx22; Tue, 22 Nov 2022 23:36:38 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 22 Nov 2022 23:36:38 +0100
X-ME-IP: 86.243.100.34
Message-ID: <a83e5419-c19f-764f-9860-08385d7dd757@wanadoo.fr>
Date: Tue, 22 Nov 2022 23:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] crypto: amlogic - Save a few bytes of memory
Content-Language: fr, en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <c797dc5e9248498918916a6eeedaa25de2196e8c.1669154149.git.christophe.jaillet@wanadoo.fr>
 <CAFBinCAEwYaEvmGjen_LPO52BcyUFD2EKtzzzfZ1rMuVuihEqA@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAFBinCAEwYaEvmGjen_LPO52BcyUFD2EKtzzzfZ1rMuVuihEqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_143641_436770_CDF3EEA8 
X-CRM114-Status: GOOD (  16.08  )
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

TGUgMjIvMTEvMjAyMiDDoCAyMzowMiwgTWFydGluIEJsdW1lbnN0aW5nbCBhIMOpY3JpdMKgOgo+
IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDEwOjU3IFBNIENocmlzdG9waGUgSkFJTExFVAo+IDxj
aHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4+Cj4+IFRoZXJlIGlzIG5vIHJl
YWwgcG9pbnQgaW4gYWxsb2NhdGluZyBkZWRpY2F0ZWQgbWVtb3J5IGZvciB0aGUgaXJxcyBhcnJh
eS4KPj4gTUFYRkxPVyBpcyBvbmx5IDIsIHNvIGl0IGlzIGVhc2llciB0byBhbGxvY2F0ZWQgdGhl
IG5lZWRlZCBzcGFjZQo+PiBkaXJlY3RseSB3aXRoaW4gdGhlICdtZXNvbl9kZXYnIHN0cnVjdHVy
ZS4KPj4KPj4gVGhpcyBzYXZlcyBzb21lIG1lbW9yeSBhbGxvY2F0aW9uIGFuZCBhdm9pZHMgYW4g
aW5kaXJlY3Rpb24gd2hlbiB1c2luZyB0aGUKPj4gaXJxcyBhcnJheS4KPiAuLmFuZCBpdCBldmVu
IGZpeGVzIGEgbWlzc2luZyBkZXZtX2tjYWxsb2MgZXJyb3IgY2hlY2sKPiAKPiBQZXJzb25hbGx5
IEkgcHJlZmVyIHRoaXMgYXBwcm9hY2ggb3ZlciBhIHBhdGNoIHRoYXQgd2FzIHNlbnQgZWFybGll
ciB0b2RheTogWzBdCj4gQ29yZW50aW4sIENocmlzdG9waGUsIHdoYXQgZG8geW91IHRoaW5rPwo+
IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPiAKPiAKPiBbMF0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtY3J5cHRvLzBkZjMwYmJmLTNiN2UtZWQyMC1lMzE2LTQxMTkyYmYzY2My
YkBsaW5hcm8ub3JnL1QvI202YTQ1YjQ0MjA2YzI4MmYxMDZkMzc5YjAxZDE5MDI3ODIzYzVkNzli
Cj4gCgpVbnJlbGF0ZWQsIGJ1dCBJIHRoaW5rIHRoYXQgbWVzb25faXJxX2hhbmRsZXIoKSBuZWVk
cyBhIHNtYWxsIGFqdXN0ZW1lbnQgCnRvIGF2b2lkIHByaW50aW5nIGEgc3B1cmlvdXMgbWVzc2Fn
ZSBpZiByZWFkbCgpIHJldHVybnMgMC4KCk1heWJlIHNvbWV0aGluZyBsaWtlIHRoYXQ/OgoKCkBA
IC0zMyw5ICszMywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbWVzb25faXJxX2hhbmRsZXIoaW50
IGlycSwgdm9pZCAqZGF0YSkKICAJCQkJd3JpdGVsX3JlbGF4ZWQoMHhGLCBtYy0+YmFzZSArICgo
MHg0ICsgZmxvdykgPDwgMikpOwogIAkJCQltYy0+Y2hhbmxpc3RbZmxvd10uc3RhdHVzID0gMTsK
ICAJCQkJY29tcGxldGUoJm1jLT5jaGFubGlzdFtmbG93XS5jb21wbGV0ZSk7Ci0JCQkJcmV0dXJu
IElSUV9IQU5ETEVEOworCQkJfSBlbHNlIHsKKwkJCQlkZXZfZXJyKG1jLT5kZXYsICIlcyAlZCBH
b3QgaXJxIGZvciBmbG93ICVkIGJ1dCBjdHJsIGlzIGVtcHR5XG4iLCAKX19mdW5jX18sIGlycSwg
Zmxvdyk7CiAgCQkJfQotCQkJZGV2X2VycihtYy0+ZGV2LCAiJXMgJWQgR290IGlycSBmb3IgZmxv
dyAlZCBidXQgY3RybCBpcyBlbXB0eVxuIiwgCl9fZnVuY19fLCBpcnEsIGZsb3cpOworCQkJcmV0
dXJuIElSUV9IQU5ETEVEOwogIAkJfQogIAl9CgoKQ0oKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
