Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23035C79F99
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyU/e8P/jFEMG/w/vtFC8/NRcRtuqDS0vJf7YSV+Chs=; b=VE71v9li8IB/ML
	lffNuACtureg7mOsfeI5CggEOJxIkTesXj0NSKXPBo8mxJ0qrPlouUfrDf20sSd7xodOoy626NLnG
	hvTyKZY7cr+4D03I3v+0VioxN/ird5wlicFb9eCwvlIVjkbegdprEao7RAC9qRm5CFF8chosXkmQx
	jV2nD0o69L6vnW1a82Rb9OdmlSp0FtS0diTVdlecTLqh1yG8KGo4o30HkyfgoGNPoRLJe4qwtoq5g
	mDNiFT1jRoDri21LP03VR8zBzbulLWg5SdBSE5yG8v+KAgAXTKbBeb2AXqiXHfnGVRqY2OOyN/Kpj
	DW0R4WFkVbQt3pk3CVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP8-00000009bA6-2Ugx;
	Tue, 08 Sep 2026 16:10:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP4-00000009b8N-35FG
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 16:10:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdXKb3429802
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Sep 2026 16:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=; b=aKZUnAuwuOC2Mm6N
	dnQmHwM/RpKfmdDSX2+/4jASJo3vSdpnXrxREnPkUcqp2Bai9fmtJ5QWJmxbpT/m
	wgrSAgHAITZ/JdZx8jGT2Mz4RRt0yMoyifzyoeAfz/BUNL6tgruWcrZnc2mg8HXV
	/U1RpNx+N4ys4fKzP1hSbIkJxFkWqPQsi5/YMFnaNE1oVQ40463t07K/NmnYgZOf
	iS7zUFB4d70yG5ixvflOqQSRpU4DcxKpcl0MDLIILYOJcSdLy3Aw4uxvFd6MhR9a
	QxfCdi3dzrNHLVzZUe31/YIOZqNCn+AUVV59ucc5nIVBUmf/7SZTvKhgMqj2AzbL
	xA7B6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj1ad7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 16:10:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f73d0f89so62523055ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 09:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883829; cv=none;
        d=google.com; s=arc-20260327;
        b=oWR7sEy8ameIesao92rFdixkp6cu45dmNhhuR9LHidPHWQevFL2VgqEDBODglC/Edg
         qTH4pIdQdx2gKpFOOKC2fhP7PlNUHMlzCoZyuRZmYHv5JWphXFn9k/areHozLvR3x05u
         IGwIzs2hzhY+KFlIldIYymd0dTRZSkD3mivCLRcT+/DQLYJM6xD0vbnbhVwaUy4UfIG8
         9/BRm3PYSxEq9k/ZfkRnEDDdIxoTdszKvfML17xzL078/YMOdlXvmLvGEMhPlop34kql
         EMpu9j7+u9ptwzxoVNVMHSDnX9jiBF4G1nZwF2i87XhgSQnkLc1HNhoGt1eyJtsgTf5r
         quYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        fh=I4dpBqyBRjksoeWSgQaYz1CE5F7zmJZROH0TTXF0PIs=;
        b=a3vXMmc5iEsvFykIO+PyCm0i+hcg42HcaC/3TD4Z7LqJdoXBnqIGdlLfMWNTbbRdQK
         XHjO4SyVlPWI9nnUW4mU2iJQgtnKLitH0kHdeAB/tZFiQXz7FoQydgGhKkx8eFC6iZAL
         rAdmDQ4AysennpN4pvbV0HFFs7Yj3KkWH5BrSS3UA5msbt683LqFl1FIvwaGicxD2LcM
         SkD3zzll21x7VMePa9R31B5mHDw0Im9wKXfKlfLBKebpzT0NnvlL+V0xn0mVrlk9rzWU
         pgldjEilIffQ/kq5QgW1mwGXLfIC+OfbLOCO6itZ7hnCD8ZFskN1aqBtMqnlhOnO+cT6
         IQvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883829; x=1789488629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=LbENuoQ2G2TI2YKzjsr71StXEDraiB61rABhbaTgU4htHWSfbossjITbCsqdBXWgpW
         6XQz7HHJXfE945c/qswKpD2l/P6xX/HAMCSz3RhG2S4D0BmKAdCxZEcICjHgWnZ6mqi6
         Aor5+22iM/8Y29GaOWxNdZmVwy9ZHyO5/d0Oetl4SQKcysYxPwwDU+N8C3IqF1OOHXT7
         qoUsEzWHVS4J4H5ECQBggqkskIwz+bzk+6IfdVQhmmVgRdYgBMkRRdq0cR76TuxD7t2L
         K52+pq1YqRkgz+r4zQtHwjrpeFvVyzDfMP4HDHbrwr7Qq9IrmTM9lo6kDwSzz09tkUw2
         Rvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883829; x=1789488629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=g2v/U2CqZQkzt5D//CQyw2plxAdOcTBgEAGXso3ip3fEOhrMt6t8k3pTXLDzR/IRF5
         SI4MEWpROx/DviU1szjwkxdEHzZCl453mWKENkUmQ4rDL64/xwEeE+DIi3COESamOARf
         E9UPr09kPW+pCyWKXaoc9Mhn70RcL7FMzKSMWrQOIA9oo2PeUoBsJyxRN7gBVXW79LLa
         AjzirbfjdJbqY8FFgED/1oE2HWXDXkF41nb/Fzjpv1wyCjZ8VmOAARgAHdwpsQc8pNK0
         bXuQZ+BYFeDZ1KLkULp8mRNHhClaEMk3lN8Zw7D0UK1hf6/anTpJvSo1fcqZHYg8ZaiT
         eu5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxE/URgDSqgQHLUiNLlYpQN3EyrOo+BaVZ6DK0hpJhMUNh22siM7JMvPjpucdALbf4feOeyS2OHgBPX8gqE@lists.infradead.org
