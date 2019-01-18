Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D38C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 09:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4642320823
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 09:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QlkMTvDX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ctUNzI1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4642320823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vlzVM+0AqJ3ErN0nYDKIzJeRprSS1XSwJ575xHw1zU=; b=QlkMTvDX9BktjX
	ayJk/gzrMQL21i3zT/a9PkQe+l/0Jk6Mr2C/XnE8k+pD0H0E6IcRjirjBMhjD5AlAJZts8ql+m64q
	asQYFeJu4HcIAVN381LzDt8Lp7SFgQBuhsmuDqQccU4Yr4dgZdB14S90SSYQKh7LL72DnrjWTK0+7
	RGLGhzaUwXoks1GTFWmSmTr100rvrvleX3pCW4Ib01XICeY6yuww/NpGWgAuiN/uSZdwb3hgwlLwT
	XdlQ1gZyXr8pDWqhjt0ujGWqJi1xBCzPL58eFR3iKEh0vZ0sdmMetNeM5Shp0IfOf0AaJay4REWQ+
	cFSBdGqvv4L+OzUCnB5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkQDa-0001WZ-8R; Fri, 18 Jan 2019 09:13:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkQDW-0001W9-Fp
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 09:13:36 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190118091332euoutp01343d6a20106556121ea67848c7e8ed7d~65nT68zCW1659916599euoutp01O
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 09:13:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190118091332euoutp01343d6a20106556121ea67848c7e8ed7d~65nT68zCW1659916599euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1547802812;
 bh=vt/O1IqgyF9iP3ui5rT6sVTWe44+N6bydzXUC5j7oP4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ctUNzI1AykGHQ2EV+nvMzQ/aAcDFfRPOkc045oH2RsihlRJhAU20EdmS+LF2uthfn
 1t4hfrzYlUk7D35cAbZFzxzIGXCsvHqsNfBokYnxy57sT5FfCmQpkf4Hft5sCvsz8s
 j6qGDKiW8XEEkkdTFDkzMim67cAeo88+xDiQUkAs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190118091331eucas1p28d7bbb1e258e7b92a4f005c68e66658e~65nTVKjNP2657326573eucas1p2-;
 Fri, 18 Jan 2019 09:13:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 49.64.04294.BB8914C5; Fri, 18
 Jan 2019 09:13:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190118091330eucas1p2478410cf9299c2a3073b48d638a71123~65nSl5xPV2657326573eucas1p28;
 Fri, 18 Jan 2019 09:13:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190118091330eusmtrp2c674ccc3443fa27e976e2983812c24f5~65nSWH3Wa2409924099eusmtrp2L;
 Fri, 18 Jan 2019 09:13:30 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-3f-5c4198bb9c95
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 33.8F.04284.AB8914C5; Fri, 18
 Jan 2019 09:13:30 +0000 (GMT)
