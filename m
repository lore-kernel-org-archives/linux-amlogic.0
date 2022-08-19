Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E630C28D13
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 23:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ1GxeisskQ0m4228HWRE70+Ihxn1xmLXppm0QQ1DLQ=; b=Pn6deH6zvbXcQ5
	zjj08TL4QA/r4b7cIGG0pubnn2m3+oa/0zrMv325sUWZX6ezAwFC1YruxCqRi9DawEIviOhcb7wcT
	2Uji/4iqagva3hRPF3K+XzT2ySl6szs+2cXfbUDmQJL/tEAAyq2Vg/7QEGV0lL6DZCS6WCsLxURxK
	qlEfRhg5E2yXyOMvT1Af3bFvuDdamJjBREEdxOqPjSGCtVakaV47N6ITyZHNdzAJY9sk+zeIpE2UF
	DeqQWdDtxLDls3KMSQDXCiBMtQ/ia8mADyC78Jk9pTf/HScY2ZqQKxaO3Ga8NutnJymE6QFyPS1S1
	p6aMv3kiKoEDjJDRmBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBPA-00DP0j-F1; Fri, 19 Aug 2022 23:27:56 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBP7-00DOyk-VQ; Fri, 19 Aug 2022 23:27:55 +0000
Received: by mail-vs1-xe32.google.com with SMTP id h67so4936361vsc.11;
        Fri, 19 Aug 2022 16:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=S5hEEHWwiNg2k4v549E4aszQCunYEI4sx3nLM1GzVyw=;
        b=Xo91q4wHdMEv6mkWdK1iVOirDjLT9n3Hl7r1ukV7j2UkFCo69Rc+cAHQMIr1eD12OJ
         FScZar+W3DjhY6S+6le54/2QZIsoh/afIDT24EA6uTWEczNr8RscpQWFedIKwWpqg996
         1J+uRNjyLWZLyH7ziBd3dPGeQnVjPAK7nrs6YF7pv0iK4twegX2QCKjsuRaKZUb5Iizt
         EFAU7Abe29FkXsO5iccQWa0/Yp1yl1y8xl5g6tia4xHtwIff/+MbReupf82asEusb+CF
         UQu54CzuidnIGK99Fb5PihHw8JHX24b9cSoHnjXW6rYAqHfizVxmfwXK3bXSVc4vpdGM
         nxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=S5hEEHWwiNg2k4v549E4aszQCunYEI4sx3nLM1GzVyw=;
        b=vPFbUO+bhgVPYFddDsb0f9w5s4KQtQRoW2McSaUXWEa4PJit7MbZ0qhv1mqOM+pqYc
         bzAWfQZfTuavnNx5NWkLRD+eB0vpKhX9x4PHQX7IiVhvU7kAP7hKhnLNm7u/KDILkr2n
         KiZefcWu24RGmf+/tpEW/QIiU3CUzyX36FW6QvUwZImHmpZD119V+0OUye+1az2L59J2
         ZepgOYOu1A7J7ys6Oh1yjLQqZH+Lm3/3rCVaVEbw6HnxYZYkdqG8sclgfNjLAL2EdcC0
         bS3LP3JQPecVfUNmI/Tfz+WE6F/oF/+RfpN6I4/CjzItoiL93+I40+9xi6OabwVbzGPw
         HxiA==
X-Gm-Message-State: ACgBeo0HjqLWkcoNzDAywZ9o8OYgShJfY/j9n5Zpsua7ni01JzUkprVJ
	IYeICxMlCIQ6GizXjc7cIaqgoauPV2eVNlRb9Qg=
X-Google-Smtp-Source: AA6agR4aZOaEro5daSKUdeT2RJVo7AImgpeqXvvIo0V84bpkcQrdEfkHLqcHycEYpUgzgMskEPDS+gA/3V8uYDpz4MQ=
X-Received: by 2002:a67:e050:0:b0:390:3963:eb5b with SMTP id
 n16-20020a67e050000000b003903963eb5bmr1017980vsl.7.1660951671566; Fri, 19 Aug
 2022 16:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660934107.git.mazziesaccount@gmail.com>
In-Reply-To: <cover.1660934107.git.mazziesaccount@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Aug 2022 02:27:14 +0300
Message-ID: <CAHp75VfZ+aoo9btTk+8kmOak4PN0Pc7L7RBQMv2SNC2agMbpsg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Use devm helpers for regulator get and enable
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Corbet <corbet@lwn.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, Peter Rosin <peda@axentia.se>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Alexandru Ardelean <aardelean@deviqon.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Alexandru Lazar <alazar@startmail.com>, Miaoqian Lin <linmq006@gmail.com>, 
	Xiang wangx <wangxiang@cdjrlc.com>, Linux Documentation List <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-iio <linux-iio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_162754_066458_79A9B49B 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, Aug 19, 2022 at 10:20 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> Use devm helpers for regulator get and enable
>
> NOTE: The series depends on commit
> ee94aff2628b ("Devm helpers for regulator get and enable")
> which currently sits in Mark's regulator/for-next
>
> A few* drivers seem to pattern demonstrated by pseudocode:
>
> - devm_regulator_get()
> - regulator_enable()
> - devm_add_action_or_reset(regulator_disable())
>
> devm helpers for this pattern were added to remove bunch of code from

remove a bunch

> drivers. Typically following:
>
> - replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
>   devm_add_action_or_reset()) with just one
>   (devm_regulator_get_enable[_optional]()).
> - drop disable callback.
>
> I believe this simplifies things by removing some dublicated code.

duplicated

> This series reowrks a few drivers. There is still plenty of fish in the

reworks

> sea for people who like to improve the code (or count the beans ;]).
>
> Finally - most of the converted drivers have not been tested (other than
> compile-tested) due to lack of HW. All reviews and testing is _highly_
> appreciated (as always!).

...

>   docs: devres: regulator: Add new get_enable functions to devres.rst
>   clk: cdce925: simplify using devm_regulator_get_enable()
>   gpu: drm: simplify drivers using devm_regulator_*get_enable*()
>   hwmon: lm90: simplify using devm_regulator_get_enable()
>   hwmon: adm1177: simplify using devm_regulator_get_enable()

hwmon uses a different pattern for the Subject line.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
