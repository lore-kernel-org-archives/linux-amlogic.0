Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA6C43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrErqdx+MUWjZiV2ySL80oRWcePpLOrgsQHnR7oCnCw=; b=efsdxORCBB4zLh
	FhoaPU1jeJ5jYRalG3YsmXSaA+gbpuhUfFiCOaT8W07Wp37FVSq6X6e5uPY/ZYdAfpjT0qghRoxd8
	F9ZRnc3wkbNZoucDx1Q4lJQv65jU9OaqA0hVi8PL/fuBy9EXul/YpWN53LdfSK9KHRIkOWnsOKqJH
	bnP076IRbiwAreQb0hGD5BbPe+zgtF9soisFWQ09ODNwSAEbGrX6N8s++8m1k/PsWoOxh15o/sJ9S
	AQw2GFJRVXmrpzosLkK1eaRYgNbNvqD77PbsYfVZ5mkvGYGZdroK2T+XSmWIUdTc/WX8JqzK8nbDm
	CC1DEBd9rr8K6/G3rH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirVL-00000007Mlp-32dH;
	Sun, 12 Jul 2026 10:33:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirVJ-00000007Ml7-0ZeC
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 10:33:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SsBB1748140
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=; b=ieN8kKDAR8qhHWCJ
	ltUmC6xm/kWtJ1ABS4QVcmrK20Y7oDjtppJUJ8Y3PsQtCVN5BKO9CrQsQavv0lbj
	GBs5OPTCwpSOyBdyeULr6+L03ixDLrpYZkxvlvAJ6i06MsJrMf4Ldmt0KLLCy5l4
	cUT1qg0UTX2BUCEZ/Lpna7op91HeuZO/52jon6DZu4hKllP2DVBty6zFnGG1i+Nr
	Aq39PqjDlyJ/T1O00tdpTrMg7e7SkZRQtsasIgDBAbrZ7sEcMAC20mfGZIcobF+j
	epZgo4d+ZJ+Op+MMdY1UMny7ea6yFKyzLMyjFAVpamFIOHc29dkH5fuzq2aVSKLc
	vr6nOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjh4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:33:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d352d3b0so1992400137.1
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783852423; x=1784457223; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=CbojTTCYPIyrEjZOgLoCH6Ehv3K9YnTI2AFRGzuyOilaI1k1FqtWBDZabfMyVjRCtC
         ldOIDqnwy532w2PACNiXAGqW4CSAcB50YnoPwRyVsENC4DEaZV7pjH1Rsj5VxARoOQpg
         kF+WDwDmvkyERyKUY9hOSxtIUeOOPjbV6nRkgpNnY5wHPyvORytyr49TlAfMgAvXqQn0
         lgxqp/01fzBPObMIIeo7B99X8wDiBfPErg7kEaF6WXsyIp4KVtRMDNh2h2Y8S8Iz2nXb
         AFOKzzsMUqSEkJZqdKlu6HlpfirbOSPyDaTk29gqvq/WPkt/V86+AbyrR0hyzynPoz3n
         y65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783852423; x=1784457223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=S1uB1KTBxlb09xzIbIto1rWZ/LpLN/3AxGB5wX9nGfUJNA7GQfz83rScAuQMWDNKsv
         54ykOLPHLXB4AdAbwXW499CdzADUP/jNlK9cJbchvCDdg6E5L+2LaTl9jNvmLwttf2FP
         WFNnnSYMMdkyjQUtG9W9c9wsXIaZLywGANGbHKrtQeYcr1VwOGKL+w1sqhdwsf45z+2l
         S6McANXwqilL7iGf4wbF0U4wvCYO0EgJbnSQCj7v2oPvDRO4dM9gcFh5t4JhlbrIguLq
         49gvI1h43v3513hAFrhwKCdz46snaPXLFBnVZYGbow4cicONoprRc/X7d0tfCHC1BPXx
         JDzg==
