Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E75C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD252064A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4t62Mls";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="uA79P5zs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD252064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PXOYsphOwnJTmDx7IkzmPr2a4Y8RjOOmvLYEuIICnLU=; b=J4t62MlsrgLwFuFs5E7IWURqx
	wQfYM10XZBntpZuxFuqv7j66f7i1JYgSuoVr/ibaxSHp5rjRAZqLqIlnXHP4udTlLNqC3vPbu2T+T
	GSMHrGeyQa65r+ajbqYfHT0PXL7ixoT9xrVOp8vZ0N083NJ3dxb3EoEgSTt0p+j78T75HU4VksdZH
	4vfSS0dyAiW6qoyjNCqQVYA7kWOz4YGGgb1Uwa6IKxPOBaCpLw94UE88dD6tO6E5iS3iGejHwKSPy
	LWHPDWOQRxZ33980mbPlF4g9hPOWZi/bXubPln2XeAvB4+GlgmCnBNWpuVvX3RtPAt7s+7Bq76HPj
	1NpsoeKtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8jl-0004Hd-0w; Mon, 29 Apr 2019 16:02:37 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8jh-0004H9-H4
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 16:02:35 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8Yt4z6qz9vD3W;
 Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=uA79P5zs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 905VH79wAdJv; Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Yt3dNTz9vD3V;
 Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556553746; bh=T0R91daQOtdOH7tKHhta8172OsZU9Bi8+jnmZywXEP8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uA79P5zsw1WI5+2UmqF/21J7JNMj2aTsFgEYwRWbLSvnD+grpuVIyZHrgXaVpyhcL
 5OuXLLnWaQiLIrvMYMpZTidvoJKAnUXNE/2CCFZ1E4i5VW6A3dVsnieAZe3TLrthWI
 rZo1nFN72tAyWEa1qaDx8FOzxVLD2uSTAzKJ8kkY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE6868B8B4;
 Mon, 29 Apr 2019 18:02:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DgkTUp-_afaR; Mon, 29 Apr 2019 18:02:31 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 021048B8B3;
 Mon, 29 Apr 2019 18:02:30 +0200 (CEST)
