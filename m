Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C1CD6E57
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xh5PhewLfsJCe+s3XYR+kTHZTzK7Hkys2QESKGic194=; b=IF68DQAAlus2tV
	JciwKbg9uXxfQ7pxObsHr4Kw2S+BjVa8wn11dkbxXPiEl+4odMP9F3fbWY5zHRzbdlLBac5fTGKcB
	U+IJ5khBzKjY4VMzq/WWh8hJWUrHzs4ipKZaMOeYi4qXuQYROm47UsCHJDJBntA7jg52DW/ikBAcg
	nttV9MYWD4Mq/rcrzxmEyTOOqjwfHyTI7JlHnoOZSkqYwgb563thwkAGW+0Hvs5VQoyF+cl0cnXr7
	QDxZFTFARneV79/MyVsaA8K45Eyall8gdzknu6g/Q8+Wc9eW7gtlIbCnrkrYNu1FR4cKBvQu1RMuD
	d3zpPq4odn4wtw+yHKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsY-0000000CiZ6-0ATL;
	Tue, 02 Jun 2026 09:57:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsV-0000000CiYC-1nJo
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 09:57:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527h0BO1638677
	for <linux-amlogic@lists.infradead.org>; Tue, 2 Jun 2026 09:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=; b=Ml0VidQalj29yJsu
	yjtrGcwJfFwI4bUKkiGPkA64nbJfMJPF7txo6qLnsHeKQRxXb/1WesRQl6mKOMbg
	S3ZZ0uUzvjIoHxHwATSbrl4fxCBZow+sBhWoHIQMYY6t1QHKleEVYnHHX4Fmsg2h
	HjGvTIYxiOUilZ3t9NJQR49EZF7epF8pYG3PBmdJxyRPLirUUMtSzPxcAfi49FQ8
	lxjK+YLD92qCnNjbrWY8fttXN1oWlOvhV7/6DGiaxr6jirzJWgePxVPvkPX8cjr1
	DtEobXlQ3CfNufWByrUTt4Qz+Um/WUJS5ILhPKgbeD9lwsxsJAEyIKqQEQhWihGR
	R1OQnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cgj43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 09:57:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176d5d7222so7648721cf.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780394261; x=1780999061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=;
        b=eacQi0TN9I9LybGrEwZcogMaJNRCYlgq/u5OoCToFllBE76g9aTGA2eqAR5jPFtRMA
         QBKVMe9gHIgr0aAmOehuyRfzc4AS47GAAzjgOTO7Sk3Zifi7eCIrB9K88xdeCBFHAVu5
         TEfaP0T1pVEN7v7IB2+TC9L8NPgHW9A33d4aqCnGIHWz12PuFjPP9DuNiSFkByrA819q
         SWiujwVC6ElJ9Tx5gP33x0eeZQnOA6lhNOzOKNpVGsG6pzY5cNGST2KvAZ2wvfEckf39
         6cVKReitW9LGTsvKmW7uX7Ua9DVih54owMod6h27uxsc+g4aqI/8V9mdomGllsuX99rF
         41FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394261; x=1780999061;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=;
        b=IZQ3/Ga0jwAuCa6x+Lo35l7yeb4Zf9EbEJafAnJQDn75yR38jQVoYICznYJK3hMP2d
         FXOKdqJIj0xspJuWxXMrB1wfgQESK/nQ5M0eiPZGAA+5rL1f0enY9tyAasBJCK2UPpcG
         5nsQLgAqQCSP/G9aEgrCFg8mPDjUVfr/AjL1gGLz1kdOrGIy1l+Uho4yWwvKDK0LZpGU
         fZ29o7FRnCtL2PEmjnJGKc0dKvId557Gu+t54qW7y0Pks/NpMm+A6B6rDVfQ6dIlm46n
         zOpXiu3hgA+RSwPmv6Lm3Hp8cpjFtekjUujM2N8a0nIFj4kzJcMtR73dUdiq5V3HU9+D
         HXuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y4ZRqsE02m03Kgw/ILQw3cAHHzHMYYoBWCZ1y/Zvrvfa8wgDHe2QyuWCFnCZMAz8UX8XuNWJ85BPsj2tH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyslx7ErhRGdTfio6t48G9rvQUhJ5x/mBkz5lDXIfK8avBC4QuC
	42/DVFSXQRK0YhOgSwtda/IMKcArx301ANm3nFNS7GwPyLEMTmlh+Ru2oR7Am/9aBTVfqmyuV0I
	DSECLpcOdZ0sPFb6RFeES2xkra8vpQulzusyS/9L4Y+tndsTU2YrnYVKez4xDguz2HgyBmIErLA
	==
X-Gm-Gg: Acq92OE68Zxxxh3RTgVpNF5lk+n7b46BnQiCeUUT6p8F6cOdlxc+XZdYzV8QC2CkY5z
	3HUtO1RHbuIa47WP7DXWO0tKZrPALc9Dg3iSwVuiCon0LzdQMpa+yrJEidYQ9nGtVgjRNjSSc8q
	Tea8b9bD4W/3sNfi+9hoNobgSOHutXUwDo1VPzapEEas60W9+zEUDpA9mCjsE8QM8b6GyGCa4vE
	Xg+uwYyQ+Fm7edNUZ6jIG8mIZcc8jXSO2MGXgtfN4iBnSV4X9ymSRB1UkH5jHM9OkJf3MNZX/0/
	zcYmgq3aOKVNGukx9mpyBVtM83drYlq9/LtYUOmgCqwJzd29F0RLWhXx0vtbhz2mX9jsm1dD9M/
	YfKTmpmf2pF9Udtnn5duuUQ4fiXLZDP6BeDdwPRO3SgiiVkAN61dKtMhZISvIVc+yZ5RPngmrZx
	F7
