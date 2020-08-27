Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4615AC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 12:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2742177B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 12:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYy+jKak";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mpSbrexX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2742177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Date:Message-ID:
	From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IpHOHFNtvlTMJ1PPACsXjA59tWL5vbBtwupCpDDzRZo=; b=DYy+jKakD4aVP15IScbm8rICn
	ZrZLP8Nf3iX+hq8QPw1GG8dGjmnPQdoUZWDdRwX4SwKdnJ9qJFFMXXb8EynteXkpMsUh1vIdJqX4j
	FK4HAQUZf2Zo4fWTTNR9Aw8vH6itsvL6mzibPQYdUxzS5Ux1zrb4wruSLCpzg/rSbElWkyUhggcs8
	V+RAAs5Shp0aRXu9B/wEXDM3UHE2VcFvvf9fMmehNRcW26BknB0TGAGHpZfs9aMKNp7NP8NSIV3u6
	A/DaDCI8jjvgWne4V4meXRWjKl2ai+ew4rbcBW+mmyTt6E0bxl6CbzQBY4Dag1NLKdC/SWVUmAge+
	7n8+8jmOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBHFJ-0006gP-Jp; Thu, 27 Aug 2020 12:43:13 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHFF-0006fQ-U6
 for linux-amlogic@lists.infradead.org; Thu, 27 Aug 2020 12:43:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200827124307euoutp012e564a4c12393d7f46b2c31fe1169dc0~vII4Z-SLh3059330593euoutp01V
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2020 12:43:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200827124307euoutp012e564a4c12393d7f46b2c31fe1169dc0~vII4Z-SLh3059330593euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598532187;
 bh=Z9hoJjw+81T5d4pJyA/LSGFD+r9gkXkSP2oCwCRDj/s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mpSbrexXWmIrjNeaWi0UvaNcMdEEa6RfMWvdsIoNuzvZ+YrX/X+B6aBkMIGgxvltm
 jtWqVxWIywnC6qhz9ezo31fODvixT/24lU8SKw3WTMSRK3Mgjaaa3+zHbxTZDaA16e
 YGqdM751e/AGWo639VIo7W8vIrWTnCjc4zO51OdM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200827124307eucas1p2bcb9e419e35857280b8711eca24d56fa~vII4B8Oc21506815068eucas1p2j;
 Thu, 27 Aug 2020 12:43:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FF.E7.06456.A5AA74F5; Thu, 27
 Aug 2020 13:43:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e~vII3as-jG1506815068eucas1p2i;
 Thu, 27 Aug 2020 12:43:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200827124306eusmtrp217aba062195652cb3c9307038294aa83~vII3aFimg1149811498eusmtrp2M;
 Thu, 27 Aug 2020 12:43:06 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-58-5f47aa5a2bfc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 14.35.06314.A5AA74F5; Thu, 27
 Aug 2020 13:43:06 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200827124305eusmtip1041113616a0be8c7ef401b6b6a44d189~vII2yU-jO1715217152eusmtip1W;
 Thu, 27 Aug 2020 12:43:05 +0000 (GMT)
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
Date: Thu, 27 Aug 2020 14:43:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200731120603.2243261-1-jbrunet@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djP87pRq9zjDW5Ms7a4cvEQk8XUh0/Y
 LN48OsJs8bN9C5PFtysdTBYLZnNbXN41h82i8fRKJgcOjw2fm9g83t9oZffYOesuu8emVZ1s
 HpuX1Htsfv2C2ePzJrkA9igum5TUnMyy1CJ9uwSujIPv9jEWnJKrmLhasIFxiVQXIyeHhICJ
 xJ69nexdjFwcQgIrGCV2TehjgnC+MEp0fXjJCOF8ZpTYvOAmI0zL+4s/oKqWM0rMnLuRFcJ5
 zyhxb+EWsCphATuJ3z93MIPYIgIFEs8mPAUbxSywkFHi8IvFrCAJNgFDia63XWwgNi9Qw8Pv
 a8GaWQRUJZ7dX8MEYosKxElsPX6VCaJGUOLkzCcsIDangI1E/5JlYDazgLxE89bZzBC2uMSt
 J/PBzpMQOMYusWLFe2aIu10k+m+sZ4KwhSVeHd/CDmHLSPzfCdPQzCjx8Nxadginh1HictMM
 qK+tJe6c+wV0KgfQCk2J9bv0IcKOEnsObWcGCUsI8EnceCsIcQSfxKRt06HCvBIdbUIQ1WoS
 s46vg1t78MIl5gmMSrOQvDYLyTuzkLwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ
 +bmbGIEJ6vS/4592MH69lHSIUYCDUYmHVyPeLV6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVV
 qUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTCm/ZzyV7X011OmvnUN
 V09+Pum++sumKUve+zQky2TU+9p7fwxM5TK/PTfjbU/+u8Rux32hLRM4Her39ForBDuIGumf
 c8wpmrbpoUN40sqHb7f9186fdmpa+fXmBW8DzmwK4zrVknU+iO+arEnTdONKrS+RS1kOK9s9
 W6S06frvNrVwXh+PMDUlluKMREMt5qLiRAC9ob5zTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7pRq9zjDZ7fFrS4cvEQk8XUh0/Y
 LN48OsJs8bN9C5PFtysdTBYLZnNbXN41h82i8fRKJgcOjw2fm9g83t9oZffYOesuu8emVZ1s
 HpuX1Htsfv2C2ePzJrkA9ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jIPv9jEWnJKrmLhasIFxiVQXIyeHhICJxPuLP5i6GLk4hASWMkp8nvuG
 GSIhI3FyWgMrhC0s8edaFxtE0VtGiV33J4IVCQvYSfz+uQPMFhEokJh+8D8zSBGzwEJGiV/z
 fzGCJIQErCWmrv0IVsQmYCjR9RZkEicHL1Dzw+9rwWpYBFQlnt1fwwRiiwrESTzu/c8MUSMo
 cXLmExYQm1PARqJ/yTIwm1nATGLe5ofMELa8RPPW2VC2uMStJ/OZJjAKzULSPgtJyywkLbOQ
 tCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGI/bjv3cvIPx0sbgQ4wCHIxKPLwa8W7x
 QqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGCqyCuJNzQ1
 NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwCj8Wdkr6ETc/7XFz1atfvqw
 4Sx396q3AQv3pDRfcNM17m+z8yqy56ie+Cxumqgm4/VXwioLZwhd1hL3ncu62jPZ+gCTp+6y
 9mpPzsf2KeUzV1hcOPbq3MlTUyLCnl7uc/x92XS++68jW9dm7TM9fV3nj6OQYeujhusea7L1
 Fya4BYWWz53oulWJpTgj0VCLuag4EQBTUQm+3QIAAA==
