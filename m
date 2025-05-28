Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66579C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 May 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Y3dztEnLuV0zkgpZEQfB7y0EyIiowBIs39XaxwRtoc=; b=JW2Wm17sQHj6Lf
	kURAUe03vgt0AenscCaqoIQ3QkQNRYmhoP0behh9U7rzxZcuLsGqzBwMvbmUDkABrkKX4hRAYuVsC
	He6JUSARn3LwYp6DtbJFO7KZSP7J3WHxBpepGEz5dQ/c8/nfFRFTQOeBsdKR1C2Cvs8CuiewZwNac
	pmVGz2mLvk3xfhVmIMIM/lvw4/y+bv7QV9NiXShQAF+h0hfAyUf7q4j5rVsCaRLeIvIbPy6p+HqxH
	YyQOBTKm94Ue8xAO0a8FabV0ja3QGbM6wJ7CoEyshOvePPPEJi1c59r4e27YbIR50ZXUCzJUIRBFH
	iycQHCWmqSNgOksHF84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj5-0000000Cwyr-2ipA;
	Wed, 28 May 2025 11:13:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKERf-0000000CvQp-3ZDg
	for linux-amlogic@lists.infradead.org;
	Wed, 28 May 2025 10:55:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9gvRZ009131
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 10:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=; b=WLqBDXLaETrREYPP
	k3bqTgo4rPOev8L1bg2YP3zUKL3ZKb/ZbYk2aOckQdMkBvCDvDHTPbAK0IhR7Wjv
	12r5wFXgoAWjAYkw74SbYE+gmbpqy29x+7rpmMgEm8WCZyASVPYsO6vxBdYVsYsg
	P4+BgsYx9M5+a/I/xK+XplgbelC1Jxf365V3AIK6OTFyZpKSRusIKbJ4S4HmWsTt
	0gtsHWF3imOnvSr9sHhysmwT4MkLWmAvXSE2jGkGzbBBkuXpKVh9qjJXwo3/r3s7
	5uLyOjv1bGFclk/VO6rcG/LGayxuaz3O1JC4IIzV+UlafMX9BvVP/6bYQqL4mxuj
	X3b5uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mr5f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 10:55:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faad1c56b9so51333746d6.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 03:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429738; x=1749034538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=;
        b=CyCJ7CjPUwo6EB2f+vhf64HgvcsWha9ZjHoqzKatz/fJzv1jlwoCqLcE/KfVPgYp31
         MUs3rLdz9od/20OtmCknB/TEcsDlq4uJtViCE6/s3iqsxsX4oi7tgw1Uw+rZcjUdnYGM
         dhmcYZaYv1m9700FJYg6D3SRtVFrig2s6MDJRaqdHoZ96uuAMP1kRIrCBNjzP3kM70hN
         T4hxUww2mrTKJhwljOFfUf4X6KT16kSGYdcdFnjopy4q/gqiRAanxdX0oSumlZIXJZZB
         9GN/a8fPXLScbozjuOBJOFD5O6jHoo2a+FVcI7tg8jjCe0oJWRLAtbyPSXYPIDtIlaOx
         Jynw==
X-Forwarded-Encrypted: i=1; AJvYcCVCwEd65HqwA03+czay5KsT0H6uGdvVwW+hmW8EfxAWGXW2UlYQixQ5x9TtvKE9wylhdJi//uy8JB99H0Wt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/V+Wo3FmqAuoN38tQnI8iiJzeZch5tQ15tetJQdOE832hMKKi
	ytgWO+ZBpaQOaL/BJzbDYLRgDcWDJdPm3VAc+vaYDTWVm/5mdOfZMP1E19T99bwB2nzovn+Z2PA
	NQB0ywrprUZyRMxutOZ8Y3EtRNrBFU5uYrC2SUd4YXg+AWyCP7p4SW+B69esXJ1KlsgSzsqsv7w
	==
