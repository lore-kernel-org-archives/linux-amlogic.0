Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DEDCD6E56
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XLMmGG1p7ounmt3EJnV0SrmbXQnQZuMva4g2wnl364=; b=D3NkxxUmizlLU4
	nHrlhOw+aB8/n2mx9U3OP0vVH87wUETNqZQ6QrVtYhdWM3ejusD/1xWX9Vcwq6xqXNbuW7WX/iH0V
	84MZ6YEcxM7K0+a99kH8T7SIseQ+Jd45holPxxqr7S1DvxDuakbdVpQ4aL0Y7xhPanA+BeGuwAI7H
	nGOn0urSAexmCUK8msXlgOcR9SI/giicN+fMZ3H/1oRx5dNujBgCQrnhQa+zqhEK/uNYbTaRYsWtD
	E1F4Dp5+XlEGVZhETN3YmwyABl2rxsnQF1c2Ac7y6FGCAX9gOYBx/N/pwbv8Ea9y1FEKsPVGNmzyk
	uMO7Q8SfwNyqCTlCJoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmIm-00000009sNP-2ghr;
	Sun, 31 May 2026 19:58:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmIj-00000009sMf-10jX
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 19:58:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VIkv1o2693282
	for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 19:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=; b=RbTVPKA/5wmS3W0/
	cUjJTZHMCY9tm2xDovY5HG/R+QoYu/vLCSihmbj5S16JknFgrb4b8OVo8TrTKZC1
	qlIull9mxJRz4gP3mVRdPM5y8X5AS/VMdRWozNwUBYHvzeT6H7EWEWLxX9j+U1c3
	lOFv6BdyVKD0UozxsAewMm1Zt7AGDUdaCucWB5h/xSIX+xI/feF5zj7pRg15cHkx
	xwC/QtaQXFkGd5NFhSqbHEXgcZWwqsadkgm1ELads0Z53OgGYApx2EFhkjKFnSwF
	MiibEEpyuuH6A00BYmutOu18Z6BntkVTnoPWU1BEFkE5Pirh7RhZlQn2VKgbvM+Y
	x1rGnA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98cb7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 19:58:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cced8f230bso18884826d6.2
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780257503; x=1780862303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=;
        b=BHGdhKQxOMpm/m9hpgpEZdH6NOi2+i85xZmRm34ALcLBlz1Zw0uu2t3tPsNfceEDA9
         fDIy5cMgXer0BJUZZwXwY+DkHMU2gO8NJro2WsPQkpY5Zi9B2SCAUZ2d4B1smBQNOox0
         SkG/dZvf344OgrzVBYvr6ICJDBZoXpRHmXZ0G9VUrMtru0E5S2I4seXPqBmyD+NNzGXy
         RYSMEyrnralwKuHisqTaUSeyrApK3p6CTwegyFfap7eF2gwun2amaocUXUC+36clb5PF
         e/zzUDY/AjoKKkbxxapt2XgJoJSPMAGyof3dQGFSXQjeUXLFxwqrHDugfzMMhZ8AjHKt
         GqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780257503; x=1780862303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=;
        b=ngjzJgOGP7pEVUwIs9x4Z7LerTsGT/VgOFVCSeUdLu1tHqbGZGlGjZNibwjwiEZInw
         gbMw1t5K298b8gdYyy+T8NFZBYUP1F4pxiV6eNTDBAd0nmJ4wWFQrcHBHKWcI2O6ZKlQ
         Zs1baS1KM2yo/oQqZ1KpppAmOXOfjy1f0+N2IFe6cmV0JfyaCIotXWefJNMZ1Y5s4qmt
         yFZH4IKES+7ULtR5UKFWyVjHcDsvrvmBzVKnRuFQx36wiVsv1cHEFxIo0Q6UOW+wQkDp
         2kaN2bQDy6x6iAhnyakBuBOjktNvtGYF7lDM0J2KhRsxIgNaNjO3ddEGJoO4cIVmh3Pt
         fU8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MJBNHnTkzPm8pmdVIxzBrGtQh1IRjUfbWu+nymlwRoAsuhFB0OMaZ7cFmTUoEbdvW1CQrwfTMacSKJBiU@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlv1kvX4UyX/d33Qsf2KYGT+nlaaJEDfTz+AZVRySEBciKEc+
	ygLYkomJ5hkh9Y4iNV2EHJXEqnk8/IYcI9cLs9h2n2hnDg1uvm4ZMPNmbrKrIw7q1Ikcdqu2G0A
	XnJOY4NukRvAk7yjxBuYSrbSSA/xnWuGuDMpU8e6DmhCUX/xMlagUdC1Hy9ZFjRZxTvhfievHCQ
	==
X-Gm-Gg: Acq92OFFQorxuF291mEAQ3KzAnDhbYAinV87g+25YVZtAGf/VPb321eD/HqbOUuHMKD
	xPxyqk++TvwmWsOHEk3d9srehGYqoLLn/dZ9CQcn2Pa1RfSxxqcUUyCwR7FLxCasqg6drzzhvg9
	XsONBmhgeAckFbMpMrFQFRsI8Ptvn6kuyBwwj/RjoyEhf2iAHY/RF1lISFR7uanECD+cAFeehRo
	671KooUcNqTaXuIabP046EeW6kl8LyFhacJ+Fv2sTMxY5/H2CNvWUY7+IjoJiV4mV+6n724Qs+T
	qqoitBD+r2NHaqFPLCeqrgM9pQde7Dd6kzDhi1W4QHSm9V0e0ANf5wZzDydYkJxN4v6g6G5zz2Y
	XLfC85JiWkFWnElyRBhiYDsx4bT2NaJMk0+oEtGMDYMG1zzzh3i8raRYg+mey7jBhF0xL2XcdQ/
	te
