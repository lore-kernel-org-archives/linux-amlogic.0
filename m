Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B603C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 13:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0CC217F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 13:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T4+s+duG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CDdhCesS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0CC217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nonpm8Lz8rJM+b87EqpAv6xJp0Fu0BnvK+93TKFhXJA=; b=T4+s+duGd0i7lo
	m0kyr/MCh1j6rEltANnARI/QdxALSdTtPoZc5UGLcUZ6J8TMaxmPID5hNTl3IoUDUOQy+7Y1ZCKCT
	H1oYLUK/9Wu82NAa4BNopf34BTBgSJs/eRZPa0afEV8FSAKkCXdle/cSwXORbCf8Au2eZvkqDyY66
	EY8lNAjUPhJ0qtJdtW+LWsnsGB7ptwFNnkafhtqwuhPXO0jlqVGeRxIq8cBNiT7vfMNBUob6lixYP
	IGGxb5Nmyv31uae75uqX+rUpFtcA8gQkKHUB2QAN5QZ6H2DC4suDomD+oXmeb5nmMIbOFtNI0T8UL
	CmWQ0vLytI+mwZq7Oyvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gviZL-0004oW-BW; Mon, 18 Feb 2019 13:02:47 +0000
Received: from smtprelay.synopsys.com ([198.182.47.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gviZI-0004nQ-2V
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 13:02:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id EECF824E25A6;
 Mon, 18 Feb 2019 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550494963; bh=wqY0VdXLP9z2F4XH0PtoC1jhQ4jTqVTDr8U57RYQzmI=;
 h=Subject:From:To:CC:References:Date:In-Reply-To:From;
 b=CDdhCesS01hyQ6mvE8gzfKKEL0GG+8dHw6WdeNdvQxmG/dYhIDNYqwN/OJIxD2VDn
 F65BkI62USm2a9gdBXablt+Ae/c/GPRqI+8kslOt2TenhxnBvArKlARCUMcVDf6PJt
 95FKZ/0mtMxUxUrHSLBOgG4Onn6xYdKngsyHCudCcQgyH8rmQs5lf8kthU/J9OYTET
 D2hxfbYXniFdWUXX6y6TFTViLlG5zkX3FpWbjbblpV4e5d+SL6KZaCM3bdekpw8rdX
 kHRnQM07jLbIFJ5JHMcxOZkVDD7VgLXrxgRFnYuWEuXSV3vXQUIpPKXx84Evwy9lXj
 73yF8gBqg3oFA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 700CEA005A;
 Mon, 18 Feb 2019 13:02:42 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 05:02:42 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 14:02:40 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 14:02:40 +0100
Subject: Re: stmmac / meson8b-dwmac
From: Jose Abreu <jose.abreu@synopsys.com>
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
Message-ID: <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
Date: Mon, 18 Feb 2019 13:02:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_050244_121826_A3AC364A 
X-CRM114-Status: GOOD (  11.12  )
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

T24gMi8xOC8yMDE5IDEyOjQxIFBNLCBKb3NlIEFicmV1IHdyb3RlOgo+IE9uIDIvMTgvMjAxOSAx
MjozMyBQTSwgU2ltb24gSHVlbGNrIHdyb3RlOgo+PiBIaSwKPj4KPj4KPj4gaSByZWNvZ25pemUg
dGhlIGZvbGxvd2luIG9uIG15IGV0aGVybmV0IHN0YXRzOgo+Pgo+PiDCoMKgwqDCoCB0aHJlc2hv
bGQ6IDEKPj4gwqDCoMKgwqAgdHhfcGt0X246IDE0NTczMjUKPj4gwqDCoMKgwqAgcnhfcGt0X246
IDUwMjI0MDUKPj4gwqDCoMKgwqAgbm9ybWFsX2lycV9uOiA2NzE3MzgKPj4gwqDCoMKgwqAgcnhf
bm9ybWFsX2lycV9uOiA2MDY1NzMKPj4gwqDCoMKgwqAgbmFwaV9wb2xsOiA3ODQ0MzkKPj4gwqDC
oMKgwqAgdHhfbm9ybWFsX2lycV9uOiA2MTA2MQo+PiDCoMKgwqDCoCB0eF9jbGVhbjogNzg0NDM5
Cj4+IMKgwqDCoMKgIHR4X3NldF9pY19iaXQ6IDU4MjkzCj4+IMKgwqDCoMKgIGlycV9yZWNlaXZl
X3BtdF9pcnFfbjogMAo+PiDCoMKgwqDCoCBtbWNfdHhfaXJxX246IDAKPj4gwqDCoMKgwqAgbW1j
X3J4X2lycV9uOiAwCj4+IMKgwqDCoMKgIG1tY19yeF9jc3VtX29mZmxvYWRfaXJxX246IDAKPj4g
LT4gwqAgwqDCoCBpcnFfdHhfcGF0aF9pbl9scGlfbW9kZV9uOiAzODIwMzcKPj4gLT7CoCDCoMKg
wqAgaXJxX3R4X3BhdGhfZXhpdF9scGlfbW9kZV9uOiAzODIwMjEKPj4KPj4KPj4gSXMgdGhpcyBu
b3JtYWwgPwo+IAo+IERpZCB5b3UgdHJ5IGRpc2FibGluZyBFRUUgPyAoImV0aHRvb2wgLS1zZXQt
ZWVlIGV0aDAgZWVlIG9mZiIpCgpCVFcsIGRvIG5vdCB0cnkgdG8gcmUtZW5hYmxlIGl0LiBUaGVy
ZSBpcyBhIHJhY2UgaW4gdGhlIGVuYWJsZQpmdW5jdGlvbi4gSSB3aWxsIHNlbmQgYSBmaXggQVNB
UC4KCj4gCj4gVGhhbmtzLAo+IEpvc2UgTWlndWVsIEFicmV1Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
