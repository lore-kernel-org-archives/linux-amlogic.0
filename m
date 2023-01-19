Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02114C38159
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vsXxTq/AWIkKsB/IQbfrUS9L9B7SiaN0jpL3NToxzw=; b=5BXXQ7NKbYW/z+
	XEguKhrGWJtM4Q0SCm4PxcRQw4q0TqoXAlqiD+Zpiy5QmkNCbfZt0mdsehTdNXMdBOpxqOR6+oQp8
	7kedIkcPkMCA/mPIqLruVelrYkD4PojD1vUiSBBe2neppvFIGnDL8+OBYfKcfherayIlC9UC6W2Ua
	PxZP7TDp7KZflx3UYSaQfmgxktSKuTh11kaWUaacpI9ZkUjxha8tjBlFHbn4/wUTW3czY49mzl1OP
	moK0Jhm0Z8N0+qmva7wH50VQPWKQcvG/oB8abjL3UICuTFovWKCsRBD1175ZnjvwKDDm8TfkGF9S5
	s5bwVPv7ovVPO97N/9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIIxP-0033fH-4k; Thu, 19 Jan 2023 00:39:07 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIIxD-0033cu-P9
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 00:38:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id z4-20020a17090a170400b00226d331390cso253867pjd.5
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 16:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pSJsyEuQeHOPQujX6GF/hc1kQvX/3d1HVOxLVeB5NM=;
        b=EbNzGLNE7LspsNHRUeA2YlT3UgmXKZeffa6bV9okWj3cd03C1F78DHJ3byO3HluS5X
         U9P4mYAxMdi4HCWA7dW9oMxsu0lQbEcm7uoRyyvK3Lyu8ls8LASbl45C1niy3/s47R8t
         3SKd3HlZX+zreMAT2e1GNSOwHzktglcV9BJDP9J0jb5Uhc4KMHZiT3YMhtTR+KLOB/KM
         aJHvJOfAeM6hH5hzQajWrXy3ErcWhWEaDLsKRALSOXGS1N3FvIQBYU/5GG6mrOWzCKY4
         i8xM7btP73LNWTw7kJ/RYbM6ZgG0EH/BzVRML1iMHjAMzauZCDfmwY26f4YBTKepGHdf
         6F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pSJsyEuQeHOPQujX6GF/hc1kQvX/3d1HVOxLVeB5NM=;
        b=agoyUkUUcoOobN8u4hqM90kaJND6dzruN5WcK6Y93XkbKK+0IksRWsdVhlDVIf+q7T
         xCR3dypOzY9pnPiuUlMS/mzJT9SqyUkXSnRBQWzHr8+2z4m/SiH8vcoHyTyEsTzjyI0G
         7KsV9Z8W0LffOZ55aYLQ6cKG1EK8tKGpGqEC1vIcOEtx+E8tpyjggou9Cw474IQ6Mf91
         gmQA0IWX3D0lz4WIOcREcjHoLjLuXZaWjj10XEJpp/A05E/O1MvqxUmKvv9oQxoUf8+W
         HjwxVNdLwyBV8zEcbciTy0p7HXfEHU56QyH2unf2Dk7m0LxEUe2nxgs81LKn382uHkLO
         l6eg==
X-Gm-Message-State: AFqh2kqegrIJwPWV2xGi1tqMUZge3KPVLwGxu/OE3x4MG0qkvCpUofoI
	oPwkHG7NeY3VIcOxD8E0aEPIEA==
X-Google-Smtp-Source: AMrXdXvQq9B8SMDm5SwwnnsawEcii6nO/KyhwuuoqAEsw3lR96thBWo5cUzxR1ocSmk1tWa47XsA5Q==
X-Received: by 2002:a17:903:41d2:b0:189:361f:89ac with SMTP id u18-20020a17090341d200b00189361f89acmr13118308ple.64.1674088733420;
        Wed, 18 Jan 2023 16:38:53 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709027e4100b00193020e8a90sm23531224pln.294.2023.01.18.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 16:38:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL
 & peripheral clock controller
In-Reply-To: <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
Date: Wed, 18 Jan 2023 16:38:52 -0800
Message-ID: <7hwn5jqrxf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_163856_064523_05876D18 
X-CRM114-Status: UNSURE (   8.51  )
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

Yu Tu <yu.tu@amlogic.com> writes:

> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:

[...]

>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> new file mode 100644
>>> index 000000000000..bbec5094d5c3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> @@ -0,0 +1,131 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> 
>> Unusual license... are you sure to license the bindings under GPLv4 or
>> GPLv5? Fine by me.
>> 
>
> Yes.

The rest of the bindings for Amlogic SoCs are GPL-2.0 (without the '+').
Adding the dual-license for MIT seems fine, but adding the '+' is
curious.

It would be helpful if you could please explain why you'd like these
bindings to be licensed differently than the rest of the SoC family.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
