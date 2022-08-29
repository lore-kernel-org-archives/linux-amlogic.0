Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EB5ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLjJ9te6galWCFXH2OcEHKVAR8M8o6P5TqYxHpZ4BjY=; b=Z8GqDJYS0Vhuxb
	kR9XZgNFQPl8KiLqYmHAYP1zD+siuTmZgFB8y6hMSdUo6JpyhT8VpSmJP7gX2YCCxNHvo9ZUZDOID
	qHdoQWTY6ZzWbYUMSIQO++ilOk7U8gaGI83eyxM2YB2d7gZuswtcluMGjd0oM61EUuLNR/Sm4JK0K
	lAcWbhyXXdY7WmJTvYa1ap2uE/muKcQUB0iwyHWLaLcVMcjaNFkidcJK/ULQjD9noeZEq8hgfUFxp
	F9wXF5huPLKdgPtEOGqNy9/OFf1JBUMsPexVDGmrTM3Lc4mvzp/pacvcHhSNWfjFgQcDxJ2zgILnu
	ofnq5nuxBZBcUX4kTfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjRj-00CDyt-CB; Mon, 29 Aug 2022 18:25:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjRh-00CDx7-8l
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 18:25:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id h5so5829387ejb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cvsvecGLpxG/GkFoAYDrjsnjXLFrvVte7IVApyxgugU=;
        b=KkJWcCi9g2gEPTfqX1BUUGi+M1Gt1ohWTy7+ev0ZH6RhdD3i3wxXKeDcGZBdgM5GZ4
         N77X2RguVKHeJTX3dJO7/nfSGRLmLicKpMffYO605dArw1NxIrFkZ4n71p9QILR8BhRA
         alvtKsS7hEIWDiPJwwxmIhRhnTg4dXhl0pQQ3g6sqKqKaQop/QlQvQ8C7zZ2IHeh5P1L
         GLH9BX95sBKgqu9Q/DrAiieVQSPoW3YqV8WIR34QE9Ap9PL4mzIRnHr6GAHzfCfnlidF
         v4CJx3ZoygEW/6mospAlfcYzS4EBS/xmAQaLl+7j8q8f5Vi/MJaup5cDoQKyCkJRY4it
         wvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cvsvecGLpxG/GkFoAYDrjsnjXLFrvVte7IVApyxgugU=;
        b=K8qnQ97k2DlXxF60b/a/M3GGpyVNtmvo0vXdKI4/eRPQmz6LlsLKFlyiKpOaG6qoId
         rEfJlE2njep21svWTccPqFEsKc//ZjEaGgXfidpKOQ+CFFbCPg9PDO1n59zvowYC/vyp
         xioK+Cyeqg4O3DigwjbnTfV4YRSemi4E6yvcVSIbxdmFu6cFi6L/WO8WgY5aT3zI6psQ
         9q6WfgbBhRIRybflSfu2ACKCCucpXGY305C0Ydw3HSwIeh/VYPtEaVBLxIyMuHzwUAaI
         7dpSZYBIZIA+Vt1wbnxu2ySYG/QlUw+OWBvySKUQweMDtaB23qRveYCBoD+VQ4/WLx7j
         OfgA==
X-Gm-Message-State: ACgBeo23zxk0YBkg6v9FGhD1L0hB4hibahyIFwzXwdPemVC4Lt7H7foT
	Ftn0k5eTsxWJ3DqW7cIw8gY=
X-Google-Smtp-Source: AA6agR54ycNlmZCgd23dmjBv+SRJNmp5IlXl77W0JSmJewO9H9SFr2jD7JNH4OSlf7ukdt/gs+obGA==
X-Received: by 2002:a17:907:1c89:b0:734:d05c:582e with SMTP id nb9-20020a1709071c8900b00734d05c582emr14608455ejc.282.1661797509658;
        Mon, 29 Aug 2022 11:25:09 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd96:2400:287c:a714:9c3c:aa54? (dynamic-2a01-0c23-bd96-2400-287c-a714-9c3c-aa54.c23.pool.telefonica.de. [2a01:c23:bd96:2400:287c:a714:9c3c:aa54])
        by smtp.googlemail.com with ESMTPSA id j10-20020a17090623ea00b0073cdeedf56fsm1862652ejg.57.2022.08.29.11.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 11:25:09 -0700 (PDT)
Message-ID: <99839201-6c30-b455-2f32-ea0f992427fc@gmail.com>
Date: Mon, 29 Aug 2022 20:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@lessconfused.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>,
 Qi Duan <qi.duan@amlogic.com>
References: <20220707101423.90106-1-jbrunet@baylibre.com>
 <00f1e968-c140-29b9-dc82-a6f831171d6f@gmail.com>
 <CACdvmAiyFQTUgEzkva9j8xYJYYBRXg_sfB562f3F515AHmkUoA@mail.gmail.com>
 <5c8f4cc4-9807-cfe5-7e0a-7961aef5057f@gmail.com>
 <1jfshftliz.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL0pWFga4V1jR8B4oHjXmbBm7dU6BB8pdh0Hymd2sAiqiw@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAK4VdL0pWFga4V1jR8B4oHjXmbBm7dU6BB8pdh0Hymd2sAiqiw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_112513_359958_2F7B9571 
X-CRM114-Status: GOOD (  12.97  )
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

On 29.08.2022 12:29, Erico Nunes wrote:
> On Mon, Aug 29, 2022 at 12:02 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>>>> Jerome, can you confirm that after this commit the following is no longer needed?
>>>>> 2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")
>>
>> This never had any meaningful impact for me. I have already reverted it
>> for testing.
>>
>> I'm all for reverting it
>>
>>>>>
>>>>> Then I'd revert it, referencing the successor workaround / fix in stmmac.
> If we are considering to revert that, I would like to trigger some
> tests on my S805X CI board farm as well, to ensure it won't regress
> later. That was one of the original reasons for that patch.
> 
> Since there are some more changes referenced in this thread, can
> someone clarify what is the desired state to test? Just revert
> 2c87c6f9fbdd on top of linux-next, or also apply some other patch?

Yes, just revert 2c87c6f9fbdd on top of linux-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
