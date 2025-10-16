Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79ECCD195
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Oct 2025 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HeSQRRiWmK7gu4lNr0hr9Q812WrprjIDmZ0lhXyfIU=; b=cA5O2OKoDFynBW
	TjCVMZBGBuuzcTZjnuAewmsmgw8E81fhUowGMzdL/QUDffA/nJj1ykNQ9GVMyyL18l8XZnqS9KxtN
	11sDJY8iBfs2h/l6tOVsJpCsSJmqdnXunePV8pXWQEwc/Exobh0434i/b+Ez3X3rgf5j1FN43TAX3
	9jF1FxzwLsx36Uh5CGW4N7F68DqEIUdxW/9qFTzN6xdst94eyE7/DHO63GFhsVjT0ktJlgTs8hRfT
	NsnQfmesCrLdBl64sSihjyM7rLayhnMKgViU2UXIWAK1ntjXdpHXirrx9Y4/EJvJEdqEOvmCLcreL
	wcEjUFpQTZW7S8wUJzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLM-000000054jz-1AOO;
	Thu, 16 Oct 2025 14:52:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLJ-000000054hC-1pzd
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Oct 2025 14:52:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7PGZP003643
	for <linux-amlogic@lists.infradead.org>; Thu, 16 Oct 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=; b=oK
	0IvGUFq5Jpvs+nDFM/Il2MpT/ilhF7MHPLO+EQjXbkTN5WAB2rI0VHOSOOV+Qzxv
	sRtsBKGetq9wWxLEcY2lXvRoMYL7LPpZ9pIVBfAimdy6R2mv9p6gAudwk8iSrs25
	65FvBqQsyi+Yt4UDL56r1HgrPj1Jwtkn5AOnrPf0622q69XSNno8TLBKC0CUEYol
	ixpON2jXbKn9SfLTwAQqtm6rDhMB2kh0BfyW/hagjxvIxYHeAEDIseAWzJedm9W+
	vK8BUcdjcOH0s4pKDHXdtZfLjAruVuPpD/VTQr//0Fa2Z6QX9Ou1aNUUAQRav4qz
	6q8Ce5vsU3zTX1Onw0lQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd98rw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 16 Oct 2025 14:52:36 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-3c966724936so202044fac.3
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Oct 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626355; x=1761231155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=;
        b=TGiaBbUaVQM92fyJah7/QJGdCV4WgLTloIGkHpo85kUP0Bry8opIyLSY6h/gP1avaK
         sB9U7+19jFstQtxXTBR0Kz3CXH4YQN8JJxVfUURpmGfBIZDqfZihDxMzk++q5LuUanFu
         e0JlJq54+OwiFOHZWNgLJYTjy5wA3qmrTq2M0x9FQZceUDK8+IdQtJh8/JV6/dvlwjXn
         vyNsZQSkQjewqsKUmzzZqpj+DBXiyIMV/VPdaK67QjVEVqLEjeEkozpebEZ3izoVh5ae
         pcBEQBTPfAjPjCwnZD814teTI/L3sMYBsTroe0EHhgcicIMMjnJDtDm9oUy0jeQ6P0m8
         53Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXhdn3IOGhlVzd1eovSsq+wUr8n1dcpxYzuXqQVaLOVmllCqdVe5npyvygv8rKgoTAJxsYPOoOSIF+yzQNb@lists.infradead.org
X-Gm-Message-State: AOJu0YzYQ28tzPS5vMDPUDnLMJFIezzcD3VBAtO53yHGk9Lyx19Fr9+1
	AQzFsHPFADPncszraLzUu3JEbXrjXkWISYf/QmIDvBLmQv6sc5PrimKy4gTBesITSDsIXW71YvP
	9A6fchgUHkSVEbtwhMNEaIa3hkLChm1ewXJgzymFlj1VbA2W9JlLuVb1haIcgftEkV190kxtcey
	Y04i+bTI0EaOnMSJ3Hg9vjGZPgI6QKpaeMLbRXJi/LAzsToZI1
X-Gm-Gg: ASbGncvG/JOmdJxM9RT18U5EJRUa0zanAXD8HDOtrGjJ69v7+yKSfIoy2YJ1XY82XXM
	kr66cUOYzipWNJw8kpbYcn0+OuW7uuFI2uOSPdbZfyWDKvcl/aJstZbp6M+x/f8TD1bKD58OyKw
	bD2Va9xnB7j6X6RqpCjKtaeN56E0t1LNkxiaoNYcYtXBMqnpK8Nhddki//WXGFQ+LO+AUI0CMGw
	C9JGDvNmol/ZyA=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id 586e51a60fabf-3c98cfa8295mr10108fac.21.1760626355589;
        Thu, 16 Oct 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39ocujuIwT0Et62sHrBT+rRRN4wBRxOHxmKLmre65EnhOwqDPEsCuGBua+8VJiCAAa15gVkxk2D9mH6TwzQ8=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id
 586e51a60fabf-3c98cfa8295mr10075fac.21.1760626354773; Thu, 16 Oct 2025
 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com> <20250718105407.32878-2-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-2-vignesh.raman@collabora.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 07:52:23 -0700
