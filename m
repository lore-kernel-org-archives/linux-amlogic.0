Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610E4C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkr/BRPPw2hBQyiV58v8pUUZGdA484yUhcRx/L8smWA=; b=YEdZ5/GXv2j/5Z
	jP9CsGEnkzJ9YfvG1JRu27SixgMwqxULbHAlfWx2Ih5ZmKtcnCdX0xwG5orvclI43RhCCQqX8tNFl
	opntQWjvbZsUvoExaz0yFzhyz7CLyyyvSMpbt63SawznE3NvF0pgvhcjoE14LUuxbUZgHDkWtU5wv
	hEIO/vURPMkbBn7RRquEKTvV+pgS2Um1HBWVYZV9b908WWBGuhaMqY8okQrIMAhbWr5Mz/KLC2YmT
	MS49fGrXLbWWM765rB8Fs6G5RnPJgVC51D0hZsFO5tb6ZHB6mRGWMaJ4fdoaIQTgCPKdtRHCQmjna
	QlCl5j23cQSaYak2jDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHu-0000000EwCS-0LTp;
	Mon, 29 Jun 2026 14:48:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHr-0000000Ew94-00wc
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3VX2604346
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=; b=WrcmkiIpDYknkEZI
	H+j2O7fO40qENvHj6R6oHycIx8MDrjWg2Qkq/8s7DWV29k64+lAn9AzTYRj31N2Y
	vQ+sN8R1BxmqGmR2GDUvLY/ZXrmCWye8DbhOrAIQ+luyLHQKsWv9OgKYatTr9BSg
	HxL9iTXwG5g7HmpNIYSadf5xaVHoBYYFefgH/Hw5ckX8GheKj6UUuykNJm2MFT5/
	Nqn2Snu94rZIUFsy8bVhxRPWlaAU40zBs/0dv1OkNu8iTIAMRmvPMhakqYarM6SK
	jsCILGRDadnx5edi2wkVcg95XyY0RJ9Mpko8wrkwVcb3kXeBZIu11DT7naqhBgaR
	vt4HXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq89c5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so198725385a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744516; x=1783349316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=ers51B48KEWJ8kTFDJEg6v3gpEHl8UvfJMqS0JnlSOENedTFul3HZEltldceNYy50l
         FyqeldSuaHOJk/Dd4rXDSibmNVZFn3Xq4NmfjVk952W1bf8qHZNiv8tQaIsiUtwbZZIM
         YgvfXp7uRpVqyZIkwTKrG5LBJ+VzLfbI/pxPX/tV9FIrEBYeQ9JByYJd//gszHSj9Saq
         Rl5ic7ZgmK6nzgCVRjnCYWF5koALcYLtyatQU2O2PXKFQra7P7dbt1rWnOquQA5f/C2D
         GVQZd94dRGAlUYm1r7HvJeTncw04ilq/Ra/V8H9M1CJYSTMN68MpKqR3AiF/koJI1FFP
         hffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744516; x=1783349316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=UtNAUbgWVnR469mm4oK8xOUckukRBfMZ515RslpYuX3/LCQ1K5HClsHvovwsO1FbvP
         UZn5FIQCDiBEdhXI/EzIyWUIVe1lGL7oDzkd2pSEORVkCZfXir39IJmBSUUU67JtBfCB
         +axMV3duwdSo/Ko0j9C5CAoJhAsnHZmccvAIOLlkSmnvOqBbxgxoM8n2lbo6+7U9VJEW
         u0auAhO0IdGX0Oe6CmlHiPQ7M89kXKRRUbRYhA18V1RAQEyQ5MZ9Dd7OB0+kM4F3X5w+
         VwttWFbYA2+j/JoyjDMYHBUD2m7GdKbJpRxav0iJoK4yU4JNdbtCM+guf9fy73gewop5
         8xxA==
X-Forwarded-Encrypted: i=1; AFNElJ+qBAVdzdVhkR0OaTTEhlksYmvtdNO062Q3bcb8DJ/wc5RJm7uGNA5rLszYkNbkzQI0cDDooSdPxHaYtp0a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ZERvdR69By2q0CZ1jH78QbjwKR9x6D+lvDbuz8GV0JEIDRe5
	DSndC9/Mm43hQkWg1AkScdoUUXL/FRRCayw2HOiGfHpW5+EwnPiXNmfICxNyS10K3t+u2VAx4Q2
	5D/AnRaRLBvciP+gW/eOwb1pmM37qVh1YcTKKRP7QdWPmwHamtKOFpG59YuTf7Pd1yHc9beTe/Q
	==
