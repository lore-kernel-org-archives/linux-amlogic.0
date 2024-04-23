Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1354C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38s+IgWFI7Km2BQuGuJF1Z++MtsxeFA5E6gyLPWejfQ=; b=cIAWK4sfj8qPf3
	IKcks6/851IqF30lvddK7jaBH02JTBZ/4naMLPDRsYpTEoEb4zbn70vxu1MumNk9Pg9dn5jf+TwKV
	ZUfOUfb+CfoCBAzs68w1O3xjhp88gXxy9o82gXsjBT8t/LgBloiRBhR7cGB4cKltQvYnAIDtt+XBu
	KKAW2yQ3u95ePbKLIVj4iZM1rJsVTzBObv3AKZ6fU+hSiCQ9dbcFN4WCJAqeAt2onvLCWkRDefgyE
	0yETtxwdCIIOdEWf1jgCChaMxDwCZq1xBljC52E3Ja58zgDEDMyOMdBjtut/zRQygDnBJO09OLtLj
	bR/0KW3QAWHeVWo3tTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKDl-000000011bk-1w68;
	Tue, 23 Apr 2024 17:46:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKDi-000000011Zl-1n66
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Apr 2024 17:46:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-346b96f1483so50895f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2024 10:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713894377; x=1714499177; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zGMw34tv1HuOcHijB9t3OKRrzUWV9Hg/9xS27N3bQHs=;
        b=2j54kf+HruFAN6TA4XleEPQdKJquqIiDxH0MxLkq3x4S+pBpy3eGf8zbysNYX5jr/Z
         1xhb0+JZIIqyMkCvceaAm5vaUXgI1iPz3/nlGzJZptLwun7nxwmItEQQS2TjV4XI8tRI
         H//XaMFayBN+MfSU/AFpEu6r0RQDYpz3di+0DiWkNBc0gmnExfPJD0szYTKhMMo+ZvZw
         bar/LhxAahAHRWfwixHjhFaBoKZDTQ4V5cfDGIhQD8dturh4JyvqeTwtchZdVnNM1Zfp
         xM6Xm6tX7P+vur3UVmUcIZBSe3D8NvZekWO/UWfFgBb9RRHeGvBVDxPQhARyX6xUPiXC
         cHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713894377; x=1714499177;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGMw34tv1HuOcHijB9t3OKRrzUWV9Hg/9xS27N3bQHs=;
        b=KxzGE9oZJBnGegUM/MJx7TacDyf3MEJCDj8enaW/KlBXjy66gVYyP5snyp/VB/rAB0
         majBnQBj9uayq1SrJ53QjQeTytfnsyKADXcd4VNsD3fGsL47SQvloR1aFdK0od73Xz2R
         uAbhHOs3z5HKl/iOIgS9zNdDE5U+7qi6HQdnWGYo2nNSBMAApSmV0XT7WdHxUyvkCX8E
         zaW1BZv9h4IixUwWwA3KC0oMrixOQbfgH5K0O2jncRzTAfCXbgmBbrG2G4l9MU8x/qRb
         Q5P33gF2TPQkFv2vQkTseOtljt1R+VdErT8kmSedzwgz+iR4c8H6vcclVcxASGY3W/uU
         ch5w==
X-Forwarded-Encrypted: i=1; AJvYcCV5c+bhX1PLhPRit176iFr7VVTskDzVx7wtluaBKUmzODXQIgARWuO0vnf44nv9ly4zJPbpTxT7T+rwGtGMG8cwNhso9Q+yibDf7baapnNE93U=
X-Gm-Message-State: AOJu0YyrNTOWUu5J6k2d8WH8FCugSE2n4DOwkbH6EuXybZP4FKY/luAC
	Uk19MVFF70hDZ8ZjQ4SgshDgu0ni02UmdV6nJ7m4Q4awt7ST4TeblIi3OsdAIMk=
X-Google-Smtp-Source: AGHT+IH80+mYiY8wLOolbQuNc5GEwyFsWGYaA4bWu8luwqVmUsFfilpQUnT2LT28gZIz55MBD8d4Vg==
X-Received: by 2002:a05:6000:18d1:b0:343:6c07:c816 with SMTP id w17-20020a05600018d100b003436c07c816mr110767wrq.16.1713894376770;
        Tue, 23 Apr 2024 10:46:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:aa38:830e:cbbf:591])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d5612000000b0034a62e51429sm11993475wrv.112.2024.04.23.10.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:46:16 -0700 (PDT)
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-2-gnstark@salutedevices.com>
 <20240423-wildcard-smoking-90b50f00da50@spud>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: George Stark <gnstark@salutedevices.com>,
 u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, thierry.reding@gmail.com,
 hkallweit1@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com, Dmitry Rokosov
 <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 pwm
Date: Tue, 23 Apr 2024 19:44:35 +0200
In-reply-to: <20240423-wildcard-smoking-90b50f00da50@spud>
Message-ID: <1jr0ewezvc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_104618_549227_D36E4D8C 
X-CRM114-Status: GOOD (  13.52  )
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


On Tue 23 Apr 2024 at 17:56, Conor Dooley <conor@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Tue, Apr 23, 2024 at 07:10:05PM +0300, George Stark wrote:
>> The chip has 3 dual channel PWM modules AB, CD, EF.
>> 
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>
> a would sort before s.
>
> With the re-order,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>
>> ---
>>  Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index 1d71d4f8f328..ef6daf1760ff 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -37,6 +37,7 @@ properties:
>>        - enum:
>>            - amlogic,meson8-pwm-v2
>>            - amlogic,meson-s4-pwm
>> +          - amlogic,meson-a1-pwm

AFAICT, the a1 interface is exactly as the s4 interface.
So a1 should list s4 as a fallback and the driver should match on the s4.

>>        - items:
>>            - enum:
>>                - amlogic,meson8b-pwm-v2
>> @@ -126,6 +127,7 @@ allOf:
>>            contains:
>>              enum:
>>                - amlogic,meson-s4-pwm
>> +              - amlogic,meson-a1-pwm
>>      then:
>>        properties:
>>          clocks:
>> -- 
>> 2.25.1
>> 
>
> [[End of PGP Signed Part]]


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