X-Gm-Features: AS18NWBmqrEUHFQlSWdIGqm2-_tBPDNsmr766wJpJByzaFclGFLQ0RGnzuLEsPQ
Message-ID: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
X-Proofpoint-ORIG-GUID: 5UMoD_mpEYQGowv4hzKand14dqExX0kJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7HRCm07/vIbu
 qE0rIpQH66Cj/DzlaX0CfgNbpY7g/JO4OeOT2RLlPvV1HfsOay6bgnPp0EYs/y1MCDJFyYpzy29
 fRUJVodZyZC4Vv97deX3hgB4g0yorGKhRFsuu2rqIJKMlRcQQtT9Y/XNxqs45d+VI+yzVdAbcRa
 Np/37Zp99eMo/p+KS1akJ4XqD4N0iLsdravC6NC8KzX944LOSdCz/HhRDipuLoz6QItZtYLeiME
 ZzV6sJkbAsnULEceikIJZzJjPfCcYPbJJRdxB7YgXI2/MTRuX+EVQG7BKxhPOQ/3a+vei9BHQ6c
 lbvyA2Vfl63QSfMrJwsCaiDIGtu28w0y8ziSf17gMdSprL1WvzZXrqgp9LXcQopDQXAJGcFLb5m
 kXVm6WlSmyM+3pCJq0laEvGwFUcQbw==
X-Proofpoint-GUID: 5UMoD_mpEYQGowv4hzKand14dqExX0kJ
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f106b4 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=Gxbm4VOBLxWGKnsTXboA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_075237_472900_A46B2C31 
X-CRM114-Status: GOOD (  15.32  )
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
Reply-To: rob.clark@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgMzo1NOKAr0FNIFZpZ25lc2ggUmFtYW4KPHZpZ25lc2gu
cmFtYW5AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBUaGVzZSBkZXZpY2VzIGFyZSBiZWluZyBt
b3ZlZCB0byBMQVZBLiBUaGUgam9icyB3aWxsIGJlIGVuYWJsZWQgYW5kIHRoZQo+IGpvYiBkZWZp
bml0aW9ucyB3aWxsIGJlIHVwZGF0ZWQgb25jZSB0aGUgbW92ZSBpcyBjb21wbGV0ZS4KCmZ3aXcs
IHRoZSBydW5uZXJzIGFyZSB1cCBhbmQgcnVubmluZyBpbiBMQVZBIG5vdwoKQlIsCi1SCgo+IFNp
Z25lZC1vZmYtYnk6IFZpZ25lc2ggUmFtYW4gPHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2NpL3Rlc3QueW1sIHwgNiArKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vY2kvdGVzdC55bWwgYi9kcml2ZXJzL2dwdS9kcm0vY2kvdGVzdC55
bWwKPiBpbmRleCA4MTE0N2U4NmJmZDAuLjUzZDE5ZmZhYWY2MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vY2kvdGVzdC55bWwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vY2kvdGVzdC55
bWwKPiBAQCAtMTQ4LDcgKzE0OCw5IEBAIG1zbTpzYzcxODAtdHJvZ2Rvci1raW5nb2Z0b3duOgo+
ICAgICAgR1BVX1ZFUlNJT046ICR7REVWSUNFX1RZUEV9Cj4gICAgICBSVU5ORVJfVEFHOiBtZXNh
LWNpLXg4Ni02NC1sYXZhLXNjNzE4MC10cm9nZG9yLWtpbmdvZnRvd24KPgo+IC1tc206YXBxODAx
NjoKPiArIyBGSVhNRTogRGlzYWJsZSB0aGUgYmFyZS1tZXRhbCBqb2JzLiBUaGVzZSBkZXZpY2Vz
IGFyZSBiZWluZyBtb3ZlZCB0byBMQVZBLgo+ICsjIE9uY2UgdGhlIG1vdmUgaXMgY29tcGxldGUs
IHVwZGF0ZSB0aGUgam9iIGRlZmluaXRpb25zIGFjY29yZGluZ2x5Lgo+ICsubXNtOmFwcTgwMTY6
Cj4gICAgZXh0ZW5kczoKPiAgICAgIC0gLmJhcmVtZXRhbC1pZ3QtYXJtNjQKPiAgICBzdGFnZTog
bXNtCj4gQEAgLTE2NSw3ICsxNjcsNyBAQCBtc206YXBxODAxNjoKPiAgICBzY3JpcHQ6Cj4gICAg
ICAtIC4vaW5zdGFsbC9iYXJlLW1ldGFsL2Zhc3Rib290LnNoIHx8IGV4aXQgJD8KPgo+IC1tc206
YXBxODA5NjoKPiArLm1zbTphcHE4MDk2Ogo+ICAgIGV4dGVuZHM6Cj4gICAgICAtIC5iYXJlbWV0
YWwtaWd0LWFybTY0Cj4gICAgc3RhZ2U6IG1zbQo+IC0tCj4gMi40Ny4yCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
