Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA1C5DF74
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaiIPKlxF5KdGtgNT8x5KQF/CICMHnDKucfbczzC9Vw=; b=DG6aRPArfGpF6J
	jLru1YY9eLgZb2gIRiLjKgL4EzhS21azSVfAfUHmWy96E1e6I1wsVpdPh5Hf+14V1EGwHUn6RkkLR
	TolZtaENUZM4/xIFxwwuIGsgm5xScwbVhXZ/8Gc0Yr44KNvY1ATx+PjJMaIolSyl9FHz+qNUZQ4ZY
	QRtlBfdtpPFXwAfBUubeNp2wqEK/x7mqIOFAAlgQxPxeitv3aGsBh1o/RS+Xf6HNmllcmMFSmyqXi
	5NcwUuyIwecZLFcIuDGIhLVboUG1cS+7MJzUhcfGBqE/O+iowFrAtIT/sNmzXXa5goOdiT8kkrcZG
	oQIUBnzJVu5+3ADBlDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwALJ-00000007AIm-0gYW;
	Tue, 18 Aug 2026 03:18:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwALG-00000007AHs-2nRx
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 03:18:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28UtZ2884789
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=; b=WkK5frd7fdbUdVqb
	U3sPn10YKKrMrbK6n3tDunsyDRNy11RfIQla6GuHj53JCjCa2bMY6vioFOBYtinc
	gOlm971q3CgYaqI+kw6/EyXvcs+HXi+QXw8MGx1FeP9E4vjmhV1TsG1aZQTl8c5o
	+6KUQR9EexwshPmj0bycvD3sBwvUrvYnyA7J2iTvtwFaxMHZWl3I7774PZpY6B4P
	hX2gSKf69Eubsh3WllT0MP9Eedb8UiNnfDxaztxWzAzPZ8HKMvoI3uTbb68I6Z1n
	5T7M95LY1yoLM8Dj5fk4AnRykjOYcsikmFCEplvgpPX2i21+8aEwEC8iAAp52SvA
	a8QW9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpr98n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:18:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so474913785a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 20:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023101; x=1787627901; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=Y3p19BbZq2o1wHQwiAWPEe7Mi2CkB8N2vvXxfXlVMlUwQ1ruyMEwtNNmQWsL0LH1in
         vy+BVFINXL/sbJc6oeOsqsrEkH/d6j1xSOxX9hjQwgNGNJCsPEblpXQEmhql7W9RLfSV
         nXwL5k5ukzqmhlGW6CZLCp2eeFXIFXAGku0Hrb03xfNPwZU0MuzunMg1SnRkikVV2tcH
         BAT292pe+5xVcRsJ2PHpcGRYM/t/LPvSTnsg9rXHS94cU4eXGcL2q8wDT3KIO/iemE4i
         d6G5u3BDxhBvmCSnkAax9iA+b4t+WJV+eLjUKFufEKz/GapHHvMsDwVU3OO9Yfi0knRx
         Yq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023101; x=1787627901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=qnqwBn0BEotZRMTd3fxgUUEdeE5J7s3GIdmYoFgXY6j1FJD5agVlnwWQkYxQsClHp2
         rqRSimCF0vRkfpd2r8tqcobV0ANCbkDCtAeeFpwnuz4srBembnLgMEcqgoRl8ZNDPcY8
         pg2flQSY0bmwfZUcdgoPVdtiuPxfk3Ku0f0hPVVdraOz0TkVvp1pw2pyukx0QTWmRRME
         4ZNM3TNA1aF48TIk7hCGay6ii0UdolBFzx6SDAEbAudougK7bFdVStJhdtIyOC+1XwV6
         4r4T2DF0qd4TCAN/1k75mbunS+myBDxA3q47mhWtNcZoCDuuYrgHiBXiBrXyZvr5Wkma
         jJQg==
X-Forwarded-Encrypted: i=1; AHgh+RqD1+KpWImHRa9bavSSPHdwL4D8g1kArYg4CGXHOA/ZdyU7v4d4r1VdBteZg0LDosDr0naZKiiqaOJvIvtG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5tu8Tr4vSTKITZtbUq2gAD7gleuDJ+Ua+xG9IjzX0pNwoCvA
	9jkwxS9nxS1s0tt0Tox4p3sH1GSlI/lwwRzpa6eSUjz7REj2yWkCqfCG8PHsV79J6Cj+DmpQP4G
	pGCf0cdF+EMfKhNEgsTp/eont7nG4lnRXwyrXgyHoPJsMUNdlatdwTPECJG/yWXJZHZUKcKhVfg
	==