X-Forwarded-Encrypted: i=1; AHgh+RrerdzcHTnE5Wv5OQJ+RlnbjZdy2blT+KPS9MeGiUf8UnLcQAsfX8XHoQaLp3XOM9M0IKtaXHOnLKwQ0rb4@lists.infradead.org
X-Gm-Message-State: AOJu0YwuaqpR0BBiRfW/+xYfSFt4vE17mxKV3BiyyUYa+Vxs0utCunVl
	ZyHJYShzgGTaUlkDn+A/uGey9eEM4Oh629YCbtFmx4kARaflW/GZlsdx3wYbIaFHWyyxAGRvkU5
	ERxv9/ZzsUdAGer7LT/TwSwDhN+pqgSowtY4ic/EE0lftqy+9HdIKIyFkv7NFrM4SMmP5n+zVeQ
	==
X-Gm-Gg: AfdE7cn2367+Wiz4s/DulPKCfw3gmznyVgqcnVhBxVRvMvDmtnwwR4XKylU6rAlCWfj
	kol5G25TZrWiH48hFCpfMsyVbPD/uyNGO3KR6mvFkfZZChdDA5w8/95ylVGkPZesTob8j4/hFrt
	/z6iDUvbCTB4uAFKUYc503d6LTlI1Rtrd/U0c5yC2PJU3NvhAfpC12pkzCct/UjPleyJxhyYX6S
	QvOsJPOmIFWc3NbUMGhjdKGP+bNiylSszikRyiFlQTVcHNtgF8JBINYi8ZnqIPs0s4xV0u82oL9
	a/FUlV0eyJy1LubuRGMPGb2j0roCb0tFkEBv2VWGYwIvO3xuMKq6zNbPnuz+8Tzr7KKA4BvD6YZ
	MokPl3csmMwVbCu63m+yK62LXTfRtrKErQkH72aC+68GzUECU650z5mAXoP1pq1o5Yeg1rn9z6i
	dzmq4icxsjZZbbyRezPhv4/owE
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749081137.7.1783852423484;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749068137.7.1783852423033;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9fb1csm18390071fa.34.2026.07.12.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:33:40 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:33:37 +0300
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
Message-ID: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a536d88 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=1N1HUszlP5lRL62vBQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: fJI4VX_W9sHcBmd0nG-774tyC9IuQQv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfX4NaNvokUg+2U
 6LiuGeAPfPqF2pdUZ8fSd/XngVTVkqATOM/szFG9V95u5BoCzg/ZwOMMlV+4/ogYE5l3pPBcgME
 lrq1oLHj0H/JCrBU7oeejZGgmkUTSkhCNEe8QEMwo2x/hm2YTOHf6sWpGm+TA45Yyt6FxnQX0OH
 VslVnPEIWoNc0HRLU3XFABgRCzn0cKAtF7pN604zzKlaQcbmGgKTQdjA0+DM1/fMLxX5ohmMNtp
 dZ8Bpk2Eqa/gn40KamZ1TDJ8NgaxwyHUoD+/Fcp+YPxE/+QPa0oU34ANsUBtbK5eAI0FF1+iQ2L
 ZLtbbtnYVA2cfoh/ALE0gBDBtca72DmOHp/TOocxhP1rcN2MQ0ZkAWdl4yQEr0uyT6qw1c3idZH
 9uRvXSp28dRh11r9UjkS0JR4Y1N/Ph5QUwx7c04V139O249DdoNWrNHyCXPEcZe8j+zUXLqLBVY
 1tBtgv3LYMVMDfcBPfw==
X-Proofpoint-GUID: fJI4VX_W9sHcBmd0nG-774tyC9IuQQv5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfX3k5Dv1bthUww
 BhlionA6jP0u+QKzOPSWKzRasM5k6sIwuR4X10lJXda10TCd57Qc91Up6++98FUfOT34Y7e4YfT
 FUz94+FHJbskV6jbgVQUC057h2lZAZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_033345_181715_56277FD7 
