Return-Path: <SRS0=UeA4=NZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200DBC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 13:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8DF601FF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 13:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA8DF601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr0yXzCP2Iyq6l2A7r1DEwXTT0tWjqBcQ0qqmhrTCPk=; b=rkDDEKbMsbR3GbVa1nS1yBXuFg
	rO9qzudDoa1DooSHGhbjC0AZ9Rn+qrp/xya49DVjywe2oRKux0AurKgO15nmcRQZYV2uHEO4yYvKa
	HA9kO5YrxBKanRs1uJ3iAWsQ84JHhSzwiFzztD736ehjrOMyuusrC+wW8xq0xFWtr7ONYdexZo/Yg
	Sl1I5pz6zjrDuG0k/EVXLVuRJScFuiaFpVSfBEjbsSkO2/5jHvFBwqfwGa5f62tMXYb52ETcz0O1j
	jvFAFgdF7fksVE2BZsQNcvR/DHJrK34n68mShEE/h21690hwW7kJzwvgeTQDQilfcOcAYs7w50EfG
	j+4WX1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM8qi-00BzFO-6p; Fri, 03 Sep 2021 13:03:16 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM8qf-00BzEg-52; Fri, 03 Sep 2021 13:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76496D63A0; Fri,  3 Sep 2021 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630674189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=jjdwfMRF6YgtWfcByL2SGSEFNbz6ru6bgtzK2GxYCIg=; 
 b=kyc/gQo6fgKrgoF8Q18pwA8Xboh7m1YmRB/izNYkuZg9tyd1m8v4CLvvGlSUgIqjL+wpTn
 kCcg7RNZR88JrNjDy8+CTQox9SQJXkpk+0R3/eAinIlimnn5PzU+WUfoTb0mWmTV67hzc5
 ffLj/Al9/soM8JgArWdtVY1crJFTNat0+irJ+LitRMwjV920Hf6uo8+YCxnUM1zZcKdzVX
 biO3YmeY+hLwZEJMWUIvUNjS6wpAaqIErVQZJSUVGo9P0MRFbIaaW1V9GF3wKq0YUiiyH2
 55MLEbn1hmf2b4zRLb3Xcn10dcAC0RrC0eyiFRChytf50Mbj7PAE7bWhqjyCjg==
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-gxl: add support for JetHub H1
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210903060035.844758-1-adeep@lexina.in>
 <20210903060035.844758-3-adeep@lexina.in>
 <1jfsulua2e.fsf@starbuckisacylon.baylibre.com>
From: Vyacheslav Bocharov <adeep@lexina.in>
Message-ID: <23e82fb2-5e28-8c5d-4655-b337af0cf5f0@lexina.in>
Date: Fri, 3 Sep 2021 16:03:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1jfsulua2e.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_060313_565015_E8DDD786 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MDMuMDkuMjAyMSAxNToxMCwgSmVyb21lIEJydW5ldCDQv9C40YjQtdGCOgo+ICsmZWZ1c2Ugewo+
ICsJc246IHNuQDE0IHsKPiArCQlyZWcgPSA8MHgxNCAweDEwPjsKPiArCX07Cj4gYWxyZWFkeSBk
ZWZpbmVkIGluIG1lc29uLWd4LmR0c2kKPgo+IGFsc28sIHdoYXQgYWJvdXQgYSBuZXcgbGluZSBi
ZXR3ZWVuIHRoZSBub2RlcyA/Cj4+ICsJc2VyaWFsOiBzZXJpYWxAMzIgewo+PiArCQlyZWcgPSA8
MHgzMiAweDIwPjsKPj4gKwl9Owo+IElzbid0IHNlcmlhbCBhbmQgc24gdGhlIHNhbWUgdGhpbmcg
PwpZZXMsIG15IGZhdWx0LiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
