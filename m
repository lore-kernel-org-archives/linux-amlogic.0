Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBCBC531D0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMn5xnT512aAfU3Eqd6amI8y9avTrAMKEFkLYczFfd8=; b=qKd8+4TKtTzQXt
	Zm37Rnlwm2393O0/mtvwIBzSmgFHVisdOxF3Yf/xzwCey9SfdcE7mb9U5wzZRFUG4QrWuLkcFr0+r
	25ARrasCRnu/k5cx5MearK/6+Otr/vphD7ApFfVw9PKQwjqjDXgywVR0ebPw5bC5ow3KQc43Jf35/
	LucANGJJCHxkQB0XlSZxp5oVVqYfQG0jNWyna+kyoI2FW4Se8DzL9unSVkb3CJ/zeWTWCtFNRFUGl
	a0LoZ54ZJK1er2AXUKUZuKfCzxMqirl5HxltucSzLLDBlWyUksFURojhC+6jDI1DLAZBEBYU+1YgD
	a/JTpTVcyOWOVwQK0CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO8i-00000003JIF-2rEh;
	Mon, 27 Jul 2026 16:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO8f-00000003JGg-2728
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Jul 2026 16:25:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZ3c4115088
	for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2026 16:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=; b=dA3/8qQbFZLPYKV4
	upzFD2CZL4QFwUTRDk5NnQdoSIXJ0GRZNNwBZXfu+SV6AhH4jQlDU6LDAzopRZXg
	lWSCNGpe2bjfcddxCHD5ktK+UA8KEy1B140DRTj0ousdcYSnhnAN0JjwtQ/kPo9L
	CLr0xZ8+3vKM6/5athIjm96UQ7rye7M0EqxkiXhQqayAidtElubN7SatsMklwlRK
	oZl4n5O1dVr5z0ZnbyLx+LJLOZ40MuCibFiGzAQTY2hGtZnN2Y/KMa4aYqto8Yxr
	G2SilhxAOf/Y8Ijh2ggksqgz977uHruA6lQkLAhRQg8oEhIIRFk5Gb2b9uNsFbn4
	XffEGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsqx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2026 16:25:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930f5da3467so365203185a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785169512; cv=none;
        d=google.com; s=arc-20260327;
        b=AZoeZwTKItCAJFduDcxsam+hyxN9vACL8mVfMfvBOXKJw9Rcr9JHBnTFJaLqpyKKpP
         /v5j7ZKmCoGBMG8ZO81nnoKICqZ39Z8UA5uk6hlzkgVijk3pYrFVRtG+bTTjNubB9rX/
         PXyJB2Y/WYqDT1+nXhiJjae34kzUfQXmqFypbahlj2noj8ITMxIUduiv0AlNAT5ypW8X
         CwtIPz9i0jXMa9PC9/6fFdO1g8KNY1AJbIkjt3NF6Jk8VAty1sRPdEdJMEHrZK2+XHKG
         qBPm15hCjJ4OjmRWCJcRJ15a7O78Ha1r9Jw8UoOtJg1peZxExObZ8CeBWbXH2G7pvKCO
         mw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        fh=jQRNkhCPseM+Dr9ZXK4J227b0RNpGXq5PwzmO0nZ5Dk=;
        b=TcYy+p/6k+IbahQ5CeEK+ui374IBMmIeaiXiZ+sSYEVUlpsCnJgObfRFvrlDKCYZng
         iZ3Vkd3jtNj9OqbtKjtAfLxTOGxxbyZ89OnRctEqTRX5L21+vdc+C9tVn8AOAuiFwqp5
         3+BpOvBmavEpYqW4ReWsMoo2y59WLAhrBwaLl4JNyL+GOJaOj7fkoK5LDfrYYEDvSa/9
         xt+BOQwzepENOwuhJTIVjCJ5Uop2lUv+o03hI+cjXIfk0kh7oEQ7JWh7L67F+VcrWupy
         JnUpW530BI1gV0u+OYfN7YvmuvV14zpHjGGW15FIAX20Ii5nqRGBTIszwg/GIZa8yYPK
         5LKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169512; x=1785774312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        b=Ne1GQW98hMnfkB0WvuT6pwjptSd4Nu03Vz60i4ysnyLWfmdiqXuSnpJ9L9H0nRFvJ+
         grVqBsoXZda4PkfP0Od64X8YTA5oizCW76G7gJ5x7Fr7noFDXtuZ5eCZ2CtT/Ven5sZD
         F0PERnqG1+nLVEm56WpMWZPQrJjzNDmelHGCwtWO6kjilO6/Wy4ZxiEg4FGc0iJl7J2U
         mN8rmanQVIOFovqbkmL8XQaPdkKomMQ5o/IiiBgl1cyjoR0k8oWrYWJ4qm3iRWpTsqi3
         sTc1oTEzDaerAa5WoLnlsypwLOOQTJG5FTI7DxQgJvQNI5tmulS5zEhEReoB37jk34q9
         6E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169512; x=1785774312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        b=L0OSPJbPVQssEBL9/hekruUgtCWCKL5dDukkJy+gRdq8mzqVpw31luUdF5duVaTEJB
         FMs4JfNZP/YgT1z06p5sqGfa7d9vK3NT9hjyyXpbv+fOcTNOnAc6L5jCc7RuizhBVf4N
         eMq0nMfTC57GeYyu4MsirSXty9panHC6m/QN+JJXFDuiG95UwbJIVi2NRL2wDxtKO2yz
         RtAYxB1bKaAq27bkdd9ZcfISZEsFGiaO9ZjOny4Qp+hINThS+9RkyjikywZ/QlDwnI94
         MC+ZgpiMFYDPWv1qqj4/EgtOqjrCczTfHQzxFw1f+hbcXVgWP6BS++T+7l8Mf/ihz/TG
         N9Tw==