X-CMS-MailID: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
X-Msg-Generator: CA
X-RootMTR: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
 <CGME20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_084310_185827_D623602E 
X-CRM114-Status: GOOD (  16.95  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmVyb21lLAoKT24gMzEuMDcuMjAyMCAxNDowNiwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBD
b21taXQgYjczMjg3ZjBiMDc0ICgiQVNvQzogc29jLXBjbTogZHBjbTogZml4IHBsYXliYWNrL2Nh
cHR1cmUgY2hlY2tzIikKPiBjaGFuZ2VkIHRoZSBtZWFuaW5nIG9mIGRwY21fcGxheWJhY2svZHBj
bV9jYXB0dXJlIGFuZCBub3cgcmVxdWlyZXMgdGhlCj4gQ1BVIERBSSBCRSB0byBhbGlnbmVkIHdp
dGggdGhvc2UgZmxhZ3MuCj4KPiBUaGlzIGJyb2tlIGFsbCBBbWxvZ2ljIGNhcmRzIHdpdGggdW5p
LWRpcmVjdGlvbmFsIGJhY2tlbmRzIChBbGwgZ3ggYW5kCj4gbW9zdCBheGcgY2FyZHMpLgo+Cj4g
V2hpbGUgSSdtIHN0aWxsIGNvbmZ1c2VkIGFzIHRvIGhvdyB0aGlzIGNoYW5nZSBpcyBhbiBpbXBy
b3ZlbWVudCwgdGhvc2UKPiBjYXJkcyBjYW4ndCByZW1haW4gYnJva2VuIGZvcmV2ZXIuIEhvcGVm
dWxseSwgbmV4dCB0aW1lIGFuIEFQSSBjaGFuZ2UgaXMKPiBkb25lIGxpa2UgdGhhdCwgYWxsIHRo
ZSB1c2VycyB3aWxsIGJlIHVwZGF0ZWQgYXMgcGFydCBvZiB0aGUgY2hhbmdlLCBhbmQKPiBub3Qg
bGVmdCB0byBmZW5kIGZvciB0aGVtc2VsdmVzLgo+Cj4gRml4ZXM6IGI3MzI4N2YwYjA3NCAoIkFT
b0M6IHNvYy1wY206IGRwY206IGZpeCBwbGF5YmFjay9jYXB0dXJlIGNoZWNrcyIpCj4gU2lnbmVk
LW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+CgpUaGlzIHBhdGNo
IGxhbmRlZCBmaW5hbGx5IGluIHY1LjktcmMxLiBJJ3ZlIG5vdGljZWQgaXQgY2F1c2VzIGEgCmZv
bGxvd2luZyB3YXJuaW5nIG9uIEhhcmRrZXJuZWwncyBPZHJvaWQgTjIgYm9hcmQgCihhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRiKToKCm1lc29uLWRy
bSBmZjkwMDAwMC52cHU6IFtkcm1dIGZiMDogbWVzb25kcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNl
Ci0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpXQVJOSU5HOiBDUFU6IDMgUElE
OiA2NiBhdCBzb3VuZC9zb2Mvc29jLWNvcmUuYzo4MTcgCnNuZF9zb2NfZmluZF9kYWkrMHhlNC8w
eGYwCk1vZHVsZXMgbGlua2VkIGluOiBkd19oZG1pX2kyc19hdWRpbyBkd19oZG1pX2NlYyBtZXNv
bl9neGwgcmVhbHRlayAKZHdtYWNfZ2VuZXJpYyBjcmN0MTBkaWZfY2Ugc25kX3NvY19tZXNvbl9h
eGdfc291bmRfY2FyZCAKc25kX3NvY19tZXNvbl9jYXJkX3V0aWxzIHJjX29kcm9pZCBwd21fbWVz
b24gbWVzb25faXIgCnNuZF9zb2NfbWVzb25fZzEyYV90b2Fjb2RlYyBzbmRfc29jX21lc29uX2F4
Z190ZG1vdXQgcnRjX21lc29uX3ZydGMgCnNuZF9zb2NfbWVzb25fZzEyYV90b2hkbWl0eCBzbmRf
c29jX21lc29uX2NvZGVjX2dsdWUgbWRpb19tdXhfbWVzb25fZzEyYSAKc25kX3NvY19tZXNvbl9h
eGdfdGRtaW4gZHdtYWNfbWVzb244YiBzdG1tYWNfcGxhdGZvcm0gCnJlc2V0X21lc29uX2F1ZGlv
X2FyYiBzbmRfc29jX21lc29uX2F4Z19mcmRkciBheGdfYXVkaW8gCnNuZF9zb2NfbWVzb25fYXhn
X3RvZGRyIHNjbGtfZGl2IGNsa19waGFzZSBtZXNvbl9ybmcgc3RtbWFjIHJuZ19jb3JlIAptZXNv
bl9kd19oZG1pIHNuZF9zb2NfbWVzb25fYXhnX2ZpZm8gbWVzb25fZHJtIG1lc29uX2NhbnZhcyBt
ZGlvX3hwY3MgCmR3X2hkbWkgc25kX3NvY19tZXNvbl90OTAxNSBkaXNwbGF5X2Nvbm5lY3RvciBu
dm1lbV9tZXNvbl9lZnVzZSAKc25kX3NvY19tZXNvbl9heGdfdGRtX2ludGVyZmFjZSBzbmRfc29j
X21lc29uX2F4Z190ZG1fZm9ybWF0dGVyIApzbmRfc29jX3NpbXBsZV9hbXBsaWZpZXIKQ1BVOiAz
IFBJRDogNjYgQ29tbToga3dvcmtlci8zOjEgTm90IHRhaW50ZWQgNS45LjAtcmMxICMxNTI3Ckhh
cmR3YXJlIG5hbWU6IEhhcmRrZXJuZWwgT0RST0lELU4yIChEVCkKV29ya3F1ZXVlOiBldmVudHMg
ZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jCnBzdGF0ZTogNjAwMDAwMDUgKG5aQ3YgZGFpZiAtUEFO
IC1VQU8gQlRZUEU9LS0pCnBjIDogc25kX3NvY19maW5kX2RhaSsweGU0LzB4ZjAKbHIgOiBzbmRf
c29jX2ZpbmRfZGFpKzB4ZTAvMHhmMAouLi4KQ2FsbCB0cmFjZToKIMKgc25kX3NvY19maW5kX2Rh
aSsweGU0LzB4ZjAKIMKgc25kX3NvY19kYWlfbGlua19zZXRfY2FwYWJpbGl0aWVzKzB4NjgvMHgx
NjAKIMKgYXhnX2NhcmRfYWRkX2xpbmsrMHgxODgvMHg1YzQgW3NuZF9zb2NfbWVzb25fYXhnX3Nv
dW5kX2NhcmRdCiDCoG1lc29uX2NhcmRfcHJvYmUrMHgxZTAvMHg5NjAgW3NuZF9zb2NfbWVzb25f
Y2FyZF91dGlsc10KIMKgcGxhdGZvcm1fZHJ2X3Byb2JlKzB4NTAvMHhhOAogwqByZWFsbHlfcHJv
YmUrMHgxMTAvMHg0MDAKIMKgZHJpdmVyX3Byb2JlX2RldmljZSsweDU0LzB4YjgKIMKgX19kZXZp
Y2VfYXR0YWNoX2RyaXZlcisweDkwLzB4YzAKIMKgYnVzX2Zvcl9lYWNoX2RydisweDcwLzB4YzgK
IMKgX19kZXZpY2VfYXR0YWNoKzB4ZWMvMHgxNTAKIMKgZGV2aWNlX2luaXRpYWxfcHJvYmUrMHgx
MC8weDE4CiDCoGJ1c19wcm9iZV9kZXZpY2UrMHg5NC8weGEwCiDCoGRlZmVycmVkX3Byb2JlX3dv
cmtfZnVuYysweDcwLzB4YTgKIMKgcHJvY2Vzc19vbmVfd29yaysweDJhOC8weDcxOAogwqB3b3Jr
ZXJfdGhyZWFkKzB4NDgvMHg0NjAKIMKga3RocmVhZCsweDEzNC8weDE2MAogwqByZXRfZnJvbV9m
b3JrKzB4MTAvMHgxYwppcnEgZXZlbnQgc3RhbXA6IDI2OTY5MApoYXJkaXJxcyBsYXN0wqAgZW5h
YmxlZCBhdCAoMjY5Njg5KTogWzxmZmZmODAwMDEwZjYwNDhjPl0gCl9yYXdfc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSsweDdjLzB4OTgKaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjY5NjkwKTog
WzxmZmZmODAwMDEwMDI1YTY4Pl0gCmRvX2RlYnVnX2V4Y2VwdGlvbisweDE0MC8weDI2Ywpzb2Z0
aXJxcyBsYXN0wqAgZW5hYmxlZCBhdCAoMjY5MzE4KTogWzxmZmZmODAwMDEwMDAxNjU0Pl0gCmVm
aV9oZWFkZXJfZW5kKzB4NjU0LzB4NmQ0CnNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDI2OTMx
Myk6IFs8ZmZmZjgwMDAxMDA4OTI5Yz5dIAppcnFfZXhpdCsweDE2Yy8weDE3OAotLS1bIGVuZCB0
cmFjZSA1NmEzZWE0ZmEwMGMzN2M4IF0tLS0KLi4uCmF4Zy1zb3VuZC1jYXJkIHNvdW5kOiBBU29D
OiBubyBETUkgdmVuZG9yIG5hbWUhCgpUaGUgd2FybmluZyBpcyByZXBlYXRlZCAxMCB0aW1lcy4K
ClRoZSBiaXNlY3QgYmV0d2VlbiB2NS44LXJjMSBhbmQgdjUuOS1yYzEgcG9pbnRzIHRvIHRoZSBj
b21taXQgCmM4ZjdkYmRiYWExNSAoIk1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ2Fzb2Mv
Zm9yLTUuOCcgaW50byAKYXNvYy1saW51cyIpLCB3aGljaCBpbnRyb2R1Y2VkIGEgYnJhbmNoIHdp
dGggdGhpcyBwYXRjaC4KClRoZSBjb21taXQgd2l0aCB0aGlzIHBhdGNoIGlzIGFwcGxpZWQgb24g
dGhlIGVhcmxpZXIga2VybmVsIHJlbGVhc2UgCihkYTNmMjNmZGU5ZDcgIkFTb0M6IG1lc29uOiBj
YXJkczogZGVhbCBkcGNtIGZsYWcgY2hhbmdlIiBvbiB0b3Agb2YgCnY1LjctcmMxKSB3b3JrZWQg
ZmluZSwgc28gaXQgbG9va3MgdGhhdCB0aGVyZSBpcyBhbiBpbnRlcmZlcmVuY2Ugd2l0aCAKc29t
ZXRoaW5nIG1lcmdlZCBsYXRlci4KCklmIEkgcmV2ZXJ0IHRoaXMgcGF0Y2ggb24gdG9wIG9mIHY1
LjktcmMxIG9yIGN1cnJlbnQgbGludXgtbmV4dCwgdGhlIAp3YXJuaW5nIGlzIGdvbmUuIExldCBt
ZSBrbm93IGhvdyBJIGNhbiBoZWxwIGRlYnVnZ2luZyB0aGlzIGlzc3VlLgoKQmVzdCByZWdhcmRz
Ci0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
