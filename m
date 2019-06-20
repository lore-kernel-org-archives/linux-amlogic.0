Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A34AC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F53F2082C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfEQ3cWI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SISGPHft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F53F2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27xg06la+eeSq15gPeTpOWPHJaEQbnHFTpZD1/C2lmc=; b=DfEQ3cWI/Q9NDz
	1BoMtayEjv8p78UohaoQg9d7g/VD2q47oZGX01EhEm1TEPkxjxht0pORYSNedxk+VlQRegTBlieSW
	MJnMUlEGEHozO7syxSdzDCbChZvrVhJwQ51BFjG11hq3/LL7Xv+rot4ZCyCmw1DfKMVh1ZB/tyubA
	buV8STChXb/Jhf2Pcm+xj4O+iw8TA8o7QWiLV4MoqXevMEpxALfKHryKCyJQGOWakN4J7k2NGCxLk
	+0WRpWogpbGiUlsDVkIYXgl+m8jovboldoL0Cl5BHP4eoxSUapFPn+iNkW4voL9CFVxwexYf8/CYm
	QErr60x9kmZ7Uu+5vqmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdzNc-00054h-2t; Thu, 20 Jun 2019 15:53:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdzNY-00054G-LM
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:53:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id c66so3614687wmf.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=59sOw1Oebt3fIvV/+8aXEs4eROjOmxKYdJI1aO6UkgQ=;
 b=SISGPHft8zTQqSB7wq9CtPBCrHv7OnTSGwBse3rRTdsMB0RWWaf1RHLrT00hMVfeTW
 M2UW6hMTOaUuCTNr7ieSaeMF+xgAU5ikzJaJFSIv/Yapd0nB28qJJwAsGPPRrUZ5lgSa
 xo8OfLTkfmmTe1bjGw3XibDB2iXyZCvrlpqTitRgCl9LgF55HDyvbf3WRseKSHdP20ro
 bgU5e1lQ4v6/l3CJYgWxUGFtBc570LRgiaCAkypokEid2/TjnhmGPTx3UlVJjASgGmX3
 NsivP/b8m2CssCFQoHhdFi2mgyFb2M/DRAPFGQJIBDJ2WU6ZT+TnJtqcI0MdBebjPzSf
 IlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59sOw1Oebt3fIvV/+8aXEs4eROjOmxKYdJI1aO6UkgQ=;
 b=ZPp+nlA4pMgH3JrMpl1cedmAcMis2gMi+vCw0NzX/N6pybruhf3DxU3ZqnykqJOgKs
 cAwAxCWSDhYwJ5ESCI1aatjMHUir34F4Pgs9EO9kc2TJbOQgl4qrt3hcGauPB7HfNqwy
 c0w4jPHfw0pshlSymIstHzgG4j0lDQWimFVc01TRWMWjb9lFnSrNYdtQozNBwyig0adn
 9hWRnmcLgPvoZMhuRgz4hz0+oxVQDVFGnptVqIbe7YdF+U6zWUfxSPpGkrour+GUoDWS
 c40kF4NINJ7Fa4C5PEb9GyTGfkvDW4M+0EeFC69lCIbHakTbcLO/DbRmEFDL4ZJCK4YH
 vwNA==
X-Gm-Message-State: APjAAAXI1vS+rhvbmup2ZJSiq4y8tg6RANLye3Xv9Hq5fA9ilOKo0PqZ
 fWoteZpqhKMgEUfNcnP/GwU=
X-Google-Smtp-Source: APXvYqxDVaxLlh9Pgi3fgjO+oeP/eh0en3IwzT1vQwqAGLE2Dmzj3CCJ9WSGtoatnLTotlSoJqFsFA==
X-Received: by 2002:a1c:e718:: with SMTP id e24mr237949wmh.104.1561046015032; 
 Thu, 20 Jun 2019 08:53:35 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bf3:bd00:fdf8:4ce8:7b2:7440?
 (p200300EA8BF3BD00FDF84CE807B27440.dip0.t-ipconnect.de.
 [2003:ea:8bf3:bd00:fdf8:4ce8:7b2:7440])
 by smtp.googlemail.com with ESMTPSA id u25sm5113845wmc.3.2019.06.20.08.53.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 08:53:34 -0700 (PDT)
