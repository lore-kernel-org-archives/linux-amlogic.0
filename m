Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9593DC5DF97
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+J0pttqqrnhC22FcbvTubw9j1LuRhpyX+5fZ+c1jCs=; b=35HhlggPIdMnrR
	aiir+2zl2YF7hTVNRErVLbqNJ0jnWpMGu8G0zxtnwI6/EzKOxcWxZ0JlJibp7VQe9MHcxROIESDvV
	XuQMuXbPXJ2oMeMHdxf7JyvLDSOxkdzShhqHk1pfx+zv2ZfsLt7WbZ5hfIMJb0Vq+dfq7hoo+GwsS
	lS6YkgcFu5y+3E6r64us/Az9cTNvGr5lZISaLxtfnDGGrbnlazcGzAn3fIdjyPKus3omr7D4BCkJz
	VsOBmp3fSS8jLVIsLKK8QKJ6aYAO+jVGcp6t2JyjDetKLwam9MU/eMSvEKFHrLvIKSpRavDg+VC4C
	X0M6W+YBVRbE0EH9B3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLAE-0000000Fqud-2gmy;
	Mon, 24 Aug 2026 03:15:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLAC-0000000FqtZ-2HT4
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 03:15:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0n9V61255331
	for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 03:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=; b=KzjesmQM0w9mb9Xo
	xDdnGhSl0dQLjqZsS8WJU+uIBeqbOXwW4KZ0WlCfzEcjqQ2TUdE0cQdPqE1OAzko
	Ms8f5LnYiaJOuBLEvkEUlHahLPqLvgICbL+L4rZXGzBRnMzxXd4uA7ioak4V+v51
	DeAYeVhijIksa08Cwi0EAIfSf5RgPj8v4+Eof3YE2HCj25GbVGwPTGc7JhFrLKPH
	pQsmOQwiH9nNpHOKL+rKyj/5GTGfb+Mem6GT27qF/00Bydg6gqXC02biK9oZ0O8g
	TryLV0BKgh2QMemgcqO3lnGffib3xEy7lHC6vWX06FThH9aPbIxcoaRK5ZKuHW8f
	RYmI9w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f55v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 03:15:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so4524062a91.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787541354; x=1788146154; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=jQMuWvMoSSWhfy3sBQNEv5TR8OBI0Z8Oau8zjypm7syxkokDbAf8QEi5Vyt8HiNR8h
         IsMrKHzPlUoxZzHkdnMZqRlAvqJKIZ7s2LPMvdpWKGGsWlidWfv0byYJSXdKU37Toj5b
         wEryuypoJCyeML6qpJjKreZwGgqlZ3NqJwZQRseDHYajmTdfzywGsCpU0QoTy36PZP9r
         TM7ktH4fA4W2oltsKDcoql1IyMfrQ2d7BJMXvRlNDHir9kRgV3K+BFA/c1qVuPWqdu3C
         M4Rc14GDvEpb/tffG7lNHJxpEP0x+QYccnS9nKLEiVmwoWNVYNw/2U2OP/3cmnUZe8th
         /iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787541354; x=1788146154;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=R6Tf08Nu/NaFxjZFWvSCYH2Gtv2H63L1ceEw/Kw4DiKCJ5Y3F9c9h/rWFHC9E9+YUj
         omTn8TXeSzGNDWh69i+8QO09/nHDO9IwqkBK7UY+3umJZ9ZEChNNOFxwaZjRBoOIa1rp
         Fg69VoggOhN8iFRCYUIllmZRv9DrN6OuA76a0ODkTLf19DR93cAoBEr/Mx1DG2r2p6zz
         h1qnoEaVAXaqn8QZzg2kC9qaWUp3xUpyBi6/L7GbCiwlBLNmcIakjv9kPDEe1FjolBYi
         dPRNtgnWoYuw+dGxlEcmhBO5XdPyxXPYJASDdueXxTQa9+6JzLb5ncyolCeoexrYoeV7
         p/Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rp93QiKDq8yGJHVXDzwXayGPt1OIQnZaI7y+tq/1OcBAlHYeQTzIuy/5sSz5USTqSIXuhE71XWYqCC1fWRa@lists.infradead.org
