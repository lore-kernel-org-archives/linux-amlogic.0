Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F85CA5FB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDuw2TDpC86inUep/RJzTNZeYGwCPuGoEZhCEbInF0k=; b=almtNhqjP+Mzdh
	BldT9CvYAJrMoIoVT+Y8tHJjuWDP+SD8Mua+ak1ZNU+fBCwXjc/kw/nZHIDYtmOpzbRijkXeMk2so
	kYoEQLWytpF6g/3bEjMhdkHZG2SI4r63jbJKHJe8CfjNJBhCt6VzYU2aDNp2kKeY054GOTa8QfPr0
	9t1bZ9CyQHE3x0KNA3JzUcQ1ZWr16bTZjHs43fNtkLSGMoPGqwTP2Dg1qXAKSyge7g3vuHLdi2ddP
	+Qy/bVbovsoaChfdUWx1iS8irFdkWKJtfp0XnEZXUC2rZQE2vrMDh5muWYo/3HTvYENudPbCmv7cW
	K5g3It9OjDK63oPRgoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqbS-00000005Yi6-2NMH;
	Wed, 30 Sep 2026 09:27:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqbR-00000005Yh5-0tO2
	for linux-amlogic@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=; b=qjXC1GSuHuxxzgSqOw5nm0BLiU
	Lskrw1krAA5IWUDjNEvbyGYdChfoa6U7ra+CS+QYL4rfByF0SsAWBUZnbJp6Lbn4pQlbKMsnqv3gl
	P/Os25aCJ6XszaBCrw4OGRV7K46S3mxa+u441puXrVg7GcapBYxIcdZyMPEWz+YoYSjifU9aLdY8P
	8+PaE1JTd7Z47IUOzxjQac+/KhJLTZtlxjfo8382YC9jXzLAgomJXaLc9yVb+Omnh1tKFUEpcODC9
	1gQ9Jm523Y1z5W/6OZyDy+WTqpBRVzuq9LhnDEjkIQJDjxr8UXuh9hj78U9sBE1MS3R1udyLgTHPz
	zKS6ABcw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqbH-00000003Zx3-1jMe
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 09:27:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dW2H2119372
	for <linux-amlogic@lists.infradead.org>; Wed, 30 Sep 2026 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=; b=hxZcIdBnBZT671Aa
	Tn1fS6wYB5ZiDEO49xdsMfjoZpM+E7lzUVYEZtMxuFbKxuKgdNP6O8Qn5QIKjBsm
	wJCgzaG2/lFpvx9XDJrCtUe+qxbguo1S2b4CbRIKQDtVt79e0JShciJJwepw/1LY
	SzHPFthHkJIf/fOcCV8JEOcZW9y2+2RlTk5Ks1JmcQeEN2JQQA8yNbCIyEKWOQv1
	UUo/RsGo7TAejIXnwANrQ2EkUY+4nJ3YOhQP+mOfBj1wzMQT5pBXr3sQDDHresQd
	K/0Qy2c8Uf8vQBu3FOdkrtBniQeWTx12E63t7VTq2LOLXsypmtxyGBe+6P+MPfgB
	Ht21bw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhej0x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 30 Sep 2026 09:27:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so5020547a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Sep 2026 02:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760460; cv=none;
        d=google.com; s=arc-20260327;
        b=OWlUwrVN/qIFolJKSzPnZTfq8iWCz91SmsbYWktejnpAfCMtH5cYnVML1Wz623YS8R
         QTh63R10BR9XeBDIAc4VPiXXWW2HjDKmnfwgnEnRWAHo4LqPUP/rkt1I+BJTTrEDy3eJ
         kEO9K/wgUYEtptSKhpxYlulwzX5HrqCg1D2bZqs5Naa5GgbVGmV8Xx2E4TDKgRe4Rb0f
         1y30BQDwuqm27Sa9VAInaZVJ8849UO+owCZr/ZgMeUt8hUip0ybjM91TN2YLiHkkLq+L
         0gtAhEY1KSnXvzHiQ31sqiPTGNteFYhFQtJkpLxX4CrbYa78IRit9RYFsOzeOClxk8oL
         TJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        fh=a9KBXtkAyeFxLXalaeYPRq7EG/aM7rcw1f0pjV5xEpc=;
        b=IUEg7ZIK8ykwszJqLrDzkXZVj/peIstKouJ8Ean22HKBsZXmLOqJAHvsGT/jeZo9+g
         9wAj04oEKkeRRtP3IHqg9oZ1J4XfqHE3hzrL5J3pJ/zptWnXxlu4RC6BDS3orcY2eStG
         e5xoMT3MuGNs+FlBvkx78JEw/QcvD2BQIH1lojlSBAi0oQwkIWNmNxlAOgbQR1bqWbMB
         6uz6oVhRDlwBx30tCa+E0VUCFN6CYLk/dKZWcEXNCJXKk1s+n950Bwzz1tGb7U2qom2H
         9ubcHOLKas+CNCDyX2i9UI6ymUgDhmpkyXmPDSVIS9RGFEDXY03ABXuxJ0I7CgELs0FH
         sFTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790760460; x=1791365260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        b=CoHVt4NF0vMIFjBxJsdvGKI0BiibmAcZqV27H8mUDUDY+KTj9JyAHcLsKilHSD1ytP
         yTgUVK8RxhoHLLCm+6bkPrNtCucYvFq8dzgObyyG5OCV1tFHUlP2wZNyU71tC8Vtdbnm
         4gTV3d4RNrZHXPGvd1Z/gGoWLmlDI+a7NGRF9+Jn9B41Ts0WW/HM/r3OZXjgRkbhH/wz
         2qqHHcnVIY+GOiTkpcNQhOvntbvUFmpJKpyY0ysCe04DX1Rm3oXKBgVfQOPz/AqqQ7rR
         Hy+b10efuhzYlv91QJZki9SKwUHBtarIbA/7BdPXtvspFoZFrvQVE5Rjv8IZrElFNeGv
         SoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760460; x=1791365260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        b=fof3ODE0oKgUqpiZYpjHqhJ300hbLMPw3I1mupxV+ONTeEbtyaPP3uvdlBoVXTgzq9
         aYgHAEjIIAmPqCnxwvvlooCj3wPTNJrl8ecbw49Vb7sn+hIj32PtyAn4u84YxMjcj5T5
         +2E2qMR60XFULwsPySQCg7ZmveLoxYY6sqxZCgroBZYpiN594SZq5PNMV43gYPIkP9rZ
         q85AVrnDy03V/nxoTOLUoWhhIgw652nomGMtHKbqtPWEuC6g0E3r3XHwpYkfa1Fa+y/+
         111z+dUrYIM9sY5vPswPSuMyCiUySDt2TyhUFGw5WK9GMvY0RPm515lHK8COGyb4QCab
         7gHw==