X-Gm-Gg: AR+sD13UHS0RloUKafhNeHfh7OweVDgW2jx4cdVyVRKnLFm3QGsabDUyzmTZQworC2X
	gE7RpPBmUqdvM370Uy0gd+J1CJg0R9gcRda4EzpoYDJt6A6iXuaa/GRhHJG+B9J/TYhXd6TgQzq
	ukU9P/K2pT0jOXS+njsYE8b31l3ce5BswlXrZv9B9SD9Iam6/n7ZxZUHmQ3N2OwZBgsQ9ccyzyU
	fRlIFVAbagM83xXOs4UWhwored08XLZwWl0yG91XO5mGUKovEVuMDZaAxHm/Uq3T8tfPjCaZLMc
	f1Fvf94oiRRCreGHi7Gymsfk8QTRv0uublT/BASJjSvSz84tk9hsmMYumfr9G6jCDAXMSDfInVY
	TVtqlZMerUFRqvxdb1e2OCAL9EY0OpIug8M4stNBDJXKDaGz5y1dAO290HzfLIaKEc8ThSi/uiy
	kgJYSrqA5YHKmp
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569256785a.47.1787023100498;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569251885a.47.1787023100020;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeacfsm830534e87.54.2026.08.17.20.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:18:18 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:18:16 +0300
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
Message-ID: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
X-Proofpoint-GUID: KdEhZcEUcqFFEV6CgNAOsM9Bq_usza1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX4TsofHpFPWUv
 h9VDkId+21YKD3GQmB0KHpjweqPNQWrjaT4i1StB7FJ6xmaBwgiSNrzR9c9qN0PvtSRKOGyvdcZ
 2iBRRX0yden9uRGPuIm1zFiuXmNGwoPS5bPIe3fLYv+oAX9UM8MMbGWOUBcT+3A2JlHnFT7puVN
 FpS7aRu1OsH2VlPuHttQJg4pOHSKsoiV85q6SCrICuv1ULD294DoUUOjSUeAbTPtVEeWeK+3Etu
 1ngkCDk4I/z6qucaS5Sr8BWdXx6u8kkfHwGPo7S33lkRolfbr6AE4D6GIFJxdyQ6mlV7AA1DN8P
 W6Un5+Jh4F1OQ/u3z63qtEcZ/8Xt+9eHZVoHuplj9zjDQMzVHEXwTMfJKGVLcoojCgxWTsPLq3R
 2TdC8GBOoRduL+p3vw5OrU+/O8DobEcgONu5D7zKmAY3UcUS0AnHtyT6DhKFsk6qUZ/3biKKF3v
 eBAF6rTm3at+S4xXS1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX73YueNeLJwIt
 ZD4AoijYs+NluvqyJuI/PSDlPpdaYAz0goC20FoTv3BjDox/g19T/DjthPvHWWnaI4vl2fkPgTk
 08isq3wYnK4Q+1cy0Wjma32YMEwl0mg=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83cefd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=TwwRWlU4pX-Acn9O6hYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: KdEhZcEUcqFFEV6CgNAOsM9Bq_usza1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_201822_821328_5AD7F61E 
