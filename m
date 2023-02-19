Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978EEC05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 23:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWrVW5N6K4xSpcQdsalduBa+MR174O6BIFcOzii86+k=; b=3x/ZAYkRrHsWv4
	iD+bVM1/NjQszcYOL55i4rLC1ZsvAKEHNucRrIfBhBZfaHPKlbMeXzq8jszlTKfCb6cPDZeKAUab4
	vN16Fbr8F1sWrbg7i0kiS0UN8j9NVRs7E5xGccwMhaeIPkatQ8APiWjkpJZn1WYh2dAtsIOOCebJ5
	sS57nJFWfg1ZmpHU5Xgjtqmo8Mt64cznTZHz6doZFzUcwW78pWigZgap3j8fKz9fWBi8oYVFJDQGf
	tzcTR6+lTi+M044rZkQtYJzbuFgHcV61dFsip5JhhqKCIrzuDpsAvtDywCrSyjB+ThuvLO0Cww+Mt
	tB4qNUI/NYjEa5Jgj8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTtT5-002X9t-C2; Sun, 19 Feb 2023 23:51:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTtSu-002X6v-Dg; Sun, 19 Feb 2023 23:51:33 +0000
Received: by mail-ed1-x52a.google.com with SMTP id i31so3714157eda.12;
        Sun, 19 Feb 2023 15:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9T+0vvMQ6CofO7MltcV+aLQpaHncpd8YadXXjDGJ0Ys=;
        b=RS0jSFVmyl8FM9upJM/LN7mJc0sXImOBQaR7lysK5rybgPsgc1Hjfl7T1hcC4Z7q68
         mY10fYNFuJMfHbWunGoSqtdxsooWqoo4MWe7wE1CQQyl6cJvElZcuY9fliiYgMpSi7jA
         W8Sja08TQOF9lfb5mBJVJi/3eAmvejP2KE6VoWQXFY/uiylgjENoJCKMWuHIGY/HcEBD
         2N7m1a6xU0K+AlbTJpkuhFXQexUYmji4WWMYQ+Og2A4cPMYYxVRBhhSTdFu40zrtj5ix
         GQdkg3dFDPhMeCOq23PfhH7kX7jORIqJkYqq0vj1dXlCJR5+KrrYJIq/0a72gfvdmbfo
         R9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9T+0vvMQ6CofO7MltcV+aLQpaHncpd8YadXXjDGJ0Ys=;
        b=Bz0xd5R6YtjfPZTM+xR1bLf1JAsiSIXyeYtKSMVlNFU6xtMcJR8rhtP6g2YK9v2GO/
         HHt1IW/EBKWfNNr1Or2z1EI/phgVHPQ/jtrvexHt21T4AnsB3uSpublPogqs0Mf8S45T
         mrjZ9BabppS8H+XZpkN/ZWsFg8CYs0jvhR7NAuUycSc4rrpTHLciqSQe2n8QUEq9oJIr
         Qb0+6xlu8hFz7NA3A6ssno3+NW7uYFYeSpNoQZRv9TAdWZ6GNnUg9RoKJ9MoMIqBroq5
         era1Ctrx9hGoNJFZ8LWL8k2RDx7T48SbQta8FnGVty+8CNfEf/NctYH03mb6Jzcm3Y8w
         ANNg==
X-Gm-Message-State: AO0yUKUhYctKVM3Suygt1zCVVrmPUJsSoRdJyFBfyrV3IJoNJzN75u5I
	NTdg87GIxKCWKNlkhtQMI8U=
X-Google-Smtp-Source: AK7set9u5efodNJWNvffh5MiNeqzWyb+JBasY+z77Grapus8VOBqIkZ5RGU51QY8IQKgyhYG2vVwGw==
X-Received: by 2002:a17:906:3683:b0:7c0:e30a:d3e5 with SMTP id a3-20020a170906368300b007c0e30ad3e5mr6657193ejc.18.1676850687619;
        Sun, 19 Feb 2023 15:51:27 -0800 (PST)
Received: from ?IPV6:2a01:c22:7bef:c400:446:9acc:56be:b07b? (dynamic-2a01-0c22-7bef-c400-0446-9acc-56be-b07b.c22.pool.telefonica.de. [2a01:c22:7bef:c400:446:9acc:56be:b07b])
        by smtp.googlemail.com with ESMTPSA id kd18-20020a17090798d200b008b2aba5fb22sm3627454ejc.206.2023.02.19.15.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 15:51:27 -0800 (PST)
Message-ID: <61ec44bf-227b-3496-4452-d0c686e8a180@gmail.com>
Date: Mon, 20 Feb 2023 00:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
 <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
 <CAFBinCAL+UdDm6P-AhEkS-M7nR=HkFJQ-nijZU8qgp7ZCJ2aww@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAFBinCAL+UdDm6P-AhEkS-M7nR=HkFJQ-nijZU8qgp7ZCJ2aww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_155132_495220_4EF331E3 
X-CRM114-Status: GOOD (  11.68  )
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

On 19.02.2023 19:26, Martin Blumenstingl wrote:
> Hi Heiner,
> 
> On Sat, Feb 18, 2023 at 9:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> +       void __iomem *base = (__force void __iomem *)rng->priv;
> I find that "(void __force __iomem *)" is the more common order in
> other drivers. Which of these is correct is something I cannot tell
> though.
> 
I just looked at this one:
#define IOMEM_ERR_PTR(err) (__force void __iomem *)ERR_PTR(err)
But right, both orders exist.

> Also I would like to hear some other opinions because to me the code
> was easier to read before.
Right, if possible I'd like to avoid it too.
However it's the prerequisite for getting rid of struct meson_rng_data.
And this simplification outweighs this small drawback IMO.

> Your way is shorter and may save a few bytes (including alignment etc.) though.
> 
> 
> Best regards,
> Martin

Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
