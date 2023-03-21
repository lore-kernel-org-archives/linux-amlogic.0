Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80703C74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGT7coS1JRN574Qcx5pNXOPN4nD02r08O7XeqvxxXbo=; b=2pQj1vqhLjD9oP
	JOcVb8EqwSxfd0AWCMy9GEdA3akNb9j9iFcb1kejNzcD8rucwRpqEp9NC41M6swiCCrB3Z4BlIUNe
	A3bVOEpHHLixj8c4f7AATxnFaALh0hKRKINyAKOozkv9zfJ6cv4Cjx3lx3laSnyE3d9hJrAwNQxfm
	4UywD+VicBBWylpRwu3aEASsAswIYHoyh7siesPCrRyJ0M/0CKdNWZaZ8gL1qbVM7eaOb50x7JH/q
	ji8jRoqKuR1hQ7Vn9PLDqCMQMrnZgmNGVEzIDEWXSRCf2JVsU0mE6fqttx5ezEs/TU1/EtYE+tlAN
	dnG3/65MF4mFpvY/wv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecYj-00Ce9L-29;
	Tue, 21 Mar 2023 14:01:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pecYf-00Ce7a-3D
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 14:01:52 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b20so27134159edd.1
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679407304;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=j26tJt6NnNAzyGu4WLnvCWTv3oW1M1SUyeftfDPTWn0=;
        b=AbSVI+I4DHx9JetIGlhjpnoJxZA1uEiOjSQ7e9QiUFYmPRnCkKFhggCMOaaKHpEg1e
         B5ivMtyPoPROhkWW8phhjDBBgw6i7oN1Lsd/t77dtgkjgLE7CcKNls0mmbd535YlMap6
         LOAhwYzaO0eM7oYDuVPvHuCEFOqb8FTMrUUc1SiXDRyVWzz7lX88ex5GqEFv+tXMYgqQ
         m7rC87SBxuN9OK9EE9+m7MQVXqrrwIP1I+ausKlEj5vSKmvAZWcidxD1kdFwtKDz0xXH
         QOr5lId57Rnb34NZPWyAk08L0eRdLZTwZYpUzFeNHsgY+juw5IJxFTeui5dtHWbhfdwE
         INYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679407304;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j26tJt6NnNAzyGu4WLnvCWTv3oW1M1SUyeftfDPTWn0=;
        b=Wrk02eMwq50+WRgg9sj4Wmj7ANj8hY8f3b8ZgWOLiBuF0ODcr5tB4v2enwg2kvn1cH
         VVLLs5PwioHT9pSvo62JHBxqPT7gcjGoN4wi8BV5tBb9G3maA3H5dDyXRMTpQUTe993L
         zXDLPGdJhaakRoIh1eb8TQ0MegZLVeYHniezsR2nSXN5xj39pMakB1DXd93QqlIfuLUM
         RSIjq8GICLcaTShopLfcNMSRUXxfa+WFI/LwbCmuXtzSbgEf2kbh5EMj9cY7ma4lLZC9
         fyMYCanwxeS/Qj267TJmOHZJO6JrX3Kv2JJq1cmB6acdU9kho99TCjFlJuZra24b+FxW
         vGOw==
X-Gm-Message-State: AO0yUKUQcY/ed5iAPuhAhXKp6m8wZi17X4HTqwrNUnfmwpxszVN96gaW
	/n6Ebnm4hNwFNnclpPCOQt4MsQ==
X-Google-Smtp-Source: AK7set8ucDLG9fAEqf9uy4PxfqGzqLuGzyH3LRu5tCGF8OOY6SlApdT9f6NHyGcmg6+WtRQjZlRzag==
X-Received: by 2002:a05:6402:b35:b0:4fa:ee01:a0cb with SMTP id bo21-20020a0564020b3500b004faee01a0cbmr3386046edb.32.1679407304662;
        Tue, 21 Mar 2023 07:01:44 -0700 (PDT)
Received: from localhost ([2a04:cec0:11b9:8a49:3d4e:8d15:74df:30e7])
        by smtp.gmail.com with ESMTPSA id z23-20020a50cd17000000b004bd1fe2cc02sm6412163edi.16.2023.03.21.07.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:01:44 -0700 (PDT)
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
 <1jh6ue74x9.fsf@starbuckisacylon.baylibre.com>
 <ce0bd9a5-e44d-b30b-3434-9d5fd36e251a@free.fr>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-wireless@vger.kernel.org,
 MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel
 <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman
 <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Pieter-Paul
 Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov
 <alep@cypress.com>, Joseph chuang <jiac@cypress.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@gmail.com>, Angus Ainslie <angus@akkea.ca>, Heiner
 Kallweit <hkallweit1@gmail.com>, Pierre-Hugues Husson <phh@phh.me>
Subject: Re: Performance lower than expected with BCM4359/9 on S905X2
Date: Tue, 21 Mar 2023 14:54:39 +0100
In-reply-to: <ce0bd9a5-e44d-b30b-3434-9d5fd36e251a@free.fr>
Message-ID: <1jcz526w53.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_070150_232919_2F4EB462 
X-CRM114-Status: UNSURE (   8.42  )
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


>
> I was not asking anyone to reproduce my exact setup.
>
> I find it confusing that some assume there is something different
> about the board I'm using. The more likely hypothesis is that all
> S905X2 boards have the same behavior.

High-speed MMC modes are usually defined/limited per boards.
Check the different  DTs in arch/arm64/boot/dts/amlogic, you'll see
that not all have the same configs.

Yes the S905X2 has the bounce buffer work-around which plays a role on
the overall performance. MMC high-speed modes is critical just has well.

The Amlogic 4.9 downstream does all kinds of fancy (and unsafe) things
to enable higher modes.

So there is no assumption here, merely a tentative to get a clearer
picture.

>
> Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
