Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA98C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY47LTyrxpCtLX7L/T/qIhKiRmq3OEyc52uZqgdptcM=; b=Qdv/oMSxABlNT3
	jqG56dVUN3pXDplKOGj+Ot+njTGdcS0T+uUMKdlbrtDGdTgDG32UTF6ZlNv+/NNUrlhXn3BFxHxtq
	O2ZpCGYGJ8Bib0xv+punhQOyIOCJAvUwvOi6+dhZL2NCFWe34Fnc6cx/yu4P5jO66raRf4x4cBTKQ
	iSdG5Y7kScod2gG1o83nKvDPqtwXykpWnHY2c8xK45Jtc75lEhPfqFREJXDccgz3jMntpkHnOHpCa
	to3CEc5ZqFlZiDQed/U/1gF7dE67oJweMp25M2cAVT0uwAaCRw/EMYbEc2SrfUMLJnFB3E5tKnsZZ
	uF6P/MvsrZCkgxJ7TMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofXA-0000000G7BP-15V0;
	Mon, 25 Mar 2024 08:18:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofX5-0000000G78U-1VlU
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 08:18:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41488d6752eso4210655e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711354690; x=1711959490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn1W2ruOodemTLcB+pbYYO0c3qegjIEhkk51wov75ag=;
        b=q6gFi9NvICYIMChE660BBpnhxc4C2oee0aFiZ1s+7vmBJFYTnAvJIvbDWJtC6p6Ik7
         8DuvdGxoRaKJ1VTc9+DFMKdbcaGwS40vjZdcsvcae68/d/y5AwiAfklZVJ4ZVvgXjfA+
         +SzYhy1wvtGB0YIJC0FsDKbcY5rNsHfwEd49+mdgsZM/Cp6n9OIBUwdLKxzjdMF+SWvI
         lF63lv/HTn+sMINqcRE58vxU+alr00Tq6nnNWok1wzxwxoAa7ocAGhtmLWD1YLl6iTdO
         DN6gY6zMrmi3VeZyPxYD6hUYjLC2Vu3SmcerL5G881nfyMNpkP5h2zNjFcAXj/FboWQY
         sXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711354690; x=1711959490;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn1W2ruOodemTLcB+pbYYO0c3qegjIEhkk51wov75ag=;
        b=lAvJIYIK4BN+Y7EVVjFSufS0SotbPuqZI3OjCjHG+y3/h+wUx/v7VjTZqbOIhOVTn4
         mb9ohFNk/nhnsWeLz782avdShD15vjSop8ycbwKuxk6oaUcJaextcwHJ8jFjMIK7T+OG
         UEuLR4P90eKD2f1CIj/ozi/nq0bpRTlSthEeRCXiudrNI3tD39XIDlD3NkIJL6lhK4sb
         u5OMkAcyDWfeXry2hWN2P8TU3Jf1La41jQHUqI+ALtzHfRyMzWOzc7H/lHzxqyzTgm/G
         lOQCT7iqY8dR9A0T33T+EfA1aGqdoGND5P+Yke2Vsc6JZ0OK49Y/Fe0Fmesg4LX6pgXM
         wyrg==
X-Forwarded-Encrypted: i=1; AJvYcCWphDylZ8R6m5lmoJE7YpAW3kogAmCbDM624jz41b3RcJAXzKvayxrToUwvDgeesMuy5SNhq7eNMfFjC4dfg9IZTMy4UfHQI3V048TadGaeKgM=
X-Gm-Message-State: AOJu0YxlqsoofSDo1Doj8r445R/ApAusiMuXLeCfPE/5aZLDGKVQS4DK
	cpZkv3slydOK5A2SQz6B5QsJuZvfDUeDhqELPNIqYMEotH34Wjbwc4Lr67fwS7o=
X-Google-Smtp-Source: AGHT+IEnIbCEhnwyDMPL1uDQFsxaR2kmLl6kkQkDTep/4JxGSJgMaqv97d6aGdotW2UExKekvSKGXw==
X-Received: by 2002:a05:600c:474b:b0:414:8948:5f88 with SMTP id w11-20020a05600c474b00b0041489485f88mr1655577wmo.0.1711354690057;
        Mon, 25 Mar 2024 01:18:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b004146750314csm7686212wms.3.2024.03.25.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 01:18:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io, 
 linux-amlogic@lists.infradead.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240324151905.3817732-1-christianshewitt@gmail.com>
References: <20240324151905.3817732-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: fix Ethernet and random MAC's on
 WeTek Hub/Play2
Message-Id: <171135468944.4116391.11813937820801790173.b4-ty@linaro.org>
Date: Mon, 25 Mar 2024 09:18:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_011816_067942_55D1BCA8 
X-CRM114-Status: GOOD (  10.72  )
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

Hi,

On Sun, 24 Mar 2024 15:19:03 +0000, Christian Hewitt wrote:
> In submitting the original patches for WeTek Hub/Play2 I appear to have
> squashed an experimental change to place the u-boot.dtsi file on the common
> board dtsi, but this was incorrect and results in broken Ethernet. Patch 1
> creates per-board u-boot.dtsi files to fix that. However, while the NIC is
> now probed correctly the current p200.c board file doesn't find the MAC in
> efuse and we get random MAC addresses. Patch 2 adds a fallback method for
> generating a MAC from the CPU serial.
> 
> [...]

Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-amlogic (u-boot-amlogic)

[1/2] ARM: dts: fix Ethernet on WeTek Hub/Play2
      https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/cac77418d6be11445c3e1139f6763b5f5f5fe9fb
[2/2] board: amlogic: add meson_generate_serial_ethaddr fallback to p200
      https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/65d5c367b00cb392bda560c3da1834979adcf137

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
