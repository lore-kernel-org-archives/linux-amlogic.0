Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE46C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnkQ6gCca40jtQE3skKBu6xFyKevKNaamPnyrrzmdcQ=; b=t7axdyaQZsFuKp
	CflDcnyoIP1ZVmSpasNjKphlMt9abz8+qxxbn5WrTobFpNTVHoRb8Cv5mzAoQ/TsiUyGIsvr9NSI8
	Uvl1QtJmb83EapJ78AppZJNsmTlQK8NFlChkIJ5vHs/Fv9GAdGGMuyoDJS8zrnGOlbSxbZWizEvRz
	vMoyqo2rcBSMhCMC96FJ2gcFsevHB2S4Nc3sCwqNGC3jtblKMQ7vPekuDEiuaYvgbaRCIlB0YGbuI
	grB6vyTRr4uphxCNe7LWfPkY/3JbU1QJB3Gom7XG90+OzZPkevZ+AOMJDWfKiQG8XM3ZVSecv8IRE
	kArW3NTB8Y0B0g9N2atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbii-00C8Pv-HQ; Tue, 22 Nov 2022 22:26:24 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbif-00C8Ow-A3
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 22:26:23 +0000
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id xbiZoVuRqzQOKxbiZoPBam; Tue, 22 Nov 2022 23:26:18 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 22 Nov 2022 23:26:18 +0100
X-ME-IP: 86.243.100.34
Message-ID: <a3c848f9-d825-f9ff-eb6e-a3575d9871ff@wanadoo.fr>
Date: Tue, 22 Nov 2022 23:26:14 +0100
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
X-CRM114-CacheID: sfid-20221122_142621_503683_A677A3F7 
X-CRM114-Status: GOOD (  15.70  )
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
ciB0b2RheTogWzBdCgpGdW5ueS4KQSBmaWxlIHVudG91Y2hlZCBmb3IgYWJvdXQgMTggbW9udGhz
IGFuZCAyIHBhdGNoZXMgYXJvdW5kIHRoZSBzYW1lIGxpbmUsIAouLi4gdGhlIHNhbWUgZGF5IQoK
PiBDb3JlbnRpbiwgQ2hyaXN0b3BoZSwgd2hhdCBkbyB5b3UgdGhpbms/CgpPYnZpb3VzbHksIG1p
bmUgaXMgYmV0dGVyIDopCgpNb3JlIHNlcmlvdXNseSwgSSB0aGluayBpdCBpcyBtb3N0bHkgYSBt
YXRlciBvZiB0YXN0ZSBhbmQgdGhhdCBib3RoIGFyZSAKZmluZS4gTmVpdGhlciBvbmUgd2lsbCBt
YWtlIGEgcmVhbCBkaWZmZXJlbmNlIElSTC4KCkkgZ3Vlc3MgdGhhdCBtZW1vcnkgYWxsb2NhdGlv
biBmYWlsdXJlIGluIHByb2JlIGFyZSB1bmxpa2VseSBhbmQgc2F2aW5nIAo2NCBieXRlcyAoNDAg
Zm9yIGRldm1fICsgMiB4IDQgPSA0OCwgcm91bmRlZCB0byA2NCBieXRlcykgd29uJ3QgbWFrZSBh
bnkgCnJlYWwgZGlmZmVyZW5jZS4KClVwIHRvIHlvdS4KCkNKCj4gCj4gCj4gQmVzdCByZWdhcmRz
LAo+IE1hcnRpbgo+IAo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlw
dG8vMGRmMzBiYmYtM2I3ZS1lZDIwLWUzMTYtNDExOTJiZjNjYzJiQGxpbmFyby5vcmcvVC8jbTZh
NDViNDQyMDZjMjgyZjEwNmQzNzliMDFkMTkwMjc4MjNjNWQ3OWIKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