Subject: Re: network unstable on odroid-c1/meson8b.
To: Aymeric <mulx@aplu.fr>
References: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
 <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
 <d2e298040f4887c547da11178f9ea64f@aplu.fr>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <1f34f3b6-2c70-9ff3-3f5a-597e4bd9c66f@gmail.com>
Date: Thu, 20 Jun 2019 17:53:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d2e298040f4887c547da11178f9ea64f@aplu.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_085336_730200_EFF113BF 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAuMDYuMjAxOSAwOTo1NSwgQXltZXJpYyB3cm90ZToKPiBIaSwKPiBPbiAyMDE5LTA2LTIw
IDAwOjE0LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+IE9uIDE5LjA2LjIwMTkgMjI6MTgsIEF5
bWVyaWMgd3JvdGU6Cj4+PiBIZWxsbyBhbGwsCj4+Pgo+IAo+PiBLZXJuZWwgMy4xMCBkaWRuJ3Qg
aGF2ZSBhIGRlZGljYXRlZCBSVEw4MjExRiBQSFkgZHJpdmVyIHlldCwgdGhlcmVmb3JlCj4+IEkg
YXNzdW1lIHRoZSBnZW5waHkgZHJpdmVyIHdhcyB1c2VkLiBEbyB5b3UgaGF2ZSBhIGxpbmUgd2l0
aAo+PiAiYXR0YWNoZWQgUEhZIGRyaXZlciIgaW4gZG1lc2cgb3V0cHV0IG9mIHRoZSB2ZW5kb3Ig
a2VybmVsPwo+IAo+IE5vLgo+IEhlcmUgaXMgdGhlIGZ1bGwgb3V0cHV0IG9mIHRoZSBkbWVzZyBm
cm9tIHZlbmRvciBrZXJuZWwgW8K5XS4KPiAKPiBJJ3ZlIGFsc28gbm90aWNlZCBzb21ldGhpbmcg
c3RyYW5nZSwgaXQgbWlnaHQgYmUgbGlua2VkLCBidXQgbWFjIGFkZHJlc3Mgb2YgdGhlIGJvYXJk
IGlzIHNldCB0byBhIHJhbmRvbSB2YWx1ZSB3aGVuIHVzaW5nIG1haW5saW5lIGtlcm5lbCBhbmQg
SSd2ZSB0byBzZXQgaXQgbWFudWFsbHkgYnV0IG5vdCB3aGVuIHVzaW5nIHZlbmRvciBrZXJuZWwu
Cj4gCj4+Cj4+IFRoZSBkZWRpY2F0ZWQgUEhZIGRyaXZlciB0YWtlcyBjYXJlIG9mIHRoZSB0eCBk
ZWxheSwgaWYgdGhlIGdlbnBoeQo+PiBkcml2ZXIgaXMgdXNlZCB3ZSBoYXZlIHRvIHJlbHkgb24g
d2hhdCB1Ym9vdCBjb25maWd1cmVkLgo+PiBCdXQgaWYgd2UgaW5kZWVkIGhhZCBhbiBpc3N1ZSB3
aXRoIGEgbWlzY29uZmlndXJlZCBkZWxheSwgSSB0aGluawo+PiB0aGUgY29ubmVjdGlvbiBzaG91
bGRuJ3QgYmUgZmluZSB3aXRoIGp1c3QgYW5vdGhlciBsaW5rIHBhcnRuZXIuCj4+IEp1c3QgdG8g
aGF2ZSBpdCB0ZXN0ZWQgeW91IGNvdWxkIG1ha2UgcnRsODIxMWZfY29uZmlnX2luaXQoKSBpbgo+
PiBkcml2ZXJzL25ldC9waHkvcmVhbHRlay5jIGEgbm8tb3AgKGluIGN1cnJlbnQga2VybmVscyku
Cj4+Cj4gCj4gSSdtIG5vdCBhbiBleHBlcnQgaGVyZSwganVzdCBhZGRpbmcgYSAicmV0dXJuIDA7
IiBoZXJlW8KyXSB3b3VsZCBiZSBlbm91Z2g/Cj4gCj4+IEFuZCB5b3UgY291bGQgY29tcGFyZSBh
dCBsZWFzdCB0aGUgYmFzaWMgUEhZIHJlZ2lzdGVycyAweDAwIC0gMHgzMAo+PiB3aXRoIGJvdGgg
a2VybmVsIHZlcnNpb25zLCBlLmcuIHdpdGggcGh5dG9vbC4KPj4KPiAKPiBUaGV5IGFyZSBub3Qg
dGhlIHNhbWUgYnV0IEkgZG9uJ3Qga25vdyB3aGF0IEknbSBsb29raW5nIGZvciwgc28gZm9yIGtl
cm5lbCAzLjEwIFvCs10gYW5kIGZvciBrZXJuZWwgNS4xLjEyIFvigbRdLgo+IAo+IEF5bWVyaWMK
PiAKPiBbwrldOiBodHRwczovL3Bhc3RlLmFwbHUuZnIvPzM4ZWY5NWI0NGViZGJmYzMjRzY2Ni9Z
YmhnVStPK3RkQy8ySGFpbVVDaWdtOFpUQjQ0cXZRaXAvSEo1QT0KPiBbwrJdOiBodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi8yNDFlMzkwMDQ1ODE0NzViMjgwMmNkNjNjMTEx
ZmVjNDNiYjAxMjNlL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMjTDE2NAo+IFvCs106IGh0dHBz
Oi8vcGFzdGUuYXBsdS5mci8/MmRkZTFjMzJkNWM2OGY0YyM2eElhOE1qVG02anBJNmNpdEVKQXFG
VExNTUhEakZaUmV0L00wMC9Fd2pVPQo+IFvigbRdOiBodHRwczovL3Bhc3RlLmFwbHUuZnIvPzMy
MTMwZTliY2IwNWRkZTcjTi94ZG52YjVHa2xjSnRpT3hNcFRDbSs5Z3NVbGlSd0g4WDNkY3dTVitu
Zz0KPiAKClRoZSB2ZW5kb3Iga2VybmVsIGhhcyBzb21lLCBidXQgbm90IHJlYWxseSBtdWNoIG1h
Z2ljOgpodHRwczovL2dpdGh1Yi5jb20vaGFyZGtlcm5lbC9saW51eC9ibG9iL29kcm9pZGMtMy4x
MC55L2RyaXZlcnMvYW1sb2dpYy9ldGhlcm5ldC9waHkvYW1fcnRsODIxMWYuYwpUaGUgd3JpdGUg
dG8gUlRMODIxMUZfUEhZQ1IyIGlzIG92ZXJ3cml0dGVuIGxhdGVyLCB0aGVyZWZvcmUgd2UgZG9u
J3QgaGF2ZSB0byBjb25zaWRlciBpdC4KClRoZSBmb2xsb3dpbmcgc2hvdWxkIG1ha2UgdGhlIGN1
cnJlbnQgUmVhbHRlayBQSFkgZHJpdmVyIGJlaGF2ZSBsaWtlIGluIHRoZSB2ZW5kb3IgZHJpdmVy
LgpDb3VsZCB5b3UgdGVzdCBpdD8KCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L3JlYWx0
ZWsuYyBiL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMKaW5kZXggYTY2OTk0NWViLi5mMzAwYjFj
YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMKKysrIGIvZHJpdmVycy9u
ZXQvcGh5L3JlYWx0ZWsuYwpAQCAtMTYzLDYgKzE2MywxMCBAQCBzdGF0aWMgaW50IHJ0bDgyMTFm
X2NvbmZpZ19pbml0KHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCiB7CiAJdTE2IHZhbDsKIAor
CXBoeV93cml0ZV9wYWdlZChwaHlkZXYsIDB4MGE0MywgMHgxOSwgMHgwODAzKTsKKwlnZW5waHlf
c29mdF9yZXNldChwaHlkZXYpOworCXJldHVybiAwOworCiAJLyogZW5hYmxlIFRYLWRlbGF5IGZv
ciByZ21paS17aWQsdHhpZH0sIGFuZCBkaXNhYmxlIGl0IGZvciByZ21paSBhbmQKIAkgKiByZ21p
aS1yeGlkLiBUaGUgUlgtZGVsYXkgY2FuIGJlIGVuYWJsZWQgYnkgdGhlIGV4dGVybmFsIFJYRExZ
IHBpbi4KIAkgKi8KLS0gCjIuMjIuMAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
