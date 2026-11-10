Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73632606A76D
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsEvXy9+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0mLqlxo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZEyw8Mg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bh5KHL2QGmJcc2/qEUvmeJPHpkZ5K+XK/3FtGVUH3z0=; b=KsEvXy9+pkwsgide6KmjyDS+0W
	nJ6CSUdsoOoOrZnlbREvR5+58mcPN4igoUnYLuuKDL9Nq3k3xoidL9jPthEYvU4wwMsjOilpfywMq
	gUnuGgwcQZ2WFKrRRFEcHNV/LcxCwLVtTwr0VK8R0+9sKJKsQl/qT2WrYkpxyqM3cR3CT351YTUec
	OhBvnI15gieDdGmjW7LuXA3EK4cdKl0HG/mp6jB+1mxJqlYcXpeQ+oyg8LN+3I7zZF5X2uBz4G+JP
	4O5ifj47WdHSshiLh76LZM5FjFi+u4uld7mjbBHDAFbN6TJcQsyd35ObAtrZLmBOZYchWiPN1Eg/V
	h0oAbklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm4x-000000045Rw-1Sjs;
	Tue, 10 Nov 2026 13:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm4u-000000045QO-0a4S
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 13:40:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA7jp3217118
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=; b=o0mLqlxoSJH4Vg+j
	xmwO9g4nHNXv/rczj6LLRRYhI8zuBowS5nt8SyRGQ0SPUTsx8d0zsE8MV9KqcoCw
	xbKZjqX7pye5oSoHGDt2R9bnFLoutzMs2bNQ06GVuZJv0Zap74CZRwLobZDA3CiN
	H0jDzriebLpxV80HVbkIElkKidp6vx4UMrI9aYBdpjx3NTstUyFC9WfmmEVbgFoE
	rlh/slodkkYFGELZgaA+bTRFCHudApaw/fKC0c1d5wUNWKNJ7vQuxP8tx/schRNJ
	W2x6aQzLEeh0M8LwOMntJ32rl2rBfy7c9semCBHWqm4acybcmQz5hWK5E/BgbX1w
	xcd+dg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9vdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 13:39:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e942b1cc86so20156135ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 05:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317998; cv=none;
        d=google.com; s=arc-20260327;
        b=azz2h1Ga5M7kGjlljSv/LciuNXS8oxlNm923sjaC7hEe/EU8xx4cYCJDb+8ysAbGj3
         bLQZhnTdZDX+6nLUOUBo7/GxaNNRLtMbBaCpVPbbFFyYKDdekek6Av50YVwMzmOIIloD
         E4YCATM57z7p7jehudzwCL6cN4WJiECuFvAuZpBYiQW07whSJwIzwke5pZMhbU0FtHaU
         /E7JE3ZYH11GyhVEZ1stJCpDPH44gMq/yD5xWQ6xxgKQV1cIBABSKzv7X5pwHvZSxSKa
         H/CgE8fUIuCRPrRgjEmBPZqC0QyNLenf9lwVLz8T8MZL+fNRu/Arci/K0CdyZtvQ3CLT
         CfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        fh=WK+FXEcI6m0gHSS4Gtcf4N5vYv3mdaa/P7skJlup+20=;
        b=PhsjmQ8SMQJW8zlLHPWD28GnCO/AgS/daY82EsQJToYURBBfjVx7DGZVeg5utAHT5Z
         rPxaubpYhPONPBJxX4PDv95rvKUGTGdeLoWEzHopTebicuxs1xCkbxTQOSL1D2erzF2t
         5yF+//1rdCCPvpj2YxTffzS099KVr6SyJboJHORdkV6LQ22mE2nw4yEk05tk0Nnzl7U2
         FprCdkeXcGVEtdvZxXxqyQLQn3X6VmkwFyqmhiI/MpVsqp+9KzugSMOytsovgJMBqsTA
         R3hviSEYsIjh8ZrKHEr3a7DH6kyOfraxr6Nx4cqQsWucrIu71m1Q3Td84aAUWZxaCglL
         +gwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317998; x=1794922798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=GZEyw8MgxcBzYBHePyt44YY3a8QIGGdytYZyOi1wXJOy0USNdFUz0mBgxC49tJJxPX
         iP6ysOhdPir+UNQ1HCSMqR4CliA8MMxb247Ig1qH2cAB4KQ3GL+Mts5nPzDDZ/4Uygdn
         o82Ot+wWCUR5lBYingXpQ/0AkMfUlZWBEp/WtABI60MBboAohrytY3UN6FBd8ongShVW
         qeGWBzki9iOjtjur4Ob95p+kS+TJKViiNODmQSKdd6a5aPGzWbelp9t7LBNqxVEX7Gyk
         adxey+lRRYAw5CcIe0E5x+3fc5E58Zu6HAA3wZvVcRjgc9XgHpwE5/3+uRT/FVKFQuvZ
         Gu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317998; x=1794922798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=pQgxjox6I7KSf8OvytlHdjMfQ6e4ntR8sy5NSDyTtYq1EZyJvTZEC0LcAxx6YXe8AY
         dOsWunpjZPUW1quNKuBjoqlHWyWJjoIWm2TTOQgl1Gpe/qgrOaxChrWic2DTIsqx46Xx
         tdSni0Bv9F8xgu3gtjGrwUK0VntNNuPk8XMNCbg2nEsniw+cgZADXTav2VZi/sZHpjAl
         T+zAj18RjA/vhv+WueB9qi3r0KBdoS88nDgP3TfpWFjYmdW+XkKDKJ8bZSMl9/7ltsXO
         6eiG3+Am3QL+an/nGuHX9d4qycog9yFcECUbwGIpfoKLhMcxM2uquaOvmQPBS2qd5ss1
         /HyQ==
