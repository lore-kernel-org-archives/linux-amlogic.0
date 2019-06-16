Return-Path: <SRS0=LsuB=UP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C261C31E53
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 16:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C140020870
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 16:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ky1SAagY";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="cZ72rWv+";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="TEp3pWXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C140020870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iER7jwlQW+qvocU9gv3mDi8mOdlG7s8tpKseLl7r5vE=; b=ky1SAagYRjEgIy
	sJhOov4RfvsGW6ubNaVio9nwyhZWrFExVknukpaU6DG5dnepayQp+28IJ2OBC4fp4PqvYw6+jQS8T
	UQeMpBZZleV1Asn9rJcAMOJcUJu2VNBGWUq1BRhd9OxjJTxH49PQum5gJUzQiPMz/Aui1dLNLRzQm
	xiamFSawID+DReyLblTeWQTAzwkHkdqrGAFMkrzYfjbQUEMiwWUcXkVSgssszVRqrVpXZeVBevELx
	7JqQZbI/MT8m9QlHc/GqY/rJshQ8Aj34cCdB7VRizVQMtxaVwfPog/im2e8mKJEIA9Zens+gn/XZZ
	Ff0v0FiX8r8T3GOnPbEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcXer-0004Ts-LA; Sun, 16 Jun 2019 16:05:29 +0000