Subject: Re: [PATCH 20/41] drivers: tty: serial: cpm_uart: use
 dev_err()/dev_warn() instead of printk()
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-21-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7509c580-e7c6-7d22-b6a2-8356264f408e@c-s.fr>
Date: Mon, 29 Apr 2019 18:02:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-21-git-send-email-info@metux.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_090233_855459_9DC04921 
X-CRM114-Status: GOOD (  13.42  )
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
dCBhIMOpY3JpdMKgOgo+IFVzaW5nIGRldl9lcnIoKS9kZXZfd2FybigpIGluc3RlYWQgb2YgcHJp
bnRrKCkgZm9yIG1vcmUgY29uc2lzdGVudCBvdXRwdXQuCj4gKHByaW50cyBkZXZpY2UgbmFtZSwg
ZXRjKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCA8aW5mb0BtZXR1eC5uZXQ+
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+
Cgo+IC0tLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NvcmUuYyB8
IDYgKysrLS0tCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5j
IHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFy
dF9jb3JlLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY29yZS5jCj4g
aW5kZXggYjkyOWM3YS4uMzc0YjhiYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwv
Y3BtX3VhcnQvY3BtX3VhcnRfY29yZS5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91
YXJ0L2NwbV91YXJ0X2NvcmUuYwo+IEBAIC0yNjUsNyArMjY1LDcgQEAgc3RhdGljIHZvaWQgY3Bt
X3VhcnRfaW50X3J4KHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCj4gICAJCSAqIGxhdGVyLCB3aGlj
aCB3aWxsIGJlIHRoZSBuZXh0IHJ4LWludGVycnVwdCBvciBhIHRpbWVvdXQKPiAgIAkJICovCj4g
ICAJCWlmICh0dHlfYnVmZmVyX3JlcXVlc3Rfcm9vbSh0cG9ydCwgaSkgPCBpKSB7Cj4gLQkJCXBy
aW50ayhLRVJOX1dBUk5JTkcgIk5vIHJvb20gaW4gZmxpcCBidWZmZXJcbiIpOwo+ICsJCQlkZXZf
d2Fybihwb3J0LT5kZXYsICJObyByb29tIGluIGZsaXAgYnVmZmVyXG4iKTsKPiAgIAkJCXJldHVy
bjsKPiAgIAkJfQo+ICAgCj4gQEAgLTExNTUsNyArMTE1NSw3IEBAIHN0YXRpYyBpbnQgY3BtX3Vh
cnRfaW5pdF9wb3J0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAJaWYgKCFwaW5mby0+Y2xr
KSB7Cj4gICAJCWRhdGEgPSBvZl9nZXRfcHJvcGVydHkobnAsICJmc2wsY3BtLWJyZyIsICZsZW4p
Owo+ICAgCQlpZiAoIWRhdGEgfHwgbGVuICE9IDQpIHsKPiAtCQkJcHJpbnRrKEtFUk5fRVJSICJD
UE0gVUFSVCAlcE9GbiBoYXMgbm8vaW52YWxpZCAiCj4gKwkJCWRldl9lcnIocG9ydC0+ZGV2LCAi
Q1BNIFVBUlQgJXBPRm4gaGFzIG5vL2ludmFsaWQgIgo+ICAgCQkJICAgICAgICAgICAgICAgICJm
c2wsY3BtLWJyZyBwcm9wZXJ0eS5cbiIsIG5wKTsKPiAgIAkJCXJldHVybiAtRUlOVkFMOwo+ICAg
CQl9Cj4gQEAgLTExNjQsNyArMTE2NCw3IEBAIHN0YXRpYyBpbnQgY3BtX3VhcnRfaW5pdF9wb3J0
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAKPiAgIAlkYXRhID0gb2ZfZ2V0X3Byb3BlcnR5
KG5wLCAiZnNsLGNwbS1jb21tYW5kIiwgJmxlbik7Cj4gICAJaWYgKCFkYXRhIHx8IGxlbiAhPSA0
KSB7Cj4gLQkJcHJpbnRrKEtFUk5fRVJSICJDUE0gVUFSVCAlcE9GbiBoYXMgbm8vaW52YWxpZCAi
Cj4gKwkJZGV2X2Vycihwb3J0LT5kZXYsICJDUE0gVUFSVCAlcE9GbiBoYXMgbm8vaW52YWxpZCAi
Cj4gICAJCSAgICAgICAgICAgICAgICAiZnNsLGNwbS1jb21tYW5kIHByb3BlcnR5LlxuIiwgbnAp
Owo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAl9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5
L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0yLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3Bt
X3VhcnQvY3BtX3VhcnRfY3BtMi5jCj4gaW5kZXggNmExY2QwMy4uZWYxYWUwOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5jCj4gKysrIGIv
ZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYwo+IEBAIC02Nyw3ICs2
Nyw3IEBAIHZvaWQgX19pb21lbSAqY3BtX3VhcnRfbWFwX3ByYW0oc3RydWN0IHVhcnRfY3BtX3Bv
cnQgKnBvcnQsCj4gICAJCXJldHVybiBwcmFtOwo+ICAgCj4gICAJaWYgKGxlbiAhPSAyKSB7Cj4g
LQkJcHJpbnRrKEtFUk5fV0FSTklORyAiY3BtX3VhcnRbJWRdOiBkZXZpY2UgdHJlZSByZWZlcmVu
Y2VzICIKPiArCQlkZXZfd2Fybihwb3J0LT5kZXYsICJjcG1fdWFydFslZF06IGRldmljZSB0cmVl
IHJlZmVyZW5jZXMgIgo+ICAgCQkJIlNNQyBwcmFtLCB1c2luZyBib290IGxvYWRlci93cmFwcGVy
IHByYW0gbWFwcGluZy4gIgo+ICAgCQkJIlBsZWFzZSBmaXggeW91ciBkZXZpY2UgdHJlZSB0byBy
ZWZlcmVuY2UgdGhlIHByYW0gIgo+ICAgCQkJImJhc2UgcmVnaXN0ZXIgaW5zdGVhZC5cbiIsCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
