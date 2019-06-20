Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E361C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 07:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426B42084A
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 07:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Um17uy3D";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="p7RBchzz";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="RbquC23f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426B42084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jQON6jXG/mcGurN+wHRtmZHe3WjYXhTzIxIawv4jsx8=; b=Um17uy3DvIaIjF/pD4xPTK5ky
	+GzTqumvBmcMpY7z5d3N1vzDYKpukaIqa/ycZbJpZbgiijTlkfshlM33Z2ER7i1MhuN1RybM22ZOh
	g6JaVatlTENsVgHntArTVu2+p52ZvsB3cJJ1husOX/tDPLuTKxlq/3jKiieVdQlURawaLyhrSfV1u
	D22V2adgQeEpwOozWKC5Dary8PacB0K1Rben1XL45PbX8QK84pmOADQziLpGwSJJU+rboZJlU9xwC
	+Ed8FoQHIlRpHu9gGeXTP6TCc4sNqex4m9X3atRc7swgWFERQjheMK/f4mUPneCIbYf3rwQrY6iB9
	ZEOs+0wmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdrvQ-0001VT-Qe; Thu, 20 Jun 2019 07:56:04 +0000
Received: from eva.aplu.fr ([91.224.149.41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdrvM-0001V3-Lg
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 07:56:02 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 70A66E23;
 Thu, 20 Jun 2019 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561017353; bh=I9yh62n62fOtNAxNA/Rg9Z/P51cUAU9tBtya1CFeQ4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p7RBchzzmk6hkXYtqI8ZUGkEwLxzkkh2qiS28PucY+cog9jBqx/1vkL1lOwcouYfT
 n3Q5i27eoASHk9uajGNyycUqpAAqA5dPWaDC0Xw8bXZPFafH9uW6S6w0/9wzRQYLHy
 dhz3MzoghXK0q8ivU7E7Tyri6QFlc8RdgEzc2jGAyPlqZU6KLHIO2KDzPD8zER6dd8
 jLX5wKw/lXQr1bzTllPxv7NRb5iIzr1zFy1gufDCduA6Q2ARjogKR3b1fPa1OMoua6
 /Rqg8RCux3pEYAdGyic6xtwVBLohWBFBg4Jz/jVNRy/Z9MFhie1zhzhPk203tHE9bf
 EDqQbRraISNP1V0cLe/lOqjpfYLeW1FJFfAPyPLOxbd8AHpz2oSrLpbjAZqaruCKGO
 zmj5lvKlOmDsrL+2CqL0FQLb8Hd8XM7JszK8UOfWXpPuHoQoo1XMGAVjwzKs64duFq
 S9yBzx7SzoFSD+e+P8fl3l1vmW9sPsrdzMSN/3B/u5S3TYUJ+G/joozse1Aj0rkTNk
 nAcDuKV1tQa0knWaeyjwV1v9ujnE0rm9Qbi4lEZVrZVwHnZHnxopTZBqNbN8v65jj7
 Sa302DQ/mozPyoH2e/PPnjs7/xMQZZKXuJHlCP+BFoVcuPI+FgJW9tcfJKODHtI4Gd
 NO5OQJlD4YV6GXXCSU3EUjtU=
Received: from mail.aplu.fr (localhost [IPv6:::1])
 by eva.aplu.fr (Postfix) with ESMTPA id 8AA1FBED;
 Thu, 20 Jun 2019 09:55:52 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561017352; bh=I9yh62n62fOtNAxNA/Rg9Z/P51cUAU9tBtya1CFeQ4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RbquC23fVadb2GRbKQQ7XNWjEadEkEfGI/tzy5jbgqGuXdRkqfd0O7JaGoqiEqvVK
 iA7uH35Ty5wIArRlwEK37Eh2uPihtTFZi+YfmT4fhZNOze6HtGwpZmyAYPK3h01VIK
 bI0W0Xu+5iXEmCJ83Mc0bP7pR3eEt/HKWtDcE06Kt1QWZ9sBf8zWakByOClfPTOey6
 q+Ru+dGtHDWWcLRz0f7E2oiz5WybqdvFwPNfdvj5aRqmegmb4ilQcDi4ItIUJNQjMY
 WHJMU9ffkq15T33xhSqeWk0mblmZl8cwF+JoMUWsE2OH9HM5Gxr/MNmpQ7oKltKJv7
 w/+R5z1SsZPvpbNZTlptMh1jBDZl1IAHzeWuPWn7mMKUrqJZpHg9IALHQAUEB2irak
 KyOqnHdQT314oBSFqm61xTRNxWp1y5bRoIyUlCad4qr/hh6ZYjGTUhAuEmQ83x37q/
 5/Qal684FNbY0g1ygqSilQQs71Nn1ZBNQx8lmaL6iswf0MqTTuclRuer3tZ7TkAkan
 snZZE7NYcc1sjtRfqDAybXgOE3gEGRl2XY98or7DRxLz6YP6u6XG7XXV5AWO6+zbOi
 Hr6vTSia+jkQIRSSV5AGo4A1BbdW4LHWxWowOPCtJrjxyT2UhL05Z7IBDuQVEgKwoN
 OYXZ/Gw6VrKK5fGA010kD64g=
MIME-Version: 1.0
Date: Thu, 20 Jun 2019 09:55:50 +0200
From: Aymeric <mulx@aplu.fr>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: network unstable on odroid-c1/meson8b.
In-Reply-To: <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
References: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
 <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
Message-ID: <d2e298040f4887c547da11178f9ea64f@aplu.fr>
X-Sender: mulx@aplu.fr
User-Agent: Roundcube Webmail/1.2.9
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_005601_014399_6CDDD9FA 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCk9uIDIwMTktMDYtMjAgMDA6MTQsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPiBPbiAxOS4w
Ni4yMDE5IDIyOjE4LCBBeW1lcmljIHdyb3RlOgo+PiBIZWxsbyBhbGwsCj4+IAoKPiBLZXJuZWwg
My4xMCBkaWRuJ3QgaGF2ZSBhIGRlZGljYXRlZCBSVEw4MjExRiBQSFkgZHJpdmVyIHlldCwgdGhl
cmVmb3JlCj4gSSBhc3N1bWUgdGhlIGdlbnBoeSBkcml2ZXIgd2FzIHVzZWQuIERvIHlvdSBoYXZl
IGEgbGluZSB3aXRoCj4gImF0dGFjaGVkIFBIWSBkcml2ZXIiIGluIGRtZXNnIG91dHB1dCBvZiB0
aGUgdmVuZG9yIGtlcm5lbD8KCk5vLgpIZXJlIGlzIHRoZSBmdWxsIG91dHB1dCBvZiB0aGUgZG1l
c2cgZnJvbSB2ZW5kb3Iga2VybmVsIFvCuV0uCgpJJ3ZlIGFsc28gbm90aWNlZCBzb21ldGhpbmcg
c3RyYW5nZSwgaXQgbWlnaHQgYmUgbGlua2VkLCBidXQgbWFjIGFkZHJlc3MgCm9mIHRoZSBib2Fy
ZCBpcyBzZXQgdG8gYSByYW5kb20gdmFsdWUgd2hlbiB1c2luZyBtYWlubGluZSBrZXJuZWwgYW5k
IApJJ3ZlIHRvIHNldCBpdCBtYW51YWxseSBidXQgbm90IHdoZW4gdXNpbmcgdmVuZG9yIGtlcm5l
bC4KCj4gCj4gVGhlIGRlZGljYXRlZCBQSFkgZHJpdmVyIHRha2VzIGNhcmUgb2YgdGhlIHR4IGRl
bGF5LCBpZiB0aGUgZ2VucGh5Cj4gZHJpdmVyIGlzIHVzZWQgd2UgaGF2ZSB0byByZWx5IG9uIHdo
YXQgdWJvb3QgY29uZmlndXJlZC4KPiBCdXQgaWYgd2UgaW5kZWVkIGhhZCBhbiBpc3N1ZSB3aXRo
IGEgbWlzY29uZmlndXJlZCBkZWxheSwgSSB0aGluawo+IHRoZSBjb25uZWN0aW9uIHNob3VsZG4n
dCBiZSBmaW5lIHdpdGgganVzdCBhbm90aGVyIGxpbmsgcGFydG5lci4KPiBKdXN0IHRvIGhhdmUg
aXQgdGVzdGVkIHlvdSBjb3VsZCBtYWtlIHJ0bDgyMTFmX2NvbmZpZ19pbml0KCkgaW4KPiBkcml2
ZXJzL25ldC9waHkvcmVhbHRlay5jIGEgbm8tb3AgKGluIGN1cnJlbnQga2VybmVscykuCj4gCgpJ
J20gbm90IGFuIGV4cGVydCBoZXJlLCBqdXN0IGFkZGluZyBhICJyZXR1cm4gMDsiIGhlcmVbwrJd
IHdvdWxkIGJlIAplbm91Z2g/Cgo+IEFuZCB5b3UgY291bGQgY29tcGFyZSBhdCBsZWFzdCB0aGUg
YmFzaWMgUEhZIHJlZ2lzdGVycyAweDAwIC0gMHgzMAo+IHdpdGggYm90aCBrZXJuZWwgdmVyc2lv
bnMsIGUuZy4gd2l0aCBwaHl0b29sLgo+IAoKVGhleSBhcmUgbm90IHRoZSBzYW1lIGJ1dCBJIGRv
bid0IGtub3cgd2hhdCBJJ20gbG9va2luZyBmb3IsIHNvIGZvciAKa2VybmVsIDMuMTAgW8KzXSBh
bmQgZm9yIGtlcm5lbCA1LjEuMTIgW+KBtF0uCgpBeW1lcmljCgpbwrldOiAKaHR0cHM6Ly9wYXN0
ZS5hcGx1LmZyLz8zOGVmOTViNDRlYmRiZmMzI0c2NjYvWWJoZ1UrTyt0ZEMvMkhhaW1VQ2lnbTha
VEI0NHF2UWlwL0hKNUE9ClvCsl06IApodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi8yNDFlMzkwMDQ1ODE0NzViMjgwMmNkNjNjMTExZmVjNDNiYjAxMjNlL2RyaXZlcnMvbmV0
L3BoeS9yZWFsdGVrLmMjTDE2NApbwrNdOiAKaHR0cHM6Ly9wYXN0ZS5hcGx1LmZyLz8yZGRlMWMz
MmQ1YzY4ZjRjIzZ4SWE4TWpUbTZqcEk2Y2l0RUpBcUZUTE1NSERqRlpSZXQvTTAwL0V3alU9Clvi
gbRdOiAKaHR0cHM6Ly9wYXN0ZS5hcGx1LmZyLz8zMjEzMGU5YmNiMDVkZGU3I04veGRudmI1R2ts
Y0p0aU94TXBUQ20rOWdzVWxpUndIOFgzZGN3U1Yrbmc9CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
