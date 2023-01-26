Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E35C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pl7ZNUQNlHga0lACY57VK0PH+vhVtZyTfEHbxZWeMVk=; b=mHOT0rKTvNYSXm
	BmMXrdg61+whnxTZGLXTKTXAgE/svkdNcDbzxgqjQBa1Da2UJPcnLrieJwK2gUT9YEgNI7EHPn+S4
	qP0uNEcWzRmUPQXr8y2klZg1gU96bx1eDCEjoZ01qWujHqMMX8YIGU7KzH88Ic1DWiSEJJ93oxgFh
	GnE5gQPtdaG5pSJGGRzmrQ9RA/93W1g00d9vWJZZ93B9EWtL/Zr5d5remsDLIuUD/yXWPHrMOaZwO
	Fy0qwOYuTznZoS7lz4IEJkr7YCNK7AQo2l2y4+XUQw5UG7BcvWdCXei3/X0RY+U9LVsb7SzecxhXB
	aSFdK86rQJ0pqj7xkBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKz3K-00AM3t-Nd; Thu, 26 Jan 2023 10:00:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKz3H-00AM1f-KX
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 10:00:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so2899545wml.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 02:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRgVXPw5t6QVo2geW3WNhb1rgDC2iA39PRv/GAVQDio=;
        b=vTcMGyXsf39j1Pv1ktHj9xKL5iJq2HfVCB7ZDr/oA7PxzZWC46OtUb07mNAD5yZMBO
         p9nPr3PZWB5lLNVS8lpvd2ZQVWNh+1zlHNlyByHZmrUIawF9kgeiP+xG7IzbRNDfUT/U
         U5Amgws9CsWnwBI7AoThUbiVUETnMsJ8ohSjOHmT0yqvv06GEYytAk00/wIMElspB0UT
         t0MzSBWCHGNE9Hpgx1H6tJyNRGPTNOSHHf1ObB2SZUx9QcQYbFbVoK0LfbSJHwpzviUf
         d0SjDF8XGuaKcgz66eQrykR9AALBDeCquTKiYuvUoDMKJeGJliInGycAIpQzTMVaLt9R
         s/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRgVXPw5t6QVo2geW3WNhb1rgDC2iA39PRv/GAVQDio=;
        b=aHeU7ZWzlGjwxU+WI0W7RMiC/C4/Ffju1qv3plRcnXI6kKu1xvHgff+ijuY9xRtLO3
         r5Ex6oIiRnMw9bdodCv0GhGoRhs9d9iqg+GkrJ6eHkyRVU13ySUj44vuxoldFykhM8Hc
         imS+PCSIwNPFeSOlPct3aR2hqTNpAI2XjcAUn6BswYXXX8dO6CQqL16052VPZV2L4SW3
         1Xm6VWWO2W/xTHK/TFA4WX9j1HqyqsXX4w/o4TYWCGd6mtLfrHSpCx2rtwijaAp0Pdoh
         Vq9KOE3Pf8GpdWJdlS34QGU0AR8JiT9YE535b2sDhrik9BdmrdPrCOvftlstSWw+FUr4
         2pmg==
X-Gm-Message-State: AO0yUKUTrNZIsmteMOXf24kpxPAjAGRD6Cvnq3ZZWPj44qaBzaE5Vohc
	WQEL3FgQ6kiP/8V2Q8GMg8kmoA==
X-Google-Smtp-Source: AK7set/aZLK6a4J5BP5py17o2vPlMYEYYqGkUd/mG6BXhAEOu/N3E4T9mGZDkPE1RSRpaEXhZnwoVQ==
X-Received: by 2002:a05:600c:3512:b0:3dc:2c7c:6616 with SMTP id h18-20020a05600c351200b003dc2c7c6616mr210993wmq.21.1674727211804;
        Thu, 26 Jan 2023 02:00:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aa89:e801:e296:9b7c? ([2a01:e0a:982:cbb0:aa89:e801:e296:9b7c])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c479400b003da119d7251sm985242wmo.21.2023.01.26.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:00:09 -0800 (PST)
Message-ID: <6d304884-9e54-6eba-1e2e-882fa6c5b983@linaro.org>
Date: Thu, 26 Jan 2023 11:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] arm64: dts: make dts use gpio-fan matrix instead
 of array
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Heidelberg <david@ixit.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, ~okias/devicetree@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211029114948.41841-1-david@ixit.cz>
 <20211029114948.41841-2-david@ixit.cz>
 <CAFBinCBVXNYG62jKABhJJt0m61+vQKqEyC4Mk5Ljg7htN-brTA@mail.gmail.com>
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCBVXNYG62jKABhJJt0m61+vQKqEyC4Mk5Ljg7htN-brTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_020015_681497_7071C002 
X-CRM114-Status: GOOD (  10.84  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi David,

On 31/10/2021 20:39, Martin Blumenstingl wrote:
> On Sun, Oct 31, 2021 at 5:51 PM David Heidelberg <david@ixit.cz> wrote:
>>
>> No functional changes.
>>
>> Adjust to comply with dt-schema requirements
>> and make possible to validate values.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 +++++----
> for meson-gxm-khadas-vim2.dts:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Would be great if you could re-spin this change but only for the meson-gxm-khadas-vim2.dts file.

Thanks
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
