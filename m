Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024EFC54798
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2024 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZiro2q23vlXfDInmONk8CkMRhVQXC2K4zI0JZO+ZQI=; b=zsgWLkIvUmvDFW
	aeKFc4DQ3QYKguF70IWGllDUNcZ1eeFnANjBGMyOixJvUlTbFcRy5Dcuxai7UHj+CqT96yPyD8kSF
	sEaTSxHlFosGlar1G7uVRbA3sPPGTs1TL3cJkmAxm3fhckDS3NxM7wiR+EdHF22tHbhrxj5slaF0A
	SEze4rgFVloD+NTT3l74hA42NP6B7X+1+iQFU9i0z6P3N4bdlY/wFdU2rk3bFh8EFXpzvm55Dl49K
	3bWUJQGLYvb/ofPr+JFPHWbQc4DEHVmU3RgOcl6L+cpCWrI/Orr2Y/1xWSiBjH91PDcJxyRJBHfgM
	wu6NsS7gHp+40pz1VwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riKnf-00000006MX7-3DqF;
	Thu, 07 Mar 2024 20:57:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riKnc-00000006MW3-0ooB;
	Thu, 07 Mar 2024 20:57:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dd6198c4e2so5494845ad.2;
        Thu, 07 Mar 2024 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1709845026; x=1710449826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HvgM94yOMQ3al/rhaQFl0ZOyGyu4vO9RcRBauMLLTQ=;
        b=XVnsNzv6eKPeQ/Tquy+5sNoR+cvYos7myKRFBcl6aWrexpSqyV0ye9aB4yseQAAe/6
         P9kWeJSgufRYOZbYEH/dZ+Ruqdx/YXn8I3JupH0wnoBz8o6pdO+pb4u5Ee7X7cVZGbh6
         AC4FmapVZZh6X2iGepUrpsQQ1AYWF/V1oWvgxathncBuMK6oArM2u0WZnixzLekjx193
         lJIjJdORSdD/RtXJOo3SDr8dndnC6yci01/EYVH7hq6ZVdcZ8IwRoKpCh5Bch9HnaYg7
         i46Opu9E2RJwa0OQyCfk30KkdnDsGPiBista6QWwORbDRSVNTyK+jPNLkz9Il4WUUGc3
         8BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709845026; x=1710449826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HvgM94yOMQ3al/rhaQFl0ZOyGyu4vO9RcRBauMLLTQ=;
        b=aXcZGBp5BcGuLDALmh0UBkksai2oukWgcY41xyH0dZS1vOFipdy0Wg9UJ2+wtOFQ54
         i+RzTTNwnKps4N+fT+oOwtvn0SCprhpK2hW6ZKzVy5D8ty1HP4xRsTji9R6O6N2Pce1o
         Ew810U9zZQ1IVc8BSzZRoisff5gNO9nvd8++AAugmZS1DY3Dt3JMWPzk3rIKTmWC40tG
         mH3LDqrr0N7/gSIY8f9UsEiVzK9q6OCsvShSLOT9CK7ag8flZLCGhvwQvpevQAVFI3BR
         +n2y/lCqRTpRqjCszEkmWA+s0vFpHjNeiFiWMrwXskxQ8aOlbzY3p8pwpJDO5zfCwc2y
         yMmw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIUj9Q02CRFlWegdp0NoWBDkDa6EH+vTQVOvCCsGdnBeiXm9nU+E59zGW0E7YBRVWMU/NCR7BaUMjNWzVJvlRnpygCOeZZmE/DB5iRvDCztKSSWfuG4MwRDR5cnJgme38YeMtnLsYuWJ/4ezQgbJCUt6atfv0xg==
X-Gm-Message-State: AOJu0Yx5cxb8FninTg1E6q+8VBi371qcSdJNGRFWtMOI34KXNxWb+KD/
	8W+f9K8nC/DG4+pzIxfiUckyRAvu1N3nqvyeFRBjV9d65NNr26G8Gksp8YYITZpg3DxQPLD+K8X
	CoS3oJagx2ciA2Uk0e6eWYay1mOw=
