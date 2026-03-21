Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087321094462
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Mar 2026 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK2e3usRrtRpRam6aY2lkOKh647uzx8I4c9nlPG/FK0=; b=m29Zd96QdUf4SB
	1gkC0+34ZUNOwqXhCSrB8xbseSvv7W5LkT2DWMJHi0Ct38EFCcMQX0Erj8hpfeyiApdGeDMSGwuGM
	UC/Rr9eLOtZIqh4dlxfKcnriWrq/LUeD9mK8neRKeHPIz6wyBaTIs9/tdaPbct4gg+8fbTmRlAOr1
	WHlnn1bkLBImetsRx4nG6X9LLEVwJwd3PGR5CaWDf46kfEyKreTmLd7z/loMkJfKN+PWZquyUx8cp
	mh1icj5M8ZGCcJaRf3pvmc6WoEENv+fZCePr+kRBCGrH8YhlPztltkFWT8MqcELDmcIyLt0nz5oj/
	eQwyUBcoXWRZV1XEKpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3smU-0000000EJPM-08lK;
	Sat, 21 Mar 2026 09:38:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3smR-0000000EJOH-2m7D
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Mar 2026 09:38:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-486fb14227cso26931055e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Mar 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085881; x=1774690681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=MyknmDCIj+qJFMNIeO1j74rXO8XwVkTe1jlELM5LyzqKU+pVOotN9KiE7Ly0ifqeHG
         zORhtmG63vcZFnMyvUIeTd0OQO6Gwqa+o0mHxxljGidPopHKI7uEAobbHA9322/9tDjv
         wr+BDTLdMyE2bM74O2+TiTcr4ol5pDlqZRV1rV9x091ITgrebIK7OGjCHQVOFh5kBDrh
         oZ5zO113wBnIR3z0w+H/Q4CmYuMVMpvc2MB7Rm6aC78fTPZF3M5KUOSulDP9AGC0BqBk
         77sO76pljmoDpYvjTRJPfdRwmpIKit9yn+bj7imqR4IeH/Y0+Jf/bwOkL0cZMgGMy8CW
         cLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085881; x=1774690681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=QLPm7KVkjqUagSfaYtLKtr3nmQDbtj5KNkXaqtbJcYySNjVrcY/ijTVGKj9aCrZ/tf
         JP02S/ngMikUkNksk90UNaU3Lo7R5P7wr+2HLbAnp55GAkPVtQcwaqEfGQx7cg7ZLtOA
         7X39Mi5zlRBTDsrIxcr57ZoJWSiY3Hpnb5wu0+53EGBiJ3KmFNZ+dd09ejTlmmmYpnFW
         pJ1R+OXT2HtwjGVMU0VbZ5oik+wbWioEtAxZS80D4pnzPxiatVYNTN43znZs0gSi1opv
         YG28IIkJajbNIlNO1R4EsUMgcyPtlgP2q4WMRPK4UBukvIB8rUQoVYuqZY43qd0wAbTD
         F5AA==
X-Forwarded-Encrypted: i=1; AJvYcCVATzVhDVx9dVah5wdObR1G/vq1/KDfSSfortm+3AJDDGMvxtpOnUjgtt643/2YLcwR0AwtYEHxmJabb4xS@lists.infradead.org
X-Gm-Message-State: AOJu0YypqLDSgd4wpQN+Ch5g0p/NIKDpkNud7R/u8I9xOTLtPGfEbdjr
	+6/6LqYHoGvNBnShsH+BP1qKB2Bb0ohcRrXJrTG/f4SLQKSjVS9zThPos/0qR8wNEKQ=