Received: from eva.aplu.fr ([2a03:7220:8081:2900::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcXen-0004Si-T3
 for linux-amlogic@lists.infradead.org; Sun, 16 Jun 2019 16:05:27 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id EE0CCE27;
 Sun, 16 Jun 2019 18:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560701108; bh=FaWMDh0Q99ptJfYifDNwdLuEiGuLSOEPRej4VxacE5c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cZ72rWv+hsx6xwmboCECYTLLq4hXzdslLqBp9SvD/LGKOGlLWn6uunE7GpHTPNaER
 OBUTSTMTLMIblrlcg1am+W8+jUZmJIFHGRt2sm5oxpQyNpzyGWjXsizNIgpkQ5JBrv
 vc/b6z8hs3NBMWyfBHTVVz0iypQdp+OIbMixHz+yk3CXtj41z8P7k2Q3eZwNB0pWsd
 j0rlIB8PxV0WU05IC7O4QdeLCWk9zy576s6yCeiHe0SODvPpoW42a6LndI6ESgtTN2
 meG+ILkg3umZKBUkVwhQBlpAVtu4ymXICfXE7IcQM7GObv/XqkGl/yOz9oLkiqiuqN
 bfdGYBhUzbg8AzDEBrr/Ew8OOcJSfT2mmvr5dRDKnVlvlJqxDCCyXasbiG8jwpkp7V
 djfXRVZNphAxSy488kM2y6r0UyNj/Ybmdy+DTLRgcKtBAo3Ov8vw9s4keP8Jud/EEu
 U9eJ7vYzHMAbE7kvh2s+9rzNhXcV8RotCw0GUq4KP7I0Or0A+6BLiO/2dWnaGysOM2
 DtUJegiULit0A+wmAi/sJ38dIPTf018XaQF80iNmSkhOo9Jmbp3/keAPjZVeLyLfrE
 PuWieQTmwxRIAf3O1mS9wkK3C5Sp6xIRcfc2nMy14zRX9I2voZejH4PNrkMhrKw0Nu
 t8QVphbAZjkAAIFYSiJ1IVv0=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id 8E58CBED;
 Sun, 16 Jun 2019 18:05:07 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560701107; bh=FaWMDh0Q99ptJfYifDNwdLuEiGuLSOEPRej4VxacE5c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TEp3pWXjyGyfgNbvaso5LS8D1AehCBYAd+tV+sB6xVO4Aa0QpibyJCz+vOBTYIgmx
 Tg40hHT84CuxdrWyDNW+iKuIjbU59zaVnNIbbplRpSV7DcqyFhJpfPt40W/Xy4bkOP
 vcK06fumDCJh6mraLqSShhiNICid+h/TvMx4/YW7u0MvyqZBHww0kjLBwhinCPLow8
 SrwcWfjpK+Mj9nf6GhJ09uPMbKjVdRBjn7RieLL34lgUJzIMxEHCHdJWl0/OZRWtZS
 VBAz1buKY3sdtEToMYE9IUAMZFq3OC0rR3g0Pujpb0GiGk7wUQX9xPYlSXibSY4gXK
 2F5klAtHGYgO6/Ztr6F+nNG10Aufxclyin5IEOlsYBzLjRp5iZQ17+jG+y4N9EHbST
 bTRX8YlFzg/yvH8Jma/HEexFzV4TokocwtCvyuYn6p/FGtIHooU6e2eI4mL1nuJ+yN
 D29itMemLV1nC+vlDxYo3hqeqBj9WgHGlSQdJNHFHsd266OOhIF7MuaVwa+xV8dGSV
 AmsQyHHkw5gZSTGeO4QNBb+D2JIaWGMZdwmSTtO5kqRs7rmSnoqKJkvi6cOm6AaCLf
 JqfAd4FiK0xd55Rtu4eI1rNH6NPQD2tHFrQWI8blnhhOjSA/s4TVBNFBtWy4Ebb0Mg
 SuND5hylkiR1VOA/oc7pPs2U=
Subject: Re: Meson8b network not stable at gigabit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
 <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
From: Aymeric <mulx@aplu.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
Date: Sun, 16 Jun 2019 18:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
Content-Language: en-US
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_090526_381926_8DC61046 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CkxlIDE1LzA2LzIwMTkgw6AgMTM6MzQsIE1hcnRpbiBCbHVtZW5zdGluZ2wgYSDDqWNyaXTCoDoK
PiBIZWxsbyBBeW1lcmljLApIZWxsbyBNYXJ0aW4sCj4KPiBPbiBTYXQsIEp1biAxNSwgMjAxOSBh
dCAxMjoyMiBBTSBBeW1lcmljIDxtdWx4QGFwbHUuZnI+IHdyb3RlOgo+PiBIZWxsbyBhbGwsCj4+
Cj4+IEkndmUganVzdCBzdWJzY3JpYmUgb24gdGhpcyBtYWlsaW5nIGxpc3QsIHNvIGZvcmdpdmUg
bWUgaWYgSSdtIG5vdAo+PiBmb2xsb3dpbmcgc29tZSBydWxlcy4KPj4KPj4gQW55d2F5LCBJJ3Zl
IGFuIE9EUk9JRC1DMSBib2FyZCAod2hpY2ggbWVhbiBtZXNvbjhiL1M4MDUpIGFuZCBJJ3ZlIHNv
bWUKPj4gbmV0d29yayBzdGFiaWxpdHkgaXNzdWUgd2l0aCBib3RoIGtlcm5lbCA1LjAueCBhbmQg
NS4xLnggKGFzIG9mIHRvZGF5Cj4+IEknbSB1c2luZyA1LjEuOSwgY29tcGlsZWQgbXlzZWxmIC0g
Y29uZmlnIGZpbGUgdXNlZCBpcyBhdmFpbGFibGUgaGVyZSBbwrldKS4KPj4KPj4gVGhlIG5ldHdv
cmsgY2FyZCBpcyBkZXRlY3RpbmcgdGhlIGxpbmsgYXMgZG93biBhbmQgdXAgZXZlcnkgZmV3IHNl
Y29uZHMKPj4gbWFraW5nIGl0IHVudXNhYmxlLgo+IHRoYXQgaXMgYmFkIDooCj4gaG93IGRvIHlv
dSB0cmlnZ2VyIHRoaXMgcHJvYmxlbT8KCkkganVzdCBib290IHRoZSBib2FyZCB3aXRoIHRoZSBu
ZXR3b3JrIGF0dGFjaGVkLCBJJ20gbm90IGRvaW5nIGFueXRoaW5nCnNwZWNpYWwuCkkga25vdyBh
IGZyaWVuZCBvZiBtaW5lLCB3aXRoIHRoZSBzYW1lIGJvYXJkLCB3ZSBib3VnaHQgdGhlbSB0b2dl
dGhlciwKaGFzIHRoZSBzYW1lIGlzc3VlIHRoYW4gbWUuCgoKPgo+PiBUaGUga2VybmVsIGZyb20g
SGFyZGtlcm5lbCAoMy4xMC5zb21ldGhpbmcpIGlzIHdvcmtpbmcgZmluZS4KPiB0aGUgMy4xMCBr
ZXJuZWwgdXNlcyBwb2xsaW5nIGZvciB0aGUgUEhZIHN0YXR1cyB3aGlsZSB0aGUgbWFpbmxpbmUK
PiBrZXJuZWwgdXNlcyBhbiBpbnRlcnJ1cHQuCj4gdGhhdCBtZWFucyAzLjEwIHdpbGwgb25seSBs
b29rIGZvciBhIGxpbmsgY2hhbmdlIGV2ZXJ5IHggbWlsbGlzZWNvbmRzCj4gKEkgYmVsaWV2ZSBp
dCdzIDUwMCBvciAxMDAwIGJ5IGRlZmF1bHQpIHdoaWxlIG1haW5saW5lIHdpbGwKPiAiaW5zdGFu
dGx5IiBkZXRlY3QgYW55IGxpbmsgY2hhbmdlCgpPaCwgb2theSwgZGlkbid0IGtub3cuCgoKPiBj
YW4geW91IHBsZWFzZToKPiAxLiBib290IG1haW5saW5lIExpbnV4Cj4gMi4gYnJpbmcgZXRoMCB1
cAo+IDMuIHJ1biAiY2F0IC9wcm9jL2ludGVycnVwdHMgfCBncmVwIHN0bW1hYyIKPiA0LiB3YWl0
IDEgbWludXRlLCBkbyBub3QgZGlzY29ubmVjdCB0aGUgbmV0d29yayBjYWJsZSBldGMuCj4gNS4g
cnVuICJjYXQgL3Byb2MvaW50ZXJydXB0cyB8IGdyZXAgc3RtbWFjIiBhZ2FpbgoKSnVzdCBhZnRl
ciBib290LCB3aGVuIEkgd2FzIGFibGUgdG8gbG9naW4gdG8gdGhlIGNvbnNvbGUsCgokIHVuYW1l
IC1hCkxpbnV4IG9kcm9pZCA1LjIuMC1yYzQgIzExIFNNUCBQUkVFTVBUIFNhdCBKdW4gMTUgMTk6
Mjc6NDIgQ0VTVCAyMDE5CmFybXY3bCBHTlUvTGludXgKJCBjYXQgL3Byb2MvaW50ZXJydXB0cyB8
IGdyZXAgc3RtbWFjCsKgNDA6wqDCoMKgwqDCoMKgwqDCoCAxMsKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgIG1lc29uLWdwaW8taXJx
Y2hpcMKgIDE3CkxldmVswqDCoMKgwqAgc3RtbWFjLTA6MDAKCgpBbmQgaGVyZSBpcyB3aXRoIG9u
ZSBtaW51dGUgZGVsYXk6CgokIChkYXRlIC1SIDvCoCBjYXQgL3Byb2MvaW50ZXJydXB0cyB8IGdy
ZXAgc3RtbWFjIDsgc2xlZXAgMW0gOyBkYXRlIC1SIDsKY2F0IC9wcm9jL2ludGVycnVwdHMgfCBn
cmVwIHN0bW1hYyApCgpTdW4sIDE2IEp1biAyMDE5IDE3OjIyOjAwICswMjAwCsKgNDA6wqDCoMKg
wqDCoMKgwqDCoCAzMsKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKg
wqDCoMKgwqDCoMKgwqAgMMKgIG1lc29uLWdwaW8taXJxY2hpcMKgIDE3CkxldmVswqDCoMKgwqAg
c3RtbWFjLTA6MDAKU3VuLCAxNiBKdW4gMjAxOSAxNzoyMzowMCArMDIwMArCoDQwOsKgwqDCoMKg
wqDCoMKgwqAgNDfCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKg
wqDCoMKgwqDCoMKgIDDCoCBtZXNvbi1ncGlvLWlycWNoaXDCoCAxNwpMZXZlbMKgwqDCoMKgIHN0
bW1hYy0wOjAwCgo+IGRpZCB5b3UgcnVsZSBvdXQgdGhlIHVzdWFsIHN1c3BlY3RzIChkaWZmZXJl
bnQgc3dpdGNoIHBvcnQsIHRyeSB3aXRoCj4gYW5vdGhlciBjYWJsZSk/CgpJJ3ZlIHRyaWVkIGlu
ZGVlZCBhbHJlYWR5IHRyeSBhbGwgb3RoZXIgcG9ydCBvZiB0aGUgc3dpdGNoIChpdCdzIG15Cmlu
dGVybmV0IGJveCkgYW5kIGFuIG90aGVyIG5ldHdvcmsgY2FibGUsIHdpdGggdGhlIHNhbWUgcmVz
dWx0LgpCdXQgaW50ZXJlc3RpbmdseSBJJ3ZlIHBlcmZvcm1lZCBvbmUgbW9yZSB0ZXN0IHRvZGF5
LCBieSBjb25uZWN0aW5nIHRoZQpvZHJvaWQgdG8gYW4gb3RoZXIgc3dpdGNoIChhIEQtTElOSyA4
cCBnaWdhYml0KSBhbmQgdGhlcmUgd2hhdGV2ZXIgY2FibGUKSSB1c2UsIHRoZSBsaW5rIGJlY2Ft
ZSBzdGFibGUuIFRoaXMgaXMgc3RyYW5nZSBhcyBJJ3ZlIG90aGVyIFBDcwpkaXJlY3RseSBjb25u
ZWN0ZWQgdG8gdGhlIGludGVybmV0IGJveCBhbmQgd29ya2luZyBmaW5lIGluIGdpZ2FiaXTigKYu
IGFuZAp0aGUgZC1saW5rIGFuZCB0aGUgaW50ZXJuZXQgYm94IGFyZSBpbiBnaWdhYml0IHRvby4K
ClRoZSByZXN1bHQgZnJvbSAvcHJvYy9pbnRlcnJ1cHRzIGFib3ZlIGFyZSB3aGVuIEknbSBjb25u
ZWN0ZWQgdG8gbXkKb3BlcmF0b3IgYm94LCBmcm9tIHRoZSBkLWxpbmsgdGhlIHZhbHVlIGRvZXNu
J3QgY2hhbmdlIGFueSBtb3JlLgoKQWNjb3JkaW5nIHRvIHRoZSAiYWJvdXQgcGFnZSIgb2YgdGhl
IGludGVybmV0IGJveCwgdGhpcyBpcyBhIFNhZ2VtY29tCihMaXZlYm94IDMpLgoKU28gaXQgbG9v
ayBsaWtlIHRoZXJlIGEgaW5jb21wYXRpYmlsaXR5IGJldHdlZW4gdGhlIFJlYWx0ZWsgUlRMODIx
MUYgYW5kCnRoZSAiU2FnZW1jb20iIGJ1dCBub3Qgd2l0aCBhICJzdHVwaWQiIGQtbGluayBzd2l0
Y2jigKYuCgoKLS0gCkF5bWVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