X-Google-Smtp-Source: AGHT+IGt7Dqb5XEk2y4DbDdfMCVp5j+FZ950sYjKYa9RjJ9fuWNWUsuIQr2zJX9YLvdoU9GIH/i5pXMEg4OQLRCvLOY=
X-Received: by 2002:a17:902:da92:b0:1dc:cf38:3a92 with SMTP id
 j18-20020a170902da9200b001dccf383a92mr10372068plx.8.1709845026269; Thu, 07
 Mar 2024 12:57:06 -0800 (PST)
MIME-Version: 1.0
References: <1709621888-3173-1-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1709621888-3173-1-git-send-email-quic_mojha@quicinc.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 7 Mar 2024 21:56:55 +0100
Message-ID: <CAFBinCC2n+Muu2qaAG0PWFj6f+bVFDtHnzm78jSpeodTD47TOg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: meson-mx-efuse: Remove nvmem_device from efuse struct
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_125708_258983_7A818D19 
X-CRM114-Status: GOOD (  11.13  )
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

SGVsbG8gTXVrZXNoLAoKT24gVHVlLCBNYXIgNSwgMjAyNCBhdCA3OjU44oCvQU0gTXVrZXNoIE9q
aGEgPHF1aWNfbW9qaGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4gbnZtZW1fZGV2aWNlIGlzIHVz
ZWQgYXQgb25lIHBsYWNlIHdoaWxlIHJlZ2lzdGVyaW5nIG52bWVtCj4gZGV2aWNlIGFuZCBpdCBp
cyBub3QgcmVxdWlyZWQgdG8gYmUgcHJlc2VudCBpbiBlZnVzZSBzdHJ1Y3QKPiBmb3IganVzdCB0
aGlzIHB1cnBvc2UuCj4KPiBEcm9wIG52bWVtX2RldmljZSBhbmQgbWFuYWdlIHdpdGggbnZtZW0g
ZGV2aWNlIHN0YWNrIHZhcmlhYmxlLgpJJ20gZ2VuZXJhbGx5IGZpbmUgd2l0aCB0aGlzIGFwcHJv
YWNoCgpbLi4uXQo+IEBAIC0yMjMsOSArMjIyLDkgQEAgc3RhdGljIGludCBtZXNvbl9teF9lZnVz
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihlZnVzZS0+Y29yZV9jbGspOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBl
ZnVzZS0+bnZtZW0gPSBkZXZtX252bWVtX3JlZ2lzdGVyKCZwZGV2LT5kZXYsICZlZnVzZS0+Y29u
ZmlnKTsKPiArICAgICAgIG52bWVtID0gZGV2bV9udm1lbV9yZWdpc3RlcigmcGRldi0+ZGV2LCAm
ZWZ1c2UtPmNvbmZpZyk7CkJ1dCB0aGlzIGRvZXNuJ3QgY29tcGlsZSBmb3IgbWU6CiAgQ0MgICAg
ICBkcml2ZXJzL252bWVtL21lc29uLW14LWVmdXNlLm8KLi4vZHJpdmVycy9udm1lbS9tZXNvbi1t
eC1lZnVzZS5jOiBJbiBmdW5jdGlvbiAnbWVzb25fbXhfZWZ1c2VfcHJvYmUnOgouLi9kcml2ZXJz
L252bWVtL21lc29uLW14LWVmdXNlLmM6MjUyOjk6IGVycm9yOiAnbnZtZW0nIHVuZGVjbGFyZWQK
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogMjUyIHwgICAgICAgICBudm1lbSA9IGRldm1f
bnZtZW1fcmVnaXN0ZXIoJnBkZXYtPmRldiwgJmVmdXNlLT5jb25maWcpOwoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
