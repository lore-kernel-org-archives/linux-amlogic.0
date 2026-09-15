Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F42C88E75
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JaqH/g3/2JkfsHqnD+4nQL1a7UHaqBEObtI6Ay/eAY=; b=xY67Vzx9LUR7+5
	6QPxbwUXJQan6ih5qbNqHuz62Li2fqkm/CGvHh4rT0T/yiOF6wZQ2nxkDCTxO10racblyitlfFYh1
	kv7ndKi/UD0iqGwIBAtJvjrMo37C8N3NIhmCHj6wFPMowtToPytehAGMykjjto/dUPO8vIgKfGPNU
	hEg/wqxnV9T0b5pk5xH9LI1JnjZrk6lyb6Il1M8rKR2G73WusEAdhU57EfdFszBEbyv6TXtVMDyx4
	hz7EtKYGD13x1ZkyUcKY09/kb3OENX+L2b72EmLurX0PTGYLW9772l3h5Prt3xipmr7MyNqDTOU8u
	pCQXCHtT9DYNHlolKC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VNs-00000007HQC-2yeV;
	Tue, 15 Sep 2026 15:47:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VNq-00000007HPM-1oIc
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Sep 2026 15:47:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAfaL3958960
	for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=; b=UuqQLGPi6RwKHBON
	dYUZOaX4xL7lhyYzbVQ+38hF8V4hkwKxj8i7ct7SGEuUwtQU8gbbB7g9UFQVcLTE
	Z9tY0fUXyRB7+fOWh3KJB+Ub7YhF1wNtr/PxkTmL+gOSSfOhlQ1TGNi6kDBtrTLo
	nqVKJxSpdNQxR3kQeBsSI3SrMYadaIQZiHpHEef7O3mbT5/yg0+C10wCcyQI4OsR
	5xBRxrFWQM8PNaAiEYgHiH4SyqdbGaFk7TgmFuQsfCL+PM5W4F+TPiUecdTlpnqk
	aYHpmIhDlByW5YvtXqGMWxAi66Fx8ma19WynfSsXmu1lFrZ6NfK/fwG7Qv5uePuK
	ZCXEcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2hufd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 15:47:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9057fab9eso72825755ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789487264; cv=none;
        d=google.com; s=arc-20260327;
        b=a2udM4GJ9A9TrjdWJvcxQ5iB0kO0VrYOrW3UnZ0s1M2egWs3csjSqIUEn+V4vryr1C
         FrTL76UmF7naJiM1ABfjHOD3BkC5lXLDqpX2v0wfH7KqmxN0G8Ypo8nvtnWzWif7wy0Y
         ot3PLBe0Qtgu/iAWzxdXo5kl673smGdRXKbPToL+vFXminwVQZlWBDOYQga8z+IPc0SN
         2a5liWnLtN0n+FZMPCgyXzMg5CHBBmVTzlR0C/4y5OxEh2svsrvZrLIMiFSN7vnjoFJY
         cD0ZTLSOH1hfu+Ia04BPbnaepyM2cf2wQZrnxmZkQrvm02GKPtBP4eD2naOhm+uflJpK
         SMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        fh=g+qwoYFUd6z4Jy7rpAO7RNLoZYrkKms9QReYyvGogqw=;
        b=fMc9fI2XuRUsrCLZ7dyvkeSY9CEZnlf10z1gmmHGi+jddv2yvsYAgTb+h/nvUu2eAD
         CYSvDM47kC2zc2DC1ZCvzjAaeUckJ4Txc1wO9a5JTO89yU1z2ZTk8kFWek6T1YwHuTuZ
         ePyl51Zpw7vV5qzFsjMZV0YLnfpxR+B7XU6Ryg+XG9n5h4We+3kxXvU9YeclQAE6KN+Z
         lSH4AiSZj3TA8lQnCNUxsTEchYh9OY1jGApbgxewHpE9dxp0nSCuZwHYsa2Mk8C5FjzO
         vLnG5TBidWgrl4l7sv5d95pBO8ZgnE7T6Z82I9aJjpbakrH1bBi71kdBKsXSYmU5ohtJ
         gS3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487264; x=1790092064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=QUZn1RJ0+JowhaWsjeLT9WSRzyiRaXFciLg/BW+Dgp+/gpW6kj5RxYpC6U+jMcFWzz
         RjGhvKBEMA1uLZBSCpG7WZf+FkNQLdlqdwyzpOCB0TqeIYFjuoQEuEti3e7e097PssoP
         6KhPW7zSCgBYM2I5L/KChOCqyA/+E3KYTQbgNiUTkyv7QTnsExTkP1jSnn8p2Qt0fPp+
         EdbHdOpqSQU5vIeou7fMlubNVPBp23GbZJ2SCrqtHtg2wSsv0Zre3f45/AADwSxyuPvb
         prhhiNutDKI9on3zeQI7lUnrcwyhd38P/RfxRmBn77JA7ooFInIeGY7KCmYOYfOcq55H
         /Quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487264; x=1790092064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=iE3ZxC+CeXLyhdFk78BTjwcnDan8srk/fTbqP17D06Su+QhCZpuU6MknDzt34W4HuV
         nawaMC8uE33Ff1YMOmphAHHi5LNndrcAoLgU7cVBAUTFxnzoAjjCwurenUj/zBwgN5a5
         VhvZCrnA2bO2S4tUZHjvx9KjaRYipt4qccraxnVprL4oLliAA8QxXI02zOH8SfhCldEq
         7ZMWd5fKzK8Hr+XoOHbqbQNN0fM19NuwyWg79mP39s5oQDR68fg0tP0h/b1rR1TILijQ
         DaDhRgRE25SvhvmdSnYrAYQ3UG07O4//KLIF9uzzhdysDHKJI7xaYfxRuNXuRLD1/dPC
         9enw==
