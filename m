Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C6EC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t3VTCMRzvabr3k821uTZ1ad2jUkcgVaJlPDiyEoyqQ=; b=2zez0XCazhVcAA
	kZFAmXWHXSQrhelHNmgvX8OEwZjWGY/NDUcKM+tF4uZsDUrl0NVm6BzoZEQg2qZeIrJcFvRcMUE5Y
	FtxkbrCLg1b3Dmk9Ms6d9Nv5GmEl9aGy80a0YXHV+Eb4TvYMY6mjOTPd3+aJTeDlE/WQm0WEfmK1B
	DREorcTxUuD8YO+mSkfn7TmMvmr0QIRhMKdf8j6zpaVvGW/0Rj+xDVJbryJLaexjp5n4e/kt5N3qF
	Jar7urLzNSF864R3zYdNISbOqfQJ5uRHHSi3N+7UcZhEcxZRi2Lf9p7cN6fHJ0UtyY1zmX0bgfO+8
	GZRq9qw+zq9fg0/majmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIy-00000005cae-1FMl;
	Mon, 17 Aug 2026 08:02:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIu-00000005cYr-45FU
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 08:02:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H72sQb160949
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=; b=gUv509HgWGlG+Cy5
	EE3RDEv0i9vuuJLaeB8aJ0tzpS9EjAqjMv1f11Yz9lx0tSWcVl+etNQzRDOoTVdC
	6AewY63wPCRhV9z1flQunFjlcHqDFAHeSuSarwETSe1Nw1XdvdGyo0Y/hwR6rVIm
	Zsi7XHeokjsYt+9ous1BsY44KEu/t/qdbu15C9vmJIRW7E90tu8qErSaS/ECR+tB
	Vb354AaMMaKw4O1fYxf79SeRhmMLEryUwFKxsTTH+437vd0CrTUr8yvLLVJz65UL
	Ap6+6FCmn3BUwAvncNCkyadR7GT3NYJu9tkcL7n4A44z3JT+umYVz4YEohrPNDz9
	Zmw7tg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5y49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-529ae8e96e8so41339651cf.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953763; x=1787558563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=O4U3Ea71iA4s0parUE8eXH9IMngCSwhSsqb2b+9Yu9uWNl7ziqcsWUCdeHTykCUbgO
         23jsMTckD8Xs8gbQGSojwlgGqN7rl1mLHYKP2HjAbWOKxOWpfMYzIg5R+pkmEZCYCDgL
         U7otmAd33+yLEX2Qrgoy5NlfhwR8a1lhvh580zlKSpXVXD08ATPp3vx6KBXPn4OT8Stb
         qk1Cp7XQXbTjvMXGlLk7R3rdMGiypo2+TihK+TXtcGEXnq5wv/NtQmcgXpaX2g+i3kjn
         l9x6UvAL8p5X0I00BnU2ps1l1Gr7WFlVAYZv7kYUUdy35YurFb8lH+qsJkF3m6b4LY1Z
         xkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953763; x=1787558563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=ZJHbkH8C8GEmBYtd06czoZQf9MHKoYmFfC5v1fICHdGnFLQ/zrzO24QFNGAoPd/jBu
         OJTyECa0SU0sv7/W83uVPFBcLaZpXXxdLl/DSBKbdPbSvwd6WYkcKVRd6BrgnayPU9y5
         EBp3Ni8ygw4wbC0NhbVvGGyq/87aFAuZ/7lD/4gNC84avbAQ25NL49UF75yYi2u8vEaW
         MurxPrUIcNAlNd1DOaLgeGPn1dLPE92ioyMX7rDzCNWDoQo9N3FpVRqqjhA3cck3KDFx
         6IxdXdTXIQ++z3Petgst2N4AXX/WMY94Kqbnp8lk0ZyAygXDJKfQqDeo9zE0+0KeKr/1
         tImg==
X-Forwarded-Encrypted: i=1; AHgh+RrOQV5ZPzqYe+Cw/N7yXijm2/hv+Et20Qk74RBNK/hxtL3LjM5qcqFvEphAgn/FpKtnZ+MT27WrPY01Ft45@lists.infradead.org
X-Gm-Message-State: AOJu0Yypnea+5ubtUvXRpgi+B8HAFjFhlrMz5HVA6j86ICJGcqC+4qg/
	VnChM7jg/QDBkcHxRcWtzSKSF3Zd2CB3c1N7AeqnOwxknlwzNMESzIai1VO5twcYlz9rnn5u1ES
	tDcTohPdItso1RyX6EReHHytVJf1GqceHwsUjzdEZ+PgmmZMu7QUwZKhrqhRysm0tF/cD5koVaQ
	==