X-Gm-Gg: ASbGncv7/fzXT34q/cOSwpglECVtw5gvI5+lmr9subGp2ZMvggbzwpeiKOGcwZNVoXf
	bEYeDEb2UbOzbtuK+lSsuV166AUHn2zeyiEnRWGVD9v9XCCHRCkvH8OPYMdEJMKRBrmZdM2h1dn
	MMxSFVvmvBL397VBevSwkZ6cLaz3ZrZWQJ1S6/b7fbhe09GRgACJg/oCymVtHa4dLn0IYd9UXPn
	7k7OFPOfHD44uuKr/GSRlbWbE8VoNz/qEqnyN8maxikFx+/d0ZvyLLsM1Opj+MUp2i/AOdlNbpK
	IkS/vKfhCXcoCEQooXfizn5KNifKPL7YDULQySdAm+6jyvhqlxIGtEiMzgPecA9PLV4GJ7+4QxM
	=
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id 6a1803df08f44-6fa9d01b876mr219767916d6.12.1748429737680;
        Wed, 28 May 2025 03:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHTeW9Oym5KrU5w2CrN6TuqbEYXZSVkhfiP2M2uzBIJxVS46ac7MVbRXMxqQkY4kvIlFReMQ==
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id 6a1803df08f44-6fa9d01b876mr219767476d6.12.1748429737194;
        Wed, 28 May 2025 03:55:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62b2e8sm233345e87.96.2025.05.28.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:55:36 -0700 (PDT)
Date: Wed, 28 May 2025 13:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4] drm/bridge: tc358767: convert to
 devm_drm_bridge_alloc() API
Message-ID: <y262e67gi5f53objugljkpyc3lzdaqtw3b7qr4546btqo7ehu4@qp2orsf6xd7t>
References: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
X-Proofpoint-GUID: kGaBvMrSOl-z0NNfwhdVAj2G6QP1jteD
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6836ebaa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Xa5mcPTA7YjQpW6brCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kGaBvMrSOl-z0NNfwhdVAj2G6QP1jteD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NSBTYWx0ZWRfX2uHtdKdj+SiZ
 rF6+8brK/lV+wZQBQ8VzMZE3OpS6ybihztlYmc4r0jx8RjocgXn/gZ8n2wC0WlOMZyrwCl3gd6R
 NCKg2rtuSj6K0lD0OeZcvAJYq95e5SE1/NX3VuhTYdVgfKDKCf6oU9IrGjJikQe9m01GTdxN65S
 XbP4YrMS8Eipj39wP5/HNNs5M4mgUPkNn2a2fUAggyAePGVdg9Du7UveZloVqTJD1KWKjF/V0/z
 JUhzSsLwWaKBSrr7s3C9SZKW0UrncIX1KIlWp3XPvRQl8a9XGpwk9WwxAkfU1lHjrEMLypEEBpx
 rXLkUqtmR/C98HtZOayqBjRiNjkKalRrwQgFuuSPv3RbdO2PUTzwXa90urZIgkD8Dx4wl4EAilp
 eXQtr/BI4CHVppdZeRhKbOQT1RQzy/Hvjl55fykrarhZtjbr5kYA9r0tzUUL3bpwMxcrIMdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035540_012034_98200516 
