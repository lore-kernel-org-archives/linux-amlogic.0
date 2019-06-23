Return-Path: <SRS0=U3Np=UW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE0C43613
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jun 2019 18:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BE62073F
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jun 2019 18:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a0E0O4sy";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="pNtl7SV5";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="dCxerk4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54BE62073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+t6KEwz2adx0xbi+3BfE4WXIkIiCCpkm2+lTNjvOU8=; b=a0E0O4syJcft3l
	2dga6mBFYtEctuHINuQBIr/7+ZAeE9AVvZOJnWyT+Av4wyXvwfOGYn/HNFmUk7OgxT9XfrdC7KsQl
	fBuM7EVC8y09tAynsFqJ+eo+buYArJZZNkqJNcMA0iHMC+DkwzOF50ckYWbcJbz7Kw9xvuvlG/XkL
	hZmeQ+hHmmeLP/9eJixdP83t850XCxdJhCqQo/MVft9gIzwUXCD36f52/t2dghKs1OnSAKdBe2QrX
	oEbzZ5R8S6jcZc3eZ3HvEeT5D9P34bOiBDzwI+B1K6gu9ZOjX64uPJVHq5zmWd9OtryS40u9IpeHk
	RbN+d3z18QDQnqwdJMtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hf73R-0008Si-3d; Sun, 23 Jun 2019 18:17:29 +0000
