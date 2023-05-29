Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0522C7EE29
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfxwcjrtzXX/xnPxZtiyVBsiBRGqifPjGgdoOwIx6rA=; b=KPLLB4eLz4wnML
	HYkEFw6myVQhka5i9jE/+QON2KX3qymj9vnb2M3ph/Rqt6F6lm8jwAXkmI4jEigCxg1TYcRJdRZ0A
	mx6XgQq3JYSE9uCFMxfN2aX4iKNflqZcnzHw1bSMfcZ0KNT1pL+jyBuBPXJ61FLtJ6zCAviuQt2FS
	y63I6+7AW+mhpl+hD0xir51BSA1ymGpURQZjM3q4YdZo7JRS+JgrrNkX9GLNxkZJD7GM9jf2SeKOI
	/AI9LYjTsdU7sDTOQh7TtaFcbGsHRcNNa5GaCpMxfJaR4YFuX1NqQHfoDvh3sFeoKNQCXsD/1dg1t
	MJMlW91mmE9nj/Nz+5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YQW-009kAQ-1n;
	Mon, 29 May 2023 08:40:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YQS-009k9d-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 29 May 2023 08:40:26 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73B8A6605961;
	Mon, 29 May 2023 09:40:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685349623;
	bh=9ApkdS7663n45aSbnjR212X9+KL8lAWgYFe+AiYnwmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i2E0/49G7/6Z8J9cECpKX/kE53gqrMX51hEzU+35JtS8sXijVIO3VU3mkqmw4upcZ
	 2lJDMfoKcFP+uS4RD9xUMqt+yO3aYMetPnPjfWUtF0d9pjq8W5ZN+zaRX+fn8IyTM7
	 lK0ndchByNQvdBc+iGFNm/edUR03ovZC/fvdzkT7bARlhrb7rZeqbHVj9XSCQBWdnO
	 HfC4ZhiS/PXkfRp4T61gFC3+644IxXSELc8GCr5sSlFp6ZCZdaNwYuZzUrheyfLSeM
	 eOp6deD3lXrpEylyEvuxHyyn16u5ewYgnrwLZLJiUSUZ9hJzn1EKvXK5ORb9yglKmj
	 Z+vh4RAEbbl+Q==
Message-ID: <66d2943f-a9a7-274b-eb00-24e8de63eb00@collabora.com>
Date: Mon, 29 May 2023 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Cc: kernel@collabora.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-4-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014025_724625_413AB230 
X-CRM114-Status: GOOD (  14.02  )
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

SWwgMjgvMDUvMjMgMTY6MDAsIEFkcmnDoW4gTGFydW1iZSBoYSBzY3JpdHRvOgoKSSBhZ3JlZSB0
aGF0IHRoZSB0aXRsZSBhbG1vc3Qgc2F5cyBpdCBhbGwsIGJ1dCBwbGVhc2UgYWRkIGEgY29tbWl0
IGRlc2NyaXB0aW9uLgoKUmVnYXJkcywKQW5nZWxvCgo+IFNpZ25lZC1vZmYtYnk6IEFkcmnDoW4g
TGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMjIgKysrKy0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCAx
YWZiOGYyNjAzYTAuLjBhY2NmYjUxNTA5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTQ5LDIwICs0OSw2IEBACj4gICAKPiAgICNkZWZpbmUg
SERNSTE0X01BWF9UTURTQ0xLCTM0MDAwMDAwMAo+ICAgCj4gLWVudW0gaGRtaV9kYXRhbWFwIHsK
PiAtCVJHQjQ0NF84QiA9IDB4MDEsCj4gLQlSR0I0NDRfMTBCID0gMHgwMywKPiAtCVJHQjQ0NF8x
MkIgPSAweDA1LAo+IC0JUkdCNDQ0XzE2QiA9IDB4MDcsCj4gLQlZQ2JDcjQ0NF84QiA9IDB4MDks
Cj4gLQlZQ2JDcjQ0NF8xMEIgPSAweDBCLAo+IC0JWUNiQ3I0NDRfMTJCID0gMHgwRCwKPiAtCVlD
YkNyNDQ0XzE2QiA9IDB4MEYsCj4gLQlZQ2JDcjQyMl84QiA9IDB4MTYsCj4gLQlZQ2JDcjQyMl8x
MEIgPSAweDE0LAo+IC0JWUNiQ3I0MjJfMTJCID0gMHgxMiwKPiAtfTsKPiAtCj4gICBzdGF0aWMg
Y29uc3QgdTE2IGNzY19jb2VmZl9kZWZhdWx0WzNdWzRdID0gewo+ICAgCXsgMHgyMDAwLCAweDAw
MDAsIDB4MDAwMCwgMHgwMDAwIH0sCj4gICAJeyAweDAwMDAsIDB4MjAwMCwgMHgwMDAwLCAweDAw
MDAgfSwKPiBAQCAtODU2LDEwICs4NDIsMTAgQEAgc3RhdGljIHZvaWQgZHdfaGRtaV9ncF9hdWRp
b19lbmFibGUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gICAKPiAgIAlpZiAocGRhdGEtPmVuYWJs
ZV9hdWRpbykKPiAgIAkJcGRhdGEtPmVuYWJsZV9hdWRpbyhoZG1pLAo+IC0JCQkJCSAgICBoZG1p
LT5jaGFubmVscywKPiAtCQkJCQkgICAgaGRtaS0+c2FtcGxlX3dpZHRoLAo+IC0JCQkJCSAgICBo
ZG1pLT5zYW1wbGVfcmF0ZSwKPiAtCQkJCQkgICAgaGRtaS0+c2FtcGxlX25vbl9wY20pOwo+ICsJ
CQkJICAgIGhkbWktPmNoYW5uZWxzLAo+ICsJCQkJICAgIGhkbWktPnNhbXBsZV93aWR0aCwKPiAr
CQkJCSAgICBoZG1pLT5zYW1wbGVfcmF0ZSwKPiArCQkJCSAgICBoZG1pLT5zYW1wbGVfbm9uX3Bj
bSk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIGR3X2hkbWlfZ3BfYXVkaW9fZGlzYWJsZShz
dHJ1Y3QgZHdfaGRtaSAqaGRtaSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
