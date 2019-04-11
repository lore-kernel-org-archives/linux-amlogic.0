Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8ECC282CE
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 18:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF41D2146F
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 18:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gc4W6nit";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nextdayvideo-com.20150623.gappssmtp.com header.i=@nextdayvideo-com.20150623.gappssmtp.com header.b="TK4U4LIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF41D2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nextdayvideo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KygCpF9kX1NtwYI6oVwYa0HoRqQDKduSJ/0cEoFIggs=; b=Gc4W6nit9dZxz7
	RSC8CF6g1ak0BszRb1QpD2jM7S30O+6XOlw0Q2tBkJQIQKy/zc1Al3t7LdUcfXKjX6MhZmFw2MxDF
	vLwCsWmQxp/5OlR/kL3vlS0eAWgOGvLPQCWqLYiOtbHHZd4pZTZkKmYZYaL69Lhj3b45ulz6Tjv8N
	FvmJNoCyjV/w2uD6X2r0b9E4lDDRSM8FEAbW7QHn18XZ3CbVoCTGlSQwBFQdWCEoAy7Xrm3Y+Doit
	i4tILVT7Ogm715JP/szUoJ76z60O8+wqgc/AF0sSGSXN5u7unZWSVdLBWSQ5ldcJwPK2k6hO6SwQS
	KJMbMbf2kyaGEjCK3d3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEe8P-0006Ux-N1; Thu, 11 Apr 2019 18:09:13 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEe8L-0006Ub-VF
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 18:09:11 +0000
Received: by mail-lf1-x142.google.com with SMTP id u17so5435360lfi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nextdayvideo-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dhxl16eBDF6pMq7gzsBY0tnVPKqRPxq8D46WxMtRofw=;
 b=TK4U4LIaQkAv4g4ZFuUPDfbS1NJZEI5FQQaYw8S0CjgGVmzvnJzuYIG2n2LGY+j9fw
 bOrXnWD5Y7D11QidbhpSDGEr9YNgW6QH8cpnNZXiyBXIqW06Rhc2/BTxO62QuPAK9p0P
 +KPtTgoyusQ6WxxdkN3o/vfZ+QOgsqNEwHLfnMihNpp5iYQjyHcoe7TGqKrdg/5xXpp3
 prtWckbzkLtfKELEeZB/XlfB4MqPb+03Zy9cl+57Gpq1Uz4/ZtcPr4r9obPSp+7EP+6V
 /6fu8oOYZ3P0Jv+8U5DcJGfC6BeL5yWYImgHtCndEuiVB0IkyWt6TqNTH68jzG1VCsVt
 OE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dhxl16eBDF6pMq7gzsBY0tnVPKqRPxq8D46WxMtRofw=;
 b=ue3ayRnyjlqvJWKZXsKeg+rCcPxIJ+OjQq1q2U9bKxWoaMO1ypOukECcMsLYe4VG2S
 IW8OcuCQ0s3vgeeLq1Y9gLTi3PGhIQgV5zZZ2xF04lZzOj9wxjevrB+7cGLbIQbH5qJk
 aBcxBnBNZuzC/NqYgeOaU1nI2VP0Az4ZbH6Z+stlvzgTqC06U7z5X/sgpzy3r4rcDKRS
 td1aYYeIqvCzHxW3LfYR9Q+PVlebKzVhusO1qjp2sGa7JcvDqdNSVE/4cLZ2gZ9Ak+zQ
 JTyiGUuUIbiYN5GlbbdPRLmyuAT9Nh03haBhoJ73m+UR1ILNlTcsaQdeGM2J9ml4f2IN
 qTVQ==
X-Gm-Message-State: APjAAAXqAmntcE33+mdDgRgM6DkkTImxAuQUMlUVaAW7lYSh12Q5+vta
 M/CrYj7RoLCjGq/RmHZgrOmeOqMv+jj6pyz1yJGWFZnC
X-Google-Smtp-Source: APXvYqzhypsyidj0uu8oqVr0TSTdUC3IDKI+t08fNYKlTyB6R5SoccQMimgkmWXdirBzW2dXrA1Jd/x6o9OkBsW6wAc=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr6339202lfi.35.1555006146643; 
 Thu, 11 Apr 2019 11:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <CADmzSSj+dm6siBGP-LPzJ=i1pZU3vK7z-VsR4Qf6HT2yu8Z-6Q@mail.gmail.com>
 <CADmzSSjwqDgabEbzq3Co3oRVW=kJRE4Dnyyqvzw=RxBDTr7Z+g@mail.gmail.com>
 <c78ecdb2130e8ed68b4604b584e30e6e653f278a.camel@ndufresne.ca>
