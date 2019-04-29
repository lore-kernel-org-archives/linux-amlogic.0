Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F61C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D56F2063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rck/PtXS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="TCJfhTf+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D56F2063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lRFEwF7B3RV6OCGwMRzbVApp3tLYfzPCwJ1FYoRNtCA=; b=Rck/PtXS8S8E+aLgaq/HVYGak
	9eGfVqxYGR89SYAxJ5eRzjZkvYDubtG5dH/1toV81HbPrxV8SFcR2cilIGN6P5ZxcpUXb3uuXpwfz
	X1kVNxqi7S9OOdX105ciOLD7X4rKhA6MIvRUrHJ/G8ekUJzhaCzxL2bRINjz0JtMxzmyBbF+AwflQ
	PRGH38Wp/Tf8NRbRSjCU51vtAr056pUuTNSSMZgdC7e1ljSHrL8++oF2yCGehZbmt7oNpMgg7HaYc
	4bBLBXGA951L8iPqjoRWtbH3i+azBmXWcl1CMG+9tW6AYMzY65EP1OM+FDAiympjdY7KKCJ0mQb2Q
	Oh+IAZndg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8dh-00010k-SY; Mon, 29 Apr 2019 15:56:21 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8dd-00010M-VN
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:56:19 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8Qg1H7zz9vD3T;
 Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TCJfhTf+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e4zvibUn7XuO; Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Qg01MLz9vD3G;
 Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556553371; bh=MAsrBDvhnJttPasnsN8gBilzLEIc1tXHx2VDi8YmxeA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TCJfhTf+GtIv6E3INZukOMu5Yh2lbbCEwQPfE+Jza9vNBWj1fGcVlvS9y5bh8WQEf
 A7u5vGY3+mSGrzSQnBl5pVv9YKko+vqC2/RZ1Df503Iz9uiAHImnTg5AE5lZEFW3ho
 5D0sxY1tKt7QvFSa0C7DrgwII8Apaq2alR/vHwLs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 325D98B8B4;
 Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lnR_i6xj-pyv; Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D48808B8B3;
 Mon, 29 Apr 2019 17:56:15 +0200 (CEST)
