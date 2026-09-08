Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82079C79FA1
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xouANRTZ2tGIefnCkbjvFle4qAQ6M7ZdV4B0gKgXuaA=; b=y35noLae7O5geq
	7qJb5QTNyfGt5wNFbdvnUJdDgIGXsqXhqYXC7ji+IEa5jfLlV+yCrNMQsUAJw9JSG/Kchi/EscRr9
	x2TVe08RfEesqqdd+YsR9O8m5tAtKBinaoztJndghQSGwypvDSxN68Mh8TN1wRJkZnyuIP+yijUmR
	v328Lz2nU1UwX85xcYoQgWKL9r3LMkEJ9deryPDTnyhM21hfqpIe9WW1uEbWldArac4LFNOun9QZF
	lVGYd1PhfRAlQNj3I9hp7602Pa2Q1b+7Kj1AV2McV9wm69vTpqW/ppPyAHhi4tLFVQkZUQ9mYBIrI
	/dR4ReOZGBkM3T2ljG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tNu-00000008olj-2U9K;
	Tue, 08 Sep 2026 10:49:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tNr-00000008oke-2Ufc
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 10:49:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADkpG2171213
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Sep 2026 10:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=; b=IwnuZ2wTBKXskuwd
	isjLX9peU+oyNys7mzijYGGZcTHJVfelcLsl1sjzcbEP9LvH3qfc/kfR9viyMPfu
	Pgpll1UJOxu/bdzl5fc6UX11+NiGF8ccF1B8ncTS4Eo4yBVCw9x6i1kK8H1EMUza
	FBT2jnPDwh0k8j5Qz5Nia1J/OkaH7D+fyAiy7ZopkrDybBiI9j9DPVj6jLNIulw+
	ARZxbwB2lQe4JdGG2ugaCtG+kBLgMV8G2q/4py3gwMINkeU5oZ0j9EeLuR97VHaK
	SF3ozt3rsmeJ3c8yIZBuJiE9mg8deE9YMoY6JBdu8lVglcLt/ZlqvHi1bWXB36t0
	xSsM1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuh4n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 10:48:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so3746509137.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788864538; x=1789469338; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=;
        b=DfmzODsCUyyYcm09uDlp1uskoEmWeb8igFBLr5R3xfsgG9mEYcGlqeO4pZ6BwPmTIN
         irvmHvMMzB5Ncb1PqBl0AGg/O21YnT6XzWNyjDwnXuv7JvceAgP0I2k3NlrF4dttXti0
         BuNyJFLRqr2Vmt7IpJACuGQUDwnc6OhQVLE2m3wvbLmchMnYJo0NLucx8WlFaAZiyOIR
         87RXjLbxoriPIYR3hgT4xfnjaG/ial4Vd2jQ5UVKm0HO1QDcxtGuC0KpKH2XfBgYUxDM
         0JKGYB2ap79LPcmHMsLZK9kTOaQQ1EvJr58xZFA6ASnuAAld6ZevW4pKCuxBC5ACkkI/
         1VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864538; x=1789469338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=;
        b=s3kUOuQLrZreSCAwSMh+Rp9W+0+hTNfiLI4NaOoIiPVvNa9tVTz8WOvLil6yT0WzsG
         CmXsyjdrnYUZUaZABYZI3A6PdozV3p4fatTg0Lx7OYaXXcRf7gVw7a28JL5gqojz+l8y
         ZyT9GWlJ1umbHOZZvTmihLCLbaXRfynSFoWK15X+RjWi5QFqyS6HE7AK3FxvfWZRgKKP
         PjtAzs5UG/vRI9/3Et4LVnaGPDPwZQG3X7I2qIfEvMIe83cmfdgWIVkNJZxuA645KUBo
         PyR3rCh9a8Tn6Bd+UXrFwyyWcXIT7VgYKkPzyRgtBAMvPJOO9gbMrLPAPSZa3TocTvUg
         hQWw==