X-Gm-Message-State: AFuF++mRUjd7K26eUCqMqYdHo8N+zCBo1iW3lGGEzJhIE9z96uqvJv8i
	VzVSbZBFwyqdCB53zTA/l+eC5ndQbngMSblZn3LwLt/nygmrS8AujD5URMPjoBNHg21QQ3yaOuH
	kzYtoE0ZtTXa3sAleKTGkoF9BrHMWwD7J/cV4mOibqdLhOHRm5ooDbPY1EKNubma/gasAYVCG6Q
	==
X-Gm-Gg: AR+sD131MWaP+0JMvwAt0/UFyeqkBQ5nN8gL5YPsp9YImTvrunLWWgwZ7/hxch6kXl3
	bvd03GS3L0G5sYVqJQ+kw26jgAb4ahNa/J8A7OkzZRSpgcH3sj2gRvKc0wmp5WCsnjy0AODhP/2
	cadQGoU27+WXbPorhrENL6Ab/r24t/WEr4D6DXXsLCVMZ796g5UIuuCn4fEzuxapUDScB7yrXoS
	YFzzF5acZ1vqjtaOeGqYNDbRajFFXiyWsqBV/7OH0tuhCRjrMFfr93+AhGnCHYPjJAtUFujvJqd
	sPrvTL9SJm/lvFaDk/GP3OgGIpytStZrP5jLvBZY8yj9Z6kD694O9U8bbcHUL+41YRJM9LPjoal
	5TIJv0UNDKormbxawcn8SJniR4cTLJwMzv++bvBYLV9AIaq+wtTtDr65awTxH0AeWYSLwxUo=
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833581a91.12.1787541354195;
        Sun, 23 Aug 2026 20:15:54 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833494a91.12.1787541353641;
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b2b9c9sm8056616a91.15.2026.08.23.20.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Message-ID: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXyLhltfK8jcl2
 gsYhSepbqrq/cjrLqhHPpAusPvjJ6g5GlqXR2CDqLAEfsHD5ZmzcprVvni+BRbAMRWcMZYkwYg+
 lRxsxbC63wNEo70KzUu41EwVOWFcc1fBD/WaXb7323E6EBO7dQ+JMP2IVScccnXL7DpeoPdPwHT
 jgZqLPW+pIDXd/8sotHk+yrmKNQCthQ9ek7H0rYcloFi7RR2sFCt+5JrUK4ThaILXfPqx+H6XLE
 u3clVigwocwvHlHd+aTSydmpXaLs+Xizp9KXyBtYBpBqvobsBuZ374LleaB7Eldace6Ey3b2nl4
 F1THBplcAgg9tjwnxOnF9wgUmtVCVl8GoG8fkObIZU9+gkpU7JdiZg/AYw//JVU6PM/NUJsYlRO
 sSZwaIE64xh5Ar/ycVKnGNUR9j1wllOSAMs0+whc2/ZHWyR42/M9XE6vIhQ03CabDc8FSdF12QF
 deUJnfapEPiu67BHFwQ==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8bb76b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qQJ8N8Yg66gReXqHpcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXwyEnUUl+SDEJ
 S+AlWbhBZXUrLnYZ4OLE9907vkPdQXBCOrKJxZYbAGdlCgp0xUfhkIPNIBelMgkQSguXoymeHqN
 sDhqC/LeotrZIIgzijGGtFo2YcAX7C4=
X-Proofpoint-GUID: w-S0xcJXxk0soJbLFzHVScPIUFXOAlgH
X-Proofpoint-ORIG-GUID: w-S0xcJXxk0soJbLFzHVScPIUFXOAlgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_201556_690716_B6F818BB 
X-CRM114-Status: GOOD (  36.22  )
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

