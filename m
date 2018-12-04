Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB36C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B1A3206B7
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gO17fkgp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hKoN2aik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B1A3206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kg1KukQlyJPMSIBXPQsQyj5y4kIG9PCMYSLDrCQNWcA=; b=gO17fkgpC8xugK
	W0YwlxF/R0VNzjaOIKp7uWR9Yt32VUzWOgHn2SYDEHf3Eol8FLsaWyQ57L5tK7oE4xvdQC0Q3XmNo
	6OE7BttZq7lcFJZeQlFg4/+Ubz7d1VxT/kVmAz5+0C/a1qtWaq1YrV2Xuza7KvzOy8EYjOAY1wBYN
	BwYXPVJj5768XfMIyMdTezOMm6NgqvWaPcieAJaeQV0OS8rlLV5MqAjtMu8xK8pX5spgpS/cEpKWY
	TGduOWpWlf4cxUfPKdiU5RU/KtO7pW+oJdpaZMjUwpU8LobVWluLyHalQcHnyp6cqWuvWdpVbkayc
	ztGej1HMT0W5HeWV0atA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUGwZ-0003J4-CB; Tue, 04 Dec 2018 20:05:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUGwW-0002aJ-Bb
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 20:05:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id t27so17294637wra.6
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 12:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7WH9JoQsx+LrhFCXwbF/NWnFA3rwkd4OelYwW8l6xp0=;
 b=hKoN2aikVpRjyNb8oSh9ixndigMRZl11ufnqkBhIKtXGsPtQSh0U3b0wrni/fAD7tv
 VRrxL8Y+eudzYumkgwcrihWXC6ucmsHEiK76WZB6k6i59cu3JXMKFvnttOgC40fKbszZ
 lmIz+pHtX+cH9+4tHqU6a4+vDz1CgpCQcWKq/0uGqYTw8mvwMwPeP/Pxf71aXOY1wPUD
 ODnPOinYQwUuL1CblksbONRkNXYbsJv6VM4j5RuYNhor7LQj+Hg7LT0sNIw2B1McDblm
 E/KU+O7P4zWj+39GbV/Sp5ba0WmljrN8Wvb342HOo/WQZSnbbJr/TNivFWPHu0OrQjAL
 bRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7WH9JoQsx+LrhFCXwbF/NWnFA3rwkd4OelYwW8l6xp0=;
 b=KTXqMjpc5Rqv+DtOVaeg/uvSbryXKkt5ce29CCEFPL96BV+4UUJ5lXzFYuzjZd/LVF
 V/3p9tOES8ROHLEiM6ICAXz4zChPfXFLM+Po4mJRwOW70kezS72eKyc8nj0mR8g5gXkX
 4snXvdEA4ybNnjL2GqtIfWO58U4jhDfqa2P8u1JMEDx3MMIOwgrM/9JcGrk/uFFsTd3l
 w39rq2u2VKmy9MVU/urAOu65bUHZ+VCqKUSUywB9M46gL59OUDO2831lTgp3esKV3Gof
 ZCEnqS6XQlRSo//06vgsPsJmQtL2XDvPYqdx8CvgUwK+pNPJ02vSZPrnvVaQMtlxw3Oi
 DvQg==
X-Gm-Message-State: AA+aEWbY1hGdfgahHhx+ENNAjs0tRWl8BvNA15hiPbIfd0nV7gvacZEh
 /RWs8CZwn/DKdzf8PDM44YjExA==
X-Google-Smtp-Source: AFSGD/WAu9R1GRTlJrL0Zb50WTZLNjbk8WFhs2XnaX/wrvCXD4dnHMBMkFJm2nZJOC0MlQf3y5LaBw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr18768268wrs.290.1543953904416; 
 Tue, 04 Dec 2018 12:05:04 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id c12sm12055655wrs.82.2018.12.04.12.05.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 12:05:03 -0800 (PST)
Message-ID: <2341ec89691f6221bab6a9696ed0c05c3d3de663.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Date: Tue, 04 Dec 2018 21:05:02 +0100
In-Reply-To: <5C06D686.50108@baylibre.com>
References: <20181204125839.14505-1-narmstrong@baylibre.com>
 <154394543049.88331.11854270462393390489@swboyd.mtv.corp.google.com>
 <5C06D686.50108@baylibre.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_120516_399532_C85BF31E 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDE4LTEyLTA0IGF0IDIwOjMzICswMTAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiBIaSBTdGVwaGVuLAo+IAo+IExlIDA0LzEyLzIwMTggMTg6NDMsIFN0ZXBoZW4gQm95ZCBhIMOp
