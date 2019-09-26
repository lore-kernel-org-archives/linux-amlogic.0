Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E870C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 12:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5474222C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 12:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PW6STNR8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cyIbSLhH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5474222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Zq5JV1/QYmqmCLNB6vyEEk1ILAjSWWJ2tIoD5mp3fow=; b=PW6STNR8dEIzRw2/rpzkloKeMo
	y28Pd8PMeGa0cgQG/n9VeSTjcda7MU5/MwrwxzKn5MeapKV8BvsrumRB/ZqGP2VA4mWIzicX/tGtn
	jopQr+Z6LKS4ruKgTRoq0ny/OSsdqlUEIZU/Rec7x1EcnPR6EQI+EergSBeJvz/T7kvVdRCWaGtoI
	AV5/A2Qj8KFMn60ZaenK6vE5c6KciswZfnq2eN3Nik9CoRLVPx2f3tNcNID9j5Jf8Fx3PFcaIg5Lp
	rj5T72lUmbtZ93gciRS2aVHEbxuwEgvUSw7xBzexE8TVNZRxBR2i0nWGp4x00Glrgqj0qFJORhCiy
	spExqn0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDTHt-0007Vr-9E; Thu, 26 Sep 2019 12:54:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDTHB-0007D5-W6
 for linux-amlogic@lists.infradead.org; Thu, 26 Sep 2019 12:53:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id r19so2639920wmh.2
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2019 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bUAfab7zScI4DtBLITvVJVb0zk2Mkl7MVExR0/ponPs=;
 b=cyIbSLhHVUEehx0GIdjZV93judCTtCBU1qTpK5+gO7J2pBSSQ5y68ZZxOcNCj+wZXx
 p12fQ7prjIohaEWWfDdYNVDZoxXzuZM/DeDWG5JfZYi5S3pO8f/DavGCLJWNDHgSD4VJ
 l4l7wdP3fkzJOobKsU52d8e6hyiTtKEr1t2vkUlUIAHvI5rleCE9b9B0Vz3p4bBWm7if
 Kj6z909Ivv7Oicw6GAgubfC8ShUPpE5M9UQ7QubzxEbf1Tb4hsc4vRiQb1jyVquUCJ+m
 UbixbnUEaFBc/VNGKSHtGTLbbwNFyx2iXOybjcyn5C+cBIfHjT4Vs/Md+QdRtIoy73uq
 Y7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bUAfab7zScI4DtBLITvVJVb0zk2Mkl7MVExR0/ponPs=;
 b=GbG+I0viQsRGCpOYzNwmRpBoFt0XE8/nVNMy7TpOmSqJv+C2BvfAZnHYUJJ5fNNXck
 ARFrolA1WtdCyAwUCjKySJiWHnGY6CDMXW1Yhk4mXZmeqL4Nh4zZ2rcLgeXR7pM7V+gi
 /oQMylpxJWtazwM5IrKt3i7MM8Oac0qPWaHXkgTqjpGMiULoFPMAMYKw1CtiEF7U9NCZ
 UIFEZzRvwAJ/7rHGJ7SX+12dexWg+rJFqCy4+61avP3Y+lumDGWlw0FbXh8aymTbQK+R
 WQwu/wg8VVoBhLNrETPUA2d1PWzXnhpnHrvaOCf3MCR+bYEJ80LeDwkJg3La/I7zTH0k
 z5qA==
X-Gm-Message-State: APjAAAUYN6gUMrP37lPLufehjarenebFZl7OO4YZlJf7iKrJyUXkiOku
 UFOTwp53s6ZzZSdAMr3ea2280Q==
X-Google-Smtp-Source: APXvYqxnc4MEQ9kr00Uv5FH+7j3vAKapQH4VJaZuV2plQpqqxkA+RYnYJ5h1wv0uyfEERxnHv66cWg==
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr3127874wme.92.1569502411270; 
 Thu, 26 Sep 2019 05:53:31 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a192sm2825154wma.1.2019.09.26.05.53.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 05:53:30 -0700 (PDT)