X-Gm-Gg: AfdE7ckQazcZ3NsgWC9zPkoWCUVAeCVczq6BRwHbrvULyNosKAlT5KrRyBv9xv2jBXe
	W4Eb9KUgh9cL6yhXxuhn0CPj6mqbhNvMCskeZVNOrC68e3zb3O3sm8YRS/RHSrV7V1CRhNSAfpK
	58tCzw/6Z+wFddD8K6A7cA//ywSSUtyv8A1AmLWZt0214Bq9+FwFjNpQUQctHVVcSkjXBR6a39l
	/qJiudRkkeYkaoAy6UijalAFwE5mGX9ARJoPvhpLb02EKsJM9XHOtY6sIcxXm5eNrwVGMUNyJZQ
	VoI5bEQx8kmxAXDHeMlmULTMlsJsMC53Q4aMnxpV0ny8hqbLhwYl1YzU6DBejwV9RQUfAw4VhdW
	iC6rnan0hp5STbWzVKeN2gCFKOtjMwfMgs0Hy+8A27HOmgkAH+iEH+wQ8emglsMTZDZBZro32XQ
	==
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371992185a.59.1782744516515;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371987585a.59.1782744516014;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:04 +0800
Subject: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
MIME-Version: 1.0
Message-Id: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=2538;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zCPPIEotdSUHd8PwFgThC89TK/453vk/QVgAmXnjK4c=;
 b=EFccj6BHEEeRrzlWUTbw8BogiRwObxZsIqPHY+e7jjnG7UU6Nl4UC2X3L1RNMqKmEJgNMp3Fe
 JQsCWBXPtSOBQ2IDWOHleokIGMiYwdCc2UgAtX0nE8b8obM54A+uwE8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: ozb3ZLKd8jr6v4MyFFp4QfKvnAK49Hyq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXzkxY5Fju+5y9
 +8bY/4KxfdHEREgC+5yO1FYHvFjIppnKDUWd0oxFtst1BsN5fbPMrE8+28brOy7U03eJW9cIqfg
 +zgtcsTLYJEulCkTyKh7noTiQSQbAf4=
X-Proofpoint-ORIG-GUID: ozb3ZLKd8jr6v4MyFFp4QfKvnAK49Hyq
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a4285c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HhJCdNca9OzhlWWnlXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX34hZIHWNfi/j
 xBp0iXC/FYTxngM+tzae7xk55ukgSZOfIA8Uic0XVhQ16J+fiWvxgCHwWnareEWCnzSYGMFtQz0
 Mz+sE+qaXPWc4+p5RodtE9QKYMmtjVTRwTXWZiBvmjqcPtX49fLi0mmVZ04t7JmkmE6uTKbKKLU
 TXqE7U0mua9dScX2/l6V6F/HswTgfn0dL+MIb/gmAdDm6scDLZ/LitHWyZmCWQtmZ4tV/77+r8Y
 Tb9lAsvUv2S2wKOwMI3jI8TdFzhoMm3OSQC2DR5vsBO+l82x5Hf6KEP1lT5SrWT6GJi8AeR48/K
 BIJfBbjrsiV0dMLa3UpxiupHDCtRfqCdyfcCe7H9USoPziVPFECvvLvV3mJg7Cb9ylJLZE4Vkpo
 vWZ0NQAUDSeHCf+Ct1TdqVfUPbDXDc8PFv+QhxfTgRqS5CoLOSmGT1FM3+Omj5oSAm8CP4maIWO
 WO6Sfb9PSVgxq959lCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074839_044708_52DED764 
X-CRM114-Status: GOOD (  14.73  )
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

