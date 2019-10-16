Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708FCFA372A
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 11:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EA22067B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 11:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRJ3+2MZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EA22067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz5FWu55Ny8ip3ZGAt2lguHCSRfArpl2Ys0IcVhO7MI=; b=HRJ3+2MZwmXYRB
	oToVyoh4XXtUu4nFWNZm4oHjwFnhdu6vi3082odeD0u7nMi7c2a5eRoKSTtlwUQy9RxU8QN+YJgVx
	SQbuu9hQtcOrqKabQGvv1NuvzD7MUWcfCu06SuSDzrFRyysVIdG+lAXHKO6pii0DViNrbKC/qs/HN
	TOUofnjfvW7k4ED3a+0mU8x834eOuc78lKIdmB9gmdWqw7TBd9A7JD2+lSwDqgHoL8YDPW6wHpxkZ
	UMnmgUo6lGf1Qb3/BH5lxnrRfbXzYktCQV+nJ7j2kRGnGKfiMGja99si8TWesSuDA/5butWq+g+vW
	tUDa6oUVqjsSrFYcRzsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKhSL-0005nO-4s; Wed, 16 Oct 2019 11:27:05 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKhS9-0005eL-VP; Wed, 16 Oct 2019 11:26:55 +0000
Received: from [10.18.29.227] (10.18.29.227) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 16 Oct
 2019 19:26:50 +0800
Subject: Re: [PATCH RESEND v2 1/4] dt-bindings: power: add Amlogic secure
 power domains bindings
To: Rob Herring <robh@kernel.org>
References: <1570695678-42623-1-git-send-email-jianxin.pan@amlogic.com>
 <1570695678-42623-2-git-send-email-jianxin.pan@amlogic.com>
 <20191014173900.GA6886@bogus>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <622c7785-8254-5473-6b35-7287830f3c60@amlogic.com>
Date: Wed, 16 Oct 2019 19:26:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014173900.GA6886@bogus>
Content-Language: en-US
X-Originating-IP: [10.18.29.227]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_042654_011132_B5E71651 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKT24gMjAxOS8xMC8xNSAxOjM5LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUaHUs
IE9jdCAxMCwgMjAxOSBhdCAwNDoyMToxNUFNIC0wNDAwLCBKaWFueGluIFBhbiB3cm90ZToKPj4g
QWRkIHRoZSBiaW5kaW5ncyBmb3IgdGhlIEFtbG9naWMgU2VjdXJlIHBvd2VyIGRvbWFpbnMsIGNv
bnRyb2xsaW5nIHRoZQo+PiBzZWN1cmUgcG93ZXIgZG9tYWlucy4KPj4KPj4gVGhlIGJpbmRpbmdz
IHRhcmdldHMgdGhlIEFtbG9naWMgQTEgYW5kIEMxIGNvbXBhdGlibGUgU29DcywgaW4gd2hpY2gg
dGhlCj4+IHBvd2VyIGRvbWFpbiByZWdpc3RlcnMgYXJlIGluIHNlY3VyZSB3b3JsZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmlhbnhpbiBQYW4gPGppYW54aW4ucGFuQGFtbG9naWMuY29tPgo+PiAt
LS0KPj4gIC4uLi9iaW5kaW5ncy9wb3dlci9hbWxvZ2ljLG1lc29uLXNlYy1wd3JjLnlhbWwgICAg
IHwgNDIgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dl
ci9tZXNvbi1hMS1wb3dlci5oICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKwo+PiAgMiBm
aWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL2FtbG9naWMsbWVzb24tc2VjLXB3
cmMueWFtbAo+PiArCj4+ICsgIHNlY3VyZS1tb25pdG9yOgo+PiArICAgIGRlc2NyaXB0aW9uOiBw
aGFuZGxlIHRvIHRoZSBzZWN1cmUtbW9uaXRvciBub2RlCj4+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+IAo+IFdoeSBub3QganVzdCBhIGNoaWxk
IG5vZGUgb2YgdGhpcyBub2RlPwo+IApUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJIGZvbGxvd2Vk
IHRoZSBzdHlsZSBvZiB0aGUgcHJldmlvdXMgc2VyaWVzIG9mIG1lc29u77yaCgogIDQ2ICAgICAg
ICAgZWZ1c2U6IGVmdXNlIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogIDQ3ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFt
bG9naWMsbWVzb24tZ3hiYi1lZnVzZSI7ICAgICAgICAgICAgICAgICAgICAgICAgIAogIDQ4ICAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2MgQ0xLSURfRUZVU0U+OyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogIDQ5ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogIDUw
ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogIDUxICAgICAgICAgICAgICAgICByZWFkLW9ubHk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
IDUyICAgICAgICAgICAgICAgICBzZWN1cmUtbW9uaXRvciA9IDwmc20+OyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogIDUzICAgICAgICAgfTsKCj4gUm9iCj4gCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
