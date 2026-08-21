Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2166CC5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFA+5n8zdM6Zw0tzoHJb7SE4ALX91feWAa3CLS0leAk=; b=25kkeBGGyOXGKH
	3Lu0oQLmP+R8P86jBI0iyy5hxQgUuQNhk9DRY0DTJtO53WaFaFlZQK8EmbZL8w1E0WAJXHgUa01d4
	fAccMagS/SeHlmFcPf/plCQlvbck+T76CmnQRRCakvUiX1xu0j7B/S2MOn12dmPeCRt1F9N71byTu
	b5UTHUrGUMtbufjfRheoFuZFPWgch5//3JvPsdeodBVBi6uk5CoBS16voXT1xQVFR7MoE6xGq5/cP
	l7tSKeh9LhksWviFvYmW6e44IyydlTOpFdjI148qcYylI/xwuGWTGKu2/h46qsd9YJUkKiPQLGJyh
	Rd62FiDuvBCghvYwElzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJXg-0000000Cggy-2yxC;
	Fri, 21 Aug 2026 07:19:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJXd-0000000Cgfz-2KTZ
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:19:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TRpN2505750
	for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 07:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=; b=hCHstRNA18/xpbzW
	rH0Hyh5P+2cxZa0fKW3XqAeDoHr+qFAqfnecDBL8CI0ZZaxN4AmZbWFMzUV+sudJ
	m73mV+viSvAgN5Fj3KeE70JSFCKIMK/p9+JYsTGXrzcb52JTGN9qxiEvrisCEHqE
	ZxQ62/+C+OrVlvdYi8qx1T+Mt1fZ79l3Xd5VJhy+KO0x8lKZv4e1vKBpbnwnU835
	gI1D841Va1jsl43Hv26e+epQkA6ovbg3otXjKKJ5bnZIRey9L8Cbc34OmnDa2kig
	Y7V9abvfpGKBUNulmd9evGmTfsxCj8aTWgY40S3p8ldH7OOKfH/9DwQBIhGiEF9+
	f4rxpQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9rhfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 07:19:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so935139a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787296791; x=1787901591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=GL1juuf85nMLTMTgS0gZfhbbXn3xZtDW4M66BD6F8df5UOWFMJbccigGzL9AuP9Ft0
         gj1KRuN1t47Tk5k6iEtwXNQCoSE8+CC2AqalBPymvcqz2NexTxGlDL/OKrCPxAjyKUVv
         8aYI9ySAuZZPW5tbe4nU5URhYPUG3rKsv1J8a49JhB7w1lqKWUEh5Y4zPiPo4kghUGBT
         xQAQOpg5cglZ6IS7bSOfQXCZF/KnoLYtZmptcG6CSfGBWyb7urdTmHWiXbaHvG2gyP00
         2skjqPQFyCGZQZbxlo2N3aBpH2CipvYNac6WfvVRxroS5kSHPTbG3X7ellLaAcH5wM/V
         ZOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296791; x=1787901591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=RQf9kmuAXmG1BzxDo+mCcDL/UCoxHRO1YYtR6Lw2nRCmB0Wy8EtewQkRbR3Qv3Rs45
         HxGK+IY8GW92pjYHu7wIo3o3jMyeDjgxdNl1KWOMZhxarPAz4DQgurJeCSwGwlOpxHk8
         95WF87mYDRaW29e/BN4fFUmPIzRhQot2Rq9bmHk65tchKyR9YDmfs8cYhK5ZOuEv9dD2
         e8PVfGy0+MzWTSWmWjYUHjmnICcl8hQxJkjblh+bIGejQK/3O77D1+fFOTI2SE4kNyae
         kSKcrc7sYqxZ4F2KO3KNhvtsfFJL4gyma6lC/fyz8p0qSQvE9Nyi/iGdVWhLlL0jx0Ki
         xfFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsv/V6SOcZ7hpD4oe7m9yoV9IFeqPSTu9Sg5P662q4bacV374eLe3XtNOaWShUmt8O0mg9EgbUioLjbOG1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuhrlt5F1QUl+E2i+hY2ACl7rJfFArlZzBC8LW+6FlHRPlKAHt
	FEI4fqdZWgRaQLJ/KixKfZ73/az13DWo+ysZFwbm08m4Vzn1hooxoJ5dCqz5n6kkMa9NmX3Rk51
	3MWZhSARV9IKKfrpEFq5upwQhyQXasV0wn/h4yeLww3bumXg1/RO0jhoY8pxyETbDj9yoevYdVg
	==
