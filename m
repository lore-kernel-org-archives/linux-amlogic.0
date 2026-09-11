Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BEEC88E50
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vaer/ELVvkM9gLWG1lzZ9GFirFhoCzRL2psnccFEuk=; b=W6CNblHQsmkLVS
	m9jDWTmS3eT/JA/MXmDq8MqG+Yhas7sNlYdJZQfRfX9vHaUOqnw01qNLEYI8Rnu/nhP6bxYVgDeRd
	PNv9dXDuwg3nV7L2gMnv7bi5mqX7V95RULbLnGlBFvUJ3gN7jev2kI6BSxRW4LGPP21+97p5uGbhW
	3xfmVEvTUYcrQQom9OqiRb0Ejz7vq64M7xohxAh6iJIg9zjnCu76UjK1E8WrpTmS3uCVhrcbQ7CEi
	iufeMyIyPIIdDniMMBnJmR5ZsSvbpya5MMhbu9mG5j/4hzkoHJiUlH5vFcjdgc4llBqTnOf42m5xP
	DCKalUAqu8F3SLYzlPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Mx-0000000H5fK-1Tgq;
	Fri, 11 Sep 2026 15:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Mu-0000000H5eJ-2Ltl
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 15:40:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmIcb3780780
	for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 15:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=I3TZVEPXZXd1Os5M
	NrODBZZh7T1xCUBzKFyUjkEAOKX+RRhB0xUdUtqnXOD7wpDfJgVcM0P8ZAzbzvJL
	17AjNsRXhsgYC5/xF3Hz+eo0TceSARvcGYLMIQwqFJRdfdKtgutrri/KzKcvQE7q
	28Rok/kNb+0XzN8xl2dgjNWrDHiJ/ENoqsceZe9haNYmE2I/eUyUlVT2J1t8q6QD
	SLrrbQEDq93v0gaYF4B2SeI1gp521usXrUP7WHGlDJXSRZNOLmz1u4BX4hHyEwrx
	XGTXtD2+scqMlbuWYo/tagR/1XZRpd1B6QX0sGpdvpj23BhXJClvEu8QAj32QnDw
	vQqPkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj859-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 15:40:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3d832827so12985395ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141246; cv=none;
        d=google.com; s=arc-20260327;
        b=JggdqFd59RNOeZa1bRkKLkXhv8ayG5oF8u8ks/eMjSOaZYPuCmkk663O88mTrLkEmP
         4EtVZ8ZRzyNpdpXzE9cE8n4jKUXweBtv2XvOGNZjd2HV46+h1vGzQUI+kgfICex0pgvM
         1gT1w/KrcdW53Yi5NipqV8wNrYAdkCVcLDx60ACw16EsrNyzCPnOq8PJ9xkw7mRjBoUB
         bwmaBh7tw80g+bzoh8po/OtGuOEsXiVGBy/gnZCJ3ZoKlJXYKuc/bnMx0UjYAJqA9iQq
         YkWNfVk2PpfigPkfbNl6jZMup26jiJuO7XNFtS0DueYwhgX+ITw6SxMFvt6chZDvzpEz
         aEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        fh=9aik7O+QA+fC28G4yStt5d8SrktdOEBXzuRc8xA0ACE=;
        b=M9xvveO8qso2BoV8g/fdYCWTprXTOlY0SHerBgU3Jg0en6o4KaLQv3uaE/Q0sSSkEm
         EmldyML5muktceHikZynDwxjN6qWcp3NCLjEHOoklLH1eb4satwsFlTlne4bvjBdCFVK
         jgVZ2ko81N1lvWdrJEkr//F9uzdAE2nvfmbWQ4P2bGOdbK54zbmJ7z8onHW61I6g7iNw
         9KFD90TKCTzYDrVdz/AEXjcC6kD2LpleJ8C3zfwWZtjI563fKp0a2IaO0Jha41nJyUWA
         WWj11wb/vRVSf7iRHnxg5akVQsw8GbZSOLtPahIlbmXG+TnDLBOwYEk+bwIQTPxaa4fZ
         /48A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141246; x=1789746046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=gKg8QoddPqzAPdjorYTa7yJlVoog4fXw2U4PFf6gDxBsbG/C+Ah6FtArnFgPLoLjw3
         M6d5tb68uZ5IZMP6CER6T2dbL52hHvvbpdSFYIPcoNw0qgrU7fJ59mudBixMvpf29Odr
         lwEMXKp1Z/nt5N+HC0ItEPrVsp5YzH7td9QuoOWsJQKaW5n/EpJUaW/QuQnHKhMyZa4o
         j49HimoUjb8WAbzonsy3xqqAR7zw7ej7TH0/51H4nYZPhoFaR5CDBdfet1NXEraWIU+2
         aN3YI20zszvc0hZCdLyHNnU5vaJ5midy8meZvuqNbQtqlyiw+RzhEAKBtSBMy7CX3BYZ
         etHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141246; x=1789746046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=CyRrbMlRqJjI9gXI6AjOFvjSt2khHTZoKojIji9RnTi5ddD4N3UsMmT20dsiFioVNb
         J3wMu8rU9Onxob9Wngu374R9y3N0tUhrL2rQwahYvzO/AWFjk6GotyLS/4+3QnKx2/nP
         Ed7xyKu5C4wuZEQtUOd6hWxmbMBtBOSjVR2ftfVRfmwfnz2OxZvCwSOr4hJj9SOceEgH
         niKjqDFY2kwPARpj3uzHCH2IYcH2AniX+0xHLiVDUa4BH8w+c5NR0ZmIpL3c1tPArDo+
         eN+TbmdnNHaHeQddwGeLfl4X/YAslxO72OMjjfDEEnX8n2iRcrUS+tNM9IREIVS+IToG
         ooYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfPtvUI9KdkkVXZ3GQLsa38laB6Oe6D30zXntZXQbMW2i2FKL++cZWxApq9z8stqZK8+1uCHR3ga8WvqAp@lists.infradead.org
