Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EE6C79F9E
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMeLh+vFq12JSPYO93iLgrJkYCKLXRbf+x9GKvkkLjo=; b=XJ+PknN5MR3vT3
	H8rh+wjeHwrlKyL3cAxytA1MXvLLYRumCeOPx0ANAkpIkQaAmejLQmtOE2Oyoc6YnTv64uv8CTisb
	GeoLZpofcgrXqpYnZNSjwirAiNKFgOQZq7BA2dTtzON7xEe8qIxJ22MEzJWjMCQ5pC7Ei1p5sALhN
	ZWfvEpntUzHsTyQsnfwcNsRqgfwpPhcaadYIIavyQ22pAGY8S8S2HRso+HhEmgEYtsyyWMggeAJLd
	uvVAtA6dXfpDZMHy0ulYAIL1+d+I/8aw6+u/4PWmE/VxSGFoYRj1qCatXTQHsZpojPUUYVfhYfkCc
	PYzugaOysfi0Fh6yMBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP8-00000009bAA-2qCd;
	Tue, 08 Sep 2026 16:10:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP5-00000009b8F-0G5A
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 16:10:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdmkY3965000
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Sep 2026 16:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=; b=Wym9qvhx0i9s34Ns
	deiPdGODZSfOch2qfXuQPcigTEkHSNjVMjrz1XahSpCoPP7TTnOysq3lkFQZz4GX
	Hp9N7y0MK9ixz6QUc80mkw+By6sNWwBgt3b54br5DlyM1yUwYYc0o6eWVWPtECbQ
	cVIOxRYoEwPDUDPvkpg2wDO8qYya5Y0hdpuP/KwhB+a3vcHJHE7kJuipfrkr+dt5
	D12/EUqtXotLT2f6sGepK8dMurVGmHP9u5mv1168UdJjBeMicmj6uf8EH4EBrKf+
	6H/U1Wi7OcoMHItVWa6OC62O87oRkRcY48JqzeaJmpT/mDS/Z1wL38k9QYVpdp7g
	WpJBnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49qjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 16:10:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so91227955ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 09:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883822; cv=none;
        d=google.com; s=arc-20260327;
        b=MCLOzZAIqYz8C07DFy2ssL2G2eaxa2yIgpO3xLavcD+4MGOCMGQBrTsrLMV5x3VzCP
         BFeBj18XHF39w+dnO4RbbWrFd8xvU0XahjjW/sE0QdieptAXEXh/hEP6z07llByn0JWz
         hRkyfHxjjS1E0k7MaWODFS5GEt/AwVHljJ7nNLg4Jua4MLiWSlHFGLDI5krYa6ugy0w6
         wE9nZOTtdJ6xCQ+Ah+W+TUzU8DlV+nzgzJKvovonunJuiUZw5e0F+nOZvilI5xvKBYyX
         Zk6rGLH6l6xYBEdsScFYJ7QZOZJ2wf3BlyY76TxqAoTeKfh47xC2SP9Ok1UoGt1STgVc
         s4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        fh=U1BamTE+ep7d7msIBNLKyDTfiTJwnyI02CXr4UM4MgI=;
        b=f52+VzlCrFOEIo5WfboZp8xmDc6097cCKr4YZY9BEa/Ggb34VEQkhOoHpUeizNvTla
         tIPfBvYVing7iylu0UyqN7RY8xdClz5IfQH5vDboIIJooQi+f7U9eixTx864E/9SUx1X
         26H3dAApvuF6WJL5hO45a9+RdsaNlIwm6SnKxgnnUNkhZumQJ+Xm+/15JbxC2VSCeAVA
         +ie6EfZbC0Z5G8G2lmGlEnxjAGTFNmF30DjUYvrsb5P+Ufdjrm9o2KhGlZpGLyB5b20l
         MNK37eria7WsrtKpWN8/Fdt2wiN0zlxHNcFAoThd0gzdX8yLEYOj4SvvHrrFG+sYFJAj
         333w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883822; x=1789488622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=IANX9WqS5z4g3nLBGC7H5vJjGVDd9uSDKkuLK6SVUIYNDwJpO88AOMxh9vLuSnlP8C
         fiQudMNyWSpZ8mD+XV4xWz20403omUDPh4AjXcE4TaGiRmCfS1dhB2SOCaPyr4V5q/GA
         pysxHUab7G2K3jv6PoU3F29/80lD24HKaDW1NUdAncooKkLs6zQ+viMlUPr6uvrX1dZ8
         ZqmMxeWwKqlFcZt2ymarOk3+5kr+mXHGK2TkX1vcfctkrOq8p6ItGZ88SYfWOKiFugCi
         msRl5I+d9CgQPiwdjOQs1eS9EPefbUnIpEl09QHo4427iHQ+xKhJaYdbuAylmADJYjMn
         9g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883822; x=1789488622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=CYgdqiGf75cI7K9tCsKuXNRH2hlxvujGNe3QsJmtgE5laatDYZPt5tL/n9dyzs4UV2
         wJYCsYB0SHnl0XOtJlL3Fulv1WHxiXouRKTxKe042MTGvUYgqjJZ4BCY7t+4LW+MD6ea
         aqrQXsih+7j64O/4GG4/Jkz4hZN0uPcLgAaFMa1Szc4BQ6oSJPJlevlS7WsmKDVy8Omb
         8oWGdQUQJQDZ6Wjhr2lqKDV/53CwONQ+TkAIrgbczOyBiJf8NWwm1Sv0pLR9qKEqmRTf
         ScnxK+Sx/wKAfRxQfKZ1+oX8Ulqm6SkP6fW2wQWLgndbqqeSBvu1m+cnlzxUE0TKfuNv
         nrqg==
