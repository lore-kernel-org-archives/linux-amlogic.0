Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99680C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Dec 2022 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kf4jbp3iNB57PCx5KNiyIM8Ol/mEVVIap9wgCEA32E=; b=il4PCd6DoeQlRf
	jV/aZsAN5CU+IBpCaALylhXA4kq6lvDwM9sgl4zpyZNcAjYeQzo9zxDd9cBDUEB0NEHYq5tsSkyC1
	kMqhLBCVtWjkAFITwGB8tgpPbvizKqAF+CnnPiAAvuC5ldpJt/YfytuHJ9W+583DJB2iKRx5QY5gk
	RjlBELRVdTCRXe9V53j+xH9aXynXtAJXEN+VP7xtnByvENlQks8X0VyU2i5jhmg5uaKgM4YMJZiEw
	Ut9h4E1Cn+vf+KTvl4cJDWMqwSoqDA2XOpJhcy0j31cAOASi6VBbdqpqRjyarNJSxOvrrnpg/GsgC
	SBRSkJA/tFoBXmYKi8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4j3R-00GYuQ-Fx; Mon, 12 Dec 2022 13:41:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4j3O-00GYt2-JR
	for linux-amlogic@lists.infradead.org; Mon, 12 Dec 2022 13:41:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id b2so28039374eja.7
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Dec 2022 05:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwMulXCSbTrtP1XfhJWREaTz63d0JWgKPd4o9d0N3gs=;
        b=WlpFWaWq7WyAyaN664deEaci8x3sKxG/NF6iap60r+VLFSTMcJCITs0r53L7N518h1
         ErQ7fdCVPjtmVe+p1AiGysH1cu/1WzCiIEHkvQYn7t9niPeo8wGG/hCDI8hz0MeFrtQI
         i0hAhlFvLnMCgitSHi8b1TrU20NmG2CEoDs0dl9PrLn35OL8fTxudTISZutvrRNk61VF
         tnIBwLzc2Hg1V+GEzSf4azK5GwC0a9jQtM3ZUbqOoWQHPFhKY5avFqYNXmDZHqHnX1/a
         EkuknZy2++8eSncd2YQsmhW4uuPLZ04t9MSvvfoSPy+F2sdkFqwL90J1tsRZQFXseLBH
         rCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwMulXCSbTrtP1XfhJWREaTz63d0JWgKPd4o9d0N3gs=;
        b=m0+QlcwvGtiekFjsYfBVFHYzq6cpABGNAfwLD74PPwedjwNUTUE9Aqc+VAxYVkCTwH
         89hWMnca22RJyvMpXobEgQsqRHxsIRVLJsQ7HAULdhxc6Ptobz1NdCpkBip9kBy3nB3j
         kwU0fdP5E2nUfMzcXb5RCJfh6wpODieXbiMxW1J/3T1XtC94B0a/XBOFLG7XrfM+HPwa
         lTXPmn5EpK8GY7eWWWX78ON+V4eGdrcxaafDglnVG742NqlcL67N2pVFFNsf30sjs9k9
         eSF+thqhS2f5qVbzg4xDOQKkRT+wX8x/JKUmE1Ohj00V50mjowECjR5UnLxZk81mt9G3
         TgWw==
X-Gm-Message-State: ANoB5ple78/dH5vwPXV0uP2Lm/rytReLe0nqIkElPKJ3crPDdvEpzz6u
	RHvH8q6bH1OKBAw+EVwfV7c=
X-Google-Smtp-Source: AA0mqf5mtDgMbSnvfmeHxKg5VIsYzUQlBlOaA/uNIFdC15biG4DgEfv/eLk1eSXHXRRL4N+xV10l3Q==
X-Received: by 2002:a17:906:1805:b0:7b2:7b66:9ed4 with SMTP id v5-20020a170906180500b007b27b669ed4mr18953923eje.47.1670852468030;
        Mon, 12 Dec 2022 05:41:08 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id kr12-20020a1709079a0c00b007ae10525550sm3263772ejc.47.2022.12.12.05.41.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Dec 2022 05:41:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <OS0P286MB06413425DA9936EC32D100ABCDE29@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Date: Mon, 12 Dec 2022 17:41:04 +0400
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Message-Id: <295B87DA-07A6-42AE-A364-837579C8262B@gmail.com>
References: <33E05D5D-E8C8-4493-B269-E3020D98740C@gmail.com>
 <OS0P286MB06413425DA9936EC32D100ABCDE29@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
