Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5EAC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 12:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6A321773
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 12:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtkFt/et";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M7j7vZua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C6A321773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvvWWTXPAfygiCfdlvhRWZClCDJhTTq04UE699BeKrg=; b=UtkFt/etjLtprS
	keJsNWOMKh30CiVXnRvVOSDcM4mq9lGUGPXNOp20tNvqP0S36AXbsMlWQwftIJeOKgkUce2/qpxJx
	zoK6nVfG4lSI3+TfMabXFBl4M1zr0EXzOgkezSEA7Neax2M9OuVdNc6LLEUL84vTe2COEPZIYYgu9
	T72xpbnBYks5C2Jlki0BWKJRup6GH5P6rLZkJv+LW3C5YtzujDI4lr1aq6hkvRaxgk8UKnpIwyadV
	fyeJz9MczHQuxYc4EaKr6CpH/LC6WYW4suZX4IrgmUHtCrqvuIWt6mjT+vY1EeaIEHWbafzchhLQA
	s+93wRl/2xeMFf1YY4VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gviFC-0004cE-Q2; Mon, 18 Feb 2019 12:41:58 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gviFA-0004bk-Br
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 12:41:57 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 2ECFB10C1725;
 Mon, 18 Feb 2019 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550493714; bh=3zxWz7lTcHVbada5nD2nq+VsFAO2gK3zcJLygW0iDIA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=M7j7vZuasqwUz6+Y6pRw0TGEC5c9b0P9/eGrRn2iChSyLd4RcNg9F4LRWO5WQNOtL
 yWGMlaPq0/cDibBBBoaOfE7AbYkhyG+YzgyDNh/kqRO+e9q/mO9NPof27KYsMkM3Mc
 H64Sp2oJRH5HJ8IelK+pvjTCNGrxSfl1eYV6Mpf73n6VVHWllYYrGlnw6BcFO4rZC+
 UlynDHIPFoC6XsJYkaCnU0eqBDace3pAyAtajC9ZgOaoHBe0JAMhfnJQzoT0hHqLaW
 PqlpGMuSwYc2VNx+ndA280Z8ewNp+Gmr3/T9hBA8sLidcF+0QZ9+2+QH/wa8OZXxb7
 z9vQjKJ2K38Lw==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D2D4BA0090;
 Mon, 18 Feb 2019 12:41:53 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 04:41:53 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 13:41:51 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 13:41:51 +0100
Subject: Re: stmmac / meson8b-dwmac
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
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
Date: Mon, 18 Feb 2019 12:41:50 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_044156_411238_553BF20A 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

T24gMi8xOC8yMDE5IDEyOjMzIFBNLCBTaW1vbiBIdWVsY2sgd3JvdGU6Cj4gSGksCj4gCj4gCj4g
aSByZWNvZ25pemUgdGhlIGZvbGxvd2luIG9uIG15IGV0aGVybmV0IHN0YXRzOgo+IAo+IMKgwqDC
oMKgIHRocmVzaG9sZDogMQo+IMKgwqDCoMKgIHR4X3BrdF9uOiAxNDU3MzI1Cj4gwqDCoMKgwqAg
cnhfcGt0X246IDUwMjI0MDUKPiDCoMKgwqDCoCBub3JtYWxfaXJxX246IDY3MTczOAo+IMKgwqDC
oMKgIHJ4X25vcm1hbF9pcnFfbjogNjA2NTczCj4gwqDCoMKgwqAgbmFwaV9wb2xsOiA3ODQ0MzkK
PiDCoMKgwqDCoCB0eF9ub3JtYWxfaXJxX246IDYxMDYxCj4gwqDCoMKgwqAgdHhfY2xlYW46IDc4
NDQzOQo+IMKgwqDCoMKgIHR4X3NldF9pY19iaXQ6IDU4MjkzCj4gwqDCoMKgwqAgaXJxX3JlY2Vp
dmVfcG10X2lycV9uOiAwCj4gwqDCoMKgwqAgbW1jX3R4X2lycV9uOiAwCj4gwqDCoMKgwqAgbW1j
X3J4X2lycV9uOiAwCj4gwqDCoMKgwqAgbW1jX3J4X2NzdW1fb2ZmbG9hZF9pcnFfbjogMAo+IC0+
IMKgIMKgwqAgaXJxX3R4X3BhdGhfaW5fbHBpX21vZGVfbjogMzgyMDM3Cj4gLT7CoCDCoMKgwqAg
aXJxX3R4X3BhdGhfZXhpdF9scGlfbW9kZV9uOiAzODIwMjEKPiAKPiAKPiBJcyB0aGlzIG5vcm1h
bCA/CgpEaWQgeW91IHRyeSBkaXNhYmxpbmcgRUVFID8gKCJldGh0b29sIC0tc2V0LWVlZSBldGgw
IGVlZSBvZmYiKQoKVGhhbmtzLApKb3NlIE1pZ3VlbCBBYnJldQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