X-Gm-Message-State: AFuF++nKmZdBFFhXVxVpdWw/LDJW0ahZf0AVYjc03QIO3r8JK11yeoYw
	O3leL5HMWfJ0oOr1wQtsx8Y7wj2h4Ou0wx+YrSXuEOaerHO3sYTYzkFH9W6viyYLjdYP460mJMM
	6fTS8kbZz4KieWwH4xHOxVPFrG3zfi0J7MR2Ko1anBR2wSSNaEbd7V74cFygVlTove3KpJKAl7i
	cP5mwa/+N7EDPHuwd+rkW2uiWD1RU6tKNwFZBu59P7mSn7dALs
X-Gm-Gg: AYBFou3ydemuHZGa5B8nLCzL6dNDFidUIH0k3Sp8TuZLGK6j+VGDozuUcAluSPgB1hJ
	PinUuDKvM1gsdllnzJbrqenCj8DYJrLeLuekupcOENWg0HkTHYzP7oGOTfW/CS/YhsDiQ0yb2OT
	2jXHe20kzV+6fk4R8WFo+YJIwVCo/QcRN+QM80IZbNMGlBJf1YzNRK/UXmrw==
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd2a45aef6mr95924715ad.21.1789141246343;
        Fri, 11 Sep 2026 08:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd2a45aef6mr95924275ad.21.1789141245940; Fri, 11 Sep 2026
 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com>
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:34 +0200
X-Gm-Features: AcwNN1XJiqHpLAh6BkLXLC9WoOCg1aSLupw2Vf07ULv13DKT3f9hOH1d-RT7-pQ
Message-ID: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXz5KU3VVZ9/XP
 Kof4yZfNqhY84jwljnj2iBuI/NB7rXpt96FaY9/KigPrLObajCDqUU0MKYNFrtf6ojLKWxaWPsT
 NB0C6DyWY6eWZ36v/1+XLOH3YaXIiXbFrXJeryVfBCXz/cGPCmGHUKZZw0CFDbPX3zNlt8hgdlx
 4JouLs9YHopcM3MncldgocUu9IhRWC/auoC5939o5xC6IqURK8Nxw8HX8fiGq4M0ygp/gxlF4VM
 8lAHXbXCS34UxxBNpAkN8jtm6/slvBP3ABYw9OAM/McM77OpoSHP5Kfed6ZiWAqXf9Jr3jsfR1O
 k+a60Vo8AlnIOZ+L7DSryiH0BaWpd+N3ekHjo+y2FK9fLpdWdiYzjWB5lM9iu3yxIOp17K0lX0l
 YVMSRskZQtuMStydugZUqGumUdm36VeqK3hQbP24umdBrAquN1JzOlJixWodZNbG2VTJNw+Y8E6
 NlgagxdsZte3nRZzYMQ==
X-Proofpoint-GUID: cxeEIpaSUV11nRkFZQ4tPr_BbB6Rjyau
X-Proofpoint-ORIG-GUID: cxeEIpaSUV11nRkFZQ4tPr_BbB6Rjyau
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX76afi9hW5vns
 7L3JpoQRguuRfJMdt1disxiR0u+c6sThI6AMkUljT4KrmHnMbORTKm5MAmwwvJUnEYulATFOezh
 lYiA0YUoVTTo6a0yJhOemYG6hFkngak=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa420ff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NufY4J3AAAAA:8 a=yCDuxKIkwSfSSdlP9cUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084048_709581_8573E3DF 
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