Y3JpdCA6Cj4gPiBRdW90aW5nIE5laWwgQXJtc3Ryb25nICgyMDE4LTEyLTA0IDA0OjU4OjM5KQo+
ID4gPiBNYWtlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5ncyBzaWxlbnQ6Cj4gPiA+IGRy
aXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmM6NTg6MjY6IHdhcm5pbmc6IHN5bWJvbCAnX2dl
dF90YWJsZV92YWwnCj4gPiA+IHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
Cj4gPiA+IGRyaXZlcnMvY2xrL21lc29uL2d4YmIuYzoxNTg1OjEyOiB3YXJuaW5nOiBzeW1ib2wK
PiA+ID4gJ2d4YmJfdmlkX3BsbF9wYXJlbnRfbmFtZXMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4gPiA+IGRyaXZlcnMvY2xrL21lc29uL2d4YmIuYzoxNjIwOjEyOiB3
YXJuaW5nOiBzeW1ib2wKPiA+ID4gJ2d4YmJfdmNsa19wYXJlbnRfbmFtZXMnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gPiA+IGRyaXZlcnMvY2xrL21lc29uL2d4YmIu
YzoxOTgwOjEyOiB3YXJuaW5nOiBzeW1ib2wKPiA+ID4gJ2d4YmJfY3RzX3BhcmVudF9uYW1lcycg
d2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiA+ID4gZHJpdmVycy9jbGsv
bWVzb24vZ3hiYi5jOjIwMzY6MTI6IHdhcm5pbmc6IHN5bWJvbAo+ID4gPiAnZ3hiYl9jdHNfaGRt
aV90eF9wYXJlbnRfbmFtZXMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
Cj4gPiAKPiA+IEkgZml4ZWQgYWxsIG9mIHRoZXNlIGFscmVhZHkgaW4gdGhlIHBhdGNoIEkgc2Vu
dCB5b3UuCj4gCj4gU29ycnkgSSBtaXN1bmRlcnN0b29kLi4uCj4gCj4gCj4gPiA+IEBAIC0xOTgz
LDcgKzE5ODMsNyBAQCBzdGF0aWMgc3RydWN0IGNsa19maXhlZF9mYWN0b3IgZ3hiYl92Y2xrMl9k
aXYxMiA9Cj4gPiA+IHsKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyB1MzIgbXV4X3Rh
YmxlX2N0c19zZWxbXSA9IHsgMCwgMSwgMiwgMywgNCwgOCwgOSwgMTAsIDExLCAxMiB9Owo+ID4g
Cj4gPiBJIHdhcyB0YWxraW5nIGFib3V0IHRoaXMgbXV4X3RhYmxlX2N0c19zZWwgYXJyYXkuIENh
biB0aGlzIGJlIGNvbnN0Pwo+ID4gCj4gCj4gT3RoZXIgbXV4IHRhYmxlcyBhcmVuJ3QgY29uc3Qs
IEplcm9tZSBzbyB5b3Ugc2VlIGEgcmVhc29uIHdoeSB0aGV5IGFyZW4ndAo+IGNvbnN0ID8KCkkn
bSBzdXJwaXNlZCB3ZSBtaXNzZWQgdGhhdC4gVGhlIFBMTCBwYXJhbXMgdGFibGVzIG9mIGFtbG9n
aWMgYXJlIGFsbCAnc3RhdGljCmNvbnN0JyBidXQgYWxsIHRoZSBtdXggdGFibGVzIGFyZSBqdXN0
ICdzdGF0aWMnICwgaHVtbQoKWy4uLl0gNSBtaW4gbGF0ZXIgWy4uLl0KCkFjdHVhbGx5IHRoZSB0
YWJsZSBmaWVsZCBvZiBjbGtfbXV4IGlzIG5vdCBjb25zdCwgc28gZ2l2aW5nIGl0IGEgY29uc3Qg
dGFibGUKd291bGQgcHJvZHVjZSBhIHdhcm5pbmcgYWJvdXQgZGlzY2FyZGluZyBjb25zdCBxdWFs
aWZpZXIKCkkgZ3Vlc3MgdGhlcmUgc2hvdWxkIG5vIHByb2JsZW0gYWRkaW5nIGNvbnN0IHRvIHRo
ZSB0YWJsZSBmaWVsZCBvZiBzdHJ1Y3QKY2xrX211eC4gV2hhdCBkbyB5b3UgdGhpbmsgU3RlcGhl
biAgPwoKPiAKPiBOZWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