X-Gm-Gg: AR+sD131GOsNSY6ELTlfIXcLsPxUq4hgqMuYx+poXEzBXUu4k4Jr3ZSTzMlg2UVDhiF
	MurB+aL8+j3ppWLjVzwOh8/3mvxzRnCx3W9pyLM60xDZDq7oz65YVvy0HjE/STCuzOv4QTC9XrH
	y6p3Q5XpC0iZYhZe1jwvFgZYLEoSdEd8OMu0Kye2c6x8noeXr1C9UYNnPe/2aFRbqCdpcwzdVTE
	RXco01JNc82sNpn0J76ShapkpvpdqbWFKJ02W3l4eQ3MtIRSiv01znrL7dJTe6TkBYbbc1/ZSBs
	KEWbZchHex1g8DeH6DbjyTRjSN60uH7GxTrF3trdrAKwyaO9bCcioeiNtBdZfibl8JS50Fjh1SV
	6TsW5J6tM4MIiPejOHPYOYllLQrqB9sZLGXDe4e3x4n17jAuWikp3ZdX+7KylxDgH/xCzWmI=
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601543637.17.1787296791428;
        Fri, 21 Aug 2026 00:19:51 -0700 (PDT)
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601457637.17.1787296790940;
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm2507523a12.14.2026.08.21.00.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Message-ID: <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
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
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
 <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX1aXucJ4HVJW5
 GaXJ4dguWG0G2lRDfenIYxk84rh7BJdKY2W1tfxp24eApKWiIPz7gKX5sCtRP1SMxYEb4W5IEk+
 tlTND/XGOPMnezDuyPCFCRVfM1ypxzdBJ617jlTT7gj9XIlSNz7rP2rdktCf4W3qg3LCVZsoLQx
 XgGfWEJuUX4wBrugnGLMKDQaue6Z5cCv7SLn/vDeSnKiu7q7Gg7hRJBySjtVsqc8Jw2yQLpmXW5
 nsy2Trj0qT/VMJe+r2lwR1glG9ql6EaO1ntsD73ktFMIsUX777VUbe+I5UkklDWCU3bdffArrwd
 faT9ttwVP9QZ7cU8O9NajQZnW00pKvKojUeToPyjY8ikCz+jJZbsks+yyrzgCif7Eqi8zH6wZrZ
 T4CJjvw3iSi6qa7TvsFv5cRo2+Vqw/mV43ZLISBDe5LZCO9BCYMSDpdDfV/7fCjgN2M1GV+yTRR
 wLNIJ77HVmBQoNtr2Nw==
X-Proofpoint-ORIG-GUID: xum58AjeV9-JNlMGKwkL2wcCErpfmQCa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX7OKp2gZiuw2j
 /fZQUGj3kCMzoCVqZinVpIqAm51wS+LSRZmRynRcO1tgBdK5OwG7lSDUhjTToJU7FkCLoima+Kg
 aZIQLTaadh6pa2sbC5vLNUdwHpRnhKk=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a87fc18 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=OBMPMDKBgAqnNWYQCGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: xum58AjeV9-JNlMGKwkL2wcCErpfmQCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001953_608450_2BF7973C 
X-CRM114-Status: GOOD (  43.91  )
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

