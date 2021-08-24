Return-Path: <SRS0=5laz=NP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDD1C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 07:04:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B53461212
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 07:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B53461212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0NeV8aRX+HlB8s2h+9uutqi0VUveV7zxYfbVXOAHOE=; b=P5keIZhpRmca17
	ecAXqyUyPzLOmdKFTcSKAHBZ6tfl3/yims+McKmxka7tQWm9MJ88whd7uTksvRO7Mco4vhY+FPBPx
	slheWTllZbA267F7S7bxhXNrBQCOFgbyQAkFMm0Sc5lJ9QoXodgWiK4qkhq3AvB/xEnuMQ0GWxDmg
	avSoqTXPAluuq7GJlp4uvOLmzIBl4i4SsJfr54/IfFXILf/ACV6GAhH1xCHlPE8ds0b4NKDXvvd+5
	x+8JOgu9H9OQuErsqvq552MmY1NodaMoQbVZ4zQ0QOgjD36STyUbunPyR40ijFtI2bS3ODSK3L0lo
	ULhsn/cLa30okrpFMEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQTa-001yrO-51; Tue, 24 Aug 2021 07:04:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQTV-001ynx-3s
 for linux-amlogic@lists.infradead.org; Tue, 24 Aug 2021 07:04:01 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824070343euoutp0294024a541f47a5a941c32c5b7362f799~eLB5Dq5vZ1639916399euoutp02J
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Aug 2021 07:03:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210824070343euoutp0294024a541f47a5a941c32c5b7362f799~eLB5Dq5vZ1639916399euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629788623;
 bh=K7UcmSiFeYIOQ4+FF8trOkGP6PZRVAmTewD5ZmA1IiY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Jktda2QXVQN4FoGQyCjj//PxhEyo/A1Ud7cR8R+t7/x4pa6DJH+Zb/2VW9mWsk5DZ
 K/EchbnT/8Qjhod1D2dAFNUvCVfI5arenxmdEVOh2dup7jsLrljAEtOx+cz7fCAvYC
 Nt0kff8af6BX+c+65iDbutK+mIyfXxbVnYsvKKkA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210824070343eucas1p1b780ef683d1f7bb4b90669590f8f0e65~eLB4xq0Pf2738027380eucas1p18;
 Tue, 24 Aug 2021 07:03:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7D.A6.42068.FC994216; Tue, 24
 Aug 2021 08:03:43 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210824070342eucas1p1c0293540f5c1138aa0c7b7e877ef1da9~eLB4M9k520119901199eucas1p1Q;
 Tue, 24 Aug 2021 07:03:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210824070342eusmtrp2f3f6005efdc359dbb440103206c25839~eLB4L90IY0846908469eusmtrp2I;
 Tue, 24 Aug 2021 07:03:42 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-90-612499cfdc75
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.A0.20981.EC994216; Tue, 24
 Aug 2021 08:03:42 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210824070342eusmtip1decc011336f231776205c3907c391e6b~eLB3kOT1P1034810348eusmtip1T;
 Tue, 24 Aug 2021 07:03:42 +0000 (GMT)
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <427ce8cd-977b-03ae-2020-f5ddc7439390@samsung.com>
Date: Tue, 24 Aug 2021 09:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87rnZ6okGsx4IGBx/u4hZov5R86x
 Wsx885/NYsd2EYsFs7ktLu+aw2ZxqC/a4tgCMYvWvUfYLboO/WVz4PLYtnsbq8f7G63sHjtn
 3WX3WLCp1GPTqk42j81L6j127vjM5PF5k1wARxSXTUpqTmZZapG+XQJXxrG/B9kLpktVfL01
 k7mBcYJYFyMnh4SAiURr63PGLkYuDiGBFYwSp689Y4dwvjBK/N06lRnC+cwo8ejlAUaYlnPP
 b0JVLWeUePv6LCuE85FRYvX0LewgVcICkRJn9+1lA7FFBLQkNl17zAJSxCywkkni9vpHLCAJ
 NgFDia63XWBFvAJ2Eh2nIWwWAVWJtbvvgA0SFUiWmPhkEitEjaDEyZlPgHo5ODgFAiW+XTQE
 CTMLyEs0b53NDGGLS9x6Mp8JZJeEwH8OiQ0vtrBBnO0i0XywiwXCFpZ4dRziUAkBGYn/O2Ea
 mhklHp5byw7h9DBKXG6aAfW0tcSdc7/YQDYzC2hKrN+lDxF2lPjd/pgVJCwhwCdx460gxBF8
 EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gnMCrNQvLZLCTvzELyziyEvQsYWVYxiqeWFuem
 pxYb5aWW6xUn5haX5qXrJefnbmIEpq3T/45/2cG4/NVHvUOMTByMhxglOJiVRHj/MiknCvGm
 JFZWpRblxxeV5qQWH2KU5mBREudN2rImXkggPbEkNTs1tSC1CCbLxMEp1cAUtDVLV4xb9M2y
 VRPtpBt5GhfMr+r4wr9v/UxVhidnT/vMqLG2XHGBSSdH8FTBtdmLsl+uCFI1Maw07HptppHd
 7TLDTe+mXlXVvN2X5s9ZdWm6iBTn1jau4+4/c47s0Og4OUtk3t50fbb9uufZ8oXUjp42mLlg
 4rfSi8npJetCLhhOT3pZ8bM4f3rj8/LlW+74l/e+yNT7+T3J/UnljzAhg9uSsrznT2gwii6L
 uuS68KBUdbb7iUvxEy6Xx/e5f7603041b9H7DTO2qW64Nfk+v8ab6XPnLwjaW/PnZj6/sOsX
 AW6R/fVNCi8lwrMr5TRqVqe1TL9zUWGSJ+veEtWIN5uOv3/bcug+j3GBzKLLSizFGYmGWsxF
 xYkAnR9FucoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7rnZqokGjy8qGpx/u4hZov5R86x
 Wsx885/NYsd2EYsFs7ktLu+aw2ZxqC/a4tgCMYvWvUfYLboO/WVz4PLYtnsbq8f7G63sHjtn
 3WX3WLCp1GPTqk42j81L6j127vjM5PF5k1wAR5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrG/B9kLpktVfL01k7mBcYJYFyMnh4SAicS55zfZ
 uxi5OIQEljJKPLn9lBkiISNxcloDK4QtLPHnWhcbRNF7RonHv+cwgSSEBSIlvj87yQhiiwho
 SWy69pgFxGYWWMkksfJROURDN5PElBlNYAk2AUOJrrcgkzg5eAXsJDpOQ9gsAqoSa3ffYQex
 RQWSJT6cXsoKUSMocXLmE6BeDg5OgUCJbxcNIeabSczb/JAZwpaXaN46G8oWl7j1ZD7TBEah
 WUi6ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo3TbsZ9bdjCufPVR
 7xAjEwfjIUYJDmYlEd6/TMqJQrwpiZVVqUX58UWlOanFhxhNgd6ZyCwlmpwPTBN5JfGGZgam
 hiZmlgamlmbGSuK8JkfWxAsJpCeWpGanphakFsH0MXFwSjUwqeiW1H8/re2+Q0l/q9TMeu5F
 Xu8WuZWwHN01N9KqOvoa62OdkNV76zRF19yaZcrFYLnrfV3ckajQE41JMq7//+oEPxDMe7az
 fn5F9U+/dkfWi/JODIpzVCZsdGzfKnVlb2D9F6ONywpmPQ05vUXx9ek2Eb1ejzuzlBfuvb3N
 akXY16fznwea7wy6NPngeQ4fodbs/u+OdpdVHp7eO2myy/ZS09pVWqkP6/vyS9Y9+xgtG3Oi
 X+RrwjGuiPgLmUE/nvw4sl42vmrztuQY1gP7i7xEFIOvKr6q5tl9xGDBqcefZ5zm644rExZy
 vOi3WqV7gyfLl6K386Pi8m7Hf/BZLXLrm9iW8B9h+1Z67z32VImlOCPRUIu5qDgRAGox1BNb
 AwAA
