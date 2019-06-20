Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEFCC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 20:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F4E2082C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 20:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNR7WMmA";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="puG/6pXR";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="puG/6pXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F4E2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkJx9UkyRKkp7xxVn0Ooi7OT25S51MdcXDc3UGLMjc4=; b=RNR7WMmAMSANuq
	oWkUzPB5ZA57TRWw6fg4RUV+RyxcJsGnYqMMYy3+iuawtSunw2gV/bv6Q+Pcaez29Q4kRPKiitzg6
	6WPlJluUIAsvYmpsuqi1tHT6BGUidIvTLYbMKK0p7LluJ1IEIF2pfPs2DHSYKTTXe5qAfOUTsfuQq
	EcXQ98cbIU9dSHEVCxfpb0UQ/3TH0SGw+vssgi1Zd4Tj28t0bu3sgKEWE9ogddhgxia9+1AJlJCyE
	cwo35CSICTrmgxi27hJHlHHiJIc6SvfCmjsq/8zesVF62CSbSVgMfeBzETs8dhdWyl1bIxTJWABB6
	muIJ1O7NGcHzXa+3xG+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he44M-0003Ee-8c; Thu, 20 Jun 2019 20:54:06 +0000
Received: from eva.aplu.fr ([91.224.149.41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he44J-0003Cp-9m
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 20:54:05 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 6C0C1E23;
 Thu, 20 Jun 2019 22:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561064041; bh=LtI+tPVMB4RYk2slsi4mBlOat6JXi7mCefXAD75d3Fk=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=puG/6pXRkzMSJohQkanknPlZH+FVI05ro5OWrlKWk2GahZM14Bd4y6W98lPUNe8m8
 wSCxZANSblcOwMCjnXBLE/i0ZVILNg8RJE3EOo6JhPpVTta8rFxzBgm8II8miA6xP/
 0rOYhCJp0M8pJJ8ceYoIDMXSlKoy25Yg4diLuyHOh7CzoYq3zgm8SCcyGiVdjHlyrm
 dfEZGf413sGWuGG9X9EnZQMFzvFxriGXw/fngkNEp/5UiPapfOqTRM617KcNlF+rb1
 fspgAtswFkJeN7umTxjpfHnMbROw0B30C/m5aEU2qKjcLm1/9gIFIB5K7P/UzYxKXJ
 WOaeDN4VvqpftCCgRECxkatMaVzKM3hOB3Bw/+Jv4mJ/0foNGj5Cb8fRebh1vhlC/A
 YGSNT52BlP+eVJZ2ouIdkzwGDHPnB2oyqvD/Pup/bszJdoSIeuwM2uOjFBE/2GAhfA
 nVekQwja0GZ7OlxrbO6RzeoTRn5KVAipwcdgWeEMegLf6682Mwr4PkvDlQiq4EKJaj
 oCOLpJ8EZP5NRmiXye5TTtbxuiVEHyiiKgEs36fku0p/Gz+KFoeag+SQtwS+MNFOhx
 j62ahir/NY75qfB8Vt90zNJljZVmY7yagGFXdlXVzFHzBNr6YmFUCMlGOMPKRw6GVI
 WKJYSFNHgzSkM3xumW96HuAU=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id D7D4DD25;
 Thu, 20 Jun 2019 22:54:00 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1561064041; bh=LtI+tPVMB4RYk2slsi4mBlOat6JXi7mCefXAD75d3Fk=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=puG/6pXRkzMSJohQkanknPlZH+FVI05ro5OWrlKWk2GahZM14Bd4y6W98lPUNe8m8
 wSCxZANSblcOwMCjnXBLE/i0ZVILNg8RJE3EOo6JhPpVTta8rFxzBgm8II8miA6xP/
 0rOYhCJp0M8pJJ8ceYoIDMXSlKoy25Yg4diLuyHOh7CzoYq3zgm8SCcyGiVdjHlyrm
 dfEZGf413sGWuGG9X9EnZQMFzvFxriGXw/fngkNEp/5UiPapfOqTRM617KcNlF+rb1
 fspgAtswFkJeN7umTxjpfHnMbROw0B30C/m5aEU2qKjcLm1/9gIFIB5K7P/UzYxKXJ
 WOaeDN4VvqpftCCgRECxkatMaVzKM3hOB3Bw/+Jv4mJ/0foNGj5Cb8fRebh1vhlC/A
 YGSNT52BlP+eVJZ2ouIdkzwGDHPnB2oyqvD/Pup/bszJdoSIeuwM2uOjFBE/2GAhfA
 nVekQwja0GZ7OlxrbO6RzeoTRn5KVAipwcdgWeEMegLf6682Mwr4PkvDlQiq4EKJaj
 oCOLpJ8EZP5NRmiXye5TTtbxuiVEHyiiKgEs36fku0p/Gz+KFoeag+SQtwS+MNFOhx
 j62ahir/NY75qfB8Vt90zNJljZVmY7yagGFXdlXVzFHzBNr6YmFUCMlGOMPKRw6GVI
 WKJYSFNHgzSkM3xumW96HuAU=
From: Aymeric <mulx@aplu.fr>
Subject: Re: network unstable on odroid-c1/meson8b.
To: Heiner Kallweit <hkallweit1@gmail.com>
References: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
 <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
 <d2e298040f4887c547da11178f9ea64f@aplu.fr>
 <1f34f3b6-2c70-9ff3-3f5a-597e4bd9c66f@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fc416bf0-3f3c-72a8-0500-4e487d8f3a27@aplu.fr>
Date: Thu, 20 Jun 2019 22:54:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1f34f3b6-2c70-9ff3-3f5a-597e4bd9c66f@gmail.com>
Content-Language: fr
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_135403_643787_CC60BA88 
X-CRM114-Status: GOOD (  15.36  )
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

CkxlIDIwLzA2LzIwMTkgw6AgMTc6NTMsIEhlaW5lciBLYWxsd2VpdCBhIMOpY3JpdMKgOgo+IE9u
IDIwLjA2LjIwMTkgMDk6NTUsIEF5bWVyaWMgd3JvdGU6Cj4+IEhpLAo+PiBPbiAyMDE5LTA2LTIw
IDAwOjE0LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+PiBPbiAxOS4wNi4yMDE5IDIyOjE4LCBB
eW1lcmljIHdyb3RlOgo+Pj4+IEhlbGxvIGFsbCwKPj4+Pgo+Pj4gS2VybmVsIDMuMTAgZGlkbid0
IGhhdmUgYSBkZWRpY2F0ZWQgUlRMODIxMUYgUEhZIGRyaXZlciB5ZXQsIHRoZXJlZm9yZQo+Pj4g
SSBhc3N1bWUgdGhlIGdlbnBoeSBkcml2ZXIgd2FzIHVzZWQuIERvIHlvdSBoYXZlIGEgbGluZSB3
aXRoCj4+PiAiYXR0YWNoZWQgUEhZIGRyaXZlciIgaW4gZG1lc2cgb3V0cHV0IG9mIHRoZSB2ZW5k
b3Iga2VybmVsPwo+PiBOby4KPj4gSGVyZSBpcyB0aGUgZnVsbCBvdXRwdXQgb2YgdGhlIGRtZXNn
IGZyb20gdmVuZG9yIGtlcm5lbCBbwrldLgo+Pgo+PiBJJ3ZlIGFsc28gbm90aWNlZCBzb21ldGhp
bmcgc3RyYW5nZSwgaXQgbWlnaHQgYmUgbGlua2VkLCBidXQgbWFjIGFkZHJlc3Mgb2YgdGhlIGJv
YXJkIGlzIHNldCB0byBhIHJhbmRvbSB2YWx1ZSB3aGVuIHVzaW5nIG1haW5saW5lIGtlcm5lbCBh
bmQgSSd2ZSB0byBzZXQgaXQgbWFudWFsbHkgYnV0IG5vdCB3aGVuIHVzaW5nIHZlbmRvciBrZXJu
ZWwuCj4+Cj4+PiBUaGUgZGVkaWNhdGVkIFBIWSBkcml2ZXIgdGFrZXMgY2FyZSBvZiB0aGUgdHgg
ZGVsYXksIGlmIHRoZSBnZW5waHkKPj4+IGRyaXZlciBpcyB1c2VkIHdlIGhhdmUgdG8gcmVseSBv
biB3aGF0IHVib290IGNvbmZpZ3VyZWQuCj4+PiBCdXQgaWYgd2UgaW5kZWVkIGhhZCBhbiBpc3N1
ZSB3aXRoIGEgbWlzY29uZmlndXJlZCBkZWxheSwgSSB0aGluawo+Pj4gdGhlIGNvbm5lY3Rpb24g
c2hvdWxkbid0IGJlIGZpbmUgd2l0aCBqdXN0IGFub3RoZXIgbGluayBwYXJ0bmVyLgo+Pj4gSnVz
dCB0byBoYXZlIGl0IHRlc3RlZCB5b3UgY291bGQgbWFrZSBydGw4MjExZl9jb25maWdfaW5pdCgp
IGluCj4+PiBkcml2ZXJzL25ldC9waHkvcmVhbHRlay5jIGEgbm8tb3AgKGluIGN1cnJlbnQga2Vy
bmVscykuCj4+Pgo+PiBJJ20gbm90IGFuIGV4cGVydCBoZXJlLCBqdXN0IGFkZGluZyBhICJyZXR1
cm4gMDsiIGhlcmVbwrJdIHdvdWxkIGJlIGVub3VnaD8KPj4KPj4+IEFuZCB5b3UgY291bGQgY29t
cGFyZSBhdCBsZWFzdCB0aGUgYmFzaWMgUEhZIHJlZ2lzdGVycyAweDAwIC0gMHgzMAo+Pj4gd2l0
aCBib3RoIGtlcm5lbCB2ZXJzaW9ucywgZS5nLiB3aXRoIHBoeXRvb2wuCj4+Pgo+PiBUaGV5IGFy
ZSBub3QgdGhlIHNhbWUgYnV0IEkgZG9uJ3Qga25vdyB3aGF0IEknbSBsb29raW5nIGZvciwgc28g
Zm9yIGtlcm5lbCAzLjEwIFvCs10gYW5kIGZvciBrZXJuZWwgNS4xLjEyIFvigbRdLgo+Pgo+PiBB
eW1lcmljCj4+Cj4+IFvCuV06IGh0dHBzOi8vcGFzdGUuYXBsdS5mci8/MzhlZjk1YjQ0ZWJkYmZj
MyNHNjY2L1liaGdVK08rdGRDLzJIYWltVUNpZ204WlRCNDRxdlFpcC9ISjVBPQo+PiBbwrJdOiBo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi8yNDFlMzkwMDQ1ODE0NzViMjgw
MmNkNjNjMTExZmVjNDNiYjAxMjNlL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMjTDE2NAo+PiBb
wrNdOiBodHRwczovL3Bhc3RlLmFwbHUuZnIvPzJkZGUxYzMyZDVjNjhmNGMjNnhJYThNalRtNmpw
STZjaXRFSkFxRlRMTU1IRGpGWlJldC9NMDAvRXdqVT0KPj4gW+KBtF06IGh0dHBzOi8vcGFzdGUu
YXBsdS5mci8/MzIxMzBlOWJjYjA1ZGRlNyNOL3hkbnZiNUdrbGNKdGlPeE1wVENtKzlnc1VsaVJ3
SDhYM2Rjd1NWK25nPQo+Pgo+IFRoZSB2ZW5kb3Iga2VybmVsIGhhcyBzb21lLCBidXQgbm90IHJl
YWxseSBtdWNoIG1hZ2ljOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9oYXJka2VybmVsL2xpbnV4L2Js
b2Ivb2Ryb2lkYy0zLjEwLnkvZHJpdmVycy9hbWxvZ2ljL2V0aGVybmV0L3BoeS9hbV9ydGw4MjEx
Zi5jCj4gVGhlIHdyaXRlIHRvIFJUTDgyMTFGX1BIWUNSMiBpcyBvdmVyd3JpdHRlbiBsYXRlciwg
dGhlcmVmb3JlIHdlIGRvbid0IGhhdmUgdG8gY29uc2lkZXIgaXQuCj4KPiBUaGUgZm9sbG93aW5n
IHNob3VsZCBtYWtlIHRoZSBjdXJyZW50IFJlYWx0ZWsgUEhZIGRyaXZlciBiZWhhdmUgbGlrZSBp
biB0aGUgdmVuZG9yIGRyaXZlci4KPiBDb3VsZCB5b3UgdGVzdCBpdD8KCihzZW5kaW5nIGFnYWlu
IGZvciBtYWlsaW5nIGxpc3QsIHNvcnJ5LCBJIGZvcmdvdCB0byBmb3JjZSBpdCBpbiBwbGFpbnRl
eHTigKYpCgpJJ3ZlIGFwcGxpZWQgeW91ciBwYXRjaCBhbmQgdHJpZWQgYnV0IGl0IGRvZXNuJ3Qg
Y2hhbmdlIGFueXRoaW5nLgoKSGVyZSBpcyBkbWVzZyBvdXRwdXQgYW5kIHBoeXRvb2wgcmVzdWx0
cy4KCmh0dHBzOi8vcGFzdGUuYXBsdS5mci8/OTczNWM5OTkwNzUyODkyOSNTZUNnd1I0NWNnbmJE
QTF0WElWQkhDQlQ4Uk5jdDJyNDFqVTZ2c2d1TFZjPQoKLS0gCkF5bWVyaWMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