X-Forwarded-Encrypted: i=1; AKwUvBxVrm7lVACEvpn3y5ssQTpyU/yO3tZ9za7Ju71VslBU7R68lUNvyHbgri2HjmASAW/U5m7pkJTWA0yH3LSF@lists.infradead.org
X-Gm-Message-State: AFq9FYIk5Nu6dfb0Uc/LuyzbABS7B2PtY4Khi8tDOQaPL6pZeUtNZdBJ
	EXGGzSkVXVTfzXlDUBuPPIOmmhF6JQFPrG3o8NGKFDLgxXI903D/wr9qqCp9+7K6cEz6bD7bZM8
	947u4ZcwsdWEtxTzdL2D0k8kS4p3k9QPjNnOx7e2wFt5Nuqvdd+CMkwJn9ttbvGRcpRQRF6E+6i
	S04Sn5+jQ3SgWlE60CMf3JaZ0j0AtBLwtK6HivwHYXDFio8Dfq
X-Gm-Gg: AYBFou1I7hQb/k7qWvZD9UJWj0b9Z8Sj712EDS31yNh8znV8SH5CLsdQFOFpL6ESqde
	xx7MGFTQEuxrX8VpCHXXzPOvHOAgh4fVeGvj6BuJSRascNAyiqnhsU6zbvvHSiSJPrD1hJ1/Qcx
	ggp8oCCWFH+mZ9mNHa8Xv2AsNUDskZgJfu7hJlewgzkw8ZIUZvCS+bec8LIg==