X-Received: by 2002:ac8:5143:0:b0:516:dede:2094 with SMTP id d75a77b69052e-5173a8b0d5cmr70777141cf.55.1780257503409;
        Sun, 31 May 2026 12:58:23 -0700 (PDT)
X-Received: by 2002:ac8:5143:0:b0:516:dede:2094 with SMTP id d75a77b69052e-5173a8b0d5cmr70776921cf.55.1780257502956;
        Sun, 31 May 2026 12:58:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d68a925sm303091335e9.2.2026.05.31.12.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 12:58:22 -0700 (PDT)
Message-ID: <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
Date: Sun, 31 May 2026 21:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1c92df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DmWT0VEtOxJI-Rt19aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: KUdxeZYWkdSdY7YC5Ddl-4NSzl3yAKai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDIxNyBTYWx0ZWRfX0YBxa0OHaf8l
 Y+OkiVMJH7J+Qx4sl9nouClqigSzcK6k5DJrKSduIZXAC62klo4e2csrqwFnjjimVjsFd/cTX9E
 QfivKlAGCdtFEuBCkjaqItd4k28fEQiPYRfiXZbeLb8lTmAcyfbLR1BMbWTy3fZjWG7Hzdh1mWe
 3774mSEt1e4j7qjPzf7bEx/tr87Gd4lmfneZKWktzIUl3JHcIhuK5qu+8QrAJQ0oq4HOyg9IJ5n
 YlF0WsThShKnezKx7F+qoCxK6Q/9KaCBOIqsY1TRTQ2EMxxy36PIrGHqnPCeU5x6E7mVad07cdA
 tj5H6tzITUwGLoUlzVzJLekd2pZjJaoSbBaNRay4qWfnzJK46gsZvmskYIvb/DjMDYwNnHlgMRF
 TphTyqrm0fq+UXSkXz8QN8aIG1efaCFkllUAGsC/ey+S//lfX8bcN4lTNX6R0bGBzaFkmxHzMf1
 6EKwpbigIdzRF66Qktg==
X-Proofpoint-ORIG-GUID: KUdxeZYWkdSdY7YC5Ddl-4NSzl3yAKai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_125825_391326_F2945A81 
X-CRM114-Status: GOOD (  15.93  )
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

T24gNS8zMS8yNiAxOTo0OSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gT24gNS8zMS8yNiAxMDo0
MSBBTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIDUvMzEvMjYgMDk6NTEsIFJvbmFsZCBD
bGF2ZWF1IHZpYSBCNCBSZWxheSB3cm90ZToKPj4+IEZyb206IFJvbmFsZCBDbGF2ZWF1IDxsaW51
eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKWyAuLi4gXQoKPj4+ICsjaWYgSVNfRU5BQkxFRChDT05G
SUdfTUVTT05fU00pCj4+PiArCj4+PiAgwqAgc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICptZXNv
bl9zbV9nZXQoc3RydWN0IGRldmljZV9ub2RlCj4+PiAqZmlybXdhcmVfbm9kZSk7Cj4+PiAgwqAg
aW50IG1lc29uX3NtX2dldF90aGVybWFsX2NhbGliKHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAq
ZncsIHUzMgo+Pj4gKnRyaW1faW5mbywKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHUzMiB0c2Vuc29yX2lkKTsKPj4KPj4gRG8geW91IHJlYWxseSB3YW50IHRv
IGNvbXBpbGUgbWVzb25fc20gYXMgYSBtb2R1bGUgPwo+Pgo+Pgo+Pgo+IAo+IEkgZG9uJ3Qgd2Fu
dCwgYnV0IGlmIEkgc2VuZCBhIHBhdGNoIHRvIGNoYW5nZSB0cmlzdGF0ZSB0byBib29sLCBpdCB3
aWxsCj4gcmFpc2UgYSB3YXJuaW5nIGJlY2F1c2UgJ20nIGlzIG5vdCB2YWxpZC4KPiBJZiBpdCBp
cyBhY2NlcHRlZCB0byBpZ25vcmUgdGhpcyB3YXJuaW5nLCBJIGNhbiBzZW5kIGFub3RoZXIgcGF0
Y2guCgoKU29ycnksIEkgZG9uJ3QgZ2V0IHlvdXIgcG9pbnQgOi8KCidtJyBpcyBhIGNvbmZpZyBv
cHRpb24sIG1ha2UgbWVudWNvbmZpZyBzaG91bGQgc2V0IGl0IHRvIHllcyBvciBub3Qgc2V0LgoK
Q29tcGlsaW5nIHRoZSBmaXJtd2FyZSBhcyBhIG1vZHVsZSBtZWFucyBpdCBtdXN0IGJlIGxvYWRl
ZCBiZWZvcmUgdGhlIAphbWxvZ2ljIHRoZXJtYWwgZHJpdmVyLCByaWdodCA/IFdoZXJlIGlzIHRo
ZSBkZXBlbmRlbmN5IGRlY2xhcmVkIGluIHRoZSAKbW9kdWxlID8KCklmIHRoZSBzbV9tZXNvbiBp
cyBpbiB0aGUgcGxhdGZvcm0sIGl0IHNob3VsZCBiZSBzZWxlY3RlZCBhcyBwYXJ0IG9mIHRoZSAK
cGxhdGZvcm0ncyBjb21wb25lbnQuIE5vIG5lZWQgdG8gaGF2ZSBhbiBvcHRpb24gZm9yIHRoYXQs
IG5vID8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
