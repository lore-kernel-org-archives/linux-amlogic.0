Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F76CD5BB0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 May 2026 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tfs7URB+FooOtBBSnblcGvwGhDDmiDAAvhDnHHxhmFE=; b=Ov8wGxS1Q1bWVp
	cje2JrncZ+XgEyYWukKlWUB+LF1d8AumrVkHpLEfVgQgRh3KzzbJoJZumEtg8O+JZ2ZnPymC2Ydz1
	+RFa+LPx1HKQw7cXa6Tgc/i0gz7n50YAP79QtVKIBKX5sN4t+S7dcecjfO17RzpNA/6zsqoRumlXo
	ZL9wSBzNpjIlnG/3w2DBPDPUmSidktxoti0OadMUiqr+X6o8w8fIGEJTG0P6ZYSD5AXIAbhX8eYnq
	MLWATgQ6bc1XB2VZayS2OM6XyKg5KcQZ0jd7aQDxQ1TkAdObpriB+sAHvM7LScT9RgBNM0eu26kXv
	zMxWHva7wCUMz1WwGbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSff-0000000BQ5P-25K7;
	Fri, 22 May 2026 16:24:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSfb-0000000BQ3M-1k1f
	for linux-amlogic@lists.infradead.org;
	Fri, 22 May 2026 16:24:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so5795009f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 22 May 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779467057; x=1780071857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=VMsbi8up8tU692iB8Apd7GK5tGzAGbtwSvrIHqnXQ1kxwKHuNr8AdF/ZNNd+VMVjHx
         5Dc968QdRgQIJZ1f0/R4yHd05ZmSReErp9Y3jMSzofibNwggfIafW0MUf2VBpXZB/YO+
         EcXHb89V6fNQYuxvu39XlJYOsW/yTBCjJu5K4bdmkg+VvBxozutx7nXPF/UhSerzMLyK
         JydVcERxpfWl5wwK4P/LpHcZpdZUBLFWCfEzUJUCoolEg5/pTtC1uPcnYCGGXeEbfZeB
         /LKriOyUPk9+2+8wkzYHd0PkbDLzYVVjvi99H2TIsbrL1570js0abGjzEexKX8byNlY1
         sIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779467057; x=1780071857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=qZIkd9E2YKJv5C1cKT41M6acDzDmZcihWKp157rYDMwm5JDNWoO8sOgvwENOj/zJxF
         CS2ueqUNXUZd/okVVo0uRIyWl2HEgVHVc7X31F6rikmOqR83WSYHQz9B3dCIyCWGxinI
         O764K3JPncjKv319Gbrq/wAxbdY+462wtv+9DlTpSCgxhmPMiTsIhaF3GIoB6bR9Pv1O
         8WP7D/Z0b8l1zlV2gUjX2DLytUI95Xjz6d+M6x5dgmDlPqZFlzdVSlP3aLkbiYWirO/E
         K/8USag+a+UUeFhkXfJtJDQwFzzeYDyLIB3FSDVAMfhYHouZoJ5qqW6tCWK2L5HWmKrF
         7BDA==
X-Forwarded-Encrypted: i=1; AFNElJ9LY2ZjiQmBnVbcHmoDyEY0VUZB8062fWcHf6KkNBfcMuD6jL6X4P75tl0VBFYSV1ybx5Q6wBrKYNTPPWt2@lists.infradead.org
X-Gm-Message-State: AOJu0YyAkN0yaq0BbOFKPnhRcb5u3EGy8Ysk8b5JO/Xpt8/Xw+NHGSx/
	/ozmrBpNwaKLY72Xfmqlhxo7//AxA0hDkpovBVUQHM+9kwUkw/KqlfoB92IPinqhouM=
X-Gm-Gg: Acq92OH5r8eQwY3NVG4RFy1VfmCzm/9J4Zm6RGUefZGxCr4EvlFI1UIzGLbAgl1BGr7
	Nk/onTgNIz2AcofgXH4aW45WQnaQOJ8YYEqTDXhkty57TN9KnvlzhSIIJXAm7hy9gkUoCOgxJsq
	qPewqxLWxzS6c7HlYb8rEUT8e8Dm81zftY9NuGtEJhxK7/ayNgmm8wldJicZKt4IdbUfloN2229
	R1EV9ir3gNGvTnZBAaSckXF4CoRuCx9arv3kItAawqjoPfYyhHOfd8nA5+mnZTImWxMKLJ7thXh
	hUOy7f3rFfGKYjAptEKlK67zYLDKPHdPQoFZl4WYYTmtoHYU2IsEuHeHbmdc28j8WwiRW60mdnh
	+V+5W+Hq6AuV88elHlezbviMbps4466DHZXEkcnTdEOWGIPoCPtOnvGpY6Q8/f/aO9CRLGL5DTQ
	KhkrBWZ8KPqVz+ttkpXSJ8PceOog==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr13404994f8f.27.1779467057126;
        Fri, 22 May 2026 09:24:17 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9dd03sm5868666f8f.7.2026.05.22.09.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:24:16 -0700 (PDT)
Message-ID: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Date: Fri, 22 May 2026 18:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_092419_912014_222FB835 
X-CRM114-Status: GOOD (  12.65  )
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


On 5/22/26 01:15, Mark Brown wrote:
> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>> Create a new DAPM widget for "I2S formatter" and place it on the path
>> between FIFO and output DAI interface. Remove I2S output formatting code
>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
> 
> This series, it looks like this specific patch, is breaking pcm-test on
> my libretech Le Potato board, the clocking looks to be seriously messed
> up.  I'm getting:
> 
> [...]
> 
> Full log:
> 
>     https://lava.sirena.org.uk/scheduler/job/2786342#L1934
> 
> The prior patches seem to test fine, it's this one that seems to
> introduce the issue.

Thanks a lot for the heads up and please apologize for the problem.
I wasn't aware of these testing tools so I based my testing on playing 
with userspace alsa tools on the physical board that I have.

I will take a look at it ASAP and send a properly tested v2.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