X-Forwarded-Encrypted: i=1; AL+hErGcqzfk9gOEBeNscc9oylQ/bvOfBOgjKzcZtBxK0QwoARjQOUYAWvKFER6U+2L+JKh2CpuHoFZjhqi4LspK@lists.infradead.org
X-Gm-Message-State: APuU4Z9WgI8RN/Lcksgdo8UJEQlgEhKrUr2Ul1j38os0cXi0ViEBtdmW
	lgX+w92wrCW91rnYDMsok+4ygXweMvYvI7zsoyMGwjSh9K6NOEZ1ZBFBFd45mhJy6tLGNV1RDZK
	CFeNiDc1yQzuV94Fa2w2MMfdX/cMdVTuPEgzl0ISzIwMsTiw/Q5/OWOThICekx0mKRsuFkD2gQm
	XYCXQlaiBr5TQoJgBYD2TcN5ltr5CwrRz9+wv7XFPwOe7a9htR
X-Gm-Gg: AYBFou1WBF/JLmI8FmI9BLM6lk19JjlR4jy1mR0dP4SI7ZjgmTMBJq3SnQO6Z7RUH8R
	H0gM2GEFNiq8xVC6vpm1Bvn+H4oHQtvJCDGdX/sHoXZXNJT9P5oL5XaPBDw/GrmigONLyAIpNFy
	KKFO4dtJfklvawSmyxVxiQIvM3HV40zq+sQgna7osxtWhxcgWoE/1IMqQLaw==
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id d9443c01a7336-2edb9164bf0mr23948555ad.13.1794317998158;
        Tue, 10 Nov 2026 05:39:58 -0800 (PST)
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id
 d9443c01a7336-2edb9164bf0mr23948385ad.13.1794317997703; Tue, 10 Nov 2026
 05:39:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
 <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com> <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
In-Reply-To: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:39:46 +0100
X-Gm-Features: AclHuK9Cj5Yfw2Skuhr4nlPjsEojXxiMikKw6Cl-Wxr-T9dRxocHgrBfMronDNQ
Message-ID: <CAPx+jO_oAnJFY9hodP6gxPCD2ch0=+0MNXkKoJXz=3OzeAq+iQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: HELPMEEADICE <yuanzhenpeng210@gmail.com>, linux-mmc@vger.kernel.org,
        ulfh@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Proofpoint-GUID: RHMGb9BW61zwSzlstHKU81lHomTiZRc8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXy2kV8NaTjD08
 gJ8Q4az5/eAX1WR2ca7inR3jksK/BQZB5E1RGHDl4vnvLHdQkOwuUt1U5MWmhPLVO6ugZrbwk5f
 iGNxJDSzGCl+XUMMTbz96FoU69aZztY=
X-Proofpoint-ORIG-GUID: RHMGb9BW61zwSzlstHKU81lHomTiZRc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX8VWxEKjW+agn
 owDRcOhIwX69zZDCQXDVhkuuJHrp1gKJbrhSztaGSLG8juzwqsm1E444ZegDnvOf9oarXZOv6Tt
 MMoAstF979nZZm1XKk5SIR5aKJfh8os9+t7Qup6YIwziWnbpWnnY11q17cBVHhp3c3JnHZpusNU
 0nt8q3za6ko6XFBHD+rWsg2PMu0P9YDKR9Yc7USQfNUOXeET8re5LQzXQQKP2QdnjCX8vwPfDgX
 M6SHc6Iw/tCslysbZvQvyGougklK0nd/Fit5Ff5KStStLDsz8TpVlqfNYIIyei//JkaWtI2WhgX
 EDMynd2JiKPcrpSK9HejX6oJ3cKHXkReZwJLJIcQj9cPZp8Im7byBp8XFi/zt/OoL/MnsM+cIlr
 vEKl5c4mgH+d77r6H+TiEjwmznT78NXqa4mKQpB93yLELMdctvKqsVSROSve0l8I8sOeHynqsTb
 1EgzCzYuMCA9GlPquuw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af31eaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=mK_AVkanAAAA:8 a=pGLkceISAAAA:8
 a=BQpyg1UmJCR0kPwaJroA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054000_300289_8AD8CBE3 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMSwgMjAyNiBhdCAxMTo1MuKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBT
dW4sIE5vdiAxLCAyMDI2IGF0IDk6NTXigK9BTSBIRUxQTUVFQURJQ0UgPHl1YW56aGVucGVuZzIx
MEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hcnRpbiwKPiA+Cj4gPiBUaGFuayB5b3Ug
YWdhaW4gZm9yIHlvdXIgZmVlZGJhY2shCj4gPgo+ID4gSSd2ZSBjb21wbGV0ZWQgdGhlIGNvbXBh
cmlzb24gYmV0d2VlbiB0aGUgb3JpZ2luYWwgZHJpdmVyLAo+ID4gTU1DX0NBUDJfTUVSR0VfQ0FQ
QUJMRSwgYW5kIHRoZSAxMjggS2lCIGJvdW5jZSBidWZmZXIgaW1wbGVtZW50YXRpb24KPiA+IG9u
IG15IFh1bmxlaSBPbmVDbG91ZCAoQW1sb2dpYyBTODA1KS4KPiA+Cj4gPiBUaGUgcmVzdWx0cyBz
aG93IHRoYXQgTU1DX0NBUDJfTUVSR0VfQ0FQQUJMRSBhbG9uZSBkb2VzIG5vdCBpbXByb3ZlCj4g
PiBwZXJmb3JtYW5jZSBvbiB0aGlzIHBsYXRmb3JtLgo+ID4KPiA+IFJ1bnRpbWUgaW5zdHJ1bWVu
dGF0aW9uIGNvbmZpcm1lZCB0aGF0Ogo+ID4KPiA+IC0gZG1hX2dldF9tZXJnZV9ib3VuZGFyeSgp
IHJldHVybnMgMC4KPiA+IC0gaG9zdC0+Y2FuX2RtYV9tYXBfbWVyZ2UgcmVtYWlucyAwLgo+IEkg
c2VlLCBzbyB0aGF0IHdpbGwgcHJldmVudCBpdCBmcm9tIGRvaW5nIGFueXRoaW5nLgo+Cj4gPiAt
IFRoZSBibG9jayBxdWV1ZSdzIG1heF9zZWdtZW50cyByZW1haW5zIDEuCj4gPiAtIFRoZSBtZXJn
ZS1vbmx5IHZhcmlhbnQgYmVoYXZlcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBhcyB0aGUgb3JpZ2lu
YWwgZHJpdmVyLgo+ID4KPiA+IEhlcmUgYXJlIHRoZSBzZXF1ZW50aWFsIHJlYWQgcmVzdWx0cyAo
TWlCL3MsIG1lYW4gb2YgNSBydW5zKToKPiA+Cj4gPiAgICAgICAgICAgICAgICAgIEJhc2VsaW5l
ICAgTWVyZ2Utb25seSAgIEJvdW5jZQo+ID4gICAgIDQgS2lCICAgICAgICAgIDExLjgxICAgICAg
IDEyLjIwICAgICAgMTMuMDEKPiA+ICAgIDY0IEtpQiAgICAgICAgICAxMi44OCAgICAgICAxMi44
MCAgICAgIDU3LjUyCj4gPiAgIDEyOCBLaUIgICAgICAgICAgMTIuOTcgICAgICAgMTIuODAgICAg
ICA2Ny42OAo+ID4gICAgIDEgTWlCICAgICAgICAgIDEzLjExICAgICAgIDEzLjA1ICAgICAgNjku
NDMKPiA+Cj4gPiBUaGUgYm91bmNlIGJ1ZmZlciBpbXByb3ZlcyBzZXF1ZW50aWFsIHJlYWQgdGhy
b3VnaHB1dCBieSB1cCB0byA1LjN4Cj4gPiBhbmQgc2VxdWVudGlhbCB3cml0ZSB0aHJvdWdocHV0
IGJ5IHVwIHRvIDIuMXguCj4gTGV0J3Mgd2FpdCBmb3IgVWxmJ3MgZmVlZGJhY2sgaW4gdGhlIG5l
eHQgZmV3IGRheXMgaWYgaXQncyBzb21ldGhpbmcKPiB0aGF0IHNob3VsZCBnbyBpbnRvIE1NQyBj
b3JlIChlaXRoZXIgYnkgZGVmYXVsdCBvciBvcHQtaW4pIG9yIGlmIHdlCj4gc2hvdWxkIGtlZXAg
aXQgZHJpdmVyIHNwZWNpZmljLgoKSSB0aGluayBJIG5lZWQgdG8gc2VlIGFuIHVwZGF0ZWQgcGF0
Y2ggdG8gc2VlIHdoZXRoZXIgaXQgbWFrZXMgc2Vuc2UKdG8gbW92ZSB0aGlzIHRvIHRoZSBtbWMg
Y29yZS4gQW5kIGV2ZW4gaXQgd291bGQsIHdlIGNhbiBhbHdheXMgYXBwbHkKaXQgYW5kIG1ha2Ug
cmV3b3JrIG9uIHRvcC4KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