CgpPbiA4LzIxLzIwMjYgMzoyMCBQTSwgWW9uZ3hpbmcgTW91IHdyb3RlOgo+IAo+IAo+IE9uIDgv
MTgvMjAyNiAxMTowMSBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4gT24gTW9uLCBBdWcg
MTcsIDIwMjYgYXQgMDQ6MDE6NDFQTSArMDgwMCwgWW9uZ3hpbmcgTW91IHdyb3RlOgo+Pj4KPj4+
Cj4+PiBPbiA3LzEyLzIwMjYgNjoyMSBQTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4+PiBP
biBNb24sIEp1biAyOSwgMjAyNiBhdCAxMDo0ODowM1BNICswODAwLCBZb25neGluZyBNb3Ugd3Jv
dGU6Cj4+Pj4+IFRoZSBicmlkZ2UgY29ubmVjdG9yIGZyYW1ld29yayBjdXJyZW50bHkgaW52b2tl
cyBhbGwgYnJpZGdlCj4+Pj4+IGhwZF9ub3RpZnkoKSBjYWxsYmFja3MgYW5kIHVuY29uZGl0aW9u
YWxseSBlbWl0cyBhIGNvbm5lY3RvciBob3RwbHVnCj4+Pj4+IGV2ZW50IGFmdGVyd2FyZHMuCj4+
Pj4+Cj4+Pj4+IEhvd2V2ZXIsIG5vdCBldmVyeSBIUEQgbm90aWZpY2F0aW9uIHJlcXVpcmVzIGEg
dXNlcnNwYWNlIGhvdHBsdWcgCj4+Pj4+IGV2ZW50Lgo+Pj4+Pgo+Pj4+PiBJbiBwYXJ0aWN1bGFy
LCBEUCBNU1QgYnJpZGdlcyBtYXkgdXNlIGhwZF9ub3RpZnkoKSB0byBwcm9wYWdhdGUgSFBEIAo+
Pj4+PiBhbmQKPj4+Pj4gSVJRIG5vdGlmaWNhdGlvbnMgdGhyb3VnaCB0aGUgYnJpZGdlIGNoYWlu
IHdoaWxlIHRoZSBhY3R1YWwgaG90cGx1Zwo+Pj4+PiBoYW5kbGluZyBpcyBwZXJmb3JtZWQgYnkg
dGhlIERSTSBEUCBNU1QgY29yZS4gQ29ubmVjdG9yIGNyZWF0aW9uLAo+Pj4+PiByZW1vdmFsIGFu
ZCB1c2Vyc3BhY2UgaG90cGx1ZyBldmVudHMgYXJlIGFscmVhZHkgbWFuYWdlZCBieSB0aGUgTVNU
Cj4+Pj4+IHRvcG9sb2d5IGZyYW1ld29yay4KPj4+Pj4KPj4+Pj4gQWxsb3cgaHBkX25vdGlmeSgp
IGltcGxlbWVudGF0aW9ucyB0byBzdXBwcmVzcyB0aGUgYnJpZGdlIGNvbm5lY3Rvcgo+Pj4+PiBo
b3RwbHVnIGV2ZW50IGJ5IGludHJvZHVjaW5nIGEgYm9vbCAqc2VuZF9ob3RwbHVnIHBhcmFtZXRl
ci4gRHJpdmVycwo+Pj4+PiBjYW4gY2xlYXIgdGhpcyBmbGFnIHdoZW4gSFBEIHByb2Nlc3Npbmcg
c2hvdWxkIG5vdCByZXN1bHQgaW4gYQo+Pj4+PiBjb25uZWN0b3IgaG90cGx1ZyBub3RpZmljYXRp
b24uCj4+Pj4KPj4+PiBXaHk/IFdvcnN0IGNhc2UgdGhlIGtlcm5lbCByZWNlaXZlcyBhbm90aGVy
IGhvdHBsdWcgbm90aWZpY2F0aW9uIHdoaWNoCj4+Pj4gZ2V0cyBpZ25vcmVkIGJ5IHRoZSBkcml2
ZXIuCj4+Pj4KPj4+IEhpLCB0aGFua3MgZm9yIHJldml3aW5nIHRob3NlIHBhdGNoZXMuCj4+PiBM
ZXQgbWUgdHJ5IHRvIGV4cGxhaW4gdGhlIG1vdGl2YXRpb24uCj4+Pgo+Pj4gU2VtYW50aWNhbGx5
LCBJUlFfSFBEIGlzIGp1c3QgYW4gSVJRIG5vdGlmaWNhdGlvbiwgbm90IGEgY29ubmVjdGlvbiAK
Pj4+IHN0YXRlCj4+PiB0cmFuc2l0aW9uLCBhbmQgc2hvdWxkbid0IGJlIHR1cm5lZCBpbnRvIGEg
dXNlcnNwYWNlIGhvdHBsdWcgaW4gdGhlIAo+Pj4gZmlyc3QKPj4+IHBsYWNlLiBIb3dldmVyLCBk
cm1fYnJpZGdlX2Nvbm5lY3Rvcl9oYW5kbGVfaHBkKCkgY3VycmVudGx5IGNhbGxzCj4+PiBkcm1f
a21zX2hlbHBlcl9jb25uZWN0b3JfaG90cGx1Z19ldmVudCgpIHVuY29uZGl0aW9uYWxseSBhZnRl
ciAKPj4+IHByb2Nlc3NpbmcKPj4+IHRoZSBldmVudCwgc28gZXZlcnkgSVJRX0hQRCBlbmRzIHVw
IHJlcG9ydGVkIGFzIGEgaG90cGx1Zy4KPj4KPj4gV2hhdCBpZiB0aGUgSVJRX0hQRCBpcyBkZWxp
dmVyZWQgdG9nZXRoZXIgd2l0aCB0aGUgZmlyc3QgSFBEIGV2ZW50IChmb3IKPj4gZXhhbXBsZSBi
ZWNhdXNlIG9mIHRoZSBUQ1BNIHByb2Nlc3NpbmcgdGhvc2UgZXZlbnRzKT8gU2VlIHRoZSBtZWNo
YW5pc20KPj4gaW4gdGhlIGRpc3BsYXlwb3J0LmMgQWx0TW9kZSBkcml2ZXIuCj4+Cj4gVGhlIERS
TSBBUEkgc2hvdWxkIHNpbXBseSBwYXNzIGJvdGggbG9uZyBIUEQgSVJRcyBhbmQgc2hvcnQgSFBE
IElSUXMgdG8gCj4gdGhlIGRyaXZlciBhcyB0aGV5IGFyZSwgYW5kIGxldCB0aGUgZHJpdmVyIGRl
Y2lkZSBob3cgdG8gaGFuZGxlIHRoZW0uIAo+IEJhc2VkIG9uIG15IHJldmlldyBvZiB0aGUgaW1w
bGVtZW50YXRpb25zIGZyb20gYWxsIHRocmVlIHZlbmRvcnMsIHdoZW4gCj4gbG9uZyBhbmQgc2hv
cnQgSFBEIElSUXMgb2NjdXIgc2ltdWx0YW5lb3VzbHksIHRoZSBsb25nIEhQRCBJUlEgaXMgYWx3
YXlzIAo+IGhhbmRsZWQgZmlyc3QsIGZvbGxvd2VkIGJ5IHRoZSBzaG9ydCBIUEQgSVJRLgo+IAo+
IEkgaGF2ZSBhbm90aGVyIHRob3VnaHQgcmVnYXJkaW5nIHRoZSBjdXJyZW50IERSTSBBUEkuIENv
dWxkIHdlIGhhdmUgdGhlIAo+IERSTSBsYXllciBwYXNzIG9ubHkgdGhlIEhQRCBldmVudCBpbmZv
cm1hdGlvbiAobG9uZyBJUlEgYW5kL29yIHNob3J0IAo+IElSUSkgaW5zdGVhZCBvZiBjb25uZWN0
b3Igc3RhdHVzLCBhbmQgbGVhdmUgYWxsIGhhbmRsaW5nIGRlY2lzaW9ucyB0byAKPiB0aGUgZHJp
dmVyPyBUaGUgRFJNIGNvcmUgd291bGQgc2ltcGx5IHJlcG9ydCBMT05HX0hQRCB8IFNIT1JUX0hQ
RCwgYW5kIAo+IGVhY2ggZHJpdmVyIGNvdWxkIGRlY2lkZSBob3cgdG8gcHJvY2VzcyB0aGUgZXZl
bnQuIFRoaXMgc2VlbXMgbGlrZSBhIAo+IHBhdHRlcm4gdGhhdCBjb3VsZCBiZSBzaGFyZWQgYWNy
b3NzIGRpZmZlcmVudCBkcml2ZXJzLgo+IAo+IFRoaXMgaXMganVzdCBteSBjdXJyZW50IHVuZGVy
c3RhbmRpbmcuIFBsZWFzZSBsZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCAKPiBhbnl0aGluZyBv
ciBnb3Qgc29tZXRoaW5nIHdyb25nLiBUaGFua3MuClNvcnJ5LCBhZnRlciB0aGlua2luZyBhYm91
dCBpdCBhZ2FpbiwgdGhpcyBpZGVhIGlzIG5vdCBmdW5kYW1lbnRhbGx5IApkaWZmZXJlbnQgZnJv
bSB5b3VyIGN1cnJlbnQgYXBwcm9hY2guIEluIHRoZSBlbmQsIHdlIHN0aWxsIG5lZWQgdG8gCmhh
bmRsZSBIUEQgc3RhdGUgdHJhbnNpdGlvbnMgaW4gdGhlIGRyaXZlci4gSXQgc2VlbXMgbXkgcHJl
dmlvdXMgCnN1Z2dlc3Rpb24gZG9lcyBub3QgcmVhbGx5IHNpbXBsaWZ5IHRoZSBwcm9ibGVtLCBz
byBJIGFwb2xvZ2l6ZSBpZiBpdCAKaGFzIGNhdXNlZCBhbnkgY29uZnVzaW9uIG9yIG1pc2xlZCB0
aGUgZGlzY3Vzc2lvbi4KPj4+IFNlY29uZCwgTVNUIElSUV9IUEQgaXMgbGV2ZWwtc3RpY2t5IC0t
IGFzIGxvbmcgYXMgdGhlIEFDSyBoYXMgbm90IGJlZW4KPj4+IGNsZWFyZWQsIHRoZSBJUlEga2Vl
cHMgZmlyaW5nIHJlcGVhdGVkbHksIGFuZCBNU1QgYnJpbmctdXAgKGxpbmsgCj4+PiB0cmFpbmlu
Zwo+Pj4gLyBNU1QgZW5hYmxlIGhhbmRzaGFrZSkgaXRzZWxmIGdlbmVyYXRlcyBhIGJ1cnN0IG9m
IElSUV9IUERzLiBTbyB0aGlzIGlzCj4+PiBub3QgYWJvdXQgIm9uZSBleHRyYSBob3RwbHVnIiwg
YnV0IGFib3V0IGEgYnVyc3Qgb2YgdGhlbSB3aXRoaW4gYSBzaG9ydAo+Pj4gd2luZG93Lgo+Pgo+
PiBPaywgaWYgaXQgaXMgbGV2ZWwtc3RpY2t5LCBpdCBzaG91bGQgYmUgaGFuZGxlZCBhcyBzdWNo
Lgo+Pgo+Pj4KPj4+IEV2ZXJ5IG9uZSBvZiB0aG9zZSBob3RwbHVncyBpcyBkZWxpdmVyZWQgdG8g
dXNlcnNwYWNlIHZpYSB1ZGV2IGFuZAo+Pj4gcHJvbXB0cyB0aGUgY29tcG9zaXRvciB0byByZS1w
cm9iZSB0aGUgY29ubmVjdG9yLiBJbiB0aGUgd2luZG93IGJlZm9yZQo+Pj4gbXN0X2FjdGl2ZSBp
cyBzZXQsIHRoYXQgcmUtcHJvYmUgd2Fsa3MgYmFjayBpbnRvIG1zbV9kcF9icmlkZ2VfZGV0ZWN0
KCkKPj4+IGFuZCBwZXJmb3JtcyBhdXgvRFBDRCBhY2Nlc3NlcywgcmFjaW5nIHdpdGggdGhlIE1T
VCBlbmFibGUgZmxvdy4KPj4KPj4gSWYgdGhlcmUgaXMgYSByYWNlLCB0aGUgcGF0aCBuZWVkcyB0
byBoYXZlIGEgbG9jaywgcHJldmVudGluZyBjb25jdXJyZW50Cj4+IGFjY2Vzcy4gT3RoZXJ3aXNl
LCB5b3UgYXJlIGp1c3Qgc2hvcnRlbmluZyB0aGUgd2luZG93IGluc3RlYWQgb2Ygc29sdmluZwo+
PiB0aGUgcHJvYmxlbS4KPj4KPj4+Cj4+PiBUaGUgYW1wbGlmaWNhdGlvbiBhbHNvIGlzbid0IGxp
bWl0ZWQgdG8gYSBzaW5nbGUgY29ubmVjdG9yOiBvbiBIYW1vYQo+Pj4gdGhlcmUgYXJlIDQgY29u
bmVjdG9ycyAoM3ggRFAgKyBlRFApLCBhbmQgd2Ugb2JzZXJ2ZSB0aGF0IGEgaG90cGx1ZyBvbgo+
Pj4gYW55IG9uZSBjb25uZWN0b3IgY2F1c2VzIHRoZSBjb21wb3NpdG9yIHRvIHJlLXF1ZXJ5IGFs
bCA0LiBTbyB0aGlzIGJ1cnN0Cj4+Cj4+IFBsZWFzZSBmaXggdGhlIGNvbXBvc2l0b3IsIGl0IHNo
b3VsZCBub3QgbmVlZCB0byBxdWVyeSBhbGwgNCBjb25uZWN0b3JzCj4+IGlmIHRoZSBIUEQgZXZl
bnQgY2FtZSBmcm9tIHRoZSBzaW5nbGUgb25lLgo+Pgo+Pj4gb2Ygc3B1cmlvdXMgSVJRX0hQRHMg
ZHVyaW5nIE1TVCBlbmFibGUgZW5kcyB1cCBhbXBsaWZpZWQgYWNyb3NzIHRoZQo+Pj4gd2hvbGUg
Y2FyZC4KPj4KPj4gSG93IGRvIGk5MTUsIGFtZGdwdSBhbmQgbm91dmVhdSByZXNwb25kIHRvIElS
UV9IUEQ/IFdoZW4gZG8gdGhleSBzZW5kCj4+IHRoZSBIUEQgZXZlbnQgdG8gdGhlIHVzZXJzcGFj
ZT8KPj4KPiBUaGUgZHJpdmVyIHJldmFsaWRhdGVzIHRoZSBhY3R1YWwgY29ubmVjdG9yIHN0YXRl
LCBhbmQgYSBob3RwbHVnIGV2ZW50IAo+IGlzIHRyaWdnZXJlZCBvbmx5IHdoZW4gYW4gYWN0dWFs
IGNvbm5lY3RvciBzdGF0ZSBjaGFuZ2Ugb3IgYSBsaW5rIHN0YXR1cyAKPiBjaGFuZ2UgaXMgZGV0
ZWN0ZWQuCj4+Pj4+IEEgTlVMTCBwb2ludGVyIGluZGljYXRlcyB0aGF0IGhvdHBsdWcgc3VwcHJl
c3Npb24gaXMgbm90IHN1cHBvcnRlZCBieQo+Pj4+PiB0aGUgY2FsbGVyLCBzdWNoIGFzIHRoZSBj
b25uZWN0b3IgZGV0ZWN0IHBvbGxpbmcgcGF0aC4KPj4+Pgo+Pj4+IEFuZCBub3RoaW5nIGluIHRo
aXMgcGF0Y2ggbWFrZXMgYW55IHVzZSBvZiBpdC4gSSdkIHNheSwgaXQncwo+Pj4+IHF1ZXN0aW9u
YWJsZSBhZGRpdGlvbi4gTGV0IG1lIGNoZWNrIG90aGVyIHBhdGNoZXMuLi4KPj4+Pgo+Pj4gWW91
IGFyZSByaWdodCwgSSB3aWxsIHJlb3JnYW5pemUgdGhlIHBhdGNoZXMgaW4gbmV4dCBwYXRjaHNl
dC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3hpbmcgTW91IDx5b25neGluZy5tb3VA
b3NzLnF1YWxjb21tLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sb250aXVtLWx0OTYxMXV4Yy5jwqDCoMKgwqAgfMKgIDMgKystCj4+Pj4+IMKgwqAgZHJp
dmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25uZWN0b3IuYyB8IDE1ICsrKysrKysr
Ky0tLS0tLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hk
bWkuY8KgwqDCoMKgIHzCoCAzICsrLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAv
ZHBfZGlzcGxheS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0KPj4+Pj4gwqDCoCBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2RybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzICsrLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1p
NC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0KPj4+Pj4gwqDCoCBpbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMyArKy0KPj4+Pj4gwqDCoCA3IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pgo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
