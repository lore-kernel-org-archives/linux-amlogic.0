Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9CC5DF7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/fMR09zkpFUmhgwLArJImvkORtSAxm86dXsqxOdgN4=; b=HFJLUM7IDqIloj
	IuE38+JVd9tJHhmR1a/7fbzGO6k+/lLcwzy8zXQNmcJRRrAMsT/Jg5dcu31HhiE7JSsQaCcB8BNTO
	JztP6yI3Ylmy2OF5YC1igm93Jv84EzYT/BNihVPY76Q8qW/bigsB8VRjud1PJbvisAYefmqKBqN9r
	iZLNiQpp9Bk0mss4hh+GMu5e3YVbzdLcJxJMJFySq5cWg+yuKu2VdHQtCJN0AFJrOklC7x4EAekCO
	QO2OsihE5UC4Zujne51Pr4uGmAilVXDJvDVZS+m2coyNSHoKq8FiiT9PoImdpzhelVtqwSLCUS+r4
	xT+c0uBZSxx8Dkc8Kcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJMR-00000007zbD-0UyL;
	Tue, 18 Aug 2026 12:56:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJMO-00000007zZK-0pPs
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 12:56:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so51281385e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787057766; x=1787662566; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XKi7bHvcr4VfrcOT9VHCYlKY9RJwWhe/hZvFzt6Sx4c=;
        b=YB7tO8GaTgPfPcS8/0hX/CXvxW3ROPdn/UVuyev2RXxKZPt/3Wfybi7Saatr6VUvVi
         UGmd9DPmlrLncAt4vv8v5kUbN0Q3rGH2X1Dc/0BCp4/X4tkrv0Eg0ct8vsY5OCtYHW+V
         DZ3OhpWzkj0doVQjQpFG1xmjlXSwP8QAZCoZpf1AV6I53u0i56Fv23n98d1c6GMDrh2Z
         mZG1AgVhpLLEApAyHNAc+xZvyrEZDXEdVnIQ1pTZZxagHurz4MNzfU/xaTiekLbbliVk
         EfhwJiY4C/PbvqcMbsv5tVnLO6+i8Iu14YJHKDYrcY16Vx00DDLu2IDlJxyM0Qz/1Y0G
         Yjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057766; x=1787662566;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKi7bHvcr4VfrcOT9VHCYlKY9RJwWhe/hZvFzt6Sx4c=;
        b=Bj6Z3RKWgAOzEUQ7dMK+o2TePXNGgnlTBl0KcqCPbeNxbIrg8qfG99gCZPv8uwyAY+
         0UlV9gy2zLBVxBj3DfKRIWKkLMQHNh8612y9jTF1VXWonLb2LHvzfrA9S8iYrpZmR5e+
         Sa7wkSSD+BN5R700R5kbMOPFtNVeQxE8AS70TG/DxbdjS08LP5Vawl0vcPisbXFDL8ro
         Q4okUfONvxbrQ37KID1+CqP+mqE/1a3vdMGiWfYx/ssFNgBQS/8cE2d3XRwvrQUY+n62
         v5AwzlVaojzAvPOY3jaM7o8yZROsH8SVXto46DhMtdgpgZ09Zqb1AyNTZuKHXFDsQ0mi
         HZgA==
X-Forwarded-Encrypted: i=1; AHgh+RrkxsRHhvLQZTSAGf1lgTFQ3yFWWif19zaCzHWNBhgefFJ8n7RPNeIl1bKWmX8GgmhPH6LsrfsdLkbtI+o7@lists.infradead.org
X-Gm-Message-State: AOJu0YwIEcStDKaSWcvQ7ZYqSgHIKPF15JXI8XiWdGRC+CrEt3bBrIGD
	OnMPlqDItYBoGIx9YaergqU6usM75moR/GK/0Jy4yZNKNyyCjlku0oFRA5eMysGY42c=
