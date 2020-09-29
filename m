Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFF1C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 18:02:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D4420936
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 18:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDZtbhd7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="W80lX/ss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D4420936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Z1Z+bakCWsw0ALsaL7YdFp8u1ldgawlv/tYRa6fxlw=; b=VDZtbhd7MJhBNd5eH6yKfMZTZ
	FwiRCvarnnKx84RNnBfwi4Kfn3pnZr1Hca8NTjty9de1nQF5ro60zCg8LVwfOrdxoqne+NA+4W4LS
	B3WxVzdfEevzfkLc9BzW49dFOFgYs9R3WjWsK6JZOyerKtI9kyxYohrx0DMDM6bao8ByR64rh61Xs
	wV9iw0NxO12s1YQ6UFZ5nUStUdtdfPOsAHr0R74MfKTeSnAhq43dX5xgNtR50u8kfLGK5hj9K4G+0
	FdpGZgEAhI/9f0Z+Za8+53T07mhNNxb8W8H8betqPKnRRVIaPj0PI+EGNf7mI3WOt8eOttkkxYfFB
	GFRv1pqMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJxe-0000Vp-Tq; Tue, 29 Sep 2020 18:02:46 +0000
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJxZ-0000Tu-EA; Tue, 29 Sep 2020 18:02:42 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f73768a0000>; Tue, 29 Sep 2020 11:01:46 -0700
Received: from [10.26.75.44] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 18:02:19 +0000
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
To: Marc Zyngier <maz@kernel.org>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200929184851.22682ff1@xhacker.debian>
 <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
 <d4a6eea3c5e33a3a4056885419df95a7@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6ead62a5-6ad5-bde8-a5df-93c0f8029f65@nvidia.com>
Date: Tue, 29 Sep 2020 19:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d4a6eea3c5e33a3a4056885419df95a7@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601402506; bh=DFFoTBk7ct8iktjKeMDlsj2Utbk2NKyQWxL2aKVjTaM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=W80lX/ssDGSCkmOHGNX8qfEHRIGTVGbYctuQLU1uEcEjyE0fnkV9wz2g53gstJyUI
 E4spYYHmwagaxJa4TO8sL06dLbzRwQ2r0mAvKv53wUNqKGfxnV3JfaTodLW7VFp50E
 IzpjML0CTcNLrRF0t2KZ6sm6PRKfBBHHCK90MeJ/+oyhR43oJQMRzJKkRWKVKPfhQW
 DwViT05UxhiaQfRiAFkxUNBjLgzRTgqifdmv2KJ8qQd4RmhXR1HisAMmb9APrvJDe6
 fdCnmmZWbJ3ZUiuMA9/5d7ErTB3BYY+MpqowblPmh6cWgZXddyMV73hexYShiBEboJ
 plJvT038Egg7Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_140241_564909_00A84106 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>, linux-arm-kernel@axis.com,
 Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir
 Varbanov <svarbanov@mm-sol.com>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIDI5LzA5LzIwMjAgMTg6MjUsIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAyMDIwLTA5LTI5
