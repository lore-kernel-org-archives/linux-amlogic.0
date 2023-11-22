Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C698CC61DB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2LzfC+VAf2fGZfN1nIqU+YBlSVNMr8/8c+e+8K0xEgU=; b=OSJniCFUTKpCb9
	K7YU8+CgrEIa8a4anIhlzUkZUZRl+AvbPNO0IAZ8D0yDNeQwEeP9E5HvBtkXr30PrLf8kcdCAk0YG
	ZC4Rg6OvpcKu1hxS3/oDUKoEoQBAHizPDOSQT5aJvDea2KXhwqxRiK1OBAwaqElFpdl17hL/yVE+Q
	6pzA/+aUtUvJfookFruHi2iNXeTHMbpw8v++JYpRYrvN9n6R8Flm7obxzpFd5wRx9KMEFwlOCOLKo
	/iGXgW1/CPOgiti7D/AdSs9GqLZlKa1qZlc3LGSHxLoVuEqcv8c+O55V8O00urZRFrWRZbG4FRSOc
	x/CevGuB3gHP4Yqazp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rtQ-002oPH-0l;
	Wed, 22 Nov 2023 18:24:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rtN-002oO3-1T
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 18:24:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc9b626a96so319815ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 10:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677443; x=1701282243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBF0j8i38KgSYGb9Dk0jlJf/UW7xPEFJmn18k8VfOZA=;
        b=fDd3UjuCRJ8sU1x8LpEpyD8k2PHHukW7IejoTN9h52lqxG3hao3SJDnYePvv3oWESK
         VA5kC+RspsSX4bZiB9GmrwkS5WK4oqLrII6+do1c1aL2k9kVyhzmIcwWbDi3MBTqMAY4
         D0xCieACrg2xUjsxxkIwLONcWG7nUW/tFINy7SyRIiBcWxNerXyRIIwplQFhEMDAqp3b
         +ThP4Hp2rpdFxoYmiycEVbYWRriCgzbOfuiwS0CNAC6og5VxVrQo6TgOQruM7zHTyUZ2
         /bddXA7KdmaII6HXMLj0m+cvrL9ubV0zQX5+eylTBF2ebrIBGW8BoR6ApxH4EBxrqQIs
         OwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677443; x=1701282243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBF0j8i38KgSYGb9Dk0jlJf/UW7xPEFJmn18k8VfOZA=;
        b=t3TsdL8q3AHq3cTNAw+8X7naA7NeUUHy4k3pN0utZr4OLyzE7FE99mxOCFA96PQGBJ
         HNdUGaKcv0/I0yX6JK7MLCdwBygQIX7pbUHa9AJdHHXTD14+PdjkyGdo9nkR/RNoxGom
         uDiY6kdcjteyP5Ui4vVJtLYEPn06aVUUY2PIBNOeDtqgd9YvmEbJpJMY+5nJXxnbF601
         02FOEFXKeVyAftJOJHhSmyzQOtq1y8RcADenrTpY+dQEt7zhL2q50MxoOe/b2YwlyVY1
         AfpJTPOvacif3tIf/8CySr5T5kKFQb9XxGgX5oMS26O9aGIAL6rseIgA/ZAgywWn41Lk
         UL/A==
X-Gm-Message-State: AOJu0YzkONuHptInUbfxlrg2HSZExhg2EbpjSDfmheZXo4JNBqFk6Hs/
	c79imKyirxp1Pl7w7Yy7Rpc=
X-Google-Smtp-Source: AGHT+IE7htMwFOlQw4OKW3Wk8l/KP1gOIypH/G+X1LT3wTPGVHFPg1v7yAtODsGoOF/EZzEaybqlPw==
X-Received: by 2002:a17:903:110d:b0:1cc:e76e:f214 with SMTP id n13-20020a170903110d00b001cce76ef214mr2991553plh.29.1700677443274;
        Wed, 22 Nov 2023 10:24:03 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001cf6783fd41sm4897980plb.17.2023.11.22.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:02 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 0/2] Use onboard usb hub reset on Odroid N2
Date: Wed, 22 Nov 2023 23:53:45 +0530
Message-ID: <20231122182351.63214-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102405_501014_711F1292 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new binding for Genesys GL3523
Fix the dt_binding_check error
Fix commit message and peer-hub description

Previous:
v1: https://lore.kernel.org/r/20231010032446.3194-1-linux.amoon@gmail.com
v2: https://lore.kernel.org/all/169700589265.2911018.855796610271678067.robh@kernel.org/
v3: https://lore.kernel.org/all/20231119023454.1591-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (2):
  dt-bindings: usb: Add the binding example for the Genesys Logic GL3523
    hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid n2

 .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++----
 2 files changed, 87 insertions(+), 16 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
