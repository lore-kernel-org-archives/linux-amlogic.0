Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6ECCA5FA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag+knXgeUwqks2GzrfBbXxvIenQjUyNmPvWo5hjQbVE=; b=1jJoeNJY/sV4fJ
	U63qdI8Xg+JfjS4kt8EHUSnaVWh8ojYqRR7tq9cTcG+05Ynv28+BFfKMD1EOf20UYrWOWZrYpnIz2
	uqzakxgFlBm4tq77iB5ZvpPp07/+mVnjCyZnckIgSWd5WE0A0hb6HHGn5VSQ+2FEiJt3n5rZ3V5Lx
	ZjqSRcOVGAQCQDSfX7mNYFD4vurkGYBpAhJ8/0rgzIZfWUXg0X2sjBu5fGHIBjMlpuc89GXZYv5Ct
	VNZ33swOUMiyuFVoXppHnvSShyArYqs0EADEgzb0WRrzG/dlLoXNrcypMu0Fhg6KQibjQn14fIknI
	D3oQxypVr5ugQyp8Oebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE30-00000000zkw-1wyF;
	Mon, 28 Sep 2026 16:17:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE2y-00000000zk5-1x6P
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Sep 2026 16:17:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeUGL941406
	for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 16:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=; b=Bi20cZ6fwwUWrbpt
	a+Jf3Joqsq1wPQmmfSoOfR1hMJyArBHC42oglSaXxYtYKBB1i5IiKWNCevloVb9o
	BKqMy5BThScgvlptiEqjd8x5WJLlLtpwfBw5GfLpiCnmeXl5WGVHzcAdxxcX9dyw
	QuV9rhVUh1vCCZHDHSNgXeL0NEKvglbUmwuhrm8FVfsNNAZXIpmgzUl3llyIXe9y
	XXmwN9Vpkj3H4XAMwdNZMZSlAQFrk5e2nIAhNI5UhcYaPFL8EMntToXkAnrQ3ZPI
	NGsc5iVv29WINfCjpU76pOETnKY/cfkMCipVDt0NcjRLJ/RO4oeDh9UcQmaHOA8q
	N/ottA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt12bwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 16:17:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0bcf8b74cso3309854a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 09:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612262; cv=none;
        d=google.com; s=arc-20260327;
        b=P3AxBgLNTmJnMKOj3MOvf6WdxUGf8c4dXB4JKD7wkB0gzMO4lp+HYLAQUb3zdNay51
         exiXZSf3ui3K3wgTlyf8KkGH88s4B8qzUlYVkTTfNnGK8xL/2s7ZYLPbSeFRNN3bAljO
         flT4dibPc+1HWmxe/pLAZ8Axk3Nxe5rsV+fnMF6aH9A1+h6virwr/awGO3bVCZwvsn/Z
         1pOUyoKLPd7v9eSVONUY//yzL+UzLxZSRQwUGsZfK+gWqFIBFLvWX7GX+dBNkSrIFX0t
         eX1y0fRBKBz9xZSJqgPyaeSywkZJu1IjCOGfhWh4ODZS3T1cuRMalD547cklfQRjUCIU
         Tpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        fh=Pt4e0L7nnb+3wMVPMejsyFaT7HJV//CgFsYpqc4qgIg=;
        b=G/hVBQvTCyDTQrPDxNycAWoZXHotb96fn/vZNCrJbzLUiNiwqbbBoa+J/D4/yc3sz5
         aKncyR334uBdc4NVFYxIH2TRd73eGy8p7febgMA8VjcQr9ALxp6SxSmEwR+/8NhXYXn8
         0bM+2Wog4QU0KlxERKMslH77KkXI/3cS7dNGiHP4BpY7DIJrthfXDJU2gFCzdycm9awT
         OcmhMPDOXNYiDMXyEYQ8SI0XWSkw92tCCnOTRt9SCpCaGpfsvkU9TUQqc3AfbMvtli76
         xuDappWK4AoKfopfaOgCY8dE3Z8VRHcRguSU3KZLQDRS6d84VWGupwi3lsbuSXZdu4EH
         XItg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612262; x=1791217062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=IJo64NbcQ/OByFduQQqlJXcg/qXT9hvMSdJvQcfjcEwmHwN1jQQx3bOzMrtapK7ukc
         Y4GxC7a01DpdPbXNT5xSa0ucx6BUNf4rosWpwVkF0JsHSO+84vd5CVlvJtxUgPqxB7rK
         xK8YnkneDw42XEx9WhERhHQkQI0jpxaHOX1Fd0e8owAtiMybnwANRHeTjFYEK1Z97Nd6
         3vbCN47TsStgdCDeOzXLBMPQxN2TSaKo8KlgbSRG7hd4pw3bElOm2qz7neDE5WJ3t26S
         4RLwC2wTYjwjW/OaTVkloazVDLrcdmT8UJXDeiMggq2PP+kjb/0ROQNo7HUTXoLs7Yzl
         XQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612262; x=1791217062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=kGDNo/FbBEf/zbMo/LmqghEQIq4hTcFiCSHJEiMHQk0CqS9KvVSQJVhu7ZxYxHt+hU
         r31hBYurNBqksMIvOoH4aI02hikWINYz0UlEodWXjW2dJK/oNDBRsicCkDo7ZfYDzTS7
         m1xMMdmFBktP7Zh6y113bIq3rfBsVU9xI8vXp9z1iNhktEr4Jpbo8bHzHhIQxbO1PvZv
         Ye6sfL0txbVeAH601+l+bpV9m2Pwe5IwA5iHWuuo3bH6MaDAW7eM51AAtDPudqVWhvqD
         +gtAUrzhdKEhN3UNmRoOmUhLuBuX/zn2MAiM3np67slgxN6UGR6DyrgbkzGs1LbI7GcY
         8dcw==