X-Received: by 2002:a05:622a:790e:b0:516:e033:f5a8 with SMTP id d75a77b69052e-5173a8daddcmr155758611cf.59.1780394261458;
        Tue, 02 Jun 2026 02:57:41 -0700 (PDT)
X-Received: by 2002:a05:622a:790e:b0:516:e033:f5a8 with SMTP id d75a77b69052e-5173a8daddcmr155758251cf.59.1780394260962;
        Tue, 02 Jun 2026 02:57:40 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af0babdcsm37044295e9.0.2026.06.02.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:57:40 -0700 (PDT)
Message-ID: <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 11:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: x7773bqxTKuGKKlnNzONhqJPg122N6xC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5NCBTYWx0ZWRfX09ULTTmWLb+y
 PbfnWpSSjobOEHIq6CTscd3ocvOlc4zWXYyn1Jia6AZbn1XtwsYR/zVEP3+B+jyJ3eXLOb50e17
 pwuoU7d3ptjDKzsdfe4ohRkjL7hQPXri1s8Tr1Ar899+Q5maK34GFS2I6x0ebYGRMcThH4PlKN4
 5F6X8ctFPbuUZT0FXy5DwGv86heVl/t4SWPANcWG4AQHTfUlyd5fibVEH83EVebnBahM0zQ89t8
 xdiLw9Xjf040VUlFLwfh7lvPRaRLGGmzoGShvUtB2ioUbHM51wWUthIY6jVwTLh8tEPvmNlMScf
 1BMX+TLdil6E7x7O1sLOtbQ3n6Khg7lql08gBuPndNdLgDBBq7HrOFyc9qiAld2zySwxWEp/rmT
 0qf1uwg7zRrQkLGMsw0H0las92SApAYChQb97nrmCLpYzN2Um2CVx+njwKRZwYHip/RCsP1aFEh
 KpL3TrhSsNl0yHwLaGg==
X-Proofpoint-GUID: x7773bqxTKuGKKlnNzONhqJPg122N6xC
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1ea916 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Fuur4Mi3Lvfw3V_heQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025743_602283_364854CE 
X-CRM114-Status: GOOD (  16.08  )
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

T24gNS8zMS8yNiAyMTo1OCwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gNS8zMS8yNiAxOTo0
OSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+IE9uIDUvMzEvMjYgMTA6NDEgQU0sIERhbmllbCBM
ZXpjYW5vIHdyb3RlOgo+Pj4gT24gNS8zMS8yNiAwOTo1MSwgUm9uYWxkIENsYXZlYXUgdmlhIEI0
IFJlbGF5IHdyb3RlOgo+Pj4+IEZyb206IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2
QGFsaWVsLmZyPgo+IAo+IFsgLi4uIF0KPiAKPj4+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX01F
U09OX1NNKQo+Pj4+ICsKPj4+PiDCoMKgIHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqbWVzb25f
c21fZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZQo+Pj4+ICpmaXJtd2FyZV9ub2RlKTsKPj4+PiDCoMKg
IGludCBtZXNvbl9zbV9nZXRfdGhlcm1hbF9jYWxpYihzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUg
KmZ3LCB1MzIKPj4+PiAqdHJpbV9pbmZvLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1MzIgdHNlbnNvcl9pZCk7Cj4+Pgo+Pj4gRG8geW91IHJlYWxseSB3
YW50IHRvIGNvbXBpbGUgbWVzb25fc20gYXMgYSBtb2R1bGUgPwo+Pj4KPj4+Cj4+Pgo+Pgo+PiBJ
IGRvbid0IHdhbnQsIGJ1dCBpZiBJIHNlbmQgYSBwYXRjaCB0byBjaGFuZ2UgdHJpc3RhdGUgdG8g
Ym9vbCwgaXQgd2lsbAo+PiByYWlzZSBhIHdhcm5pbmcgYmVjYXVzZSAnbScgaXMgbm90IHZhbGlk
Lgo+PiBJZiBpdCBpcyBhY2NlcHRlZCB0byBpZ25vcmUgdGhpcyB3YXJuaW5nLCBJIGNhbiBzZW5k
IGFub3RoZXIgcGF0Y2guCj4gCgpbIC4uLiBdCgo+IENvbXBpbGluZyB0aGUgZmlybXdhcmUgYXMg
YSBtb2R1bGUgbWVhbnMgaXQgbXVzdCBiZSBsb2FkZWQgYmVmb3JlIHRoZSAKPiBhbWxvZ2ljIHRo
ZXJtYWwgZHJpdmVyLCByaWdodCA/IFdoZXJlIGlzIHRoZSBkZXBlbmRlbmN5IGRlY2xhcmVkIGlu
IHRoZSAKPiBtb2R1bGUgPwo+IAo+IElmIHRoZSBzbV9tZXNvbiBpcyBpbiB0aGUgcGxhdGZvcm0s
IGl0IHNob3VsZCBiZSBzZWxlY3RlZCBhcyBwYXJ0IG9mIHRoZSAKPiBwbGF0Zm9ybSdzIGNvbXBv
bmVudC4gTm8gbmVlZCB0byBoYXZlIGFuIG9wdGlvbiBmb3IgdGhhdCwgbm8gPwoKVGhlIHF1ZXN0
aW9ucyByZW1haW4gYW5kIFBSIGlzIGFwcHJvYWNoaW5nIC4uLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