X-Gm-Message-State: AFuF++k177KeNnlM/E5A/VcubeOusmNn69I+XUGa9b2++VglynxYyMFG
	VPFUJZdAUVYFPISr7jUZnETuFugsPbrpupxrPWRmooKM1oa3FOctJk3T42eGB6ZxK6DQqeDbxPq
	H6RYrs14RQR6wEyia9GqYcvwCuMFKXCJghmy88ohX3O2T66o7q2ONlazf58kGsGMWoC6vrMazP5
	+RPwolX1Cx7QcS7KH9zHFV6FemFeN+gc0wTwiV3xEIBcb+xDlO
X-Gm-Gg: AYBFou3TWZepSd4mYsv7i1y5f58gfSyx42Hc935jHFi0hhsoyzHq4lTgq+KO5z4UyS9
	zh1Ogv3c1E1oXH1AKOW2uGwT3yw8L8HGIn7nyGr6XbpnVaasS3VcsYEKzxMQq2tLrj1LPcEyMGK
	X6lIoYaiDgcZhhk8DeSSo4NLyJxQs/FYwfJRhgy4jwLnn1okUzxkDAeXB21A==
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id d9443c01a7336-2db1258c686mr415608025ad.8.1788883829150;
        Tue, 08 Sep 2026 09:10:29 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id
 d9443c01a7336-2db1258c686mr415606815ad.8.1788883828558; Tue, 08 Sep 2026
 09:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787240090.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:17 +0200
X-Gm-Features: AcwNN1VTV0JnOl-p62U3bYhCoItyrrp3uBkyaa2BVtYCssF8EZkcLiIZNULpQBs
Message-ID: <CAPx+jO_Q2A1LAM-1MTFwGpULkiyHzWRUE_tpWYWfO6JzFAcdxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXxBroTR4eGKyv
 +Kc9gNRCNJnF63CJka6dBe479Ga737Ybdny4I4P5LD7wnxKnqhmz/RQzEKanquc1+Qa11Q8vgyr
 h6vaU5+DCR7alL5MDZnfEWuHT1kG7aA=
X-Proofpoint-GUID: qBaJDK5VNUE4eCXGUkiSDjQKNnvcpXDk
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa03375 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=gdcvayKpbD3v4lRZIwgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: qBaJDK5VNUE4eCXGUkiSDjQKNnvcpXDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXygVACFi0Uuy5
 OSIh8WcmGZ+n5+ZgVkibDdnvDilAyT2Xq8j0pK5UE1ZVf9+s9v37k3T4rWoSKR+kwVQpYPX75vX
 PWt379e0C0mD91BbhALnXVaGmMlz8766XGBgdTSFOxx7uD7w4Th8oo1bdt+hsOHJ4w7dtSkil6Y
 vLRxlpvDLKJEijMdW9HXtd5X26Q5dzMeDUr/R7zHIK2B71oQat11Bg7UA3Y3UHO2m/5ApjPLnI9
 tfdqsAG6AoQs2/BLHxzPeVsq+9QYFKU1jgJnTH8A13WkqvmxBOB9EJcGx9cSFJmtHjZd/kwEXWL
 GuH8DgHi8Jq2ro3Tx9H52zhgX9s30TyIb737LLqOnN3IGFOB/zix0CTugNJVMHE6Nd6XJ0wiBZP
 jxOeWpxHRQjAvgbnY1jhwN+sjBUHBD3/vkrBXZtZc3lvaoti2jfuymV5YqpyR0iVBDd5FB8HnRF
 gZhsmOordiRLtRagogw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091034_780308_F69571E0 
