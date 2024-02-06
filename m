Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331B9C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gub9eCaSDvFDvGKCgk4tORzUWabyju1hw0gaUXadv74=; b=E2lgRJRd6nNkEo
	y4HpCjuhSJpxl2NCmX5fVJ6TQuibkt0pkM2nLYx0YUGydDBxUry8Un4J4kfhbjp5zwTDttiqxxRT0
	WF1XSnnRKmKezCt9P4qnUNa49PJROM46xqle86CMyPed+kNegjbCw5FDylcIJJBpANXLizbc5dZVL
	G+poWmpXSroEp1yebXQM96SQv+SncFfwrQ1rT0PmwzxPBiAAszKaZTnC8zZJNFZahZLGTGrOV+7l2
	2I1hjoJNutVC24eMPszNcDFg1/y8qtOg23mrFahI/+SbmP+2cXlYoFINer9WdJZpVDcW9AK6cDsjv
	yS4C0kA7KjFcPt/fXl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJf3-00000007KfW-1LOW;
	Tue, 06 Feb 2024 11:30:45 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIUS-00000006xnR-1aIc;
	Tue, 06 Feb 2024 10:15:48 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so4137589fac.0;
        Tue, 06 Feb 2024 02:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707214533; x=1707819333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBS8Yh5YqiclAyOZKBpe4qOml9BTzdnh4IdKzV2sbVc=;
        b=Q5kI2whSsW4PCCqafV9X30NIpe4JzBZmmwrc89KLiXvdJ/pfp7HeDYQE5AYxqAeggx
         50bUg1sgEnZGkALPA7ZFz+l1PAPVkTd7YOFFytK0UxmFO5Ar5ALXwTv4FHyeCD7NXDVv
         Y8fe6uifT8CC1wrl3SMeSk0n7YLL+EWziU/05FkQzw31J+b/KjKxLFjfP5AfBqcAB1qC
         /gXbYt8sLD3HukKHWVtw4eGK0zHgqL5ZfcgSOXu+84XU/C9mDHVGVF4vH99NxNC3iUYq
         1bgxo6xbYtQgGgCUFNN2jVq9lSMMXAmqkRWob/h/NjzcJYztJSa3TvxgoNXDbnN2Pk+3
         MKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214533; x=1707819333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBS8Yh5YqiclAyOZKBpe4qOml9BTzdnh4IdKzV2sbVc=;
        b=jU37QLeysDbGlxATjXjFZvL4FmfjkpjRSMO2roDkwCZHpZAFuWLrz3O6S/guB7g4U2
         El47ZMq1lZYldlMNpiTS5KqZiCcIn2IDaP0V608AE+6aJtwH/OZXe0mU4jv7/Mvj8ukU
         6dtYokfnB5jb0t6Giu305ZaetYZigXQ6GBMD23n2S/gJQ655yOC0/OgWeTqRa6EQxD97
         08NTTElRrx+hwJXyHxlGgWhalKnVpm2726tkAWS7ESzZbYbw2mgckaPF2xBEU/mdIrqq
         0WcxMOB6NtBW2TVOuCmrwHZXK2qZsM/pt7hlPaxuUPBZmc5Ea1uqe5zRN81uK4QwLrdv
         /lhA==
X-Gm-Message-State: AOJu0YzGqv/lJ7h2IjRRdKzth0TCHt4NIZ7QdRsMGKylzSXtaDJwDvdI
	Hf7EGq0vMnG9Ag2/sHz1jvvBI2LOKw1UWCwidQzzPqZWrU3vOubsg6rhUziiBEZAiPqumvO6d3T
	JX43mSSradJZlvClpYF8ifAQMASULrodPDh4=
X-Google-Smtp-Source: AGHT+IE2mLfhffrLED1DRY8tjKQ/AgIN/G3/DIWH2lVHcsiGstLeRE6hmixzegb6IcejtvpnmYFgTvWKMC1JvdIueL0=
X-Received: by 2002:a05:6870:80d3:b0:219:5696:235b with SMTP id
 r19-20020a05687080d300b002195696235bmr2118073oab.27.1707214533547; Tue, 06
 Feb 2024 02:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