X-CRM114-Status: GOOD (  54.11  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMDQ6MDI6MzFQTSArMDgwMCwgWW9uZ3hpbmcgTW91IHdy
b3RlOgo+IAo+IAo+IE9uIDcvMTIvMjAyNiA2OjMzIFBNLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Ogo+ID4gT24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMTA6NDg6MDRQTSArMDgwMCwgWW9uZ3hpbmcg
TW91IHdyb3RlOgo+ID4gPiBUaGUgYnJpZGdlIGNvbm5lY3RvciBIUEQgaGFuZGxpbmcgcGF0aCBj
dXJyZW50bHkgdXBkYXRlcwo+ID4gPiBjb25uZWN0b3ItPnN0YXR1cyBmb3IgZXZlcnkgaHBkX25v
dGlmeSgpIGludm9jYXRpb24uCj4gPiA+IAo+ID4gPiBUaGlzIGRvZXMgbm90IHdvcmsgd2VsbCBm
b3IgSVJRLW9ubHkgbm90aWZpY2F0aW9ucyB3aGVyZSB0aGUgZXZlbnQgYmVpbmcKPiA+ID4gcmVw
b3J0ZWQgaXMgY2FycmllZCBieSBleHRyYV9zdGF0dXMgYW5kIG5vIGNvbm5lY3RvciBzdGF0dXMg
dHJhbnNpdGlvbiBpcwo+ID4gPiBhc3NvY2lhdGVkIHdpdGggaXQuCj4gPiA+IAo+ID4gPiBPbmUg
ZXhhbXBsZSBpcyBEUCBNU1QuIEhQRCBJUlFzIGFyZSBwcm9wYWdhdGVkIHRocm91Z2gKPiA+ID4g
ZHJtX2JyaWRnZV9ocGRfbm90aWZ5XyooKSBzbyB0aGF0IGJyaWRnZSBkcml2ZXJzIGNhbiBwcm9j
ZXNzIHRoZQo+ID4gPiBub3RpZmljYXRpb24uIER1cmluZyBNU1Qgb3BlcmF0aW9uLCBob3dldmVy
LCB0aGUgU1NUIGNvbm5lY3RvciBhdHRhY2hlZAo+ID4gPiB0byB0aGUgYnJpZGdlIGNvbm5lY3Rv
ciBpcyBpbnRlbnRpb25hbGx5IGtlcHQgZGlzY29ubmVjdGVkIHdoaWxlIHRoZSBNU1QKPiA+ID4g
dG9wb2xvZ3kgbWFuYWdlciBoYW5kbGVzIGFsbCBjb25uZWN0b3IgY3JlYXRpb24sIHJlbW92YWwg
YW5kIGhvdHBsdWcKPiA+ID4gcHJvY2Vzc2luZy4KPiA+ID4gCj4gPiA+IFVwZGF0aW5nIGNvbm5l
Y3Rvci0+c3RhdHVzIGZvciBhbiBJUlEtb25seSBNU1Qgbm90aWZpY2F0aW9uIG1heSBjYXVzZQo+
ID4gPiB0aGUgU1NUIGNvbm5lY3RvciBzdGF0ZSB0byBvc2NpbGxhdGUgYmV0d2VlbiBjb25uZWN0
ZWQgYW5kIGRpc2Nvbm5lY3RlZAo+ID4gPiBkZXBlbmRpbmcgb24gdGhlIG5vdGlmaWNhdGlvbiBw
YXRoLiBUaGVzZSBhcnRpZmljaWFsIHN0YXRlIHRyYW5zaXRpb25zCj4gPiA+IGNhbiBsYXRlciBi
ZSBkZXRlY3RlZCBieSB0aGUgcG9sbGluZyBsb2dpYyBhbmQgcmVzdWx0IGluIHVubmVjZXNzYXJ5
Cj4gPiA+IGhvdHBsdWcgZXZlbnRzIGJlaW5nIGdlbmVyYXRlZC4gVXNlcnNwYWNlIHRoZW4gcmUt
cHJvYmVzIGNvbm5lY3Rvcgo+ID4gPiBzdGF0dXMsIHBvdGVudGlhbGx5IHRyaWdnZXJpbmcgdGhl
IHNhbWUgc2VxdWVuY2UgYWdhaW4uCj4gPiAKPiA+IFRoZW4gdGhlIEFQSSBtaWdodCBuZWVkIHRv
IGJlIGFkanVzdGVkLgo+ID4gCj4gPiBSZW1lbWJlciwgd2UgaGF2ZSB0d28gdXNlY2FzZXMsIHdo
aWNoIHdlIG11c3QgYmUgYWJsZSB0byBpbnRlcnByZXQKPiA+IGNvcnJlY3RseToKPiA+IC0gVGhl
IGRyaXZlciBnZXRzIHNlcGFyYXRlIEhQRCBhbmQgSVJRX0hQRCBldmVudHMuCj4gPiAtIFRoZSBk
cml2ZXIgZ2V0cyBIUEQgYW5kIElSUV9IUEQgYXQgdGhlIHNhbWUgdGltZS4KPiA+IAo+IE9oaCB5
ZXMsIGhlcmUgbmVlZCB0byByZXdvcmsuCj4gPiA+IAo+ID4gPiBUcmVhdCBub3RpZmljYXRpb25z
IHdpdGggc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93biBhbmQgYSB2YWxpZAo+ID4g
PiBleHRyYV9zdGF0dXMgYXMgSVJRLW9ubHkgZXZlbnRzLiBGb3J3YXJkIHRoZSBub3RpZmljYXRp
b24gdG8gYnJpZGdlCj4gPiA+IGRyaXZlcnMgd2l0aG91dCBtb2RpZnlpbmcgY29ubmVjdG9yLT5z
dGF0dXMuCj4gPiA+IAo+ID4gPiBUaGlzIGtlZXBzIElSUSBkZWxpdmVyeSB3b3JraW5nIHdoaWxl
IGxlYXZpbmcgY29ubmVjdG9yIHN0YXRlIG1hbmFnZW1lbnQKPiA+ID4gdG8gdGhlIGNvbXBvbmVu
dCB0aGF0IGFjdHVhbGx5IG93bnMgaXQsIHN1Y2ggYXMgdGhlIERQIE1TVCB0b3BvbG9neQo+ID4g
PiBmcmFtZXdvcmsuCj4gPiAKPiA+IEhvdyBpcyBpdCBoYW5kbGVkIGJ5IG90aGVyIGRyaXZlcnMg
KGk5MTUsIGFtZCwgbm91dmVhdSk/Cj4gPiAKPiBpOTE1LCBhbWRncHUsIGFuZCBub3V2ZWF1IGRv
bid0IGdvIHRocm91Z2ggdGhlIGRybV9icmlkZ2VfaHBkX25vdGlmeSgpCj4gYnJpZGdlIGNoYWlu
IC0tIHRoZWlyIERQIGNvbnRyb2xsZXJzIGFyZSBpbnRlZ3JhdGVkIGludG8gdGhlIFNvQywgYW5k
Cj4gSFBEIGludGVycnVwdHMgYXJlIGhhbmRsZWQgZGlyZWN0bHkgaW4gdGhlaXIgb3duIGVuY29k
ZXIgY29kZS4KPiAKPiBNU00gRFAgaXMgZGlmZmVyZW50IGluIHRoYXQgSFBEIGNvbWVzIGZyb20g
VHlwZS1DIC8gcG1pY19nbGluayBhbHRtb2RlCj4gdmlhIGF1eC1ocGQtYnJpZGdlLCBzbyBpdCBo
YXMgdG8gZ28gdGhyb3VnaCB0aGUgYnJpZGdlIGNoYWluLCB3aGljaAo+IG1lYW5zIHRoaXMgc2Vt
YW50aWMgbmVlZHMgdG8gYmUgZXh0ZW5kZWQgdG8gdGhlIGJyaWRnZSBBUEkuCgpTdGlsbCwgd2hl
biBkbyB0aG9zZSBkcml2ZXJzIHNlbmQgdGhlIEhQRCBldmVudCBpbiBjYXNlIG9mIElSUV9IUEQ/
IE9yCmlzIGl0IHRoYXQgaW4gdGhlaXIgY2FzZSBJUlFfSFBEIGp1c3QgdHJpZ2dlcnMgaW5uZXIg
bG9naWMgdG8gcmVyZWFkIHRoZQpzdGF0dXMgcmVnaXN0ZXJzIGFuZCB0aGVuIHRoZSBkcml2ZXIg
c2VuZHMgdGhlIEhQRCBpZiB0aGVyZSBpcyBhbnkKYWN0dWFsIGNoYW5nZT8KCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFlvbmd4aW5nIE1vdSA8eW9uZ3hpbmcubW91QG9zcy5xdWFsY29tbS5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVj
dG9yLmMgfCAxMiArKysrKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5
L2RybV9icmlkZ2VfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJp
ZGdlX2Nvbm5lY3Rvci5jCj4gPiA+IGluZGV4IDVlZGNhNDdhMDI1Zi4uNzMzNGQ2Njc3NjA0IDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5l
Y3Rvci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29u
bmVjdG9yLmMKPiA+ID4gQEAgLTE2Myw2ICsxNjMsMTggQEAgc3RhdGljIHZvaWQgZHJtX2JyaWRn
ZV9jb25uZWN0b3JfaGFuZGxlX2hwZChzdHJ1Y3QgZHJtX2JyaWRnZV9jb25uZWN0b3IgKmRybV9i
cmkKPiA+ID4gICAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZkcm1fYnJpZGdl
X2Nvbm5lY3Rvci0+YmFzZTsKPiA+ID4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5l
Y3Rvci0+ZGV2Owo+ID4gPiArCS8qCj4gPiA+ICsJICogSVJRLW9ubHkgbm90aWZpY2F0aW9uOiBl
eHRyYV9zdGF0dXMgY2FycmllcyB0aGUgZXZlbnQgYnV0Cj4gPiA+ICsJICogc3RhdHVzIGlzIHVu
a25vd24g4oCUIGRvIG5vdCBvdmVyd3JpdGUgY29ubmVjdG9yLT5zdGF0dXMuCj4gPiAKPiA+IEJ1
dCBpdCdzIG5vdCB1bmtub3duIGF0IHRoaXMgcG9pbnQuIFRoZSBjb25uZWN0b3Igc3RhdHVzIGlz
IHJlcG9ydGVkCj4gPiBmb2xsb3dpbmcgdGhlIEhQRCBzdGF0dXMuCj4gPiAKPiBZb3UgYXJlIHJp
Z2h0LCBpbiB0aGUgU1NUIGNhc2UgdGhlIGJyaWRnZV9jb25uZWN0b3Igc3RhdHVzIGRvZXMgZm9s
bG93Cj4gSFBEIC8gbGluayBzdGF0dXMgLS0gYmVjYXVzZSB0aGUgYnJpZGdlX2Nvbm5lY3RvciBp
dHNlbGYgcmVwcmVzZW50cwo+IHRoYXQgU1NUIGNvbm5lY3Rvciwgc28gaXRzIHN0YXR1cyBuYXR1
cmFsbHkgaXMgdGhlIGxpbmsgc3RhdHVzLgo+IAo+IFRoZSBNU1QgY2FzZSBoYXMgYSBrZXkgZGlm
ZmVyZW5jZSB0aG91Z2g6IHRoZSBTU1QgY29ubmVjdG9yIG11c3QgYmUKPiBleHBsaWNpdGx5IG1h
cmtlZCBkaXNjb25uZWN0ZWQgKHRvIHByZXZlbnQgdGhlIERSTSBmcmFtZXdvcmsgZnJvbQo+IGVu
YWJsaW5nIGl0KSwgY29uc2lzdGVudCB3aXRoIHdoYXQgaTkxNSwgYW1kZ3B1IGFuZCBub3V2ZWF1
IGRvLiBJbgo+IG90aGVyIHdvcmRzLCBvbmNlIE1TVCBpcyBlbmFibGVkLCB0aGUgU1NUIGNvbm5l
Y3RvciB0aGF0IHRoZQo+IGJyaWRnZV9jb25uZWN0b3IgcmVwcmVzZW50cyBubyBsb25nZXIgZXF1
YXRlcyB0byB0aGUgbGluayBzdGF0dXMgLS0KPiB0aGUgcmVhbCBsaW5rIGlzIG1hbmFnZWQgYnkg
dGhlIE1TVCB0b3BvbG9neSwgYW5kIHRoZSBTU1QgY29ubmVjdG9yCj4gaXMganVzdCBhIHBsYWNl
aG9sZGVyIGF0IHRoYXQgcG9pbnQuCgpUaGlzIGlzIGZpbmUuCgo+IAo+IFRoZSBpc3N1ZSBpcyB0
aGF0IElSUV9IUEQgc3RpbGwgdHJhdmVscyB0aHJvdWdoIHRoZSBicmlkZ2VfY29ubmVjdG9yCj4g
Y2hhaW4gYW5kIHRha2VzIHRoZSBvbGQgInVwZGF0ZSB0aGUgU1NUIGNvbm5lY3RvcidzIHN0YXR1
cyAtPiBlbWl0Cj4gaG90cGx1ZyIgcGF0aC4gVW5kZXIgTVNUIHRoYXQgcnVucyBpbnRvIHR3byBj
b25zdHJhaW50cyAtLSBhbmQgdGhpcwo+IGlzIGV4YWN0bHkgd2hhdCB0aGlzIHNlcmllcyBpcyB0
cnlpbmcgdG8gYWRkcmVzczoKPiAKPiAxLiBUaGUgU1NUIGNvbm5lY3RvciByZXByZXNlbnRlZCBi
eSBicmlkZ2VfY29ubmVjdG9yIG5vIGxvbmdlciBzdGFuZHMKPiAgICBmb3IgdGhlIGxpbmssIHNv
IGl0cyBzdGF0dXMgbXVzdCBub3QgYmUgb3ZlcndyaXR0ZW4gYnkgSVJRX0hQRAo+ICAgIGV2ZW50
cy4KPiAyLiBJUlFfSFBEIG5lZWRzIGEgY2xlYW4gcGF0aCB0aGF0IGRvZXMgbm90IHRyaWdnZXIg
YSBob3RwbHVnIG9uIHRoZQo+ICAgIGJyaWRnZV9jb25uZWN0b3IgLS0gdGhlIE1TVCBmcmFtZXdv
cmsgYWxyZWFkeSBtYW5hZ2VzIGhvdHBsdWdzCj4gICAgaW5kZXBlbmRlbnRseS4KPiAKPiBVc2lu
ZyBjb25uZWN0b3Jfc3RhdHVzX3Vua25vd24gYXMgYSBzZW50aW5lbCBoZXJlIGRvZXMgZmVlbCBh
IGJpdCBvZGQ7Cj4gbGV0IG1lIHRoaW5rIGFib3V0IHdoZXRoZXIgdGhlcmUgaXMgYSBjbGVhbmVy
IGFwcHJvYWNoLgoKVGhlIHN0YXR1cyBoZXJlIG11c3QgcmVwcmVzZW50IHRoZSBzdGF0dXMgcmVw
b3J0ZWQgYnkgdGhlIGNvcnJlc3BvbmRpbmcKbGF5ZXI6IGJlIGl0IERQIEFMdE1vZGUsIHRoZSBk
cC1jb25uZWN0b3IgZHJpdmVyIGhhbmRsaW5nIHRoZSBIUEQgR1BJTwpvciB0aGUgRFAgZHJpdmVy
IGl0c2VsZiBoYW5kbGluZyB0aGUgSFBEIHBpbiB2aWEgdGhlIHN0YXRlIG1hY2hpbmUuCgpJcyBp
dCBzdGlsbCBhbiBpc3N1ZSBpZiB0aGUgYnJpZGdlJ3MgaHBkX25vdGlmeSgpIGNhbGxiYWNrIGRl
dGVybWluZXMKdGhhdCB3ZSBzaG91bGQgbm90IGJlIHJlcG9ydGluZyB0aGUgZXZlbnQgYW5kIGRy
b3BzIGNvbm5lY3Rvci0+c3RhdHVzIHRvCidkaXNjb25uZWN0ZWQnIGFnYWluPyBXaHkgaXMgaXQg
YW4gaXNzdWU/IFNob3VsZCB3ZSBpbnN0ZWFkIGZpbHRlciB0aGUKSFBEIGV2ZW50cyBpbiB0aGUg
ZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9ob3RwbHVnX2V2ZW50KCksIG1ha2luZyBzdXJlIHRoYXQKd2Ug
ZG9uJ3Qgc2VuZCBkdXBsaWNhdGUgZGlzY29ubmVjdGVkIGV2ZW50cz8KCldoYXQgaXMgdGhlIGV4
cGVjdGVkIGJlaGF2aW91ciBvZiBkcm1fY2xpZW50J3M/Cgo+ID4gPiArCSAqLwo+ID4gPiArCWlm
IChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c191bmtub3duICYmCj4gPiA+ICsJICAgIGV4dHJh
X3N0YXR1cyAhPSBEUk1fQ09OTkVDVE9SX05PX0VYVFJBX1NUQVRVUykgewo+ID4gPiArCQlkcm1f
YnJpZGdlX2Nvbm5lY3Rvcl9ocGRfbm90aWZ5KGNvbm5lY3RvciwKPiA+ID4gKwkJCQkJCWNvbm5l
Y3Rvci0+c3RhdHVzLAo+ID4gPiArCQkJCQkJZXh0cmFfc3RhdHVzLCBOVUxMKTsKPiA+ID4gKwkJ
cmV0dXJuOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiAgIAltdXRleF9sb2NrKCZkZXYtPm1vZGVf
Y29uZmlnLm11dGV4KTsKPiA+ID4gICAJY29ubmVjdG9yLT5zdGF0dXMgPSBzdGF0dXM7Cj4gPiA+
ICAgCW11dGV4X3VubG9jaygmZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7Cj4gPiA+IAo+ID4gPiAt
LSAKPiA+ID4gMi40My4wCj4gPiA+IAo+ID4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+
IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKLS0gCldpdGggYmVzdCB3aXNo
ZXMKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
