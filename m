Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E8D606A320
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qdUg1wFI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoN5mx08;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmK0z6jA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iC6OWHr6QRAVLfs2pGfYjXXUIPslNDbmOTLAONj4Zmc=; b=qdUg1wFIDAUj7Nom4XLb1Ej3vF
	5JKQda7pGrPBNs6siqECCQdXl7UYslW/MY84t2AyhWLI1PkX6vLd5heXuqsdUYw8okRZU5/7EOO8O
	Q6jCDenefM4qRz91lvUbG6MOkGlsNLMXi/BZUw9v3EQPNDe4U6wYy63AjcHb69kRjI9n8d5pvZIzP
	15ILgIpgIYT/PaLIhVx8wm4Ln4feecQ2YAIqsi7KnUSx+3Rfp0Rft923DM1OMtJdUcIMTkzP4N73N
	6DNP2RX4ug2g6IDat1n2UW74VP/hq5+M3jrSzIjULqpXfpazKk+WTVLkhj/1k/s7uM/Ill8Kurdc9
	qE4QGenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKo-0000000BTqa-2uWe;
	Fri, 30 Oct 2026 10:59:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKm-0000000BTpk-3BW1
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FAs82134764
	for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 10:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=; b=FoN5mx08YJMEym5Q
	rgXbClm55skGvq4gNRlOdq3VYj5bvbzTVDcDlzPDAfW2MBCLQpT331mdy1eBbaJ/
	/7BVMVBBszlN4oUHv0gPezwhdeyVijSytqhboPbeT7xM6EZ0ccfy8dlweducXX/N
	q82t80W2DpqBfcMZsLacaTuavA4WkryeZQGbD6gJQ2ifRuEpWxVarNVORqlPbrMI
	KQPOC0Zx/ZmogLXzEQTpOuK80NdtABggXJe1AyhEinXsZnlbeQQzO0WgVJVO4ucP
	ETs8cseSTsYNqB/r3G1Y6hozHOerakapy+NBcEQo7pH3h+ZyCspbbTxOMKUsTh4H
	LfVVcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjjpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 10:59:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so562229a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357983; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4rYeJG4qMf7/QvuwFIXD2dNWu+r9zbWT1Pr0o4chAfRnjUsRoK9o92G+kkBILGfWd
         Q2uaNYO7YzoPxaumtLiEpHK+wmhQ5zNBRVi/1a/SfC7P3mlfAaSaYDGovFqiZCuH2bBB
         uVv5TRuP2FRt2eTyjOZs/eOcJHrf1wNqoDKV5JKu+pUniJ7Rhh+NFqgmPvZRRhrsab7V
         sfVlGyNKkU0g9xZEd5zINFnY6r+wQdxAjaspuBFOo6iRz5oFGj7qqaeDL05acI2TNT3l
         4NiG2Ijz/TI9BPJBjdeO9NWq7a8ijyDFfijIeE2cQjDA9ogcywsuewh16RhtyhYaY670
         FQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        fh=idgnOHNeI3d3MnAOtOPTJ/+fjtG+f/Mc0q89K0cyJZI=;
        b=lDF2wg073ETDZexVVCNQFi35lyhYhJoJIqW95l8qg7HJVdlIPz93LqRTHzIMCmlhhK
         VPzkfpjAdYz+i58lZ0/4CyqLUASxf1RHVZ7FRCziVnaY18Ish+meUstgq6vIqVV14tle
         qZK48Ataq0MRSIzXsypzytR98B8cXs+gw5iPzxi7OfMf6X9wg5i6dWNVxGoIlyqLPcDM
         Dwy+hJh272fwfUd1Hgz+S02Zs1Eqd5oEL5HOYmrb6ABCVw6mxKTX6nTuoRJgSjHDQ0Gg
         aPeU8FRwGkEuG1rMCKWcsoUSKQNiWGOh+XA3dyVkaTlTVclSynMmeTmtyUmFDhfeJshw
         8/SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357983; x=1793962783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=BmK0z6jAns8vUIBHeU+0WpHL+q39yfyuMQPQGvlZqK0pDv7W11gOu+JC1lSNAvjWfs
         Gyu8mVtseJIOAGMff9BZFgAYdl8PGwu5kBscZys8zg/vcqOZeMHRSOdPcQsUXJPuBiaY
         7XIwL8QKjqYhcG6u72TbjwxZdPFQq3Vbio7RjbuTCAa1dvwqTRZW4sKGDFwLKNhy0mcN
         IGc6+29aZXR9EaS03kSSK1SFVyCrMK8AqH0tEdDu4sBSJmFb3bnqd0ynlDgNJjov2751
         qQky5xK6n85fhStc+Bd+zdPdDnSADJO2Go4g+itSuQDncYsytuKSbrOa50UDGGDImlbq
         f9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357983; x=1793962783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=dhUspaibstfloQTWgQ5TwOwtyC+XtZTWhhql8zuaKU7YlhRvRVozXwf0NaYD23BgrQ
         NhRxBSML85+AxYG7xf5ToRDoU9vJkF15jRP/tninlDOzmsinOwruCnpd70pSLqJoeD1X
         miv5DcpbVuGEsK8RTviDz2lPwNFRpB/sxGeV3/37RQBSaqIc8nF+lC0ZtKIgqsqRzvk/
         VRc83V5Hcfvy2PA6zIi3L9iW1byfhYHZP1E3lrI85beNROGu2gWYcrtU4Af0fQx9tt95
         X+vzauERpzzpElSM/DouNRpFRRcDi/N2ALjp4afo2mkBltlyvZPvXlIdmRA1RTMCxzfR
         hiCQ==