To: Zhang Ning <zhangn1985@outlook.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_054110_659623_682D6F14 
X-CRM114-Status: GOOD (  16.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMTIgRGVjIDIwMjIsIGF0IDQ6NTcgcG0sIFpoYW5nIE5pbmcgPHpoYW5nbjE5ODVAb3V0
bG9vay5jb20+IHdyb3RlOgo+IAo+IE9uIEZyaSwgRGVjIDA5LCAyMDIyIGF0IDAyOjU3OjQwUE0g
KzA0MDAsIENocmlzdGlhbiBIZXdpdHQgd3JvdGU6Cj4+IFtzbmlwXQo+PiAKPj4gSGVsbG8gWmhh
bmcsCj4+IAo+PiBJ4oCZdmUgdGVzdC1ib290ZWQgYSBWSU0xIHVzaW5nIG15IGN1cnJlbnQgYW1s
b2dpYy02LjEueSBicmFuY2ggKGJhc2VkIG9uIHJjOCkgYW5kIEkgZG9u4oCZdCBzZWUgYW4gaXNz
dWUgd2l0aCBXaUZpOgo+PiAKPj4gaHR0cDovL2l4LmlvLzRpN00KPj4gCj4+IEhlcmXigJlzIHRo
ZSBrZXJuZWwgc291cmNlIGFuZCBkZWZjb25maWc6Cj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20v
Y2hld2l0dC9saW51eC9jb21taXRzL2FtbG9naWMtNi4xLnkKPj4gaHR0cHM6Ly9naXRodWIuY29t
L2NoZXdpdHQvTGlicmVFTEVDLnR2L2Jsb2IvYW1sb2dpYy9wcm9qZWN0cy9BbWxvZ2ljL2xpbnV4
L2xpbnV4LmFhcmNoNjQuY29uZgo+IAo+IEkgbmF0aXZlIGJ1aWxkIGtlcm5lbCBmcm9tIGRlYmlh
bidzIGtlcm5lbCByZXBvOiBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcva2VybmVsLXRlYW0vbGlu
dXgvCj4gd2l0aCBzb21lIEFtbG9naWMgcGF0Y2hlczogaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3Jn
L3poYW5nbjE5ODUvbGludXgvLS90cmVlL21hc3Rlci9kZWJpYW4vcGF0Y2hlcy9mZWF0dXJlcy9h
cm02NC9tZXNvbgo+IGFsbCBmb2xsb3cgZGViaWFuJ3Mga2VybmVsIGNvbmZpZy4KPiAKPj4gCj4+
IEluIHRoZSBMRSBpbWFnZSBJIGhhdmUgd2xhbjAgYW5kIGNvbm5tYW4gaXMgbGlzdGluZyBzZXJ2
aWNlczoKPj4gCj4+IFZJTTE6fiAjIGlmY29uZmlnCj4+IGV0aDAgICAgICBMaW5rIGVuY2FwOkV0
aGVybmV0ICBIV2FkZHIgMTY6QTc6Nzk6OTM6QkU6RUIgIAo+PiAgICAgICAgIGluZXQgYWRkcjox
OTIuMTY4LjIwLjEyICBCY2FzdDoxOTIuMTY4LjIwLjI1NSAgTWFzazoyNTUuMjU1LjI1NS4wCj4+
ICAgICAgICAgVVAgQlJPQURDQVNUIFJVTk5JTkcgTVVMVElDQVNUICBNVFU6MTUwMCAgTWV0cmlj
OjEKPj4gICAgICAgICBSWCBwYWNrZXRzOjEwMzYgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5z
OjAgZnJhbWU6MAo+PiAgICAgICAgIFRYIHBhY2tldHM6MzA4IGVycm9yczowIGRyb3BwZWQ6MCBv
dmVycnVuczowIGNhcnJpZXI6MAo+PiAgICAgICAgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEw
MDAgCj4+ICAgICAgICAgUlggYnl0ZXM6MjUyNDczICgyNDYuNSBLaUIpICBUWCBieXRlczoxMzQx
ODkgKDEzMS4wIEtpQikKPj4gICAgICAgICBJbnRlcnJ1cHQ6MzIgCj4+IC4uLgo+PiAKPj4gd2xh
bjAgICAgIExpbmsgZW5jYXA6RXRoZXJuZXQgIEhXYWRkciBDQzpCODpBODpCNTo5Rjo4NiAgCj4+
ICAgICAgICAgVVAgQlJPQURDQVNUIE1VTFRJQ0FTVCAgTVRVOjE1MDAgIE1ldHJpYzoxCj4+ICAg
ICAgICAgUlggcGFja2V0czowIGVycm9yczowIGRyb3BwZWQ6MCBvdmVycnVuczowIGZyYW1lOjAK
Pj4gICAgICAgICBUWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5zOjAgY2Fy
cmllcjowCj4+ICAgICAgICAgY29sbGlzaW9uczowIHR4cXVldWVsZW46MTAwMCAKPj4gICAgICAg
ICBSWCBieXRlczowICgwLjAgQikgIFRYIGJ5dGVzOjAgKDAuMCBCKQo+IAo+IEknbSBoYXBweSB0
byBzZWUgV0lGSSB3b3Jrcy4KPiAKPiBXSUZJIG9uIG15IFZJTTEsIGl0IGNhbiBjb25uZWN0IHRv
IEFQIGFuZCBnZXQgSVAgYWRkcmVzcy4KPiBidXQgYWZ0ZXIgYSB3aGlsZSwgMXNlY341bWluLCBz
c2ggdGhydSB3aWZpIGlzIHN0dWNrZWQsIHRpbWVvdXQgbG9ncwo+IHByaW50IHRvIHVhcnQgY29u
c29sZS4KPiAKPiBjb3VsZCB5b3UgdHJ5IHRvIGNvbm5lY3QgdG8gQVAgYW5kIHVzZSB3aWZpPwoK
T24gdGhlIDYuMS1yYzggaW1hZ2UgSSB3YXMgdXNpbmcgaXQgY29ubmVjdGVkIG9uY2UsIHRoZW4g
b24gYSByZWJvb3QgSSBoYWQgbm8gd2xhbjAKaW50ZXJmYWNlIGFuZCB0aGlzIHdhcyBsb2dnZWQ6
CgpbICAgMTMuNzg5MzIxXSBicmNtZm1hYzogYnJjbWZfc2Rpb19idXNfcnhjdGw6IHJlc3VtZWQg
b24gdGltZW91dAoKSeKAmXZlIHNpbmNlIHVwZGF0ZWQgdG8gYW4gaW1hZ2UgdXNpbmcgNi4xIGZp
bmFsIGFuZCBnb3QgdGhlIGludGVyZmFjZSBiYWNrLiBJ4oCZbSBub3QKc3VyZSBJIGNhbiBleHBs
YWluIHRoZSBkaXNhcHBlYXJhbmNlIGJ1dCBpdOKAmXMgYmVlbiBmaW5lIHNpbmNlIGFuZCBJ4oCZ
dmUgaGFkIGEgbW92aWUKcGxheWluZyBub3cgZm9yIH4yMCBtaW5zLiBOb3JtYWxseSBpZiBJ4oCZ
bSBnb2luZyB0byBzZWUgYSBXaUZpIGlzc3VlIHRoaW5ncyBmYWlsIHRvCnBsYXkgb3IgY29ubmVj
dC4KClZJTTE6fiAjIGRtZXNnIHwgZ3JlcCBicmNtZm1hYwpbICAgMTAuMjI4MzU2XSBicmNtZm1h
YzogRjEgc2lnbmF0dXJlIHJlYWQgQDB4MTgwMDAwMDA9MHgxNTQxYTlhNgpbICAgMTAuMjU3NzUy
XSBicmNtZm1hYzogYnJjbWZfZndfYWxsb2NfcmVxdWVzdDogdXNpbmcgYnJjbS9icmNtZm1hYzQz
NDMwLXNkaW8gZm9yIGNoaXAgQkNNNDM0MzAvMQpbICAgMTAuMzU3NTEwXSBicmNtZm1hYyBtbWMy
OjAwMDE6MTogRGlyZWN0IGZpcm13YXJlIGxvYWQgZm9yIGJyY20vYnJjbWZtYWM0MzQzMC1zZGlv
LmNsbV9ibG9iIGZhaWxlZCB3aXRoIGVycm9yIC0yClsgICAxMC41MTA3MzhdIGJyY21mbWFjOiBi
cmNtZl9jX3Byb2Nlc3NfY2xtX2Jsb2I6IG5vIGNsbV9ibG9iIGF2YWlsYWJsZSAoZXJyPS0yKSwg
ZGV2aWNlIG1heSBoYXZlIGxpbWl0ZWQgY2hhbm5lbHMgYXZhaWxhYmxlClsgICAxMC41MTE0NzJd
IGJyY21mbWFjOiBicmNtZl9jX3ByZWluaXRfZGNtZHM6IEZpcm13YXJlOiBCQ000MzQzMC8xIHds
MDogT2N0ICA4IDIwMTYgMTU6MzE6NDcgdmVyc2lvbiA3LjQ2LjU3LjQuYXAucjQgKEExIFN0YXRp
b24vUDJQKSBGV0lEIDAxLTM2MjEzOTVlIGVzNi5jNS5uNC5hMwoKSSBvY2Nhc2lvbmFsbHkgc2Vl
IHRoaXMgbG9nZ2VkLCBidXQgSSBhc3N1bWUgdGhpcyBpcyBub3JtYWwvbm90LWhhcm1mdWw6Cgpb
ICAyMDEuNTc0ODExXSBpZWVlODAyMTEgcGh5MDogYnJjbWZfcDJwX3NlbmRfYWN0aW9uX2ZyYW1l
OiBVbmtub3duIEZyYW1lOiBjYXRlZ29yeSAweDUsIGFjdGlvbiAweDQKWyAgMjA0LjIyMzg5NV0g
bWVzb24tZ3gtbW1jIGQwMDcwMDAwLm1tYzogdW5hbGlnbmVkIHNnIGxlbiAzMTIgYmxrc2l6ZSA1
MTIsIGRpc2FibGluZyBkZXNjcmlwdG9yIERNQSBmb3IgdHJhbnNmZXIKCkNocmlzdGlhbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