Received: from [106.120.43.17] (unknown [106.120.43.17]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190118091330eusmtip17b1eb3eaf6171b6e6df3a22404475f65~65nSEy3Yz1514515145eusmtip1b;
 Fri, 18 Jan 2019 09:13:30 +0000 (GMT)
Subject: Re: [PATCH 2/8] drm/meson: add HDMI div40 TMDS mode
To: Neil Armstrong <narmstrong@baylibre.com>, Laurent.pinchart@ideasonboard.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <5103b2e8-2f73-da18-a043-fa45d6e2c139@samsung.com>
Date: Fri, 18 Jan 2019 10:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115123315.11069-3-narmstrong@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djP87q7ZzjGGOzs4bC48vU9m0XnxCXs
 Fgtmc1tc3jWHzeJQX7QDq8f7G63sHrM7ZrJ63O8+zuSxeUm9x+dNcgGsUVw2Kak5mWWpRfp2
 CVwZqy5+Yi84LF4x78FZpgbGncJdjJwcEgImEptXPWbvYuTiEBJYwSix9eMlRgjnC6PErf/b
 WSGcz4wSh3fPZ4Rpeb/3JlTVckaJLRfaoKreMkos/trIBlIlLGAj8XDND3YQW0QgUOJ47zaw
 bmaBNIlbMw6xgthsApoSfzffBKvnFbCTmPnmFFicRUBVYvasn2D1ogIREh33V0PVCEqcnPmE
 BcTmFLCVmD9vMzvETHmJ5q2zmSFscYlbT+YzgRwkITCPXWLC8tXMEGe7SNzacp8JwhaWeHV8
 CzuELSPxf+d8qHi9RNPMK8wQzR2MEicWL2eDSFhLHD5+Eeg6DqANmhLrd+lDhB0lNrwGOZQD
 yOaTuPFWEOIGPolJ26YzQ4R5JTrahCCqFSXun90KdY24xNILX9kmMCrNQvLZLCTfzELyzSyE
 vQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEpprT/45/2cG460/SIUYBDkYlHt4J
 WxxihFgTy4orcw8xSnAwK4nwGkx1jBHiTUmsrEotyo8vKs1JLT7EKM3BoiTOW83wIFpIID2x
 JDU7NbUgtQgmy8TBKdXA6Hfp5rdFCdoqBYcXVMVzXAraVzm/eOaU8/+sdyc51T4U6lYS2PJh
 8efsTeqMhz5nV54PPh8avO/aZ/l1G19F//78wqVm9v0tJ3Rq1DZVTzj1cNvJhh0zmVfw3ff/
 naE1YeWHNWZ6zHbaKfXVx9dz5yb0Rbsdk0+zurNZfcGCsEvMQb63ufNmBSmxFGckGmoxFxUn
 AgAZABElMQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7q7ZjjGGBw4KmJx5et7NovOiUvY
 LRbM5ra4vGsOm8WhvmgHVo/3N1rZPWZ3zGT1uN99nMlj85J6j8+b5AJYo/RsivJLS1IVMvKL
 S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyVl38xF5wWLxi3oOzTA2M
 O4W7GDk5JARMJN7vvcnYxcjFISSwlFHizYJfjBAJcYnd898yQ9jCEn+udbFBFL1mlLgwdRNY
 QljARuLhmh/sILaIQKDEot4FYHFmgTSJP09BmkEaDjNKnL47kwkkwSagKfF38002EJtXwE5i
 5ptTrCA2i4CqxOxZP8E2iwpESJx9uY4RokZQ4uTMJywgNqeArcT8eZvZIRaoS/yZdwlqmbxE
 89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7
 iREYXduO/dy8g/HSxuBDjAIcjEo8vC+2OcQIsSaWFVfmHmKU4GBWEuE1mOoYI8SbklhZlVqU
 H19UmpNafIjRFOi5icxSosn5wMjPK4k3NDU0t7A0NDc2NzazUBLnPW9QGSUkkJ5YkpqdmlqQ
 WgTTx8TBKdXAWPX0WsuDlPQn34IVf5w2qNh3yn0pm7nn440rNnDPCQic//Pd/ezr3uxpRyea
 q36Ofb5l98zQU0lHFvEFzVQ9U/3swg/+/0v+/ImQCbG4nl77Tr1QfMnZRDbJ2eLuXlufG7Xz
 x/JzLGhpMuGNUL8+kzfs8hnN42YvvC+YePu8vmd9cKbSJOktpkosxRmJhlrMRcWJAOfyCnnE
 AgAA
X-CMS-MailID: 20190118091330eucas1p2478410cf9299c2a3073b48d638a71123
X-Msg-Generator: CA
X-RootMTR: 20190115123329epcas2p238b0b8a9f449f96991e02b34c54741ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190115123329epcas2p238b0b8a9f449f96991e02b34c54741ca
References: <20190115123315.11069-1-narmstrong@baylibre.com>
 <CGME20190115123329epcas2p238b0b8a9f449f96991e02b34c54741ca@epcas2p2.samsung.com>
 <20190115123315.11069-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_011334_830497_3CCF8C94 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTUuMDEuMjAxOSAxMzozMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gQWRkIHN1cHBvcnQg
Zm9yIFRNRFMgQ2xvY2sgPiAzLjRHSHogZm9yIEhETUkyLjAgZGlzcGxheSBtb2Rlcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDIzICsrKysrKysr
KysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
d19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gaW5kZXgg
ODA3MTExZWJmZGQ5Li4zZDhkZWNiNzcwMTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kd19oZG1pLmMKPiBAQCAtMzY1LDcgKzM2NSw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9waHlf
aW5pdChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKPiAgCXVuc2lnbmVkIGludCB3
cl9jbGsgPQo+ICAJCXJlYWRsX3JlbGF4ZWQocHJpdi0+aW9fYmFzZSArIF9SRUcoVlBVX0hETUlf
U0VUVElORykpOwo+ICAKPiAtCURSTV9ERUJVR19EUklWRVIoIiVkOlwiJXNcIlxuIiwgbW9kZS0+
YmFzZS5pZCwgbW9kZS0+bmFtZSk7Cj4gKwlEUk1fREVCVUdfRFJJVkVSKCIlZDpcIiVzXCIgZGl2
JWRcbiIsIG1vZGUtPmJhc2UuaWQsIG1vZGUtPm5hbWUsCj4gKwkJCSBtb2RlLT5jbG9jayA+IDM0
MDAwMCA/IDQwIDogMTApOwo+ICAKPiAgCS8qIEVuYWJsZSBjbG9ja3MgKi8KPiAgCXJlZ21hcF91
cGRhdGVfYml0cyhwcml2LT5oaGksIEhISV9IRE1JX0NMS19DTlRMLCAweGZmZmYsIDB4MTAwKTsK
PiBAQCAtMzg1LDkgKzM4NiwxNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcGh5X2luaXQoc3RydWN0
IGR3X2hkbWkgKmhkbWksIHZvaWQgKmRhdGEsCj4gIAkvKiBFbmFibGUgbm9ybWFsIG91dHB1dCB0
byBQSFkgKi8KPiAgCWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlUWF9UT1BfQklTVF9D
TlRMLCBCSVQoMTIpKTsKPiAgCj4gLQkvKiBUTURTIHBhdHRlcm4gc2V0dXAgKFRPRklYIHBhdHRl
cm4gZm9yIDRrMmsgc2NyYW1ibGluZykgKi8KPiAtCWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWks
IEhETUlUWF9UT1BfVE1EU19DTEtfUFRUTl8wMSwgMHgwMDFmMDAxZik7Cj4gLQlkd19oZG1pX3Rv
cF93cml0ZShkd19oZG1pLCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fMjMsIDB4MDAxZjAwMWYp
Owo+ICsJLyogVE1EUyBwYXR0ZXJuIHNldHVwIChUT0ZJWCBIYW5kbGUgdGhlIFlVVjQyMCBjYXNl
KSAqLwo+ICsJaWYgKG1vZGUtPmNsb2NrID4gMzQwMDAwKSB7Cj4gKwkJZHdfaGRtaV90b3Bfd3Jp
dGUoZHdfaGRtaSwgSERNSVRYX1RPUF9UTURTX0NMS19QVFROXzAxLCAwKTsKPiArCQlkd19oZG1p
X3RvcF93cml0ZShkd19oZG1pLCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fMjMsCj4gKwkJCQkg
IDB4MDNmZjAzZmYpOwo+ICsJfSBlbHNlIHsKPiArCQlkd19oZG1pX3RvcF93cml0ZShkd19oZG1p
LCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fMDEsCj4gKwkJCQkgIDB4MDAxZjAwMWYpOwo+ICsJ
CWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlUWF9UT1BfVE1EU19DTEtfUFRUTl8yMywK
PiArCQkJCSAgMHgwMDFmMDAxZik7Cj4gKwl9CgoKwqDCoMKgIHZhbCA9IG1vZGUtPmNsb2NrID4g
MzQwMDAwID8gMHgwM2ZmMDNmZiA6IDB4MDAxZjAwMWY7CsKgwqDCoCBkd19oZG1pX3RvcF93cml0
ZShkd19oZG1pLCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fMDEsIHZhbCk7CgrCoMKgwqAgZHdf
aGRtaV90b3Bfd3JpdGUoZHdfaGRtaSwgSERNSVRYX1RPUF9UTURTX0NMS19QVFROXzIzLCB2YWwp
OwoKClRoZSBiZXN0IHdvdWxkIGJlIHRvIHJlcGxhY2UgdGhlc2UgbWFnaWMgdmFsdWVzIHdpdGgg
ZGVzY3JpcHRpdmUgbWFjcm9zLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+ICAKPiAgCS8qIExvYWQg
VE1EUyBwYXR0ZXJuICovCj4gIAlkd19oZG1pX3RvcF93cml0ZShkd19oZG1pLCBIRE1JVFhfVE9Q
X1RNRFNfQ0xLX1BUVE5fQ05UTCwgMHgxKTsKPiBAQCAtNDEzLDYgKzQyMiw4IEBAIHN0YXRpYyBp
bnQgZHdfaGRtaV9waHlfaW5pdChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKPiAg
CS8qIERpc2FibGUgY2xvY2ssIGZpZm8sIGZpZm9fd3IgKi8KPiAgCXJlZ21hcF91cGRhdGVfYml0
cyhwcml2LT5oaGksIEhISV9IRE1JX1BIWV9DTlRMMSwgMHhmLCAwKTsKPiAgCj4gKwlkd19oZG1p
X3NldF9oaWdoX3RtZHNfY2xvY2tfcmF0aW8oaGRtaSk7Cj4gKwo+ICAJbXNsZWVwKDEwMCk7Cj4g
IAo+ICAJLyogUmVzZXQgUEhZIDMgdGltZXMgaW4gYSByb3cgKi8KPiBAQCAtNTYyLDYgKzU3Mywx
MCBAQCBkd19oZG1pX21vZGVfdmFsaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwK
PiAgCQltb2RlLT52ZGlzcGxheSwgbW9kZS0+dnN5bmNfc3RhcnQsCj4gIAkJbW9kZS0+dnN5bmNf
ZW5kLCBtb2RlLT52dG90YWwsIG1vZGUtPnR5cGUsIG1vZGUtPmZsYWdzKTsKPiAgCj4gKwkvKiBJ
ZiBzaW5rIG1heCBUTURTIGNsb2NrLCB3ZSByZWplY3QgdGhlIG1vZGUgKi8KPiArCWlmIChtb2Rl
LT5jbG9jayA+IGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLm1heF90bWRzX2Nsb2NrKQo+ICsJCXJl
dHVybiBNT0RFX0JBRDsKPiArCj4gIAkvKiBDaGVjayBhZ2FpbnN0IG5vbi1WSUMgc3VwcG9ydGVk
IG1vZGVzICovCj4gIAlpZiAoIXZpYykgewo+ICAJCXN0YXR1cyA9IG1lc29uX3ZlbmNfaGRtaV9z
dXBwb3J0ZWRfbW9kZShtb2RlKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