X-Forwarded-Encrypted: i=1; AHgh+RrnPG2q1mZG7RXFzYNie3PPO26d6pc6wkbJUni+5DZeMt7jbi47ZM5xVdcfU71Gbbvws21c7q1zFJFIwM8T@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQR8SW9rPXhjUS7Mu9EFfroCu3Jt2+MQ+3WZgXR14gulRHB3I
	1C7ifu1j7RYoCLRl8ZOFiHtd8mVvsPJZ2+jkAZ2hmE1Ge/eYMTijjgxoXvpmkr0X3Lt7nxjbEqG
	3S8U4AtXavoLM7UKDpZlC1XVSwejK1f5UYdVNNNhCMX2Pq+S7AXIHPJudUcmMaw3Eh9rKxrakvP
	P/Tqqj0sWeVU9nJeYKEXrVxjr2s9oo1nItDY8E4kQ9xj0J0SqP
X-Gm-Gg: AR+sD11L9k2fqH6FfKaKrGUKE7sHVkeY29eG2Ms0nP+dWmxOd2gCitw3b1MC37z2Ii4
	l53v+pqQHsf6SAOhstLU+oEc2BmQMBdJuUKnos+ebEeZt6TvkGeJOxyTppmRyDR2vh14/DIniW5
	5RnZBTdr98qhS6dn6GmNWv34/RokUHGFjFnamQ5XJZrGfa5jTucztVwny8kg==
X-Received: by 2002:a05:620a:630f:10b0:92e:70e9:6865 with SMTP id af79cd13be357-932df6f5721mr719210985a.59.1785169511755;
        Mon, 27 Jul 2026 09:25:11 -0700 (PDT)
X-Received: by 2002:a05:620a:630f:10b0:92e:70e9:6865 with SMTP id
 af79cd13be357-932df6f5721mr719204585a.59.1785169511268; Mon, 27 Jul 2026
 09:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260717101508.635969-1-panchuang@vivo.com>