X-CRM114-Status: GOOD (  21.53  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgMTI6MDbigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiB3cm90ZToKPgo+ICAgICAgICAgSGkgYWxsLAo+Cj4gVGhl
IGNsa19pbml0X2RhdGEgc3RydWN0dXJlIGNvbnRhaW5zIHNldmVyYWwgbXV0dWFsbHktZXhjbHVz
aXZlIG1lbWJlcnMKPiBmb3IgZGlmZmVyZW50IG1ldGhvZHMgdG8gc3BlY2lmeSB0aGUgcG9zc2li
bGUgcGFyZW50cyBvZiBhIGNsb2NrLAo+IHByb21wdGluZyBkcml2ZXJzIHRvIGluaXRpYWxpemUg
b25seSB0aGUgbWVtYmVycyB0aGV5IG5lZWQuICBIb3dldmVyLAo+IG5vdCBpbml0aWFsaXppbmcg
YWxsIG1lbWJlcnMgbWF5IGNhdXNlIHN1YnRsZSBpc3N1ZXMsIHdoaWNoIGFyZSBvbmx5Cj4gZXhw
b3NlZCB3aGVuIENPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOIG9yIENPTkZJR19JTklUX1NU
QUNLX05PTkUgaXMKPiBlbmFibGVkLgo+Cj4gSGVuY2UgdGhpcyBzZXJpZXMgYWltcyB0byBtYWtl
IHN1cmUgYWxsIG1lbWJlcnMgYXJlIGZ1bGx5IGluaXRpYWxpemVkLAo+IHRvIGF2b2lkIHN1Y2gg
YnVncywgYW5kIHRvIHByZXZlbnQgZnV0dXJlIGJyZWFrYWdlIHdoZW4gY29udmVydGluZwo+IGRy
aXZlcnMgdG8gYSBkaWZmZXJlbnQgbWV0aG9kIGZvciBzcGVjaWZ5aW5nIHRoZSBwYXJlbnRzLgo+
Cj4gUGFydCBPbmVbMV0gZml4ZWQgYWxsIGNhc2VzIHRoYXQgSSBpZGVudGlmaWVkIHRvIGJlIHJl
YWwgYnVncywgaW4KPiByZXNwb25zZSB0byBhIGNyYXNoIEkgc2F3IG9uIEJlYWdsZUJvbmUgQmxh
Y2suCj4KPiBUaGlzIHNlcmllcyBpcyB0aGUgTU1DIHN1YnBhcnQgb2YgUGFydCBUd28sIHdoaWNo
IGZpeGVzIHJlbWFpbmluZyBjYXNlcwo+IHRoYXQgYXJlIGN1cnJlbnRseSBoYXJtbGVzcy4gIFRo
ZXNlIGFyZSBzdGlsbCBmcmFnaWxlLCBhbmQgbWF5IGNhdXNlCj4gZnV0dXJlIGJyZWFrYWdlIHdo
ZW4gY29udmVydGluZyBkcml2ZXJzIHRvIGEgZGlmZmVyZW50IG1ldGhvZCBmb3IKPiBzcGVjaWZ5
aW5nIHRoZSBwYXJlbnRzLgo+Cj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQo+Cj4gWzFdICJb
UEFUQ0ggdHJlZXdpZGUgMC81XSBjbGs6IE1ha2Ugc3VyZSBjbGtfaW5pdF9kYXRhIGlzIGZ1bGx5
Cj4gICAgICBpbml0aWFsaXplZCAocGFydCAxKSIKPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvY292ZXIuMTc4NzE2NTMyOS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPgo+IEdlZXJ0
IFV5dHRlcmhvZXZlbiAoMik6Cj4gICBtbWM6IG1lc29uLWd4OiBGSVhNRTogTWFrZSBzdXJlIGNs
a19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQKPiAgIG1tYzogc2RoY2ktb2YtYXJhc2Fu
OiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseSBpbml0aWFsaXplZAo+Cj4gIGRyaXZl
cnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgICAgfCAyICstCj4gIGRyaXZlcnMvbW1jL2hvc3Qv
c2RoY2ktb2YtYXJhc2FuLmMgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiAtLQoKVGhlIHNlcmllcyBhcHBsaWVkIGZvciBuZXh0
LCB0aGFua3MhCgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