X-CMS-MailID: 20210824070342eucas1p1c0293540f5c1138aa0c7b7e877ef1da9
X-Msg-Generator: CA
X-RootMTR: 20210823120849eucas1p11d3919886444358472be3edd1c662755
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823120849eucas1p11d3919886444358472be3edd1c662755
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_000357_478364_A9EA12D8 
X-CRM114-Status: GOOD (  22.56  )
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

SGksCgpPbiAyMy4wOC4yMDIxIDIwOjIyLCBTYXJhdmFuYSBLYW5uYW4gd3JvdGU6Cj4gT24gTW9u
LCBBdWcgMjMsIDIwMjEgYXQgNTowOCBBTSBNYXJlayBTenlwcm93c2tpCj4gPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+IE9uIDE4LjA4LjIwMjEgMDQ6MTcsIFNhcmF2YW5hIEth
bm5hbiB3cm90ZToKPj4+IEFsbG93cyB0cmFja2luZyBkZXBlbmRlbmNpZXMgYmV0d2VlbiBFdGhl
cm5ldCBQSFlzIGFuZCB0aGVpciBjb25zdW1lcnMuCj4+Pgo+Pj4gQ2M6IEFuZHJldyBMdW5uIDxh
bmRyZXdAbHVubi5jaD4KPj4+IENjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4+PiBTaWduZWQt
b2ZmLWJ5OiBTYXJhdmFuYSBLYW5uYW4gPHNhcmF2YW5ha0Bnb29nbGUuY29tPgo+PiBUaGlzIHBh
dGNoIGxhbmRlZCByZWNlbnRseSBpbiBsaW51eC1uZXh0IGFzIGNvbW1pdCBjZjRiOTRjODUzMGQg
KCJvZjoKPj4gcHJvcGVydHk6IGZ3X2Rldmxpbms6IEFkZCBzdXBwb3J0IGZvciAicGh5LWhhbmRs
ZSIgcHJvcGVydHkiKS4gSXQgYnJlYWtzCj4+IGV0aGVybmV0IG9wZXJhdGlvbiBvbiBteSBBbWxv
Z2ljLWJhc2VkIEFSTTY0IGJvYXJkczogT2Ryb2lkIEM0Cj4+IChhcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLXNtMS1vZHJvaWQtYzQuZHRzKSBhbmQgTjIKPj4gKG1lc29uLWcxMmItb2Ryb2lk
LW4yLmR0cykgYXMgd2VsbCBhcyBLaGFkYXMgVklNMy9WSU0zbAo+PiAobWVzb24tZzEyYi1hMzEx
ZC1raGFkYXMtdmltMy5kdHMgYW5kIG1lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzKS4KPj4KPj4g
SW4gY2FzZSBvZiBPZHJvaWRDNCBJIHNlZSB0aGUgZm9sbG93aW5nIGVudHJpZXMgaW4gdGhlCj4+
IC9zeXMva2VybmVsL2RlYnVnL2RldmljZXNfZGVmZXJyZWQ6Cj4+Cj4+IGZmNjRjMDAwLm1kaW8t
bXVsdGlwbGV4ZXIKPj4gZmYzZjAwMDAuZXRoZXJuZXQKPj4KPj4gTGV0IG1lIGtub3cgaWYgdGhl
cmUgaXMgYW55dGhpbmcgSSBjYW4gY2hlY2sgdG8gaGVscCBkZWJ1Z2dpbmcgdGhpcyBpc3N1ZS4K
PiBJJ20gZmFpcmx5IGNlcnRhaW4geW91IGFyZSBoaXR0aW5nIHRoaXMgaXNzdWUgYmVjYXVzZSB0
aGUgUEhZIGRldmljZQo+IGRvZXNuJ3QgaGF2ZSBhIGNvbXBhdGlibGUgcHJvcGVydHkuIEFuZCBz
byB0aGUgZGV2aWNlIGxpbmsgZGVwZW5kZW5jeQo+IGlzIHByb3BhZ2F0ZWQgdXAgdG8gdGhlIG1k
aW8gYnVzLiBCdXQgYnVzc2VzIGFzIHN1cHBsaWVycyBhcmVuJ3QgZ29vZAo+IGJlY2F1c2UgYnVz
c2VzIG5ldmVyICJwcm9iZSIuCj4KPiBQSFkgc2VlbXMgdG8gYmUgb25lIG9mIHRob3NlIGNhc2Vz
IHdoZXJlIGl0J3Mgb2theSB0byBoYXZlIHRoZQo+IGNvbXBhdGlibGUgcHJvcGVydHkgYnV0IGFs
c28gb2theSB0byBub3QgaGF2ZSBpdC4gWW91IGNhbiBjb25maXJtIG15Cj4gdGhlb3J5IGJ5IGNo
ZWNraW5nIGZvciB0aGUgbGlzdCBvZiBzdXBwbGllcnMgdW5kZXIKPiBmZjY0YzAwMC5tZGlvLW11
bHRpcGxleGVyLiBZb3UnZCBzZWUgbWRpb0AwIChleHRfbWRpbykgYW5kIGlmIHlvdSBsb29rCj4g
YXQgdGhlICJzdGF0dXMiIGZpbGUgdW5kZXIgdGhlIGZvbGRlciBpdCBzaG91bGQgYmUgImRvcm1h
bnQiLiBJZiB5b3UKPiBhZGQgYSBjb21wYXRpYmxlIHByb3BlcnR5IHRoYXQgZml0cyB0aGUgZm9y
bWF0cyBhIFBIWSBub2RlIGNhbiBoYXZlLAo+IHRoYXQgc2hvdWxkIGFsc28gZml4IHlvdXIgaXNz
dWUgKG5vdCB0aGUgc29sdXRpb24gdGhvdWdoKS4KCldoZXJlIHNob3VsZCBJIGxvb2sgZm9yIHRo
ZSBtZW50aW9uZWQgZGV2aWNlIGxpbmtzICdzdGF0dXMnIGZpbGU/CgojIGZpbmQgL3N5cyAtbmFt
ZSBmZjY0YzAwMC5tZGlvLW11bHRpcGxleGVyCi9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmY2
MDAwMDAuYnVzL2ZmNjRjMDAwLm1kaW8tbXVsdGlwbGV4ZXIKL3N5cy9idXMvcGxhdGZvcm0vZGV2
aWNlcy9mZjY0YzAwMC5tZGlvLW11bHRpcGxleGVyCgojIGxzIC1sIC9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS9zb2MvZmY2MDAwMDAuYnVzL2ZmNjRjMDAwLm1kaW8tbXVsdGlwbGV4ZXIKdG90YWwgMAps
cnd4cnd4cnd4IDEgcm9vdCByb290wqDCoMKgIDAgSmFuwqAgMSAwMDowNCAKY29uc3VtZXI6cGxh
dGZvcm06ZmYzZjAwMDAuZXRoZXJuZXQgLT4gCi4uLy4uLy4uLy4uL3ZpcnR1YWwvZGV2bGluay9w
bGF0Zm9ybTpmZjY0YzAwMC5tZGlvLW11bHRpcGxleGVyLS1wbGF0Zm9ybTpmZjNmMDAwMC5ldGhl
cm5ldAotcnctci0tci0tIDEgcm9vdCByb290IDQwOTYgSmFuwqAgMSAwMDowNCBkcml2ZXJfb3Zl
cnJpZGUKLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0MDk2IEphbsKgIDEgMDA6MDQgbW9kYWxpYXMK
bHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdMKgwqDCoCAwIEphbsKgIDEgMDA6MDQgb2Zfbm9kZSAtPiAK
Li4vLi4vLi4vLi4vLi4vZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL3NvYy9idXNAZmY2MDAwMDAv
bWRpby1tdWx0aXBsZXhlckA0YzAwMApkcnd4ci14ci14IDIgcm9vdCByb290wqDCoMKgIDAgSmFu
wqAgMSAwMDowMiBwb3dlcgpscnd4cnd4cnd4IDEgcm9vdCByb290wqDCoMKgIDAgSmFuwqAgMSAw
MDowNCBzdWJzeXN0ZW0gLT4gCi4uLy4uLy4uLy4uLy4uL2J1cy9wbGF0Zm9ybQpscnd4cnd4cnd4
IDEgcm9vdCByb290wqDCoMKgIDAgSmFuwqAgMSAwMDowNCAKc3VwcGxpZXI6cGxhdGZvcm06ZmY2
M2MwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlciAtPiAKLi4vLi4vLi4vLi4v
dmlydHVhbC9kZXZsaW5rL3BsYXRmb3JtOmZmNjNjMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2Nr
LWNvbnRyb2xsZXItLXBsYXRmb3JtOmZmNjRjMDAwLm1kaW8tbXVsdGlwbGV4ZXIKLXJ3LXItLXIt
LSAxIHJvb3Qgcm9vdCA0MDk2IEphbsKgIDEgMDA6MDQgdWV2ZW50Ci1yLS1yLS1yLS0gMSByb290
IHJvb3QgNDA5NiBKYW7CoCAxIDAwOjA0IHdhaXRpbmdfZm9yX3N1cHBsaWVyCgojIGNhdCAKL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZjYwMDAwMC5idXMvZmY2NGMwMDAubWRpby1tdWx0aXBs
ZXhlci93YWl0aW5nX2Zvcl9zdXBwbGllcgowCgpJJ20gYWxzbyBub3Qgc3VyZSB3aGF0IGNvbXBh
dGlibGUgc3RyaW5nIHNob3VsZCBJIGFkZCB0aGVyZS4KCj4gSSdsbCBzZW5kIG91dCBhIGZpeCB0
aGlzIHdlZWsgKG9uY2UgeW91IGNvbmZpcm0gbXkgYW5hbHlzaXMpLiBUaGFua3MKPiBmb3IgcmVw
b3J0aW5nIGl0LgoKQmVzdCByZWdhcmRzCgotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1
bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
