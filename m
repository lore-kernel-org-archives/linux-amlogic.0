Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D87C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ4dpokhjeSlIMXM2G2OKDojMGaOtVtq33PwcMyrv5g=; b=jXFwoGXCKnQPsa
	kUzWE2oWgYJrsCyTaRtF9BBTIWXuXXQhbr9JJ3kHsGogzcMSPrBKTgK3ehyy08UhO9V9ZayXXHUq7
	WFsMBfHPDcL+45aY/EKWBPANTnaTUiTFJm+k1dyxGT0j+fv3Lb3bnPhIdv7zm4L+BCCpVjhjzR7Go
	FcIoGyej8Ui8zPT7xb4Fsz3Q7i3ZNEXj/JJYQoZS1iD7usgSIg8aCT1v3MFVZfqxtbUabipyicEdj
	R1pSlOw0McW1tacPaWr3UpcY4qU9VMRPQg5hIago6sQAJgePE+Ce8eZ4634l0DuIH7tM1vzIplBZC
	F0dnIUXn0mcQv+ASpPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f8Y-005xuj-83; Thu, 01 Dec 2022 08:41:42 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f8R-005xkt-Ia; Thu, 01 Dec 2022 08:41:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z24so1081093ljn.4;
        Thu, 01 Dec 2022 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rfgJ9QknK0MbQgAWzuzypV2KA7EE9D4Q3QePGfyw50=;
        b=pLqeTL9I8Ynl8+m01CI3TXOD5Clc683rk/kTgYPB10lPttqq5wrYZX5fy6uMB5bcIL
         Q9Cb+uuHbCU29BY7VnV5c9c69dyrKJiOnX4lfdoiwJzkpBzuhjQ/nxNKBjj0pVGuLdQ7
         6seh9XDNhhFvBwvrnGxskhFy6Y+sC0oSkhj4BgVTNukF3vRb0uDCjqcvJNHfkR58Nkky
         kxxc8DZAtnzYvLyEHkISrnL58ujEEXgprNI/o3vEHSLOl1hfgc3FdMLTIeeLbjk0gR4C
         pIRFGfV2eTjEDvpiUBihngsh3eLZddfnQzMcMFidHqGQFE7ZMGKPR7JyGXSUaZGt65jX
         b/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rfgJ9QknK0MbQgAWzuzypV2KA7EE9D4Q3QePGfyw50=;
        b=OVP10JAyPD6X2YkWlZ0IH6un1IJ/hGwwGAcW+s/5GPQF7aDAceQc9vyC7TF2UUx+Qn
         rtZ592GRCPudzKiFAwZ1JPLaDiH2CrZmvEnvBeGsTkKPaLXYtELN5ULrw+kUcDBRiALW
         jsxlQOrM+nwhtcEylAmllq+j+KGiOHY1AvIg60gERMgeFPtFJDw7WfkUXI4LU+EJvVK/
         zsAu0RJ17FVBE4rIJ+z6sfU/f0FoCeAutoy4liVYhxw/wKKBM2CICyg4x3GEE+oq8Aw/
         RK0WP+9qX/b2S3BiJiuxS9WmQRApifVqAX6jULUzJliyH4tuzdWTM9kPflmEKTy5XRfM
         ibww==
X-Gm-Message-State: ANoB5pkJ0Dk9mS+MZLhDJFVb4kDA7u/8eUO8k9iOhyYyN2TQdnZA4mYH
	IAiPa6PLRDpG+alRcV3woZQ=
X-Google-Smtp-Source: AA0mqf7ITWlTk3AHP9k4F31qto94qdeue5OQdSgwjEJSBqfseuIyGBBoGz2T5XLny7Dg0nkeIcHEmQ==
X-Received: by 2002:a2e:7e0a:0:b0:277:6f0:5239 with SMTP id z10-20020a2e7e0a000000b0027706f05239mr15945498ljc.186.1669884092070;
        Thu, 01 Dec 2022 00:41:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f3:4a00::b? (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
        by smtp.gmail.com with ESMTPSA id t27-20020ac2549b000000b0049a4862966fsm568047lfk.146.2022.12.01.00.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:41:31 -0800 (PST)
Message-ID: <2e4f97e9-a8e7-8afc-612d-a9d2c2e47ce6@gmail.com>
Date: Thu, 1 Dec 2022 10:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RESEND2 v4 2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
To: neil.armstrong@linaro.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1669799805.git.mazziesaccount@gmail.com>
 <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
 <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
Content-Language: en-US
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004135_673061_23BAD69E 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/1/22 10:38, Neil Armstrong wrote:
> On 30/11/2022 10:23, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> now unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Missing Acked-by, I'll add it while applying.

Oh, well spotted. I should've been more careful.. Sorry and thanks for 
sorting it out!

--Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