Received: from eva.aplu.fr ([91.224.149.41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hf73N-0008Rw-Fl
 for linux-amlogic@lists.infradead.org; Sun, 23 Jun 2019 18:17:27 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 48E11C45;
 Sun, 23 Jun 2019 20:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561313827; bh=QQ+p7ZvdJhbEmx8uGpHZdfsHEb5iJlIlXsDH8L3dznM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=pNtl7SV56DwrdH1N56yItqUQepmW1aoPFSMYGNkxq9Ey7ROI+qQnhgAQw/O1ilpCG
 Iq9a6+A1VYgRyUrng4EhnJ9LZ9cmX8GzIllbTJH0Sd2rg+NmSik1Su+3ECZXFshENG
 cFG9wMd6bQ3TpdAwRQPFq+FhaYm9sTfcYDr2QmLvbETOeH3MeIzSGjrnREtsPt87xY
 5RjyDs/Zi6Ui6TppmhggvCoGbNx+0CrLZIZsgjEliFpYL7A2rGAGvBXBogQhXqF7EB
 cp9ZZkpc/VOxDzIOpXw9REKA5vzcbTtXYE2PiV5+VRyvJdnzhyNB7Bd5eOF+f+bVh/
 cdLZmMtJ/LcUnHjmyc8WELvhfDHhEU6RWL+a73s6/Wf4jsR8rFGBUd2aPX2dPGqbyR
 y1TMAaBDh6PU1ImCdxdoHPLWKlperfGhVzyxIsaVWeDuib/QJDFHKqRfrFAmxNmtXs
 kFx5iB1cFdfcxP508Q1mhgI4KZcwhNxbR+rQPZhI+6uk0nVcnxHUx89v6vL2+wvRi3
 phIpRmdq0/AD/V9Lj4zApisYAd6eHxahVipqRouqz+DMobmM+aOMhzybD/EJ5lyjco
 Ik/eggiQh+1Ys4TI4w/xEQxUmP9CRcnG0D0/wVuoEG4Vb77xN2+7fcthWBrkTF9lRX
 o0N9RDsvwIXvM6jhIUScfEgE=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id CC72DA1E;
 Sun, 23 Jun 2019 20:17:06 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561313826; bh=QQ+p7ZvdJhbEmx8uGpHZdfsHEb5iJlIlXsDH8L3dznM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=dCxerk4aexoNLRPPL0oEH3MENsOqzdl/hgzUGMI74KJUoWNrm3V9MnTdXfqNEJZLc
 DE7OZrDu4DuxkVNtO24PwuT7RCPKwSe61cAKwDvfqqrCQ8ZZHviRLIfiukUG+bWeUf
 bn/1V27IiCNOOctV9azzlIg5JiZSoC4cpyl6fb7MVq/c7TzMHBxgHHddLWjIFiH7Wa
 GYedlH5WsphMkUKjQCJbVaZKf563t3dT4rIdCc27c6c19wDN9LZS4FzSOGG+Q06qMC
 ksDpILBTPZ5bViZOCuX1zI35TQRWGQAb2X+v5cMejh9iFYFCUgTkiBJEgVtrXJKNRb
 Si4+LedgWQVImf2ti1lThchkZ8M22R5HJk0+fQR85D+rkkJaeU1iwcG7qFNRwD713z
 fhyLbSw8kc466RT4zxTbWqHDV5SeicjMRuqcLeebqegZWuvPhAsgC7mKzlAaLFkYhW
 gSlEAxZuR4rWpw8CV9x2FJLLmuoiH6bHeOE1fT063UCJ0vBQJeTHjVno7zO3dqdn/U
 A1oXEtav9KtEZsAyraTn6TWym6FzBg8zXnT/g47yQx/nXBn+bfUD1yxwyE90fYpTgv
 5CbSdA/xTn+fNwZzneotkPxaza/81ThP9vVLtrBB1gIHf/4fMuTvxIyMULbBpegylx
 BnnoK/zos8KSOH5rK+GfYi3Q=
Subject: Re: network unstable on odroid-c1/meson8b.
From: Aymeric <mulx@aplu.fr>
To: Heiner Kallweit <hkallweit1@gmail.com>
References: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
 <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
 <d2e298040f4887c547da11178f9ea64f@aplu.fr>
 <1f34f3b6-2c70-9ff3-3f5a-597e4bd9c66f@gmail.com>
 <fc416bf0-3f3c-72a8-0500-4e487d8f3a27@aplu.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <57de5c6e-b964-70e1-ed60-527f2be2a961@aplu.fr>
Date: Sun, 23 Jun 2019 20:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fc416bf0-3f3c-72a8-0500-4e487d8f3a27@aplu.fr>
Content-Language: fr
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190623_111725_834283_B60E2379 
X-CRM114-Status: GOOD (  14.47  )
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

CkxlIDIwLzA2LzIwMTkgw6AgMjI6NTQsIEF5bWVyaWMgYSDDqWNyaXTCoDoKPiBMZSAyMC8wNi8y
MDE5IMOgIDE3OjUzLCBIZWluZXIgS2FsbHdlaXQgYSDDqWNyaXTCoDoKPj4gT24gMjAuMDYuMjAx
OSAwOTo1NSwgQXltZXJpYyB3cm90ZToKPj4+IEhpLAo+Pj4gT24gMjAxOS0wNi0yMCAwMDoxNCwg
SGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4+IE9uIDE5LjA2LjIwMTkgMjI6MTgsIEF5bWVyaWMg
d3JvdGU6Cj4+Pj4+IEhlbGxvIGFsbCwKPj4+Pj4KPj4+PiBLZXJuZWwgMy4xMCBkaWRuJ3QgaGF2
ZSBhIGRlZGljYXRlZCBSVEw4MjExRiBQSFkgZHJpdmVyIHlldCwgdGhlcmVmb3JlCj4+Pj4gSSBh
c3N1bWUgdGhlIGdlbnBoeSBkcml2ZXIgd2FzIHVzZWQuIERvIHlvdSBoYXZlIGEgbGluZSB3aXRo
Cj4+Pj4gImF0dGFjaGVkIFBIWSBkcml2ZXIiIGluIGRtZXNnIG91dHB1dCBvZiB0aGUgdmVuZG9y
IGtlcm5lbD8KPj4+IE5vLgo+Pj4gSGVyZSBpcyB0aGUgZnVsbCBvdXRwdXQgb2YgdGhlIGRtZXNn
IGZyb20gdmVuZG9yIGtlcm5lbCBbwrldLgo+Pj4KPj4+IEkndmUgYWxzbyBub3RpY2VkIHNvbWV0
aGluZyBzdHJhbmdlLCBpdCBtaWdodCBiZSBsaW5rZWQsIGJ1dCBtYWMgYWRkcmVzcyBvZiB0aGUg
Ym9hcmQgaXMgc2V0IHRvIGEgcmFuZG9tIHZhbHVlIHdoZW4gdXNpbmcgbWFpbmxpbmUga2VybmVs
IGFuZCBJJ3ZlIHRvIHNldCBpdCBtYW51YWxseSBidXQgbm90IHdoZW4gdXNpbmcgdmVuZG9yIGtl
cm5lbC4KPj4+Cj4+Pj4gVGhlIGRlZGljYXRlZCBQSFkgZHJpdmVyIHRha2VzIGNhcmUgb2YgdGhl
IHR4IGRlbGF5LCBpZiB0aGUgZ2VucGh5Cj4+Pj4gZHJpdmVyIGlzIHVzZWQgd2UgaGF2ZSB0byBy
ZWx5IG9uIHdoYXQgdWJvb3QgY29uZmlndXJlZC4KPj4+PiBCdXQgaWYgd2UgaW5kZWVkIGhhZCBh
biBpc3N1ZSB3aXRoIGEgbWlzY29uZmlndXJlZCBkZWxheSwgSSB0aGluawo+Pj4+IHRoZSBjb25u
ZWN0aW9uIHNob3VsZG4ndCBiZSBmaW5lIHdpdGgganVzdCBhbm90aGVyIGxpbmsgcGFydG5lci4K
Pj4+PiBKdXN0IHRvIGhhdmUgaXQgdGVzdGVkIHlvdSBjb3VsZCBtYWtlIHJ0bDgyMTFmX2NvbmZp
Z19pbml0KCkgaW4KPj4+PiBkcml2ZXJzL25ldC9waHkvcmVhbHRlay5jIGEgbm8tb3AgKGluIGN1
cnJlbnQga2VybmVscykuCj4+Pj4KPj4+IEknbSBub3QgYW4gZXhwZXJ0IGhlcmUsIGp1c3QgYWRk
aW5nIGEgInJldHVybiAwOyIgaGVyZVvCsl0gd291bGQgYmUgZW5vdWdoPwo+Pj4KPj4+PiBBbmQg
eW91IGNvdWxkIGNvbXBhcmUgYXQgbGVhc3QgdGhlIGJhc2ljIFBIWSByZWdpc3RlcnMgMHgwMCAt
IDB4MzAKPj4+PiB3aXRoIGJvdGgga2VybmVsIHZlcnNpb25zLCBlLmcuIHdpdGggcGh5dG9vbC4K
Pj4+Pgo+Pj4gVGhleSBhcmUgbm90IHRoZSBzYW1lIGJ1dCBJIGRvbid0IGtub3cgd2hhdCBJJ20g
bG9va2luZyBmb3IsIHNvIGZvciBrZXJuZWwgMy4xMCBbwrNdIGFuZCBmb3Iga2VybmVsIDUuMS4x
MiBb4oG0XS4KPj4+Cj4+PiBBeW1lcmljCj4+Pgo+Pj4gW8K5XTogaHR0cHM6Ly9wYXN0ZS5hcGx1
LmZyLz8zOGVmOTViNDRlYmRiZmMzI0c2NjYvWWJoZ1UrTyt0ZEMvMkhhaW1VQ2lnbThaVEI0NHF2
UWlwL0hKNUE9Cj4+PiBbwrJdOiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi8yNDFlMzkwMDQ1ODE0NzViMjgwMmNkNjNjMTExZmVjNDNiYjAxMjNlL2RyaXZlcnMvbmV0L3Bo
eS9yZWFsdGVrLmMjTDE2NAo+Pj4gW8KzXTogaHR0cHM6Ly9wYXN0ZS5hcGx1LmZyLz8yZGRlMWMz
MmQ1YzY4ZjRjIzZ4SWE4TWpUbTZqcEk2Y2l0RUpBcUZUTE1NSERqRlpSZXQvTTAwL0V3alU9Cj4+
PiBb4oG0XTogaHR0cHM6Ly9wYXN0ZS5hcGx1LmZyLz8zMjEzMGU5YmNiMDVkZGU3I04veGRudmI1
R2tsY0p0aU94TXBUQ20rOWdzVWxpUndIOFgzZGN3U1Yrbmc9Cj4+Pgo+PiBUaGUgdmVuZG9yIGtl
cm5lbCBoYXMgc29tZSwgYnV0IG5vdCByZWFsbHkgbXVjaCBtYWdpYzoKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2hhcmRrZXJuZWwvbGludXgvYmxvYi9vZHJvaWRjLTMuMTAueS9kcml2ZXJzL2FtbG9n
aWMvZXRoZXJuZXQvcGh5L2FtX3J0bDgyMTFmLmMKPj4gVGhlIHdyaXRlIHRvIFJUTDgyMTFGX1BI
WUNSMiBpcyBvdmVyd3JpdHRlbiBsYXRlciwgdGhlcmVmb3JlIHdlIGRvbid0IGhhdmUgdG8gY29u
c2lkZXIgaXQuCj4+Cj4+IFRoZSBmb2xsb3dpbmcgc2hvdWxkIG1ha2UgdGhlIGN1cnJlbnQgUmVh
bHRlayBQSFkgZHJpdmVyIGJlaGF2ZSBsaWtlIGluIHRoZSB2ZW5kb3IgZHJpdmVyLgo+PiBDb3Vs
ZCB5b3UgdGVzdCBpdD8KPiAoc2VuZGluZyBhZ2FpbiBmb3IgbWFpbGluZyBsaXN0LCBzb3JyeSwg
SSBmb3Jnb3QgdG8gZm9yY2UgaXQgaW4gcGxhaW50ZXh04oCmKQo+Cj4gSSd2ZSBhcHBsaWVkIHlv
dXIgcGF0Y2ggYW5kIHRyaWVkIGJ1dCBpdCBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZy4KPgo+IEhl
cmUgaXMgZG1lc2cgb3V0cHV0IGFuZCBwaHl0b29sIHJlc3VsdHMuCj4KPiBodHRwczovL3Bhc3Rl
LmFwbHUuZnIvPzk3MzVjOTk5MDc1Mjg5MjkjU2VDZ3dSNDVjZ25iREExdFhJVkJIQ0JUOFJOY3Qy
cjQxalU2dnNndUxWYz0KPgpIZWxsbyBhbGwsCgpJIGhhZCBzb21lIG5ld3MgZnJvbSBhIGZyaWVu
ZCB3aG8gaGF2ZSB0aGUgc2FtZSBpc3N1ZSB0aGFuIG1lLCBoaXMgYm9hcmQKaXMgY29ubmVjdGVk
IHRvIGFuICJpbnRlbGxpZ2VudCIgc3dpdGNoIGEgVWJpcXVpdGkgRWRnZVN3aXRjaC4KCkFsc28s
IHdoZW4gaGUgZm9yY2UgdGhlIGxpbmsgdG8gMTAwIGl0IGlzIHN0YWJsZS4KCkF5bWVyaWMuCgot
LSAKQXltZXJpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
