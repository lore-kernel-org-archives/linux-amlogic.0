Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD41C2BA2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 06:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBD72087E
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 06:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQpHAQxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEBD72087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu3GIHHvMCze+oGIdjwuOEL1xcNylphobhaSNcRbajA=; b=TQpHAQxqLFte9+
	KGai5UF5YBNbpcdxFtkXe6wGLGyFFrSBTutkA+0s68MG+8Gqsq2rO5CA/XeMoov0nYB2XjhvjvBtX
	hXAc3N77/2us/3GIzlW+tOPkepyVPyq7UTVnm4+47oGZZyhR1pVXmYebgGwEmUr4SHpByOdzcOzUh
	dYNCIH1+pcSqSIsBsgACzDYzkms0eJ9AlVB+AopjhsTmHcwe2Qxa6anWaynIidEdPSb5aD9Un6ROI
	4XxfQ2gghNFamQO1pTtts1UFkb0o0ZikTdTxlLuCWU45Cfdwh8vWYs2WjMWn0thXGu276giMAt3oR
	9BusEGC0kx8heTnJ+3JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOyNS-0008QJ-8q; Thu, 16 Apr 2020 06:51:58 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOyNP-0008PW-C8
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 06:51:57 +0000
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jOyNE-0005Ji-AF; Thu, 16 Apr 2020 16:51:45 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 16 Apr 2020 16:51:44 +1000
Date: Thu, 16 Apr 2020 16:51:44 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH v6]crypto: amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
Message-ID: <20200416065144.GF7901@gondor.apana.org.au>
References: <20200403220754.7856-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403220754.7856-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_235155_663465_6C58C627 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, clabbe@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBBcHIgMDQsIDIwMjAgYXQgMDY6MDc6NTRBTSArMDgwMCwgVGFuZyBCaW4gd3JvdGU6
Cj4gV2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZywgcGxhdGZvcm1fZ2V0X2lycSgpIHdpbGwgcHJp
bnQgYW4gZXJyb3IgbWVzc2FnZSwKPiBzbyBpbiBvcmRlciB0byBhdm9pZCB0aGUgc2l0dWF0aW9u
IG9mIHJlcGVhdCBvdXRwdXTvvIx3ZSBzaG91bGQgcmVtb3ZlCj4gZGV2X2VyciBoZXJlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRhbmcgQmluIDx0YW5nYmluQGNtc3MuY2hpbmFtb2JpbGUuY29tPgo+
IC0tLQo+IENoYW5nZXMgZnJvbSB2NQo+ICAtIG1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UuCj4g
Cj4gQ2hhbmdlcyBmcm9tIHY0Ogo+ICAtIHJld3JpdGUgdGhlIGNvZGUsIGJlY2F1c2UgdGhlIGNv
ZGUgaW4gdjQgaXMgd3JvbmcsIHNvcnJ5Lgo+IAo+IENoYW5nZXMgZm9ybSB2MzoKPiAgLSBmaXgg
dGhlIHRoZW1lIHdyaXRpbmcgZXJyb3IuCj4gCj4gQ2hhbmdlcyBmcm9tIHYyOgo+ICAtIG1vZGlm
eSB0aGUgdGhlbWUgZm9ybWF0IGFuZCBjb250ZW50IGRlc2NyaXB0aW9uLgo+ICAtIHJlZm9ybWF0
IHRoZSBwYXRjaCwgaXQncyB0aGUgd3Jvbmcgd2F5IHRvIHJlc3VibWl0IGEgbmV3IHBhdGNoIHRo
YXQKPiAgICBzaG91bGQgYmUgbW9kaWZpZWQgb24gdG9wIG9mIHRoZSBvcmlnaW5hbC4gVGhlIG9y
aWdpbmFsIHBpZWNlIGlzOgo+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC8xMjE5NjExLwo+IAo+IENoYW5nZXMgZnJvbSB2MToKPiAgLSB0aGUgdGl0bGUgaGFzIGNo
YW5nZWQsIGJlY2F1c2UgdGhlIGRlc2NyaXB0aW9uIGlzIG5vdCB2ZXJ5IGRldGFpbGVkLgo+ICAt
IHRoZSBjb2RlIGhhcyBiZWVuIG1vZGlmaWVkLCBiZWNhdXNlIGl0IG5lZWRzIHRvIG1hdGNoIHRo
ZSB0aGVtZS4KPiAKPiAgZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMg
fCA0ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQoKUGF0Y2ggYXBwbGllZC4gIFRoYW5rcy4KLS0gCkVtYWlsOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0
QGdvbmRvci5hcGFuYS5vcmcuYXU+CkhvbWUgUGFnZTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcu
YXUvfmhlcmJlcnQvClBHUCBLZXk6IGh0dHA6Ly9nb25kb3IuYXBhbmEub3JnLmF1L35oZXJiZXJ0
L3B1YmtleS50eHQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