X-Forwarded-Encrypted: i=1; AKwUvBy6IXlrlypdUU/pOaKQtj1+p2Wif6Br3p5hfZwRDWHideSOZXUaMnV9nf/kZeQk46V4P556teiJt6VcBEPR@lists.infradead.org
X-Gm-Message-State: AFq9FYIL9S68Ow89tnlXZ+3q1nG6kxLqyqUEv89uwwAR96oxOtDKPKW2
	xq/IBTW2rxrSGj3ngWe+ffDN9+bFA+eU3IWBBB1jJVP9fVgKF2ylQS/5Qmr+PhNGWZGcRjkK57B
	Ibx5tKyujcus38ECRQWEWj4nh55eTy3JJiQ6hAFMCola/dVqM9DjYm/DZFD6QYG6t0pMy1hx71z
	KGb00tcXNpIiGbc7LjUYjZ6XVyyGDj/Ign2HbtnYmrXIeyCWfC
X-Gm-Gg: AYBFou2bERIXfaBuohEHSNDFvGGF3OAaThQ7TRlSBWagvDCK+gngJ/1MiBD0XkYH6n7
	zltY5IOPegITAVXEFBbIWTlvLMyR0uICSKYjYaCqiwrGfqFkyLnXqQeXg6l3zFvHWsvBKuUj1gM
	sIceuAwB4labNdHK1F71LxTpM+doK1xm1CDtVRdn6r5iONsVXklrKky+c4kw==
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id 98e67ed59e1d1-3a477fed600mr2010792a91.25.1790612262267;
        Mon, 28 Sep 2026 09:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id
 98e67ed59e1d1-3a477fed600mr2010764a91.25.1790612261755; Mon, 28 Sep 2026
 09:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260921191326.2146363-1-sanderson@brivo.com>