Subject: Re: [PATCH 23/41] drivers: tty: serial: cpm_uart: fix styling issues
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-24-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <df50792f-88bc-379a-d9e1-4f2dc1f4965a@c-s.fr>
Date: Mon, 29 Apr 2019 17:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-24-git-send-email-info@metux.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_085618_305641_F011288F 
X-CRM114-Status: GOOD (  15.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAyNy8wNC8yMDE5IMOgIDE0OjUyLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3Vs
dCBhIMOpY3JpdMKgOgo+IEZpeCBjaGVja3BhdGNoIGVycm9yczoKCldoYXQgdGhlIG1haW4gcHVy
cG9zZSBvZiB0aGlzIGNoYW5nZSA/CgpJZiB3ZSBhcHBseSB0aGlzLCBhbnkgZml4IHRvIHN0YWJs
ZSB3aWxsIGJlIGEgbmlnaHRtYXJlIHRvIGJhY2twb3J0LiBJcyAKaXQgcmVhbGx5IHdvcnRoIGl0
ID8KCkFueXdheSwgYSBjb3VwbGUgb2YgY29tbWVudHMgaW4gdGhlIHBhdGNoIGJlbG93CgpbLi4u
XQoKPiAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCA8aW5mb0BtZXR1eC5uZXQ+
Cj4gLS0tCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnQuaCAgICAgIHwg
MTAgKy0tCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY29yZS5jIHwg
OTUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9j
cG1fdWFydC9jcG1fdWFydF9jcG0xLmggfCAgNCArLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL2Nw
bV91YXJ0L2NwbV91YXJ0X2NwbTIuYyB8ICA2ICstCj4gICA0IGZpbGVzIGNoYW5nZWQsIDY0IGlu
c2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKWy4uLl0KCj4gCj4gQEAgLTEwNDgsOSArMTA1
OCwxMCBAQCBzdGF0aWMgdm9pZCBjcG1fdWFydF9lYXJseV93cml0ZShzdHJ1Y3QgdWFydF9jcG1f
cG9ydCAqcGluZm8sCj4gICBzdGF0aWMgaW50IHBvbGxfd2FpdF9rZXkoY2hhciAqb2J1Ziwgc3Ry
dWN0IHVhcnRfY3BtX3BvcnQgKnBpbmZvKQo+ICAgewo+ICAgCXVfY2hhcgkJYywgKmNwOwo+IC0J
dm9sYXRpbGUgY2JkX3QJKmJkcDsKPiAgIAlpbnQJCWk7Cj4gICAKPiArCXZvbGF0aWxlIGNiZF90
CSpiZHA7Cj4gKwoKVGhpcyB3YXMgbGlrZWx5IGEgZmFsc2UgcG9zaXRpdmUgZnJvbSBjaGVja3Bh
dGNoLiBUaGUgZm9ybWF0dGluZyB3YXMgCmdvb2QsIGFuZCBub3cgaXQgaXMgd3JvbmcgYXMgaXQg
YWRkcyBhbiB1bm5lY2Vzc2FyeSBibGFuayBsaW5lLgoKPiAgIAkvKiBHZXQgdGhlIGFkZHJlc3Mg
b2YgdGhlIGhvc3QgbWVtb3J5IGJ1ZmZlci4KPiAgIAkgKi8KPiAgIAliZHAgPSBwaW5mby0+cnhf
Y3VyOwoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9j
cG1fdWFydF9jcG0yLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3Bt
Mi5jCj4gaW5kZXggYTBmY2NkYS4uMTU0YWMxOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYwo+IEBAIC0xMTcsOCArMTE3LDcgQEAgaW50IGNwbV91
YXJ0X2FsbG9jYnVmKHN0cnVjdCB1YXJ0X2NwbV9wb3J0ICpwaW5mbywgdW5zaWduZWQgaW50IGlz
X2NvbikKPiAgIAlpZiAoaXNfY29uKSB7Cj4gICAJCW1lbV9hZGRyID0ga3phbGxvYyhtZW1zeiwg
R0ZQX05PV0FJVCk7Cj4gICAJCWRtYV9hZGRyID0gdmlydF90b19idXMobWVtX2FkZHIpOwo+IC0J
fQo+IC0JZWxzZQo+ICsJfSBlbHNlCj4gICAJCW1lbV9hZGRyID0gZG1hX2FsbG9jX2NvaGVyZW50
KHBpbmZvLT5wb3J0LmRldiwgbWVtc3osICZkbWFfYWRkciwKPiAgIAkJCQkJICAgICAgR0ZQX0tF
Uk5FTCk7CgpDaGVja3BhdGNoIHNob3VsZCBoYXZlIHRvbGQgeW91IHRoYXQgaW4gY2FzZSBmaXJz
dCBsZWcgaGFzIGJyYWNlcywgCnNlY29uZCBsZWcgbXVzdCBoYXZlIGJyYWNlcyB0b28gZXZlbiBp
ZiBpdCdzIGEgc2luZ2xlIGxpbmUuCgpDaHJpc3RvcGhlCgoKPiAgIAo+IEBAIC0xNDgsNyArMTQ3
LDggQEAgdm9pZCBjcG1fdWFydF9mcmVlYnVmKHN0cnVjdCB1YXJ0X2NwbV9wb3J0ICpwaW5mbykK
PiAgIAlkbWFfZnJlZV9jb2hlcmVudChwaW5mby0+cG9ydC5kZXYsIEwxX0NBQ0hFX0FMSUdOKHBp
bmZvLT5yeF9ucmZpZm9zICoKPiAgIAkJCQkJCQkgIHBpbmZvLT5yeF9maWZvc2l6ZSkgKwo+ICAg
CQkJICBMMV9DQUNIRV9BTElHTihwaW5mby0+dHhfbnJmaWZvcyAqCj4gLQkJCQkJIHBpbmZvLT50
eF9maWZvc2l6ZSksICh2b2lkIF9fZm9yY2UgKilwaW5mby0+bWVtX2FkZHIsCj4gKwkJCQkJIHBp
bmZvLT50eF9maWZvc2l6ZSksCj4gKwkJCSAgKHZvaWQgX19mb3JjZSAqKXBpbmZvLT5tZW1fYWRk
ciwKPiAgIAkJCSAgcGluZm8tPmRtYV9hZGRyKTsKPiAgIAo+ICAgCWNwbV9kcGZyZWUocGluZm8t
PmRwX2FkZHIpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
