Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD70CC79FA0
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTBEQw2Spaiq2SUC3ite0zfNM3xck8BRuLrjjz8ZfdA=; b=wbBgz01FPIpQRS
	bOiJspMhJBF3OxDGz+lxOoJ1ZnNhZCLgJpP4yUssKqYwOfhrYEyHDbVJNQRrOTWMXmpi2G8AeYqfX
	0Ocm4XGykkpijqrZu1HRaC9dZQ+3MIlpItSsP1WgpjjFDMdicUGEzWE9ULMQcoexfEzB1nb/EGlIL
	6yo63vzUj1nny5lmgapwYEYKu+Szein/QwRrDlOoSaUolRLx89YYNIhNhHOkqGTjB25CZGX1/xETO
	8Os42BJVVeM6/ixSi2f22vf19tMrDd+L1iS8MOBxJZhqFaiox840v9r5vKYZpMrpekJMFpH0Qfvj9
	uyFCcVDonjpudcLAqK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bFM-000000079PK-08aJ;
	Mon, 07 Sep 2026 15:27:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bFJ-000000079OX-41Yf
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Sep 2026 15:26:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so29064495e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2026 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794816; x=1789399616; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=IH9NiTuCbCDq6cgo8eDEHxkJRdd1qdO+E3vDIw7nW9MpRlXOnZpln6a1k7D+H9OEZ/
         BhkT9mLB6ME+6WAz6daJ+pGhKvo6ByLf+5Fbxhx+lAmJf5lfpu7ujNZBBAve7feEuybF
         T6nl9PVQgFlhxzET9CuJ+D1Sf7S+v9lZESDGOS2lH0ik9V8jaR4qtDnER95JkYaftKBd
         FdCRiXXgyW9f8AI6Ymi8IDkLumCvw0TMgNDSfj41fTgci18YF7nLtwXkKUlQ7rHxAQyj
         nZ5wYWrS4prRZsHXE8pvnna+YH/i+reC44wGkq9Oq+7hDYWvDvCyQ6IYkiRjlxhkfTt0
         a0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794816; x=1789399616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=UQx9R3B5j79xSYl9JU2bZOR65md6vo1eV6oXX5d1Ozd7YEPaCpFU5/kGJJzA5NvpuY
         VFpWx1fZan7jU/JzMD3nwZjn04gJlQ0xBuDCEI+kd5bee4OC8ffyeryLJ/r+D3CBkcAE
         UJsrWxfRNg2lz6icJu7Kn+Du2fhN9LaL/HjPGjvwf8VxX7qcepcM9EDb+SmNS3jjLCaI
         +54kJf4EtiQh54Qx160sMy/Q8ogomno9ZbYV6beM9V3/ZZrx09eM57J5BsZ/UON7IkXg
         C3jCQ12hZ5tyDd045UZfY77KiaNRlOZfgx9mrH40v8ZZr5d7yzuHj9soBqtsxZWgkohu
         KAfA==
X-Forwarded-Encrypted: i=1; AKwUvByTD4l1zNC+fnd0UR6NKDgY/IZGFG3elIVVb09MuzKzEPXdIGKonwsvFHB7HgOMjDjTqTMQzdcFnw+u8y85@lists.infradead.org
X-Gm-Message-State: AFuF++kK8/WCon7KpbgBLywPrfYs1puP/2LjO5Mn6WXFpz94G2RufhYV
	eq2WoAG+SI6SK0wLr/YpQcW0yICSVpvC0wVCsK2cLNPRt8MkucyArw04GjOF/J8imp8=
X-Gm-Gg: AYBFou2I0x54FoC8HZsZo42X+7MAUyu26vbwnqIbmI4VheeaLU10FZvfqInr55mhvFz
	lL8El71jRVgayI5pQvOWL65lVsIAsmclrx/VfExLm0nMLkr3zltOg35UvqTbLpWFslrMvIZ6zE0
	lZ+ikW6IYapKD2wEOMSRJTEQVC5nys+NXJqVwl8NdV0a5aRzXFAGBv5qxf/fBDSRi0XrStwgRRg
	2Uc8ZPCldK5Eh/FTPeEgnJVj4kTdP1A3md2pAHobhN49e3VuFiF5mPHi904A0dzIdQIzLggFuf9
	2/xt555VGfWv5E3H1IkhYBfvE0CaEbrj41zpxkbhczRzZBWBzkwNe33BsADNvNnVuiPHOrCgmuS
	t3/9TkoJSQ24nqOyHTruMgVOhC96QFCmZ80ViGuXQaSl/BJNg2XaZtA7jTP/bt/AXJq8uPtPQEd
	AxAHfxjzK1lWMjTThbxQndUJyCxviZk+SuU750Tl4kKEKsPGXIDexjV+eXjvokDgTC1VI1biT47
	39ULfG2+s2cqkR/pTV3u/8=
X-Received: by 2002:a05:600c:35c3:b0:49c:fc6c:be10 with SMTP id 5b1f17b1804b1-49cfc6cc055mr202666425e9.22.1788794815803;
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm418419925e9.6.2026.09.07.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/4] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:26:52 +0200
Message-Id: <178879481206.2256446.5480566312277687897.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntfBlpqBiszNMgSn7O9l3ii5fmAZzp08XPZnG
 +I6/0zcor+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7XwQAKCRArRkmdfjHU
 RSSGEACrwfFz6yD1l3vhy6F9taMF3kWSM1xVK9C38V8OvRfuo795o5cb/IMYwvp0C6+MKwhPvG1
 EcrITVzONq66Ie2ZqiLhCqu5O9TrtHq7ajhU1sXK2ScEoT9XTURLcMi3qNi7TYKZvpUI68W8gsT
 bDkbraol8AGgOaCX//qsj8b+KdhbkQJnw0xyAsDPFhL0WaJXcaecJQRd4qwAFgqHdZQFf8tP4a3
 3NirS/fUbuxQizhb7mvswX2eL7jAWNzgh0MHiZoMjuF6pEKmV/DxhkKnAIQn76bZnLDd8s8pSzL
 pCJYhXO8AV97EG1G5oPvR2Bbi0fotGzWRNbEKBoBwxh/zLDVERZ/IkVCBklhGKKMod/CWtXjcDK
 9aOLNbSCrFlYbwY4uMNUddBNkAXoxb7po4O+ObGXszxbKC9ELtigt/7m52hJmqt94O6w/l48DFz
 s6OEU/1rKjzR16dL4S75Bj8QScxgAZizzNsIfihQG+P6q/CTr0THQ+oR9ZOyc7CthJO6wJUDaf6
 I6SeJkINTRwYCA9uUXoRrzRva08+URnqMttKryLsiQAxehiCYuuJNPUfWdQvP9q4KWVb/lAuITZ
 zvENNu+aiL96ohbGYXbzmMeRWnwvrjI8VWtte+G7a1qKOfvdcRIwk9JWlPvf7nepYQLdmpIKmE+
 XP9d4aPYx4YCpNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_082658_018720_EAB8119A 
X-CRM114-Status: UNSURE (   7.41  )
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

> Add support for Amlogic S7 PWM. Amlogic S7 different from the previous
> SoCs, a controller includes one pwm, at the same time,the controller has
> only one input clock source.
> 
> Also use the kernel coding style for the empty of_device_id terminator.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