X-Forwarded-Encrypted: i=1; AKwUvByRKsA3zsoajqJ4gYwKwBoFyc14PsJw3Ls3umrcH5mluD+o6mjWoIBWEcye9MrWMuXATHmnfns8rfH1a83U@lists.infradead.org
X-Gm-Message-State: AFuF++mFfa58W6psT9XIpA8vAit00yWI7EzRGVyXoR6nP9AOtxEb/Wz5
	/+KmgdgRAuYgx/LlqmYT6hiTQ/dTuPxlj2stADD2DOXT3f9H/YQsgr16tFhI91LqRIS+00DXx5E
	atw4HWJQLxn4I/5884CcV5cWiHCMMgnIEHfeOWWZtrvWtpHrJbL/sgqsxceMn/Sq6dxk8ZJih3t
	ZJ1ftwwUkSE3/yLl3g9zuHIfFJovod15O0uPG+FB9j5yV44uiC
X-Gm-Gg: AYBFou0mTUswkznHpzaoIk6x0ftmdp+MT8tkzrKbZZFjVtW/sGIPEtRmDHtB93X+gUc
	nBZrbKnZfVvuqcKEJ0YPRiVwMCRdeNX5WHGueQxAUoPAu8jn1a2XJH0xXHcPDfqXzqt7y4OC50W
	NR0IVgQeK/anYz3Oc/ExOlljJHwZ3U/PLB02WRgDhj8DJjmJhp5zyyzpiyUA==
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2dd837b0f4dmr30164885ad.1.1789487263776;
        Tue, 15 Sep 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id
 d9443c01a7336-2dd837b0f4dmr30164475ad.1.1789487263399; Tue, 15 Sep 2026
 08:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com> <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
In-Reply-To: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:47:32 +0200
X-Gm-Features: AcwNN1XLltJ2FYh8c04_i-F6ztWC1xrsL6gII51QJfaGjk0kyDplWQBNgu8CYL0
Message-ID: <CAPx+jO-Fh7RDmHz-YH=odsHxmqYaj=vj4R9iUSSmbSqcRr-p6Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Ulf Hansson <ulfh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Qingpeng Yang <qingpeng.yang@amlogic.com>
X-Proofpoint-ORIG-GUID: 22kVz_fY2fKtTg9AeBvmvUDEWfQJMAJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfX3In6fg3QVE7u
 I1c6EedPpyjUUKkupyebCECjbF3Bsx72nVcdWHMm9rK2j6nenSN6ovumrtSCQrdMkKCqhYS4pGk
 yE7iApYrTLP79QAE/xbcsOGhUn6nzZE8IRrglt3lykgIQN/sLDujznvH0HNJOFCQTOaBhbGf6kr
 GW6RGN8hFWJTxtYu+NmPb5UXq/mGkWH1s2rgBp4D+ttOXKy3IRz+L4LgAAr/mlOcYy4o5xIPWlN
 SjTIAz7gqD6y0z/fTSwbduATu3jhUj1N5uo1rfdcii194F94uAegAwU5cWrQlpM1pVk4sknigb9
 xzmXZXNUbfQZlL/B4DsQAH6G+yghmj4OCHtQPiaSYA9y1sHfqfPU51XflOAD8ch/F65C/yNaTRr
 xwepnfj6FqYoCxmt0P+ZsOToW9SeER1fbicho5YMhqFQ9wb8MYt6L8Y3bo/CXd6bUx0liV9Atoa
 XCPPvYhGWkBDM2Qpmnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfXwN350onPpeAD
 7EQVz9/uPVED0cyG0GTt1tsvUCCPJciGtnihja7l52V0D2SrV8nc0pO9InWay8VhGi1eRwtD+Fy
 UpbFNUEUWEYdMakPvsqlOGlktegOk4M=