X-Forwarded-Encrypted: i=1; AKwUvBysY8SICBIoSmZTgaVKtXLJKjRzzrfaRNLt8wTTjYnwjmDxbyWC8jiq0ayCPmTbEb3gBiH0fJvRQtp71LjS@lists.infradead.org
X-Gm-Message-State: AFuF++ksukL9LdgbCFZSA+xEJ6QALxsXPBO/A3+xLom1Ouri59fKh0em
	apnuqk2TMrMijEpOrKdpkOQ4bvA5u2FMDf0oh4tolCaVc0GebLa3dmrdA0hcw+02dRUeJUE7Z3V
	XYZ+pN6dcafik1MdV/RGVBVlUp35HZ3tyjSrCEFlZX6dn6tXUaXSuf6h4dBjyXYmnlsU49okoYQ
	==
X-Gm-Gg: AYBFou3aBr4131ZJ8nHoMAva7i8PvUQzO0VQbbpCYD1hrWGzZxbMsLFi48RXBYXrvbp
	QHXZAwFd79vdKND1Ek193TjK8Di+HtlO3YasNT75ALNrl8DvQvnZy1fxQJ7bzwkzzU3xzZd7ZOI
	w68K6XQicSpx0huWgBzkb2mWWHNwW8dCtW7addnyqcoSlRvjdCUcHk7W82HpUM0Mh0mHbTGGYRe
	ZCyJc7qekufYNcrzXg3FHY8NwZRFetB3PBUqTep7Rntjv03/ZgGq/ZDK6U0Ofe3osIJ75okCPiR
	ff26t+4NCR7Yui3liCJ1NNj/wQc700ZVyuU0aKWMWBmDAMaXDNZDGOcokq9++GPfyIRMLyUB5Xv
	F9o8xlZ1jIuftmHucsIlMzoT8sP9FiHrrN/NK+7zS1YvqB2vRL3SE8TadmEQVSuJRtpf2TryT3c
	GVSZvjkNrd3oYp
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr12082392137.6.1788864537586;
        Tue, 08 Sep 2026 03:48:57 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr12082372137.6.1788864537092;
        Tue, 08 Sep 2026 03:48:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fea24sm3121617e87.48.2026.09.08.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:48:55 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:48:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Message-ID: <cwa6rmvixxmbw4ga5ujq62kzwn2rrb6ysvv5fqd3oge662ai52@dtvw4so36l2p>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
 <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
 <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fe81a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=79fl_rtsZexB1o3ud2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: SS4G9dT8mJFrPB-WSqw4pftsne-yxLhA
X-Proofpoint-ORIG-GUID: SS4G9dT8mJFrPB-WSqw4pftsne-yxLhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExNSBTYWx0ZWRfX4lgXxB6mlx/M
 MCu+QsAjY7ZB9yMzdc6njZxegEfKM4aESWaOFABOY7BjQWu9SCmKwQ4ml2Ha96uyGYb1Ph5KwzP
 kSdbF4eUPD8kFvIDzlG+BF8qWeQ28ZyojfG4mIDIQrH9clkZkmQCDLFJ9dh0b33KUpp2oaZJ0fY
 wmSUCRiV+ZQb2r5FNdtSd0vsjZcL/wj0Dx1TU90uRb5pyBADcdUB13SvNNtld9nW5Lw6RjMAjS1
 7DUzi/L9iZ1X5+acSioNMtY1jS69OX6j51QxC4OsrRHv8iTbNd5UMpoLYcrAzLoXAHnR9DdROyW
 myd6K8MYLYCgsWlqKT1DZwqkxkVD9iJl4ZX+TXH098r5UGml8GTfrcY2g8IPF2zk2LArkpIpQWI
 9tWM0LOa/A/wTxIGUJPemkM7D7x+sIC8pXq3fOF+UsURO0C+97MzUZTXvV+ZmFYub0al6/hK9AV
 hcmA23AxpwnPqfGFuIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExNSBTYWx0ZWRfX6gxWYV3+xQXh
 Yb+BvZtPqrqBtm/FjuJPwwaHhble5d19Eqsi0TtotpoV4YTg2DMqarze2NxgTYJsZyDyA1TPAsm
 gzLsGA1Ho5LtnzpXctlY/6YNgPz7NLA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_034859_644732_369378FE 