X-Forwarded-Encrypted: i=1; AKwUvBzHf5MPS9Fn0VEW8cA5i2vNW8+FuGI5+sRpQJD4svBrm6NpxhqED2uvZ9t7r9BJ4tPHnNgILoAq1Y7XgPtu@lists.infradead.org
X-Gm-Message-State: AFuF++mLE5ceCuP4vuGcSmwoC6UWSf3xVOMs5D74E2NGGJQeSOzEWnyN
	u6ClMtGA6C6N3qIL+YOry0/jaYZipl0+w8vUOe1UuPhE8de8qdo6UbOGJuaXMpoSyscHsh+0ywE
	an/NPewYiskR9ZdnGq/8+m3XnLlX8yb+W+VuJb96Ff5uf3CJjVABkl8aLPd/QKLG+GQKuv4s03x
	x09Aa1NQnzeLvEssYXfWxj+rGa30YzwvEQQxh8FpX0UHGxFfVZ
X-Gm-Gg: AYBFou3OS3b3aLYGNwEWxrlFhujtxeJQI2IDMQeuNNKYZND1MfIOAUe4/Y+hEonCbi6
	VOuvGOdPKxKO0Otjm28fO4VyxJusTHbkI6TOV4xqKItItkI+zju6Y/wnFsHXKxm1zesJ+x0w0nA
	J4GecE8Cc+RwEMOocrNJ14lDgdqHLHVYqoU5DVAkje7fC0LL6rijBSu395hg==
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2db8d928e3emr2837825ad.6.1788883821925;
        Tue, 08 Sep 2026 09:10:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id
 d9443c01a7336-2db8d928e3emr2837105ad.6.1788883821531; Tue, 08 Sep 2026
 09:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:09 +0200
X-Gm-Features: AcwNN1UW4IZJxDfsw72uzKL4GFJXZL8rZaPaQEJwZlE7EQT6AUnNa1eW5qYq8ig
Message-ID: <CAPx+jO9=Jvi0BqzSUSfnY5LXbt8g-00h5pvznL76gOiNzi72JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: Handle errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Stepan Ionichev <sozdayvek@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Osama Abdelkader <osama.abdelkader@gmail.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa03373 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=tukmojBuO8YyzP4fvAEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OlQTa4iB8VUBzVytugKJfGclFGRay3ZC
X-Proofpoint-GUID: OlQTa4iB8VUBzVytugKJfGclFGRay3ZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX9dXR/Xouwllh
 7CFgoMy5W6TmGsyUGE0WUwlUpHYuRkyl4L8+/eEz6Vb4ZSG7HC8YgUmmIxXagQ33nneLIqZnGPm
 Hd297rZOiVP4JWBKxkDaQ7PZ1NnarEUgnzPAqQ25ap4uzlguauGInSbQAsvcET9PHo33jC34LGY
 3vIN3pmLt2IxB+Zc7XQJBBNwwUmSk9/PspDJDmR45jlZxK1s1aHrgYZSGzgoyUbJnZWQSmWDp5m
 6icVl4fV76apoZXsIn0w5CNkC5NcIixO/VaHEyraQva/ef+aUXj5njv7CviKzuDKIgHQSD0HOb+
 uwHX3o64auy3sThj7MrzS3t7kZ9ehDq5J37JpajxMR7c6ls59cmxqEzNU42xqFHNsYxTGiF/88S
 83MQ5jSreTKyi5z5luuKHflqdTVNKLB42vvPpZaawNRjSKdICgowBlwl3x8YbVmejBJAr/4tICH
 7YwZ9sGU5D7v5nLkQgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX4hr6AMH7Muf6
 axf79HkBXjp2i/pb6umPc3fRs1bLQfkn1RelyAMWzbvEQsksWkgTR+urqrUkq7UOfIuTQ//SRfG
 8FRlKqHWNqv7Yb34tRCYAa0kdcmtbyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091035_211719_B3635504 