X-Forwarded-Encrypted: i=1; AKwUvByJbLLonL+lIpeKaYQnEh7JFa97zOhDPlWuT7Tmb9pQlG2f2/hr/QHSuq7dFB+CDyYMoNcucVLq0+Y64mEw@lists.infradead.org
X-Gm-Message-State: AFq9FYKHFV9M8wWK5B0vPcPEqi0uwl4AYe/J/cnwFQN6+2XltSLl4u8u
	YrUYAwQOYlyZD81GTn0svLzqHQBCk64gF1Fv3l4Bq1TvyJz2Em1t+KN47fqLNSFP1hIJtfYAMj8
	EUINOoq2nwRPlNBhUIPM6a+UOPe89SeVgQdiTl6khz0PZQJj3uZd6wlz+LlQqlKrPyH3xVODaD5
	cWlN1W5DFdD2o/gWOvsQAQK3t2Dl5GHchVJSbcR0L4IkymsqkInXMU/M0U
X-Gm-Gg: AYBFou0g0IdaiaOVfJWinEKNGmifw5WeDYQy58txjXTho6VSrLCquXD37x7k0sBs60H
	50+G6itBep7jfWr89q78X0T6H/TFZsN6SAp/q2+RiJmxeFAh8POUWT1fckc6NJQEeCmOpjrDtlO
	5JA035KTjmLq2PMMbkv7hiSBBB6UDJzgPK75Mc3EiFyAV/zukrj3SqvBWJIQ==
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr1499299a91.51.1793357983166;
        Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3ae8984ec60mr1499273a91.51.1793357982451; Fri, 30 Oct 2026
 03:59:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:30 +0100
X-Gm-Features: AclHuK_ToRvM7ToPCV5jS32tMVtZ5JO73u8yLnSIIXc_hjp9eNCpwZsxviWTqwQ
Message-ID: <CAPx+jO9tr__fFj6ftwbd+VP-GAA66=T8DfHgcDcZLhHhEGY=og@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] mmc: meson-gx: honour the busy timeout for R1b commands
To: iav@iav.lv
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX21hZ1g9Hmuby
 9V4OyWPWpjJTeI/4xc/ijn47t5lMjvTqUg2NeiFfsHL1XCmAiZ7IpDmpbAIrKdHOzAQPG3scs4f
 H/5nTEdptubpvEkrbpbwcI3vA/K63xOSD0uQlTvK9NL4+sg47eqnwY1ftTgOrQsyxbS2OdaD4zb
 ZRPwHBiu5p/BUm/bM6vKeeJ+toXpgNS+DSFfV+tpM/yamsn+8ZpfzWBZkQ/LV73MhezoMH4ltNg
 BEWrYpF+Y6gTveqM5IdXL5fAAxOno68U81VnKAONwbpqgGeEeJ44dUEHTmjlBzVE0EW/6SFcHGK
 ov/yvI/yXs7Si0L1gdOxQPTGmwEmGXucK9NJeB6tVvWB/jZwcfot3wyl8ArCakpEWHQK6vPlXKI
 9RE2j+GoCoOyQsYT3QSdbWGmxej4Rsyez7oa5eFEGNp0FPd2zL9cF5FhZ28DEwewWsqgVx6U8Li
 +mkFjo8+Dvwes84ANLA==