X-Received: by 2002:a17:90b:4e87:b0:3a4:b2f5:d01f with SMTP id 98e67ed59e1d1-3a4d1787217mr660506a91.40.1790760460266;
        Wed, 30 Sep 2026 02:27:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4e87:b0:3a4:b2f5:d01f with SMTP id
 98e67ed59e1d1-3a4d1787217mr660485a91.40.1790760459446; Wed, 30 Sep 2026
 02:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260921191326.2146363-1-sanderson@brivo.com> <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
 <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
In-Reply-To: <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:27:27 +0200
X-Gm-Features: AclHuK-S1WmRfbn9a5BeauI3-UXbHdXkwq45V-fosa7Wt5Ing9N0Y4xLuBNhtzM
Message-ID: <CAPx+jO8QfkO42HnzU5BEQsGzqb6_pUFeT38E4EBpSA1kEpTexg@mail.gmail.com>
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
X-Proofpoint-GUID: XzlcyLdsHHfanWjP_XeC9dm7vAXl1GwQ
X-Proofpoint-ORIG-GUID: XzlcyLdsHHfanWjP_XeC9dm7vAXl1GwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX7m8OdDOVSofE
 z5oF1rUAW8ir//ph32i/KTcsbxQkN00lO/AgxWKTZVRrBMHK25ANosInXWzWSV67rZj6tksMkFe
 eq4L7Oc7aYayBL0EMdatXeKV/UMs2QZO2LkQt15w5T1rb93iVIo+5lKja46YLQ2cNTeHOOok8LX
 HB9HdW8kh3q6VV+YluWpIVu9oi4Pgs6J+ViNJensQSsbKWwyS4P5r9qSInY3wnZiITMh0vz9LMF
 KM8njmQMZtZ8J7DykhE5cMNHVKhcsa2Eq0scCkMiKeIWqIgOvahaQJXpCG+ueztZTALl7qBlJqg
 Z7zBlO+pLYqrQL0uYC045BuYM8Amnxofp0cGhCYo5K+xmQwk4milMxlzsSNdzUBydwqcNYoTPSv
 7ALrp6OPmFcvZQOZsc+IBZe5Vk6XJy4NWB77Fw1PniY2CktgopXo7oCQoO+2pQqJSZn5zHFm+zo
 lnWP5z92eARz2KYarzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX8A4mGCCH4Gkf
 QqTqhtAsryXrkNPQgHweGeeVjEZYuC0UUYxVpMDbkUOHHfv3P4ptt1h38j0fNOiRRLbzYBwT8RB
 j6FlCw5uXz/K44Q9cxzSGYPZTPnTUFA=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcd60d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=GX7wjADfAAAA:8
 a=LhH22EzeW9Yl2Fhwn_IA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_102744_014756_51F4D070 
