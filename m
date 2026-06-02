Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3427CD6E57
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZSSZcgAUgrH6b1+p6vTcbNUzFUUaGuqyGfU9k4Ofz4=; b=IsfGKJldtYcatG
	N8ICyCXZ92PlpVZZMiTGCUgiVIek6LQJLTs1busYOmJIULFpfJs69gBmFJSfnlRC6J/BDwUi7oC3Y
	5cwuZYfdpoHfpAyApNNZHKhcnWCbW0x5vOczOLUlitv7Qh5lUuD2GMcSo1eDpAeENUN18OZjMRs9X
	4Q1heDQ2KmWQ7sj0t+zHm4zG3kp9HvAY6xZ+BDISUbJsVLPTcpzUWcCd52qh4p3bF3fBq8vm+0iq4
	Ijqu6fFtt+hh4j6HGXpO3aF8QCPmOL1xEe4DvdIS9iqQ/SFjFCJbfQQ1jjtZiSM6ObJxHR3yg/8W3
	q5xlieYg2robjUK7fc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURwR-0000000DRGS-0ofR;
	Tue, 02 Jun 2026 16:26:11 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURwN-0000000DREZ-2M64;
	Tue, 02 Jun 2026 16:26:10 +0000
Message-ID: <60aa3f88-e8de-4594-9c07-832aa6d97b23@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780417561;
	bh=3PpZSCOhrX5Fo3r9Inj3yvrlHVLpHLHBcy3c4inz8f8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Zt5cuLdllnhn6/RSFBvGVLVkHSYH0N/2m2xi0TnPS3BHc+i4DxP61s3qzdCh8m/k6
	 OhVN0kVWi9Z9f3m33lO2WNyhgDP/z4LgZQqCcaswTzwyIg1/YgvEQryErkU8gzolfT
	 0MkGNAR/9VNXcRMdVW60B/goXUDqg/EfYe8/3f74=
Date: Tue, 2 Jun 2026 18:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
 <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_092608_038390_E35E6B7E 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

T24gNi8yLzI2IDY6MDEgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiAtLS0KPj4gwqAgZHJp
dmVycy90aGVybWFsL0tjb25maWcgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvS2NvbmZpZyBiL2RyaXZl
cnMvdGhlcm1hbC9LY29uZmlnCj4+IGluZGV4IDFjNGE1Y2Q1YTIzZWUuLjgxMGVlY2NlZGZiYWIg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMv
dGhlcm1hbC9LY29uZmlnCj4+IEBAIC00MzYsNiArNDM2LDcgQEAgY29uZmlnIEFNTE9HSUNfVEhF
Uk1BTAo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJBbWxvZ2ljIFRoZXJtYWwgU3VwcG9ydCIKPj4g
wqDCoMKgwqDCoCBkZWZhdWx0IEFSQ0hfTUVTT04KPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIE9G
ICYmIEFSQ0hfTUVTT04KPj4gK8KgwqDCoCBkZXBlbmRzIG9uIE1FU09OX1NNCj4+IMKgwqDCoMKg
wqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBJZiB5b3Ugc2F5IHllcyBoZXJlIHlvdSBnZXQgc3Vw
cG9ydCBmb3IgQW1sb2dpYyBUaGVybWFsCj4+IMKgwqDCoMKgwqDCoMKgIGZvciBHMTIgU29DIEZh
bWlseS4KPiAKPiBEaWQgeW91IGZvcmdldCB0byByZW1vdmUgdGhlIHN0dWJzID8KClRoZSBjb21t
aXQgZm9yIHRoZSBzdHViIGFzIGFscmVhZHkgYmVlbiByZW1vdmVkIGZyb20gdGhlCnRoZXJtYWwv
YmxlZWRpbmctZWRnZSBicmFuY2gsIHNvIEkgdGhpbmsgdGhlcmUgaXMgbm90aGluZyB0byByZW1v
dmUKYW55bW9yZSwgYW5kIEkgZHJvcHBlZCBpdCBvbiBteSBzaWRlIHRvby4KCi0tIApCZXN0IHJl
Z2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