In-Reply-To: <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 6 Feb 2024 15:45:16 +0530
Message-ID: <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_021544_497143_75773156 
X-CRM114-Status: GOOD (  13.01  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgNiBGZWIgMjAyNCBhdCAxNDozMCwgTmVpbCBBcm1zdHJvbmcgPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMDIvMjAyNCAxODoxOSwg
QW5hbmQgTW9vbiB3cm90ZToKPiA+IEFzIHBlciBTOTIyWCBkYXRhc2hlZXQgYWRkIG1pc3Npbmcg
Y2FjaGUgaW5mb3JtYXRpb24gdG8gdGhlIEFtbG9naWMKPiA+IFM5MjJYIFNvQy4KPiA+Cj4gPiAt
IEVhY2ggQ29ydGV4LUE1MyBjb3JlIGhhcyAzMiBLQiBvZiBpbnN0cnVjdGlvbiBjYWNoZSBhbmQK
PiA+ICAgICAgIDMyIEtCIG9mIEwxIGRhdGEgY2FjaGUgYXZhaWxhYmxlLgo+ID4gLSBFYWNoIENv
cnRleC1BNzMgY29yZSBoYXMgNjQgS0Igb2YgTDEgaW5zdHJ1Y3Rpb24gY2FjaGUgYW5kCj4gPiAg
ICAgICA2NCBLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJsZS4KPiA+IC0gVGhlIGxpdHRsZSAo
QTUzKSBjbHVzdGVyIGhhcyA1MTIgS0Igb2YgdW5pZmllZCBMMiBjYWNoZSBhdmFpbGFibGUuCj4g
PiAtIFRoZSBiaWcgKEE3MykgY2x1c3RlciBoYXMgMSBNQiBvZiB1bmlmaWVkIEwyIGNhY2hlIGF2
YWlsYWJsZS4KPgo+IERhdGFzaGVldCBzYXlzOgo+IFRoZSBxdWFkIGNvcmUgQ29ydGV44oSiLUE3
MyBwcm9jZXNzb3IgaXMgcGFpcmVkIHdpdGggQTUzIHByb2Nlc3NvciBpbiBhIGJpZy5MaXR0bGUg
Y29uZmlndXJhdGlvbiwgd2l0aCBlYWNoCj4gY29yZSBoYXMgTDEgaW5zdHJ1Y3Rpb24gYW5kIGRh
dGEgY2hhY2hlcywgdG9nZXRoZXIgd2l0aCBhIHNpbmdsZSBzaGFyZWQgTDIgdW5pZmllZCBjYWNo
ZSB3aXRoIEE1Mwo+Ck9rLAoKU2luY2UgYWxsIHRoZSBDb3J0ZXjihKItQTczIGFuZCBDb3J0ZXji
hKItQTUzIHNoYXJlIHNvbWUgaW1wcm92ZW1lbnRzIGluCnRoZSBhcmNoaXRlY3R1cmUgd2l0aCBz
b21lIGltcHJvdmVtZW50cyBpbiBjYWNoZSBmZWF0dXJlcwpoZW5jZSBJIHVwZGF0ZSB0aGUgY2hh
bmdlcyBhY2NvcmRpbmdseS4KQWxzbywgSSBjaGVja2VkIHRoaXMgaW4gdGhlIEFSTSBkb2N1bWVu
dGF0aW9uIGVhcmxpZXIgb24gdGhpcy4KCj4gQW5kIHRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiBvZiB0
aGUgTDEgb3IgTDIgY2FjaGUgc2l6ZXMuCgpXaGF0IEkgZmVlbCBpcyBpbiBnZW5lcmFsIGFsbCB0
aGUgQ29ydGV44oSiLUE3MyBhbmQgQ29ydGV44oSiLUE1MyBzdXBwb3J0cwpMMSBhbmQgTDIgY2Fj
aGUgc2l6ZSBzaW5jZSBpdCBpcyBwYXJ0IG9mIHRoZSBjb3JlIGZlYXR1cmVzLgpidXQgSSBvcHRl
ZCBmb3IgdGhlc2Ugc2l6ZSB2YWx1ZXMgZnJvbSBhIFdpa2lwZWRpYSBhcnRpY2xlLgoKT24gbXkg
T2Ryb2lkIE4yKywgSSBvYnNlcnZlIHRoZSBmb2xsb3dpbmcuCgpJIGhhdmUgYWxzbyBkb25lIHNv
bWUgdGVzdGluZyBvbiB0aGUgc3RyZXNzLW5nIHRvIHZlcmlmeSB0aGlzLgoKYWxhcm1AYXJjaGwt
b24yOn4kIGxzY3B1CkFyY2hpdGVjdHVyZTogICAgICAgICAgIGFhcmNoNjQKICBDUFUgb3AtbW9k
ZShzKTogICAgICAgMzItYml0LCA2NC1iaXQKICBCeXRlIE9yZGVyOiAgICAgICAgICAgTGl0dGxl
IEVuZGlhbgpDUFUocyk6ICAgICAgICAgICAgICAgICA2CiAgT24tbGluZSBDUFUocykgbGlzdDog
IDAtNQpWZW5kb3IgSUQ6ICAgICAgICAgICAgICBBUk0KICBNb2RlbCBuYW1lOiAgICAgICAgICAg
Q29ydGV4LUE1MwogICAgTW9kZWw6ICAgICAgICAgICAgICA0CiAgICBUaHJlYWQocykgcGVyIGNv
cmU6IDEKICAgIENvcmUocykgcGVyIHNvY2tldDogMgogICAgU29ja2V0KHMpOiAgICAgICAgICAx
CiAgICBTdGVwcGluZzogICAgICAgICAgIHIwcDQKICAgIENQVShzKSBzY2FsaW5nIE1IejogMTAw
JQogICAgQ1BVIG1heCBNSHo6ICAgICAgICAxODAwLjAwMDAKICAgIENQVSBtaW4gTUh6OiAgICAg
ICAgMTAwMC4wMDAwCiAgICBCb2dvTUlQUzogICAgICAgICAgIDQ4LjAwCiAgICBGbGFnczogICAg
ICAgICAgICAgIGZwIGFzaW1kIGV2dHN0cm0gYWVzIHBtdWxsIHNoYTEgc2hhMiBjcmMzMiBjcHVp
ZAogIE1vZGVsIG5hbWU6ICAgICAgICAgICBDb3J0ZXgtQTczCiAgICBNb2RlbDogICAgICAgICAg
ICAgIDIKICAgIFRocmVhZChzKSBwZXIgY29yZTogMQogICAgQ29yZShzKSBwZXIgc29ja2V0OiA0
CiAgICBTb2NrZXQocyk6ICAgICAgICAgIDEKICAgIFN0ZXBwaW5nOiAgICAgICAgICAgcjBwMgog
ICAgQ1BVKHMpIHNjYWxpbmcgTUh6OiA2MyUKICAgIENQVSBtYXggTUh6OiAgICAgICAgMjIwOC4w
MDAwCiAgICBDUFUgbWluIE1IejogICAgICAgIDEwMDAuMDAwMAogICAgQm9nb01JUFM6ICAgICAg
ICAgICA0OC4wMAogICAgRmxhZ3M6ICAgICAgICAgICAgICBmcCBhc2ltZCBldnRzdHJtIGFlcyBw
bXVsbCBzaGExIHNoYTIgY3JjMzIgY3B1aWQKQ2FjaGVzIChzdW0gb2YgYWxsKToKICBMMWQ6ICAg
ICAgICAgICAgICAgICAgMzIwIEtpQiAoNiBpbnN0YW5jZXMpCiAgTDFpOiAgICAgICAgICAgICAg
ICAgIDMyMCBLaUIgKDYgaW5zdGFuY2VzKQogIEwyOiAgICAgICAgICAgICAgICAgICAxLjUgTWlC
ICgyIGluc3RhbmNlcykKTlVNQToKICBOVU1BIG5vZGUocyk6ICAgICAgICAgMQogIE5VTUEgbm9k
ZTAgQ1BVKHMpOiAgICAwLTUKVnVsbmVyYWJpbGl0aWVzOgogIEdhdGhlciBkYXRhIHNhbXBsaW5n
OiBOb3QgYWZmZWN0ZWQKICBJdGxiIG11bHRpaGl0OiAgICAgICAgTm90IGFmZmVjdGVkCiAgTDF0
ZjogICAgICAgICAgICAgICAgIE5vdCBhZmZlY3RlZAogIE1kczogICAgICAgICAgICAgICAgICBO
b3QgYWZmZWN0ZWQKICBNZWx0ZG93bjogICAgICAgICAgICAgTm90IGFmZmVjdGVkCiAgTW1pbyBz
dGFsZSBkYXRhOiAgICAgIE5vdCBhZmZlY3RlZAogIFJldGJsZWVkOiAgICAgICAgICAgICBOb3Qg
YWZmZWN0ZWQKICBTcGVjIHJzdGFjayBvdmVyZmxvdzogTm90IGFmZmVjdGVkCiAgU3BlYyBzdG9y
ZSBieXBhc3M6ICAgIFZ1bG5lcmFibGUKICBTcGVjdHJlIHYxOiAgICAgICAgICAgTWl0aWdhdGlv
bjsgX191c2VyIHBvaW50ZXIgc2FuaXRpemF0aW9uCiAgU3BlY3RyZSB2MjogICAgICAgICAgIFZ1
bG5lcmFibGUKICBTcmJkczogICAgICAgICAgICAgICAgTm90IGFmZmVjdGVkCiAgVHN4IGFzeW5j
IGFib3J0OiAgICAgIE5vdCBhZmZlY3RlZAphbGFybUBhcmNobC1vbjI6fiQKCmFsYXJtQGFyY2hs
LW9uMjp+JCBsc3RvcG8tbm8tZ3JhcGhpY3MKTWFjaGluZSAoMzY1OU1CIHRvdGFsKQogIFBhY2th
Z2UgTCMwCiAgICBOVU1BTm9kZSBMIzAgKFAjMCAzNjU5TUIpCiAgICBMMiBMIzAgKDUxMktCKQog
ICAgICBMMWQgTCMwICgzMktCKSArIEwxaSBMIzAgKDMyS0IpICsgQ29yZSBMIzAgKyBQVSBMIzAg
KFAjMCkKICAgICAgTDFkIEwjMSAoMzJLQikgKyBMMWkgTCMxICgzMktCKSArIENvcmUgTCMxICsg
UFUgTCMxIChQIzEpCiAgICBMMiBMIzEgKDEwMjRLQikKICAgICAgTDFkIEwjMiAoNjRLQikgKyBM
MWkgTCMyICg2NEtCKSArIENvcmUgTCMyICsgUFUgTCMyIChQIzIpCiAgICAgIEwxZCBMIzMgKDY0
S0IpICsgTDFpIEwjMyAoNjRLQikgKyBDb3JlIEwjMyArIFBVIEwjMyAoUCMzKQogICAgICBMMWQg
TCM0ICg2NEtCKSArIEwxaSBMIzQgKDY0S0IpICsgQ29yZSBMIzQgKyBQVSBMIzQgKFAjNCkKICAg
ICAgTDFkIEwjNSAoNjRLQikgKyBMMWkgTCM1ICg2NEtCKSArIENvcmUgTCM1ICsgUFUgTCM1IChQ
IzUpCiAgQmxvY2sgIm1tY2JsazFib290MCIKICBCbG9jayAibW1jYmxrMWJvb3QxIgogIEJsb2Nr
ICJtbWNibGsxIgogIE5ldCAiZXRoMCIKCiA+Cj4gTmVpbAo+CgpUaGFua3MKLUFuYW5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
