Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E949AC55184
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Aug 2026 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+e1RVHDkNRqLixhVLSOVeoZdZRQmacMU5+CV33LBu4=; b=lg76bXKUtXOOxM
	/P45LQFqs0GZB+CvwAFOCyCzzaBXudCmH4o6kLa/zYF8n9k/kpdq7OmX3x82cBfcf9dIwpZmqDYkm
	YKhW8aaidG1xYRpu3UhjAU4EburwB+xAymwzq1YqO15eP5/Wwx78gk8EIEGlmIgCEADvILtbmNTH1
	xw2vm83RgWWNJC7qRkk532Jd1xD2lG1Dy8m39sG28ajbg3slrEyGR8zM+hw5YUJ3FDzqSxDWhgH8W
	5xFk6Q3PzriXsfLKkBH5dGlsnhb8we7vowatDnWz2gXxnGdqLH6w7u9vVXuWV6v5GIVcuRjhO41+4
	Tjso4QuGduTQmsDNrYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHN-0000000263D-2Xpb;
	Tue, 04 Aug 2026 14:38:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHM-0000000262Y-0B3e
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Aug 2026 14:38:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CX9oF4129540
	for <linux-amlogic@lists.infradead.org>; Tue, 4 Aug 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=; b=of8sOQp9xUSfTu71
	IHMwC4jMPpavp12E+ekTQze2YGL05ivig4ZfN52E1ZLalg5gz3McVISQCUYoa5R8
	122GhAoYJvhNsWfxgBqKfKB46LEmC9gqrflOwl4QSG4j+bVHBIemZ+AquCwJ9oj3
	HWJjwrlVjKveGsR3Y0mTvtHHYqY0VuSaZKoKei075ReWkK0deKUQzR3cg2+qbrDg
	L2AHymVMoS43fM4uDIsOvMvq7BZ73Y37kzegg1uvEWooxdryIlgcn7WMwKCVyhPm
	E8EY8dw0UKfYsQW9dMassyHPtfGMAaArB/IE3pWDce7FmooGveCBPXBqS1jQ39N6
	QulxNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug658jfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 04 Aug 2026 14:38:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so391676885a.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Aug 2026 07:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854282; cv=none;
        d=google.com; s=arc-20260327;
        b=MCzp+KTVouGiNLQw3ko085MkuTZ6BWJJ9ZwEksVzB3bn8vgo4XDpA3vPbjEk4KHBXf
         fnovRKe8zeNGVBGIwKmhCOYq+b7bPEj7ULpqpIhwrbQtJJRedCNGsjEW9uo6jYvNGFNc
         W9VMOkdwn76Kw0jsnG3P88qElbt9a/cdKTCsC2u1HKCQLb6JODy/CJtIkVoeXzEi2y06
         BXc/ob45V7sYbTX/nN5jYML2poYoXG8YgXoAfnnmspQMqtC2yrlfygy/7o5g+S6dAcTA
         oRa1EOGN+ALqJClw21rjOcb4G0VxIU9OYwtenqBBEhTTmGZJ8KGA3tmtZk8kOiuLT56d
         xfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        fh=/AuQ0ZMa9B+vHnBWFIBetNviE5wjGDIYKcFdy59fnuU=;
        b=dVpUZR1gKr+GTcf8rckHFUuHF3cok7BG+iJxbA2nQtUpLbqT36e/i4Fd9jSbd1cgc5
         Z/L5EVe2Gx8iElaO8j8x9gJ5wNUdmVRsN+DnW0c7NppehoX080i9DaUNJtHKzJPVvzkt
         KZxZlLZUfVOeTFzteDuajF0WOyZuNqqMz8mNpgkr+BrbEC8vgj4RDGHE2/RZ+LtGYFVO
         za2HdgVpCtzYsifw7XYx6taVa9k8ofgqNjCHnnZIKIHgbtZsJxFhxmxe540KrEF6FUVe
         LYcbNy5/sl2og9KFQRqO9RjSDLfPcXZmYcARVIPUdg0MGhl5rrgZJaQFASJlPPE7BEUY
         Iirw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854282; x=1786459082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=cGEJlWngbZncYSKF3kc20BZ6vloDHtOw640mVE5g3ygopU6AdFeiYyAYL+Bius9yOR
         hYb6ltYWYYTTW9Lqv+RokmCfS5VUDacjEWQIIPS4uW86XV3oW7HIBM69ewb4cdpNNyXI
         PRfbLPvkXBK31t3UgMdhzz2DEimc7SLXEoBee2Qa9SqZTfvi7IFg5ny0I+6CGERVAg7p
         SH0hwB4lHykInKrfLq3JTBnAG3RxZ7GEPzMw+22U333nYPeeakTEe8Cu4awWj+5uMmE+
         op1OYoauSNhyCrzD440BtnYO1Hd+dBj8SFQW9eDijkDNdyHBd7L5oe/HMnuv57k47X9n
         PElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854282; x=1786459082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=lPq6IuJyeBaHZTbjB0ttECZZI/srjR2RtXW1OQ6xvyZtsarmlf4+kYwgDe6v9aI8Dw
         m4Yrl/Oh74BShrkLNGrx6hU09paoSICe4eXXP6xNoJWC4gG05BneD0UMUP6VLGWaMJH7
         u/cQ+Kcpb0luOMWwWicJ/Btep1oyFVmqiIZ6INvN6JI29cXg7CJJDnEjq9Z4kuXNLiug
         8jr1CAOTkGCt6JsMXMwuQUf/fSxAszlU+dxxYAGqapBOcth4DN1krLXnXOqpZGpGp8EB
         17ij1r9+WQrUiOeKNA0uYld9k3dxpl25K4+peuCVGQY6DqjGOb29Hii1OEdUo3OZ8pr5
         kyXA==