X-CRM114-Status: GOOD (  33.52  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTE6Mjk6MzZBTSArMDIwMCwgTHVjYSBDZXJlc29saSB3
cm90ZToKPiBUaGlzIGlzIHRoZSBuZXcgQVBJIGZvciBhbGxvY2F0aW5nIERSTSBicmlkZ2VzLgo+
IAo+IENvbnZlcnRpbmcgdGhpcyBkcml2ZXIgaXMgYSBiaXQgY29tcGxleCBiZWNhdXNlIHRoZSBk
cm1fYnJpZGdlIGZ1bmNzCj4gcG9pbnRlciBkaWZmZXJzIGJhc2VkIG9uIHRoZSBicmlkZ2UgbW9k
ZS4gU28gdGhlIGN1cnJlbnQgY29kZSBkb2VzOgo+IAo+ICAqIHRjX3Byb2JlKCkKPiAgICAqIGRl
dm1fa3phbGxvYygpIHByaXZhdGUgc3RydWN0IGVtYmVkZGluZyBkcm1fYnJpZGdlCj4gICAgKiBj
YWxsIHRjX3Byb2JlX2JyaWRnZV9lbmRwb2ludCgpIHdoaWNoCj4gICAgICAqIHBhcnNlcyBEVCBk
ZXNjcmlwdGlvbiBpbnRvIHN0cnVjdCBmaWVsZHMKPiAgICAgICogY29tcHV0ZXMgdGhlIG1vZGUK
PiAgICAgICogY2FsbHMgZGlmZmVyZW50IGJyaWRnZSBpbml0IGZ1bmN0aW9ucyBiYXNlZCBvbiB0
aGUgbW9kZQo+ICAgICAgICAqIGVhY2ggc2V0cyBhIGRpZmZlcmVudCBicmlkZ2UuZnVuY3MgcG9p
bnRlcgo+IAo+IFRoZSBuZXcgQVBJIGV4cGVjdHMgdGhlIGZ1bmNzIHBvaW50ZXIgdG8gYmUga25v
d24gYXQgYWxsb2MgdGltZSwgd2hpY2ggZG9lcwo+IG5vdCBmaXQgaW4gdGhlIGN1cnJlbnQgY29k
ZSBzdHJ1Y3R1cmUuCj4gCj4gU29sdmUgdGhpcyBieSBzcGxpdHRpbmcgdGNfcHJvYmVfYnJpZGdl
X2VuZHBvaW50KCkgaW4gdHdvIGZ1bmN0aW9uczoKPiAKPiAgKiB0Y19wcm9iZV9nZXRfbW9kZSgp
LCBjb21wdXRpbmcgdGhlIG1vZGUgd2l0aG91dCBuZWVkaW5nIHRoZSBwcml2YXRlCj4gICAgZHJp
dmVyIHN0cnVjdHVyZQo+ICAqIHRjX3Byb2JlX2JyaWRnZV9lbmRwb2ludCgpLCBvbmx5IGluaXRp
YWxpemluZyB0aGUgZW5kcG9pbnRzCj4gCj4gU28gbm93IHRoZSBtb2RlIGlzIGtub3duIGJlZm9y
ZSBhbGxvY2F0aW9uIGFuZCBzbwo+IGlzIHRoZSBmdW5jcyBwb2ludGVyLCB3aGlsZSBhbGwgb3Ro
ZXIgb3BlcmF0aW9ucyBhcmUgc3RpbGwgaGFwcGVuaW5nIGFmdGVyCj4gYWxsb2NhdGlvbiwgZGly
ZWN0bHkgaW50byB0aGUgcHJpdmF0ZSBzdHJ1Y3QgZGF0YSwgYXMgdGhleSB1c2VkIHRvLgo+IAo+
IFRoZSBuZXcgY29kZSBmbG93IGlzOgo+IAo+ICAqIHRjX3Byb2JlKCkKPiAgICAqIHRjX3Byb2Jl
X2dldF9tb2RlKCkKPiAgICAgICogcGFyc2VzIERUIGRlc2NyaXB0aW9uCj4gICAgICAqIGNvbXB1
dGVzIGFuZCByZXR1cm5zIHRoZSBtb2RlCj4gICAgKiBiYXNlZCBvbmYgdGhlIG1vZGUsIHBpY2sg
dGhlIGZ1bmNzIHBvaW50ZXIKPiAgICAqIGRldm1fZHJtX2JyaWRmZ2VfYWxsb2MoLi4uLCBmdW5j
cykKPiAgICAqIGNhbGwgdGNfcHJvYmVfYnJpZGdlX2VuZHBvaW50KCkgd2hpY2gKPiAgICAgICog
Y2FsbHMgZGlmZmVyZW50IGJyaWRnZSBpbml0IGZ1bmN0aW9ucyBiYXNlZCBvbiB0aGUgbW9kZQo+
ICAgICAgICAqIHRoZXNlIGRvbid0IHNldCB0aGUgZnVuY3MgcG9pbnRlciwgaXQgd2FzIGRvbmUg
YnkgX2FsbG9jCj4gCj4gVGhpcyBzb2x1dGlvbiBpcyBjaG9zZW4gdG8gbWluaW1pemUgdGhlIGNo
YW5nZXMgaW4gdGhlIGRyaXZlciBsb2dpY2FsIGNvZGUKPiBmbG93LiBUaGUgZHJhd2JhY2sgaXMg
d2Ugbm93IGl0ZXJhdGUgdHdpY2Ugb3ZlciB0aGUgZW5kcG9pbnRzIGR1cmluZyBwcm9iZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
Pgo+IC0tLQo+IGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIFswXSBpcyB0aGUgbmV3IEFQSSB0byBh
bGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIERSTQo+IGJyaWRnZSwgYW5kIHRoZSBvbmx5IG9uZSBz
dXBwb3J0ZWQgZnJvbSBub3cgb24uIEl0IGlzIHRoZSBmaXJzdCBtaWxlc3RvbmUKPiB0b3dhcmRz
IHJlbW92YWwgb2YgYnJpZGdlcyBmcm9tIGEgc3RpbGwgZXhpc3RpbmcgRFJNIHBpcGVsaW5lIHdp
dGhvdXQKPiB1c2UtYWZ0ZXItZnJlZS4KPiAKPiBUaGUgc3RlcHMgaW4gdGhlIGdyYW5kIHBsYW4g
WzFdIGFyZToKPiAKPiAgMS4g4p6cIGFkZCByZWZjb3VudGluZyB0byBEUk0gYnJpZGdlcyAoc3Ry
dWN0IGRybV9icmlkZ2UpCj4gIDIuIGhhbmRsZSBncmFjZWZ1bGx5IGF0b21pYyB1cGRhdGVzIGR1
cmluZyBicmlkZ2UgcmVtb3ZhbAo+ICAzLiBhdm9pZCBEU0kgaG9zdCBkcml2ZXJzIHRvIGhhdmUg
ZGFuZ2xpbmcgcG9pbnRlcnMgdG8gRFNJIGRldmljZXMKPiAgNC4gZmluaXNoIHRoZSBob3RwbHVn
IGJyaWRnZSB3b3JrLCByZW1vdmluZyB0aGUgImFsd2F5cy1kaXNjb25uZWN0ZWQiCj4gICAgIGNv
bm5lY3RvciwgbW92aW5nIGNvZGUgdG8gdGhlIGNvcmUgYW5kIHBvdGVudGlhbGx5IHJlbW92aW5n
IHRoZQo+ICAgICBob3RwbHVnLWJyaWRnZSBpdHNlbGYgKHRoaXMgbmVlZHMgdG8gYmUgY2xhcmlm
aWVkIGFzIHBvaW50cyAxLTMgYXJlCj4gICAgIGRldmVsb3BlZCkKPiAKPiBUaGlzIHNlcmllcyBp
cyBwYXJ0IG9mIHN0ZXAgMSBvZiB0aGUgZ3JhbmQgcGxhbi4KPiAKPiBDdXJyZW50IHRhc2tzIGlu
IHN0ZXAgMSBvZiB0aGUgZ3JhbmQgcGxhbjoKPiAKPiAgQS4g4pyUIGFkZCBuZXcgYWxsb2MgQVBJ
IGFuZCByZWZjb3VudGluZyAtPiAobm93IGluIGRybS1taXNjLW5leHQpCj4gIEIuIOKenCBjb252
ZXJ0IGFsbCBicmlkZ2UgZHJpdmVycyB0byBuZXcgQVBJICh0aGlzIHNlcmllcykKPiAgQy4g4oCm
IGRvY3VtZW50YXRpb24sIGt1bml0IHRlc3RzICh2MSB1bmRlciBkaXNjdXNzaW9uKQo+ICBELiBh
ZnRlciAoQiksIGFkZCBnZXQvcHV0IHRvIGRybV9icmlkZ2VfYWRkL3JlbW92ZSgpICsgYXR0YWNo
L2RldGVjaCgpCj4gIEUuIGFmdGVyIChCKSwgY29udmVydCBhY2Nlc3NvcnM7IHRoaXMgaXMgYSBs
YXJnZSB3b3JrIGFuZCBjYW4gYmUgZG9uZQo+ICAgICBpbiBjaHVua3MKPiAgRi4gZGVidWdmcyBp
bXByb3ZlbWVudHMKPiAKPiBNb3JlIGluZm8gYWJvdXQgdGhpcyBzZXJpZXMgaW4gdGhlIHYyIGNv
dmVyIFsyXS4KPiAKPiBMdWNhCj4gCj4gWzBdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vbWlzYy9rZXJuZWwvLS9jb21taXQvMGNjNmFhZGQ3ZmMxZTYyOWI3MTVlYTNkMWJhNTM3
ZWYyZGE5NWVlYwo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMjA2LWhv
dHBsdWctZHJtLWJyaWRnZS12Ni0wLTlkNmYyYzljMzA1OEBib290bGluLmNvbS90LyN1Cj4gWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MjQtZHJtLWJyaWRnZS1jb252ZXJ0
LXRvLWFsbG9jLWFwaS12Mi0wLThmOTFhNDA0ZDg2YkBib290bGluLmNvbS8KPiAtLS0KPiBDaGFu
Z2VzIGluIHY0Ogo+IC0gUmVtb3ZlZCBwYXRjaGVzIGFscmVhZHkgaW4gZHJtLW1pc2MtbmV4dCAt
PiBvbmx5IDEgbGVmdAo+IC0gSW1wcm92ZSBjb21taXQgbWVzc2FnZSBvZiBwYXRjaCAxCj4gLSBM
aW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1MDktZHJtLWJyaWRn
ZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12My0wLWI4YmMxZjE2ZDdhYUBib290bGluLmNvbS8KPiAK
PiBDaGFuZ2VzIGluIHYzOgo+IC0gRml4ZWQgaXNzdWVzIHJlcG9ydGVkIGZvciBzb21lIHBhdGNo
ZXMKPiAtIEFkZGVkIHJldmlldyB0YWdzCj4gLSBSZW1vdmVkIHBhdGNoZXMgdGhhdCBoYXZlIGJl
ZW4gYXBwbGllZAo+IC0gQWRkZWQgcmV2ZXJ0IGZvciB0aGUgZXh5bm9zIHBhdGNoLCBhcHBsaWVk
IGJ5IG1pc3Rha2UKPiAtIFVwZGF0ZSBjb3ZlciB3aXRoIGdyYW5kIHBsYW4gaW5mbyBhbmQgdHJp
bSBzb21lIG9mIGl0Cj4gLSBVcGRhdGVkIGJvdW5jaW5nIGUtbWFpbCBhZGRyZXNzIGluIENjIGxp
c3QKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MjQt
ZHJtLWJyaWRnZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12Mi0wLThmOTFhNDA0ZDg2YkBib290bGlu
LmNvbS8KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gSW1wcm92ZWQgY292ZXIgbGV0dGVyIHdpdGgg
bGluayB0byBjb21taXQgYWRkaW5nIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpCj4gLSBhZGQgcmV2
aWV3IHRhZ3MKPiAtIGZpeCBidWdzIGluIHp5bnFtcCwgdmM0IHBhdGNoZXMKPiAtIGZpeCBwYXRj
aCAxIGVycm9yIGNvZGUgY2hlY2tpbmcKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNTA0MDctZHJtLWJyaWRnZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12MS0wLTQy
MTEzZmY4ZDljMEBib290bGluLmNvbQo+IC0tLQo+IAoKUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApXaXRoIGJlc3Qg
d2lzaGVzCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
