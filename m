Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD933C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 02:37:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3E520775
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 02:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wt9ZsU6V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3E520775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BW5pVlRVmhv5GNhCcELfj+RVskI2+opH6gV8JXNsz9w=; b=Wt9ZsU6VblTQ+KTzsnW7flyY+
	EnIryY+zP2H8lN2l1AoXqVyQGkzVidECuIQJ+5g7n5kqBsCqluuwEBR8YBWHAfhIEp1N9Ay+ASgkA
	GIE1rPwRzKA2xaoFCAnold7d46v7PWf8zDxG+gCbb33dXUMNU8Bw1mVhao+q2Ob1tYS3opXTaWVoS
	Fm2NnMgV2qYAVCkNkLsTeE1fprmSKP/5dGZYg32HdLhg0U0NujAnR+b41Ff5EYHog7+jt5SfNoyw6
	kJth/j6DeAj7K2v4ROlpR5OhM8VuzhTbc9uuV43Bvem3wp6k6x5uX2C9A+4H4vaDmNV1BKP6jheO3
	1oURB7sWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvtll-0004mp-SI; Thu, 16 Jul 2020 02:37:09 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvtli-0004m6-Qb
 for linux-amlogic@lists.infradead.org; Thu, 16 Jul 2020 02:37:07 +0000
IronPort-SDR: HmdVv+AkXtfMiZq69hfraYASoU0ehos8/SCiLuECQbWZAtHdzj3cX7G4jDdkqC0lMM6VVTN8ZK
 ifFOcSgCbXFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="167440950"
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; d="scan'208";a="167440950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 19:37:03 -0700
IronPort-SDR: GPJLFHXPvw2e3fPNdJVq7fXYCXOfxsdLPybMgigU7nLyBHK52NjrFOeda9VgLU3/D0Dn83RzXC
 yqQ+SCLcZ+Hw==
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; d="scan'208";a="325005002"
Received: from sjeong-mobl.amr.corp.intel.com (HELO [10.255.231.101])
 ([10.255.231.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 19:37:03 -0700
Subject: Re: S905x: No sound with error log.
To: =?UTF-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>
References: <MWHPR1601MB13434435DE38471CEB6675CECD7E0@MWHPR1601MB1343.namprd16.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5ebc4187-54c0-ce72-c7b0-2c88b0e24059@linux.intel.com>
Date: Wed, 15 Jul 2020 21:37:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MWHPR1601MB13434435DE38471CEB6675CECD7E0@MWHPR1601MB1343.namprd16.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_223707_009578_121C8026 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzE1LzIwIDU6MDQgUE0sINXFIMT+IHdyb3RlOgo+IEhpLAo+IAo+IFJlY2VudCBhc29j
IGNoYW5nZSBtYWtlcyBTOTA1eCBhdWRpbyBjYXJkIHByb2IgZmFpbGVkLgo+IAo+IFsgICAgNi4z
Mzg0MjhdIGd4LXNvdW5kLWNhcmQgc291bmQ6IENQVSBEQUkgSTJTIEVuY29kZXIgZm9yIHJ0ZCBi
ZS5kYWktbGluay0xIGRvZXMgbm90IHN1cHBvcnQgY2FwdHVyZQo+IFsgICAgNi4zNDIxNzZdIGd4
LXNvdW5kLWNhcmQgc291bmQ6IEFTb0M6IGNhbid0IGNyZWF0ZSBwY20gYmUuZGFpLWxpbmstMSA6
LTIyCj4gCj4gR29vZDogNS43LjMKPiBCYWQ6IDUuNy42Cj4gCj4gQWZ0ZXIgcmVhZCBwYXRjaGVz
LCBJIGZpbmQgc3VzcGVjdDoKPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9zb3VuZC9zb2M/aD12NS43Ljgm
aWQ9MWJiNzA3ZmJmZDVjMjQ2MDI4ZDc2YjhmMTFhMTlkZmQxMThkNjMwNgo+IAo+IHRoaXMgcGF0
Y2ggZG9lc26hr3QgYWxsb3cgcGxheWJhY2sgb25seSBvciBjYXB0dXJlIG9ubHkgZGFpLWxpbmsu
IFdoeT8KCml0IGRvZXMsIGJ1dCB5b3UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGNhcGFiaWxpdGll
cyBvZiBhIGRhaSBtYXRjaCB0aGUgCmNhcGFiaWxpdHkgb2YgYSBkYWlsaW5rIHRoZXkgYXJlIHBh
cnQgb2YuIFRoZSBiZS1kYWktbGluazEgY2FuIHN1cHBvcnQgCmNhcHR1cmUgYnV0IHRoZSBJMlMg
ZW5jb2RlciBzbyBkb2Vzbid0IHlvdSBoYXZlIGFuIGludmFsaWQgY29uZmlndXJhdGlvbi4KCkNv
dWxkIHRoaXMgYmUgdGhlIHByb2JsZW0gYmUgd2l0aCB0aGlzIGNvZGU6CgppbnQgbWVzb25fY2Fy
ZF9zZXRfYmVfbGluayhzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkLAoJCQkgICBzdHJ1Y3Qgc25k
X3NvY19kYWlfbGluayAqbGluaywKCQkJICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlKQp7Cglz
dHJ1Y3Qgc25kX3NvY19kYWlfbGlua19jb21wb25lbnQgKmNvZGVjOwoJc3RydWN0IGRldmljZV9u
b2RlICpucDsKCWludCByZXQsIG51bV9jb2RlY3M7CgoJbGluay0+bm9fcGNtID0gMTsKCWxpbmst
PmRwY21fcGxheWJhY2sgPSAxOwoJbGluay0+ZHBjbV9jYXB0dXJlID0gMTsKClNldHRpbmcgdGhl
IGZsYWdzIGJsaW5kbHkgaXMgbm90IHNvIGdvb2QuIEEgaGVscGVyIHdhcyBhZGRlZCByZWNlbnRs
eSwgCnNlZSAyNTYxMjQ3N2QyMGIgKCdBU29DOiBzb2MtZGFpOiBzZXQgZGFpX2xpbmsgZHBjbV8g
ZmxhZ3Mgd2l0aCBhIGhlbHBlcicpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