X-Gm-Gg: AR+sD11OXJ0OKIrgFTpP6+GLpivffuNgdHntAXlIL6OFoKjLeAFE9/hU6YS12FQiTsI
	voVRGytfG4OhYh3qDvSjQZW9em534Q2NUimnRMdiv/uCk5++S+YEY9sejcg+OWAT1fRCK+DwW72
	ObPhw9Dwx6iaz6ECQTiEha2TRNXlE/YC3CUaRKoXG8fWuWAK8UOP8ChhUCC1BwRDVaz0hmkWpuv
	fFEOcLY3tGcG/XiOQuguUSW4GD8q9g4YS9CMxf/51GS/nWQG/SLAi2vdzbHurZeO0w2f97t8z1Z
	QIFm7pNvKOJxNR5rg02cdtzXjMMaeIUCDj5MC8qr+5yUNKQsgwuYyKqCdBl0KTrcIyb6UJ+yKs4
	yXCEIztB2GEYaSoXfuPWHfxz//hz4TUXWsKIyuRH5khoGo28iK4PDLXz5GPsd/HidPzu3zC/qze
	YSXUiJrvgE6eODIix5OCCR+7AXUnV6TexLEr9Gegh0S82JWOexK+SDReNloayez5v8FQxW3MCxI
	kbM17sIMMAQ8CtkAaay0VM=
X-Received: by 2002:a05:600c:848d:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-4998933fd6emr506661115e9.2.1787057766181;
        Tue, 18 Aug 2026 05:56:06 -0700 (PDT)
Received: from [192.168.5.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb85csm174771215e9.11.2026.08.18.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:56:05 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 S6 S7 S7D
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
 linux-amlogic@lists.infradead.org, Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260521-s6-s7-pwm-v3-1-57b073fbafef@amlogic.com>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
 <20260521-s6-s7-pwm-v3-1-57b073fbafef@amlogic.com>
Date: Tue, 18 Aug 2026 14:56:07 +0200
Message-Id: <178705776742.1733024.3702017266095180404.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=350; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=O+uSJ6l/nC8L/Knw7obnre4I+TF6Q0+iDF3z0NVIK84=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqhFZsDxMqI5GgmdAmlfldDO655rJFQTxUUPF+L
 d8MIqjEDa+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaoRWbAAKCRArRkmdfjHU
 Rev8D/4xOPZLHUSXNhR9N4UAExW6eRzrUxnLfXcz5FmEunI1yUwDmFrVmLEkd41Pw64v3pthjd0
 iJQ8cYZbSy0yN69vhnEpXL0QHSSG9mXNqanBUNUCaCO+UWYu3TaC2305lJdH4WAFuVQAJvHRGfb
 9P9tFBefF663jGQ044idMqlUX/XYhiggcyPZeckQxpNJ6jTukcTWspEtbDi17EJjKoIQrHlpd2Q
 YsXOXCTNPdOSBNqvm0bwkg7NyNNqg4/6iPUUUZBb6BIA40aoABZyG0AP+IzDTShbYzkTyj+Av3g
 BH6u158isBZyMPTWw2dOh+8J+PSKb6Ems/rCGbd7AdTfn75NevMvDNXLE2KDVY/MDMiiZi/2bOD
 N+5URngivCT7AswNqQNEPLldxpn8tz+ZOSOuzCTcaTNIuqiaERtLBPPE8epIaP7CFoyDfOc3j0f
 7dERS4NNk2d9aMkiAiPtXdv4JMNSeGbDqdLC9JwfzJ02UbfbUmU0EGWKRQ7/l4JeveRzg4INCw8
 PXhs0QU5TJS99upeIQcH/wCMgaudjAz69F6hz3Pa5bfIVhwNkYZb9JXjWdDXgY6bPhzYg68j6Gc
 WZd2Z6EZd1hI9dlU4gd+7yWvzKlN2d5cNqeu2Q2+BimNmIA8p8zBvUDPxKVRvcnEKRokm9HNQlv
 PiLF74xfWXaTQ0g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055608_249244_FD45D57A 
X-CRM114-Status: UNSURE (   6.32  )
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

On Thu, 21 May 2026 08:26:58 +0000, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> Amlogic S7/S7D/S6 different from the previous SoCs, a controller
> includes one pwm, at the same time, the controller has only one
> input clock source.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
