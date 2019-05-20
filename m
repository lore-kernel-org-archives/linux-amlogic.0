Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA7DC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28959216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgv9UZ1L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fOG5Im97"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28959216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iuKXkARxaQSuJKIm8LUeFwgo9LkYnyCi4qgoYu5qubo=; b=bgv9UZ1LY2kFmZ
	O6Q8hWYnvwznp9IrZY/RVNaqx/ElCGZVtkhOa4Ufrzg7+biz5OeEJRQ1r9e2+lEcsejbj7WMtXY3m
	oPFkv9r5xljm0++RPEUMvudvQBchQ0qdBfAyPf34NVRCQiQGSuPMzEjHHBF0jjNgmlagj/3eZjMT9
	XWXC7djbCjmgCDz0gqIsYC/yzctdfn2uEPqO5jL+ZV3hvLwr1/6WWrlrbTpZFilZU1vsfCT6dZYOL
	+LpnsnnZmKBuLpUvqTOKaDRO39Knm86PMzjrgm8fLyG7qQTVdNjT1V1qwxkNx/fzSMlBKJhsYkd3I
	8ZGBmD5WxSRshQbMgavw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoaZ-0004YS-Ut; Mon, 20 May 2019 20:08:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoaW-0004XS-OX; Mon, 20 May 2019 20:08:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id f204so623150wme.0;
 Mon, 20 May 2019 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gE13JPen70lcMMYSkQ0HyqWDIMF6fiHhH8f8FN2aii4=;
 b=fOG5Im971iCuPbnYpmVYbVF3G+VRwOao6B3Fo3ILm3lnQamKYXq7wZxB9dakHZdkMZ
 87SqakQueLuzs6r6+yu4F6K6LxRn8UpWMUKAIDS89GJbTpRi8L/uO1tkm4d0nE/PrpFc
 qwcKRtU8el51LdFqKBP2TGNE2/RJx4WRTYYZJOYeAfr3NFj41wcYxbhPbRCUEFlZna5k
 qSIZ+hTIp1xe1Jo5rySeQyDdnKsSidXhC6cgEeF2nVSqPh5HLH035uxYNnnXWkrYbKyI
 YrxMR8/7wQdh9119FeCOGgVsXnrJNWcBu+XvQvTnigGkZk4KH1WHtKVyR0Ynfl8CTNGU
 BGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gE13JPen70lcMMYSkQ0HyqWDIMF6fiHhH8f8FN2aii4=;
 b=qY5t8rN2r6K5eDVEo7UboHCQJSEvNARRydBfO+DURSJD1BpWq0ULFBwV309pPV3zMh
 aJKmET/1d9hi5dekBk6GaXlCAAuXtGgC9IDI0D0Bl+X2VsvRnoEsB4ElTHT9O3jFlX7X
 WtuVINyaKZeJPGOkO5jDsSAUjbtaytMQ6NK79vqLMnQsROm4tiZOS7Fb6F+G2ZnIDP8V
 JhAdeOb/sTOuGUK7AP/FL0GpC2KWHpbg4tZhdfFi/LU6L4GlQajkogQwjv5iDqsLytRQ
 f82OhAAa5ClXTvJWwVGJS7pYdJ5PNYqbzAmdjMvSQlbRWJ5XVXRt7IFN1YkH+wMN4tpb
 fH3Q==
X-Gm-Message-State: APjAAAWldSscdnZMhrkRfClelbKlQT74c8uPVfaaTYf2gY8p7c6Pkrcj
 xLURSNUloKWniQfV72v6vfs=
X-Google-Smtp-Source: APXvYqytU8M2tjA/trPL2Vcu2FJ/xCYKepRIwq6re0I7MsPFKJSM8JsrESii0HlWggbEz5V9+fZ76w==
X-Received: by 2002:a1c:2889:: with SMTP id o131mr588924wmo.101.1558382926819; 
 Mon, 20 May 2019 13:08:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id i185sm918627wmg.32.2019.05.20.13.08.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:08:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbes-150@yandex.ru, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
Subject: [PATCH 0/2] ARM: dts: add the GPU voltage supply on MXIII-Plus
Date: Mon, 20 May 2019 22:08:37 +0200
Message-Id: <20190520200839.22715-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130848_819865_1558DB8C 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The mainline lima driver doesn't support DVFS yet. However, once it does
we want to be sure that the voltage supply is hooked up.
The goal of this series is to do just that.


Martin Blumenstingl (2):
  ARM: dts: meson8m2: mxiii-plus: rename the DCDC2 regulator
  ARM: dts: meson8m2: mxiii-plus: add the supply for the Mali GPU

 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
