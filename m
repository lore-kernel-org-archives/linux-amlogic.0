Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2129C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 16:29:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59F12080D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 16:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbcEyD9G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odevfLHS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59F12080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y84Wv2QgsAq+aXfxbROF3pgr8kON/A9x/t8k60mN1i4=; b=jbcEyD9G/+YIHK
	ht/Nf5EUtQHFj85sNrSOMr6LiwHS5khMJuSif6PVu0q1LcmyDz/qg2tG2uM/l+sRxQT7d+/lre136
	KJEgEpLjW0flbz4NrBYkMrpBGU/upjVh3kpB0Tmd9sDrhT1AQ6cWKVBgVr8j8KvqxGPsbjTZg2xMh
	axvZtKz/iAkX15gAew5/HvBdPOcmFLpJzajbgAWu1WAXopr1+onsWAbZOf4L/O49eqeeO2paH9Pid
	GvDdhOUy7XXDz3HKkjAAFUXpHJHidZmPdf69MOMOfPFrRBXkfbYE50AbNU5/c0wZm1DCFPqizFnwF
	D2DxbFKiQ2pdu6BR+mGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlxPL-0005hn-KI; Thu, 18 Jun 2020 16:28:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlxPI-0005gb-VD
 for linux-amlogic@lists.infradead.org; Thu, 18 Jun 2020 16:28:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id p5so6692124wrw.9
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2020 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5BtInqn0HK3LhGSOqpzcc+VvzjO2vK+SIfcb8Zyst/s=;
 b=odevfLHS7udDSNGRylCeO2GK+VEz1OY9+pY2RckNxWlzBCRG2hlFpNf6+gr8PKu4Iv
 tj1G1Vcxfz9LG+ygke6gIxql+cjGYpQ1mY6VdpdPlChpWDonM3PefuwcFBoJfWjZV/o+
 CR6xRglkdlXJoE51Sz7C2YMHN+mc9IwFc7P9kBuZck3wBty1M5Su/3/dhyDCecbVI5aH
 leQZVIOvdX1cwxW42QZRnwUFG7hLl7P7CljP2Km/bqlU2XWuvtEPLbskejDHm//uKQlz
 2IYDidYF2v8ay1rj1c0D9+gwTeVaMxh7naQQ8/I3zIQApSSo49rOYomcAMVweMTcXx1j
 U0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5BtInqn0HK3LhGSOqpzcc+VvzjO2vK+SIfcb8Zyst/s=;
 b=FX6vl3KuFng8/0llRxuJlLwUja6phYNQS1bH2Hk7VnhT81nQHAGbfNlnxNTn2VBylc
 65XZlmh0pv3CkugXba/899rZ9W2bNliIhyI0Si1rFXdO0UjObf1CvxEh66PiiJHbgn7C
 ZO3dbMc22BRHR+Kr8FwY4W8Iqb21hJaUohi7f6MAcR/CT+xL1ODAwtueLu0HRYo7AJHj
 z2WSSJivQPiFjR8hGbuOaSsJtSLbIuzRt0oM1zqkAi9Dk0FgqD2oy0svPv284Piihgru
 O/d3744F15lmJPqGdGiUveA7PiuGGWWXlEnKGOsA3og/ege4jYtY2nzgEivmuHxsJGh1
 p7LQ==
X-Gm-Message-State: AOAM532OClPGZdTxgpuohJFVWYDp16Px/6hGo/PqeJJCMp8LwDGVR9X9
 87lS+3xLI7HWMnNH3lNBzZ6nu3OkSfc=
X-Google-Smtp-Source: ABdhPJz6qa2JKgQLkPKOqwNTFZMVh3JmnZ6aw7y5et5eRtOtT3vbCB5EdZXzl9SVv6nhMcSGytpKjQ==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr5505499wrn.269.1592497731532; 
 Thu, 18 Jun 2020 09:28:51 -0700 (PDT)
Received: from dell ([95.149.164.118])
 by smtp.gmail.com with ESMTPSA id z7sm3185948wmb.42.2020.06.18.09.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 09:28:50 -0700 (PDT)
Date: Thu, 18 Jun 2020 17:28:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 1/2] thermal: add support for the MCU controlled FAN
 on Khadas boards
Message-ID: <20200618162849.GH954398@dell>
References: <20200618133818.15857-1-narmstrong@baylibre.com>
 <20200618133818.15857-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618133818.15857-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_092853_036269_F8CF11CF 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Amit Kucheria <amit.kucheria@linaro.org>, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxOCBKdW4gMjAyMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cgo+IFRoZSBuZXcgS2hh
ZGFzIFZJTTIgYW5kIFZJTTMgYm9hcmRzIGNvbnRyb2xzIHRoZSBjb29saW5nIGZhbiB2aWEgdGhl
Cj4gb24tYm9hcmQgbWljcm9jb250cm9sbGVyLgo+IAo+IFRoaXMgaW1wbGVtZW50cyB0aGUgRkFO
IGNvbnRyb2wgYXMgdGhlcm1hbCBkZXZpY2VzIGFuZCBhcyBjZWxsIG9mIHRoZSBLaGFkYXMKPiBN
Q1UgTUZEIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFtaXQgS3VjaGVyaWEgPGFtaXQua3Vj
aGVyaWFAbGluYXJvLm9yZz4KCklzIHRoaXMgYW4gQWNrPwoKSWYgc28sIGRvIHlvdSByZXF1aXJl
IGEgcHVsbC1yZXF1ZXN0PwoKPiAtLS0KPiBIaSBMZWUsCj4gCj4gQ291bGQgeW91IGFwcGx5IHRo
aXMgcGF0Y2ggdmlhIHRoZSBNRkQgdHJlZSBzaW5jZSBpdCBkZXBlbmRzIG9uCj4gdGhlIGxpbnV4
L21mZC9raGFkYXMtbWN1LmggaGVhZGVyID8KPiAKPiBUaGlzIHBhdGNoIGlzIHVuY2hhbmdlZCBm
cm9tIHRoZSB2MyBzZXJpZS4KPiAKPiBUaGFua3MsCj4gTmVpbAo+IAo+ICBkcml2ZXJzL3RoZXJt
YWwvS2NvbmZpZyAgICAgICAgICB8ICAxMSArKwo+ICBkcml2ZXJzL3RoZXJtYWwvTWFrZWZpbGUg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvdGhlcm1hbC9raGFkYXNfbWN1X2Zhbi5jIHwgMTc0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxODYg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy90aGVybWFsL2toYWRh
c19tY3VfZmFuLmMKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBM
ZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