X-CRM114-Status: GOOD (  60.89  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgMDM6MTk6NDFQTSArMDgwMCwgWW9uZ3hpbmcgTW91IHdy
b3RlOgo+IAo+IAo+IE9uIDgvMTgvMjAyNiAxMToxOCBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90
ZToKPiA+IE9uIE1vbiwgQXVnIDE3LCAyMDI2IGF0IDA0OjAyOjMxUE0gKzA4MDAsIFlvbmd4aW5n
IE1vdSB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbiA3LzEyLzIwMjYgNjozMyBQTSwgRG1p
dHJ5IEJhcnlzaGtvdiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAxMDo0
ODowNFBNICswODAwLCBZb25neGluZyBNb3Ugd3JvdGU6Cj4gPiA+ID4gPiBUaGUgYnJpZGdlIGNv
bm5lY3RvciBIUEQgaGFuZGxpbmcgcGF0aCBjdXJyZW50bHkgdXBkYXRlcwo+ID4gPiA+ID4gY29u
bmVjdG9yLT5zdGF0dXMgZm9yIGV2ZXJ5IGhwZF9ub3RpZnkoKSBpbnZvY2F0aW9uLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBUaGlzIGRvZXMgbm90IHdvcmsgd2VsbCBmb3IgSVJRLW9ubHkgbm90aWZp
Y2F0aW9ucyB3aGVyZSB0aGUgZXZlbnQgYmVpbmcKPiA+ID4gPiA+IHJlcG9ydGVkIGlzIGNhcnJp
ZWQgYnkgZXh0cmFfc3RhdHVzIGFuZCBubyBjb25uZWN0b3Igc3RhdHVzIHRyYW5zaXRpb24gaXMK
PiA+ID4gPiA+IGFzc29jaWF0ZWQgd2l0aCBpdC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gT25lIGV4
YW1wbGUgaXMgRFAgTVNULiBIUEQgSVJRcyBhcmUgcHJvcGFnYXRlZCB0aHJvdWdoCj4gPiA+ID4g
PiBkcm1fYnJpZGdlX2hwZF9ub3RpZnlfKigpIHNvIHRoYXQgYnJpZGdlIGRyaXZlcnMgY2FuIHBy
b2Nlc3MgdGhlCj4gPiA+ID4gPiBub3RpZmljYXRpb24uIER1cmluZyBNU1Qgb3BlcmF0aW9uLCBo
b3dldmVyLCB0aGUgU1NUIGNvbm5lY3RvciBhdHRhY2hlZAo+ID4gPiA+ID4gdG8gdGhlIGJyaWRn
ZSBjb25uZWN0b3IgaXMgaW50ZW50aW9uYWxseSBrZXB0IGRpc2Nvbm5lY3RlZCB3aGlsZSB0aGUg
TVNUCj4gPiA+ID4gPiB0b3BvbG9neSBtYW5hZ2VyIGhhbmRsZXMgYWxsIGNvbm5lY3RvciBjcmVh
dGlvbiwgcmVtb3ZhbCBhbmQgaG90cGx1Zwo+ID4gPiA+ID4gcHJvY2Vzc2luZy4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gVXBkYXRpbmcgY29ubmVjdG9yLT5zdGF0dXMgZm9yIGFuIElSUS1vbmx5IE1T
VCBub3RpZmljYXRpb24gbWF5IGNhdXNlCj4gPiA+ID4gPiB0aGUgU1NUIGNvbm5lY3RvciBzdGF0
ZSB0byBvc2NpbGxhdGUgYmV0d2VlbiBjb25uZWN0ZWQgYW5kIGRpc2Nvbm5lY3RlZAo+ID4gPiA+
ID4gZGVwZW5kaW5nIG9uIHRoZSBub3RpZmljYXRpb24gcGF0aC4gVGhlc2UgYXJ0aWZpY2lhbCBz
dGF0ZSB0cmFuc2l0aW9ucwo+ID4gPiA+ID4gY2FuIGxhdGVyIGJlIGRldGVjdGVkIGJ5IHRoZSBw
b2xsaW5nIGxvZ2ljIGFuZCByZXN1bHQgaW4gdW5uZWNlc3NhcnkKPiA+ID4gPiA+IGhvdHBsdWcg
ZXZlbnRzIGJlaW5nIGdlbmVyYXRlZC4gVXNlcnNwYWNlIHRoZW4gcmUtcHJvYmVzIGNvbm5lY3Rv
cgo+ID4gPiA+ID4gc3RhdHVzLCBwb3RlbnRpYWxseSB0cmlnZ2VyaW5nIHRoZSBzYW1lIHNlcXVl
bmNlIGFnYWluLgo+ID4gPiA+IAo+ID4gPiA+IFRoZW4gdGhlIEFQSSBtaWdodCBuZWVkIHRvIGJl
IGFkanVzdGVkLgo+ID4gPiA+IAo+ID4gPiA+IFJlbWVtYmVyLCB3ZSBoYXZlIHR3byB1c2VjYXNl
cywgd2hpY2ggd2UgbXVzdCBiZSBhYmxlIHRvIGludGVycHJldAo+ID4gPiA+IGNvcnJlY3RseToK
PiA+ID4gPiAtIFRoZSBkcml2ZXIgZ2V0cyBzZXBhcmF0ZSBIUEQgYW5kIElSUV9IUEQgZXZlbnRz
Lgo+ID4gPiA+IC0gVGhlIGRyaXZlciBnZXRzIEhQRCBhbmQgSVJRX0hQRCBhdCB0aGUgc2FtZSB0
aW1lLgo+ID4gPiA+IAo+ID4gPiBPaGggeWVzLCBoZXJlIG5lZWQgdG8gcmV3b3JrLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBUcmVhdCBub3RpZmljYXRpb25zIHdpdGggc3RhdHVzID09IGNvbm5lY3Rv
cl9zdGF0dXNfdW5rbm93biBhbmQgYSB2YWxpZAo+ID4gPiA+ID4gZXh0cmFfc3RhdHVzIGFzIElS
US1vbmx5IGV2ZW50cy4gRm9yd2FyZCB0aGUgbm90aWZpY2F0aW9uIHRvIGJyaWRnZQo+ID4gPiA+
ID4gZHJpdmVycyB3aXRob3V0IG1vZGlmeWluZyBjb25uZWN0b3ItPnN0YXR1cy4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gVGhpcyBrZWVwcyBJUlEgZGVsaXZlcnkgd29ya2luZyB3aGlsZSBsZWF2aW5n
IGNvbm5lY3RvciBzdGF0ZSBtYW5hZ2VtZW50Cj4gPiA+ID4gPiB0byB0aGUgY29tcG9uZW50IHRo
YXQgYWN0dWFsbHkgb3ducyBpdCwgc3VjaCBhcyB0aGUgRFAgTVNUIHRvcG9sb2d5Cj4gPiA+ID4g
PiBmcmFtZXdvcmsuCj4gPiA+ID4gCj4gPiA+ID4gSG93IGlzIGl0IGhhbmRsZWQgYnkgb3RoZXIg
ZHJpdmVycyAoaTkxNSwgYW1kLCBub3V2ZWF1KT8KPiA+ID4gPiAKPiA+ID4gaTkxNSwgYW1kZ3B1
LCBhbmQgbm91dmVhdSBkb24ndCBnbyB0aHJvdWdoIHRoZSBkcm1fYnJpZGdlX2hwZF9ub3RpZnko
KQo+ID4gPiBicmlkZ2UgY2hhaW4gLS0gdGhlaXIgRFAgY29udHJvbGxlcnMgYXJlIGludGVncmF0
ZWQgaW50byB0aGUgU29DLCBhbmQKPiA+ID4gSFBEIGludGVycnVwdHMgYXJlIGhhbmRsZWQgZGly
ZWN0bHkgaW4gdGhlaXIgb3duIGVuY29kZXIgY29kZS4KPiA+ID4gCj4gPiA+IE1TTSBEUCBpcyBk
aWZmZXJlbnQgaW4gdGhhdCBIUEQgY29tZXMgZnJvbSBUeXBlLUMgLyBwbWljX2dsaW5rIGFsdG1v
ZGUKPiA+ID4gdmlhIGF1eC1ocGQtYnJpZGdlLCBzbyBpdCBoYXMgdG8gZ28gdGhyb3VnaCB0aGUg
YnJpZGdlIGNoYWluLCB3aGljaAo+ID4gPiBtZWFucyB0aGlzIHNlbWFudGljIG5lZWRzIHRvIGJl
IGV4dGVuZGVkIHRvIHRoZSBicmlkZ2UgQVBJLgo+ID4gCj4gPiBTdGlsbCwgd2hlbiBkbyB0aG9z
ZSBkcml2ZXJzIHNlbmQgdGhlIEhQRCBldmVudCBpbiBjYXNlIG9mIElSUV9IUEQ/IE9yCj4gPiBp
cyBpdCB0aGF0IGluIHRoZWlyIGNhc2UgSVJRX0hQRCBqdXN0IHRyaWdnZXJzIGlubmVyIGxvZ2lj
IHRvIHJlcmVhZCB0aGUKPiA+IHN0YXR1cyByZWdpc3RlcnMgYW5kIHRoZW4gdGhlIGRyaXZlciBz
ZW5kcyB0aGUgSFBEIGlmIHRoZXJlIGlzIGFueQo+ID4gYWN0dWFsIGNoYW5nZT8KPiA+IAo+IFNv
IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCxJUlFfSFBEIGlzIHByaW1hcmlseSB1c2VkIHRvIHRy
aWdnZXIgaW50ZXJuYWwKPiBzdGF0dXMgcmV2YWxpZGF0aW9uLiBBIGhvdHBsdWcgZXZlbnQgaXMg
b25seSBnZW5lcmF0ZWQgaWYgdGhhdCBwcm9jZXNzaW5nCj4gY29uY2x1ZGVzIHRoYXQgdGhlcmUg
aGFzIGJlZW4gYW4gYWN0dWFsIGNvbm5lY3RvciBvciB0b3BvbG9neSBzdGF0ZSBjaGFuZ2UuCgpP
ay4KCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25neGluZyBNb3UgPHlvbmd4aW5nLm1vdUBv
c3MucXVhbGNvbW0uY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9k
cm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jIHwgMTIgKysrKysrKysrKysrCj4gPiA+
ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25u
ZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMK
PiA+ID4gPiA+IGluZGV4IDVlZGNhNDdhMDI1Zi4uNzMzNGQ2Njc3NjA0IDEwMDY0NAo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25uZWN0b3IuYwo+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25uZWN0
b3IuYwo+ID4gPiA+ID4gQEAgLTE2Myw2ICsxNjMsMTggQEAgc3RhdGljIHZvaWQgZHJtX2JyaWRn
ZV9jb25uZWN0b3JfaGFuZGxlX2hwZChzdHJ1Y3QgZHJtX2JyaWRnZV9jb25uZWN0b3IgKmRybV9i
cmkKPiA+ID4gPiA+ICAgIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gJmRybV9i
cmlkZ2VfY29ubmVjdG9yLT5iYXNlOwo+ID4gPiA+ID4gICAgCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSBjb25uZWN0b3ItPmRldjsKPiA+ID4gPiA+ICsJLyoKPiA+ID4gPiA+ICsJICogSVJRLW9u
bHkgbm90aWZpY2F0aW9uOiBleHRyYV9zdGF0dXMgY2FycmllcyB0aGUgZXZlbnQgYnV0Cj4gPiA+
ID4gPiArCSAqIHN0YXR1cyBpcyB1bmtub3duIOKAlCBkbyBub3Qgb3ZlcndyaXRlIGNvbm5lY3Rv
ci0+c3RhdHVzLgo+ID4gPiA+IAo+ID4gPiA+IEJ1dCBpdCdzIG5vdCB1bmtub3duIGF0IHRoaXMg
cG9pbnQuIFRoZSBjb25uZWN0b3Igc3RhdHVzIGlzIHJlcG9ydGVkCj4gPiA+ID4gZm9sbG93aW5n
IHRoZSBIUEQgc3RhdHVzLgo+ID4gPiA+IAo+ID4gPiBZb3UgYXJlIHJpZ2h0LCBpbiB0aGUgU1NU
IGNhc2UgdGhlIGJyaWRnZV9jb25uZWN0b3Igc3RhdHVzIGRvZXMgZm9sbG93Cj4gPiA+IEhQRCAv
IGxpbmsgc3RhdHVzIC0tIGJlY2F1c2UgdGhlIGJyaWRnZV9jb25uZWN0b3IgaXRzZWxmIHJlcHJl
c2VudHMKPiA+ID4gdGhhdCBTU1QgY29ubmVjdG9yLCBzbyBpdHMgc3RhdHVzIG5hdHVyYWxseSBp
cyB0aGUgbGluayBzdGF0dXMuCj4gPiA+IAo+ID4gPiBUaGUgTVNUIGNhc2UgaGFzIGEga2V5IGRp
ZmZlcmVuY2UgdGhvdWdoOiB0aGUgU1NUIGNvbm5lY3RvciBtdXN0IGJlCj4gPiA+IGV4cGxpY2l0
bHkgbWFya2VkIGRpc2Nvbm5lY3RlZCAodG8gcHJldmVudCB0aGUgRFJNIGZyYW1ld29yayBmcm9t
Cj4gPiA+IGVuYWJsaW5nIGl0KSwgY29uc2lzdGVudCB3aXRoIHdoYXQgaTkxNSwgYW1kZ3B1IGFu
ZCBub3V2ZWF1IGRvLiBJbgo+ID4gPiBvdGhlciB3b3Jkcywgb25jZSBNU1QgaXMgZW5hYmxlZCwg
dGhlIFNTVCBjb25uZWN0b3IgdGhhdCB0aGUKPiA+ID4gYnJpZGdlX2Nvbm5lY3RvciByZXByZXNl
bnRzIG5vIGxvbmdlciBlcXVhdGVzIHRvIHRoZSBsaW5rIHN0YXR1cyAtLQo+ID4gPiB0aGUgcmVh
bCBsaW5rIGlzIG1hbmFnZWQgYnkgdGhlIE1TVCB0b3BvbG9neSwgYW5kIHRoZSBTU1QgY29ubmVj
dG9yCj4gPiA+IGlzIGp1c3QgYSBwbGFjZWhvbGRlciBhdCB0aGF0IHBvaW50Lgo+ID4gCj4gPiBU
aGlzIGlzIGZpbmUuCj4gPiAKPiA+ID4gCj4gPiA+IFRoZSBpc3N1ZSBpcyB0aGF0IElSUV9IUEQg
c3RpbGwgdHJhdmVscyB0aHJvdWdoIHRoZSBicmlkZ2VfY29ubmVjdG9yCj4gPiA+IGNoYWluIGFu
ZCB0YWtlcyB0aGUgb2xkICJ1cGRhdGUgdGhlIFNTVCBjb25uZWN0b3IncyBzdGF0dXMgLT4gZW1p
dAo+ID4gPiBob3RwbHVnIiBwYXRoLiBVbmRlciBNU1QgdGhhdCBydW5zIGludG8gdHdvIGNvbnN0
cmFpbnRzIC0tIGFuZCB0aGlzCj4gPiA+IGlzIGV4YWN0bHkgd2hhdCB0aGlzIHNlcmllcyBpcyB0
cnlpbmcgdG8gYWRkcmVzczoKPiA+ID4gCj4gPiA+IDEuIFRoZSBTU1QgY29ubmVjdG9yIHJlcHJl
c2VudGVkIGJ5IGJyaWRnZV9jb25uZWN0b3Igbm8gbG9uZ2VyIHN0YW5kcwo+ID4gPiAgICAgZm9y
IHRoZSBsaW5rLCBzbyBpdHMgc3RhdHVzIG11c3Qgbm90IGJlIG92ZXJ3cml0dGVuIGJ5IElSUV9I
UEQKPiA+ID4gICAgIGV2ZW50cy4KPiA+ID4gMi4gSVJRX0hQRCBuZWVkcyBhIGNsZWFuIHBhdGgg
dGhhdCBkb2VzIG5vdCB0cmlnZ2VyIGEgaG90cGx1ZyBvbiB0aGUKPiA+ID4gICAgIGJyaWRnZV9j
b25uZWN0b3IgLS0gdGhlIE1TVCBmcmFtZXdvcmsgYWxyZWFkeSBtYW5hZ2VzIGhvdHBsdWdzCj4g
PiA+ICAgICBpbmRlcGVuZGVudGx5Lgo+ID4gPiAKPiA+ID4gVXNpbmcgY29ubmVjdG9yX3N0YXR1
c191bmtub3duIGFzIGEgc2VudGluZWwgaGVyZSBkb2VzIGZlZWwgYSBiaXQgb2RkOwo+ID4gPiBs
ZXQgbWUgdGhpbmsgYWJvdXQgd2hldGhlciB0aGVyZSBpcyBhIGNsZWFuZXIgYXBwcm9hY2guCj4g
PiAKPiA+IFRoZSBzdGF0dXMgaGVyZSBtdXN0IHJlcHJlc2VudCB0aGUgc3RhdHVzIHJlcG9ydGVk
IGJ5IHRoZSBjb3JyZXNwb25kaW5nCj4gPiBsYXllcjogYmUgaXQgRFAgQUx0TW9kZSwgdGhlIGRw
LWNvbm5lY3RvciBkcml2ZXIgaGFuZGxpbmcgdGhlIEhQRCBHUElPCj4gPiBvciB0aGUgRFAgZHJp
dmVyIGl0c2VsZiBoYW5kbGluZyB0aGUgSFBEIHBpbiB2aWEgdGhlIHN0YXRlIG1hY2hpbmUuCj4g
PiAKPiBHb3QgaXQuCj4gPiBJcyBpdCBzdGlsbCBhbiBpc3N1ZSBpZiB0aGUgYnJpZGdlJ3MgaHBk
X25vdGlmeSgpIGNhbGxiYWNrIGRldGVybWluZXMKPiA+IHRoYXQgd2Ugc2hvdWxkIG5vdCBiZSBy
ZXBvcnRpbmcgdGhlIGV2ZW50IGFuZCBkcm9wcyBjb25uZWN0b3ItPnN0YXR1cyB0bwo+ID4gJ2Rp
c2Nvbm5lY3RlZCcgYWdhaW4/IFdoeSBpcyBpdCBhbiBpc3N1ZT8gU2hvdWxkIHdlIGluc3RlYWQg
ZmlsdGVyIHRoZQo+IHllcywgaXQgc3RpbGwgYW4gaXNzdWUgaWYgZWFjaCBpcnEgLiBUaGUgU1NU
IGNvbm5lY3RvciAgc2hvdWxkIG5vdCBiZQo+IHJlcG9ydGVkIGFzIGNvbm5lY3RlZCwgZXZlbiBt
b21lbnRhcmlseS4gV2hlbiB0aGUgY29ubmVjdG9yIHN0YXR1cyBpcwo+IGNoYW5nZWQgZnJvbSBj
b25uZWN0ZWQgYmFjayB0byBkaXNjb25uZWN0ZWQsIHRoaXMgc3RhdGUgdHJhbnNpdGlvbiBpcwo+
IHRyZWF0ZWQgYXMgYSBob3RwbHVnIGV2ZW50IGFuZCB0cmlnZ2VyIGhvdHBsdWcsIGludHJvZHVj
aW5nIHVubmVjZXNzYXJ5Cj4gdXNlcnNwYWNlIHBvbGxpbmcgYW5kIHJlLXByb2JpbmcuCgpQbGVh
c2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGlmIHRoZSBBbHRNb2RlIHNlZXMgdGhlIEhQRD1v
biwgcmVwb3J0cwp0aGF0IHRvIHRoZSByZXN0IG9mIHRoZSBEUk0gc3Vic3lzdGVtIHZpYSB0aGUg
aHBkX25vdGlmeSBvciBvb2Igbm90aWZ5LAp0aGVuIHRoZSBEUCBkcml2ZXIgaWRlbnRpZmllcyB0
aGF0IHRoZSBEUCBTaW5rIGlzIG5vdCBjb25uZWN0ZWQgKG9yIHRoYXQKaXQncyBhbiBNU1QgZGV2
aWNlIHdpdGggYXR0YWNoZWQgYnJhbmNoIGRldmljZXMsIGV0Yy4pIHRoZW4gdGhlcmUgd2lsbApi
ZSBubyBzdGF0dXM9Y29ubmVjdGVkIEhQRCBldmVudC4gVGhlIHVzZXJzcGFjZSBtaWdodCBzdGls
bCBnZXQgdGhlCnN0YXR1cz1kaXNjb25uZWN0ZWQgSFBEIGV2ZW50LCBidXQgdGhhdCBzaG91bGRu
J3QgbWF0dGVyIHRoYXQgbXVjaC4KCj4gPiBIUEQgZXZlbnRzIGluIHRoZSBkcm1fc3lzZnNfY29u
bmVjdG9yX2hvdHBsdWdfZXZlbnQoKSwgbWFraW5nIHN1cmUgdGhhdAo+ID4gd2UgZG9uJ3Qgc2Vu
ZCBkdXBsaWNhdGUgZGlzY29ubmVjdGVkIGV2ZW50cz8KPiA+IAo+IEkgdGhpbmsgZHJpdmVyIHNo
b3VsZCBjb25maXJtIGl0IHJlYWxseSBzZW5kIGEgaG90cGx1ZyB3aGVuIHdlIGNhbGwKPiBkcm1f
c3lzZnNfY29ubmVjdG9yX2hvdHBsdWdfZXZlbnQoKQo+ID4gV2hhdCBpcyB0aGUgZXhwZWN0ZWQg
YmVoYXZpb3VyIG9mIGRybV9jbGllbnQncz8KPiA+IAo+IC0gR2VudWluZSBjb25uZWN0L2Rpc2Nv
bm5lY3Q6IHRoZSBjbGllbnQgaXMgd29rZW4gdXAsIHJlLXByb2JlcyBhbmQgZm9sbG93cwo+IHRo
ZSBuZXcgc3RhdGUuCj4gLSBJUlFfSFBEIHdpdGggbm8gYWN0dWFsIGNoYW5nZTogdGhlIGNsaWVu
dCBtdXN0IG5vdCBiZSB3b2tlbiB1cCBhdCBhbGwsCj4gb3RoZXJ3aXNlIGV2ZXJ5IHNob3J0IHB1
bHNlIHRyaWdnZXJzIGEgZnVsbCByZS1wcm9iZSBvZiBhbGwgY29ubmVjdG9ycy4KCkEgSFBEIGV2
ZW50IG9uIG9uZSBjb25uZWN0b3Igc2hvdWxkIG5vdCB0cmlnZ2VyIGEgZnVsbCByZXByb2JlIG9m
IGFsbApjb25uZWN0b3JzLiBJdCBjYW4gYmUgYW4gZXJyb3Igb24gdGhlIGtlcm5lbCBzaWRlLCBp
ZiB0aGUga2VybmVsIHJlcG9ydHMKYSBkZXZpY2Utd2lkZSBIUEQgaW5zdGVhZCBvZiBzZW5kaW5n
IGEgY29ubmVjdG9yLXNwZWNpZmljIG9uZSBvciBpdCBjYW4KYmUgYW4gZXJyb3Igb24gdGhlIGNv
bXBvc2l0b3Igc2lkZSwgaWYgaXQgZG9lc24ndCBoYW5kbGUKY29ubmVjdG9yLXJlbGF0ZWQgSFBE
IGV2ZW50cyBpbiBhbiBlZmZlY3RpdmUgd2F5LgoKQW55d2F5LCBJIHJlYWxseSBkb24ndCB0aGlu
ayB0aGF0IHRoZSBrZXJuZWwgcmVwb3J0aW5nIGEgImRpc2Nvbm5lY3RlZCIKSFBEIGV2ZW50IG9u
IHRoZSBjb25uZWN0b3Igd2hpY2ggd2FzIGFscmVhZHkgbWFya2VkIGFzICJkaXNjb25uZWN0ZWQi
CnNob3VsZCBiZSBhIGNhdXNpbmcgYSBsb3Qgb2YgdHJvdWJsZXMuCgo+IC0gSVJRX0hQRCB3aGVy
ZSB0aGUgZHJpdmVyIGRvZXMgY29uY2x1ZGUgdGhhdCBzb21ldGhpbmcgY2hhbmdlZDogdGhlIGRy
aXZlcgo+IGVzY2FsYXRlcyBpdCBleHBsaWNpdGx5IGludG8gYSByZWFsIHN0YXR1cyBub3RpZmlj
YXRpb24uCgpBZ3JlZSBoZXJlLgoKPiAtIFRoZSBTU1QgY29ubmVjdG9yIHdoaWxlIE1TVCBpcyBh
Y3RpdmU6IHBlcm1hbmVudGx5ICdkaXNjb25uZWN0ZWQnLCBhbmQgdGhlCj4gY2xpZW50IG11c3Qg
bmV2ZXIgc2VsZWN0IGl0LiBUaGUgcmVhbCBvdXRwdXRzIGFyZSB0aGUgTVNUIHBvcnQgY29ubmVj
dG9ycwo+IGNyZWF0ZWQgYnkgdGhlIHRvcG9sb2d5IG1hbmFnZXIsIHdoaWNoIGdldCB0aGVpciBv
d24gaG90cGx1ZyBldmVudHMgZnJvbSBpdC4KCldoYXQgaXMgdGhlICJjbGllbnQiIGhlcmU/IERS
TSBjbGllbnQ/IENvbXBvc2l0b3I/CgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