X-Gm-Gg: AR+sD13pY/3zeaN2UzThVxl5jBd6UMxXDYw/aF4jzWnE6O1g2jhvlCf679Dx3An6guA
	roXCapqxUNp5+mafQWWXhUg24Ki98wlkP+fcEpdWmeWTCsLxvJdFXnCDC9Z6UDVz0oEBO/8AApf
	PVckiGI6YzPP5c5AcQuzss98EfCZgg0utQqDc1MNdE9oxuO26mQPpOERFzvB5lKof7D6mVOiXyv
	cvg2NvPu4HBimYXLbNvuv8MR4g6utSheXNjRiUJKHgrT7KmuCpgmTurXCdmbQw8X0EaVQaiuDEG
	+cTYXV5+EuH56gL4zzrhT0zUQQISQYIxxVWuy16ExN9LvpkEGCcdh++rq/zioaHiM79+H1Aqjzi
	CVVdPP8Twma47kfhQOViRkSoIHd21+5R9j6pOT9MIllEKmXTQXWI5yLff0+7bzVeXBA==
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231184371cf.33.1786953763245;
        Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231183591cf.33.1786953762519;
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db623aed9sm8394031cf.23.2026.08.17.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Message-ID: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:02:31 +0800
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX4csv4Y1mGcSa
 JrjOGWPJGyHO7Z5MCwnyhstdeoEuSz316/sxgNdZOx7RO/okreAY4iOccQytc8NfCQm21RMOMPE
 EFh57h742Q3Rviv6ScvECqpyLQTksT8=
X-Proofpoint-GUID: tZKO5t7eLaODHs1ziVpt7rzfuVr9hk08
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82c023 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3XZL1g37JtqLMPLRk5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX7loqyBiy4bB3
 S+XhW0JlF36O81BlEPBYe/8T8f9Cma9sL9DS7Z4SUlMai/gKmKjs77EKa36Zoo7XjH2+BA/ajG8
 VFD6+mjR60i99CnJ8g5q/PmcPBYfDzr+XrqHx+f5t4rtzYhZsB4HcjKcCyUn+PPwnQlbuSEcnjZ
 oUBy26+jPIQV1qMxntatmhFVTglGZvNos/cJG1orps80t7l7Znkcm3YQwaoKKC3zDPnTu++xVgR
 j9CilIbZsaL3R68HBC5jkjq5p9ORK/U6ryZk0oczBCokj+GLd41BUJLMANEk64FMDABPLmJc70G
 y1McN64Vwfj5uNFeoDWG0WLtWwvScQnjFKQmtovvBG39nYOZNSUO6N7MrrHejgCm5WjOjUPIXii
 M4i8yxFQHIBB/6di8gJtTBCgoRqlweFfYaEdDLxSwCzqeYTrgUoTwqnMYICLTX/7S1NQ4uNJqoc
 4WxFWsik2N337XR4c/g==
X-Proofpoint-ORIG-GUID: tZKO5t7eLaODHs1ziVpt7rzfuVr9hk08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010245_137158_C00E8159 
X-CRM114-Status: GOOD (  34.44  )
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