T24gU2F0LCBTZXAgNSwgMjAyNiBhdCA1OjMy4oCvUE0gTHVjYXMgVGFudXJlIDx0YW51cmVAbGlu
dXguY29tPiB3cm90ZToKPgo+IFRoZSBwcmV2aW91cyBzZXJpZXMgZm9yIHRoZSBpbnRlcm1pdHRl
bnQgYm9vdCBoYW5ncyBvbiB0aGUgVklNNAo+IG1hcmtlZCBzeXNfYW1waXBlX25hbmQgYXMgY3Jp
dGljYWwuIEJ1dCBhcyBDaHVhbiBMaXUgZnJvbSBBbWxvZ2ljCj4gZXhwbGFpbmVkLCBzeXNfYW1w
aXBlX25hbmQgY2xvY2tzIGEgcGlwZWxpbmUgc3RhZ2UgdGhhdCB0aGUKPiBoYXJkd2FyZSBkZXNp
Z24gaW5zZXJ0cyBpbiB0aGUgYnVzIHBhdGggYmV0d2VlbiB0aGUgU0QvZU1NQwo+IGNvbnRyb2xs
ZXJzIGFuZCB0aGUgTklDX01BVFJJWCBmYWJyaWMgdG8gaGVscCB0aW1pbmcgY2xvc3VyZS4KPgo+
IFNvIHRoZSBjbG9jayBoYXMgcmVhbCBjb25zdW1lcnM6IHJlZmVyZW5jZSBpdCBmcm9tIHRoZSB0
aHJlZSBNTUMKPiBjb250cm9sbGVyIG5vZGVzIGFuZCBkcm9wIENMS19JU19DUklUSUNBTCBpbnN0
ZWFkLgo+Cj4gVGhlIHNlcmllcyBjcm9zc2VzIHRocmVlIHRyZWVzOyBwYXRjaCA0IChjbGspIG11
c3Qgb25seSBsYW5kIGFmdGVyCj4gcGF0Y2hlcyAxLTMsIG90aGVyd2lzZSB0aGUgRE1BIGhhbmdz
IGZpeGVkIGJ5IDQzZTE3MDVlY2FiOSBjb21lIGJhY2suCj4KPiBDaGFuZ2VzIHNpbmNlIHYxIFsz
XToKPiAgLSBEcm9wcGVkIHRoZSBGaXhlczogdGFnOyB0aGlzIHNlcmllcyBpcyBhbiBpbXByb3Zl
bWVudCBhbmQgc2hvdWxkIG5vdAo+ICAgIGJlIHBpY2tlZCB1cCBieSBzdGFibGUgKEplcm9tZSBC
cnVuZXQpCj4gIC0gTW92ZWQgdGhlIHBhdGNoIDQgZGVwZW5kZW5jeSBub3RlIGJlbG93IHRoZSAt
LS0gc28gaXQgaXMgbm90IGtlcHQKPiAgICBmb3IgcG9zdGVyaXR5IChKZXJvbWUgQnJ1bmV0KQo+
ICAtIERyb3BwZWQgdGhlIGUtbWFpbCBhZGRyZXNzIGZyb20gdGhlIEFzc2lzdGVkLWJ5IHRyYWls
ZXIsIHNlZQo+ICAgIERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2RpbmctYXNzaXN0YW50cy5yc3Qg
KEplcm9tZSBCcnVuZXQpCj4gIC0gRml4ZWQgdGhlIHNwYWNlLWluZGVudGVkIGVycm9yIHBhdGgg
YWRkZWQgdG8gbWVzb25fbW1jX3Byb2JlKCkgaW4KPiAgICBwYXRjaCAyLCBpdCBkaWQgbm90IHBh
c3MgY2hlY2twYXRjaAo+ICAtIERyb3BwZWQgdGhlIENMS19QSVBFTElORSgpIG1hY3JvIGZyb20g
cGF0Y2ggMjsgaGFzX3BpcGVsaW5lX2NsayBpcyBhCj4gICAgY2FwYWJpbGl0eSBmbGFnLCBub3Qg
YW4gU0RfRU1NQ19DTE9DSyByZWdpc3RlciBmaWVsZAo+Cj4gVGhhbmtzLAo+IEx1Y2FzCj4KPiBM
dWNhcyBUYW51cmUgKDQpOgo+ICAgZHQtYmluZGluZ3M6IG1tYzogYW1sb2dpYyxtZXNvbi1neC1t
bWM6IGRvY3VtZW50IHRoZSBUNyBwaXBlbGluZSBjbG9jawo+ICAgbW1jOiBtZXNvbi1neDogZW5h
YmxlIHRoZSBidXMgcGlwZWxpbmUgY2xvY2sgb24gVDcKPiAgIGFybTY0OiBkdHM6IGFtbG9naWM6
IHQ3OiBhZGQgdGhlIHBpcGVsaW5lIGNsb2NrIHRvIHRoZSBNTUMgY29udHJvbGxlcnMKPiAgIGNs
azogbWVzb246IHQ3OiBkb24ndCBtYXJrIHN5c19hbXBpcGVfbmFuZCBhcyBjcml0aWNhbAo+Cj4g
IC4uLi9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1tbWMueWFtbCAgICB8IDI5ICsrKysr
KysrKysrKysrKysrKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcu
ZHRzaSAgIHwgMTUgKysrKysrLS0tLQo+ICBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFs
cy5jICAgICAgICAgICAgfCAxMCArKystLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gt
bW1jLmMgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA2MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi41NS4wCj4KClBh
dGNoIDEgYW5kIHBhdGNoMiBhcHBsaWVkIGZvciBuZXh0LCB0aGFua3MhCgpLaW5kIHJlZ2FyZHMK
VWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
