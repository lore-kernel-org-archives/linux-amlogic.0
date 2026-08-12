Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185E2C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRAkQnrmLvUVwBZrYafN0ucdqc0P+Xo8e79zazbi54I=; b=ebdfN4EY+tpvgs
	s5o0O8Wcm1/Nweu0F+tJ6B9In07yjIefjDRiaDK4ZymRhirpJkDcmRsfHLdNuDSQqx7JXxP+iHM7A
	i4JXZt9R7Dc6gces+DK6d2N0eLrEwP02Dth9rvE/Mu2HVPf8Igj3D0Ou2BJxSfQx/QLWlBt5c6mt7
	vqy9ZYPEBR73eBughN6WOiD2+W3vDiBS735TkOveDswMp/WsJ0x2gSqiY3MWPn9YXp+T+7i57OAlT
	rZFQWwPqWFMsQWQ/gtG/ITiis55tAfwWUxy8IZg1x/Otf9wMTcypyP1QF+9ikUmJ7i0l3YJuiA46C
	5L2eD+4Px2Wb+3jbkYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHCv-0000000H50T-1jXz;
	Wed, 12 Aug 2026 22:13:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHCs-0000000H4zk-3PBW
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 22:13:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954dff6536so10819445e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786572832; x=1787177632; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=ZQI5vvH6Pn31axJ8Aly75BMORTZ1BWKwgvPcnv8ko3ULSbw/jl13/TxL6HcL7ii8zR
         brdsqqREmH3WpdtkMEeD9IqrGVZn45N08mYB6BGaLVS3Yxd3hx/1P+KkCVTwtfe71UAj
         pI5guVswcF/jw1K80lHnHjWTAoxPP7Mint02lbm8T5HUXg9R3D2a47Ki6+1BSC7c6f0r
         UdIqA9KydT1NMN9DhMQY0zowW41DXyyDhFlnWm5Fmh4WQImIm+MsF71cVmTzAvRE5YVE
         y272vqhX6idjXrwSXdFYNsS/tKMgBWKCQ16vNh4Cxt1Icfquf1tyt+PIVHHjm1riXBR3
         3O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572832; x=1787177632;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=SBVPcQryDtqtx/jXCFdXmyhedgRDStklZUoXuX9zkqDqeiDb7vEC2nThhthbHUPp40
         bC25279iEkhIP8vNoCy1ycu20B4+9J8VCrShu9+KjyNgY++cTnLTPe3vGXistN6U7FlP
         aiKjofAs+AOViQIYYkVL3npmYs1PfO2gZUy3CS8juudg0jr4PCfTltjSXtpdkTomxJ3t
         pdDuQoYNfvmQmIRQICxAMcBXuDMPMD0fk/98H2ugPLVfThjAVkud+CLELWf4/9ydvpb4
         7+G2f9E8Co41Ctnkmke4zj6dpmHfNt55NRmgC8HqQDghiiJOOaK4wKZ8kbN6km8LbcoR
         39TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlPBpUUBK7Y7tlNSfGurb3CgiZm8hjBE0LyskpvvCZ4teYteuY32W0OMY8QAkOst2NU69rTOBrva1xFr0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd6WlirQGvnt/ui32bBXKA9EW4tXPNvrkaDg8b/w1+fj8nv/fX
	4E047VO7zN9ZH/48FYV+M54p/x1wLhDb7yUo22Sd7B6iJg1N/7iv4OZgMq0rVreiNiI=
X-Gm-Gg: AR+sD10oaIvKsVDBD5SHrsdKVS0KKQNvVKOKK8OzlRvl0rJkwcCzWFTOngdqwLPMMWA
	Imc+dAP86xZwU17jlyBkAsX0HVkxwSlTILGltHQQhe/Xa+ICEve4isvRGeMYTPc6JCzQfElZtbQ
	125EyHFszSW21Jm75xWYmiDzJycMko/3R/eMvutUCwe+GavNLjDmagnTU+XRHGk4qBAMupnEUDg
	VsvJbRx7Lo7SVJK1PZjILOyo+FzKcWkljNliARKZ54O5hi+lET50ynNLvQtm9k1ujzd6ffgb3TJ
	zHXk4i/0YudAdIvoz8l8mFj651MjLJq8HldAgFDeZb5gNkGyBDmTct6bhRQ49X5j61br41Uw7kh
	keWAFgORxeJhcaj94dSBcQ/+TDO2Dm+MxNkjGBFUILeUDLOHHpuRKKK6VA4Q/oOT4YpQucQ1Uo3
	8tPd9qd+/a2DTXz1PPm4FgsqAjRc4/7b3opwTyJe+UAxqn+W46c8Z4RvryzgM=
X-Received: by 2002:a7b:cc99:0:b0:499:8157:c03b with SMTP id 5b1f17b1804b1-499821c3215mr5493765e9.15.1786572832486;
        Wed, 12 Aug 2026 15:13:52 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.120.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e3f154sm9263805e9.4.2026.08.12.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:13:51 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
References: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
Date: Thu, 13 Aug 2026 00:13:38 +0200
Message-Id: <178657281887.546910.6599899262272389101.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O15VxwWMBRkqh9kj9wxsTvc8k0yZaEomYA9y4t+CbTM=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk1H6R2Tw1wDm9iMRbpjtPXOv7ae33YbnldzmMHQuPa1
 +39xFLbUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIlYcTEy7Pbg0Wz+mCPw+djj
 DwUB9nd1BSLvqty2MTzV7Sa+aZfrZoa/Itu/MGzJnX9y5sFJYoaXFx6z3jT/8jVzLzEVq08sG1n
 +cAAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_151354_848663_D74D82BA 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, 12 Aug 2026 22:50:34 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
> aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
> to be exported. It should be static.
> 

Thanks for the fix!

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