X-Forwarded-Encrypted: i=1; AHgh+RppuX9DRpDZqCgE/miPtbZpI12BK61pNVUKK1VeuC8t5jfzzTCWEFtwgFcvzkuAQvd2bUhBbFW9iFW0pms6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6JhpbJuCUsa3CKVoS1/7tGjeqO17IyglDivo3U9r96jOCLUHg
	dUXVvZz/u2eUVfPWwOeJ0A1NRHVydznnLULLXzANR7TTz7xQyKFBy7sVsgAtXrK5YkxoegWgG4t
	CeFdvFtd04jTG3Qs+MfsB/Aa5PJ+sei41MU+atPP1oQbaUMrRwEaWyvpNx/7zLwcElsFnBA0guu
	ronmN2+5EcJ1r0TMZCg34b/Q8aAxBCr1E3HHEchRy3ND7z/Uy9
X-Gm-Gg: AR+sD139ADBYrMGxjG7/YhZlhPk8n1yHVfOZwWsq4vF30/MAld0GKZXph81u2Z3DZxB
	Rr5V0zwH/FdDT6C9Ik0ISaYK6V9U3HJ/D+hwleGJr+rLk+9qn4BLb2H1ATwFht3OBZWjFUnfC8B
	J0lPt5W+GzotZMpb2xsUUFNb6r/CKpzNxoWnCX/E9C9HJdYhV671TEyQAUBA==
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id af79cd13be357-934a07523e6mr2091178785a.2.1785854282369;
        Tue, 04 Aug 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id
 af79cd13be357-934a07523e6mr2091173285a.2.1785854281821; Tue, 04 Aug 2026
 07:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