In-Reply-To: <20260921191326.2146363-1-sanderson@brivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:17:27 +0200
X-Gm-Features: AclHuK_h-ClRM0tgPWKnM-eRAvfXYVsbs7ZT5xtGlCXk84AjgUs2ZbGoR93rbsU
Message-ID: <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Sean Anderson <sanderson@brivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXxHoWammULLGY
 m/io3+MFbioOyx1Wh3U4o9z/h+LiaGAyRhj0ZIS6Hm4+wRusKDhRTPFEt6xZoz4wEZlFuu8pJGj
 EfHLiqvZDqqkw7bjJuSmfIFs/6o6oOJrI6M4B5hEdwoOrQgH6Vn+5cK1J90NthJQCMABQcLbGhl
 U2jo3mrYr+4GETAfNtPK6yHNKMRSlBoE23ExaQwBP56wR70F5u3aIFfNnxOhc5PT2LRpznjwKhe
 Bi+OqAmhLNc5Aj8hssOmCJUsc0YN0m+B0xGMcafHRWI+umdfqzVJzmsY0k4oYfKYLtok36wxP7m
 nZ1RyMLViA9JkhQ+4WpLAfyrzpc0qCr1T4gzhUOspGky3tn32/TcxShf6oHUSefJXcKVSyuNodK
 QF6aoF40UhSgA5wIvtYUcMho2nLQW6iwskATfuyU01lUgVz5fzJy1D86Ard6sJ8SN+cR1dSrlyF
 XThnvkqmNCYHD1LapCw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba9327 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=GX7wjADfAAAA:8 a=PBpPEWVgUkDHuXiRGYoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mSQORlMGwB5pC_Qw5Tmq4F5LWtKm0VJ5
X-Proofpoint-GUID: mSQORlMGwB5pC_Qw5Tmq4F5LWtKm0VJ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX2hGh9b0j2GAS
 5BKCdRzDA0+C8gYaOXhea+Cx4esKRWuu6a4rkiJEVj/7iVJT6+WVd1Rjztzvwh0SDNhNlwzD31K
 1LNRrItO82rmN3lrkl3w1OG5gaYM2rY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091744_620792_FE9B8F31 