X-CRM114-Status: GOOD (  18.60  )
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

T24gVGh1LCBBdWcgMTMsIDIwMjYgYXQgNzozNOKAr0FNIDxwaHVjZHVjLmJ1aUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gRnJvbTogYnVpIGR1YyBwaHVjIDxwaHVjZHVjLmJ1aUBnbWFpbC5jb20+Cj4K
PiBIaSBhbGwsCj4KPiBUaGlzIHNlcmllcyBpbXByb3ZlcyBlcnJvciBoYW5kbGluZyBmb3Igb3B0
aW9uYWwgSVJRIGxvb2t1cHMgaW4gc2V2ZXJhbAo+IE1NQyBkcml2ZXJzLgo+Cj4gSSBub3RpY2Vk
IHRoYXQgbW1jOiBsaXRleF9tbWMgaGFuZGxlcyB0aGUgcmV0dXJuIHZhbHVlIGZyb20KPiBwbGF0
Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgY29ycmVjdGx5LCBkaXN0aW5ndWlzaGluZyB0aGUgY2Fz
ZSB3aGVyZSBhbgo+IG9wdGlvbmFsIElSUSBpcyBub3QgYXZhaWxhYmxlIGZyb20gb3RoZXIgZXJy
b3JzLiBUaGlzIHNlcmllcyBmb2xsb3dzIHRoZQo+IHNhbWUgYXBwcm9hY2ggaW4gdGhlIGFmZmVj
dGVkIGRyaXZlcnMuCgpUaGUgc2VyaWVzIGxvb2tzIGNvcnJlY3QgdG8gbWUsIGJ1dCBzb21lb25l
IHNob3VsZCByZWFsbHkgbG9vayBpbnRvCmltcHJvdmluZy9yZXBsYWNpbmcgdGhlIHBsYXRmb3Jt
X2dldF9pcnFfb3B0aW9uYWwoKSBBUEkuIENhbGxlcnMKc2hvdWxkIG5vdCBoYXZlIHRvIGNoZWNr
IGZvciBzcGVjaWZpYyBlcnJvciBjb2RlcyBhcyB0aGF0IGlzIGp1c3QKcHJvbmUgdG8gcHJvYmxl
bXMuCgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBVc2UgcGFyc2VfZmFpbCBmb3IgcHJvcGVyIGNs
ZWFudXAgb24gSVJRIGxvb2t1cCBlcnJvcnMuCj4gIC0gSW5pdGlhbGl6ZSBjZF9pcnEgdG8gLUVO
WElPLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFBodWMKPgo+IGJ1aSBkdWMgcGh1YyAoMyk6Cj4gICBt
bWM6IG1lc29uLWd4OiBIYW5kbGUgZXJyb3JzIGZyb20gb3B0aW9uYWwgSVJRIGxvb2t1cAo+ICAg
bW1jOiBkYXZpbmNpOiBIYW5kbGUgZXJyb3JzIGZyb20gb3B0aW9uYWwgSVJRIGxvb2t1cAo+ICAg
bW1jOiBkYXZpbmNpOiBIYW5kbGUgb3B0aW9uYWwgSVJRIHJldHVybiB2YWx1ZSBjb3JyZWN0bHkK
Pgo+ICBkcml2ZXJzL21tYy9ob3N0L2RhdmluY2lfbW1jLmMgIHwgNiArKysrKy0KPiAgZHJpdmVy
cy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyB8IDkgKysrKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCkFw
cGxpZWQgZm9yIG5leHQsIHRoYW5rcyEKCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