X-Gm-Gg: ATEYQzxeWMzCuH5iOznnzKEbE+Nm8OyOen26m65u2LMGAHhALd7o8aPY+L583pI/bh8
	eIDmR0SPAQ5WAmZlYL2uxG4fC2Hg/9YYvriSB+D/UoPgBxg5FCP6ckgdrM+mgoLS+MXK0HdV7Fh
	v/D0q64lQlNANheSyGLDcdsPRHOv/9t+ZCdetYDeeGxsea8AwQycSOzXNB//qiGks613rfiFs1H
	dKRPWyeqYZQfayHyqA+FcBDxcWi7WUxFW01HuRoAgJIpFl8xrsOPnQ+oGq+V+TjysYvcvWkaE8A
	RnvvVD5CADHi9x5XCUZwEGXfpfHDyGNPIIvI+5Cc4YMjYihghM3ChpYF7q3tNpUUzkvZliIHOyx
	oaACciRah9zu9/HULR6xaOiLnTv6kBLXgHdSSIuHbKqve2voJO998Sx6Zoj/alIzH9WPRvbCLv4
	8nJfVkENIITozUMyZmhOWtXbyU4HOYIrEnhpmpxhZ7N/qr6P4Aw7ITxSMPMBeQDixm007ByyRnc
	JVeBMM046C/ogDYqEKON9o=
X-Received: by 2002:a05:6000:4021:b0:439:b1c3:84c8 with SMTP id ffacd0b85a97d-43b6423bc21mr10398940f8f.21.1774085880444;
        Sat, 21 Mar 2026 02:38:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm13770100f8f.35.2026.03.21.02.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:37:59 -0700 (PDT)
Message-ID: <8462ee30-7e58-46ae-97f4-bc208dd40f27@linaro.org>
Date: Sat, 21 Mar 2026 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_023803_742670_005FBC3D 
X-CRM114-Status: GOOD (  11.15  )
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

TGUgMjEvMDMvMjAyNiDDoCAwODo1MiwgQWxleGFuZGVyIEtvc2tvdmljaCBhIMOpY3JpdMKgOgo+
IEFkZCBSR0IxMDEwMTAgdG8gdGhlIHVuc3VwcG9ydGVkIGZvcm1hdCBjYXNlcyB0byBmaXggLVdz
d2l0Y2ggd2FybmluZ3MKPiBpbnRyb2R1Y2VkIGJ5IHRoZSBhZGRpdGlvbiBvZiB0aGUgbmV3IHBp
eGVsIGZvcm1hdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS29za292aWNoIDxha29z
a292aWNoQHBtLm1lPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21p
cGlfZHNpLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKPiBpbmRleCA2NmM3M2M1
MTJiMGUuLjU5ZmMwMDgzZDMxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZHdfbWlwaV9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
d19taXBpX2RzaS5jCj4gQEAgLTExOSw2ICsxMTksNyBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNp
X3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKPiAgIAkJZHBpX2RhdGFfZm9ybWF0ID0gRFBJX0NP
TE9SXzE4QklUX0NGR18yOwo+ICAgCQl2ZW5jX2RhdGFfd2lkdGggPSBWRU5DX0lOX0NPTE9SXzE4
QjsKPiAgIAkJYnJlYWs7Cj4gKwljYXNlIE1JUElfRFNJX0ZNVF9SR0IxMDEwMTA6Cj4gICAJY2Fz
ZSBNSVBJX0RTSV9GTVRfUkdCNjY2X1BBQ0tFRDoKPiAgIAljYXNlIE1JUElfRFNJX0ZNVF9SR0I1
NjU6Cj4gICAJCXJldHVybiAtRUlOVkFMOwo+IEBAIC0yMzIsNiArMjMzLDcgQEAgc3RhdGljIGlu
dCBtZXNvbl9kd19taXBpX2RzaV9ob3N0X2F0dGFjaCh2b2lkICpwcml2X2RhdGEsCj4gICAJCWJy
ZWFrOwo+ICAgCWNhc2UgTUlQSV9EU0lfRk1UX1JHQjY2NjoKPiAgIAkJYnJlYWs7Cj4gKwljYXNl
IE1JUElfRFNJX0ZNVF9SR0IxMDEwMTA6Cj4gICAJY2FzZSBNSVBJX0RTSV9GTVRfUkdCNjY2X1BB
Q0tFRDoKPiAgIAljYXNlIE1JUElfRFNJX0ZNVF9SR0I1NjU6Cj4gICAJCWRldl9lcnIobWlwaV9k
c2ktPmRldiwgImludmFsaWQgcGl4ZWwgZm9ybWF0ICVkXG4iLCBkZXZpY2UtPmZvcm1hdCk7Cj4g
CgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