X-CRM114-Status: GOOD (  21.70  )
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgOToxNOKAr1BNIFNlYW4gQW5kZXJzb24gPHNhbmRlcnNv
bkBicml2by5jb20+IHdyb3RlOgo+Cj4gVGhlIHByaW1hcnkgaGFuZGxlciBmb3IgSVJRRl9PTkVT
SE9UIGludGVycnVwdHMgaXMgYWx3YXlzIHJ1biB3aXRob3V0Cj4gdGhyZWFkaW5nLCBldmVuIG9u
IFBSRUVNUFRfUlQuIFRoZXJlZm9yZSwgd2UgbXVzdCB1c2UgYSByYXcgc3BpbmxvY2ssCj4gd2hp
Y2ggd2lsbCBuZXZlciBzbGVlcCAoZXZlbiBvbiBQUkVFTVBUX1JUKS4KClNvcnJ5LCBidXQgSSBk
b24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBhYm92ZS4gQXJlIHlvdSBzYXlpbmcgdGhhdApJUlFG
X09ORVNIT1Qgb25seSB3b3JrcyB3aXRoIHJhdyBzcGlubG9ja3M/CgpLaW5kIHJlZ2FyZHMKVWZm
ZQoKPgo+IEZpeGVzOiAwNjZlY2RlNmQ4MjYgKCJtbWM6IG1lc29uLWd4OiBhZGQgU0RJTyBpbnRl
cnJ1cHQgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBBbmRlcnNvbiA8c2FuZGVyc29u
QGJyaXZvLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIHwg
MTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMu
YyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiBpbmRleCA2OTRiYjQ0M2Q1ZjNm
Li5kNTM2NWMwNDA0Y2I5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gt
bW1jLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gQEAgLTE3Niw3
ICsxNzYsNyBAQCBzdHJ1Y3QgbWVzb25faG9zdCB7Cj4KPiAgICAgICAgIGJvb2wgbmVlZHNfcHJl
X3Bvc3RfcmVxOwo+Cj4gLSAgICAgICBzcGlubG9ja190IGxvY2s7Cj4gKyAgICAgICByYXdfc3Bp
bmxvY2tfdCBsb2NrOwo+ICB9Owo+Cj4gICNkZWZpbmUgQ01EX0NGR19MRU5HVEhfTUFTSyBHRU5N
QVNLKDgsIDApCj4gQEAgLTk1MywxMCArOTUzLDEwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtZXNv
bl9tbWNfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiAgICAgICAgIGNtZCA9IGhvc3QtPmNt
ZDsKPgo+ICAgICAgICAgaWYgKHN0YXR1cyAmIElSUV9TRElPKSB7Cj4gLSAgICAgICAgICAgICAg
IHNwaW5fbG9jaygmaG9zdC0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIHJhd19zcGluX2xvY2so
Jmhvc3QtPmxvY2spOwo+ICAgICAgICAgICAgICAgICBfX21lc29uX21tY19lbmFibGVfc2Rpb19p
cnEoaG9zdC0+bW1jLCAwKTsKPiAgICAgICAgICAgICAgICAgc2Rpb19zaWduYWxfaXJxKGhvc3Qt
Pm1tYyk7Cj4gLSAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZob3N0LT5sb2NrKTsKPiArICAg
ICAgICAgICAgICAgcmF3X3NwaW5fdW5sb2NrKCZob3N0LT5sb2NrKTsKPiAgICAgICAgICAgICAg
ICAgc3RhdHVzICY9IH5JUlFfU0RJTzsKPiAgICAgICAgICAgICAgICAgaWYgKCFzdGF0dXMpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+IEBAIC0xMTEyLDkg
KzExMTIsOSBAQCBzdGF0aWMgdm9pZCBtZXNvbl9tbWNfZW5hYmxlX3NkaW9faXJxKHN0cnVjdCBt
bWNfaG9zdCAqbW1jLCBpbnQgZW5hYmxlKQo+ICAgICAgICAgc3RydWN0IG1lc29uX2hvc3QgKmhv
c3QgPSBtbWNfcHJpdihtbWMpOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPgo+IC0g
ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKPiArICAgICAgIHJh
d19zcGluX2xvY2tfaXJxc2F2ZSgmaG9zdC0+bG9jaywgZmxhZ3MpOwo+ICAgICAgICAgX19tZXNv
bl9tbWNfZW5hYmxlX3NkaW9faXJxKG1tYywgZW5hYmxlKTsKPiAtICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKPiArICAgICAgIHJhd19zcGluX3VubG9j
a19pcnFyZXN0b3JlKCZob3N0LT5sb2NrLCBmbGFncyk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBt
ZXNvbl9tbWNfYWNrX3NkaW9faXJxKHN0cnVjdCBtbWNfaG9zdCAqbW1jKQo+IEBAIC0xMjI1LDcg
KzEyMjUsNyBAQCBzdGF0aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJf
aW5pdF9jbGs7Cj4KPiAtICAgICAgIHNwaW5fbG9ja19pbml0KCZob3N0LT5sb2NrKTsKPiArICAg
ICAgIHJhd19zcGluX2xvY2tfaW5pdCgmaG9zdC0+bG9jayk7Cj4KPiAgICAgICAgIGlmIChob3N0
LT5kcmFtX2FjY2Vzc19xdWlyaykgewo+ICAgICAgICAgICAgICAgICAvKiBMaW1pdCBzZWdtZW50
cyB0byAxIGR1ZSB0byBsb3cgYXZhaWxhYmxlIHNyYW0gbWVtb3J5ICovCj4gLS0tCj4gYmFzZS1j
b21taXQ6IDU4Nzg1ODM2NzU4MWI5YzU1YzM2OTBmNGU2MzM4MmFkNjIyNzE5ZDQKPiBicmFuY2g6
IG1lc29uX21tY19yYXcKPgo+IC0tCj4gMi41My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