In-Reply-To: <c78ecdb2130e8ed68b4604b584e30e6e653f278a.camel@ndufresne.ca>
From: Carl Karsten <carl@nextdayvideo.com>
Date: Thu, 11 Apr 2019 13:08:39 -0500
Message-ID: <CADmzSSjisLWFvSPBf2vanOvdYS97iT+0mEn_+s_66zaZ9Agm2w@mail.gmail.com>
Subject: Re: v4l error on stretch c2
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_110910_071188_DE3E1856 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSBkb24ndCB0aGluayBJIHNhdyBhbnl0aGluZyBpbiBkbWVzZywgaXMgdGhhdCB3aGVyZSBrZXJu
ZWwgbG9ncyB3b3VsZCBiZT8KCmFuZCBpdCBpcyB3b3JraW5nLiAgZXhjZXB0IEkgdGhpbmsgaXQg
aXMgbWF4aW5nIG91dCBhIGNwdSBjb3JlLgoKT24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMTI6Mjcg
UE0gTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+IHdyb3RlOgo+Cj4gTGUg
amV1ZGkgMTEgYXZyaWwgMjAxOSDDoCAxMDoyNSAtMDUwMCwgQ2FybCBLYXJzdGVuIGEgw6ljcml0
IDoKPiA+IEhtbSwgaXQgbWFnaWNhbGx5IGZpeGVkIGl0c2VsZi4gbWF5YmUuCj4gPiBldmVuIGFm
dGVyIGEgcmVib290Lgo+Cj4gWW91IHNob3VsZCBoYXZlIGNhcHR1cmUgdGhlIGtlcm5lbCBsb2dz
IGFmdGVyIHRoZSBlcnJvci4gV2Ugc3RpbGwgaGF2ZQo+IHZlcnkgZnJhZ2lsZSBjYW1lcmEgZmly
bXdhcmUgYXJvdW5kIHdoaWNoIEdzdCBwcm9iaW5nIGVuZHVwIGNyYXNoaW5nCj4gcmlnaHQgYmVm
b3JlIHdlIHN0YXJ0IGNhcHR1cmluZy4gSSBoYXZlIGRyYXN0aWNhbGx5IHJlZHVjZWQgdGhlIG51
bWJlcgo+IG9mIGlvY3RsIHdlIGRvIHRvIHJlYWNoIGNhcHR1cmUgc3RhdGUsIHdoaWNoIHNvbHZl
cyBzb21lIG9mIHRoZQo+IGZpcm13YXJlIGNyYXNoIGlzc3VlIGZ1bGx5IG9yIHBhcnRpYWxseSwg
SSdtIG5vdCBzdXJlIHdoYXQgR3N0IHZlcnNpb24KPiB5b3UgYXJlIG9uLCBidXQgaXQncyBhbHdh
eXMgd29ydGggdHJ5aW5nIGEgbmV3ZXIgdmVyc2lvbi4KPgo+IEluIHlvdXIgY29kZSwgaWYgeW91
IGNhdGNoIGFuIFY0TDIgZXJyb3IsIHRoZW4gbW9zdCBvZiB0aGUgdGltZSB5b3UKPiBqdXN0IGhh
dmUgdG8gd2FpdCBiZXR3ZWVuIDE1IGFuZCAzMHMgYmVmb3JlIHJldHJ5aW5nIHdoaWxlIHV2YyBk
cml2ZXIKPiBpcyByZXNldHRpbmcgdGhlIGNhbWVyYS4KPgo+ID4KPiA+IGhlcmUgaXMgYmFzZWxp
bmUgb2Ygd2hhdCB3b3JrcyB3aGVuIHRoZSB2NGwgZGV2aWNlIHdhcyBlcnJvcmluZzoKPiA+Cj4g
PiBNb3JlIGluZm86Cj4gPiBodHRwczovL3d3dy5hcm1iaWFuLmNvbS9vZHJvaWQtYzIvIFN0cmV0
Y2gKPiA+Cj4gPiBtb2Rwcm9iZSB2aXZpZAo+ID4gZG1lc2cKPiA+IFszMzI5NC45OTQ5NDhdIHZp
dmlkLTAwMDogVjRMMiBjYXB0dXJlIGRldmljZSByZWdpc3RlcmVkIGFzIHZpZGVvMwo+ID4KPiA+
IHJvb3RAb2Ryb2lkMzp+IyBnc3QtbGF1bmNoLTEuMCB2NGwyc3JjIGRldmljZT0vZGV2L3ZpZGVv
MyAhIGZha2VzaW5rCj4gPiBTZXR0aW5nIHBpcGVsaW5lIHRvIFBBVVNFRCAuLi4KPiA+IFBpcGVs
aW5lIGlzIGxpdmUgYW5kIGRvZXMgbm90IG5lZWQgUFJFUk9MTCAuLi4KPiA+IFNldHRpbmcgcGlw
ZWxpbmUgdG8gUExBWUlORyAuLi4KPiA+IE5ldyBjbG9jazogR3N0U3lzdGVtQ2xvY2sKPiA+Cj4g
PiAobm8gZXJyb3IpCj4gPgo+ID4KPiA+Cj4gPgo+ID4KPiA+Cj4gPiBPbiBUaHUsIEFwciAxMSwg
MjAxOSBhdCAxOjE2IEFNIENhcmwgS2Fyc3RlbiA8Y2FybEBuZXh0ZGF5dmlkZW8uY29tPiB3cm90
ZToKPiA+ID4gSSdtIGdldHRpbmcgZXJyb3JzIHJlYWRpbmcgYSB1dmMgdmlkZW8gc3RyZWFtOgo+
ID4gPgo+ID4gPiBMaW51eCBvZHJvaWQzIDQuMTkuMjAtbWVzb242NCAjNS43NSBTTVAgUFJFRU1Q
VCBGcmkgRmViIDggMTA6MDg6NDAgQ0VUCj4gPiA+IDIwMTkgYWFyY2g2NCBHTlUvTGludXgKPiA+
ID4KPiA+ID4gIGdzdC1sYXVuY2gtMS4wIHY0bDJzcmMgZGV2aWNlPS9kZXYvaGRtaTJ1c2IvYnkt
bnVtL2FsbDAvdmlkZW8gISBmYWtlc2luawo+ID4gPiBlcnJvcjogWERHX1JVTlRJTUVfRElSIG5v
dCBzZXQgaW4gdGhlIGVudmlyb25tZW50Lgo+ID4gPiBTZXR0aW5nIHBpcGVsaW5lIHRvIFBBVVNF
RCAuLi4KPiA+ID4gUGlwZWxpbmUgaXMgbGl2ZSBhbmQgZG9lcyBub3QgbmVlZCBQUkVST0xMIC4u
Lgo+ID4gPiBTZXR0aW5nIHBpcGVsaW5lIHRvIFBMQVlJTkcgLi4uCj4gPiA+IE5ldyBjbG9jazog
R3N0U3lzdGVtQ2xvY2sKPiA+ID4gRVJST1I6IGZyb20gZWxlbWVudCAvR3N0UGlwZWxpbmU6cGlw
ZWxpbmUwL0dzdFY0bDJTcmM6djRsMnNyYzA6IENvdWxkCj4gPiA+IG5vdCByZWFkIGZyb20gcmVz
b3VyY2UuCj4gPiA+IEFkZGl0aW9uYWwgZGVidWcgaW5mbzoKPiA+ID4gZ3N0djRsMmJ1ZmZlcnBv
b2wuYygxMDU4KTogZ3N0X3Y0bDJfYnVmZmVyX3Bvb2xfcG9sbCAoKToKPiA+ID4gL0dzdFBpcGVs
aW5lOnBpcGVsaW5lMC9Hc3RWNGwyU3JjOnY0bDJzcmMwOgo+ID4gPiBwb2xsIGVycm9yIDE6IElu
dmFsaWQgYXJndW1lbnQgKDIyKQo+ID4gPiBFeGVjdXRpb24gZW5kZWQgYWZ0ZXIgMDowMDoxOC42
MDg0MzA1MjgKPiA+ID4gU2V0dGluZyBwaXBlbGluZSB0byBQQVVTRUQgLi4uCj4gPiA+IFNldHRp
bmcgcGlwZWxpbmUgdG8gUkVBRFkgLi4uCj4gPiA+IFNldHRpbmcgcGlwZWxpbmUgdG8gTlVMTCAu
Li4KPiA+ID4gRnJlZWluZyBwaXBlbGluZSAuLi4KPiA+ID4KPiA+ID4gIGdzdC1sYXVuY2gtMS4w
IHY0bDJzcmMgZGV2aWNlPS9kZXYvaGRtaTJ1c2IvYnktbnVtL2FsbDAvdmlkZW8gISBmYWtlc2lu
awo+ID4gPiBTZXR0aW5nIHBpcGVsaW5lIHRvIFBBVVNFRCAuLi4KPiA+ID4gRVJST1I6IFBpcGVs
aW5lIGRvZXNuJ3Qgd2FudCB0byBwYXVzZS4KPiA+ID4gRVJST1I6IGZyb20gZWxlbWVudCAvR3N0
UGlwZWxpbmU6cGlwZWxpbmUwL0dzdFY0bDJTcmM6djRsMnNyYzA6IERldmljZQo+ID4gPiAnL2Rl
di9oZG1pMnVzYi9ieS1udW0vYWxsMC92aWRlbycgaXMgbm90IGEgY2FwdHVyZSBkZXZpY2UuCj4g
PiA+IEFkZGl0aW9uYWwgZGVidWcgaW5mbzoKPiA+ID4gdjRsMl9jYWxscy5jKDYzMyk6IGdzdF92
NGwyX29wZW4gKCk6IC9Hc3RQaXBlbGluZTpwaXBlbGluZTAvR3N0VjRsMlNyYzp2NGwyc3JjMDoK
PiA+ID4gQ2FwYWJpbGl0aWVzOiAweDRhMDAwMDAKPiA+ID4gU2V0dGluZyBwaXBlbGluZSB0byBO
VUxMIC4uLgo+ID4gPiBGcmVlaW5nIHBpcGVsaW5lIC4uLgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBD
YXJsIEsKPiA+Cj4gPgoKCgotLSAKQ2FybCBLCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
