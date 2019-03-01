Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4A4C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 09:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A91A2085A
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 09:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdDBJWUS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dFpzn78n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A91A2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA7GJ+vcyCW8Lyrl/6b1T56QQZHjYTMfvMgDwUolASQ=; b=TdDBJWUSd54pH0
	PVhmqiojN7gN6OdnHS9CjI/gw8ZZZpbLClVHU5AcH0rCWL/Ak4vp4hjmLApj/GGC1OP9pepy+IImh
	NFI4FjG2AhXl0CQ6f9OfIfS4fnnHKBX4TCalcE4a/YViKLPbwfuRqByMB85PnPTecuqNbtQiENAkT
	bcHXhWxLda35rvXWl/DOwPxivyjdgQ/9OLj58MRtsJHRlUogoet/R4kbe5dgapqZQlP71b+dJzFDM
	QgFx1AOa/QzPz0qNORLUK74FXYvois4hqUJIaG12VT5Cqh7CPU4XRuF8USrtlrbmjAMSWKi8HKvQA
	PSOfKL6J7gZGx2Ul4SwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzeOI-0005V1-8g; Fri, 01 Mar 2019 09:23:38 +0000
Received: from smtprelay4.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzeOF-0005Ud-8T
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 09:23:37 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id D1CFD24E1D11;
 Fri,  1 Mar 2019 01:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551432211; bh=cI3PdUj/O9OtmYuPA/xrXo8amR4cS5bIQkF6J577VpI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=dFpzn78nFQuvSejEcO5fHEeHDcPJdYL3lJw8shMLTR4HPsiRjwx/iss4q+wfnGjkY
 gBw+quCktkTduDjw6jbeD3a0q38TS1kUmizKh5hzVRaPS9i1gDzAFOJTnGJbUQrb/V
 N9tU9UFSH7mNXhlW0mEDoAa/g8QSYoaKm3rDJhsEjOiZ84a9mAlOKAUUd2DVjfCGtl
 3PJM5UzAIOF4ayeK0T4GSI4zs0QyrCfxXYiffh58XNhFHP/5fTB3zCADMeiOrMVEen
 d02yNZvKh0webkpTaulr61At6XG+QDNcoazLAeNXCqYhwDPQ+2J1EJM4HQ6ko/BGpB
 Rc9pj/XKw4ooA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A9BFFA0079;
 Fri,  1 Mar 2019 09:23:26 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 1 Mar 2019 01:23:26 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 1 Mar 2019 10:23:24 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 1 Mar 2019 10:23:23 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
 <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
 <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
 <12d1d6de-2905-46a8-6481-d6f20c8e9d85@gmx.de>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <2c4d9726-6c2a-cd95-0493-323f5f09e14a@synopsys.com>