X-Proofpoint-GUID: EL1yPXCe1mBefqD0NikfLYbaT5b9ZZCd
X-Proofpoint-ORIG-GUID: EL1yPXCe1mBefqD0NikfLYbaT5b9ZZCd
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4789f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=r9kgVt4VC4hP7zZAK8AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX1dS4jc5KAAZH
 gHSXnbjBbQ5e7iVf8ROoMaZ+7MTnXmgI4k18lctwfnQSQ8n0UXn2g5Owrm+g+X5D2b4xHXthhAO
 MWn9AXshQInYcsj0+UOEqumskprFXlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035944_826160_6BDA5141 
X-CRM114-Status: GOOD (  22.79  )
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

T24gRnJpLCBPY3QgOSwgMjAyNiBhdCA3OjAz4oCvUE0gSWdvciBWZWxrb3YgdmlhIEI0IFJlbGF5
CjxkZXZudWxsK2lhdi5pYXYubHZAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGb3IgYSBjb21tYW5k
IHdpdGhvdXQgZGF0YSB0aGUgZHJpdmVyIHByb2dyYW1zIGEgZml4ZWQgMTAyNCBtcyBpbnRvIHRo
ZQo+IENNRF9DRkcgdGltZW91dCBmaWVsZCBhbmQgZG9lcyBub3QgdGVsbCB0aGUgY29yZSBob3cg
bG9uZyB0aGUgY29udHJvbGxlcgo+IGNhbiB3YWl0IGZvciBidXN5LiBFcmFzZSBhbmQgY2FjaGUg
Zmx1c2ggdGhlbiBmYWlsIHdpdGggLTExMCBvbiBlTU1DLgo+IFBhdGNoIDMgZml4ZXMgY2FyZF9i
dXN5LCB3aGljaCByZXBvcnRlZCBhIGJ1c3kgY2FyZCBmcmVlOyBwYXRjaCA0IG1ha2VzCj4gdGhl
IGNvcmUgcmVseSBvbiBpdC4KPgo+IFRlc3RlZCBvbiBPRFJPSUQtTjIrIChTOTIyWCksIDI1NiBH
QiBlTU1DLCBidHJmcyByb290IHdpdGggZGlzY2FyZD1hc3luYywKPiBBcm1iaWFuIGJ1aWxkcyBp
biBkb2NrZXIgYXMgbG9hZC4gV2l0aG91dCB0aGUgc2VyaWVzICg3LjMtcmM2KTogMjYyCj4gZXJy
b3JzIGluIDMgaCBhbmQgNjggaW4gMi41IGggaW4gdHdvIHJ1bnM7IHRoZSBmaXJzdCBjYW1lIDQg
YW5kIDQzIG1pbgo+IGludG8gdGhlIGJ1aWxkLiBXaXRoIHYxICg3LjMtcmM2KTogMCBpbiAxNiBo
LCAyLjQgaCBvZiBpdCB1bmRlciB0aGUKPiBidWlsZC4gV2l0aCB2MzogMCBpbiBhIDM3IG1pbiBr
ZXJuZWwgYnVpbGQgYW5kIGluIGEgMjAgR2lCIHdyaXRlICsKPiBmc3RyaW07IGEgc2FuaXRpemUg
d2VudCBvdXQgYXMgUjEgYW5kIHRoZSBjb3JlIHBvbGxlZCBEQVQwIGZvciA1MjMgbXMKPiB1bnRp
bCB0aGUgY2FyZCB3YXMgYmFjayBpbiBUUkFOLiBPbiA3LjEgd2l0aCB0aGUgcHJldmlvdXMgZU1N
QyBtb2R1bGUKPiBhIHN5bnRoZXRpYyB0ZXN0ICgyMCBHaUIgd3JpdGUgKyBmc3RyaW0pIGdhdmUg
NDggZXJyb3JzIHdpdGhvdXQgdGhlCj4gcGF0Y2hlcywgMCBhbmQgMCB3aXRoIHRoZW0uCj4KPiBP
RFJPSUQtTjIgKFM5MjJYKSwgMTI4IEdCIEtpbmdzdG9uIGVNTUMsIDIwIEdpQiB3cml0ZSArIGZz
dHJpbToKPiB3aXRob3V0IHRoZSBzZXJpZXMgYW4gZXJhc2UgaGl0IHRoZSAxMDI0IG1zIGxpbWl0
IGFuZCBmYWlsZWQgd2l0aCAtMTEwCj4gaW4gMyBvZiAzIHJ1bnMuIFdpdGggdjMsIGluIDMgc3Vj
aCBydW5zIGFuZCBhIGZpbGwgb2YgdGhlIGNhcmQgdG8gODUgJQo+IHdpdGggcm0gKyBmc3RyaW0s
IDUgZXJhc2VzIHRvb2sgb3ZlciAxMDI0IG1zLCB1cCB0byAxMjE5IG1zLCBhbmQKPiBjb21wbGV0
ZWQ7IDAgZXJyb3JzLgo+Cj4gT0RST0lELUhDNCwgU0QgY2FyZCBpbiBTRFIxMDQgYXQgMS44IFY6
IDAgZXJyb3JzIGluIDUgYm9vdHMuCj4KPiBUaGUgdGltZW91dCBpcyByb3VuZGVkIHVwIHRvIGEg
cG93ZXIgb2YgdHdvOiB0aGUgZmllbGQgaG9sZHMgcG93ZXJzIG9mCj4gdHdvIG9ubHksIGFuZCB0
aGUgdGltZW91dCBpcyBhIGxvd2VyIGJvdW5kLiBNTUNfQ0FQX1dBSVRfV0hJTEVfQlVTWSBpcwo+
IG5vdCBzZXQ6IEkgaGF2ZSBub3QgY2hlY2tlZCB0aGF0IHRoZSBjb250cm9sbGVyIHdhaXRzIGZv
ciBidXN5IG9uIGV2ZXJ5Cj4gUjFiIGNvbW1hbmQsIEhTNDAwIHN3aXRjaGVzIGluY2x1ZGVkLgo+
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIENsYW1wIGNtZC0+YnVzeV90aW1lb3V0IHRvIHRo
ZSByYW5nZSBvZiB0aGUgZmllbGQgYmVmb3JlIHJvdW5kaW5nIGl0Cj4gICB1cCB0byBhIHBvd2Vy
IG9mIHR3bzogdGhlIHJvdW5kaW5nIG9mIGEgdmFsdWUgYWJvdmUgMl4zMSBvdmVyZmxvd2VkCj4g
ICB1bnNpZ25lZCBpbnQgKFNhc2hpa28pLgo+IC0gTmV3IHBhdGNoIDM6IGNhcmRfYnVzeSByZXBv
cnRzIGJ1c3kgZnJvbSBEQVQwIGFsb25lLiBJdCByZXF1aXJlZAo+ICAgREFUMC4uMyBhbGwgbG93
IGFuZCByZXBvcnRlZCBhIGJ1c3kgY2FyZCBmcmVlIChTYXNoaWtvKS4KPiAtIExpbmsgdG8gdjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMDgtbWVzb24tZ3gtYnVzeS10aW1lb3V0
LXYyLTAtOGJkZTFhZGZiNWI0QGlhdi5sdgoKVGhlIHYzIGFwcGxpZWQgZm9yIGZpeGVzLCB0aGFu
a3MhCgpbLi4uXQoKS2luZCByZWdhcmRzClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