In-Reply-To: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:37:51 +0200
X-Gm-Features: AUfX_mxidf6ep2hrmZtMSZcppo4HDdyELeecQKKRS0CT2NESLqRaSdKaXo6bY6M
Message-ID: <CAPx+jO9RBvDJHSoCT3QVUCfGK3bLduhV1W7T7VuHipOvas1v+g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Power: Add power domain for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
X-Proofpoint-ORIG-GUID: -SSU7mWGRB93lwB7J-MBzt-QYvbDYs6Y
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a71f94a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=stQ3y3mWCCOjWvy4rzMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX8Q0SvWb7QKPT
 Gm5Y+YFEWjNFcMomRkaqZBlyBe15IB8la2SB3L3PROmlGSMI05Klz95iHzBgXev/LpuPQr2z02k
 llBl6DYkWWxMcSxWlkvGXd2FcVikuTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX0fp575HmJJYf
 su5oWzTNFExOrrb2jCIpOZnafohW2OqlQxZCPFVrxDEfH81ZI7ynZ8MRSon3sCMJCStQtMaC4VN
 wtBOuXsTErjOAX9EFpxAQe+Q/XKu70Bs+Rmhhoka+Hcu2CIdqSkK85xybAaygelIaZ2gqULH9JK
 nF0SYv/uA0sVcoGAWIy4R97gtzMfisXb6yspNvRswsq/koC7I5jycH7EtYgbwDqhgo7s9IZF96L
 7Hbh9g1UEH0K3KImZk6SPV93I/g/qT/HHt3WAg3vNF1rH08V1dPBCVW1oWhcBTstKzOdHHU1Y56
 oUEA4Qfsr7XJALzf+87BANzAce9XgvES/EGaSZ7CqLH7hBM5MpuIV/yHeNHR8IrBAHQsTqBCCey
 Rp5caG/n8GZlb00DNjlng85UOoXwySAe/ELFt1lk7nOuSltzxK9MOvXcgyRYpUv7s7jNeMczbmp
 54PtOHt2JQYqgk4ac3g==
X-Proofpoint-GUID: -SSU7mWGRB93lwB7J-MBzt-QYvbDYs6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_073804_195156_7A27D9B8 
X-CRM114-Status: GOOD (  14.53  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMTA6MznigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IEFkZCBwb3dlciBjb250cm9sbGVyIGRyaXZlciBzdXBwb3J0IGZvciBBbWxvZ2ljIEE5IFNv
Qy4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgo+IC0tLQo+IFhpYW53ZWkgWmhhbyAoMyk6Cj4gICAgICAgZHQtYmluZGluZ3M6IHBvd2Vy
OiBBZGQgQW1sb2dpYyBBOSBwb3dlciBkb21haW5zCj4gICAgICAgcG1kb21haW46IGFtbG9naWM6
IEFkZCBzdXBwb3J0IGZvciBBOSBwb3dlciBkb21haW5zIGNvbnRyb2xsZXIKPiAgICAgICBhcm02
NDogZHRzOiBhbWxvZ2ljOiBhOTogQWRkIHBvd2VyIGRvbWFpbiBjb250cm9sbGVyIG5vZGUKPgo+
ICAuLi4vYmluZGluZ3MvcG93ZXIvYW1sb2dpYyxtZXNvbi1zZWMtcHdyYy55YW1sICAgICB8ICAx
ICsKPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTkuZHRzaSAgICAgICAg
fCAxMCArKysrCj4gIGRyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5j
ICAgICAgIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdz
L3Bvd2VyL2FtbG9naWMsYTktcHdyYy5oICAgICAgICB8IDYxICsrKysrKysrKysrKysrKysrKysK
PiAgNCBmaWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKQo+IC0tLQo+IGJhc2UtY29tbWl0
OiA1NDQ0NTVhM2E4NDRlZGQ2MTA3YjE1Y2QwYWIwYjY1NzM5OWYyZDQ5Cj4gY2hhbmdlLWlkOiAy
MDI2MDcyMi1hOS1wbS0zZWZiM2YyYTRkNzIKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFhpYW53
ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Cj4KClBhdGNoMSBhbmQgcGF0Y2gy
IGFwcGxpZWQgZm9yIG5leHQsIHRoYW5rcyEKClBsZWFzZSBub3RlLCBwYXRjaDEgKGR0IHBhdGNo
KSBpcyBhbHNvIGF2YWlsYWJsZSBpbiB0aGUgaW1tdXRhYmxlIGR0CmJyYW5jaCwgZm9yIFNvQyBt
YWludGFpbmVycyB0byBwdWxsIGluIGlmIG5lZWRlZCBmb3IgcGF0Y2gzLgoKS2luZCByZWdhcmRz
ClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