In-Reply-To: <20260717101508.635969-1-panchuang@vivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:25:00 +0200
X-Gm-Features: AUfX_mypfPWM-amzHbSs1D-8MroCYJxvNGLX8PscRYAazVsoNMy_QxZjvylnM7A
Message-ID: <CAPx+jO_fcijCoA0UEPS359EZKgzEtjP3EYKt48r7ryOz6RT12A@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Robert Richter <rric@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Thomas Fourier <fourier.thomas@gmail.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
        "open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>,
        "moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX5T+Tb33gpcUR
 ApE1xj5s/WF9PmfoUjROb1Bh1ZPa9mtQT9VzKmDM3YpDcwDukE9gnsKsDvcogHIzrHM5qTrcoKo
 qTeh8u7FaUv7axurOPRzrYVfTMO7ShE=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a678668 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=1WtWmnkvAAAA:8 a=TYD399XWoFAa3X5oXMIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CHgjg8moM_JBeOWfVqtKGgIMQJB-v2BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX5J3EavlKVMuG
 LmX0+L9SHlqYyhqB4TS69L9x+oWFWk7jVO28GcloNBCLJxsDHq4eRdq/T6q6JZ9EHy3W5+sJG/O
 FIsrNfb5EKYLykXA7PwvgRt1kGbUy7xvkUG8lsLySyyP+glUP6hFqsK10zGrnVgj2UZ4/DZo5Du
 tP2+uxSqelqvKPKNsarqYlJErEY/EYn0FjHN87DjL7ofHaMn6f++NGojMlfxDhK670ET+gwCkhv
 jvoB1WbYHVujJqd/t++EPkIISz0xKgavbWVWorF7g5qwhc1EEETFbThJOhCAAK1IWOAgpX7WITf
 VJea8mUgoX/MeJmFMxZA6JUl5rrlAJw+UaH4G/bnB3Jw6D32JsPLmAVYVuynJ5l7J/0+HCZ0qeJ
 F0EL4k3+YsQ3nR6wqMTqhj0Ps9tcjuyCyE30Kaq8oIOkAwm7qks+c8mOhQ7XQuTrZsH0XaVQqwg
 8qgQUlB2y1JZMXdef9g==