Subject: Re: meson-g12b xHCI - disable park mode
To: Tim <elatllat@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 tobetter@gmail.com, Jianxin Pan <jianxin.pan@amlogic.com>
References: <CA+3zgmvjhisn97Y1TCn7Ztj2m3hB9+sdoOnFdvJJbKUFpt=QrQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c39e0cd2-1235-c574-c90a-a17727a76b05@baylibre.com>
Date: Thu, 26 Sep 2019 14:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+3zgmvjhisn97Y1TCn7Ztj2m3hB9+sdoOnFdvJJbKUFpt=QrQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_055342_350471_1F2E274A 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgVGltLAoKVGhhbmtzIGZvciBzZW5kaW5nIHRoZSBlbWFpbCwgdGhpcyBoYXMgYWxyZWFkeSBi
ZWVuIHNwb3R0ZWQgYnkgQ2hyaXN0aWFuIEhld2l0dCBmcm9tIExpYnJlRUxFQy4KCkluZGVlZCB0
aGlzIG5lZWQgc29tZSBkdC1iaW5kaW5ncyB3b3JrIGFuZCBzb21lIG1vcmUgaW5mb3JtYXRpb24g
Zm9yIHRoZXNlIDoKLSBEV0MzX0dVQ1RMX05BS1BFUkVOSEhTCi0gRFdDM19HVUNUTF9QQVJLTU9E
RURJU0FCTEVTUwpiaXQgZnJvbSBBbWxvZ2ljIHNpbmNlIEkgZG9uJ3QgYWNjZXNzIHRvIHRoZSBE
V0MzIERhdGFCb29rLgoKSmlhbnhpbiwgY291bGQgeW91IGdpdmUgdXNlIGEgYnJpZWYgZGVzY3Jp
cHRpb24gb2YgdGhlc2UgYml0cyBhbmQgd2h5IHRoZXkgYXJlIG5lZWRlZCB0byBzb2x2ZSB0aGUg
aXNzdWUgPwoKVGhhbmtzLApOZWlsCgpPbiAyMS8wOS8yMDE5IDE1OjQ3LCBUaW0gd3JvdGU6Cj4g
SGnCoE5laWwsCj4gCj4gVGhhbmvCoHlvdSBmb3IgeW91ciB3b3JrIG9uIHRoZSBMaW51eCBrZXJu
ZWwuCj4gSGFyZGtlcm5lbCBhbmQgb3RoZXJzIHVzaW5nIHRoZSBtYWlubGluZSBvbiB0aGUgTjIg
YXJlIGluY2x1ZGluZyBhIHBhdGNoWzFdIHRoYXQgcHJldmVudHMgYnVnc1syXSBvbiB0aGUgT2Ry
b2lkLU4yLsKgCj4gRG9uZ2ppbiBLaW0gPHRvYmV0dGVyQGdtYWlsLmNvbSA8bWFpbHRvOnRvYmV0
dGVyQGdtYWlsLmNvbT4+IG9idGFpbmVkIHRoZSBwYXRjaCBmcm9tIEFtTG9naWNbM10sCj4gYnV0
IGlzIG5vdCBjb21mb3J0YWJsZSBjb250cmlidXRpbmcgdG8gdXBzdHJlYW1bNF0uCj4gUGxlYXNl
IGZpeCB0aGlzIGJ1ZyB1cHN0cmVhbSwgb3IgbGV0IHVzIGtub3cgdGhlIGJlc3Qgd2F5IGZvcndh
cmQuCj4gKG1heWJlIHlvdSBjYW4gc2VuZCBzb21ldGhpbmcgYXBwcm9wcmlhdGUgZm9ywqBGZWxp
cGUgdG8gcmV2aWV3KQo+IFRoYW5rcyBhZ2Fpbi4KPiAKPiBSZWZlcmVuY2UgbGlua3M7Cj4gCj4g
ICAgIDEgaHR0cHM6Ly9mb3J1bS5vZHJvaWQuY29tL2Rvd25sb2FkL2ZpbGUucGhwP2lkPTk2NzQK
PiAgICAgMsKgaHR0cHM6Ly9mb3J1bS5vZHJvaWQuY29tL3ZpZXd0b3BpYy5waHA/Zj0xODEmdD0z
NTAzMSZzdGFydD0yNTAjcDI2NzQ3OQo+ICAgICAzwqBodHRwczovL2ZvcnVtLm9kcm9pZC5jb20v
dmlld3RvcGljLnBocD9mPTE4MSZ0PTM1MDMxJnN0YXJ0PTI1MCNwMjY3NDgxCj4gICAgIDTCoGh0
dHBzOi8vZm9ydW0ub2Ryb2lkLmNvbS92aWV3dG9waWMucGhwP2Y9MTc2JnQ9MzM5OTMmc3RhcnQ9
MzUwI3AyNjg1OTgKPiAKPiAKPiBUaGUgcGF0Y2ggaW5saW5lOwo+IAo+ICAgICBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYwo+ICAg
ICBpbmRleCBjOWJiOTNhMmMuLjgyNTI5MjNkOCAxMDA2NDQKPiAgICAgLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMKPiAgICAgKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMKPiAgICAg
QEAgLTk4Myw2ICs5ODMsOCBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2Mz
ICpkd2MpCj4gICAgIMKgIGlmIChkd2MtPmRpc190eF9pcGdhcF9saW5lY2hlY2tfcXVpcmspCj4g
ICAgIMKgIHJlZyB8PSBEV0MzX0dVQ1RMMV9UWF9JUEdBUF9MSU5FQ0hFQ0tfRElTOwo+ICAgICDC
oAo+ICAgICArIHJlZyB8PSAoRFdDM19HVUNUTF9OQUtQRVJFTkhIUyB8IERXQzNfR1VDVExfUEFS
S01PREVESVNBQkxFU1MpOwo+ICAgICArCj4gICAgIMKgIGR3YzNfd3JpdGVsKGR3Yy0+cmVncywg
RFdDM19HVUNUTDEsIHJlZyk7Cj4gICAgIMKgIH0KPiAgICAgwqAKPiAgICAgZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgKPiAgICAg
aW5kZXggM2RkNzgzYjg4Li5mZjA5ZDE5ZWUgMTAwNjQ0Cj4gICAgIC0tLSBhL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5oCj4gICAgICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oCj4gICAgIEBA
IC0yNDcsNiArMjQ3LDggQEAKPiAgICAgwqAKPiAgICAgwqAvKiBHbG9iYWwgVXNlciBDb250cm9s
IFJlZ2lzdGVyICovCj4gICAgIMKgI2RlZmluZSBEV0MzX0dVQ1RMX0hTVElOQVVUT1JFVFJZIEJJ
VCgxNCkKPiAgICAgKyNkZWZpbmUgRFdDM19HVUNUTF9QQVJLTU9ERURJU0FCTEVTUyDCoCBCSVQo
MTcpCj4gICAgICsjZGVmaW5lIERXQzNfR1VDVExfTkFLUEVSRU5ISFMgwqAgwqAgwqAgwqAgQklU
KDE4KQo+ICAgICDCoAo+ICAgICDCoC8qIEdsb2JhbCBVc2VyIENvbnRyb2wgMSBSZWdpc3RlciAq
Lwo+ICAgICDCoCNkZWZpbmUgRFdDM19HVUNUTDFfVFhfSVBHQVBfTElORUNIRUNLX0RJUyBCSVQo
MjgpCj4gCj4gPGh0dHBzOi8vZm9ydW0ub2Ryb2lkLmNvbS92aWV3dG9waWMucGhwP2Y9MTc2JnQ9
MzM5OTMmc3RhcnQ9MzUwI3AyNjg1OTg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
