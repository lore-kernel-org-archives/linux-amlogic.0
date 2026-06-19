Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B533CCD4F26
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jun 2026 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGqYLGhDItzXmudb8P33sf/LAHWclwmx5e6GV//7aqM=; b=WQfoOOEQAB7DsI
	81ONTCezrWs8igBAyMYnGbgtoRaoMvOBbHcP0620kd6+aMwMH+xi/5kGbCyF/fpa7wY07Hjvb13Z7
	1OnIVtEFP3NbvshFYhtqdalgzkBgKylAOIpLCX2P25eFz/ZRQDARMJEv5NyK3HSMIuqQ0aG+IiDMv
	PuOOhnN3X3cy0HVsypCZysCFs1AdGrbfXyg0Z+tOdYNgKepzTjfTLx5KYgSCJ532QIpZkyTZUxIEo
	7jksm+6VndUyB48WEThzeXNwwB01ZnlzQ2KDaT1ZSeY5t54A3dXFfwLlNDvzfeX9UOnTKd4hluPgE
	gSJ/FDT8t8bNiMeDPozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTyC-000000027sH-3ClV;
	Fri, 19 Jun 2026 07:48:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTyA-000000027rS-2ZBL
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jun 2026 07:48:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1055309f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jun 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855333; x=1782460133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=AlMs7twMMvlI7GxjP2q8UtGaqTycz26hSJB6Wg6LcUBM6lcF8BVWAHqBLlNTzslTvf
         3jtZXH95oZXjltxNwXPAGTg5X+w1ygQ6DR6/Jxlp1JABniSnEtPj5WmBwPC/pT7aZb4v
         CcEEMxvBT3Qqif+dy/qCBgXpPjCC4nNzUz3dLJU8WUGyzdzIrJy1/P2MwbyQaqXu0CR6
         bRj+cKf5nYA0nh24K4wnl0sc57ay3oPPIT+A6LxPCjlxecjgmOGB3D0dn4/IhtP6mWrn
         bu35Z8AlIJNFSM10oj0J76AOMpoEHLRxnIb4WrK0uU/SK0ibvpjWg2pMsl8sSFCbxc/4
         VT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855333; x=1782460133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=O35MJGWR2Qn1S0GYMKxrgvjrP3DURMfxo/yEkFolOkuQeuD/NWveTHiKK1S4nwcqxS
         35GxvKwVVRJVS59W5ybU3pfonT6qigKU0Suj4C7vcQeeCmSJKkxmpQvqhwgiB7dbCf+k
         ReH8xg3jY50SOnjoa1a5oFJFN4NmrWRcItULMQzsCPJhx6IbWQcTnlhDuERoGFzuplP2
         rI4+IAPArzUUD7SPOwW1TDsQzIK/NurvQuxJuUhtlvuvdDSU7DN1IcBsnu78TdmsC+wS
         V2d6s2ZDikdO1NTE9tq1ZX6LvWobFBteZ8eVB6jwVFqewVZI7bFYny1h+8JtOuca5XYl
         hbuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V5a/nxhfjRA61FVlgnm7xD98TsGzgFGTTL8SPUoQkyGlLCdbSq/V/STldTp2R9758x0vcg6qveP5t/5CG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7hlIIeMzKvE7zbut7TL04bBALYLqObPKnYEcwn1VJ0QEazpe
	haVWpCA1tRguWSBo+ryVnLLvTxLdMjK041tNEO5aOkkqgo+i9dmk0x7J
X-Gm-Gg: AfdE7cnVEX8rnKB0W/Xcbi8REmSxrLK6u2v+WLKxcVCcr1CA9TnuW3kZUCgMwOcwrCG
	IQRpiiGC0XnL7osiQBBMTxuEeWKkzuA7qDg7uVBpqusXKQYFeQckMxVzXdH3H5U6fT1Agv/NJNj
	0WWqqXC7s+QuBUfXg9Aoc1ZflRibPesNwJlG3DwXAdequhhO8E77MFy/gfaifgdF30oHF+9f5r1
	oSBzWoQAxE5BbjnNKIbnMCey8tLj8Cay7vYMWG25XaaXYzA9DZrJAdi3IQLab4ncGlBezKC0XaR
	3ZNrKwBdd90S1X/YkidyFpsvknFpxCNviaI+42PMNPk6B5uCeCLKmbDIkBr8ILRvz5tqE8Oj8Xb
	qTmXaxLNamOD4fN7qdmgh1yFRZVmJljk9qrASVgC7Q5JRQovAYVtygkzqiUowdDJ6SUzpWxoCCI
	iG5eqGBcyFV9W04MEOCyXtm5PU+Cz7i4Y4WtnKNKRXHY9Vz9CnfYzgH5EhHKsTCmzccVNuAlKrW
	tLjV6q9+AKFZbrtz06UpY8=
X-Received: by 2002:a5d:6684:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-46502bb15a1mr3018694f8f.20.1781855332519;
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:f83d:6b5c:de84:5311? ([2001:8a0:e962:d100:f83d:6b5c:de84:5311])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm5719051f8f.25.2026.06.19.00.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Message-ID: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
Date: Fri, 19 Jun 2026 08:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
 <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
 <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_004854_658083_2EDCDE89 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Jerome,

On 6/19/26 08:29, Jerome Brunet wrote:
> No, regmap clock are directly used so this is necessary.
> Relying on other module dependencies is not enough

What do you mean it's "not enough"?

Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
COMMON_CLK_MESON_REGMAP.

Unless you mean for documentation purposes?

- Julian Braha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