X-Proofpoint-GUID: 22kVz_fY2fKtTg9AeBvmvUDEWfQJMAJd
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa968a0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=mK_AVkanAAAA:8 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=PMt6m80IFYFBIeLpiBcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=3gWm3jAn84ENXaBijsEo:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084746_587974_13CC03EE 
X-CRM114-Status: GOOD (  15.87  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTI6NDDigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2Vw
IDE0LCAyMDI2IGF0IDEwOjU24oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo+IDxkZXZu
dWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBG
cm9tOiBRaW5ncGVuZyBZYW5nIDxxaW5ncGVuZy55YW5nQGFtbG9naWMuY29tPgo+ID4KPiA+IE1h
cmsgdGhlIEE5IGV0aGVybmV0IHBvd2VyIGRvbWFpbiBhcyBhbHdheXMtb24gc2luY2UgaXQgaXMg
cmVxdWlyZWQKPiA+IGZvciBldGhlcm5ldCBvbmxpbmUgd2FrZXVwIGFuZCBtdXN0IG5vdCBiZSBw
b3dlcmVkIGRvd24uCj4gSXMgIm9ubGluZSB3YWtldXAiIGEgd2FrZSB1cCBmcm9tIHN1c3BlbmQ/
Cj4gSWYgc286IGlzIHRoZSBFdGhlcm5ldCBjb250cm9sbGVyIGxpc3RlZCB3aXRoIHRoZSAid2Fr
ZXVwLXNvdXJjZSIgZmxhZwo+IGluIC5kdHN7LGl9Pwo+IEknbSB3b25kZXJpbmcgaWYgdGhlIHBt
ZG9tYWluIGFuZC9vciBwb3dlciAod2FrZXVwKSBmcmFtZXdvcmtzIGluCj4gTGludXggaGF2ZSBv
dGhlciB3YXlzIG9mIG1hbmFnaW5nIHRoaXMgY2FzZSAoZS5nLiBvbmx5IGtlZXBpbmcgdGhlCj4g
cG93ZXIgZG9tYWluIGFjdGl2ZSBpZiBuZWVkZWQpLgoKV2UgY2VydGFpbmx5IGRvLgoKRm9yIGlu
LWJhbmQgd2FrZXVwIHdlIGhhdmUgR0VOUERfRkxBR19BQ1RJVkVfV0FLRVVQLiBJZiB0aGlzIGlz
IHNldApmb3IgdGhlIGdlbnBkIGluIHF1ZXN0aW9uIGFuZCB0aGUgZGV2aWNlIGJlaW5nIHN1c3Bl
bmRlZCBpcyBjb25maWd1cmVkCmZvciBzeXN0ZW0gd2FrZXVwIChkZXZpY2VfYXdha2VfcGF0aCgp
IHJldHVybnMgdHJ1ZSksIHRoZSBnZW5wZCB3aWxsCnJlbWFpbiBwb3dlcmVkIG9uIGR1cmluZyBz
eXN0ZW0gc3VzcGVuZCwgc2VlIGdlbnBkX2ZpbmlzaF9zdXNwZW5kKCkuCgpJbiBnZW5wZF9maW5p
c2hfc3VzcGVuZCgpIHdlIGFsc28gc3VwcG9ydCBvdXQtYmFuZCB3YWtldXBzIHZpYQpjaGVja2lu
ZyBkZXZpY2Vfb3V0X2JhbmRfd2FrZXVwKCkuIEFsdGhvdWdoLCBJIGd1ZXNzIHRoYXQncyBub3Qg
dGhlCmNhc2UgaGVyZS4KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