IDE0OjIyLCBKb24gSHVudGVyIHdyb3RlOgo+PiBIaSBKaXNoZW5nLAo+Pgo+PiBPbiAyOS8wOS8y
MDIwIDExOjQ4LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+Pj4gSGkgSm9uLAo+Pj4KPj4+IE9uIEZy
aSwgMjUgU2VwIDIwMjAgMDk6NTM6NDUgKzAxMDAgSm9uIEh1bnRlciB3cm90ZToKPj4+Cj4+Pj4K
Pj4+PiBPbiAyNC8wOS8yMDIwIDEyOjA1LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+Pj4+PiBJbXBy
b3ZlIHRoZSBtc2kgY29kZToKPj4+Pj4gMS4gQWRkIHByb3BlciBlcnJvciBoYW5kbGluZy4KPj4+
Pj4gMi4gTW92ZSBkd19wY2llX21zaV9pbml0KCkgZnJvbSBlYWNoIHVzZXJzIHRvIGRlc2lnbndh
cmUgaG9zdCB0byBzb2x2ZQo+Pj4+PiBtc2kgcGFnZSBsZWFrYWdlIGluIHJlc3VtZSBwYXRoLgo+
Pj4+Cj4+Pj4gQXBvbG9naWVzIGlmIHRoaXMgaXMgc2xpZ2h0bHkgb2ZmIHRvcGljLCBidXQgSSBo
YXZlIGJlZW4gbWVhbmluZyB0byBhc2sKPj4+PiBhYm91dCBNU0lzIGFuZCBQQ0kuIE9uIFRlZ3Jh
MTk0IHdoaWNoIHVzZXMgdGhlIERXQyBQQ0kgZHJpdmVyLAo+Pj4+IHdoZW5ldmVyIHdlCj4+Pj4g
aG90cGx1ZyBDUFVzIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmdzIC4uLgo+Pj4+Cj4+Pj4g
wqBbwqDCoMKgwqDCoCA3OS4wNjgzNTFdIFdBUk5JTkcgS0VSTiBJUlE3MDogc2V0IGFmZmluaXR5
IGZhaWxlZCgtMjIpLgo+Pj4+IMKgW8KgwqDCoMKgwqAgNzkuMDY4MzYyXSBXQVJOSU5HIEtFUk4g
SVJRNzE6IHNldCBhZmZpbml0eSBmYWlsZWQoLTIyKS4KPj4+Pgo+Pj4KPj4+IEkgdHJpZWQgdG8g
cmVwcm9kdWNlIHRoaXMgaXNzdWUgb24gU3luYXB0aWNzIFNvQywgYnV0IGNhbid0IHJlcHJvZHVj
ZQo+Pj4gaXQuCj4+PiBQZXIgbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgY29kZSBpbiBrZXJuZWwv
aXJxL2NwdWhvdHBsdWcuYywgdGhpcwo+Pj4gd2FybmluZwo+Pj4gaGFwcGVuZWQgd2hlbiB3ZSBt
aWdyYXRlIGlycXMgYXdheSBmcm9tIHRoZSBvZmZsaW5lIGNwdSwgdGhpcyBpbXBsaWNpdGx5Cj4+
PiBpbXBsaWVzIHRoYXQgYmVmb3JlIHRoaXMgcG9pbnQgdGhlIGlycSBoYXMgYmluZCB0byB0aGUg
b2ZmbGluZSBjcHUsCj4+PiBidXQgaG93Cj4+PiBjb3VsZCB0aGlzIGhhcHBlbiBnaXZlbiBjdXJy
ZW50IGR3X3BjaV9tc2lfc2V0X2FmZmluaXR5KCkgaW1wbGVtZW50YXRpb24KPj4+IGFsd2F5cyBy
ZXR1cm4gLUVJTlZBTAo+Pgo+PiBCeSBkZWZhdWx0IHRoZSBzbXBfYWZmaW5pdHkgc2hvdWxkIGJl
IHNldCBzbyB0aGF0IGFsbCBDUFVzIGNhbiBiZQo+PiBpbnRlcnJ1cHRlZCAuLi4KPj4KPj4gJCBj
YXQgL3Byb2MvaXJxLzcwL3NtcF9hZmZpbml0eQo+PiAweGZmCj4+Cj4+IEluIG15IGNhc2UgdGhl
cmUgYXJlIDggQ1BVcyBhbmQgc28gMHhmZiBpbXBsaWVzIHRoYXQgdGhlIGludGVycnVwdCBjYW4K
Pj4gYmUgdHJpZ2dlcmVkIG9uIGFueSBvZiB0aGUgOCBDUFVzLgo+Pgo+PiBEbyB5b3Ugc2VlIHRo
ZSBzZXRfYWZmaW5pdHkgY2FsbGJhY2sgYmVpbmcgY2FsbGVkIGZvciB0aGUgRFdDIGlycWNoaXAg
aW4KPj4gbWlncmF0ZV9vbmVfaXJxKCk/Cj4gCj4gVGhlIHByb2JsZW0gaXMgY29tbW9uIHRvIGFs
bCBNU0kgaW1wbGVtZW50YXRpb25zIHRoYXQgZW5kIHVwIG11eGluZwo+IGFsbCB0aGUgZW5kLXBv
aW50IE1TSXMgaW50byBhIHNpbmdsZSBpbnRlcnJ1cHQuIFdpdGggdGhlc2Ugc3lzdGVtcywKPiB5
b3UgY2Fubm90IHNldCB0aGUgYWZmaW5pdHkgb2YgaW5kaXZpZHVhbCBNU0lzICh0aGV5IGRvbid0
IHRhcmdldCBhCj4gQ1BVLCB0aGV5IHRhcmdldCBhbm90aGVyIGludGVycnVwdC4uLiBicmFpbmRl
YWQpLiBPbmx5IHRoZSBtdXgKPiBpbnRlcnJ1cHQgY2FuIGhhdmUgaXRzIGFmZmluaXR5IGNoYW5n
ZWQuCj4gCj4gU28gcmV0dXJuaW5nIC1FSU5WQUwgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLgoK
UmlnaHQsIHNvIGlmIHRoYXQgaXMgdGhlIGNhc2UsIHRoZW4gc3VyZWx5IHRoZXJlIHNob3VsZCBi
ZSBzb21lIHdheSB0bwphdm9pZCB0aGVzZSB3YXJuaW5ncyBiZWNhdXNlIHRoZXkgYXJlIG5vdCBy
ZWxldmFudD8KCkNoZWVycwpKb24KCi0tIApudnB1YmxpYwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