X-CRM114-Status: GOOD (  28.57  )
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgNjoyMuKAr1BNIFNlYW4gQW5kZXJzb24gPHNhbmRlcnNv
bkBicml2by5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDkvMjgvMjYgMTI6MTcgUE0sIFVsZiBIYW5z
c29uIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgOToxNOKAr1BNIFNlYW4gQW5k
ZXJzb24gPHNhbmRlcnNvbkBicml2by5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIHByaW1hcnkg
aGFuZGxlciBmb3IgSVJRRl9PTkVTSE9UIGludGVycnVwdHMgaXMgYWx3YXlzIHJ1biB3aXRob3V0
Cj4gPj4gdGhyZWFkaW5nLCBldmVuIG9uIFBSRUVNUFRfUlQuIFRoZXJlZm9yZSwgd2UgbXVzdCB1
c2UgYSByYXcgc3BpbmxvY2ssCj4gPj4gd2hpY2ggd2lsbCBuZXZlciBzbGVlcCAoZXZlbiBvbiBQ
UkVFTVBUX1JUKS4KPiA+Cj4gPiBTb3JyeSwgYnV0IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB0
aGUgYWJvdmUuIEFyZSB5b3Ugc2F5aW5nIHRoYXQKPiA+IElSUUZfT05FU0hPVCBvbmx5IHdvcmtz
IHdpdGggcmF3IHNwaW5sb2Nrcz8KPgo+IFRoZSBwcmltYXJ5IGhhbmRsZXIgb2YgYW4gSVJRRl9P
TkVTSE9UIGhhbmRsZXIgbXVzdCB1c2UgcmF3IHNwaW5sb2Nrcy4KPgo+IGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2NvcmUtYXBpL3JlYWwtdGltZS9kaWZmZXJlbmNlcy5o
dG1sI2ludGVycnVwdC1oYW5kbGluZwoKUmlnaHQsIHRoYW5rcyBmb3Igc2hhcmluZyEKClJhdGhl
ciB0aGFuIG1vdmluZyB0byB1c2UgYSByYXcgc3BpbmxvY2ssIEkgdGhpbmsgYSBiZXR0ZXIgb3B0
aW9uCndvdWxkIGJlIHRvIGNvbnZlcnQgdGhlIGRyaXZlciBpbnRvIHVzaW5nIG9ubHkgYSB0aHJl
YWRlZCBpcnEgaGFuZGxlciwKdW5sZXNzIHRoZXJlIGFyZSBzcGVjaWZpYyByZWFzb25zIHdoeSB0
aGlzIGNhbid0IHdvcmsuCgo+Cj4gPgo+ID4+Cj4gPj4gRml4ZXM6IDA2NmVjZGU2ZDgyNiAoIm1t
YzogbWVzb24tZ3g6IGFkZCBTRElPIGludGVycnVwdCBzdXBwb3J0IikKPiA+PiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIEFuZGVyc29uIDxzYW5kZXJzb25AYnJpdm8uY29tPgoKS2luZCByZWdhcmRzClVm
ZmUKCgo+ID4+IC0tLQo+ID4+Cj4gPj4gICBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5j
IHwgMTIgKysrKysrLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qv
bWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gPj4gaW5k
ZXggNjk0YmI0NDNkNWYzZi4uZDUzNjVjMDQwNGNiOSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJz
L21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gPj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNv
bi1neC1tbWMuYwo+ID4+IEBAIC0xNzYsNyArMTc2LDcgQEAgc3RydWN0IG1lc29uX2hvc3Qgewo+
ID4+Cj4gPj4gICAgICAgICAgYm9vbCBuZWVkc19wcmVfcG9zdF9yZXE7Cj4gPj4KPiA+PiAtICAg
ICAgIHNwaW5sb2NrX3QgbG9jazsKPiA+PiArICAgICAgIHJhd19zcGlubG9ja190IGxvY2s7Cj4g
Pj4gICB9Owo+ID4+Cj4gPj4gICAjZGVmaW5lIENNRF9DRkdfTEVOR1RIX01BU0sgR0VOTUFTSyg4
LCAwKQo+ID4+IEBAIC05NTMsMTAgKzk1MywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbWVzb25f
bW1jX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gPj4gICAgICAgICAgY21kID0gaG9zdC0+
Y21kOwo+ID4+Cj4gPj4gICAgICAgICAgaWYgKHN0YXR1cyAmIElSUV9TRElPKSB7Cj4gPj4gLSAg
ICAgICAgICAgICAgIHNwaW5fbG9jaygmaG9zdC0+bG9jayk7Cj4gPj4gKyAgICAgICAgICAgICAg
IHJhd19zcGluX2xvY2soJmhvc3QtPmxvY2spOwo+ID4+ICAgICAgICAgICAgICAgICAgX19tZXNv
bl9tbWNfZW5hYmxlX3NkaW9faXJxKGhvc3QtPm1tYywgMCk7Cj4gPj4gICAgICAgICAgICAgICAg
ICBzZGlvX3NpZ25hbF9pcnEoaG9zdC0+bW1jKTsKPiA+PiAtICAgICAgICAgICAgICAgc3Bpbl91
bmxvY2soJmhvc3QtPmxvY2spOwo+ID4+ICsgICAgICAgICAgICAgICByYXdfc3Bpbl91bmxvY2so
Jmhvc3QtPmxvY2spOwo+ID4+ICAgICAgICAgICAgICAgICAgc3RhdHVzICY9IH5JUlFfU0RJTzsK
PiA+PiAgICAgICAgICAgICAgICAgIGlmICghc3RhdHVzKQo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPj4gQEAgLTExMTIsOSArMTExMiw5IEBAIHN0
YXRpYyB2b2lkIG1lc29uX21tY19lbmFibGVfc2Rpb19pcnEoc3RydWN0IG1tY19ob3N0ICptbWMs
IGludCBlbmFibGUpCj4gPj4gICAgICAgICAgc3RydWN0IG1lc29uX2hvc3QgKmhvc3QgPSBtbWNf
cHJpdihtbWMpOwo+ID4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPj4KPiA+PiAt
ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZob3N0LT5sb2NrLCBmbGFncyk7Cj4gPj4gKyAgICAg
ICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKPiA+PiAgICAgICAg
ICBfX21lc29uX21tY19lbmFibGVfc2Rpb19pcnEobW1jLCBlbmFibGUpOwo+ID4+IC0gICAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaG9zdC0+bG9jaywgZmxhZ3MpOwo+ID4+ICsgICAgICAg
cmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKPiA+PiAgIH0K
PiA+Pgo+ID4+ICAgc3RhdGljIHZvaWQgbWVzb25fbW1jX2Fja19zZGlvX2lycShzdHJ1Y3QgbW1j
X2hvc3QgKm1tYykKPiA+PiBAQCAtMTIyNSw3ICsxMjI1LDcgQEAgc3RhdGljIGludCBtZXNvbl9t
bWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgICAgICAgICBpZiAo
cmV0KQo+ID4+ICAgICAgICAgICAgICAgICAgZ290byBlcnJfaW5pdF9jbGs7Cj4gPj4KPiA+PiAt
ICAgICAgIHNwaW5fbG9ja19pbml0KCZob3N0LT5sb2NrKTsKPiA+PiArICAgICAgIHJhd19zcGlu
X2xvY2tfaW5pdCgmaG9zdC0+bG9jayk7Cj4gPj4KPiA+PiAgICAgICAgICBpZiAoaG9zdC0+ZHJh
bV9hY2Nlc3NfcXVpcmspIHsKPiA+PiAgICAgICAgICAgICAgICAgIC8qIExpbWl0IHNlZ21lbnRz
IHRvIDEgZHVlIHRvIGxvdyBhdmFpbGFibGUgc3JhbSBtZW1vcnkgKi8KPiA+PiAtLS0KPiA+PiBi
YXNlLWNvbW1pdDogNTg3ODU4MzY3NTgxYjljNTVjMzY5MGY0ZTYzMzgyYWQ2MjI3MTlkNAo+ID4+
IGJyYW5jaDogbWVzb25fbW1jX3Jhdwo+ID4+Cj4gPj4gLS0KPiA+PiAyLjUzLjAKPiA+Pgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
