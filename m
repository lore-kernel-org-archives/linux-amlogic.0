Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3392FCA5FA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 20:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUzmoMIS/MA9PMUD5drV9D47GV4xteZZSzci+BiPv7A=; b=xjQGt32ldcjkkm
	qXlwiKlADKLUARQjxCqjM9S0t7PncaN0ZfhOpQXkmzfoDWBP3xM165aABdZ3HO5OctwUinN0JYKTA
	G7r05nJYxZsPjk4lMpw6LPDr9ufJ0arQGbELJqftn26lU9S+AcvzMQy2Q+uh1tKk7f4Y9sMCAePgA
	D0cLXdJPwdiC1AECX0GxcWhKZbC1OrIx2T2BZmS5+/2vXXcyk6ksq42hSWLcdN3AzlyP77ii+slo3
	NI2dAGn3HFrHivnGibR2VcMLiEre3fccDNw/Ae/WI+8OvCqNlKHvOdaOTeTB31I02WTetVcUy110M
	RZbWyeSLQwROiaDquxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBICO-00000001bBm-2q0H;
	Mon, 28 Sep 2026 20:43:44 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBICK-00000001b9E-3XMp
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Sep 2026 20:43:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so21529465e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790628218; x=1791233018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=QoIweLxUOY0UOv2DPQTZqqSXHP1cuiPo7jt0BeekplPt6/vYhcD0VDj7Dsak8yNqWE
         2tncNuyvfke8CWZowKGbapahnMUxvrtQlngR4DhGSxUA3qp1bT03p00ftDbOAgClquhv
         eVgUsOFhtq0iE5jG13JPQXkCVlDGZ2bNto+Ctp8WK5w6FlOCVq+pzL4togZn/v+X2bqA
         7yhCidr8VFtP5ha+lwPXGlB9gEbQzxNgej8Of+Xy+G1Wo4cJulojJJjYnyDJP3fo9Kl4
         Fd+8LnQ3s1ubzx2VusUDSi9pmhKB+rXyRl+bTHMJS9aGlpv+pta4r8uwckOStAgiQFOz
         6INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628218; x=1791233018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=gZVzXELf4/9lwnCzbLt/BXkv7rE5l6rZKB3+CbJkiGsrv2lfEvclym86YKNGyh2sZ4
         olPAB6wBaa1eciCd3pJjkl8I2Tf7RRBPTaR6U9vdFzFfOUl4qvOcAY5PsPFn3/ifHt6Q
         FjJr9bmg4NTKMfvB/AlEgYzE361r61zqIbkx2bkiiHIvsE+kAhDUwAyfE/9DOdr3ZbkY
         nv5XEvdxBqcBRn7Fs36gD9oN1SYmi7mVhiCuqYEG9RBAr3wfBxHIPLFGZ0OuXYvZ4Kbt
         vHeL5bk5fpzvQmWtlRUBUbIXKDTFSvufz9hcOgVHik5jf8DV0ET/R5MLE76Kbf4MMBGv
         VfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTCOdApjmJN7R60QBUeCZUmYN78Zg2ytjvlS29/ryyK5h2xX2bFOBkdTCoQyqQAlBWdaRChNh/42ivcsmk@lists.infradead.org
X-Gm-Message-State: AFuF++lebB2j1E3P6MC3CVsYccN6Jootoyy7SgsT1FSgWd5a7CV+b5il
	5K6g2niQ8Z1FFZ2EMzoMXfoiASKk1YzBxdz3MEqkjereVPPcsdKRgVWwChf0Kc6SYOU=
X-Gm-Gg: AYBFou0GZy2knnKi+ptl8KkMytCTT4GK0vAd51U4ezVIIbvDqlNoOpo01dq21Xus9wL
	FItiPkFyA+2x1AIZzQbdf647mjn4WtMML7B5TPK0SB0RWxgkfN6amurxbxiZc+HMhxLzlgquBE0
	M7uWJieRJHsl8+6B9qw/t4Bm/jvx9mpORO7V+E2H5JaZmZGIVIhRzg5XxLk9uN1xmYotkhlWWKG
	GYad2V0BZCXD+Ynya2VHyeXsFTvt1xFFwPrRoQYXKes4krUJNGuQMhtL/6t/oWGkAugcgOdjdKc
	fiB41bMSqaAZy7UfmxPfFDYagC7N1GTPZC04rGHRGayQF42yLqvNOLC2NUmjyxpTd0dK0qs14DT
	nZXAGiR+kXbG8+HZSHmxrN0xvIcqlGlZNIVddH9TwHzjSmebN50HZ5kE9+vsyfKQwPYByVJV3wp
	gL0M2oDzphhznOv7uUSn1zW7P5XhdEO/GYEHRZn0XYKOVNVCDeovgOg5/2NVX8HKk51oduWQ==
X-Received: by 2002:a05:600c:4e0d:b0:49f:ff7c:c96a with SMTP id 5b1f17b1804b1-49fff7ccb16mr127831615e9.4.1790628218211;
        Mon, 28 Sep 2026 13:43:38 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm23971435e9.0.2026.09.28.13.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:43:37 -0700 (PDT)
Message-ID: <8cead6cf-6981-4d11-b9f1-a752ae6b82c2@baylibre.com>
Date: Mon, 28 Sep 2026 22:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-1-a760312c076c@baylibre.com>
 <20260928-native-hornet-of-luxury-81edcc@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260928-native-hornet-of-luxury-81edcc@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_134340_903780_083423F6 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 9/28/26 11:54 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 06:00:46PM +0200, Valerio Setti wrote:
>> AUDIN provides I2S audio input support to the Meson GX platforms
>> (GXBB/GXL).
>>
>> Note: GXBB and GXL are not known to differ so the driver binds on the
>> 'amlogic,gx-audin' fallback.
> 
> What the driver does is usually less relevant. Here, completely
> irrelevant. Explain the compatibility between hardware.
> 
> OTOH, you cannot have family compatibles (clearly documented and
> explained on every beginners talk), so what is the GX?
> 
> And I already asked for this:
> https://lore.kernel.org/all/20260913-inventive-millipede-of-certainty-dd58ce@quoll/

GX is not an SoC. It's just the common part ('meson-gx.dtsi') between 
GXBB and GXL, which are the real SoCs.

I think the confusion on my end arose from following the AIU design, 
which I now suspect not being up to date with newest design guides.
I will rework the series using 'amlogic,gxbb-audin' as the fallback 
compatible and only extend it with 'amlogic,gxl-audin' for GXL.
Please apologize for the mistake.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