X-CRM114-Status: GOOD (  29.60  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMTA6NDg6MDRQTSArMDgwMCwgWW9uZ3hpbmcgTW91IHdy
b3RlOgo+IFRoZSBicmlkZ2UgY29ubmVjdG9yIEhQRCBoYW5kbGluZyBwYXRoIGN1cnJlbnRseSB1
cGRhdGVzCj4gY29ubmVjdG9yLT5zdGF0dXMgZm9yIGV2ZXJ5IGhwZF9ub3RpZnkoKSBpbnZvY2F0
aW9uLgo+IAo+IFRoaXMgZG9lcyBub3Qgd29yayB3ZWxsIGZvciBJUlEtb25seSBub3RpZmljYXRp
b25zIHdoZXJlIHRoZSBldmVudCBiZWluZwo+IHJlcG9ydGVkIGlzIGNhcnJpZWQgYnkgZXh0cmFf
c3RhdHVzIGFuZCBubyBjb25uZWN0b3Igc3RhdHVzIHRyYW5zaXRpb24gaXMKPiBhc3NvY2lhdGVk
IHdpdGggaXQuCj4gCj4gT25lIGV4YW1wbGUgaXMgRFAgTVNULiBIUEQgSVJRcyBhcmUgcHJvcGFn
YXRlZCB0aHJvdWdoCj4gZHJtX2JyaWRnZV9ocGRfbm90aWZ5XyooKSBzbyB0aGF0IGJyaWRnZSBk
cml2ZXJzIGNhbiBwcm9jZXNzIHRoZQo+IG5vdGlmaWNhdGlvbi4gRHVyaW5nIE1TVCBvcGVyYXRp
b24sIGhvd2V2ZXIsIHRoZSBTU1QgY29ubmVjdG9yIGF0dGFjaGVkCj4gdG8gdGhlIGJyaWRnZSBj
b25uZWN0b3IgaXMgaW50ZW50aW9uYWxseSBrZXB0IGRpc2Nvbm5lY3RlZCB3aGlsZSB0aGUgTVNU
Cj4gdG9wb2xvZ3kgbWFuYWdlciBoYW5kbGVzIGFsbCBjb25uZWN0b3IgY3JlYXRpb24sIHJlbW92
YWwgYW5kIGhvdHBsdWcKPiBwcm9jZXNzaW5nLgo+IAo+IFVwZGF0aW5nIGNvbm5lY3Rvci0+c3Rh
dHVzIGZvciBhbiBJUlEtb25seSBNU1Qgbm90aWZpY2F0aW9uIG1heSBjYXVzZQo+IHRoZSBTU1Qg
Y29ubmVjdG9yIHN0YXRlIHRvIG9zY2lsbGF0ZSBiZXR3ZWVuIGNvbm5lY3RlZCBhbmQgZGlzY29u
bmVjdGVkCj4gZGVwZW5kaW5nIG9uIHRoZSBub3RpZmljYXRpb24gcGF0aC4gVGhlc2UgYXJ0aWZp
Y2lhbCBzdGF0ZSB0cmFuc2l0aW9ucwo+IGNhbiBsYXRlciBiZSBkZXRlY3RlZCBieSB0aGUgcG9s
bGluZyBsb2dpYyBhbmQgcmVzdWx0IGluIHVubmVjZXNzYXJ5Cj4gaG90cGx1ZyBldmVudHMgYmVp
bmcgZ2VuZXJhdGVkLiBVc2Vyc3BhY2UgdGhlbiByZS1wcm9iZXMgY29ubmVjdG9yCj4gc3RhdHVz
LCBwb3RlbnRpYWxseSB0cmlnZ2VyaW5nIHRoZSBzYW1lIHNlcXVlbmNlIGFnYWluLgoKVGhlbiB0
aGUgQVBJIG1pZ2h0IG5lZWQgdG8gYmUgYWRqdXN0ZWQuCgpSZW1lbWJlciwgd2UgaGF2ZSB0d28g
dXNlY2FzZXMsIHdoaWNoIHdlIG11c3QgYmUgYWJsZSB0byBpbnRlcnByZXQKY29ycmVjdGx5Ogot
IFRoZSBkcml2ZXIgZ2V0cyBzZXBhcmF0ZSBIUEQgYW5kIElSUV9IUEQgZXZlbnRzLgotIFRoZSBk
cml2ZXIgZ2V0cyBIUEQgYW5kIElSUV9IUEQgYXQgdGhlIHNhbWUgdGltZS4KCj4gCj4gVHJlYXQg
bm90aWZpY2F0aW9ucyB3aXRoIHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX3Vua25vd24gYW5k
IGEgdmFsaWQKPiBleHRyYV9zdGF0dXMgYXMgSVJRLW9ubHkgZXZlbnRzLiBGb3J3YXJkIHRoZSBu
b3RpZmljYXRpb24gdG8gYnJpZGdlCj4gZHJpdmVycyB3aXRob3V0IG1vZGlmeWluZyBjb25uZWN0
b3ItPnN0YXR1cy4KPiAKPiBUaGlzIGtlZXBzIElSUSBkZWxpdmVyeSB3b3JraW5nIHdoaWxlIGxl
YXZpbmcgY29ubmVjdG9yIHN0YXRlIG1hbmFnZW1lbnQKPiB0byB0aGUgY29tcG9uZW50IHRoYXQg
YWN0dWFsbHkgb3ducyBpdCwgc3VjaCBhcyB0aGUgRFAgTVNUIHRvcG9sb2d5Cj4gZnJhbWV3b3Jr
LgoKSG93IGlzIGl0IGhhbmRsZWQgYnkgb3RoZXIgZHJpdmVycyAoaTkxNSwgYW1kLCBub3V2ZWF1
KT8KCj4gCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3hpbmcgTW91IDx5b25neGluZy5tb3VAb3NzLnF1
YWxjb21tLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9j
b25uZWN0b3IuYyB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJp
ZGdlX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25u
ZWN0b3IuYwo+IGluZGV4IDVlZGNhNDdhMDI1Zi4uNzMzNGQ2Njc3NjA0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jCj4gQEAgLTE2Myw2
ICsxNjMsMTggQEAgc3RhdGljIHZvaWQgZHJtX2JyaWRnZV9jb25uZWN0b3JfaGFuZGxlX2hwZChz
dHJ1Y3QgZHJtX2JyaWRnZV9jb25uZWN0b3IgKmRybV9icmkKPiAgCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IgPSAmZHJtX2JyaWRnZV9jb25uZWN0b3ItPmJhc2U7Cj4gIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7Cj4gIAo+ICsJLyoKPiArCSAqIElSUS1v
bmx5IG5vdGlmaWNhdGlvbjogZXh0cmFfc3RhdHVzIGNhcnJpZXMgdGhlIGV2ZW50IGJ1dAo+ICsJ
ICogc3RhdHVzIGlzIHVua25vd24g4oCUIGRvIG5vdCBvdmVyd3JpdGUgY29ubmVjdG9yLT5zdGF0
dXMuCgpCdXQgaXQncyBub3QgdW5rbm93biBhdCB0aGlzIHBvaW50LiBUaGUgY29ubmVjdG9yIHN0
YXR1cyBpcyByZXBvcnRlZApmb2xsb3dpbmcgdGhlIEhQRCBzdGF0dXMuCgo+ICsJICovCj4gKwlp
ZiAoc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93biAmJgo+ICsJICAgIGV4dHJhX3N0
YXR1cyAhPSBEUk1fQ09OTkVDVE9SX05PX0VYVFJBX1NUQVRVUykgewo+ICsJCWRybV9icmlkZ2Vf
Y29ubmVjdG9yX2hwZF9ub3RpZnkoY29ubmVjdG9yLAo+ICsJCQkJCQljb25uZWN0b3ItPnN0YXR1
cywKPiArCQkJCQkJZXh0cmFfc3RhdHVzLCBOVUxMKTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+
ICAJbXV0ZXhfbG9jaygmZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7Cj4gIAljb25uZWN0b3ItPnN0
YXR1cyA9IHN0YXR1czsKPiAgCW11dGV4X3VubG9jaygmZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7
Cj4gCj4gLS0gCj4gMi40My4wCj4gCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