VGhlIGJyaWRnZSBjb25uZWN0b3IgSFBEIGhhbmRsaW5nIHBhdGggY3VycmVudGx5IHVwZGF0ZXMK
Y29ubmVjdG9yLT5zdGF0dXMgZm9yIGV2ZXJ5IGhwZF9ub3RpZnkoKSBpbnZvY2F0aW9uLgoKVGhp
cyBkb2VzIG5vdCB3b3JrIHdlbGwgZm9yIElSUS1vbmx5IG5vdGlmaWNhdGlvbnMgd2hlcmUgdGhl
IGV2ZW50IGJlaW5nCnJlcG9ydGVkIGlzIGNhcnJpZWQgYnkgZXh0cmFfc3RhdHVzIGFuZCBubyBj
b25uZWN0b3Igc3RhdHVzIHRyYW5zaXRpb24gaXMKYXNzb2NpYXRlZCB3aXRoIGl0LgoKT25lIGV4
YW1wbGUgaXMgRFAgTVNULiBIUEQgSVJRcyBhcmUgcHJvcGFnYXRlZCB0aHJvdWdoCmRybV9icmlk
Z2VfaHBkX25vdGlmeV8qKCkgc28gdGhhdCBicmlkZ2UgZHJpdmVycyBjYW4gcHJvY2VzcyB0aGUK
bm90aWZpY2F0aW9uLiBEdXJpbmcgTVNUIG9wZXJhdGlvbiwgaG93ZXZlciwgdGhlIFNTVCBjb25u
ZWN0b3IgYXR0YWNoZWQKdG8gdGhlIGJyaWRnZSBjb25uZWN0b3IgaXMgaW50ZW50aW9uYWxseSBr
ZXB0IGRpc2Nvbm5lY3RlZCB3aGlsZSB0aGUgTVNUCnRvcG9sb2d5IG1hbmFnZXIgaGFuZGxlcyBh
bGwgY29ubmVjdG9yIGNyZWF0aW9uLCByZW1vdmFsIGFuZCBob3RwbHVnCnByb2Nlc3NpbmcuCgpV
cGRhdGluZyBjb25uZWN0b3ItPnN0YXR1cyBmb3IgYW4gSVJRLW9ubHkgTVNUIG5vdGlmaWNhdGlv
biBtYXkgY2F1c2UKdGhlIFNTVCBjb25uZWN0b3Igc3RhdGUgdG8gb3NjaWxsYXRlIGJldHdlZW4g
Y29ubmVjdGVkIGFuZCBkaXNjb25uZWN0ZWQKZGVwZW5kaW5nIG9uIHRoZSBub3RpZmljYXRpb24g
cGF0aC4gVGhlc2UgYXJ0aWZpY2lhbCBzdGF0ZSB0cmFuc2l0aW9ucwpjYW4gbGF0ZXIgYmUgZGV0
ZWN0ZWQgYnkgdGhlIHBvbGxpbmcgbG9naWMgYW5kIHJlc3VsdCBpbiB1bm5lY2Vzc2FyeQpob3Rw
bHVnIGV2ZW50cyBiZWluZyBnZW5lcmF0ZWQuIFVzZXJzcGFjZSB0aGVuIHJlLXByb2JlcyBjb25u
ZWN0b3IKc3RhdHVzLCBwb3RlbnRpYWxseSB0cmlnZ2VyaW5nIHRoZSBzYW1lIHNlcXVlbmNlIGFn
YWluLgoKVHJlYXQgbm90aWZpY2F0aW9ucyB3aXRoIHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd24gYW5kIGEgdmFsaWQKZXh0cmFfc3RhdHVzIGFzIElSUS1vbmx5IGV2ZW50cy4gRm9y
d2FyZCB0aGUgbm90aWZpY2F0aW9uIHRvIGJyaWRnZQpkcml2ZXJzIHdpdGhvdXQgbW9kaWZ5aW5n
IGNvbm5lY3Rvci0+c3RhdHVzLgoKVGhpcyBrZWVwcyBJUlEgZGVsaXZlcnkgd29ya2luZyB3aGls
ZSBsZWF2aW5nIGNvbm5lY3RvciBzdGF0ZSBtYW5hZ2VtZW50CnRvIHRoZSBjb21wb25lbnQgdGhh
dCBhY3R1YWxseSBvd25zIGl0LCBzdWNoIGFzIHRoZSBEUCBNU1QgdG9wb2xvZ3kKZnJhbWV3b3Jr
LgoKU2lnbmVkLW9mZi1ieTogWW9uZ3hpbmcgTW91IDx5b25neGluZy5tb3VAb3NzLnF1YWxjb21t
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5j
IHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jCmluZGV4IDVl
ZGNhNDdhMDI1Zi4uNzMzNGQ2Njc3NjA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZGlz
cGxheS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5
L2RybV9icmlkZ2VfY29ubmVjdG9yLmMKQEAgLTE2Myw2ICsxNjMsMTggQEAgc3RhdGljIHZvaWQg
ZHJtX2JyaWRnZV9jb25uZWN0b3JfaGFuZGxlX2hwZChzdHJ1Y3QgZHJtX2JyaWRnZV9jb25uZWN0
b3IgKmRybV9icmkKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gJmRybV9icmlk
Z2VfY29ubmVjdG9yLT5iYXNlOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjb25uZWN0b3It
PmRldjsKIAorCS8qCisJICogSVJRLW9ubHkgbm90aWZpY2F0aW9uOiBleHRyYV9zdGF0dXMgY2Fy
cmllcyB0aGUgZXZlbnQgYnV0CisJICogc3RhdHVzIGlzIHVua25vd24g4oCUIGRvIG5vdCBvdmVy
d3JpdGUgY29ubmVjdG9yLT5zdGF0dXMuCisJICovCisJaWYgKHN0YXR1cyA9PSBjb25uZWN0b3Jf
c3RhdHVzX3Vua25vd24gJiYKKwkgICAgZXh0cmFfc3RhdHVzICE9IERSTV9DT05ORUNUT1JfTk9f
RVhUUkFfU1RBVFVTKSB7CisJCWRybV9icmlkZ2VfY29ubmVjdG9yX2hwZF9ub3RpZnkoY29ubmVj
dG9yLAorCQkJCQkJY29ubmVjdG9yLT5zdGF0dXMsCisJCQkJCQlleHRyYV9zdGF0dXMsIE5VTEwp
OworCQlyZXR1cm47CisJfQorCiAJbXV0ZXhfbG9jaygmZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7
CiAJY29ubmVjdG9yLT5zdGF0dXMgPSBzdGF0dXM7CiAJbXV0ZXhfdW5sb2NrKCZkZXYtPm1vZGVf
Y29uZmlnLm11dGV4KTsKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