CgpPbiA3LzEyLzIwMjYgNjozMyBQTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPiBPbiBNb24s
IEp1biAyOSwgMjAyNiBhdCAxMDo0ODowNFBNICswODAwLCBZb25neGluZyBNb3Ugd3JvdGU6Cj4+
IFRoZSBicmlkZ2UgY29ubmVjdG9yIEhQRCBoYW5kbGluZyBwYXRoIGN1cnJlbnRseSB1cGRhdGVz
Cj4+IGNvbm5lY3Rvci0+c3RhdHVzIGZvciBldmVyeSBocGRfbm90aWZ5KCkgaW52b2NhdGlvbi4K
Pj4KPj4gVGhpcyBkb2VzIG5vdCB3b3JrIHdlbGwgZm9yIElSUS1vbmx5IG5vdGlmaWNhdGlvbnMg
d2hlcmUgdGhlIGV2ZW50IGJlaW5nCj4+IHJlcG9ydGVkIGlzIGNhcnJpZWQgYnkgZXh0cmFfc3Rh
dHVzIGFuZCBubyBjb25uZWN0b3Igc3RhdHVzIHRyYW5zaXRpb24gaXMKPj4gYXNzb2NpYXRlZCB3
aXRoIGl0Lgo+Pgo+PiBPbmUgZXhhbXBsZSBpcyBEUCBNU1QuIEhQRCBJUlFzIGFyZSBwcm9wYWdh
dGVkIHRocm91Z2gKPj4gZHJtX2JyaWRnZV9ocGRfbm90aWZ5XyooKSBzbyB0aGF0IGJyaWRnZSBk
cml2ZXJzIGNhbiBwcm9jZXNzIHRoZQo+PiBub3RpZmljYXRpb24uIER1cmluZyBNU1Qgb3BlcmF0
aW9uLCBob3dldmVyLCB0aGUgU1NUIGNvbm5lY3RvciBhdHRhY2hlZAo+PiB0byB0aGUgYnJpZGdl
IGNvbm5lY3RvciBpcyBpbnRlbnRpb25hbGx5IGtlcHQgZGlzY29ubmVjdGVkIHdoaWxlIHRoZSBN
U1QKPj4gdG9wb2xvZ3kgbWFuYWdlciBoYW5kbGVzIGFsbCBjb25uZWN0b3IgY3JlYXRpb24sIHJl
bW92YWwgYW5kIGhvdHBsdWcKPj4gcHJvY2Vzc2luZy4KPj4KPj4gVXBkYXRpbmcgY29ubmVjdG9y
LT5zdGF0dXMgZm9yIGFuIElSUS1vbmx5IE1TVCBub3RpZmljYXRpb24gbWF5IGNhdXNlCj4+IHRo
ZSBTU1QgY29ubmVjdG9yIHN0YXRlIHRvIG9zY2lsbGF0ZSBiZXR3ZWVuIGNvbm5lY3RlZCBhbmQg
ZGlzY29ubmVjdGVkCj4+IGRlcGVuZGluZyBvbiB0aGUgbm90aWZpY2F0aW9uIHBhdGguIFRoZXNl
IGFydGlmaWNpYWwgc3RhdGUgdHJhbnNpdGlvbnMKPj4gY2FuIGxhdGVyIGJlIGRldGVjdGVkIGJ5
IHRoZSBwb2xsaW5nIGxvZ2ljIGFuZCByZXN1bHQgaW4gdW5uZWNlc3NhcnkKPj4gaG90cGx1ZyBl
dmVudHMgYmVpbmcgZ2VuZXJhdGVkLiBVc2Vyc3BhY2UgdGhlbiByZS1wcm9iZXMgY29ubmVjdG9y
Cj4+IHN0YXR1cywgcG90ZW50aWFsbHkgdHJpZ2dlcmluZyB0aGUgc2FtZSBzZXF1ZW5jZSBhZ2Fp
bi4KPiAKPiBUaGVuIHRoZSBBUEkgbWlnaHQgbmVlZCB0byBiZSBhZGp1c3RlZC4KPiAKPiBSZW1l
bWJlciwgd2UgaGF2ZSB0d28gdXNlY2FzZXMsIHdoaWNoIHdlIG11c3QgYmUgYWJsZSB0byBpbnRl
cnByZXQKPiBjb3JyZWN0bHk6Cj4gLSBUaGUgZHJpdmVyIGdldHMgc2VwYXJhdGUgSFBEIGFuZCBJ
UlFfSFBEIGV2ZW50cy4KPiAtIFRoZSBkcml2ZXIgZ2V0cyBIUEQgYW5kIElSUV9IUEQgYXQgdGhl
IHNhbWUgdGltZS4KPiAKT2hoIHllcywgaGVyZSBuZWVkIHRvIHJld29yay4KPj4KPj4gVHJlYXQg
bm90aWZpY2F0aW9ucyB3aXRoIHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX3Vua25vd24gYW5k
IGEgdmFsaWQKPj4gZXh0cmFfc3RhdHVzIGFzIElSUS1vbmx5IGV2ZW50cy4gRm9yd2FyZCB0aGUg
bm90aWZpY2F0aW9uIHRvIGJyaWRnZQo+PiBkcml2ZXJzIHdpdGhvdXQgbW9kaWZ5aW5nIGNvbm5l
Y3Rvci0+c3RhdHVzLgo+Pgo+PiBUaGlzIGtlZXBzIElSUSBkZWxpdmVyeSB3b3JraW5nIHdoaWxl
IGxlYXZpbmcgY29ubmVjdG9yIHN0YXRlIG1hbmFnZW1lbnQKPj4gdG8gdGhlIGNvbXBvbmVudCB0
aGF0IGFjdHVhbGx5IG93bnMgaXQsIHN1Y2ggYXMgdGhlIERQIE1TVCB0b3BvbG9neQo+PiBmcmFt
ZXdvcmsuCj4gCj4gSG93IGlzIGl0IGhhbmRsZWQgYnkgb3RoZXIgZHJpdmVycyAoaTkxNSwgYW1k
LCBub3V2ZWF1KT8KPiAKaTkxNSwgYW1kZ3B1LCBhbmQgbm91dmVhdSBkb24ndCBnbyB0aHJvdWdo
IHRoZSBkcm1fYnJpZGdlX2hwZF9ub3RpZnkoKQpicmlkZ2UgY2hhaW4gLS0gdGhlaXIgRFAgY29u
dHJvbGxlcnMgYXJlIGludGVncmF0ZWQgaW50byB0aGUgU29DLCBhbmQKSFBEIGludGVycnVwdHMg
YXJlIGhhbmRsZWQgZGlyZWN0bHkgaW4gdGhlaXIgb3duIGVuY29kZXIgY29kZS4KCk1TTSBEUCBp
cyBkaWZmZXJlbnQgaW4gdGhhdCBIUEQgY29tZXMgZnJvbSBUeXBlLUMgLyBwbWljX2dsaW5rIGFs
dG1vZGUKdmlhIGF1eC1ocGQtYnJpZGdlLCBzbyBpdCBoYXMgdG8gZ28gdGhyb3VnaCB0aGUgYnJp
ZGdlIGNoYWluLCB3aGljaAptZWFucyB0aGlzIHNlbWFudGljIG5lZWRzIHRvIGJlIGV4dGVuZGVk
IHRvIHRoZSBicmlkZ2UgQVBJLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25neGluZyBNb3UgPHlv
bmd4aW5nLm1vdUBvc3MucXVhbGNvbW0uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
ZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jIHwgMTIgKysrKysrKysrKysrCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jCj4+IGluZGV4IDVlZGNhNDdhMDI1Zi4uNzMz
NGQ2Njc3NjA0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJp
ZGdlX2Nvbm5lY3Rvci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlk
Z2VfY29ubmVjdG9yLmMKPj4gQEAgLTE2Myw2ICsxNjMsMTggQEAgc3RhdGljIHZvaWQgZHJtX2Jy
aWRnZV9jb25uZWN0b3JfaGFuZGxlX2hwZChzdHJ1Y3QgZHJtX2JyaWRnZV9jb25uZWN0b3IgKmRy
bV9icmkKPj4gICAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZkcm1fYnJpZGdl
X2Nvbm5lY3Rvci0+YmFzZTsKPj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rv
ci0+ZGV2Owo+PiAgIAo+PiArCS8qCj4+ICsJICogSVJRLW9ubHkgbm90aWZpY2F0aW9uOiBleHRy
YV9zdGF0dXMgY2FycmllcyB0aGUgZXZlbnQgYnV0Cj4+ICsJICogc3RhdHVzIGlzIHVua25vd24g
4oCUIGRvIG5vdCBvdmVyd3JpdGUgY29ubmVjdG9yLT5zdGF0dXMuCj4gCj4gQnV0IGl0J3Mgbm90
IHVua25vd24gYXQgdGhpcyBwb2ludC4gVGhlIGNvbm5lY3RvciBzdGF0dXMgaXMgcmVwb3J0ZWQK
PiBmb2xsb3dpbmcgdGhlIEhQRCBzdGF0dXMuCj4gCllvdSBhcmUgcmlnaHQsIGluIHRoZSBTU1Qg
Y2FzZSB0aGUgYnJpZGdlX2Nvbm5lY3RvciBzdGF0dXMgZG9lcyBmb2xsb3cKSFBEIC8gbGluayBz
dGF0dXMgLS0gYmVjYXVzZSB0aGUgYnJpZGdlX2Nvbm5lY3RvciBpdHNlbGYgcmVwcmVzZW50cwp0
aGF0IFNTVCBjb25uZWN0b3IsIHNvIGl0cyBzdGF0dXMgbmF0dXJhbGx5IGlzIHRoZSBsaW5rIHN0
YXR1cy4KClRoZSBNU1QgY2FzZSBoYXMgYSBrZXkgZGlmZmVyZW5jZSB0aG91Z2g6IHRoZSBTU1Qg
Y29ubmVjdG9yIG11c3QgYmUKZXhwbGljaXRseSBtYXJrZWQgZGlzY29ubmVjdGVkICh0byBwcmV2
ZW50IHRoZSBEUk0gZnJhbWV3b3JrIGZyb20KZW5hYmxpbmcgaXQpLCBjb25zaXN0ZW50IHdpdGgg
d2hhdCBpOTE1LCBhbWRncHUgYW5kIG5vdXZlYXUgZG8uIEluCm90aGVyIHdvcmRzLCBvbmNlIE1T
VCBpcyBlbmFibGVkLCB0aGUgU1NUIGNvbm5lY3RvciB0aGF0IHRoZQpicmlkZ2VfY29ubmVjdG9y
IHJlcHJlc2VudHMgbm8gbG9uZ2VyIGVxdWF0ZXMgdG8gdGhlIGxpbmsgc3RhdHVzIC0tCnRoZSBy
ZWFsIGxpbmsgaXMgbWFuYWdlZCBieSB0aGUgTVNUIHRvcG9sb2d5LCBhbmQgdGhlIFNTVCBjb25u
ZWN0b3IKaXMganVzdCBhIHBsYWNlaG9sZGVyIGF0IHRoYXQgcG9pbnQuCgpUaGUgaXNzdWUgaXMg
dGhhdCBJUlFfSFBEIHN0aWxsIHRyYXZlbHMgdGhyb3VnaCB0aGUgYnJpZGdlX2Nvbm5lY3Rvcgpj
aGFpbiBhbmQgdGFrZXMgdGhlIG9sZCAidXBkYXRlIHRoZSBTU1QgY29ubmVjdG9yJ3Mgc3RhdHVz
IC0+IGVtaXQKaG90cGx1ZyIgcGF0aC4gVW5kZXIgTVNUIHRoYXQgcnVucyBpbnRvIHR3byBjb25z
dHJhaW50cyAtLSBhbmQgdGhpcwppcyBleGFjdGx5IHdoYXQgdGhpcyBzZXJpZXMgaXMgdHJ5aW5n
IHRvIGFkZHJlc3M6CgoxLiBUaGUgU1NUIGNvbm5lY3RvciByZXByZXNlbnRlZCBieSBicmlkZ2Vf
Y29ubmVjdG9yIG5vIGxvbmdlciBzdGFuZHMKICAgIGZvciB0aGUgbGluaywgc28gaXRzIHN0YXR1
cyBtdXN0IG5vdCBiZSBvdmVyd3JpdHRlbiBieSBJUlFfSFBECiAgICBldmVudHMuCjIuIElSUV9I
UEQgbmVlZHMgYSBjbGVhbiBwYXRoIHRoYXQgZG9lcyBub3QgdHJpZ2dlciBhIGhvdHBsdWcgb24g
dGhlCiAgICBicmlkZ2VfY29ubmVjdG9yIC0tIHRoZSBNU1QgZnJhbWV3b3JrIGFscmVhZHkgbWFu
YWdlcyBob3RwbHVncwogICAgaW5kZXBlbmRlbnRseS4KClVzaW5nIGNvbm5lY3Rvcl9zdGF0dXNf
dW5rbm93biBhcyBhIHNlbnRpbmVsIGhlcmUgZG9lcyBmZWVsIGEgYml0IG9kZDsKbGV0IG1lIHRo
aW5rIGFib3V0IHdoZXRoZXIgdGhlcmUgaXMgYSBjbGVhbmVyIGFwcHJvYWNoLgo+PiArCSAqLwo+
PiArCWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c191bmtub3duICYmCj4+ICsJICAgIGV4
dHJhX3N0YXR1cyAhPSBEUk1fQ09OTkVDVE9SX05PX0VYVFJBX1NUQVRVUykgewo+PiArCQlkcm1f
YnJpZGdlX2Nvbm5lY3Rvcl9ocGRfbm90aWZ5KGNvbm5lY3RvciwKPj4gKwkJCQkJCWNvbm5lY3Rv
ci0+c3RhdHVzLAo+PiArCQkJCQkJZXh0cmFfc3RhdHVzLCBOVUxMKTsKPj4gKwkJcmV0dXJuOwo+
PiArCX0KPj4gKwo+PiAgIAltdXRleF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKPj4g
ICAJY29ubmVjdG9yLT5zdGF0dXMgPSBzdGF0dXM7Cj4+ICAgCW11dGV4X3VubG9jaygmZGV2LT5t
b2RlX2NvbmZpZy5tdXRleCk7Cj4+Cj4+IC0tIAo+PiAyLjQzLjAKPj4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