Date: Fri, 1 Mar 2019 09:23:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <12d1d6de-2905-46a8-6481-d6f20c8e9d85@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_012335_328303_8E7AFB02 
X-CRM114-Status: GOOD (  23.93  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgU2ltb24sCgpPbiAyLzI3LzIwMTkgNzowMiBQTSwgU2ltb24gSHVlbGNrIHdyb3RlOgo+IEhp
LAo+IAo+IAo+IHRoZSB0aGluZyBpcyAsIHRoYXQgaW0gbm90IGEgc3RtbWFjIGRldmVsb3Blci4g
WWVzICwgbWF5YmUgaSBjYW4gYmlzc2VjdAo+IGl0IGFuZCB5ZXMgeW91IGFyZSBsdWNreSBzaW5j
ZSBpbSBhIEMtZGV2ZWxvcGVyIHNpbmNlIGEgbG9uZyB0aW1lIGZvcgo+IGVtYmVkZGVkIHN5c3Rl
bXMuCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhhdCBpIGRvbnQgdW5kZXJzdGFuZCB0aGUgc3RydWN0
dXJlIG9mIHN0bW1hYyBhbmQgaW0gbm90Cj4gYXdhcmUgb2YgYW55IGRvY3VtZW50YXRpb24gYWJv
dXQgdGhlIGRyaXZlciBzdHJ1Y3R1cmUgbm9yIHRoZSB1bmRlcmx5aW5nCj4gZXRoZXJuZXQgaGFy
ZHdhcmUgKCBldmVuIHRob3VnaCBpbSB1c2VkIHRvIGV0aGVybmV0IGhhcmR3YXJlIGluIGVtYmVk
ZGVkCj4gZW52aXJvbm1lbnQgKS4gU28gaG93IHNoYWxsIGkgcmVjb2duaXplIHRoZSByZWxldmFu
dCBjaGFuZ2UgYmV0d2Vlbgo+IDQuMTQuMjkgYW5kIDUuMHJjOCA/Cj4gCj4gCj4gSXMgaXQgaW4g
dGhlIERUUy9EVEIsIHdyb25nIGhhcmR3YXJlIGRlc2NyaXB0aW9uID8gSXMgaXQgaW4gdGhlIGNv
ZGUgPwo+IGhvdyBpcyB0aGUgZHVwbGV4IGhhcmR3YXJlIHdvcmtpbmcgb24gdGhpcyBwaWVjZSA/
Cj4gCj4gSSBjYW4gdHJ5IHRvIHN1cHBvcnQgeW91IHRoZSBiZXN0IGkgY2FuLCBidXQgaSBoYXZl
IGxpdHRsZSBjaGFuY2VzIHRvCj4gYW5hbHl6ZSBpdCBteXNlbGYuIEF0IHdoaWNoIG1lYXN1cmVt
ZW50cyAvIGNvdW50ZXJzIGlzIGl0IHBvc3NpYmxlIHRvCj4gc2VlIHRoYXQgZHVwbGV4IGlzIGZ1
bGx5IHdvcmtpbmcgP8KgIFdoeSBkaWQgZXZlbiB0aGUgbm9uLWR1cGxleAo+IGJhbmR3aWR0aCBy
ZWdyZXNzIGZyb20gOTAwTUJpdHMgdG8gNjUwID8gV2h5IGlzIHRoYXQgNjUwIE1CaXRzIGRpdmlk
aW5nCj4gdXAgdG8gVFggYW5kIFJYIGluIHN1bW1hcnkgd2hlbiBkb2luZyBkdXBsZXggPyBXaHkg
aXMgVFggbm90IHN0YXJ2aW5nIGluCj4gZHVwbGV4IGJ1dCBSWCA/Cj4gCj4gRnJvbSBteSBwb2lu
dCBvZiB2aWV3IHNob3VsZCBiZSB0aGUgZm9sbG93aW5nIHRoaW5ncyBnaXZlbjoKPiAtIHRoZSBu
b24gZHVwbGV4IGJhbmR3aWR0aCBzaG91bGQgYmUgc29tZXdoZXJlIGFyb3VuZCA5MDBNQml0cyAs
IHRoZSBIVwo+IGlzIGNhcGFibGUgb2YgdGhhdAo+IC0gVFggc2hvdWxkIG5vdCBpbmZsdWVuY2Ug
Ulggb3IgdmljZSB2ZXJzYSBpbiBkdXBsZXgKPiAtIHRoZSBkdXBsZXggYmFuZHdpZHRoIHNob3Vs
ZCBiZSA5MDBNQml0cyBpbiBib3RoIGRpcmVjdGlvbnMgKCBtYXliZSBhCj4gYml0IGFzeW1ldHJp
YyB3aGVuIGJ1ZmZlcnMgaW4gYm90aCBkaXJzIGFyZSBub3Qgc2FtZSApCj4gCj4gSSBndWVzcyB3
ZSBuZWVkIHNvbWUgcHJvZmlsaW5nIG9uIHN0bW1hYyBhbmQgKCBhdCBsZWFzdCBpIG5lZWQgKSBt
b3JlCj4ga25vd2xlZGdlIG9mIHRoZSBoYXJkd2FyZSBhbmQgc3RtbWFjIGl0c2VsZi4gQ2FuIHNv
bWVvbmUgcG9pbnQgbWUgdG8gdGhlCj4gZHJpdmVyIGRvY3VtZW50YXRpb24sIGRlc2NyaWJpbmcg
dGhlIGZ1bmN0aW9ucyBpbiB0aGUgY29kZSBhbmQgdGhlCj4gc3RydWN0dXJlID8gSG93IGNhbiBp
IHByb2ZpbGUgc3RtbWFjICggdXN1YWxseSBpbSB1c2luZyBoYXJkd2FyZSAvIEpUQUcKPiBkZWJ1
Z2dlcnMgYXQgd29yaywgYnV0IGhlcmUgQGhvbWUgaSBnb3Qgbm90aGluZyBsaWtlIHRoYXQgKQo+
IAo+IFNvIGhvdyBkbyB3ZSBjb250aW51ZSA/CgpXaGVuIEkgc2FpZCBiaXNzZWN0IEkgd2FzIG1l
YW5pbmcgR0lUIEJpc3NlY3QgWzFdLiBZb3Ugc2hvdWxkbid0Cm5lZWQgYW55IGRldmVsb3BtZW50
IGJhY2tncm91bmQgZm9yIHRoaXMuIFlvdSBqdXN0IGhhdmUgdG8gc3RhcnQKYmlzc2VjdCwgY29t
cGlsZSwgdGVzdCBhbmQgY2hlY2sgaWYgY29tbWl0IGlzIGdvb2Qgb3Igbm90LgoKSSdtIG5vdCB2
ZXJ5IGZhbWlsaWFyIHdpdGggdGhpcyBmZWF0dXJlIGJ1dCBJIHRoaW5rIHlvdSBjYW4KYmlzc2Vj
dCBwcmV0dHkgZmFzdCBpZiB5b3Ugc2F5IHlvdSBqdXN0IHdhbnQgc3RtbWFjIGNvbW1pdHMsCmNo
ZWNrICgiQ3V0dGluZyBkb3duIGJpc2VjdGlvbiBieSBnaXZpbmcgbW9yZSBwYXJhbWV0ZXJzIHRv
CmJpc2VjdCBzdGFydCIpIG9uIHByZXZpb3VzIGxpbmsgLi4uIEluIHlvdXIgY2FzZSBpdCB3b3Vs
ZCBiZQpzdG1tYWMgY2hhbmdlcywgZHRzLCBhbmQgcGh5LgoKWzFdIGh0dHBzOi8vZ2l0LXNjbS5j
b20vZG9jcy9naXQtYmlzZWN0CgpUaGFua3MsCkpvc2UgTWlndWVsIEFicmV1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