CgpPbiA4LzE4LzIwMjYgMTE6MTggQU0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4gT24gTW9u
LCBBdWcgMTcsIDIwMjYgYXQgMDQ6MDI6MzFQTSArMDgwMCwgWW9uZ3hpbmcgTW91IHdyb3RlOgo+
Pgo+Pgo+PiBPbiA3LzEyLzIwMjYgNjozMyBQTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4+
IE9uIE1vbiwgSnVuIDI5LCAyMDI2IGF0IDEwOjQ4OjA0UE0gKzA4MDAsIFlvbmd4aW5nIE1vdSB3
cm90ZToKPj4+PiBUaGUgYnJpZGdlIGNvbm5lY3RvciBIUEQgaGFuZGxpbmcgcGF0aCBjdXJyZW50
bHkgdXBkYXRlcwo+Pj4+IGNvbm5lY3Rvci0+c3RhdHVzIGZvciBldmVyeSBocGRfbm90aWZ5KCkg
aW52b2NhdGlvbi4KPj4+Pgo+Pj4+IFRoaXMgZG9lcyBub3Qgd29yayB3ZWxsIGZvciBJUlEtb25s
eSBub3RpZmljYXRpb25zIHdoZXJlIHRoZSBldmVudCBiZWluZwo+Pj4+IHJlcG9ydGVkIGlzIGNh
cnJpZWQgYnkgZXh0cmFfc3RhdHVzIGFuZCBubyBjb25uZWN0b3Igc3RhdHVzIHRyYW5zaXRpb24g
aXMKPj4+PiBhc3NvY2lhdGVkIHdpdGggaXQuCj4+Pj4KPj4+PiBPbmUgZXhhbXBsZSBpcyBEUCBN
U1QuIEhQRCBJUlFzIGFyZSBwcm9wYWdhdGVkIHRocm91Z2gKPj4+PiBkcm1fYnJpZGdlX2hwZF9u
b3RpZnlfKigpIHNvIHRoYXQgYnJpZGdlIGRyaXZlcnMgY2FuIHByb2Nlc3MgdGhlCj4+Pj4gbm90
aWZpY2F0aW9uLiBEdXJpbmcgTVNUIG9wZXJhdGlvbiwgaG93ZXZlciwgdGhlIFNTVCBjb25uZWN0
b3IgYXR0YWNoZWQKPj4+PiB0byB0aGUgYnJpZGdlIGNvbm5lY3RvciBpcyBpbnRlbnRpb25hbGx5
IGtlcHQgZGlzY29ubmVjdGVkIHdoaWxlIHRoZSBNU1QKPj4+PiB0b3BvbG9neSBtYW5hZ2VyIGhh
bmRsZXMgYWxsIGNvbm5lY3RvciBjcmVhdGlvbiwgcmVtb3ZhbCBhbmQgaG90cGx1Zwo+Pj4+IHBy
b2Nlc3NpbmcuCj4+Pj4KPj4+PiBVcGRhdGluZyBjb25uZWN0b3ItPnN0YXR1cyBmb3IgYW4gSVJR
LW9ubHkgTVNUIG5vdGlmaWNhdGlvbiBtYXkgY2F1c2UKPj4+PiB0aGUgU1NUIGNvbm5lY3RvciBz
dGF0ZSB0byBvc2NpbGxhdGUgYmV0d2VlbiBjb25uZWN0ZWQgYW5kIGRpc2Nvbm5lY3RlZAo+Pj4+
IGRlcGVuZGluZyBvbiB0aGUgbm90aWZpY2F0aW9uIHBhdGguIFRoZXNlIGFydGlmaWNpYWwgc3Rh
dGUgdHJhbnNpdGlvbnMKPj4+PiBjYW4gbGF0ZXIgYmUgZGV0ZWN0ZWQgYnkgdGhlIHBvbGxpbmcg
bG9naWMgYW5kIHJlc3VsdCBpbiB1bm5lY2Vzc2FyeQo+Pj4+IGhvdHBsdWcgZXZlbnRzIGJlaW5n
IGdlbmVyYXRlZC4gVXNlcnNwYWNlIHRoZW4gcmUtcHJvYmVzIGNvbm5lY3Rvcgo+Pj4+IHN0YXR1
cywgcG90ZW50aWFsbHkgdHJpZ2dlcmluZyB0aGUgc2FtZSBzZXF1ZW5jZSBhZ2Fpbi4KPj4+Cj4+
PiBUaGVuIHRoZSBBUEkgbWlnaHQgbmVlZCB0byBiZSBhZGp1c3RlZC4KPj4+Cj4+PiBSZW1lbWJl
ciwgd2UgaGF2ZSB0d28gdXNlY2FzZXMsIHdoaWNoIHdlIG11c3QgYmUgYWJsZSB0byBpbnRlcnBy
ZXQKPj4+IGNvcnJlY3RseToKPj4+IC0gVGhlIGRyaXZlciBnZXRzIHNlcGFyYXRlIEhQRCBhbmQg
SVJRX0hQRCBldmVudHMuCj4+PiAtIFRoZSBkcml2ZXIgZ2V0cyBIUEQgYW5kIElSUV9IUEQgYXQg
dGhlIHNhbWUgdGltZS4KPj4+Cj4+IE9oaCB5ZXMsIGhlcmUgbmVlZCB0byByZXdvcmsuCj4+Pj4K
Pj4+PiBUcmVhdCBub3RpZmljYXRpb25zIHdpdGggc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNf
dW5rbm93biBhbmQgYSB2YWxpZAo+Pj4+IGV4dHJhX3N0YXR1cyBhcyBJUlEtb25seSBldmVudHMu
IEZvcndhcmQgdGhlIG5vdGlmaWNhdGlvbiB0byBicmlkZ2UKPj4+PiBkcml2ZXJzIHdpdGhvdXQg
bW9kaWZ5aW5nIGNvbm5lY3Rvci0+c3RhdHVzLgo+Pj4+Cj4+Pj4gVGhpcyBrZWVwcyBJUlEgZGVs
aXZlcnkgd29ya2luZyB3aGlsZSBsZWF2aW5nIGNvbm5lY3RvciBzdGF0ZSBtYW5hZ2VtZW50Cj4+
Pj4gdG8gdGhlIGNvbXBvbmVudCB0aGF0IGFjdHVhbGx5IG93bnMgaXQsIHN1Y2ggYXMgdGhlIERQ
IE1TVCB0b3BvbG9neQo+Pj4+IGZyYW1ld29yay4KPj4+Cj4+PiBIb3cgaXMgaXQgaGFuZGxlZCBi
eSBvdGhlciBkcml2ZXJzIChpOTE1LCBhbWQsIG5vdXZlYXUpPwo+Pj4KPj4gaTkxNSwgYW1kZ3B1
LCBhbmQgbm91dmVhdSBkb24ndCBnbyB0aHJvdWdoIHRoZSBkcm1fYnJpZGdlX2hwZF9ub3RpZnko
KQo+PiBicmlkZ2UgY2hhaW4gLS0gdGhlaXIgRFAgY29udHJvbGxlcnMgYXJlIGludGVncmF0ZWQg
aW50byB0aGUgU29DLCBhbmQKPj4gSFBEIGludGVycnVwdHMgYXJlIGhhbmRsZWQgZGlyZWN0bHkg
aW4gdGhlaXIgb3duIGVuY29kZXIgY29kZS4KPj4KPj4gTVNNIERQIGlzIGRpZmZlcmVudCBpbiB0
aGF0IEhQRCBjb21lcyBmcm9tIFR5cGUtQyAvIHBtaWNfZ2xpbmsgYWx0bW9kZQo+PiB2aWEgYXV4
LWhwZC1icmlkZ2UsIHNvIGl0IGhhcyB0byBnbyB0aHJvdWdoIHRoZSBicmlkZ2UgY2hhaW4sIHdo
aWNoCj4+IG1lYW5zIHRoaXMgc2VtYW50aWMgbmVlZHMgdG8gYmUgZXh0ZW5kZWQgdG8gdGhlIGJy
aWRnZSBBUEkuCj4gCj4gU3RpbGwsIHdoZW4gZG8gdGhvc2UgZHJpdmVycyBzZW5kIHRoZSBIUEQg
ZXZlbnQgaW4gY2FzZSBvZiBJUlFfSFBEPyBPcgo+IGlzIGl0IHRoYXQgaW4gdGhlaXIgY2FzZSBJ
UlFfSFBEIGp1c3QgdHJpZ2dlcnMgaW5uZXIgbG9naWMgdG8gcmVyZWFkIHRoZQo+IHN0YXR1cyBy
ZWdpc3RlcnMgYW5kIHRoZW4gdGhlIGRyaXZlciBzZW5kcyB0aGUgSFBEIGlmIHRoZXJlIGlzIGFu
eQo+IGFjdHVhbCBjaGFuZ2U/Cj4gClNvIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCxJUlFfSFBE
IGlzIHByaW1hcmlseSB1c2VkIHRvIHRyaWdnZXIgCmludGVybmFsIHN0YXR1cyByZXZhbGlkYXRp
b24uIEEgaG90cGx1ZyBldmVudCBpcyBvbmx5IGdlbmVyYXRlZCBpZiB0aGF0IApwcm9jZXNzaW5n
IGNvbmNsdWRlcyB0aGF0IHRoZXJlIGhhcyBiZWVuIGFuIGFjdHVhbCBjb25uZWN0b3Igb3IgdG9w
b2xvZ3kgCnN0YXRlIGNoYW5nZS4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25neGluZyBNb3UgPHlv
bmd4aW5nLm1vdUBvc3MucXVhbGNvbW0uY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMgfCAxMiArKysrKysrKysrKysKPj4+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jCj4+Pj4gaW5kZXggNWVk
Y2E0N2EwMjVmLi43MzM0ZDY2Nzc2MDQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2Rpc3BsYXkvZHJtX2JyaWRnZV9jb25uZWN0b3IuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMKPj4+PiBAQCAtMTYzLDYgKzE2MywxOCBA
QCBzdGF0aWMgdm9pZCBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9oYW5kbGVfaHBkKHN0cnVjdCBkcm1f
YnJpZGdlX2Nvbm5lY3RvciAqZHJtX2JyaQo+Pj4+ICAgIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yID0gJmRybV9icmlkZ2VfY29ubmVjdG9yLT5iYXNlOwo+Pj4+ICAgIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7Cj4+Pj4gKwkvKgo+Pj4+ICsJICogSVJR
LW9ubHkgbm90aWZpY2F0aW9uOiBleHRyYV9zdGF0dXMgY2FycmllcyB0aGUgZXZlbnQgYnV0Cj4+
Pj4gKwkgKiBzdGF0dXMgaXMgdW5rbm93biDigJQgZG8gbm90IG92ZXJ3cml0ZSBjb25uZWN0b3It
PnN0YXR1cy4KPj4+Cj4+PiBCdXQgaXQncyBub3QgdW5rbm93biBhdCB0aGlzIHBvaW50LiBUaGUg
Y29ubmVjdG9yIHN0YXR1cyBpcyByZXBvcnRlZAo+Pj4gZm9sbG93aW5nIHRoZSBIUEQgc3RhdHVz
Lgo+Pj4KPj4gWW91IGFyZSByaWdodCwgaW4gdGhlIFNTVCBjYXNlIHRoZSBicmlkZ2VfY29ubmVj
dG9yIHN0YXR1cyBkb2VzIGZvbGxvdwo+PiBIUEQgLyBsaW5rIHN0YXR1cyAtLSBiZWNhdXNlIHRo
ZSBicmlkZ2VfY29ubmVjdG9yIGl0c2VsZiByZXByZXNlbnRzCj4+IHRoYXQgU1NUIGNvbm5lY3Rv
ciwgc28gaXRzIHN0YXR1cyBuYXR1cmFsbHkgaXMgdGhlIGxpbmsgc3RhdHVzLgo+Pgo+PiBUaGUg
TVNUIGNhc2UgaGFzIGEga2V5IGRpZmZlcmVuY2UgdGhvdWdoOiB0aGUgU1NUIGNvbm5lY3RvciBt
dXN0IGJlCj4+IGV4cGxpY2l0bHkgbWFya2VkIGRpc2Nvbm5lY3RlZCAodG8gcHJldmVudCB0aGUg
RFJNIGZyYW1ld29yayBmcm9tCj4+IGVuYWJsaW5nIGl0KSwgY29uc2lzdGVudCB3aXRoIHdoYXQg
aTkxNSwgYW1kZ3B1IGFuZCBub3V2ZWF1IGRvLiBJbgo+PiBvdGhlciB3b3Jkcywgb25jZSBNU1Qg
aXMgZW5hYmxlZCwgdGhlIFNTVCBjb25uZWN0b3IgdGhhdCB0aGUKPj4gYnJpZGdlX2Nvbm5lY3Rv
ciByZXByZXNlbnRzIG5vIGxvbmdlciBlcXVhdGVzIHRvIHRoZSBsaW5rIHN0YXR1cyAtLQo+PiB0
aGUgcmVhbCBsaW5rIGlzIG1hbmFnZWQgYnkgdGhlIE1TVCB0b3BvbG9neSwgYW5kIHRoZSBTU1Qg
Y29ubmVjdG9yCj4+IGlzIGp1c3QgYSBwbGFjZWhvbGRlciBhdCB0aGF0IHBvaW50Lgo+IAo+IFRo
aXMgaXMgZmluZS4KPiAKPj4KPj4gVGhlIGlzc3VlIGlzIHRoYXQgSVJRX0hQRCBzdGlsbCB0cmF2
ZWxzIHRocm91Z2ggdGhlIGJyaWRnZV9jb25uZWN0b3IKPj4gY2hhaW4gYW5kIHRha2VzIHRoZSBv
bGQgInVwZGF0ZSB0aGUgU1NUIGNvbm5lY3RvcidzIHN0YXR1cyAtPiBlbWl0Cj4+IGhvdHBsdWci
IHBhdGguIFVuZGVyIE1TVCB0aGF0IHJ1bnMgaW50byB0d28gY29uc3RyYWludHMgLS0gYW5kIHRo
aXMKPj4gaXMgZXhhY3RseSB3aGF0IHRoaXMgc2VyaWVzIGlzIHRyeWluZyB0byBhZGRyZXNzOgo+
Pgo+PiAxLiBUaGUgU1NUIGNvbm5lY3RvciByZXByZXNlbnRlZCBieSBicmlkZ2VfY29ubmVjdG9y
IG5vIGxvbmdlciBzdGFuZHMKPj4gICAgIGZvciB0aGUgbGluaywgc28gaXRzIHN0YXR1cyBtdXN0
IG5vdCBiZSBvdmVyd3JpdHRlbiBieSBJUlFfSFBECj4+ICAgICBldmVudHMuCj4+IDIuIElSUV9I
UEQgbmVlZHMgYSBjbGVhbiBwYXRoIHRoYXQgZG9lcyBub3QgdHJpZ2dlciBhIGhvdHBsdWcgb24g
dGhlCj4+ICAgICBicmlkZ2VfY29ubmVjdG9yIC0tIHRoZSBNU1QgZnJhbWV3b3JrIGFscmVhZHkg
bWFuYWdlcyBob3RwbHVncwo+PiAgICAgaW5kZXBlbmRlbnRseS4KPj4KPj4gVXNpbmcgY29ubmVj
dG9yX3N0YXR1c191bmtub3duIGFzIGEgc2VudGluZWwgaGVyZSBkb2VzIGZlZWwgYSBiaXQgb2Rk
Owo+PiBsZXQgbWUgdGhpbmsgYWJvdXQgd2hldGhlciB0aGVyZSBpcyBhIGNsZWFuZXIgYXBwcm9h
Y2guCj4gCj4gVGhlIHN0YXR1cyBoZXJlIG11c3QgcmVwcmVzZW50IHRoZSBzdGF0dXMgcmVwb3J0
ZWQgYnkgdGhlIGNvcnJlc3BvbmRpbmcKPiBsYXllcjogYmUgaXQgRFAgQUx0TW9kZSwgdGhlIGRw
LWNvbm5lY3RvciBkcml2ZXIgaGFuZGxpbmcgdGhlIEhQRCBHUElPCj4gb3IgdGhlIERQIGRyaXZl
ciBpdHNlbGYgaGFuZGxpbmcgdGhlIEhQRCBwaW4gdmlhIHRoZSBzdGF0ZSBtYWNoaW5lLgo+IApH
b3QgaXQuCj4gSXMgaXQgc3RpbGwgYW4gaXNzdWUgaWYgdGhlIGJyaWRnZSdzIGhwZF9ub3RpZnko
KSBjYWxsYmFjayBkZXRlcm1pbmVzCj4gdGhhdCB3ZSBzaG91bGQgbm90IGJlIHJlcG9ydGluZyB0
aGUgZXZlbnQgYW5kIGRyb3BzIGNvbm5lY3Rvci0+c3RhdHVzIHRvCj4gJ2Rpc2Nvbm5lY3RlZCcg
YWdhaW4/IFdoeSBpcyBpdCBhbiBpc3N1ZT8gU2hvdWxkIHdlIGluc3RlYWQgZmlsdGVyIHRoZQp5
ZXMsIGl0IHN0aWxsIGFuIGlzc3VlIGlmIGVhY2ggaXJxIC4gVGhlIFNTVCBjb25uZWN0b3IgIHNo
b3VsZCBub3QgYmUgCnJlcG9ydGVkIGFzIGNvbm5lY3RlZCwgZXZlbiBtb21lbnRhcmlseS4gV2hl
biB0aGUgY29ubmVjdG9yIHN0YXR1cyBpcyAKY2hhbmdlZCBmcm9tIGNvbm5lY3RlZCBiYWNrIHRv
IGRpc2Nvbm5lY3RlZCwgdGhpcyBzdGF0ZSB0cmFuc2l0aW9uIGlzIAp0cmVhdGVkIGFzIGEgaG90
cGx1ZyBldmVudCBhbmQgdHJpZ2dlciBob3RwbHVnLCBpbnRyb2R1Y2luZyB1bm5lY2Vzc2FyeSAK
dXNlcnNwYWNlIHBvbGxpbmcgYW5kIHJlLXByb2JpbmcuCj4gSFBEIGV2ZW50cyBpbiB0aGUgZHJt
X3N5c2ZzX2Nvbm5lY3Rvcl9ob3RwbHVnX2V2ZW50KCksIG1ha2luZyBzdXJlIHRoYXQKPiB3ZSBk
b24ndCBzZW5kIGR1cGxpY2F0ZSBkaXNjb25uZWN0ZWQgZXZlbnRzPwo+IApJIHRoaW5rIGRyaXZl
ciBzaG91bGQgY29uZmlybSBpdCByZWFsbHkgc2VuZCBhIGhvdHBsdWcgd2hlbiB3ZSBjYWxsIApk
cm1fc3lzZnNfY29ubmVjdG9yX2hvdHBsdWdfZXZlbnQoKQo+IFdoYXQgaXMgdGhlIGV4cGVjdGVk
IGJlaGF2aW91ciBvZiBkcm1fY2xpZW50J3M/Cj4gCi0gR2VudWluZSBjb25uZWN0L2Rpc2Nvbm5l
Y3Q6IHRoZSBjbGllbnQgaXMgd29rZW4gdXAsIHJlLXByb2JlcyBhbmQgCmZvbGxvd3MgdGhlIG5l
dyBzdGF0ZS4KLSBJUlFfSFBEIHdpdGggbm8gYWN0dWFsIGNoYW5nZTogdGhlIGNsaWVudCBtdXN0
IG5vdCBiZSB3b2tlbiB1cCBhdCBhbGwsIApvdGhlcndpc2UgZXZlcnkgc2hvcnQgcHVsc2UgdHJp
Z2dlcnMgYSBmdWxsIHJlLXByb2JlIG9mIGFsbCBjb25uZWN0b3JzLgotIElSUV9IUEQgd2hlcmUg
dGhlIGRyaXZlciBkb2VzIGNvbmNsdWRlIHRoYXQgc29tZXRoaW5nIGNoYW5nZWQ6IHRoZSAKZHJp
dmVyIGVzY2FsYXRlcyBpdCBleHBsaWNpdGx5IGludG8gYSByZWFsIHN0YXR1cyBub3RpZmljYXRp
b24uCi0gVGhlIFNTVCBjb25uZWN0b3Igd2hpbGUgTVNUIGlzIGFjdGl2ZTogcGVybWFuZW50bHkg
J2Rpc2Nvbm5lY3RlZCcsIGFuZCAKdGhlIGNsaWVudCBtdXN0IG5ldmVyIHNlbGVjdCBpdC4gVGhl
IHJlYWwgb3V0cHV0cyBhcmUgdGhlIE1TVCBwb3J0IApjb25uZWN0b3JzIGNyZWF0ZWQgYnkgdGhl
IHRvcG9sb2d5IG1hbmFnZXIsIHdoaWNoIGdldCB0aGVpciBvd24gaG90cGx1ZyAKZXZlbnRzIGZy
b20gaXQuCj4+Pj4gKwkgKi8KPj4+PiArCWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c191
bmtub3duICYmCj4+Pj4gKwkgICAgZXh0cmFfc3RhdHVzICE9IERSTV9DT05ORUNUT1JfTk9fRVhU
UkFfU1RBVFVTKSB7Cj4+Pj4gKwkJZHJtX2JyaWRnZV9jb25uZWN0b3JfaHBkX25vdGlmeShjb25u
ZWN0b3IsCj4+Pj4gKwkJCQkJCWNvbm5lY3Rvci0+c3RhdHVzLAo+Pj4+ICsJCQkJCQlleHRyYV9z
dGF0dXMsIE5VTEwpOwo+Pj4+ICsJCXJldHVybjsKPj4+PiArCX0KPj4+PiArCj4+Pj4gICAgCW11
dGV4X2xvY2soJmRldi0+bW9kZV9jb25maWcubXV0ZXgpOwo+Pj4+ICAgIAljb25uZWN0b3ItPnN0
YXR1cyA9IHN0YXR1czsKPj4+PiAgICAJbXV0ZXhfdW5sb2NrKCZkZXYtPm1vZGVfY29uZmlnLm11
dGV4KTsKPj4+Pgo+Pj4+IC0tIAo+Pj4+IDIuNDMuMAo+Pj4+Cj4+Pgo+Pgo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdAo+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