X-Proofpoint-ORIG-GUID: CHgjg8moM_JBeOWfVqtKGgIMQJB-v2BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092513_652652_9305E300 
X-CRM114-Status: GOOD (  20.82  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMTI6MTfigK9QTSBQYW4gQ2h1YW5nIDxwYW5jaHVhbmdA
dml2by5jb20+IHdyb3RlOgo+Cj4gU2luY2UgY29tbWl0IDU1YjQ4ZTIzZjVjNCAoImdlbmlycS9k
ZXZyZXM6IEFkZCBlcnJvciBoYW5kbGluZyBpbgo+IGRldm1fcmVxdWVzdF8qX2lycSgpIiksIGRl
dm1fcmVxdWVzdF9pcnEoKSBhbmQgZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpCj4gYXV0b21h
dGljYWxseSBsb2cgZGV0YWlsZWQgZXJyb3IgbWVzc2FnZXMgb24gZmFpbHVyZS4gUmVtb3ZlIHRo
ZQo+IG5vdy1yZWR1bmRhbnQgZHJpdmVyLXNwZWNpZmljIGRldl9lcnIoKSBhbmQgZGV2X2Vycl9w
cm9iZSgpIGNhbGxzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFuIENodWFuZyA8cGFuY2h1YW5nQHZp
dm8uY29tPgoKQXBwbGllZCBmb3IgbmV4dCwgdGhhbmtzIQoKS2luZCByZWdhcmRzClVmZmUKCgo+
IC0tLQo+ICBkcml2ZXJzL21tYy9ob3N0L2FsY29yLmMgICAgICAgICB8ICAzICstLQo+ICBkcml2
ZXJzL21tYy9ob3N0L2Nhdml1bS1vY3Rlb24uYyB8IDEwICsrLS0tLS0tLS0KPiAgZHJpdmVycy9t
bWMvaG9zdC9tZXNvbi1teC1zZGlvLmMgfCAgNSArLS0tLQo+ICBkcml2ZXJzL21tYy9ob3N0L212
c2Rpby5jICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tbWMvaG9zdC9vbWFwX2hzbW1jLmMg
ICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3Qvb3dsLW1tYy5jICAgICAgIHwgIDUgKy0t
LS0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYyAgICAgfCAgNCArLS0tCj4gIGRyaXZl
cnMvbW1jL2hvc3Qvc2hfbW1jaWYuYyAgICAgIHwgIDggKystLS0tLS0KPiAgOCBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21tYy9ob3N0L2FsY29yLmMgYi9kcml2ZXJzL21tYy9ob3N0L2FsY29yLmMKPiBpbmRl
eCA3MjFkYjU0NzM5YzEuLjQ1NTI4OTA5YTc1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21tYy9o
b3N0L2FsY29yLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L2FsY29yLmMKPiBAQCAtMTEwMyw4
ICsxMTAzLDcgQEAgc3RhdGljIGludCBhbGNvcl9wY2lfc2RtbWNfZHJ2X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYWxjb3JfaXJx
LCBhbGNvcl9pcnFfdGhyZWFkLCBJUlFGX1NIQVJFRCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBEUlZfTkFNRV9BTENPUl9QQ0lfU0RNTUMsIGhvc3QpOwo+ICAgICAgICAgaWYgKHJldCkKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBpcnEgZm9y
IGRhdGEgbGluZVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAg
IG11dGV4X2luaXQoJmhvc3QtPmNtZF9tdXRleCk7Cj4gICAgICAgICBJTklUX0RFTEFZRURfV09S
SygmaG9zdC0+dGltZW91dF93b3JrLCBhbGNvcl90aW1lb3V0X3RpbWVyKTsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tbWMvaG9zdC9jYXZpdW0tb2N0ZW9uLmMgYi9kcml2ZXJzL21tYy9ob3N0L2Nh
dml1bS1vY3Rlb24uYwo+IGluZGV4IDhhMGRhZGRkOTIwMC4uMWJmYzFhNGY5ZmU5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvY2F2aXVtLW9jdGVvbi5jCj4gKysrIGIvZHJpdmVycy9t
bWMvaG9zdC9jYXZpdW0tb2N0ZW9uLmMKPiBAQCAtMjQwLDIxICsyNDAsMTUgQEAgc3RhdGljIGlu
dCBvY3Rlb25fbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBtbWNf
aXJxW2ldLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y3ZtX21tY19pbnRlcnJ1cHQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAwLCBjdm1fbW1jX2lycV9uYW1lc1tpXSwgaG9zdCk7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHJldCA8IDApIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIkVycm9yOiBkZXZtX3JlcXVlc3RfaXJxICVkXG4iLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtbWNfaXJxW2ldKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICByZXQg
PSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIG1tY19pcnFbMF0sCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3ZtX21tY19pbnRlcnJ1cHQsIDAsIEtCVUlMRF9N
T0ROQU1FLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvc3QpOwo+
IC0gICAgICAgICAgICAgICBpZiAocmV0IDwgMCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGRldl9lcnIoJnBkZXYtPmRldiwgIkVycm9yOiBkZXZtX3JlcXVlc3RfaXJxICVkXG4iLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW1jX2lycVswXSk7Cj4gKyAgICAgICAgICAg
ICAgIGlmIChyZXQgPCAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
LSAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgaG9zdC0+Z2xvYmFsX3B3
cl9ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZwZGV2LT5kZXYsCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5jIGIvZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1teC1zZGlvLmMKPiBpbmRleCA1OTIxZTJjYjIxODAuLmJlZjVlODQzZjQ0OSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaW8uYwo+ICsrKyBiL2RyaXZlcnMv
bW1jL2hvc3QvbWVzb24tbXgtc2Rpby5jCj4gQEAgLTY4MywxMSArNjgzLDggQEAgc3RhdGljIGlu
dCBtZXNvbl9teF9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzb25fbXhfbW1jX2lycSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzb25fbXhfbW1jX2lycV90
aHJlYWQsIElSUUZfT05FU0hPVCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTlVMTCwgaG9zdCk7Cj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAg
IGRldl9lcnJfcHJvYmUoaG9zdC0+Y29udHJvbGxlcl9kZXYsIHJldCwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIHJlcXVlc3QgSVJRXG4iKTsKPiArICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyb3JfdW5yZWdpc3Rlcl9zbG90X3BkZXY7
Cj4gLSAgICAgICB9Cj4KPiAgICAgICAgIGNvcmVfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
aG9zdC0+Y29udHJvbGxlcl9kZXYsICJjb3JlIik7Cj4gICAgICAgICBpZiAoSVNfRVJSKGNvcmVf
Y2xrKSkgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L212c2Rpby5jIGIvZHJpdmVy
cy9tbWMvaG9zdC9tdnNkaW8uYwo+IGluZGV4IDc5ZGYyZmE4OWEzZi4uY2Y3MDViMjY1ZTIxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbXZzZGlvLmMKPiArKysgYi9kcml2ZXJzL21t
Yy9ob3N0L212c2Rpby5jCj4gQEAgLTc2NCwxMCArNzY0LDggQEAgc3RhdGljIGludCBtdnNkX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBtdnNkX3Bvd2VyX2Rv
d24oaG9zdCk7Cj4KPiAgICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwg
aXJxLCBtdnNkX2lycSwgMCwgRFJJVkVSX05BTUUsIGhvc3QpOwo+IC0gICAgICAgaWYgKHJldCkg
ewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW5ub3QgYXNzaWduIGly
cSAlZFxuIiwgaXJxKTsKPiArICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+IC0gICAgICAgfQo+Cj4gICAgICAgICB0aW1lcl9zZXR1cCgmaG9zdC0+dGltZXIsIG12
c2RfdGltZW91dF90aW1lciwgMCk7Cj4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCBtbWMpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L29tYXBfaHNtbWMuYyBiL2Ry
aXZlcnMvbW1jL2hvc3Qvb21hcF9oc21tYy5jCj4gaW5kZXggNThjODgxZjI3MjViLi42M2E5ZmI5
NzA5NzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9vbWFwX2hzbW1jLmMKPiArKysg
Yi9kcml2ZXJzL21tYy9ob3N0L29tYXBfaHNtbWMuYwo+IEBAIC0xOTE1LDEwICsxOTE1LDggQEAg
c3RhdGljIGludCBvbWFwX2hzbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICAvKiBSZXF1ZXN0IElSUSBmb3IgTU1DIG9wZXJhdGlvbnMgKi8KPiAgICAgICAg
IHJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaG9zdC0+aXJxLCBvbWFwX2hzbW1j
X2lycSwgMCwKPiAgICAgICAgICAgICAgICAgICAgICAgICBtbWNfaG9zdG5hbWUobW1jKSwgaG9z
dCk7Cj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIobW1jX2Rl
dihob3N0LT5tbWMpLCAiVW5hYmxlIHRvIGdyYWIgSFNNTUMgSVJRXG4iKTsKPiArICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2lycTsKPiAtICAgICAgIH0KPgo+ICAg
ICAgICAgcmV0ID0gb21hcF9oc21tY19yZWdfZ2V0KGhvc3QpOwo+ICAgICAgICAgaWYgKHJldCkK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9vd2wtbW1jLmMgYi9kcml2ZXJzL21tYy9o
b3N0L293bC1tbWMuYwo+IGluZGV4IDM0OTA4MmQ3NmE5OS4uZDViOGExMTAyNjdiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvb3dsLW1tYy5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9z
dC9vd2wtbW1jLmMKPiBAQCAtNjM1LDExICs2MzUsOCBAQCBzdGF0aWMgaW50IG93bF9tbWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAgcmV0ID0gZGV2bV9y
ZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBvd2xfaG9zdC0+aXJxLCBvd2xfaXJxX2hhbmRsZXIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBv
d2xfaG9zdCk7Cj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIo
JnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXF1ZXN0IGlycSAlZFxuIiwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBvd2xfaG9zdC0+aXJxKTsKPiArICAgICAgIGlmIChyZXQpCj4gICAgICAgICAg
ICAgICAgIGdvdG8gZXJyX3JlbGVhc2VfY2hhbm5lbDsKPiAtICAgICAgIH0KPgo+ICAgICAgICAg
cmV0ID0gbW1jX2FkZF9ob3N0KG1tYyk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNp
LW1zbS5jCj4gaW5kZXggY2VlZDQ3Y2NmZGE4Li40YWZmOTY1ZjBlMmUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYwo+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2Ro
Y2ktbXNtLmMKPiBAQCAtMjg2NCwxMCArMjg2NCw4IEBAIHN0YXRpYyBpbnQgc2RoY2lfbXNtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICByZXQgPSBkZXZtX3Jl
cXVlc3RfdGhyZWFkZWRfaXJxKCZwZGV2LT5kZXYsIG1zbV9ob3N0LT5wd3JfaXJxLCBOVUxMLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZGhjaV9tc21fcHdyX2ly
cSwgSVJRRl9PTkVTSE9ULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfbmFtZSgmcGRldi0+ZGV2KSwgaG9zdCk7Cj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAg
ICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIlJlcXVlc3QgSVJRIGZhaWxlZCAoJWQp
XG4iLCByZXQpOwo+ICsgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBjbGtf
ZGlzYWJsZTsKPiAtICAgICAgIH0KPgo+ICAgICAgICAgbXNtX2hvc3QtPm1tYy0+Y2FwcyB8PSBN
TUNfQ0FQX1dBSVRfV0hJTEVfQlVTWSB8IE1NQ19DQVBfTkVFRF9SU1BfQlVTWTsKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NoX21tY2lmLmMgYi9kcml2ZXJzL21tYy9ob3N0L3No
X21tY2lmLmMKPiBpbmRleCA5ODMxOTU2ZGUxYzguLjc3MDZkMDFiMTQ5ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21tYy9ob3N0L3NoX21tY2lmLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3No
X21tY2lmLmMKPiBAQCAtMTUwNSwxOCArMTUwNSwxNCBAQCBzdGF0aWMgaW50IHNoX21tY2lmX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBuYW1lID0gaXJxWzFd
IDwgMCA/IGRldl9uYW1lKGRldikgOiAic2hfbW1jOmVycm9yIjsKPiAgICAgICAgIHJldCA9IGRl
dm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBpcnFbMF0sIHNoX21tY2lmX2ludHIsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNoX21tY2lmX2lycXQsIDAsIG5h
bWUsIGhvc3QpOwo+IC0gICAgICAgaWYgKHJldCkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgInJlcXVlc3RfaXJxIGVycm9yICglcylcbiIsIG5hbWUpOwo+ICsgICAgICAgaWYgKHJl
dCkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfY2xrOwo+IC0gICAgICAgfQo+ICAgICAgICAg
aWYgKGlycVsxXSA+PSAwKSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF90
aHJlYWRlZF9pcnEoZGV2LCBpcnFbMV0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2hfbW1jaWZfaW50ciwgc2hfbW1jaWZfaXJxdCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCAic2hfbW1jOmludCIs
IGhvc3QpOwo+IC0gICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJyZXF1ZXN0X2lycSBlcnJvciAoc2hfbW1jOmludClcbiIpOwo+
ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX2NsazsKPiAtICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBtdXRl
eF9pbml0KCZob3N0LT50aHJlYWRfbG9jayk7Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
